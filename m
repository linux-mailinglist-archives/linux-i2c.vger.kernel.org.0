Return-Path: <linux-i2c+bounces-5198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08C694B0BD
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 21:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CF21C218AE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 19:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED16D1459FD;
	Wed,  7 Aug 2024 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxOiv+yx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A9144D39;
	Wed,  7 Aug 2024 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723060527; cv=none; b=eFDS/HapBkc0VzDk5KF/fYP8D0Op9ydk6CDiX1Ievjqkzv70vD81F3U8tP6XsUlMlzOoecCHL9WZ9XgMgEGZ1mrs4CGDW/Sb0eGjqFyZJh69L9nLmwSo3VNE2eiYecOuUhDWcOxYnV892pRlNXorD4Mov3z0EQjtf32ukGXSUqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723060527; c=relaxed/simple;
	bh=az2X1EO5TQIgKmVStPC7eXwpf00XOreTyYeLTtf3ybg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG4G/6CXKjuJpzHMLI9G2nF7Ff6IMpQsoEl7quFlhUrj6XeEdWBEKTzTUIsa+/RmG2b6J3EktJikd0e4bKDBjXCVgkqhN/6mgPwBiMWcLwIdbCSTPZyBH0jHn00GoKEHYlIXbxqcao4fJw22RyvWMlPSvoY44gG87SD6xLIUOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxOiv+yx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723060526; x=1754596526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=az2X1EO5TQIgKmVStPC7eXwpf00XOreTyYeLTtf3ybg=;
  b=cxOiv+yxfrbFdKBSlalrHS/qr1FLg8xkC3TKsEQ8AEy+nWSmu1pqzVmY
   JYC1IVjv851HJW4Y5TaAXhQ5SMSbP0SCWXN6MxTgK0tVnV+EKV0kplpwM
   o5Jw8Cd5TbgJwRseeqyrYaOnZDq2zIJZ3CILfLmiDdmS2GNNCWOBNu0BQ
   Q2Q6sqmNBiCOZ0vIatyrK4W3M9mI8Xb0KvHdglREosGfq/qtuGHY5jfnT
   i8vETKIia3C1raBOoY1XmuV6H+lr0Gm+CgYLCnraDBk35ZnLAb/t8MKkd
   FwPT1OKVSV+crNC5pI37RnL6CyiHth1/U1+I4gCeITm8GeIgPd6I4Wc3b
   w==;
X-CSE-ConnectionGUID: oH+kZXriS7KqvaA45n+H8A==
X-CSE-MsgGUID: FGcpAHvmSg2857mInPYG/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21326078"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21326078"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 12:55:26 -0700
X-CSE-ConnectionGUID: s2NvMB4OSiSRitFGoGF4BQ==
X-CSE-MsgGUID: G0rxdLxtSrqJAy8xlCI5RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56647725"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2024 12:55:21 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbmkh-0005g1-1F;
	Wed, 07 Aug 2024 19:55:19 +0000
