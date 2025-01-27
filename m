Return-Path: <linux-i2c+bounces-9224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE8A1DD71
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 21:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8635188680C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 20:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCDF198A06;
	Mon, 27 Jan 2025 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmFsocao"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9E18FDA5;
	Mon, 27 Jan 2025 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738010152; cv=none; b=HCcVJV0vXZscl+IySJSscIsocFJJK/77VmRgIVPq8K2kMWdggHkY2fGw40GNxi42bcXYr2lLSDbMn8LKQd6tkTPdJds3A4a66LVMgYomoXuByV659b53bvJFGKmbJ/CkzS2pg9fTS0x2EQ/M94Xv7BAT7LqxJbVwFWdvuP6H3js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738010152; c=relaxed/simple;
	bh=5eMJRLtuqqyveoagaSTgOeIYAFsliPhaMbkd6gMZSaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEu3rInXD/qGKvYn0giBkSP7RrNEpTUt7Yduj4gRMXwJkPaa6AcIiYfXcKeGHNvaVE2CpI8Le4ttj72dGqEkQeVQdQc11iPKbb4RdDu6VM4aWXmEGlp6Linga2pdkFi5qve4eKWVDtORTEavpiGIdidXnkxvXH8Q1Ha/crACd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmFsocao; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738010151; x=1769546151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5eMJRLtuqqyveoagaSTgOeIYAFsliPhaMbkd6gMZSaU=;
  b=lmFsocaowAq5bsYdK4kIFzDgLldL7+9k6Z75UoOPuHBIu5V2VzCtyMdX
   VrAJDA1PxWdfyy5ytwvPMr1pOkGTBzJDeexhHG9JmxbOZR8898ZqsRypj
   p+aYqYsDXcWgCM2US3XzJuW72eQMYAKqmryo4BfEPQrLLufdxq4AiVdOG
   GUXxqYc5yMIaRivQmZinCtW/hJ/A1qYo5gonzF8aCOxlg5dpiaOEdk0Z0
   4CeoqnFyw1Dl0FBa9EKqcYlNDyfOyFcQCZ3mghnYUYAMrHq6rmdp0LWb/
   MD5wQpvOvG5wFevq3kBZuhN65u9iMQ8frcNGs+QuQPNJ1GLttQJdQHwlf
   Q==;
X-CSE-ConnectionGUID: /fsOZOB6QnKUhq5woy8ywg==
X-CSE-MsgGUID: ahXy+uORQL+lFQGzBMszaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63845729"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="63845729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 12:35:48 -0800
X-CSE-ConnectionGUID: 5guNiBOYQBmsRAtUYuMsUA==
X-CSE-MsgGUID: nc+loxkyS++liyYqNhESqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113171423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2025 12:35:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcVpf-000h8Z-0t;
	Mon, 27 Jan 2025 20:35:43 +0000
Date: Tue, 28 Jan 2025 04:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Message-ID: <202501280459.uH0yw7av-lkp@intel.com>
References: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a76539b293677c5c163b9285b0cd8dd420d33989]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-trivial-devices-add-lt3074/20250124-234209
base:   a76539b293677c5c163b9285b0cd8dd420d33989
patch link:    https://lore.kernel.org/r/20250124-upstream-lt3074-v1-2-7603f346433e%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250128/202501280459.uH0yw7av-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280459.uH0yw7av-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280459.uH0yw7av-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/lt3074.c:103:34: warning: 'lt3074_of_match' defined but not used [-Wunused-const-variable=]
     103 | static const struct of_device_id lt3074_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/lt3074_of_match +103 drivers/hwmon/pmbus/lt3074.c

   102	
 > 103	static const struct of_device_id lt3074_of_match[] = {
   104		{ .compatible = "adi,lt3074" },
   105		{}
   106	};
   107	MODULE_DEVICE_TABLE(of, lt3074_of_match);
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

