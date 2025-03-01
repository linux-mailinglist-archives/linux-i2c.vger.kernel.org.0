Return-Path: <linux-i2c+bounces-9668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C7A4ADCF
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 21:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747061893C2D
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 20:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308011E8342;
	Sat,  1 Mar 2025 20:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6VBYz5p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C9182D7;
	Sat,  1 Mar 2025 20:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740861148; cv=none; b=c6eyYnwrLkWeA6bmP/wHwd4l0/UP/NYkmyHkW+yz9ZEcZvRUW7R7ceEA5L1wn6Xxk2WeIN2KR4ya6j2kM1hkCF5AqbrZNJHOUNCniUPvDsKIluNNFXbP1nB8bwASOcwSLukBFPQSFeHeBOThNhqyAmA/vQvuyowdjyQleOyi9EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740861148; c=relaxed/simple;
	bh=wBg5evaKt2ua+JSREx6VTzJBkp8N1lCxgbzNDRsoVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxGYIP+TQu1vaMW+wXs4G4mhj+tAHHEVWKM1ECUfced8Oe57SFb+92VfK8wWxRwVN5Jq1BeORRc0PGbaVWMTd1H39Mrw4ExSjljTcXify9lbf3O/N/HdjSZfUr7A1P461exKWOLlAK+0xnNjib1VSFEWd774456miMdcXbg0Eis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6VBYz5p; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740861147; x=1772397147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wBg5evaKt2ua+JSREx6VTzJBkp8N1lCxgbzNDRsoVo4=;
  b=R6VBYz5pp3bnUhaR6PIxY3wHf9DinLizZYHkg/MM6oAxZKUvQcWDdm6k
   WyealKEFq5jnLGDADeaRA8LVuNMp1wvdQGh5sWjckNkPjUVTw0Nh2BKII
   qxg7bJRnpjoWRNRcap3CWhsOGDq5stX9Pdjad74UaOs5jODRzxdCXFvIB
   b5pxQ/RtfFWUOyLKTNoaSP5eTbgZN8/o42wg6nueOMl9H/5UUj46GxREl
   VVeZBTjfhVwExfmcN3UlpJ/ZdrlIhhk2IXl67MbA3RHabAPFpkeEdvWId
   6IYBxNRpI3O3G1jcwmytPa1T6u/oQcgM/D4nK2JkLeNYluYG+UCtDRWvx
   g==;
X-CSE-ConnectionGUID: ih6OA1alSQuDYJdBB20Gww==
X-CSE-MsgGUID: uInj0QL6QQSsOYbEUUw9tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41009976"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41009976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:32:26 -0800
X-CSE-ConnectionGUID: /I33WU5TQPCIw+82ZeJT1Q==
X-CSE-MsgGUID: BSv1HP4jSiq/0Ee+64SyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122590873"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Mar 2025 12:32:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTVL-000Gft-2i;
	Sat, 01 Mar 2025 20:32:13 +0000
Date: Sun, 2 Mar 2025 04:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Romain Gantois <romain.gantois@bootlin.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH v8 9/9] misc: add FPC202 dual port controller driver
Message-ID: <202503020450.UW2PuA6X-lkp@intel.com>
References: <20250227-fpc202-v8-9-b7994117fbe2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-fpc202-v8-9-b7994117fbe2@bootlin.com>

Hi Romain,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/dt-bindings-misc-Describe-TI-FPC202-dual-port-controller/20250227-182532
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250227-fpc202-v8-9-b7994117fbe2%40bootlin.com
patch subject: [PATCH v8 9/9] misc: add FPC202 dual port controller driver
config: sparc-randconfig-r051-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020450.UW2PuA6X-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020450.UW2PuA6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020450.UW2PuA6X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/misc/ti_fpc202.c: In function 'fpc202_read':
>> drivers/misc/ti_fpc202.c:104:15: error: implicit declaration of function 'i2c_smbus_read_byte_data' [-Wimplicit-function-declaration]
     104 |         val = i2c_smbus_read_byte_data(priv->client, reg);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/ti_fpc202.c: In function 'fpc202_write':
>> drivers/misc/ti_fpc202.c:110:16: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Wimplicit-function-declaration]
     110 |         return i2c_smbus_write_byte_data(priv->client, reg, value);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/ti_fpc202.c: At top level:
>> drivers/misc/ti_fpc202.c:433:1: warning: data definition has no type or storage class
     433 | module_i2c_driver(fpc202_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/misc/ti_fpc202.c:433:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
>> drivers/misc/ti_fpc202.c:433:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/misc/ti_fpc202.c:424:26: warning: 'fpc202_driver' defined but not used [-Wunused-variable]
     424 | static struct i2c_driver fpc202_driver = {
         |                          ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_ATR
   Depends on [n]: I2C [=n]
   Selected by [y]:
   - TI_FPC202 [=y]


vim +/i2c_smbus_read_byte_data +104 drivers/misc/ti_fpc202.c

    99	
   100	static int fpc202_read(struct fpc202_priv *priv, u8 reg)
   101	{
   102		int val;
   103	
 > 104		val = i2c_smbus_read_byte_data(priv->client, reg);
   105		return val;
   106	}
   107	
   108	static int fpc202_write(struct fpc202_priv *priv, u8 reg, u8 value)
   109	{
 > 110		return i2c_smbus_write_byte_data(priv->client, reg, value);
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

