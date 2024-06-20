Return-Path: <linux-i2c+bounces-4124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EF490FCB4
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 08:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97123286023
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 06:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBB83BB25;
	Thu, 20 Jun 2024 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiB0GFQO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91E3D3B8;
	Thu, 20 Jun 2024 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718864984; cv=none; b=hYwL3i0v5gWxzKICIhGKbe5NcZLWZpE0ppFdskaILtFR5N2vXtjbF7SQ7a1MLdEsoMz/KjjtywgUWHUF2hvwbV0KLOOuNcPdY1ZcgK6M8rfqjass2wEzJ5O0g2631rcqaDtpvY2uz8je9VCfijV1MVZkvaDc29r8+90kTm6zlsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718864984; c=relaxed/simple;
	bh=+ifqHEMdiknxEzGlwAtc+V5/msMnN6CtvpwhXeolp3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPyQu9pPPwZ5rkc6mKf9beH+uSpdLzo9+I/jPPELXuhy865PpIaXh0/J56lSSAn/Z+MQs7oLaR1z/cPJzzTV1ZW6X4TtRwci8ab0P7F4kdEhGrM1ioLUneMeYMj2nFxRfuzG+W0jBtAXY8pAU63MTfgTIBxiUm8g05f3URvreV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiB0GFQO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718864981; x=1750400981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ifqHEMdiknxEzGlwAtc+V5/msMnN6CtvpwhXeolp3Y=;
  b=LiB0GFQOrXez3xszeeSDRirftem/YgJfmk5hi6L3jXq7QfLqJHKTO3cR
   3RwCQ1NfOKIkjSk+Q5xgl4W9kyjp9V7qTNPs0ku3VFjVc5j2Ua2Ur/+Ye
   JGmwwBhiByg5USFhEAMQd8F/xECOqBNQdC1wLSRikZnXQtPYbRT+V0bf/
   Pq0GAOznB3EB3cyf2vWX2Jec8/c1hPnxCludQQ0mQWVwfgKG+QlZEH4wk
   y6dySlNIgorSCF+aV5iRY0xj0+kUzd0yrVszKVIF3LM3E1F2oIKH7EYKE
   kEYOTRmP3VT5O2840NLAqXDwzZZFPwiybWBTf1AwgTtYPaqIbTolwnnWh
   w==;
X-CSE-ConnectionGUID: QPeoLFMvSYC0BAkxDzbSIA==
X-CSE-MsgGUID: PMVNZATbQLykaAeR0hIThg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15795363"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15795363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 23:29:40 -0700
X-CSE-ConnectionGUID: NtJzaDOFRCCIzXGdFcXiJw==
X-CSE-MsgGUID: dcWuGTf9ROOwgMy3GGFnlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42800402"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 23:29:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKBIc-0007O9-07;
	Thu, 20 Jun 2024 06:29:34 +0000
Date: Thu, 20 Jun 2024 14:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Simion <andrei.simion@microchip.com>, brgl@bgdev.pl,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH 2/3] ARM: dts: at91: at91-sama7g5ek: add EEPROMs
Message-ID: <202406201413.tFxSruVt-lkp@intel.com>
References: <20240619072231.6876-3-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619072231.6876-3-andrei.simion@microchip.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c52056d9f77508cb6d4d68d3fc91c6c08ec71af]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Simion/eeprom-at24-avoid-adjusting-offset-for-24AA025E-48-64/20240619-153030
base:   0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
patch link:    https://lore.kernel.org/r/20240619072231.6876-3-andrei.simion%40microchip.com
patch subject: [PATCH 2/3] ARM: dts: at91: at91-sama7g5ek: add EEPROMs
config: arm-randconfig-004-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201413.tFxSruVt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201413.tFxSruVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201413.tFxSruVt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dts:407.22-425.5: Warning (avoid_unnecessary_addr_size): /soc/flexcom@e2818000/i2c@600/eeprom@52: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dts:427.22-445.5: Warning (avoid_unnecessary_addr_size): /soc/flexcom@e2818000/i2c@600/eeprom@53: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +407 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts

   394	
   395	&flx8 {
   396		atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
   397		status = "okay";
   398	
   399		i2c8: i2c@600 {
   400			pinctrl-names = "default";
   401			pinctrl-0 = <&pinctrl_i2c8_default>;
   402			i2c-analog-filter;
   403			i2c-digital-filter;
   404			i2c-digital-filter-width-ns = <35>;
   405			status = "okay";
   406	
 > 407			eeprom0: eeprom@52 {
   408				compatible = "atmel,24mac02e4";
   409				reg = <0x52>;
   410				#address-cells = <1>;
   411				#size-cells = <1>;
   412				size = <256>;
   413				pagesize = <16>;
   414				vcc-supply = <&vdd_3v3>;
   415	
   416				nvmem-layout {
   417					compatible = "fixed-layout";
   418					#address-cells = <1>;
   419					#size-cells = <1>;
   420	
   421					eeprom0_eui48: eui48@fa {
   422						reg = <0xfa 0x6>;
   423					};
   424				};
   425			};
   426	
   427			eeprom1: eeprom@53 {
   428				compatible = "atmel,24mac02e4";
   429				reg = <0x53>;
   430				#address-cells = <1>;
   431				#size-cells = <1>;
   432				size = <256>;
   433				pagesize = <16>;
   434				vcc-supply = <&vdd_3v3>;
   435	
   436				nvmem-layout {
   437					compatible = "fixed-layout";
   438					#address-cells = <1>;
   439					#size-cells = <1>;
   440	
   441					eeprom1_eui48: eui48@fa {
   442						reg = <0xfa 0x6>;
   443					};
   444				};
   445			};
   446		};
   447	};
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

