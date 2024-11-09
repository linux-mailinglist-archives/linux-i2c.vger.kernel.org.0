Return-Path: <linux-i2c+bounces-7908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AE9C2F76
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 21:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CA31C212F1
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 20:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180AF1A2544;
	Sat,  9 Nov 2024 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9iM346J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C919DF8D;
	Sat,  9 Nov 2024 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731183604; cv=none; b=rElUmIhXUS5xN3mHRTS2XpEIiDi4ZSf0PpYCT1QoKKUjiPsq6Jon/sNv3hiEpaC+aC7AMLy5t9yKw57RQBaGrRR3JG/+AB+MuFX6Npgc/IQ1cJhZaYwndVle3CLEuCIGCIfv3qNLmQF7JpT8mBqEpMgIEH7Pq+ZzHthQs293ve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731183604; c=relaxed/simple;
	bh=k1SNTfKh5aZYqQJx6ZACI0/uVQVUJ/Vb3beFxFxNBRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Prm/Zy/jF+J7T9A61EavfiXhrAQfnE2p0W+ehZtpcOZ1AVw8u1dKxzDN+rvxSJWomNQtiuXpV+xfE/B7CNNewUVzZGanWgv2ZFKtkj44XlAkazX03z1AioPalR2BlNrfWnSLmzViMJ32fbP1ExBJKeMkTM/OFgSiJmUXk47FqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9iM346J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731183603; x=1762719603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k1SNTfKh5aZYqQJx6ZACI0/uVQVUJ/Vb3beFxFxNBRs=;
  b=h9iM346Jh07psTvt723Ehfxo8bGbaRDhvkIIs1w+lgmiLb1/Qo70QZWC
   r4TCiUOHldMl1srcWaw0OnYgrY7zo+OvHHQzcEYfc5CmJJFQq9GJSblHX
   81AIDg99E8Hm3C5JR7qNx02Wax8KOrypr73sdECS/ZRB3Jy0fwX/4MFNd
   NR1ZLgKoCRvp268dapOxJm2qYjlNOBIGRcioP4IEK20otz9CmVNgTLHNV
   begCu6+Q8um0CXfzFdHbVF5GQK6GXSbMcQmuBlQuqX6czvTlpF/NPuUTL
   4TQclUbx6/p+E+CedluAU4aZ7C7jDrbojgxh+tUt8c/Fxj9PjcV5flACV
   Q==;
X-CSE-ConnectionGUID: 7OsTWqG6SZWsuZQS13RU4g==
X-CSE-MsgGUID: UwjUFuUXR6CmtW8sk2tzlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="33901674"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="33901674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 12:20:02 -0800
X-CSE-ConnectionGUID: EaNgekS5RXOF8qipqvVGCg==
X-CSE-MsgGUID: 8ujJZnVnS0eRwRiV/lCqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86090487"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 12:19:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9rw4-000sbe-0B;
	Sat, 09 Nov 2024 20:19:56 +0000
Date: Sun, 10 Nov 2024 04:19:43 +0800
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
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH 9/9] misc: add FPC202 dual port controller driver
Message-ID: <202411100412.QeOt1w0W-lkp@intel.com>
References: <20241108-fpc202-v1-9-fe42c698bc92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-fpc202-v1-9-fe42c698bc92@bootlin.com>

Hi Romain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/dt-bindings-misc-Describe-TI-FPC202-dual-port-controller/20241108-234053
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241108-fpc202-v1-9-fe42c698bc92%40bootlin.com
patch subject: [PATCH 9/9] misc: add FPC202 dual port controller driver
config: openrisc-randconfig-r123-20241109 (https://download.01.org/0day-ci/archive/20241110/202411100412.QeOt1w0W-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241110/202411100412.QeOt1w0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100412.QeOt1w0W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/ti_fpc202.c:270:20: sparse: sparse: symbol 'fpc202_atr_ops' was not declared. Should it be static?

vim +/fpc202_atr_ops +270 drivers/misc/ti_fpc202.c

   269	
 > 270	struct i2c_atr_ops fpc202_atr_ops = {
   271		.attach_addr = fpc202_attach_addr,
   272		.detach_addr = fpc202_detach_addr,
   273	};
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

