Return-Path: <linux-i2c+bounces-12380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE3B313DF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 11:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7E417CEC5
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451722F83AB;
	Fri, 22 Aug 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rad/QOXv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E42F6563;
	Fri, 22 Aug 2025 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855327; cv=none; b=cpAm9e+N17utO6aHUuZ/Wm4nW5ZHUCuGBIGRv6+qehiKIyXg2FmlYZJN9kx1txKHqGRZA9JpzryFBBdklFadd2zaMBrNRV4xb9tivBSzT50FoszcHqppers2TZN2TenxqrrPStXtbHDqMRDnervjLuqxl6aehMfTXY5y0fb4pT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855327; c=relaxed/simple;
	bh=qDu/SQY7XNfb7wXX1KNgMVxauM7PS364rD4LQEeptMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3Un+N7JgDCcrKwrZZNhii8c3QnI6/Wm8+5ZHJV3Q1DU8mJFduhgp6gyD4JUmz7ufvAkEzcfUPp/WC+adiCjha9wwg+l58JBrux1o9JjHdrW3pn7IndeOuKnGN3o3m/tLbtt4IYEbNatPuqFrOkHRdKITdlY9bnPDz+wA8H8Q0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rad/QOXv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755855324; x=1787391324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qDu/SQY7XNfb7wXX1KNgMVxauM7PS364rD4LQEeptMI=;
  b=Rad/QOXvRC3YXE9MX2b+wseO7nWa7VRbMyAi5iftm6Zyxlq6GRzPNee3
   laaHOiNkWNap19uJ4JqEhl1rqysguAprDJznbg794S7mpqC9VBRcs8pcl
   WjXbX8EtN0JsJGlDVTZ6IEZcLUN/ZVACfWaniDjw0N+UdRCq93AfnNIhS
   /SHAQoceslD88gA5NPnxXzAp4TYZiguAzRf3x4zC1Y+YrRTp7o6E7NAae
   2i9rnmd8R3oV54eumBK0WRx5g21bYF4t78uumPeyk+HE/U7qVGCicVMOg
   wxx7TpOpPbYvacCF0vYhOCgB1wBlhtJqNMmI4iyjfZUBTSyGFO984xpwc
   A==;
X-CSE-ConnectionGUID: OrC3W6PhSo20nc7iYxJtdQ==
X-CSE-MsgGUID: /+W6eCNkSGKZO0ImMhapZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57361590"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57361590"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:35:23 -0700
X-CSE-ConnectionGUID: MfSCAGKOSVm1MumORhZBrA==
X-CSE-MsgGUID: 0dGuWGBTR/2gJTqy9wVnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168570870"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:34:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1upO9w-00000007TiU-0nD1;
	Fri, 22 Aug 2025 12:34:08 +0300
Date: Fri, 22 Aug 2025 12:34:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKg5j7hkxI2q1x0s@smile.fi.intel.com>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
 <aKX4xEYE29JC_g14@xhacker>
 <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
 <aKcYw0Az1fYfNbBr@smile.fi.intel.com>
 <aKdKOa1jFXDHK8uI@xhacker>
 <aKg18p9Zf9hoZHPY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKg18p9Zf9hoZHPY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 22, 2025 at 12:18:43PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 22, 2025 at 12:32:57AM +0800, Jisheng Zhang wrote:
> > On Thu, Aug 21, 2025 at 04:01:55PM +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 21, 2025 at 03:45:43PM +0300, Jarkko Nikula wrote:
> > > > On 8/20/25 7:33 PM, Jisheng Zhang wrote:
> > > > > On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
> > > > > > On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> > > > > > > This is unsafe, as the runtime PM callbacks are called from the PM
> > > > > > > workqueue, so this may deadlock when handling an i2c attached clock,
> > > > > > > which may already hold the clk_prepare mutex from another context.
> > > > > > 
> > > > > > Can you be more specific? What is the actual issue in practice?
> > > > > > Do you have traces and lockdep warnings?
> > > > > 
> > > > > Assume we use i2c designware to control any i2c based clks, e.g the
> > > > > clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
> > > > > mutex, then we call i2c adapter to operate the regs, to runtime resume
> > > > > the i2c adapter, we call clk_prepare_enable() which will try to get
> > > > > the prepare_lock mutex again.
> > > > > 
> > > > I'd also like to see the issue here. I'm blind to see what's the relation
> > > > between the clocks managed by the clk-si5351.c and clocks to the
> > > > i2c-designware IP.
> > 
> > The key here is: all clks in the system share the same prepare_lock
> > mutex, so the global prepare_lock mutex is locked by clk-si5351
> > .prepare(), then in this exact .prepare(), the i2c-designware's runtime
> > resume will try to lock the same prepare_lock again due to
> > clk_prepare_enable()
> > can you plz check clk_prepare_lock() in drivers/clk/clk.c?
> > 
> > And if we take a look at other i2c adapters' drivers, we'll see
> > some of them have ever met this issue and already fixed it, such
> > as 
> > 
> > i2c-exynos5, by commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA
> > deadlock by keeping I2C clock prepared")
> > 
> > i2c-imx, by commit d9a22d713acb ("i2c: imx: avoid taking clk_prepare
> > mutex in PM callbacks")

> Why is this an I²C driver problem?

I just read these two and one more referenced from one of the changes.

I do not think this is a correct fix. Seems to me like papering over a special
(corner case). I would agree on this change if and only if the CLK maintainers
tell us that there is no other way.

My understanding is that the I²C clock and client's clocks (when it's a clock
provider) are independent. There should not be such a clash to begin with. The
clock framework should operate on a clock subtrees and not having yet another
Global Kernel Lock.

That said, I think this is a design issue in CLK framework, we should not go and
"fix" all the drivers. Today it's I²C, tomorrow SPI and I³C and so on...
This is not a scalable solution.

Here is formal NAK until it will be worked with CLK maintainers to provide an
agreed roadmap for this(ese) issue(s).

> > > I believe they try to make an example when clk-si5351 is the provider of
> > > the clock to I²C host controller (DesignWare).
> > 
> > Nope, the example case is using i2c host controller to operate the clk-si5351
> 
> Okay, so that chip is controlled over I²C, but how their clocks even related to
> the I²C host controller clock?! I am sorry, I am lost here.
> 
> > > But I'm still not sure about the issues here... Without (even simulated with
> > > specific delay injections) lockdep warnings it would be rather theoretical.
> > 
> > No, it happened in real world.
> 
> Can you provide the asked traces and lockdep warnigns and/or other stuff to see
> what's going on there?

-- 
With Best Regards,
Andy Shevchenko



