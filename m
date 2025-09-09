Return-Path: <linux-i2c+bounces-12814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D342FB5052B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 20:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE5FD4E1B37
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 18:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60A735CEDC;
	Tue,  9 Sep 2025 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7WUnC/Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720DE35CED4;
	Tue,  9 Sep 2025 18:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442327; cv=none; b=S0/b7QAnQPrOkRZi/vmL+mdyp23PMDN41tjY1c7SxtNFvOkIc5TPN4w5jDBoZNx3JCH0YsaqD/xaW0mZGDdXd0sJVWAsv4AWIDFj+1RE0oyVFIovwfxLo2uGFEwFw2ejr0xQeSV5omRYfYAgdIGvu184aVdA3gmj7MrByq/KXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442327; c=relaxed/simple;
	bh=jP+QEcU702l7EMgJt/L66MErc+79C+UsveNcHCtgkgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBd3RpUhcRg6Q+/ZnDxAx8eibmnjHF1Q/U6ee+jz7gy+bqmeWHA1L8x4fruVreHUBXiz5iZ+pT7a3in5/P+iiNt7r5xduI4IgNPjrONgBpsKdI9vh5R9mjqnzohHhB7/RU/j9pXaH3x49B+Vw/zRPmOLW7Iir0wnW/BSW8yMjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7WUnC/Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757442325; x=1788978325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jP+QEcU702l7EMgJt/L66MErc+79C+UsveNcHCtgkgk=;
  b=Q7WUnC/QMWkxekBzCVOLmB3aYyLNeu5bDbDNaDXdZW0FF6Fp6Pg2SbrE
   8vl8PPJnv4/Jrd3G6t9FxcOEh0j87RCPIV3ZQWAmcscqrPMDGCB6/sM8s
   qaYYaA7jS8qIKCscg3yBDc+/DtmiZGSB2/8fvQE4nrEJxU6t5AR/Ea1z7
   HRY3T28bScLUsynLWQ4QRg0ETj94dgMdFz65qqTFf2h6qrYWk+LU+XNby
   /byNQB7K/XnqL7oPcwWDn1SjDIYvUEo6uOJgkGGhpJARYmWgb1i2n4v8g
   das2T6treSh9aDO2/YQq0KOYeOD588NtCkPhSVe4mq+cTnI03N9BD/Cwa
   A==;
X-CSE-ConnectionGUID: XX6w4LNGTTSUpitmHHx9kQ==
X-CSE-MsgGUID: VbxkQ4axRj2L91EI5MMSSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63569054"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="63569054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 11:25:24 -0700
X-CSE-ConnectionGUID: ABg3IuvfQsWOZJ/S88AArw==
X-CSE-MsgGUID: aTfHsRBlTh+Cedlmx8R+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173552913"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2025 11:25:21 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw31r-0005Al-0r;
	Tue, 09 Sep 2025 18:25:19 +0000
Date: Wed, 10 Sep 2025 02:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: exynos990: Add UART nodes for PERIC0/1
Message-ID: <202509100100.bccnVSbn-lkp@intel.com>
References: <20250907-perics-add-usinodes-v2-6-58f41796d2d3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-perics-add-usinodes-v2-6-58f41796d2d3@gmail.com>

Hi Denzeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 98ee0e036cfedf543c4728a604fd7870d0000efd]

url:    https://github.com/intel-lab-lkp/linux/commits/Denzeel-Oliva/dt-bindings-soc-samsung-exynos-sysreg-Add-Exynos990-PERIC0-1-compatibles/20250908-061748
base:   98ee0e036cfedf543c4728a604fd7870d0000efd
patch link:    https://lore.kernel.org/r/20250907-perics-add-usinodes-v2-6-58f41796d2d3%40gmail.com
patch subject: [PATCH v2 6/8] arm64: dts: exynos990: Add UART nodes for PERIC0/1
config: arm64-randconfig-003-20250909 (https://download.01.org/0day-ci/archive/20250910/202509100100.bccnVSbn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100100.bccnVSbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100100.bccnVSbn-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/exynos/exynos990.dtsi:517.4-5 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

