Return-Path: <linux-i2c+bounces-3138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E658B1E42
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5275BB271A3
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228FD84FA2;
	Thu, 25 Apr 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKAUpUqN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8905584D3B;
	Thu, 25 Apr 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714038146; cv=none; b=RtUC/YjjyASYM8tlQ1ryNYKaNaVHNv+nkgnuLV7UK5SZyopOLDbrFVCoeuInm4HLI9yABZHDd59mU6P3DU4ZRCYUBKnuj8iOSPH7z8cPtdN55ZhIHyBJoEJJ+8inXXthLfHsPGvLIOsbXTyFzU84gaDCeMLvP9scoBz/wgBipMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714038146; c=relaxed/simple;
	bh=lnMOWh/JzwrvYbxxMcQCVB95Qapi9p3Hv3Alg2mH8yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCoRd2zZI1kfJ0hS/pBrXTrlGujuRJwBzuWipTq9J8ABHIwBXSbMIanWBZuiMH8XyLU6z1FZbeo5NUj5OiYoOf3v3qHG0i6dCSf6H1vgyLwEVrAcrfaeka0gxllN0d/4Fi0ggM8L7xrLUEB/PfpONwksYvwmCmOmKaGnzR28CD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKAUpUqN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714038146; x=1745574146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lnMOWh/JzwrvYbxxMcQCVB95Qapi9p3Hv3Alg2mH8yE=;
  b=jKAUpUqNdNePjWfovaC4cYXDrm778qNaZlC0vsSqOPvV9N+GJhQ1fJVz
   GKzq4eHYLxpeDMnRDExGuHIWgNf/DNq609p3Rnphe7MA1VvmvAxg1h/uN
   sxqIrOJkd2hyeM1JYlz2HArjNJTJZ7LrK06DIv/gqU3QGQ1QWLSAaiG6+
   wG8jtSVXafPQh0CJpcE0IR3W4KMlSkRKWut5ty4RgBFPnR73qxWNT/7kY
   gZYWP1TaMjzagQE0xUI0hGe0RqoK7+aTVaUd+yoFw4f+tPzaw/rMEyVuW
   8MSLw2lUoFYhYnE1wOS+xMt2e3TRxVZQR9VnSpMIMGwn+2PmoNbM6BCmM
   g==;
X-CSE-ConnectionGUID: ChP4KVsKS2SbGPlSFY0vXQ==
X-CSE-MsgGUID: ZPH0inqYTYWV9iDo2bW7RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9561215"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9561215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:42:25 -0700
X-CSE-ConnectionGUID: jYqQxlKNR1e0XTsLqbTyqg==
X-CSE-MsgGUID: dDLB5tskQ+Kr44CO8fkS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25639133"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:42:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzvcP-00000000x0K-0KsB;
	Thu, 25 Apr 2024 12:42:17 +0300
Date: Thu, 25 Apr 2024 12:42:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] mfd: intel_quark_i2c_gpio: Utilize
 i2c-designware.h
Message-ID: <ZioleGboe_YYtm3d@smile.fi.intel.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
 <20240425002642.2053657-4-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425002642.2053657-4-florian.fainelli@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 24, 2024 at 05:26:41PM -0700, Florian Fainelli wrote:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.

...

> +++ b/drivers/mfd/intel_quark_i2c_gpio.c
> @@ -17,6 +17,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/dmi.h>
>  #include <linux/i2c.h>

> +#include <linux/platform_data/i2c-designware.h>

Make it a separate group after linux/* ...

>  #include <linux/property.h>
>  

...here.

...

> -#define INTEL_QUARK_I2C_CONTROLLER_CLK "i2c_designware.0"
> +#define INTEL_QUARK_I2C_CONTROLLER_CLK I2C_DESIGNWARE_NAME ".0"

I'm not fan of this, but I think creating another macro to help with
constant device instance naming might be more cumbersome and overkill.

-- 
With Best Regards,
Andy Shevchenko



