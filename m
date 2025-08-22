Return-Path: <linux-i2c+bounces-12386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86FB31AFB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 16:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4041BA04B6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 14:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388732FDC31;
	Fri, 22 Aug 2025 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfR5e113"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53943054C5;
	Fri, 22 Aug 2025 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872035; cv=none; b=n3EktkpKienSgHcNhmvB0Vxt0YhFN/kySvArF4XvL+PHo9OVsLG7J4ffdqCuIIxgsTXL2gZ5X391sWxjCsDGnyJ/rSpSFeRl5NV/EXObGeeiM3FZ+oTMWkHlKV3QWe47zUa78YqUdcRMr6rEg4zGpl9GXyWNZg3bBqXg3/28uxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872035; c=relaxed/simple;
	bh=p5a7degfIw0dQZsZxxsvkoQCwnY6OhJE2U6FzHq3N6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8daS5I66NBClpj/Mwfvx5MP9BjhjS4vmcCacZy6bII0cAn6SrSXg90cb19RA9zqU5KvTnzgLqYTItANzO4S4E/IWNAD790c1v3KzJWNzOB/5BiVTwHJI+6qkbJoNRM6iFzWM5pEZdacdiiW+SDO0vWgjELcOsgdZ5UE7EJAUJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfR5e113; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AABEC113D0;
	Fri, 22 Aug 2025 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872034;
	bh=p5a7degfIw0dQZsZxxsvkoQCwnY6OhJE2U6FzHq3N6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfR5e113OergLD1D6mQfNAi67vZvuSnQ2SCuHyjiBfXC4Lrx7FP2CnOTgpRx7lNav
	 cBqjJp9tO+jX0LUirAxEFcM7+w7Gtk9RiOPLLiZOq3O+fPwboBVi4xXh9txiaA/OqU
	 mrVPfTisuNk/O2rviGhWlCgB0IzXDAqPrg79wJp9ZLuvmA4r4RzhBUU+iZE4EQqh+r
	 XcPR6MVD03qhX69VMv81Jnr8L1H+8u+lHO/4+/jG0Ob9uJOOP+xhfYC1nrNM5r9naJ
	 Enou61vI55SjWtM4xkrSgINKJxJltBw0KltDtFfuXYbuB8A9lUemyj3ZA39oncjgXU
	 xf1Pi9daOw9+A==
Date: Fri, 22 Aug 2025 21:56:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKh3FMgMVP20DvN0@xhacker>
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
> "fix" all the drivers. Today it's I²C, tomorrow SPI and I³C and so on...
> This is not a scalable solution.

The fact is there's no SPI attached clks. Current all clks are either
mmio based or i2c attached clks. And yep you're right, I3C has the same
problem if we use i3c controller to operate those i2c attached clks.

> 
> Here is formal NAK until it will be worked with CLK maintainers to provide an
> agreed roadmap for this(ese) issue(s).

+ clk maintainers

Hi Michael and Stephen,

If we use i2c designware adapter to operate the i2c attached clks such
as clk-si5351, then there's a deadlock issue -- This issue is well
explained by commit d9a22d713acb ("i2c: imx: avoid taking clk_prepare
mutex in PM callbacks")

I propsed a similar fix for the i2c-designware adapter, but Andy
disagree with this fix. Instead, he thinks the issue is from the clk
framework. Could you please comment?

Thanks

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

