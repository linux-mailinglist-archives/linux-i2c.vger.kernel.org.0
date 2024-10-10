Return-Path: <linux-i2c+bounces-7321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3747998805
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 15:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B6A71F267EE
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B461CCB2A;
	Thu, 10 Oct 2024 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpCXqCns"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DA1CC8BC;
	Thu, 10 Oct 2024 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567625; cv=none; b=CwDyIfva4wQrd6B/pILiLvQ+XsaQfAJqzrW40xO+4h4PrCCuKNYjrXfz8b/w3dX2J58oY2Qzx8mRioyt6llQsKuz8g/FCyXHdNdWYdojwuoA7GWCgFIqfwJ7DbV4tRGpZpEioECAiEUNqqtEbkiI08gEXLaY7KKjkgi4qC9JZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567625; c=relaxed/simple;
	bh=sfahgSvO20tuszyXcjplQnhiPIH1X5txk1P6D/qzB7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEexmLyKwYLHZ2gYiYV6zoPAC3ZqJQmsNAZIoPfw1yVd4rWZYxjb5rgRmB2CaiEqzMz23WLpsI5jwlEzHx3b5NK/uugVKHtGuYIu3KkTP0VCMVoiUhGRPCMY+mcnFVswEkxWgWjlYzs3b2yK+Q09ZwYnhwT52ALq7kXpIPKoDEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpCXqCns; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728567624; x=1760103624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfahgSvO20tuszyXcjplQnhiPIH1X5txk1P6D/qzB7E=;
  b=bpCXqCnssldHi1Z74sJK8r12nYIzT6hc18dTrTV5LwKyFgLbs0e0LjNv
   c+9l9EL+ncg/v4aUDECtG4PuBVhPN+bpkFZQKBF7hj1MU+k38j1WrWkhX
   LgiuaYRi/XMXUz/oc01plVbIDfpeaInHkV7XFrIS+MI/DjF3Ut55VwQen
   mz6s1jPq+sHVNlIk6zGRk1YdQDVYei6JTv9OsfqKUUJ1kz+pT85DkJULq
   MJRQ9CkE8QfQWeS9knjPbKgUlX60HfBG9rBzVYdyQzmcxLzgcMIRXht2O
   c01bvQZVJ9lRrNz26WYaw7cf/RxnJCxZvyqdF9MqgTi9+vJIeqcvsoEu1
   g==;
X-CSE-ConnectionGUID: cWMgZoJbS+WVuapbMbvFTg==
X-CSE-MsgGUID: L7Ez3QCZR4C1HZt49b1H/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50461091"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="50461091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:40:23 -0700
X-CSE-ConnectionGUID: 6qJ+jMC/SH249H8sQKl5+A==
X-CSE-MsgGUID: wQZfN4DVSJqib9HV7c/yeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76504990"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:40:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytOp-00000001Y6Z-3aj9;
	Thu, 10 Oct 2024 16:40:15 +0300
Date: Thu, 10 Oct 2024 16:40:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZwfZP0LeqKobdbgK@smile.fi.intel.com>
References: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
 <202410051547.vOL3qMOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410051547.vOL3qMOc-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Oct 05, 2024 at 03:36:16PM +0800, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on v6.11]
> [cannot apply to andi-shyti/i2c/i2c-host v6.12-rc1 linus/master next-20241004]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20241002-150410
> base:   v6.11
> patch link:    https://lore.kernel.org/r/20241002070213.1165263-3-ryan_chen%40aspeedtech.com
> patch subject: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410051547.vOL3qMOc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
> >> drivers/i2c/busses/i2c-ast2600.c:437:41: error: implicit declaration of function 'get_unaligned_le16'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
>      437 |                                         get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
>          |                                         ^~~~~~~~~~~~~~~~~~
>          |                                         get_unalign_ctl
> >> drivers/i2c/busses/i2c-ast2600.c:441:41: error: implicit declaration of function 'get_unaligned_le24'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
>      441 |                                         get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
>          |                                         ^~~~~~~~~~~~~~~~~~
>          |                                         get_unalign_ctl
> >> drivers/i2c/busses/i2c-ast2600.c:445:41: error: implicit declaration of function 'get_unaligned_le32'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
>      445 |                                         get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
>          |                                         ^~~~~~~~~~~~~~~~~~
>          |                                         get_unalign_ctl

You need to add

#include <asm/unaligned.h>

_after_ other #include <linux/*.h> in the code.

-- 
With Best Regards,
Andy Shevchenko



