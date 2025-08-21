Return-Path: <linux-i2c+bounces-12368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF046B3007E
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 18:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07ADE173CDF
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD3B2DE70D;
	Thu, 21 Aug 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zxv7yK+X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB94C35948;
	Thu, 21 Aug 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795012; cv=none; b=o8i7bOxStIgv7hk+3U3D5o29LPtHMV8ajELnN3VXJshg0Ytr/je3uOVSyLhEykRvqKQ/QEED8YTmCO0e7mGY5NDf3QA5GCjOx0rWKYZJ1e2dqtGR209KpnRTaW4rOepu5FbMuWG6EwvUhSNt4o9Kr9f8dRVJaXRM2ldtoL1MZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795012; c=relaxed/simple;
	bh=v3m5zz42i8Tij/glsnCHR88bo+7AVbLqdPFWYR8LrZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWdgDmrcyJim5CNHEKdiDS/V4SCUYBQIGQC8M2KoDuuTQcRUUqUKpHEDHE3BESom/P943AZ+tLjYwd2zvjttPX7tuMHqa+wuZCs3r6L2zQ8zvMmLs3AIY2m4B20QXkqNH4n6rhK6MrNPqiDdURuEoiE9ORDxjxQm/p4wAtuYHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zxv7yK+X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE76EC4CEEB;
	Thu, 21 Aug 2025 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755795012;
	bh=v3m5zz42i8Tij/glsnCHR88bo+7AVbLqdPFWYR8LrZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zxv7yK+XvmuhovWq7U1YUiDemKdFKnpvK8YYNgk1n1FiVPKdMMqhsYIQd1F1p2Tia
	 Ag+wp+JaF40KkI7XsZbZZu2ZPUrKBZ7aEGngUYPQpWFQFKSKGMzi8R781zg1r0k3F5
	 9PRNRwdbTvwjEKYsS7ayedbhBF1LP2gawgMqqrYvLf/T2DSepg5s6XseZ0zjAh68oc
	 IivHkeZ7Ne6dH4dl3jHIsi9K5eMKw7A/J8mU1lGbzX+cT/DmoD1XsYO47alMwTQxzV
	 Lves2J4vlQfaXv/Prk2NZSOcIvF6XFd8dhE53iqpkWU0OY2Z02l/pgqktAXAadqSDm
	 rzlw1rFW+JExQ==
Date: Fri, 22 Aug 2025 00:32:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKdKOa1jFXDHK8uI@xhacker>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
 <aKX4xEYE29JC_g14@xhacker>
 <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
 <aKcYw0Az1fYfNbBr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKcYw0Az1fYfNbBr@smile.fi.intel.com>

On Thu, Aug 21, 2025 at 04:01:55PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 21, 2025 at 03:45:43PM +0300, Jarkko Nikula wrote:
> > On 8/20/25 7:33 PM, Jisheng Zhang wrote:
> > > On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> > > > > This is unsafe, as the runtime PM callbacks are called from the PM
> > > > > workqueue, so this may deadlock when handling an i2c attached clock,
> > > > > which may already hold the clk_prepare mutex from another context.
> > > > 
> > > > Can you be more specific? What is the actual issue in practice?
> > > > Do you have traces and lockdep warnings?
> > > 
> > > Assume we use i2c designware to control any i2c based clks, e.g the
> > > clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
> > > mutex, then we call i2c adapter to operate the regs, to runtime resume
> > > the i2c adapter, we call clk_prepare_enable() which will try to get
> > > the prepare_lock mutex again.
> > > 
> > I'd also like to see the issue here. I'm blind to see what's the relation
> > between the clocks managed by the clk-si5351.c and clocks to the
> > i2c-designware IP.

The key here is: all clks in the system share the same prepare_lock
mutex, so the global prepare_lock mutex is locked by clk-si5351
.prepare(), then in this exact .prepare(), the i2c-designware's runtime
resume will try to lock the same prepare_lock again due to
clk_prepare_enable()
can you plz check clk_prepare_lock() in drivers/clk/clk.c?

And if we take a look at other i2c adapters' drivers, we'll see
some of them have ever met this issue and already fixed it, such
as 

i2c-exynos5, by commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA
deadlock by keeping I2C clock prepared")

i2c-imx, by commit d9a22d713acb ("i2c: imx: avoid taking clk_prepare
mutex in PM callbacks")
> 
> I believe they try to make an example when clk-si5351 is the provider of
> the clock to I²C host controller (DesignWare).

Nope, the example case is using i2c host controller to operate the clk-si5351
> 
> But I'm still not sure about the issues here... Without (even simulated with
> specific delay injections) lockdep warnings it would be rather theoretical.

No, it happened in real world.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

