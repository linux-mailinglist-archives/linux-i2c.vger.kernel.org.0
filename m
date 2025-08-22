Return-Path: <linux-i2c+bounces-12388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35E6B3258D
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Aug 2025 02:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7E2C6222C0
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Aug 2025 00:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1017F79FE;
	Sat, 23 Aug 2025 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXnDpWft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48463B9;
	Sat, 23 Aug 2025 00:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755907738; cv=none; b=XIpmepI1+irK/b65M8dYp51OHmwmzO5giZFVs3MXS8LLyUGyX+0oCmA92rxD0AuBzWLzO6b0bLGV8gKPs66AYCEAyr72P9DDXW4Qwyn6+ky/3lHoajk4y9f4xfavH0OpbsYqSgEpMnD9qFtwCFK6pkwlPWj3C+ZCPQTlgmslzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755907738; c=relaxed/simple;
	bh=OHLVldSEvpOKU6ViVH/A3lbMwY9KSL+2TO1MiXSUz7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvV12t9jOKIzvV+rLghHO0l6rY3dJMRe7SZreQ/v2lld7qfcO8JrDHZhLXyDufJ7023mXhQ89E14RbM0m9fXK+LyyicDsNsnGogxq1/UKUZOrsTk1eKeh2TeNhxnd/SXcTXvcG8F16DuDdKqTStObRhfIe3QmSTK+Trr72wlTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXnDpWft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D7AC4CEED;
	Sat, 23 Aug 2025 00:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755907738;
	bh=OHLVldSEvpOKU6ViVH/A3lbMwY9KSL+2TO1MiXSUz7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXnDpWftAdI36ikFvCKxk2uk6NBrvDpm/BmnSiJNZuUHa9XO0kvnzOerakVNjh5ff
	 KPUH4Hhxr3CVNtOxO5FUWWEvIaV025ggxDOsHE2mG0AXvg1CBu+D+ox/YwbVQhCZSW
	 T7v1xaerEJMPX9oy9KVjIS5RWUmLZSa8uNQNaAvqm06iEBUwFPNTJYFlNHFpO5REVd
	 5eUxA0htjkSVYcZALDarrIi6cNssxmP5c9WTMfnOQ8opzEQ73OYzmrD4oG7GnjLFfL
	 THDioeIpRT2hWoMDEk8+k9HJd4BYKL4v3ZpIZYJO4ozGCfLrxeoknXPsYCMLSTIXys
	 r7KE2QKGObEhw==
Date: Sat, 23 Aug 2025 07:51:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKkCjjez7jQNrieT@xhacker>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
 <aKX4xEYE29JC_g14@xhacker>
 <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
 <aKcYw0Az1fYfNbBr@smile.fi.intel.com>
 <aKdKOa1jFXDHK8uI@xhacker>
 <aKg18p9Zf9hoZHPY@smile.fi.intel.com>
 <aKg5j7hkxI2q1x0s@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKg5j7hkxI2q1x0s@smile.fi.intel.com>

On Fri, Aug 22, 2025 at 12:34:07PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 22, 2025 at 12:18:43PM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 22, 2025 at 12:32:57AM +0800, Jisheng Zhang wrote:
> > > On Thu, Aug 21, 2025 at 04:01:55PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Aug 21, 2025 at 03:45:43PM +0300, Jarkko Nikula wrote:
> > > > > On 8/20/25 7:33 PM, Jisheng Zhang wrote:
> > > > > > On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
> > > > > > > On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> > > > > > > > This is unsafe, as the runtime PM callbacks are called from the PM
> > > > > > > > workqueue, so this may deadlock when handling an i2c attached clock,
> > > > > > > > which may already hold the clk_prepare mutex from another context.
> > > > > > > 
> > > > > > > Can you be more specific? What is the actual issue in practice?
> > > > > > > Do you have traces and lockdep warnings?
> > > > > > 
> > > > > > Assume we use i2c designware to control any i2c based clks, e.g the
> > > > > > clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
> > > > > > mutex, then we call i2c adapter to operate the regs, to runtime resume
> > > > > > the i2c adapter, we call clk_prepare_enable() which will try to get
> > > > > > the prepare_lock mutex again.
> > > > > > 
> > > > > I'd also like to see the issue here. I'm blind to see what's the relation
> > > > > between the clocks managed by the clk-si5351.c and clocks to the
> > > > > i2c-designware IP.
> > > 
> > > The key here is: all clks in the system share the same prepare_lock
> > > mutex, so the global prepare_lock mutex is locked by clk-si5351
> > > .prepare(), then in this exact .prepare(), the i2c-designware's runtime
> > > resume will try to lock the same prepare_lock again due to
> > > clk_prepare_enable()
> > > can you plz check clk_prepare_lock() in drivers/clk/clk.c?
> > > 
> > > And if we take a look at other i2c adapters' drivers, we'll see
> > > some of them have ever met this issue and already fixed it, such
> > > as 
> > > 
> > > i2c-exynos5, by commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA
> > > deadlock by keeping I2C clock prepared")
> > > 
> > > i2c-imx, by commit d9a22d713acb ("i2c: imx: avoid taking clk_prepare
> > > mutex in PM callbacks")
> 
> > Why is this an I²C driver problem?
> 
> I just read these two and one more referenced from one of the changes.
> 
> I do not think this is a correct fix. Seems to me like papering over a special
> (corner case). I would agree on this change if and only if the CLK maintainers
> tell us that there is no other way.
> 
> My understanding is that the I²C clock and client's clocks (when it's a clock
> provider) are independent. There should not be such a clash to begin with. The
> clock framework should operate on a clock subtrees and not having yet another
> Global Kernel Lock.
> 
> That said, I think this is a design issue in CLK framework, we should not go and

After some thoughts, let me show you another case where this patch is
needed and not related with CLK framework at all: As can be seen in
patch2, atomic transfer support is added, but if IIRC, the
clk_prepare_enable() can't be used in atomic context. Then how to
support atomic transfer if patch1 is NAKed? Any comment is appreciated.

Thanks

> "fix" all the drivers. Today it's I²C, tomorrow SPI and I³C and so on...
> This is not a scalable solution.
> 
> Here is formal NAK until it will be worked with CLK maintainers to provide an
> agreed roadmap for this(ese) issue(s).
> 
> > > > I believe they try to make an example when clk-si5351 is the provider of
> > > > the clock to I²C host controller (DesignWare).
> > > 
> > > Nope, the example case is using i2c host controller to operate the clk-si5351
> > 
> > Okay, so that chip is controlled over I²C, but how their clocks even related to
> > the I²C host controller clock?! I am sorry, I am lost here.
> > 
> > > > But I'm still not sure about the issues here... Without (even simulated with
> > > > specific delay injections) lockdep warnings it would be rather theoretical.
> > > 
> > > No, it happened in real world.
> > 
> > Can you provide the asked traces and lockdep warnigns and/or other stuff to see
> > what's going on there?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

