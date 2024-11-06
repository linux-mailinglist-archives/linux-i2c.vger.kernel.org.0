Return-Path: <linux-i2c+bounces-7860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803719BF636
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 20:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37BB21F21528
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 19:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C95420ADC2;
	Wed,  6 Nov 2024 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cql7wZ3y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408FF209694;
	Wed,  6 Nov 2024 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730920721; cv=none; b=CY9EZiRj0kp+pe87mgq6L/qqNXZtK9OtIL1tLeszRh1EVIFgwGGLTvqL0WuUI3bxGlfzNEGQ5oQ2Ht+x3/pfylgb4Sg0m2SQCxItYRRj5HWwkSbCnTGS9pN7UhNfaGE6jawcRMefxSUxjhNHs2u08bbCnAVMSToJeRtwbcDZseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730920721; c=relaxed/simple;
	bh=PopP+TMYEu9u9Wtpj2ca/oZ+nG0S3JEZMtl8PKNU85c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lacDMb0usiUWu9pI0hn2a5yf4f8wONuw+HRD5/98i2CYm1LFfn6HKVyJCH+W8FehptKQEXRVWY4uDLfQPMmv/W60LGXc3Gt2/qO83C3asUmMqdT1qkAbvfQ3jrF54eWK0EDRCBQC1mPm4cOPv4+QeLDl//T7mf0eJveBjoH3uLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cql7wZ3y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730920719; x=1762456719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PopP+TMYEu9u9Wtpj2ca/oZ+nG0S3JEZMtl8PKNU85c=;
  b=cql7wZ3y2h7UgEQE9jPpCmO7dkvbcedDbde5kCDqPModxKpZDszqWNdC
   LaVPI9WpPmIh0eoTw08OxhWBYQTwofSWrjimUDVJzS0FLBXKYEFxyRDcE
   8D1B1U7aYhCZ+WAjXcfbG0JYLs+3ZiGavqroCXlWtpEcCvWhT1lENS3Zv
   6t1YoamTICFkda4HdugRQGwDDoVUzoQEUXLUH4zUkyo1/hJ142DMAiVZ0
   CNb6xBd7t5f+qD8bkNf2ftBlTHhCekBnuzRnJ0fadUt93kc+3GidB06l9
   OsnrtExjwzd7fOvou5MbAvMF2RqCQEOVqG77bJ4YBOS+DB2P0z6is75/t
   A==;
X-CSE-ConnectionGUID: 6pfU9YjSSuW4ADXO1LOgIQ==
X-CSE-MsgGUID: +P91PUOmRq2+VMKhYdnFJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30961539"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30961539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 11:18:38 -0800
X-CSE-ConnectionGUID: gWZquagcRye5wvJB1LztTQ==
X-CSE-MsgGUID: gPFRrxvATH+CgSbzbOJ1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89580837"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2024 11:18:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8lXz-000pKt-0k;
	Wed, 06 Nov 2024 19:18:31 +0000
Date: Thu, 7 Nov 2024 03:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
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
Message-ID: <202411070253.p3aIhGGg-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20241107 (https://download.01.org/0day-ci/archive/20241107/202411070253.p3aIhGGg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070253.p3aIhGGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070253.p3aIhGGg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/ltp8800.c:12:36: warning: 'ltp8800_reg_desc' defined but not used [-Wunused-const-variable=]
      12 | static const struct regulator_desc ltp8800_reg_desc[] = {
         |                                    ^~~~~~~~~~~~~~~~


vim +/ltp8800_reg_desc +12 drivers/hwmon/pmbus/ltp8800.c

    11	
  > 12	static const struct regulator_desc ltp8800_reg_desc[] = {
    13		PMBUS_REGULATOR("vout", 0),
    14	};
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

