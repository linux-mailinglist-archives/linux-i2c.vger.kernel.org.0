Return-Path: <linux-i2c+bounces-7858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE69BF583
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 19:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43DAB1C21968
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 18:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDD1208233;
	Wed,  6 Nov 2024 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh7nRh21"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14CF176AC8;
	Wed,  6 Nov 2024 18:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918739; cv=none; b=ZrEzjZ42fAKqOuA3TlNntLm2r2zjmvoAGATAVi/Y7cM3awTGyAIe1Sfl0lhT+abhecX/KeRj++c3fA09+w6DCCyB6wzG9zDLy9Ml5riXjRR1iAjsQHeVafg9ZII2YN55w4TA2SGojs/NkiAK99yoCDvIXfxHxXX6ShutwynZMho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918739; c=relaxed/simple;
	bh=ts1jeFGgXcWV69i9NnWPLiE0tUfahZCCkXmefsTxWgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7HVC/UEclp8FDILpTnXgNNRmnAXBEmn3B6IOmHd6dLgh8sdb0fWyo1Yvs3ymG5EEft3S58qgxkfeU4eereKWpGFn5FRv7b/+TFB4ZevhLoP5biTH6Wz7ejZFo2LIefVU3WKoBwGQKE0mopEhNpK/JuW57OVuSphQfY09n92S9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh7nRh21; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730918738; x=1762454738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ts1jeFGgXcWV69i9NnWPLiE0tUfahZCCkXmefsTxWgY=;
  b=bh7nRh2170HNYGvim2MXS0Y38/7pgoqHo5PH1zBNbrzRITDQVod8/ApX
   CpDguNMJJxskle7iiYhjdTGbsWVMiMts2r9pKWrRVfVXY7xWGXECf3mJc
   MhxHdRsJzZ042Q4efMi77mgpcOCLZTeMrQ3bLoPqvF/x7VapiFbF7CIvr
   T9k9jiN6hLRdBW9K5UClO2CTv+zx60ybrBcXmwWYPoZmLU3tXuSBD8DGY
   8LGen66GUVqKhU2q1Iz/lst8UZ4JAX9PF5ZvaJDJBQKfBREkoOl97TAxv
   ivOXC9nETLtGlqbehtbjhUFuNKs0vgld8GNdb2sRMlAP2Jb+ydAUVhf0e
   g==;
X-CSE-ConnectionGUID: gvXxRNgwTlmGQ1k00yHR3w==
X-CSE-MsgGUID: B7Rvqnx6QS6CKZka/PtDew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41835385"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41835385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 10:45:37 -0800
X-CSE-ConnectionGUID: JXbIrWCESACS6phQ1AkCqQ==
X-CSE-MsgGUID: D5jfgmkXRwyWfuvgMCl/oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="85516951"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2024 10:45:32 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8l21-000pIy-2k;
	Wed, 06 Nov 2024 18:45:29 +0000
Date: Thu, 7 Nov 2024 02:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
	Lukas Wunner <lukas@wunner.de>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
 ltp8800-4a, and ltp8800-2
Message-ID: <202411070232.xrxV7tVx-lkp@intel.com>
References: <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 30a984c0c9d8c631cc135280f83c441d50096b6d]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-trivial-devices-add-ltp8800/20241106-111734
base:   30a984c0c9d8c631cc135280f83c441d50096b6d
patch link:    https://lore.kernel.org/r/20241106030918.24849-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a, ltp8800-4a, and ltp8800-2
config: x86_64-buildonly-randconfig-004-20241107 (https://download.01.org/0day-ci/archive/20241107/202411070232.xrxV7tVx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070232.xrxV7tVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070232.xrxV7tVx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/ltp8800.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/ltp8800.c:12:36: warning: unused variable 'ltp8800_reg_desc' [-Wunused-const-variable]
      12 | static const struct regulator_desc ltp8800_reg_desc[] = {
         |                                    ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/ltp8800_reg_desc +12 drivers/hwmon/pmbus/ltp8800.c

    11	
  > 12	static const struct regulator_desc ltp8800_reg_desc[] = {
    13		PMBUS_REGULATOR("vout", 0),
    14	};
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

