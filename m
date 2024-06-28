Return-Path: <linux-i2c+bounces-4434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9491B622
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 07:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E293A1C22956
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 05:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F9A3CF4F;
	Fri, 28 Jun 2024 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URWNnbeE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2BD2D05E;
	Fri, 28 Jun 2024 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552588; cv=none; b=baN39cJhxNUy0V1SYKCQGiRHaOY9wx1nrb6ri+D9Snszon4KOsUcW1+yF3cDdmkSs6Z93Ze2n4Bwz0BACAQigCNB2qTvz3YgR223TgXLERIQeGIDA0bLPUM1OjfqV4M0wXaPfKJAH00jTqHIROGovWP4VI3qQwi2RuABlLcdv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552588; c=relaxed/simple;
	bh=MuOWgcJQOSUBmO2Vy37Xg7xftpXiU+ZC8r+Ven/mpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1ZLqlbbLF+/AlohTkaUWS3IpnlNfQonzd7N2wEYVxy56PhDPs9UodM3HH2y53YxSUTBReq9Huj/P3nTHbm+JN1BaKzvtijjXnBqe8Qn1yLjFUhtN8cFFX6PeWKfQg308uMAWq0atbbaRrWxIRwV8X0gKjk9Zj0c1+VIRO+qKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URWNnbeE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719552587; x=1751088587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MuOWgcJQOSUBmO2Vy37Xg7xftpXiU+ZC8r+Ven/mpw4=;
  b=URWNnbeES5n+B6OWdZfGcITG4kkZGUcGMnMbyQN5SWruZk4yUiSDgqN0
   YNT2NdXA2AYXCyr5qCi5aoj0sZo3ceXgSarl2PQEM/n3JWubfi3uNUinx
   iIVIw4GG+YFe+HMs8obzdfgtK/xWKCY3LBg+J0qol4lEVfMvW8i7Lih8h
   oAWAYjV2e8vC1uZSmzwBC+rtQZmePybw6rnmRMlEbD5dqBMXdkMM6txgk
   aVs+OIYGSuT6tjqQbNa4KX9x63cjKJlr70IRghpP+qNVUrlfx7LrGKX3T
   pFgUWlDfPK/Rw7PG3N0XX5ZUOu563Wd7amnJVt0NEVtE8E1xn5kgUf/sl
   A==;
X-CSE-ConnectionGUID: z9SLJq7CQdGYRBlHqGg69A==
X-CSE-MsgGUID: meu3jU/jTUy7ylbJ7x4yPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="19621229"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="19621229"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 22:29:46 -0700
X-CSE-ConnectionGUID: gIPGBZVMRcK+8kzmzM3kyw==
X-CSE-MsgGUID: 1rkE5azqT8KLfF+K4mIHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="49802219"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jun 2024 22:29:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN4B2-000Gpm-0Y;
	Fri, 28 Jun 2024 05:29:40 +0000
Date: Fri, 28 Jun 2024 13:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Vdovydchenko <keromvp@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: Re: [PATCH v2 2/2] hwmon: add MP5920 driver
Message-ID: <202406281339.YzOThRyw-lkp@intel.com>
References: <20240627090113.391730-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627090113.391730-3-xzeol@yahoo.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on next-20240627]
[cannot apply to robh/for-next krzk-dt/for-next linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Vdovydchenko/dt-bindings-hwmon-Add-MPS-mp5920/20240628-021125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240627090113.391730-3-xzeol%40yahoo.com
patch subject: [PATCH v2 2/2] hwmon: add MP5920 driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240628/202406281339.YzOThRyw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281339.YzOThRyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281339.YzOThRyw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp5920.c:26:9: error: 'pages' undeclared here (not in a function); did you mean 'page'?
      26 |         pages = 1,
         |         ^~~~~
         |         page
>> drivers/hwmon/pmbus/mp5920.c:27:9: error: 'format' undeclared here (not in a function)
      27 |         format[PSC_VOLTAGE_IN] = direct,
         |         ^~~~~~
>> drivers/hwmon/pmbus/mp5920.c:32:9: error: 'm' undeclared here (not in a function); did you mean 'tm'?
      32 |         m[PSC_VOLTAGE_IN] = 2266,
         |         ^
         |         tm
>> drivers/hwmon/pmbus/mp5920.c:33:9: error: 'b' undeclared here (not in a function); did you mean 'mb'?
      33 |         b[PSC_VOLTAGE_IN] = 0,
         |         ^
         |         mb
>> drivers/hwmon/pmbus/mp5920.c:34:9: error: 'R' undeclared here (not in a function)
      34 |         R[PSC_VOLTAGE_IN] = -1,
         |         ^
>> drivers/hwmon/pmbus/mp5920.c:44:9: warning: excess elements in struct initializer
      44 |         m[PSC_TEMPERATURE] = 1067,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:44:9: note: (near initialization for 'mp5920_info')
   drivers/hwmon/pmbus/mp5920.c:45:9: warning: excess elements in struct initializer
      45 |         b[PSC_TEMPERATURE] = 20500,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:45:9: note: (near initialization for 'mp5920_info')
   drivers/hwmon/pmbus/mp5920.c:46:9: warning: excess elements in struct initializer
      46 |         R[PSC_TEMPERATURE] = -2,
         |         ^
   drivers/hwmon/pmbus/mp5920.c:46:9: note: (near initialization for 'mp5920_info')
>> drivers/hwmon/pmbus/mp5920.c:47:9: error: 'func' undeclared here (not in a function)
      47 |         func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
         |         ^~~~
   drivers/hwmon/pmbus/mp5920.c:47:9: warning: excess elements in struct initializer
   drivers/hwmon/pmbus/mp5920.c:47:9: note: (near initialization for 'mp5920_info')


vim +26 drivers/hwmon/pmbus/mp5920.c

    24	
    25	static struct pmbus_driver_info mp5920_info = {
  > 26		pages = 1,
  > 27		format[PSC_VOLTAGE_IN] = direct,
    28		format[PSC_VOLTAGE_OUT] = direct,
    29		format[PSC_CURRENT_OUT] = direct,
    30		format[PSC_POWER] = direct,
    31		format[PSC_TEMPERATURE] = direct,
  > 32		m[PSC_VOLTAGE_IN] = 2266,
  > 33		b[PSC_VOLTAGE_IN] = 0,
  > 34		R[PSC_VOLTAGE_IN] = -1,
    35		m[PSC_VOLTAGE_OUT] = 2266,
    36		b[PSC_VOLTAGE_OUT] = 0,
    37		R[PSC_VOLTAGE_OUT] = -1,
    38		m[PSC_CURRENT_OUT] = 546,
    39		b[PSC_CURRENT_OUT] = 0,
    40		R[PSC_CURRENT_OUT] = -2,
    41		m[PSC_POWER] = 5840,
    42		b[PSC_POWER] = 0,
    43		R[PSC_POWER] = -3,
  > 44		m[PSC_TEMPERATURE] = 1067,
    45		b[PSC_TEMPERATURE] = 20500,
    46		R[PSC_TEMPERATURE] = -2,
  > 47		func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
    48			PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
    49			PMBUS_HAVE_TEMP,
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

