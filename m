Return-Path: <linux-i2c+bounces-8143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73E09D5E6B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08AE0B2443B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 11:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C831DE2B3;
	Fri, 22 Nov 2024 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0dicT3V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21701C9DD8;
	Fri, 22 Nov 2024 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732276348; cv=none; b=FcpmM6VTgbfZbAMwOxLjR0Oa+QzomFxPlEknLcgHTzvOCB+5ZbuLL6AWBDXAvKfQ4J+l1KboG+CTBSA2Qy5CwNjnPc6KDFkXho34LcESHlhqFprhEgU3xAMsSLRxMJWbQn9bQfQsYo8dKCd8jLaAZDD17sd1tnVbei/jBnB7a+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732276348; c=relaxed/simple;
	bh=oHOunADvi+vIy3JhCVGF2ZdiCG/NxMIxl0/zchipkCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWFVCPOvnvCq2s+lWn7FtIads2h99KG0LDZqC7/XRkCxzppgXz7NT8OIwPQYai4C+cPtZi39sAa+/2Gma+nlxjlDvgaT3As+lYStTvhlfUbwLsSWbGxqbbxL6rkKs+z4+uKCJSbUxC+ECsyceXZDjFp8aAJcc5UkjDdg+MLVXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0dicT3V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732276347; x=1763812347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oHOunADvi+vIy3JhCVGF2ZdiCG/NxMIxl0/zchipkCU=;
  b=Q0dicT3V3NjFtGEPujIZhR3zqnCmdNYbJ3ztLPveUyy/uu8mrdzdQ360
   WL0WEz9DoL/9RcGwIOGM/IC5Zt+qWZPsSENH5pFgUO4nC0sRznCL4LKa0
   IAa7M2v5FIpzf3HKjS0gMxg2sPdaJfAi7ouWkkj5nVi0a4ECdDih65Wfr
   ru/8L7SO1KkoaOPdvkykrDB6G5IbltG1yuTkXLnJfXzJem0KWTbkgbxeb
   5H+iEQIcEYO0HaIxHB4XZAKi51TlViVWNwomAJKQ1yDN3lW2IUiEOsJnT
   i2nKxLmAWkJQBIodLte+9M31wD9W7TqzRpx68lUNMHXwUt5h5qS2mrNC8
   Q==;
X-CSE-ConnectionGUID: kb5luEpJQt+aJ9nDqj3DqQ==
X-CSE-MsgGUID: Aoicl7RAS1aMeTSz/8J0lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35287347"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="35287347"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:52:26 -0800
X-CSE-ConnectionGUID: Lo8E8s5IQAyDBezPcZfrHA==
X-CSE-MsgGUID: sUBvT3y6SrOc4tV2IGsaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90722980"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 03:52:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tESCv-0003sJ-2j;
	Fri, 22 Nov 2024 11:52:17 +0000
Date: Fri, 22 Nov 2024 19:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <202411221902.1IFRsKWS-lkp@intel.com>
References: <20241121064046.3724726-7-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121064046.3724726-7-tmyu0@nuvoton.com>

Hi Ming,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on mkl-can-next/testing groeck-staging/hwmon-next abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Yu/mfd-Add-core-driver-for-Nuvoton-NCT6694/20241121-155723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241121064046.3724726-7-tmyu0%40nuvoton.com
patch subject: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241122/202411221902.1IFRsKWS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221902.1IFRsKWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221902.1IFRsKWS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/nct6694-hwmon.c:263:15: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     263 |                 frac_part = FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_buf[1]);
         |                             ^
>> drivers/hwmon/nct6694-hwmon.c:508:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     508 |                        FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
         |                        ^
   2 errors generated.


vim +/FIELD_GET +263 drivers/hwmon/nct6694-hwmon.c

   238	
   239	static int nct6694_temp_read(struct device *dev, u32 attr, int channel,
   240				     long *val)
   241	{
   242		struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
   243		unsigned char temp_en, temp_hyst;
   244		int ret, int_part, frac_part;
   245		signed char temp_max;
   246	
   247		guard(mutex)(&data->lock);
   248	
   249		switch (attr) {
   250		case hwmon_temp_enable:
   251			temp_en = data->hwmon_en[NCT6694_TIN_EN(channel / 8)];
   252			*val = temp_en & BIT(channel % 8) ? 1 : 0;
   253	
   254			return 0;
   255		case hwmon_temp_input:
   256			ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
   257					       NCT6694_TIN_IDX(channel), 2,
   258					       data->xmit_buf);
   259			if (ret)
   260				return ret;
   261	
   262			int_part = sign_extend32(data->xmit_buf[0], 7);
 > 263			frac_part = FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_buf[1]);
   264			if (int_part < 0)
   265				*val = (int_part + 1) * 1000 - (8 - frac_part) * 125;
   266			else
   267				*val = int_part * 1000 + frac_part * 125;
   268	
   269			return 0;
   270		case hwmon_temp_max:
   271			ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
   272					       NCT6694_HWMON_CMD2_OFFSET,
   273					       NCT6694_HWMON_CMD2_LEN,
   274					       data->xmit_buf);
   275			if (ret)
   276				return ret;
   277	
   278			*val = temp_from_reg(data->xmit_buf[NCT6694_TIN_HL(channel)]);
   279	
   280			return 0;
   281		case hwmon_temp_max_hyst:
   282			ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
   283					       NCT6694_HWMON_CMD2_OFFSET,
   284					       NCT6694_HWMON_CMD2_LEN,
   285					       data->xmit_buf);
   286			if (ret)
   287				return ret;
   288	
   289			temp_max = (signed char)data->xmit_buf[NCT6694_TIN_HL(channel)];
   290			temp_hyst = FIELD_GET(NCT6694_TIN_HYST_MASK,
   291					      data->xmit_buf[NCT6694_TIN_HYST(channel)]);
   292			if (temp_max < 0)
   293				*val = temp_from_reg(temp_max + temp_hyst);
   294			else
   295				*val = temp_from_reg(temp_max - temp_hyst);
   296	
   297			return 0;
   298		case hwmon_temp_max_alarm:
   299			ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
   300					       NCT6694_TIN_STS(channel / 8), 1,
   301						   data->xmit_buf);
   302			if (ret)
   303				return ret;
   304	
   305			*val = !!(data->xmit_buf[0] & BIT(channel % 8));
   306	
   307			return 0;
   308		default:
   309			return -EOPNOTSUPP;
   310		}
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

