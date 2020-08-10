package com.example.demo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Repository.BookinMasterRepo;
import com.example.demo.Repository.CategoryMasterRepo;
import com.example.demo.Repository.ConfirmationTokenRepository;
import com.example.demo.Repository.MaxSerailNumberRepo;
import com.example.demo.Repository.PackageMasterRepo;
import com.example.demo.Repository.PaymentDetailsRepo;
import com.example.demo.Repository.TestDetailsRepo;
import com.example.demo.Repository.TestMasterRepo;
import com.example.demo.Repository.UserRepository;
import com.example.demo.model.BookingMaster;
import com.example.demo.model.CategoryMaster;
import com.example.demo.model.ConfirmationToken;
import com.example.demo.model.LabelValueDTO;
import com.example.demo.model.MaxSerailNumber;
import com.example.demo.model.PackagesMasters;
import com.example.demo.model.PaymentDetails;
import com.example.demo.model.PaytmDetails;
import com.example.demo.model.TestDetails;
import com.example.demo.model.TestMaster;
import com.example.demo.model.User;
import com.example.demo.service.EmailSenderService;
import com.example.demo.service.PdfGenerateService;
import com.example.demo.service.SecurityService;
import com.example.demo.service.UserService;
import com.example.demo.validator.UserValidator;
import com.paytm.pg.merchant.CheckSumServiceHelper;

@Controller
public class FormController {

	@Autowired
	TestMasterRepo trepo;
	@Autowired
	PackageMasterRepo prepo;
	@Autowired
	BookinMasterRepo brepo;
	@Autowired
	TestDetailsRepo tdrepo;
	@Autowired
	UserRepository userRepo;
	@Autowired
	PaymentDetailsRepo pmRepo;
	@Autowired
	CategoryMasterRepo catRepo;

	@Autowired
	MaxSerailNumberRepo mnrepo;
	
	@Autowired
	PdfGenerateService pdfservice;
	@Autowired
	private ServletContext context;

	@GetMapping("/")
	public ModelAndView viewHomePage() {

		ModelAndView mv = new ModelAndView("index");
		Pageable pageable = (Pageable) PageRequest.of(0, 4);
		Page<TestMaster> page = trepo.findAll(pageable);
		List<TestMaster> test = page.getContent();
		mv.addObject("testList", test);

		// package list
		Page<PackagesMasters> packpage = prepo.findAll(pageable);
		List<PackagesMasters> packages=packpage.getContent();
		mv.addObject("packageList", packages);
		
		//Category list
		Iterable<CategoryMaster> category=catRepo.findAll();
		mv.addObject("categoryList", category);	
		System.out.println("=="+test);
		
		List<String> categoryName=catRepo.findDistinctName();
		for (int i = 0; i < categoryName.size(); i++) {
			Page<TestMaster> pagebyCatName = trepo.findByCategoryName(pageable,categoryName.get(i));
			List<TestMaster> testListByCategory = pagebyCatName.getContent();
			mv.addObject(categoryName.get(i),categoryName.get(i));
			mv.addObject(categoryName.get(i)+"List", testListByCategory);
			System.out.println(categoryName.get(i)+"List  == ");
		}
		return mv;

	}

	@GetMapping("/home")
	public ModelAndView HomePage() {

		ModelAndView mv = new ModelAndView("index");
		Pageable pageable = (Pageable) PageRequest.of(0, 4);
		Page<TestMaster> page = trepo.findAll(pageable);
		List<TestMaster> test = page.getContent();
		mv.addObject("testList", test);

		// package list
		Page<PackagesMasters> packpage = prepo.findAll(pageable);
		List<PackagesMasters> packages=packpage.getContent();
		mv.addObject("packageList", packages);
		
		List<String> categoryName=catRepo.findDistinctName();
		for (int i = 0; i < categoryName.size(); i++) {
			Page<TestMaster> pagebyCatName = trepo.findByCategoryName(pageable,categoryName.get(i));
			List<TestMaster> testListByCategory = pagebyCatName.getContent();
			mv.addObject(categoryName.get(i),categoryName.get(i));
			mv.addObject(categoryName.get(i)+"List", testListByCategory);
			System.out.println(categoryName.get(i)+"List  == ");
		}
		return mv;

	}
	@GetMapping("/testWithDiscount/{pagenumber}/{discount}")
	public ModelAndView testWithDiscount(@PathVariable("pagenumber") int pagenumber,@PathVariable("discount") float discount) {
		return discTestsByPgaes(1,discount);

	}
	
