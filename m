Return-Path: <linux-i2c+bounces-14529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B683CBB1EF
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Dec 2025 18:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA864304E567
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Dec 2025 17:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECD42E6CBC;
	Sat, 13 Dec 2025 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/jcOuz+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312425D216;
	Sat, 13 Dec 2025 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765647255; cv=none; b=I8iZJ/FB6YgyMErQkxr/4dfGNcquNGWjMakeND3HLp2FBOfKoNPivHPnlSqyuq2ula1y3YcWpP1WPijlW7n3ygS3OhQIbwBIwxlXto72dkdTeyTT2QUa8WAHipStiFBAaH3vWwqSY+peq5EJeuedZCO7uqMOkkHfsic7wq1qagw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765647255; c=relaxed/simple;
	bh=YSbuTBIlzPrLiem4wRujUcouD4hirFezUKyLBGx4aYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRsM3as7Q0sSDwZUZzz5L8tl1/AfapvL9guPUayzAufqLA2ATKgi9c0B33Vs4TvLlmDsif6D+YRBMZadNLcDavFXDLqDJj1JqR23lfGZ1dYt4SUIxFiSHvUj+mh1CQOjJJcSCYQCyBBNbVLDq6qnFhwfozfYOrt5HgPAo6Urcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/jcOuz+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765647254; x=1797183254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSbuTBIlzPrLiem4wRujUcouD4hirFezUKyLBGx4aYE=;
  b=Y/jcOuz+zAvvIrMy5slZbV5W1/zpM5YuxZamu7mYN2omRV3aig6BeK0W
   fn8Bjvtwh4qFzVIIs+vcq9nA0g2DcapTBGeaXbjO8QN59mQ7iB++FVSUz
   JFCiJpAkRFrVWBGjEQm3cXyekDxe+9a13cSyrm6FDOJ9pH+f2RvsaoDVW
   vBCNrQ6OweJORjZXHKfQV2d2LrCKEU6Gnn4+mykHScEw+fa0Ktf1KYSbG
   1sA4vNytr+WKtTkR9ZS8aQAyBREmIJuaG4roEjCc681+8yHKVQKC/BxH0
   Pq3XfKhcJS+S33VJ/eHD8CrZLa9AqARVZiHwV2iP1mUnAwz8vjCCibRxg
   Q==;
X-CSE-ConnectionGUID: /yh4NJOKQ/OCApAgcPrfXQ==
X-CSE-MsgGUID: KGSc6475QTKMzvTeQOhrpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71466836"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71466836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:34:13 -0800
X-CSE-ConnectionGUID: U2A9g5b+SUy+YPvqzYTSSw==
X-CSE-MsgGUID: qzQEF6zzTcyQTO3n73QR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197617095"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 09:34:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTVN-000000007zp-00v0;
	Sat, 13 Dec 2025 17:34:05 +0000
Date: Sun, 14 Dec 2025 01:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>,
	Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Wenkai Chung <wenkai.chung@advantech.com.tw>,
	Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>,
	Hongzhi Wang <hongzhi.wang@advantech.com>,
	Mikhail Tsukerman <mikhail.tsukerman@advantech.com>,
	Thomas Kastner <thomas.kastner@advantech.com>,
	Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: Re: [PATCH 8/8] Add Advantech EIO Fan driver
Message-ID: <202512140153.dNgpAKJt-lkp@intel.com>
References: <20251212-upstream-v1-v1-8-d50d40ec8d8a@advantech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-upstream-v1-v1-8-d50d40ec8d8a@advantech.com>

Hi Ramiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9771d0dbe18dd643760431870a6abf9b0866bb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramiro-Oliveira/Add-Advantech-EIO-MFD-driver/20251213-004905
base:   d9771d0dbe18dd643760431870a6abf9b0866bb0
patch link:    https://lore.kernel.org/r/20251212-upstream-v1-v1-8-d50d40ec8d8a%40advantech.com
patch subject: [PATCH 8/8] Add Advantech EIO Fan driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140153.dNgpAKJt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140153.dNgpAKJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140153.dNgpAKJt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/eio_fan.c: In function 'eio_fan_probe':
>> drivers/thermal/eio_fan.c:391:21: warning: variable 'temps_mc' set but not used [-Wunused-but-set-variable]
     391 |                 int temps_mc[TRIP_NUM];
         |                     ^~~~~~~~


