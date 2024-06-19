Return-Path: <linux-i2c+bounces-4117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2890F60B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 20:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C5131F22BC3
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 18:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E904C157E82;
	Wed, 19 Jun 2024 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKPo7ey+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81680157A4D;
	Wed, 19 Jun 2024 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821660; cv=none; b=XEMcDg5rXouaiY6Yn2x++O31UjDOLbBJjUthXASfUQqseQOblwaW89TWcpdhbljrhDJf9TawjExWxJd61se7iH9Cf68atZOunoduiWLk5GXvz5PIvZWsqnOKqvEjnirJ/Uc65XIGEdrBNH/HdSpD4POZrEYUEi9LsOZ9tp5W6Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821660; c=relaxed/simple;
	bh=ePMdXyYG5VP9699OyXIjL4DJdrxVOUDFWzBVFuvKuew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8Uin40rSTuFLEvQiyZ0Gv8ROrZIFEoegauLkl5vFtVntASELbr7ubUTeC5WFgPg8lcNdx6hgTGEmQcupyizAtHYYCKna6lB+30oRevmq3AFrmCmDXi8TDbEH3bYcOQilED536yCgEoXO4nV6R+WM37Rs1YrdfDF+gExK/Wz+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKPo7ey+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718821659; x=1750357659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ePMdXyYG5VP9699OyXIjL4DJdrxVOUDFWzBVFuvKuew=;
  b=fKPo7ey+64mhRqh0LZG8q3hHTtaABkBsorDxkDUrlPc0nyMZNq4qSlsi
   vWItodCl5Vhs4tXAcyPuOiy6pXzj8OfKtVgif5kwSFg9eHsWoAd92de8t
   q7ICPYWNl1GGRdtgSluqQjx3vhyV2cyzgOoiy0jitNFIPVYqxyfQ7Qg/W
   pA/zaK7Cb7ht9Q8GbY4S7Ub8oEDju2glkHVCCTL9StL3ZmtAZkVtlDuyO
   4J8jh77gZz5uOUOMSLnhwD9i9TO0/sC+I+Xv0Tz1ydcdlFHcbbnzylxVY
   +F53aUIzZT5GZu3HbJ1T8K1inlvcOuZCGhWYZQ9K32WWO9T08C0ZmpwC+
   A==;
X-CSE-ConnectionGUID: 5fFY+98JSWSE79vfkipGyw==
X-CSE-MsgGUID: GTmAuOeVRzyDYMzk0emgWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41178780"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41178780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 11:27:38 -0700
X-CSE-ConnectionGUID: ILNZl8P+Q3GMl7+ZHFDZUg==
X-CSE-MsgGUID: nrkcKSQpRwmJ/hGixWRnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42697044"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2024 11:27:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK01s-0006s6-2H;
	Wed, 19 Jun 2024 18:27:32 +0000
Date: Thu, 20 Jun 2024 02:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: convert to dt schema
Message-ID: <202406200223.QexMAKqr-lkp@intel.com>
References: <20240619154941.144011-2-kanakshilledar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619154941.144011-2-kanakshilledar@gmail.com>

Hi Kanak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.10-rc4 next-20240619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanak-Shilledar/dt-bindings-i2c-convert-to-dt-schema/20240620-000339
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240619154941.144011-2-kanakshilledar%40gmail.com
patch subject: [PATCH] dt-bindings: i2c: convert to dt schema
reproduce: (https://download.01.org/0day-ci/archive/20240620/202406200223.QexMAKqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200223.QexMAKqr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