	public ModelAndView discTestsByPgaes( int pagenumber,float discount)
	{
		ModelAndView mv = new ModelAndView("allTestWithDiscount");

		try {
			// all tests
			Pageable pageable = (Pageable) PageRequest.of(pagenumber - 1, 12);
			Page<TestMaster> page = trepo.findByDiscount(pageable,discount);
			long totalTest = page.getTotalElements();
			int p = page.getTotalPages();
			List<TestMaster> test = page.getContent();
			// System.out.println("Test object all test==" + test);
			List totalpages=new ArrayList();
			for(int i=1;i<=p;i++)
			{
				totalpages.add(i);
			}
			mv.addObject("currentpage", pagenumber);
			mv.addObject("lastpage", p);
			mv.addObject("totalTest", totalTest);
			mv.addObject("totalpages", totalpages);
			mv.addObject("alltestList", test);
			mv.addObject("discount",discount);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mv;
	}
	@RequestMapping("/allTest")
	public ModelAndView allTest() {
		return listTestsByPgaes(1);

	}
	
	@GetMapping("/pages/{pagenumber}")
	public ModelAndView listTestsByPgaes(@PathVariable("pagenumber") int pagenumber)
	{
		ModelAndView mv = new ModelAndView("allTest");

		try {
			// all tests
			Pageable pageable = (Pageable) PageRequest.of(pagenumber - 1, 12);
			Page<TestMaster> page = trepo.findAll(pageable);
			long totalTest = page.getTotalElements();
			int p = page.getTotalPages();
			List<TestMaster> test = page.getContent();
			// System.out.println("Test object all test==" + test);
			List totalpages=new ArrayList();
			for(int i=1;i<=p;i++)
			{
				totalpages.add(i);
			}
			mv.addObject("currentpage", pagenumber);
			mv.addObject("lastpage", p);
			mv.addObject("totalTest", totalTest);
			mv.addObject("totalpages", totalpages);
			mv.addObject("alltestList", test);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mv;
	}
	@RequestMapping("/allTestbyCategory/{category}/{pagenumber}")
	public ModelAndView allTestbyCategory(@PathVariable("category") String category,@PathVariable("pagenumber") int pagenumber) {
		return categoryTestsByPgaes(category,1);

	}
	@GetMapping("/pages/{category}/{pagenumber}")
	public ModelAndView categoryTestsByPgaes(@PathVariable("category") String category,@PathVariable("pagenumber") int pagenumber)
	{
		ModelAndView mv = new ModelAndView("allTestByCategory");

		try {
			// all tests
			Pageable pageable = (Pageable) PageRequest.of(pagenumber - 1, 12);
			Page<TestMaster> page = trepo.findByCategoryName(pageable,category);
			long totalTest = page.getTotalElements();
			int p = page.getTotalPages();
			List<TestMaster> test = page.getContent();
			// System.out.println("Test object all test==" + test);
			List totalpages=new ArrayList();
			for(int i=1;i<=p;i++)
			{
				totalpages.add(i);
			}
			mv.addObject("currentpage", pagenumber);
			mv.addObject("lastpage", p);
			mv.addObject("totalTest", totalTest);
			mv.addObject("totalpages", totalpages);
			mv.addObject("alltestList", test);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mv;
	}
	@RequestMapping("/allPackages")
	public ModelAndView allPackages() {
		return listPackageByPgaes(1);

	}
	@GetMapping("/packagepages/{pagenumber}")
	public ModelAndView listPackageByPgaes(@PathVariable("pagenumber") int pagenumber)
	{
		ModelAndView mv = new ModelAndView("allPackages");

		try {
			// all tests
			Pageable pageable = (Pageable) PageRequest.of(pagenumber - 1, 12);
			Page<PackagesMasters> page = prepo.findAll(pageable);
			long totalTest = page.getTotalElements();
			int p = page.getTotalPages();
			List<PackagesMasters> packages = page.getContent();
			// System.out.println("Test object all test==" + test);
			List totalpages=new ArrayList();
			for(int i=1;i<=p;i++)
			{
				totalpages.add(i);
			}
			mv.addObject("currentpage", pagenumber);
			mv.addObject("lastpage", p);
			mv.addObject("totalTest", totalTest);
			mv.addObject("totalpages", totalpages);
			mv.addObject("allpackagesList", packages);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mv;
	}
	@RequestMapping("/testMaster")
	public ModelAndView testForm() {
		ModelAndView mv = new ModelAndView("TestMaster");
		System.out.println("TestMaster Form");
		return mv;
	}
	@RequestMapping("/categoryMaster")
	public ModelAndView categoryForm() {
		ModelAndView mv = new ModelAndView("categoryMaster");
		System.out.println("categoryMaster Form");
		return mv;
	}
	@RequestMapping("/testInfo")
	public ModelAndView testInfo(HttpServletRequest req) {
		System.out.println("testInfo Form");
		ModelAndView mv = new ModelAndView("testInfo");
		try {
			String testname = req.getParameter("category");
			System.out.println("testInfo Form testname=" + testname);
			// test list
			Pageable pageable = (Pageable) PageRequest.of(0, 8);
			Page<TestMaster> page = trepo.findAll(pageable);
			List<TestMaster> test = page.getContent();
			mv.addObject("testList", test);
			// single test info
			TestMaster testd = trepo.findByTestname(testname);
			System.out.println("testname=" + testd.getTestname());
			mv.addObject("testinfoDetails", testd);
		} catch (Exception e) {
			e.printStackTrace();

		}

		return mv;
	}

	@RequestMapping("/quickViewT")
	public ModelAndView quickViewT(HttpServletRequest req) {
		System.out.println("testInfo Form");
		String testname = req.getParameter("testname");
		System.out.println("testInfo Form===" + testname);
		ModelAndView mv = new ModelAndView("testInfo");
		try {
			
			Pageable pageable = (Pageable) PageRequest.of(0, 8);
			Page<TestMaster> page = trepo.findAll(pageable);
			List<TestMaster> test = page.getContent();
			mv.addObject("testList", test);

			// single test info
			TestMaster testd = trepo.findByTestname(testname);
			System.out.println("testname=" + testd.getTestname());
			mv.addObject("testinfoDetails", testd);
		} catch (Exception e) {
			e.printStackTrace();

		}

		return mv;
	}

	@RequestMapping("/quickViewP")
	public ModelAndView quickViewP(HttpServletRequest req) {
		String packagename = req.getParameter("packagename");
		ModelAndView mv = new ModelAndView("packageInfo");
		System.out.println("packageInfo Form="+packagename);
		// test list
		Pageable pageable = (Pageable) PageRequest.of(0, 8);
		Page<TestMaster> page = trepo.findAll(pageable);
		List<TestMaster> test = page.getContent();
		mv.addObject("testList", test);

		// package list
		Page<PackagesMasters> packpage = prepo.findAll(pageable);
		List<PackagesMasters> packages=packpage.getContent();
		
		mv.addObject("packageList", packages);

		// single package
		PackagesMasters packaged = prepo.findByPackagename(packagename);
		System.out.println("packagename=" + packaged.getPackagename());
		System.out.println("packagename=" + packaged.getAltpname());

		mv.addObject("packageinfoDetails", packaged);
		return mv;
	}

	@RequestMapping("/checkout")
	public String checkoutForm() {

		String username = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
			System.out.println("checkout Form  =  " + username);
			return "checkout";
		} else {
			username = principal.toString();
			System.out.println("checkout Form" + username);
			return "redirect:/registration";
		}

	}

	@RequestMapping("/addTest")
	public ModelAndView addTest(TestMaster testmaster) {
		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}
		System.out.println("Insertion of TestMaster Form");
		ModelAndView mv = new ModelAndView("TestMaster");
		try {
			MaxSerailNumber mnum = mnrepo.findByType("TEST");
			int num = mnum.getMaxnum();
			int id = mnum.getId();
			String testcode = "TST";
			testcode += "" + num;
			num = num + 1;
			mnum.setMaxnum(num);
			mnum.setType("TEST");
			mnrepo.save(mnum);
			testmaster.setTestcode(testcode);
			testmaster.setLastmodby(lastmodby);

			// current timstamp
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(dtf.format(now));
			testmaster.setLastmoddate(dtf.format(now));

			System.out.println("category Form==" + testmaster.getTestname());
			trepo.save(testmaster);
			mv.addObject("sucessmsg", "Test Added Successfully...!");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errormsg", "Something went Wrong, Please try again..!");
			return mv;

		}
	}
	@RequestMapping("/addCategory")
	public ModelAndView addCategory(CategoryMaster categorymaster) {
		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}
		System.out.println("Insertion of CategoryMaster Form");
		ModelAndView mv = new ModelAndView("categoryMaster");
		try {
			MaxSerailNumber mnum = mnrepo.findByType("CATEGORY");
			int num = mnum.getMaxnum();
			int id = mnum.getId();
			String categorycode = "CTGY";
			categorycode += "" + num;
			num = num + 1;
			mnum.setMaxnum(num);
			mnum.setType("CATEGORY");
			mnrepo.save(mnum);
			categorymaster.setCategorycode(categorycode);
			categorymaster.setLastmodby(lastmodby);

			// current timstamp
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(dtf.format(now));
			categorymaster.setLastmoddate(dtf.format(now));

			System.out.println("category Form==" + categorymaster.getCategoryname());
			catRepo.save(categorymaster);
			mv.addObject("sucessmsg", "Category Added Successfully...!");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errormsg", "Something went Wrong, Please try again..!");
			return mv;

		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/confirmbooking")
	public ModelAndView confirmBooking(BookingMaster bookingmaster, HttpServletRequest req,HttpServletResponse resp) {
		String list = req.getParameter("clist");
		System.out.println("Insertion of TestMaster Form" + list);

		String lastmodby = "";
		String usercode = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}
		User userdetails = userRepo.findByUsername(lastmodby);
		try {
			// booking no logic
			MaxSerailNumber mnum = mnrepo.findByType("BOOKING");
			int num = mnum.getMaxnum();
			int id = mnum.getId();
			String bookingno = "BKN";
			bookingno += "" + num;
			num = num + 1;
			mnum.setMaxnum(num);
			mnum.setType("BOOKING");
			mnrepo.save(mnum);
			bookingmaster.setBookingno(bookingno);
			bookingmaster.setPaymentstatus("PENDING");
			bookingmaster.setSamplecollected("NOT YET");
			bookingmaster.setReportdelivered("NOT YET");
			bookingmaster.setType("NEW");
			// current timstamp
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(dtf.format(now));
			bookingmaster.setBookedat(dtf.format(now));

			bookingmaster.setBookedby(lastmodby);

			System.out.println("category Form==" + bookingmaster.getFname());

			// one to many mapping & saving data
			Double totalamount = 0.0;
			Double price = 0.0;
			String testname = "";
			Set<TestDetails> tdet = new HashSet<>();
			StringTokenizer st1 = new StringTokenizer(list, "*");
			while (st1.hasMoreTokens()) {
				testname = st1.nextToken();
				price = Double.parseDouble(st1.nextToken());
				totalamount += price;
				tdet.add(new TestDetails(bookingno, testname, price, lastmodby, dtf.format(now), bookingmaster));

				System.out.println("Test name " + testname + ", Total =" + price);
			}
			bookingmaster.setTotalamount(totalamount);
			bookingmaster.setTestdetails(tdet);
			brepo.save(bookingmaster);
			
			boolean isfile=pdfservice.createInvoice(bookingmaster,tdet,context,req,resp);
			
			String msgBody = "Hi Customer,"
					+ "\n\nWe are pleased to inform that your booking request received and confirmed."
					+ "\n Your booking no is " + bookingmaster.getBookingno()
					+ "\n\n\n For Sample collection our executive will contact you."
					+ "\n\n\n Thank You..! Have great day..!";
			sendEmail(lastmodby, "Booking Confirmation..!", msgBody);
			if (bookingmaster.getPaytype().equals("Pay Now")) {
				System.out.println("Pay Now");
				ModelAndView mv = new ModelAndView("payment");
				mv.addObject("bookingno", bookingmaster.getBookingno());
				mv.addObject("custid", userdetails.getUsercode());
				mv.addObject("totalamount", bookingmaster.getTotalamount());
				mv.addObject("paymode", bookingmaster.getPaytype());
				mv.addObject("status", "Confirmed");
				mv.addObject("sucessmsg", "Proceed with payment...!");
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("confirmationPage");
				mv.addObject("bookingno", bookingmaster.getBookingno());
				mv.addObject("custid", userdetails.getUsercode());
				mv.addObject("totalamount", bookingmaster.getTotalamount());
				mv.addObject("paymode", bookingmaster.getPaytype());
				mv.addObject("status", "Confirmed");
				mv.addObject("sucessmsg", "Your booking confirmed successfully..");
				return mv;

			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mv = new ModelAndView("checkout");
			mv.addObject("errormsg", "Something went Wrong, Please try again..!");
			return mv;

		}
	}
	@GetMapping("/downloadInvoice/{bookingno}")
	public void createPdf(@PathVariable String bookingno,HttpServletResponse resp,HttpServletRequest req) throws FileNotFoundException
	{
		BookingMaster bookingMaster=brepo.findByBookingno(bookingno);
		Set<TestDetails> tdet=bookingMaster.getTestdetails();
		String filename="Invoice_"+bookingno+".pdf";
		boolean isfile=pdfservice.createInvoice(bookingMaster,tdet,context,req,resp);
		if(isfile)
		{
			String fullPath=req.getServletContext().getRealPath("/resources/"+filename);
			
			downloadInvoice(fullPath,resp,filename);
		}
	
	}
	public void downloadInvoice(String fullPath,HttpServletResponse resp,String filname) throws FileNotFoundException
	{
		System.out.println(fullPath+"   download  "+filname);
		File file=new File(fullPath);
		final int Buffer_size=4096;
		if(file.exists())
		{
			try {
			
			FileInputStream fileInputStream=new FileInputStream(file); 
			String mimeType=context.getMimeType(fullPath);
			resp.setContentType(mimeType);
			resp.setHeader("content-disposition", "attachment; filename"+filname);
			OutputStream outputStream=resp.getOutputStream();
			byte[] buffer=new byte[Buffer_size];
			int byteRead=-1;
			while((byteRead=fileInputStream.read(buffer))!=-1)
			{
				outputStream.write(buffer,0,byteRead);
			}
			fileInputStream.close();
			outputStream.close();
			file.delete();
			}
			catch(Exception e)
			{
			e.printStackTrace();	
			}
		}
	}
	@RequestMapping("/gotocart")
	public ModelAndView gotocart() {
		System.out.println("checkout Form");
		ModelAndView mv = new ModelAndView("checkout");
		return mv;
	}

	@RequestMapping("/packageMaster")
	public ModelAndView packageForm() {
		System.out.println("PackageMaster Form");
		ModelAndView mv = new ModelAndView("PackageMaster");
		mv.addObject("packageForm", new PackagesMasters());
		return mv;
	}

	@RequestMapping("/addPackage")
	public ModelAndView addTest(@ModelAttribute("packageForm") PackagesMasters packagemaster,
			BindingResult bindingResult) {

		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}
		ModelAndView mv = new ModelAndView("PackageMaster");
		if (bindingResult.hasErrors()) {
			return mv;
		}
		try {
			// package id logic
			MaxSerailNumber mnum = mnrepo.findByType("PACKAGE");
			int num = mnum.getMaxnum();
			int id = mnum.getId();
			String packagecode = "PKG";
			packagecode += "" + num;
			num = num + 1;
			mnum.setMaxnum(num);
			mnum.setType("PACKAGE");
			mnrepo.save(mnum);
			packagemaster.setPackagecode(packagecode);
			packagemaster.setLastmodby(lastmodby);

			// current timstamp
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(dtf.format(now));
			packagemaster.setLastmoddate(dtf.format(now));

			System.out.println("category Form==" + packagemaster.getPackagename());
			prepo.save(packagemaster);
			mv.addObject("sucessmsg", "Package Added Successfully...!");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errormsg", "Something went Wrong, Please try again..!");
			return mv;

		}
	}

	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@RequestMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		MaxSerailNumber mnum = mnrepo.findByType("USER");
		int num = mnum.getMaxnum();
		String usercode = "USR";
		usercode += "" + num;
		num = num + 1;
		mnum.setMaxnum(num);
		mnrepo.save(mnum);
		userForm.setUsercode(usercode);
		userForm.setLastmodby(userForm.getUsername());
		userForm.setEmail(userForm.getUsername());
		userForm.setLoginstatus("NOTYETLOGGEDIN");
		userForm.setPhonenumber("+91 "+userForm.getPhonenumber());
		userForm.setActive(true);

		// current timstamp
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now));
		userForm.setLastmodat(dtf.format(now));
		userService.save(userForm);