vim +/temps_mc +391 drivers/thermal/eio_fan.c

   375	
   376	static int eio_fan_probe(struct platform_device *pdev)
   377	{
   378		struct device *dev = &pdev->dev;
   379		unsigned int fan_id;
   380		int ret;
   381	
   382		if (!dev_get_drvdata(dev->parent)) {
   383			dev_err(dev, "eio_core not present\n");
   384			return -ENODEV;
   385		}
   386	
   387		for (fan_id = 0; fan_id < FAN_MAX; fan_id++) {
   388			u8 state = 0, name = 0;
   389			int trip_hi = 0, trip_lo = 0, trip_stop = 0;
   390			int pwm_hi = 0, pwm_lo = 0;
 > 391			int temps_mc[TRIP_NUM];
   392			struct eio_fan_dev *fan;
   393			struct thermal_zone_device *tzd;
   394			struct thermal_cooling_device *cdev;
   395	
   396			if (pmc_read(dev->parent, CTRL_STATE, fan_id, &state) ||
   397			    pmc_read(dev->parent, CTRL_TYPE, fan_id, &name) ||
   398			    pmc_read(dev->parent, CTRL_THERM_HIGH, fan_id, &trip_hi) ||
   399			    pmc_read(dev->parent, CTRL_THERM_LOW, fan_id, &trip_lo) ||
   400			    pmc_read(dev->parent, CTRL_THERM_STOP, fan_id, &trip_stop) ||
   401			    pmc_read(dev->parent, CTRL_PWM_HIGH, fan_id, &pwm_hi) ||
   402			    pmc_read(dev->parent, CTRL_PWM_LOW, fan_id, &pwm_lo)) {
   403				dev_info(dev, "fan%u: pmc read error, skipping\n", fan_id);
   404				continue;
   405			}
   406	
   407			if (!(state & 0x1)) {
   408				dev_info(dev, "fan%u: firmware reports disabled\n", fan_id);
   409				continue;
   410			}
   411	
   412			if (!fan_name[name][0]) {
   413				dev_info(dev, "fan%u: unknown name index %u\n", fan_id, name);
   414				continue;
   415			}
   416	
   417			temps_mc[TRIP_HIGH] = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi);
   418			temps_mc[TRIP_LOW]  = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo);
   419			temps_mc[TRIP_STOP] = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop);
   420	
   421			fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
   422			if (!fan)
   423				return -ENOMEM;
   424	
   425			fan->mfd = dev->parent;
   426			fan->id  = (u8)fan_id;
   427	
   428			fan->trip_priv[TRIP_HIGH].trip_ctl = CTRL_THERM_HIGH;
   429			fan->trip_priv[TRIP_LOW].trip_ctl  = CTRL_THERM_LOW;
   430			fan->trip_priv[TRIP_STOP].trip_ctl = CTRL_THERM_STOP;
   431	
   432			struct thermal_trip trips[TRIP_NUM] = {
   433				[TRIP_HIGH] = {
   434					.type = THERMAL_TRIP_ACTIVE,
   435					.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi),
   436					.flags = THERMAL_TRIP_FLAG_RW_TEMP,
   437					.priv = &fan->trip_priv[TRIP_HIGH],
   438				},
   439				[TRIP_LOW] = {
   440					.type = THERMAL_TRIP_ACTIVE,
   441					.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo),
   442					.flags = THERMAL_TRIP_FLAG_RW_TEMP,
   443					.priv = &fan->trip_priv[TRIP_LOW],
   444				},
   445				[TRIP_STOP] = {
   446					.type = THERMAL_TRIP_ACTIVE,
   447					.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop),
   448					.flags = THERMAL_TRIP_FLAG_RW_TEMP,
   449					.priv = &fan->trip_priv[TRIP_STOP],
   450				},
   451			};
   452	
   453			tzd = thermal_zone_device_register_with_trips(fan_name[name],
   454								      trips, TRIP_NUM,
   455								      fan,
   456								      &zone_ops,
   457								      NULL,
   458								      0, 0);
   459			if (IS_ERR(tzd))
   460				return PTR_ERR(tzd);
   461	
   462			cdev = thermal_cooling_device_register(fan_name[name], fan, &cooling_ops);
   463			if (IS_ERR(cdev)) {
   464				thermal_zone_device_unregister(tzd);
   465				dev_err(dev, "fan%u: cdev register failed: %ld\n",
   466					fan_id, PTR_ERR(cdev));
   467				return PTR_ERR(cdev);
   468			}
   469	
   470			dev_set_drvdata(thermal_zone_device(tzd), tzd);
   471			ret = device_create_file(thermal_zone_device(tzd), &dev_attr_fan_mode);
   472			if (ret)
   473				dev_warn(dev, "Error create thermal zone fan_mode sysfs\n");
   474		}
   475		return 0;
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

