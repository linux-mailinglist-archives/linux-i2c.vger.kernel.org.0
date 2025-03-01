Return-Path: <linux-i2c+bounces-9667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57757A4AD95
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 20:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02C6B7A5688
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 19:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42791E8328;
	Sat,  1 Mar 2025 19:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7Q4Iht7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F01D5CC1;
	Sat,  1 Mar 2025 19:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740859089; cv=none; b=AZNJd+LZNlxZhO4nAQOVo17+g18rh03S+nFWcJkmA9jxDPL3bPohntkCDpq04Fj9QGgr4tQXdGSBO5oPC77ipqjX7FiOuU3g9YiGMJR1D6+d4i6z6ymMr0ZXfYc7S87uF0zr725kI3tggti5YkFQPOBHCEWCXznJ16AE4TtuAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740859089; c=relaxed/simple;
	bh=1kXOODhLAUkS5r63DpG3FgIzbhFGutGGj4xV09heVMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rxdrck0hcr4RLouDeF6uY+jC2BAGufjCBH30UTrp08HRQmdgLeQMF1+8jG30DRv0d2Q6DEBI0zOwF8OBMO7am61e2Tc4MoYx5W3RetEoJXjGIoJNe7fYoQdkYTiK3zRrgaWQX+lFf3Uyyaeon6CD99FbNgl5AOye/13sWHMD3w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7Q4Iht7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740859088; x=1772395088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1kXOODhLAUkS5r63DpG3FgIzbhFGutGGj4xV09heVMQ=;
  b=n7Q4Iht7QMXxRTuAIcruC829f+i/+mXMFQp+dcycIp6xWJMXvZlNpXgn
   hE/+ELCHWjAIbft91gxLCXQgqzN+50vBpA/MpH3j2ndG1x5V7SHsDciHc
   2/yY+F34o6HfgbC2eGVsojuCZQGzOzmcTTL91ug9pNRNgzq96gB4zARdZ
   OEhEz1CbnlmDvzUKEMRNnVVu1qCcp2fUsKaYI6SIbF01g2H45KHes+L7R
   JK8BZnlESR2omxbRN8ltCduEiEIUXo1wN6V6UBGYaA+RNyX4mMfR8jazf
   9RrtynWp6+YQK5MU/TCuKH2s1sBC8hGwfQvU1p8D0Y7xJRSXMgm3YiUKZ
   A==;
X-CSE-ConnectionGUID: haUuxvBwSRyWeFxDFHuguQ==
X-CSE-MsgGUID: dMIa7toOQnmUK5vyKZfSYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52411198"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52411198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:58:07 -0800
X-CSE-ConnectionGUID: 11KgZ0uWQ3mXA8i98mh4BA==
X-CSE-MsgGUID: 4zNv8ckBSLmocB33IVeD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="140859471"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 11:58:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSy7-000Gdy-1N;
	Sat, 01 Mar 2025 19:57:56 +0000
Date: Sun, 2 Mar 2025 03:57:49 +0800
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
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH v8 9/9] misc: add FPC202 dual port controller driver
Message-ID: <202503020332.nNQ19b98-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/dt-bindings-misc-Describe-TI-FPC202-dual-port-controller/20250227-182532
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250227-fpc202-v8-9-b7994117fbe2%40bootlin.com
patch subject: [PATCH v8 9/9] misc: add FPC202 dual port controller driver
config: nios2-kismet-CONFIG_I2C_ATR-CONFIG_TI_FPC202-0-0 (https://download.01.org/0day-ci/archive/20250302/202503020332.nNQ19b98-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020332.nNQ19b98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020332.nNQ19b98-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_ATR when selected by TI_FPC202
   WARNING: unmet direct dependencies detected for I2C_ATR
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - TI_FPC202 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

