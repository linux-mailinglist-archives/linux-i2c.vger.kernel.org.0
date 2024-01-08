Return-Path: <linux-i2c+bounces-1220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C9827654
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 18:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15196283FDF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 17:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316985467C;
	Mon,  8 Jan 2024 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNxSrwbZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154C54671;
	Mon,  8 Jan 2024 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704734914; x=1736270914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KGcherc9esjx59/mXAgptjde9o6tOxniYDKXCWdHcdc=;
  b=cNxSrwbZl7qOVOgF7sNDofYu7pIC1mlvqv09FK+CCdX36CC72WpuC4MS
   EdpRWigjuptpcccK7Xtw9ZkC7GVMRVbnRCKcHmOdWdq73QC63SBLVfNWj
   9nlWeKr/DO4QT633g3l8ZTBwUwUS2SFWSeYm5OoIts22xtXxTHsIG1I8/
   OV7KaIG0JO6gI9rW9zuMYsnwJ3gKpo9aQvjvMCMQz9YpMyhDjv1UIce8T
   mBOeno8ZRRz6A5/yraSNWWSCgrHbNsJX8uvOfzwOwyc29s+PCq46OcKHA
   ydhA1d/cAk2qbVOyz7xww/+qmrjXExgV5TZNivvz1Ek/l06H1nW1HLGYI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="397656865"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="397656865"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 09:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="904864545"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="904864545"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Jan 2024 09:28:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMtQ6-0004wU-1D;
	Mon, 08 Jan 2024 17:28:14 +0000
Date: Tue, 9 Jan 2024 01:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/6] platform/x86: dell-smo8800: Pass the IRQ to the
 lis3lv02d i2c_client
Message-ID: <202401090124.XEXEJx2K-lkp@intel.com>
References: <20231224213629.395741-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-5-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7]
[cannot apply to wsa/i2c/for-next next-20240108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/platform-x86-dell-smo8800-Only-load-on-Dell-laptops/20231225-152720
base:   linus/master
patch link:    https://lore.kernel.org/r/20231224213629.395741-5-hdegoede%40redhat.com
patch subject: [PATCH 4/6] platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
config: i386-randconfig-003-20240106 (https://download.01.org/0day-ci/archive/20240109/202401090124.XEXEJx2K-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090124.XEXEJx2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090124.XEXEJx2K-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_remove':
   drivers/platform/x86/dell/dell-smo8800.c:284: undefined reference to `i2c_unregister_device'
>> ld: drivers/platform/x86/dell/dell-smo8800.c:284: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_instantiate_i2c_client':
   drivers/platform/x86/dell/dell-smo8800.c:179: undefined reference to `i2c_bus_type'
   ld: drivers/platform/x86/dell/dell-smo8800.c:212: undefined reference to `i2c_put_adapter'
>> ld: drivers/platform/x86/dell/dell-smo8800.c:202: undefined reference to `i2c_new_client_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_probe':
   drivers/platform/x86/dell/dell-smo8800.c:271: undefined reference to `i2c_unregister_device'
   ld: drivers/platform/x86/dell/dell-smo8800.o: in function `smo8800_find_i801':
   drivers/platform/x86/dell/dell-smo8800.c:126: undefined reference to `i2c_verify_adapter'
   ld: drivers/platform/x86/dell/dell-smo8800.c:140: undefined reference to `i2c_get_adapter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

