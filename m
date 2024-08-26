Return-Path: <linux-i2c+bounces-5797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047095EF1B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E5E1F24F09
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAF015530F;
	Mon, 26 Aug 2024 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QETWtZcK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483901537D9
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669704; cv=none; b=fi8EkHVVPbTMee17MQXzLHmUMRx//XhweC1fsRB4dVWg4brxUPUayOrOWrrWd1F342G6nfCeSlipa0jSUsFe1AnaVFLztJWi9+L/BgJ0YwBaM3VA70fHue9sOfrUzHjeHeRZEoA5Psx4Uql8JDTyEOUyYZzwt4w5ZTCG2uqtG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669704; c=relaxed/simple;
	bh=ZKvhXZbFQWf5hH+P/pxElLbtOGycUozQPtcN9rFQF0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNLmyu7+KNCv260Bt8dubLJqZR9iPbUVvjWMaHaoZ7Sd5rUho6Vjdy6/pzFcCHW3jHAjmgTLItE9D8S4U/Wk96I5sJQ2I2FOGMefU3Wl8fdFfeSlNuZN5Cv5w/5DuIakoRzhVBejYw63tzGbTXkqosovbtcaGXdeI6N1zucxoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QETWtZcK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724669702; x=1756205702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZKvhXZbFQWf5hH+P/pxElLbtOGycUozQPtcN9rFQF0o=;
  b=QETWtZcKgxLsLvKlk6nkryXKebuM64uRXzoNqzfeWSVn2Ib+hmJOfykg
   1AWjDY5rfd+fyWboaLWymZbJcakanN3JC2pcgl3ng957UebsI/NGyNwhR
   OgCiN18w2cXLJFHAQPP/WeGh54NsTq9VdN0HofvTe3gXVq9TgYZZDKeGb
   HDMX+6zAea+NL0nhRECeV+mfnuNvC/LgVCx5vdpY8wiFUbLlrCoQrQTI2
   oivth8UZbk4/wnVgwb8tN6z1DMnrJFE5Ghcc51aHVHYCZ6UW+F1hV7hWQ
   cR21fI3pZ/vdut8akj0PeqHhVdZf7NQBL8sNrQoOVsj5t9TYWKu4UD8MC
   A==;
X-CSE-ConnectionGUID: f5uuqqOdT02hga8PuH/Sew==
X-CSE-MsgGUID: yMGqpVcuRmuL7KMoyaLkVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33705004"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33705004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:54:59 -0700
X-CSE-ConnectionGUID: I8HPQD2CS/KwUrAxpj/7RA==
X-CSE-MsgGUID: pXKU0ebkSnC/cyYA2tBXzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93202996"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 03:54:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siXN8-000Gx0-2w;
	Mon, 26 Aug 2024 10:54:54 +0000
Date: Mon, 26 Aug 2024 18:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <202408261816.iYeJHXHU-lkp@intel.com>
References: <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Allow-more-than-two-algo-selection-for-SMBus/20240826-113028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240822142200.686842-4-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
config: i386-buildonly-randconfig-003-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261816.iYeJHXHU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261816.iYeJHXHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261816.iYeJHXHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-piix4.c:935:6: warning: variable 'cmd' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     935 |         if (!(reg & SB800_ASF_ERROR_STATUS)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:971:8: note: uninitialized use occurs here
     971 |         if (!(cmd & BIT(0))) {
         |               ^~~
   drivers/i2c/busses/i2c-piix4.c:935:2: note: remove the 'if' if its condition is always true
     935 |         if (!(reg & SB800_ASF_ERROR_STATUS)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:927:19: note: initialize the variable 'cmd' to silence this warning
     927 |         u8 bank, reg, cmd;
         |                          ^
         |                           = '\0'
   1 warning generated.


vim +935 drivers/i2c/busses/i2c-piix4.c

   920	
   921	static void sb800_asf_process_slave(struct work_struct *work)
   922	{
   923		struct i2c_piix4_adapdata *adapdata = container_of(work, struct i2c_piix4_adapdata,
   924								   work_buf.work);
   925		unsigned short piix4_smba = adapdata->smba;
   926		u8 data[SB800_ASF_BLOCK_MAX_BYTES];
   927		u8 bank, reg, cmd;
   928		u8 len, val = 0;
   929		int i;
   930	
   931		/* Read slave status register */
   932		reg = inb_p(ASFSLVSTA);
   933	
   934		/* Check if no error bits are set in slave status register */
 > 935		if (!(reg & SB800_ASF_ERROR_STATUS)) {
   936			/* Read data bank */
   937			reg = inb_p(ASFDATABNKSEL);
   938			bank = (reg & BIT(3)) >> 3;
   939	
   940			/* Set read data bank */
   941			if (bank) {
   942				reg = reg | BIT(4);
   943				reg = reg & (~BIT(3));
   944			} else {
   945				reg = reg & (~BIT(4));
   946				reg = reg & (~BIT(2));
   947			}
   948	
   949			/* Read command register */
   950			outb_p(reg, ASFDATABNKSEL);
   951			cmd = inb_p(ASFINDEX);
   952			len = inb_p(ASFDATARWPTR);
   953			for (i = 0; i < len; i++)
   954				data[i] = inb_p(ASFINDEX);
   955	
   956			/* Clear data bank status */
   957			if (bank) {
   958				reg = reg | BIT(3);
   959				outb_p(reg, ASFDATABNKSEL);
   960			} else {
   961				reg = reg | BIT(2);
   962				outb_p(reg, ASFDATABNKSEL);
   963			}
   964		} else {
   965			/* Set bank as full */
   966			reg = reg | (BIT(3) | BIT(2));
   967			outb_p(reg, ASFDATABNKSEL);
   968		}
   969	
   970		outb_p(0, ASFSETDATARDPTR);
   971		if (!(cmd & BIT(0))) {
   972			i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
   973			for (i = 0; i < len; i++) {
   974				val = data[i];
   975				i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
   976			}
   977			i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
   978		}
   979	}
   980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

