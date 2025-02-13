Return-Path: <linux-i2c+bounces-9425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF191A33FD0
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A853AB5BB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 13:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860C723F403;
	Thu, 13 Feb 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehw7sZCa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB523F400;
	Thu, 13 Feb 2025 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739451885; cv=none; b=oiBSdEo6L23Su5vAT24W0+dnonZ1dUxdT3C0cxvkZHWLLa5CPkdGyd8aTCRw7PMFucQ6/EXqWTdD1ECzlRblA2EYp0WH2GFxhLQhBcCYFDZyk634fLCNgMLycbdwZ4oz3WUZ0ZTAOyC6W8pEKkpS1xSdRVhHhOom6GORvaaPiH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739451885; c=relaxed/simple;
	bh=1ao/hLWrKoa83auIAZK5YxLztQb4shphbE+wPtgggOw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8ro+p5zpJTx+3yIpgG6CtW0jP1G6gKVqUWTWfY/0sOoNQVIRdv/UOjIPiwPCBjXl8Ez5RO2yOsHzkdFEE87ONJmzk8KLsksA5ClqqiKhEhgdnUrHVz9+LX0VAzyyMUmnYZX6dTBxfJFX1GmDl2NmOkHLZu768rTOyWNbi60NnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehw7sZCa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739451884; x=1770987884;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=1ao/hLWrKoa83auIAZK5YxLztQb4shphbE+wPtgggOw=;
  b=ehw7sZCaFPN8vo+vcxwqRsGX2LcEmDHVvaOPUZqy4nJ414sKxosrlsfn
   C9IpP5yxdds95pgCt7/E04ihnetxQELcq6l8Us51jxtToe+t//sbAS3IA
   tpbWvpmYHJ8Ow6D9MCQhsjzDyFoURO8pgTigFusyyZdOGos9BB6FrB87C
   QGP94Fp4u0cNI+SihnAZVpPUMWq+FGZC96moLLKbena07hAJjXuTJVKwx
   OhMc86V8QsmS5/jJzv779jXPOBMd4ikVQtGJQWGYooBfRvGOEhpqms/zZ
   vnzgmDM8hUuv58ypF+yfUkwl4nqc81nBPRPvXNmPP7Ork/YjfQripKJLB
   A==;
X-CSE-ConnectionGUID: 0p+L1U/wRleR1huBOEpSCA==
X-CSE-MsgGUID: mVPUQjgWR2KXFl3SEVZoZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62620706"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="62620706"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 05:04:44 -0800
X-CSE-ConnectionGUID: +jlj1GxVRC2wIJFPhxSM/g==
X-CSE-MsgGUID: 94nDy0MzRWeyG3Eoe5LYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112975678"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 05:04:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiYtQ-0000000BATf-1YMb;
	Thu, 13 Feb 2025 15:04:36 +0200
Date: Thu, 13 Feb 2025 15:04:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z63t5KcQ6tq5uDG3@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
 <Z63DT_XdzEWrP4eR@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z63DT_XdzEWrP4eR@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 11:02:55AM +0100, Wolfram Sang wrote:
> 
> Just a generic comment: please don't spend too much energy on 10-bit
> support. I have never seen it used in the wild. It seems more like an
> academic excercise.

Just for the record, AFAICS nomadik, octeon-core, qup, and maybe others
(that are not covered in the series) have bugs for 10-bit address mode.

FWIW, I2C_M_TEN is mentioned in a dozen of drivers outside of
i2c subsystem folder.

-- 
With Best Regards,
Andy Shevchenko



