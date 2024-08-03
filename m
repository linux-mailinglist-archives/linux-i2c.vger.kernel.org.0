Return-Path: <linux-i2c+bounces-5125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D5946B5C
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2024 00:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE931F21B90
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2024 22:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F26E5B05E;
	Sat,  3 Aug 2024 22:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F296FdM+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35F12B64;
	Sat,  3 Aug 2024 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722724731; cv=none; b=Kywa/MHvxbUU/7T5HHBZill20pON9Iqj02vIMvDZ0s1rdkKPjHVeWHrDTGMbuRmaRkccaeDIEkX41uP+R6CJd+dZLbVTMbV4kKQ31rDD5hzSJH2sH5zaq5l0i2EGkih60CubpM9rC3YGgFy3gE5ngxbLYP9/nN1iAMUECOmqG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722724731; c=relaxed/simple;
	bh=1jAKqZMAnQ2Z/pNG3/2MiYZgzSRttc+ErvQBuIso/Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTo5ulEsZKp+/QIeDfLDnosat37CR23kJiVxhflpM4WTY3S/8ry6xhm84eK3ziDRcNBR+PcUAwWUtwfWxPMQ2dUSR8twzg054cN4QUKwjF865BtEGP5Z+rb18NjaT9D1c5zhf1sndosJ2V7KV/Ubl1PZlO+rIp+7SCz5w0rny60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F296FdM+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722724729; x=1754260729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1jAKqZMAnQ2Z/pNG3/2MiYZgzSRttc+ErvQBuIso/Kw=;
  b=F296FdM+wpI8ODXyG3gnzMvZMuFLQsVIVAcVBBxsBQwtGRrVwA9bxBA+
   P8K8b8LuDNGRsirNdwwLMXagtgoYaSncd4c2MbKcwAEneya7CcM9KDlQR
   7MUADOOxcLA15yqOHjPO+MlduPG/VOt57LSCxZ+Xw1pLPRYx433gJNUuG
   Q+ZGUV5RBICA2PU0hlVFGRmmD6LduuJDHdwWph41CXKRDTwAyc2XZwdP+
   Ee7wRV/w7TjyPzb/kKNKjP0VcXInCA++4eICRuBWRmUMUtnG0uaYcdoVj
   R7Tq1Fa7fabMSS7+D1R0x8kAdyl46UOAYqBeMYon2mDDCpRG9OP7LLsju
   w==;
X-CSE-ConnectionGUID: pqzCm4MTS0iFP3033V8YZA==
X-CSE-MsgGUID: ZXN207rTTsGjydYC/zgOSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20892356"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20892356"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 15:38:48 -0700
X-CSE-ConnectionGUID: Hjz/bKAjRam0bcsrxrXedg==
X-CSE-MsgGUID: e7aXNycDSjKyoCnJWemujw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55995625"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Aug 2024 15:38:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saNOc-0000xC-1O;
	Sat, 03 Aug 2024 22:38:42 +0000
Date: Sun, 4 Aug 2024 06:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <202408040629.HQM8a5ga-lkp@intel.com>
References: <20240801160610.101859-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160610.101859-2-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes andi-shyti/i2c/i2c-host akpm-mm/mm-everything linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/x86-Add-basic-support-for-the-Congatec-CGEB-BIOS-interface/20240803-013725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240801160610.101859-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS interface
config: x86_64-randconfig-121-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040629.HQM8a5ga-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040629.HQM8a5ga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040629.HQM8a5ga-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/congatec-cgeb.c:407:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *data @@
   drivers/mfd/congatec-cgeb.c:407:43: sparse:     expected void [noderef] __user *to
   drivers/mfd/congatec-cgeb.c:407:43: sparse:     got void *data
>> drivers/mfd/congatec-cgeb.c:436:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *code @@     got void *[addressable] data @@
   drivers/mfd/congatec-cgeb.c:436:21: sparse:     expected void [noderef] __user *code
   drivers/mfd/congatec-cgeb.c:436:21: sparse:     got void *[addressable] data
   drivers/mfd/congatec-cgeb.c:527:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *data @@
   drivers/mfd/congatec-cgeb.c:527:38: sparse:     expected void [noderef] __user *to
   drivers/mfd/congatec-cgeb.c:527:38: sparse:     got void *data
>> drivers/mfd/congatec-cgeb.c:535:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user * @@     got void *data @@
   drivers/mfd/congatec-cgeb.c:535:21: sparse:     expected void [noderef] __user *
   drivers/mfd/congatec-cgeb.c:535:21: sparse:     got void *data