Date: Thu, 8 Aug 2024 03:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com, rand.sec96@gmail.com,
	kwliu@nuvoton.com, jjliu0@nuvoton.com, kfting@nuvoton.com
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
Message-ID: <202408080319.de2B6PgU-lkp@intel.com>
References: <20240807100244.16872-6-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807100244.16872-6-kfting@nuvoton.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/warp5tw-gmail-com/i2c-npcm-correct-the-read-write-operation-procedure/20240807-182210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240807100244.16872-6-kfting%40nuvoton.com
patch subject: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
config: arm-randconfig-001-20240808 (https://download.01.org/0day-ci/archive/20240808/202408080319.de2B6PgU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080319.de2B6PgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080319.de2B6PgU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-npcm7xx.c: In function 'npcm_i2c_init_clk':
>> drivers/i2c/busses/i2c-npcm7xx.c:1926:14: warning: variable 'bus_freq_khz' set but not used [-Wunused-but-set-variable]
    1926 |         u32  bus_freq_khz;
         |              ^~~~~~~~~~~~
>> drivers/i2c/busses/i2c-npcm7xx.c:1925:14: warning: variable 'src_clk_khz' set but not used [-Wunused-but-set-variable]
    1925 |         u32  src_clk_khz;
         |              ^~~~~~~~~~~


vim +/bus_freq_khz +1926 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1 Tali Perry          2020-05-27  1909  
56a1485b102ed1 Tali Perry          2020-05-27  1910  /*
56a1485b102ed1 Tali Perry          2020-05-27  1911   * npcm_i2c_init_clk: init HW timing parameters.
0c47dd7d09bb5d Jonathan Neuschäfer 2022-01-29  1912   * NPCM7XX i2c module timing parameters are dependent on module core clk (APB)
56a1485b102ed1 Tali Perry          2020-05-27  1913   * and bus frequency.
0c47dd7d09bb5d Jonathan Neuschäfer 2022-01-29  1914   * 100kHz bus requires tSCL = 4 * SCLFRQ * tCLK. LT and HT are symmetric.
0c47dd7d09bb5d Jonathan Neuschäfer 2022-01-29  1915   * 400kHz bus requires asymmetric HT and LT. A different equation is recommended
56a1485b102ed1 Tali Perry          2020-05-27  1916   * by the HW designer, given core clock range (equations in comments below).
56a1485b102ed1 Tali Perry          2020-05-27  1917   *
56a1485b102ed1 Tali Perry          2020-05-27  1918   */
56a1485b102ed1 Tali Perry          2020-05-27  1919  static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
56a1485b102ed1 Tali Perry          2020-05-27  1920  {
a946fe9698f261 Tyrone Ting         2024-08-07  1921  	struct  SMB_TIMING_T *smb_timing;
a946fe9698f261 Tyrone Ting         2024-08-07  1922  	u8   scl_table_cnt = 0, table_size = 0;
a946fe9698f261 Tyrone Ting         2024-08-07  1923  
56a1485b102ed1 Tali Perry          2020-05-27  1924  	u8   fast_mode = 0;
56a1485b102ed1 Tali Perry          2020-05-27 @1925  	u32  src_clk_khz;
56a1485b102ed1 Tali Perry          2020-05-27 @1926  	u32  bus_freq_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1927  
56a1485b102ed1 Tali Perry          2020-05-27  1928  	src_clk_khz = bus->apb_clk / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1929  	bus_freq_khz = bus_freq_hz / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1930  	bus->bus_freq = bus_freq_hz;
56a1485b102ed1 Tali Perry          2020-05-27  1931  
a946fe9698f261 Tyrone Ting         2024-08-07  1932  	switch (bus_freq_hz) {
a946fe9698f261 Tyrone Ting         2024-08-07  1933  	case I2C_MAX_STANDARD_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1934  		smb_timing = SMB_TIMING_100KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1935  		table_size = ARRAY_SIZE(SMB_TIMING_100KHZ);
a946fe9698f261 Tyrone Ting         2024-08-07  1936  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1937  	case I2C_MAX_FAST_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1938  		smb_timing = SMB_TIMING_400KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1939  		table_size = ARRAY_SIZE(SMB_TIMING_400KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1940  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1941  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1942  	case I2C_MAX_FAST_MODE_PLUS_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1943  		smb_timing = SMB_TIMING_1000KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1944  		table_size = ARRAY_SIZE(SMB_TIMING_1000KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1945  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1946  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1947  	default:
56a1485b102ed1 Tali Perry          2020-05-27  1948  		return -EINVAL;
56a1485b102ed1 Tali Perry          2020-05-27  1949  	}
56a1485b102ed1 Tali Perry          2020-05-27  1950  
a946fe9698f261 Tyrone Ting         2024-08-07  1951  	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)
a946fe9698f261 Tyrone Ting         2024-08-07  1952  		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
a946fe9698f261 Tyrone Ting         2024-08-07  1953  			break;
a946fe9698f261 Tyrone Ting         2024-08-07  1954  
56a1485b102ed1 Tali Perry          2020-05-27  1955  	/* write sclfrq value. bits [6:0] are in I2CCTL2 reg */
a946fe9698f261 Tyrone Ting         2024-08-07  1956  	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, smb_timing[scl_table_cnt].sclfrq & 0x7F),
56a1485b102ed1 Tali Perry          2020-05-27  1957  		 bus->reg + NPCM_I2CCTL2);
56a1485b102ed1 Tali Perry          2020-05-27  1958  
56a1485b102ed1 Tali Perry          2020-05-27  1959  	/* bits [8:7] are in I2CCTL3 reg */
a946fe9698f261 Tyrone Ting         2024-08-07  1960  	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
a946fe9698f261 Tyrone Ting         2024-08-07  1961  		 & 0x3),
56a1485b102ed1 Tali Perry          2020-05-27  1962  		 bus->reg + NPCM_I2CCTL3);
56a1485b102ed1 Tali Perry          2020-05-27  1963  
56a1485b102ed1 Tali Perry          2020-05-27  1964  	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
56a1485b102ed1 Tali Perry          2020-05-27  1965  	npcm_i2c_select_bank(bus, I2C_BANK_0);
56a1485b102ed1 Tali Perry          2020-05-27  1966  
56a1485b102ed1 Tali Perry          2020-05-27  1967  	if (bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
56a1485b102ed1 Tali Perry          2020-05-27  1968  		/*
56a1485b102ed1 Tali Perry          2020-05-27  1969  		 * Set SCL Low/High Time:
56a1485b102ed1 Tali Perry          2020-05-27  1970  		 * k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1971  		 * k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1972  		 */
a946fe9698f261 Tyrone Ting         2024-08-07  1973  		iowrite8(smb_timing[scl_table_cnt].scllt, bus->reg + NPCM_I2CSCLLT);
a946fe9698f261 Tyrone Ting         2024-08-07  1974  		iowrite8(smb_timing[scl_table_cnt].sclht, bus->reg + NPCM_I2CSCLHT);
56a1485b102ed1 Tali Perry          2020-05-27  1975  
a946fe9698f261 Tyrone Ting         2024-08-07  1976  		iowrite8(smb_timing[scl_table_cnt].dbcnt, bus->reg + NPCM_I2CCTL5);
56a1485b102ed1 Tali Perry          2020-05-27  1977  	}
56a1485b102ed1 Tali Perry          2020-05-27  1978  
a946fe9698f261 Tyrone Ting         2024-08-07  1979  	iowrite8(smb_timing[scl_table_cnt].hldt, bus->reg + NPCM_I2CCTL4);
56a1485b102ed1 Tali Perry          2020-05-27  1980  
56a1485b102ed1 Tali Perry          2020-05-27  1981  	/* Return to Bank 1, and stay there by default: */
56a1485b102ed1 Tali Perry          2020-05-27  1982  	npcm_i2c_select_bank(bus, I2C_BANK_1);
56a1485b102ed1 Tali Perry          2020-05-27  1983  
56a1485b102ed1 Tali Perry          2020-05-27  1984  	return 0;
56a1485b102ed1 Tali Perry          2020-05-27  1985  }
56a1485b102ed1 Tali Perry          2020-05-27  1986  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

