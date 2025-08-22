Return-Path: <linux-i2c+bounces-12378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94DB312B8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 11:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8131916D118
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFED27E1B1;
	Fri, 22 Aug 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktd8aYKR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137A6393DEB;
	Fri, 22 Aug 2025 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854329; cv=none; b=PG+oUmGb8d5wlySgDYTxaNkd3bX60LyzPR9xMpunv74MiL5yN1nRuZKjNtVoF4dwMDgkQewUZDbxqbpDyBrzT5wExbqT5fuQ8h6I5pV+IlxDxVKzJb7hF3UDaH6I7DrWC+4aZd48JWNaqHN+1hobc6cunttIBvVCLaZXsow2GJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854329; c=relaxed/simple;
	bh=NIpdp9OekrpNp2rZ9GhVB50+eI8Oq4q6tR5dIvGbyC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmBBgYNGBGZe48w9y/tpSYf7sFX+BACqnI+k1tGBK3pdTRLEIzj5froE6Zsz85kLNUcKBfIHo/sxcQPinHtEtMvpNBXvhJ2W9QwVsuNOVxBTTZ/925TmUbZgLIVdcZjfdBJKHKraTpWjSn1vcFd0z0fWwCrYX4pBh0f9t21uiTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktd8aYKR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755854328; x=1787390328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NIpdp9OekrpNp2rZ9GhVB50+eI8Oq4q6tR5dIvGbyC0=;
  b=ktd8aYKRdF5/notCIcB6op6npcINQeU0sUFlgI4pGwi21hSBpGBREmbD
   rtr81IMl2D0BKcRVY8WULB40611mfuNnqpu+eZ2hHPFoJ8YTLSMB3950k
   7KNDqsAHy6yMhP8+AMXVkw+LmMuNKbyvmAc/Fs9eaUM6Mmp1PX5XeZ9LN
   3LN6GbDa4hgw37KtjJmM+lWyEYGFWHyzlJMbQ4Z2ZJrG8Boa9IJPrgiVy
   Heo7ZPxBGy1fWybHLZnDtRcMi3Re07MQn0MCo9VtCh1ueP+bNeIAfvtic
   yATQduJEIneaCQBsY6ZG7az45YnbD27eqdbJ5nggqFE2YdI56V7Rt4WQL
   w==;
X-CSE-ConnectionGUID: /8nkCjQnT4iMuoYNXfvCRQ==
X-CSE-MsgGUID: AfxArNyvROC0qyvpcDni4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57873208"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57873208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:18:47 -0700
X-CSE-ConnectionGUID: X7egEtyZT8u9a8G7uqgYgA==
X-CSE-MsgGUID: V9GZmD+iTZGgwEth1N6OpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169489568"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:18:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1upNv1-00000007TWV-0Mrd;
	Fri, 22 Aug 2025 12:18:43 +0300
Date: Fri, 22 Aug 2025 12:18:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKg18p9Zf9hoZHPY@smile.fi.intel.com>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
 <aKX4xEYE29JC_g14@xhacker>
 <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
 <aKcYw0Az1fYfNbBr@smile.fi.intel.com>
 <aKdKOa1jFXDHK8uI@xhacker>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKdKOa1jFXDHK8uI@xhacker>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 22, 2025 at 12:32:57AM +0800, Jisheng Zhang wrote:
> On Thu, Aug 21, 2025 at 04:01:55PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 21, 2025 at 03:45:43PM +0300, Jarkko Nikula wrote:
> > > On 8/20/25 7:33 PM, Jisheng Zhang wrote:
> > > > On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
> > > > > On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> > > > > > This is unsafe, as the runtime PM callbacks are called from the PM
> > > > > > workqueue, so this may deadlock when handling an i2c attached clock,
> > > > > > which may already hold the clk_prepare mutex from another context.
> > > > > 
> > > > > Can you be more specific? What is the actual issue in practice?
> > > > > Do you have traces and lockdep warnings?
> > > > 
> > > > Assume we use i2c designware to control any i2c based clks, e.g the
> > > > clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
> > > > mutex, then we call i2c adapter to operate the regs, to runtime resume
> > > > the i2c adapter, we call clk_prepare_enable() which will try to get
> > > > the prepare_lock mutex again.
> > > > 
> > > I'd also like to see the issue here. I'm blind to see what's the relation
> > > between the clocks managed by the clk-si5351.c and clocks to the
> > > i2c-designware IP.
> 
> The key here is: all clks in the system share the same prepare_lock
> mutex, so the global prepare_lock mutex is locked by clk-si5351
> .prepare(), then in this exact .prepare(), the i2c-designware's runtime
> resume will try to lock the same prepare_lock again due to
> clk_prepare_enable()
> can you plz check clk_prepare_lock() in drivers/clk/clk.c?
> 
> And if we take a look at other i2c adapters' drivers, we'll see
> some of them have ever met this issue and already fixed it, such
> as 
> 
> i2c-exynos5, by commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA
> deadlock by keeping I2C clock prepared")
> 
> i2c-imx, by commit d9a22d713acb ("i2c: imx: avoid taking clk_prepare
> mutex in PM callbacks")

Why is this an I²C driver problem?

> > I believe they try to make an example when clk-si5351 is the provider of
> > the clock to I²C host controller (DesignWare).
> 
> Nope, the example case is using i2c host controller to operate the clk-si5351

Okay, so that chip is controlled over I²C, but how their clocks even related to
the I²C host controller clock?! I am sorry, I am lost here.

> > But I'm still not sure about the issues here... Without (even simulated with
> > specific delay injections) lockdep warnings it would be rather theoretical.
> 
> No, it happened in real world.

Can you provide the asked traces and lockdep warnigns and/or other stuff to see
what's going on there?

-- 
With Best Regards,
Andy Shevchenko