>> drivers/mfd/congatec-cgeb.c:564:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void *[addressable] data @@
   drivers/mfd/congatec-cgeb.c:564:25: sparse:     expected void [noderef] __user *
   drivers/mfd/congatec-cgeb.c:564:25: sparse:     got void *[addressable] data
>> drivers/mfd/congatec-cgeb.c:572:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] data @@     got void [noderef] __user *memory @@
   drivers/mfd/congatec-cgeb.c:572:23: sparse:     expected void *[assigned] data
   drivers/mfd/congatec-cgeb.c:572:23: sparse:     got void [noderef] __user *memory
>> drivers/mfd/congatec-cgeb.c:612:49: sparse: sparse: Using plain integer as NULL pointer
>> drivers/mfd/congatec-cgeb.c:651:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *optr_user @@     got void *[addressable] optr @@
   drivers/mfd/congatec-cgeb.c:651:35: sparse:     expected void [noderef] __user *optr_user
   drivers/mfd/congatec-cgeb.c:651:35: sparse:     got void *[addressable] optr
>> drivers/mfd/congatec-cgeb.c:786:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] data @@     got void [noderef] __user *off @@
   drivers/mfd/congatec-cgeb.c:786:39: sparse:     expected void *[assigned] data
   drivers/mfd/congatec-cgeb.c:786:39: sparse:     got void [noderef] __user *off
   drivers/mfd/congatec-cgeb.c:788:42: sparse: sparse: Using plain integer as NULL pointer
>> drivers/mfd/congatec-cgeb.c:863:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *off @@     got void *[addressable] virt @@
   drivers/mfd/congatec-cgeb.c:863:40: sparse:     expected void [noderef] __user *off
   drivers/mfd/congatec-cgeb.c:863:40: sparse:     got void *[addressable] virt
   drivers/mfd/congatec-cgeb.c:865:42: sparse: sparse: Using plain integer as NULL pointer
>> drivers/mfd/congatec-cgeb.c:884:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] data @@     got void [noderef] __user *ptr @@
   drivers/mfd/congatec-cgeb.c:884:23: sparse:     expected void *[assigned] data
   drivers/mfd/congatec-cgeb.c:884:23: sparse:     got void [noderef] __user *ptr
>> drivers/mfd/congatec-cgeb.c:911:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *_mem @@     got void [noderef] __iomem *[assigned] pcur @@
   drivers/mfd/congatec-cgeb.c:911:36: sparse:     expected void *_mem
   drivers/mfd/congatec-cgeb.c:911:36: sparse:     got void [noderef] __iomem *[assigned] pcur
>> drivers/mfd/congatec-cgeb.c:938:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *_mem @@     got void [noderef] __iomem *[assigned] high_desc_virt @@
   drivers/mfd/congatec-cgeb.c:938:37: sparse:     expected void *_mem
   drivers/mfd/congatec-cgeb.c:938:37: sparse:     got void [noderef] __iomem *[assigned] high_desc_virt

