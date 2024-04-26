Return-Path: <linux-i2c+bounces-3183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3578B2DF3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 02:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7EF1F21D44
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 00:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3EC7EC;
	Fri, 26 Apr 2024 00:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyThxWPi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73F365;
	Fri, 26 Apr 2024 00:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714090949; cv=none; b=IKOifIr6Fao4+lvdrMz8lwDChZtBdqQrwrKQf/Uk14zs95rue+yxGnyiXwMSWLY4CBqli+olMiRlQOBHJSQ6ivJ5SVxE/d9QQu3xZkonfMYIvDB0FTqcFBEmat0l9j+guThmByU2nmvZq+tjkVbI9xQZT14p7EKjBIPE5dUxQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714090949; c=relaxed/simple;
	bh=6pB7q7nmDjgq8t4EpI8naTsCxD3cIOJ6KhiwmNr1Bq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlZsyLKkk4fQiqQC2QoVML/bj0SjicWf0g49FsmTT2VWctzg49A3RJYBh2wZB1XUGNeRpm4qGxIxdXFDbMcPWz6xw2o1XXlo2lr2iZeWUjCNMTsf3+K1aaims6VOxIRmrtbnW5LZWazpzNeQPk6r3zMrtkr6wN9CUs8Z4NN1KtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyThxWPi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714090948; x=1745626948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6pB7q7nmDjgq8t4EpI8naTsCxD3cIOJ6KhiwmNr1Bq4=;
  b=QyThxWPiQKuTjBYMcGeS05k+ioM8vkyxfbrEtl/9Wr07BmRd01Cz5LMU
   FLaxFYKCVMY/LhUEA62stGlJrbBKzOOayw036iWuX8tLrr+r9xiJbwrrk
   7HITF2Pu8idA3bx5jEhDKLbSLEhiaNIiWduoOKFL5o30yrz1rLilECHSB
   vHiY+WqhL7/GAQZS6A0FSX7naO2f9Lh+oTDGCJtS5GXemJPPOyqtfTWae
   crNowMuushCfmcGnbNoQsZxit5A85A40tqKPWvqiuJF0ChardEhK9T7aL
   v5wvGzJrMl1Xuyu+IqQXK41S6daMusQC9DGwJyqvewn95HCYLVUOrXId/
   Q==;
X-CSE-ConnectionGUID: J55VZdZISHGsY6Jg7YkYpQ==
X-CSE-MsgGUID: wSV+YoUHTN29BMcy4+Hzow==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9668945"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9668945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 17:22:27 -0700
X-CSE-ConnectionGUID: RNJ53kYiS+m+b6R3HCJXeA==
X-CSE-MsgGUID: 6/3RjcZaRi+Rr+ZheRQpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="56191111"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 17:22:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s09M4-00033g-33;
	Fri, 26 Apr 2024 00:22:20 +0000
Date: Fri, 26 Apr 2024 08:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, eajames@linux.ibm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: Re: [PATCH v3 10/14] dt-bindings: i2c: i2c-fsi: Switch to yaml format
Message-ID: <202404260842.hNo9YEmT-lkp@intel.com>
References: <20240425213701.655540-11-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425213701.655540-11-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240424]
[also build test WARNING on linus/master v6.9-rc5]
[cannot apply to robh/for-next broonie-spi/for-next andi-shyti/i2c/i2c-host v6.9-rc5 v6.9-rc4 v6.9-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-spi-Document-the-IBM-Power-SPI-controller/20240426-054336
base:   next-20240424
patch link:    https://lore.kernel.org/r/20240425213701.655540-11-eajames%40linux.ibm.com
patch subject: [PATCH v3 10/14] dt-bindings: i2c: i2c-fsi: Switch to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20240426/202404260842.hNo9YEmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260842.hNo9YEmT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-fsi.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