		securityService.autoLogin(userForm.getUsername(), userForm.getConfirmpassword());
		String msgBody = "Hi Customer," + "\n\nWe are pleased to inform that your your registered successfully.."
				+ "\n\n\n Thank You..! Have great day..!";
		sendEmail(userForm.getUsername(), "User Registration Confirmation..!", msgBody);

		return "redirect:/";
	}

	@RequestMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username or password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "loginE";
	}

	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public ModelAndView displayResetPassword(ModelAndView modelAndView, User user) {
		modelAndView.addObject("user", user);
		modelAndView.setViewName("forgetPassword");
		return modelAndView;
	}

	@Autowired
	ConfirmationTokenRepository confirmationTokenRepository;
	@Autowired
	EmailSenderService emailSenderService;

	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public ModelAndView forgotUserPassword(ModelAndView modelAndView, User user, HttpServletRequest req) {
		String email = req.getParameter("emailid");
		User existingUser = userRepo.findByEmail(email);
		if (existingUser != null) {
			// Create token
			ConfirmationToken confirmationToken = new ConfirmationToken(existingUser);

			// Save it
			confirmationTokenRepository.save(confirmationToken);

			// Create the email
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setTo(existingUser.getEmail());
			mailMessage.setSubject("Complete Password Reset!");
			mailMessage.setFrom(email);
			mailMessage.setText("To complete the password reset process, please click here: "
					+ "http://localhost:8080/confirm-reset?token=" + confirmationToken.getConfirmationToken());

			// Send the email
			emailSenderService.sendEmail(mailMessage);

			modelAndView.addObject("message",
					"Request to reset password received. Check your inbox for the reset link.");
			modelAndView.setViewName("successForgotPassword");

		} else {
			modelAndView.addObject("error", "This email address does not exist!");
			modelAndView.setViewName("forgetPassword");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/confirm-reset", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView validateResetToken(ModelAndView modelAndView, @RequestParam("token") String confirmationToken) {
		ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);

		if (token != null) {
			User user = userRepo.findByEmail(token.getUser().getEmail());
			userRepo.save(user);
			modelAndView.addObject("user", user);
			modelAndView.addObject("emailId", user.getEmail());
			modelAndView.setViewName("resetPassword");
		} else {
			modelAndView.addObject("message", "The link is invalid or broken!");
			modelAndView.setViewName("forgetPassowrd");
		}
		return modelAndView;
	}

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// Endpoint to update a user's password
	@RequestMapping(value = "/reset-password", method = RequestMethod.POST)
	public ModelAndView resetUserPassword(ModelAndView modelAndView, User user) {
		if (user.getEmail() != null) {
			// Use email to find user
			User tokenUser = userRepo.findByEmail(user.getEmail());
			tokenUser.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			userRepo.save(tokenUser);
			modelAndView.addObject("message",
					"Password successfully reset. You can now log in with the new credentials.");
			modelAndView.setViewName("successResetPassword");
		} else {
			modelAndView.addObject("error", "The link is invalid or broken!");
			modelAndView.setViewName("forgetPassowrd");
		}
		return modelAndView;
	}

	@GetMapping("/loginForm")
	public String welcome(Model model) {
		System.out.println("welcome");
		return "loginE";
	}

	@Autowired
	private PaytmDetails paytmDetails;
	@Autowired
	private Environment env;

	@RequestMapping("/pgredirect")
	public ModelAndView getRedirect(@RequestParam(name = "CUST_ID") String customerId,
			@RequestParam(name = "TXN_AMOUNT") String transactionAmount,
			@RequestParam(name = "ORDER_ID") String orderId) throws Exception {

		ModelAndView modelAndView = new ModelAndView("redirect:" + paytmDetails.getPaytmUrl());
		TreeMap<String, String> parameters = new TreeMap<>();
		paytmDetails.getDetails().forEach((k, v) -> parameters.put(k, v));
		parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
		// parameters.put("EMAIL", env.getProperty("paytm.email"));
		parameters.put("ORDER_ID", orderId);
		parameters.put("TXN_AMOUNT", transactionAmount);
		parameters.put("CUST_ID", customerId);
		String checkSum = getCheckSum(parameters);
		parameters.put("CHECKSUMHASH", checkSum);
		modelAndView.addAllObjects(parameters);
		return modelAndView;
	}

	@PostMapping(value = "/pgresponse")
	public ModelAndView getResponseRedirect(HttpServletRequest request, BookingMaster bookingmaster,
			PaymentDetails payDetails) {

		Map<String, String[]> mapData = request.getParameterMap();
		TreeMap<String, String> parameters = new TreeMap<String, String>();
		mapData.forEach((key, val) -> parameters.put(key, val[0]));
		String paytmChecksum = "";
		if (mapData.containsKey("CHECKSUMHASH")) {
			paytmChecksum = mapData.get("CHECKSUMHASH")[0];
		}
		String result;
		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}
		boolean isValideChecksum = false;
		System.out.println("RESULT : " + parameters.toString());
		try {
			isValideChecksum = validateCheckSum(parameters, paytmChecksum);
			if (isValideChecksum && parameters.containsKey("RESPCODE")) {
				if (parameters.get("RESPCODE").equals("01")) {
					bookingmaster = brepo.findByBookingno(parameters.get("ORDERID"));
					bookingmaster.setPaymentstatus("PAID");
					brepo.save(bookingmaster);

					payDetails.setBANKNAME(parameters.get("BANKNAME"));
					payDetails.setBANKTXNID(parameters.get("BANKTXNID"));
					payDetails.setCURRENCY(parameters.get("CURRENCY"));
					payDetails.setGATEWAYNAME(parameters.get("GATEWAYNAME"));
					payDetails.setMID(parameters.get("MID"));
					payDetails.setORDERID(parameters.get("ORDERID"));
					payDetails.setPAYMENTMODE(parameters.get("PAYMENTMODE"));
					payDetails.setRESPCODE(parameters.get("RESPCODE"));
					payDetails.setRESPMSG(parameters.get("RESPMSG"));
					payDetails.setSTATUS(parameters.get("STATUS"));
					payDetails.setTXNAMOUNT(parameters.get("TXNAMOUNT"));
					payDetails.setTXNDATE(parameters.get("TXNDATE"));
					payDetails.setTXNID(parameters.get("TXNID"));
					payDetails.setLastmodby(lastmodby);

					pmRepo.save(payDetails);

					result = "Payment Successful";
				} else {
					result = "Payment Failed";
				}
			} else {
				result = "Checksum mismatched";
			}
		} catch (Exception e) {
			result = e.toString();
		}

		String msgBody = "Hi Customer,"
				+ "\n\nWe are pleased to inform that your payment received and successfullly processed."
				+ "\n Transaction id is " + parameters.get("TXNID") + " for booking no  " + bookingmaster.getBookingno()
				+ "\n\n\n For Sample collection our executive will contact you."
				+ "\n\n\n Thank You..! Have great day..!";
		sendEmail(lastmodby, "Booking Confirmation..!", msgBody);

		System.out.println("result  " + result);
		ModelAndView mv = new ModelAndView("paymentConfirmPage");
		mv.addObject("result", result);
		parameters.remove("CHECKSUMHASH");

		mv.addObject("ORDERID", parameters.get("ORDERID"));
		mv.addObject("TXNID", parameters.get("TXNID"));
		mv.addObject("TXNAMOUNT", parameters.get("TXNAMOUNT"));

		mv.addObject("sucessmsg", "Your booking confirmed successfully..");
		return mv;
	}

	private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
		return CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(paytmDetails.getMerchantKey(),
				parameters, paytmChecksum);
	}

	private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
		return CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(paytmDetails.getMerchantKey(),
				parameters);
	}

	@RequestMapping(value = "/orderHistory")
	public ModelAndView orderHistory() {
		ModelAndView mv = new ModelAndView("orderHistory");
		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}

		List<BookingMaster> bookingmaster = brepo.findAllByBookedby(lastmodby);

		mv.addObject("bookinglist", bookingmaster);
		System.out.println(bookingmaster);
		return mv;
	}

	@GetMapping("/testPay/{bookingno}")
	public ModelAndView checkPayment(@PathVariable String bookingno) {
		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}
		User userdetails = userRepo.findByUsername(lastmodby);
		System.out.println("test pay");
		ModelAndView mv = new ModelAndView("payNow");
		try {
			BookingMaster bookingmaster = brepo.findByBookingno(bookingno);
			mv.addObject("bookingno", bookingmaster.getBookingno());
			mv.addObject("custid", userdetails.getUsercode());
			mv.addObject("totalamount", bookingmaster.getTotalamount());
			mv.addObject("paymode", bookingmaster.getPaytype());
			mv.addObject("status", "Confirmed");
			mv.addObject("sucessmsg", "Proceed with payment...!");
		} catch (Exception e) {
			mv.addObject("errormsg", "Something went wrong..!");
		}
		return mv;
	}

	@GetMapping("/cancelOrder/{bookingno}")
	public ModelAndView cancelOrder(@PathVariable String bookingno) {
		String lastmodby = "";
		Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principala instanceof UserDetails) {
			lastmodby = ((UserDetails) principala).getUsername();
		}

		User userdetails = userRepo.findByUsername(lastmodby);
		System.out.println("test pay");
		ModelAndView mv = new ModelAndView("confirmCancel");
		try {
			BookingMaster bookingmaster = brepo.findByBookingno(bookingno);
			bookingmaster.setStatus("Cancelled");
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(dtf.format(now));
			bookingmaster.setCanceldate(dtf.format(now));
			brepo.save(bookingmaster);
			String msgBody = "Hi Customer," + "\n\nOrder " + bookingmaster.getBookingno()
					+ "has been cancelled successfully...!"
					+ "\n In case you paid, Refund will be processed within 7-8 workin days."
					+ "\n\n\n Thank You..! Have great day..!";
			sendEmail(lastmodby, "Booking Confirmation..!", msgBody);
			mv.addObject("sucessmsg", "Order cancelled successfully...!");
		} catch (Exception e) {
			mv.addObject("errormsg", "Something went wrong..!");
		}
		return mv;
	}

	@GetMapping("/viewDetails/{bookingno}")
	public ModelAndView viewDetails(@PathVariable String bookingno) {
		ModelAndView mv = new ModelAndView("viewBookingDetails");
		try {
			String lastmodby = "";
			Object principala = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principala instanceof UserDetails) {
				lastmodby = ((UserDetails) principala).getUsername();
			}
			User userdetails = userRepo.findByUsername(lastmodby);
			BookingMaster bookingmaster = brepo.findByBookingno(bookingno);
			mv.addObject("bookingno", bookingmaster.getBookingno());
			mv.addObject("name", bookingmaster.getFname());
			mv.addObject("amount", bookingmaster.getTotalamount());
			mv.addObject("bookingdate", bookingmaster.getBookedat());
			mv.addObject("addtype", bookingmaster.getAddtype());
			mv.addObject("address", bookingmaster.getHousestreet() + ", " + bookingmaster.getLandmark() + ", "
					+ bookingmaster.getTowncity() + ", " + bookingmaster.getPincode());
			mv.addObject("paymode", bookingmaster.getPaytype());
			mv.addObject("bookingstatus", bookingmaster.getStatus());
			mv.addObject("paystatus", bookingmaster.getPaymentstatus());
			mv.addObject("samplecollected", bookingmaster.getSamplecollected());
			mv.addObject("samplecollecteddate", bookingmaster.getSamplecollecteddate());
			mv.addObject("reportdelivered", bookingmaster.getReportdelivered());
			mv.addObject("reportdelivereddate", bookingmaster.getReportdelivereddate());
			Set<TestDetails> testdetails = bookingmaster.getTestdetails();
			System.out.println("test details" + testdetails);
			mv.addObject("testDetails", testdetails);
			mv.addObject("sucessmsg", "Booking Details...!");
			return mv;

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errormsg", "Something went wrong...!");
			return mv;
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/testNamesAutocomplete")
	@ResponseBody
	public List<LabelValueDTO> testtNamesAutocomplete(
			@RequestParam(value = "term", required = false, defaultValue = "") String term) {
		List<LabelValueDTO> suggestions = new ArrayList<LabelValueDTO>();
		try {
			// only update when term is three characters.

			List<TestMaster> allTest = (List<TestMaster>) trepo.findAllByChar(term);

			for (TestMaster test : allTest) {
				System.out.println(test);
				// if (test.toString().contains(term)) {
				LabelValueDTO lv = new LabelValueDTO();
				lv.setLabel(test.getTestname());
				lv.setValue(Integer.toString(test.getTid()));
				System.out.println("" + test.getTestname());
				suggestions.add(lv);
				// }
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return suggestions;

	}

	public void sendEmail(String username, String subject, String msgBody) {
		String email = env.getProperty("fromemailid");
		User existingUser = userRepo.findByUsername(username);
		// Create the email
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(existingUser.getEmail());
		mailMessage.setSubject(subject);
		mailMessage.setFrom(email);
		mailMessage.setText(msgBody);

		// Send the email
		emailSenderService.sendEmail(mailMessage);

	}

	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("about");
		System.out.println("about Form");
		return mv;
	}
	@RequestMapping("/blog")
	public ModelAndView blog() {
		ModelAndView mv = new ModelAndView("blog");
		System.out.println("blog Form");
		return mv;
	}
	@RequestMapping("/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("contact");
		System.out.println("contact Form");
		return mv;
	}
}