vim +407 drivers/mfd/congatec-cgeb.c

   401	
   402	static int cgeb_copy_to_user(struct cgeb_msg *resp, void *user)
   403	{
   404		struct cgeb_high_desc *high_desc;
   405		unsigned long uncopied;
   406		high_desc = user;
 > 407		uncopied = copy_to_user(resp->code.data, high_desc,
   408					high_desc->code_size);
   409		if (uncopied) {
   410			pr_err("CGEB: Couldn't copy code into userspace! %ld\n",
   411			       uncopied);
   412			return -ENOMEM;
   413		}
   414		return 0;
   415	}
   416	
   417	static int cgeb_upload_code(struct cgeb_high_desc *high_desc,
   418				    struct cgeb_board_data *board)
   419	{
   420		struct cgeb_msg req = {0}, resp;
   421		size_t len = high_desc->code_size;
   422		int ret = 0;
   423	
   424		req.type = CGEB_MSG_ALLOC_CODE;
   425		req.code.length = len;
   426		pr_debug("CGEB: Allocating memory for code\n");
   427		ret = cgeb_request(req, &resp, cgeb_copy_to_user, high_desc);
   428		if (ret)
   429			goto out;
   430		if (resp.type != CGEB_MSG_CODE) {
   431			pr_err("CGEB: Bad response type for alloc: %d\n", resp.type);
   432			ret = -EINVAL;
   433			goto out;
   434		}
   435	
 > 436		board->code = resp.code.data;
   437		board->code_size = len;
   438	
   439		req.type = CGEB_MSG_CODE;
   440		req.code.data = resp.code.data;
   441		req.code.entry_rel = high_desc->entry_rel;
   442		req.code.length = len;
   443	
   444		pr_debug("CGEB: Uploading code\n");
   445		ret = cgeb_request(req, &resp, NULL, NULL);
   446	
   447		if (ret)
   448			goto out;
   449	
   450		/* Do stuff with response */
   451		if (resp.type != CGEB_MSG_ACK) {
   452			pr_err("CGEB: Failed to upload code! Got non-ack response!\n");
   453			ret = -EINVAL;
   454		}
   455	
   456	out:
   457		return ret;
   458	}
   459	
   460	static unsigned short get_data_segment(void)
   461	{
   462		unsigned short ret;
   463	
   464	#ifdef CONFIG_X86_64
   465		ret = 0;
   466	#else
   467		asm volatile("mov %%ds, %0\n"
   468				  : "=r"(ret)
   469				  :
   470				  : "memory"
   471		);
   472	#endif
   473	
   474		return ret;
   475	}
   476	
   477	static int cgeb_after_call(struct cgeb_msg *resp, void *user)
   478	{
   479		int ret = 0;
   480		int alloc_size;
   481		struct cgeb_call_user *data = user;
   482		if (!resp->fps.fps.optr)
   483			return ret;
   484	
   485		switch(resp->fps.fps.status) {
   486		case CGEB_NEXT:
   487		case CGEB_NOIRQS:
   488		case CGEB_DELAY:
   489		case CGEB_DBG_HEX:
   490		case CGEB_DBG_DEC:
   491			/* These lead to continuations, we don't need their memory */
   492			return ret;
   493	
   494		/* Everything else we could need */
   495		case CGEB_DBG_STR:
   496			data->size = alloc_size = strnlen_user(resp->fps.fps.optr, 1023);
   497			if (alloc_size > 1023) {
   498				data->size = 1023;
   499				alloc_size = data->size + 1;
   500			}
   501			/* Special case, because these come from program memory */
   502			data->optr = kzalloc(alloc_size, GFP_KERNEL);
   503			if (!data->optr)
   504				return -ENOMEM;
   505		}
   506	
   507		ret = copy_from_user(data->optr, resp->fps.fps.optr, data->size);
   508	
   509		if (ret) {
   510			pr_err("CGEB: Couldn't copy optr out of userspace! %d\n", ret);
   511			ret = -ENOMEM;
   512		}
   513	
   514		if (resp->fps.fps.status == CGEB_SUCCESS && data->callback) {
   515			data->callback(resp->fps.fps.optr, data->optr,
   516				       data->callback_data);
   517		}
   518	
   519		return ret;
   520	}
   521	
   522	static int cgeb_after_alloc(struct cgeb_msg *resp, void *user)
   523	{
   524		int ret;
   525		struct cgeb_after_alloc_data *data = user;
   526	
 > 527		ret = copy_to_user(resp->code.data, data->kernel, data->length);
   528	
   529		if (ret) {
   530			pr_err("CGEB: Couldn't copy iptr into userspace! %d\n", ret);
   531	
   532			ret = -ENOMEM;
   533		}
   534	
 > 535		*data->user = resp->code.data;
   536	
   537		return ret;
   538	}
   539	
   540	static int cgeb_get_user_ptr(void *kernel, void __user **user, size_t length)
   541	{
   542		struct cgeb_msg req = {0}, resp;
   543		struct cgeb_after_alloc_data data;
   544	
   545		data.kernel = kernel;
   546		data.user = user;
   547		data.length = length;
   548	
   549		req.type = CGEB_MSG_ALLOC;
   550		req.code.length = length;
   551		return cgeb_request(req, &resp, cgeb_after_alloc, &data);
   552	}
   553	
   554	static void __user *cgeb_user_alloc(size_t length)
   555	{
   556		int ret;
   557		struct cgeb_msg req = {0}, resp;
   558		req.type = CGEB_MSG_ALLOC;
   559		req.code.length = length;
   560		ret = cgeb_request(req, &resp, NULL, NULL);
   561		if (ret)
   562			return NULL;
   563	
 > 564		return resp.code.data;
   565	}
   566	
   567	static int cgeb_user_free(void __user *memory)
   568	{
   569		struct cgeb_msg req = {0}, resp;
   570	
   571		req.type = CGEB_MSG_FREE;
 > 572		req.code.data = memory;
   573		return cgeb_request(req, &resp, NULL, NULL);
   574	}
   575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

