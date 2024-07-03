Return-Path: <linux-i2c+bounces-4619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7282926B6B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 00:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23FE91C214B6
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 22:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80AE15538C;
	Wed,  3 Jul 2024 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re8ZOA5l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470B13D638;
	Wed,  3 Jul 2024 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045267; cv=none; b=FIbNVBlL+VzMTJIIusm8dWpY2YZicNEGuCwS5vrqt7GvJEvdOv9x2XFpZR5C07KdbH5prnGFGgSPMqULUejOe3Y4fYX5FfviTaQsGxrUXAowbnh31yXJA8oVla4lchyKZgFOtI73FQ2X9hA7qsAcAnVOi+KRMxcgQWyjbSeY868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045267; c=relaxed/simple;
	bh=XS9/SidMjh9Kd2T3+k4yeCAqwsKugEYswV4ero2y9vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKwcfVfjUwx0Hv1W5DPyN9Dva28sRch9d+8cRqhHyxUKuj+H4HXkaDaC1VTsKtonk7NTJzMTcl5rGEXJg+RxCUzJrpZNKHzQbsmODWhYMTv6Bw+5Qkbyk6/tl6fqglmu4/hZB6Sp+yJ9j34jbeABxV+y4ZT9OXIdBLCERKh8OKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re8ZOA5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71488C2BD10;
	Wed,  3 Jul 2024 22:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720045267;
	bh=XS9/SidMjh9Kd2T3+k4yeCAqwsKugEYswV4ero2y9vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Re8ZOA5lyb2svk5I+bE8qWBABVLZwOP8/Z4CrZIL4L53IBxaL4mtf7seZ5Ph1papn
	 q+66589596DEQQ2qFrrUNbHpCL5o+fggArKSgQxeXYcIJNLi9vJHJycSarG/C4m/xr
	 uSumfkrOFAcFVbsqGSJytwjRmtM/I7dkASR4oUvTVvKpZjasQumsMY3sx+3BHlysD6
	 VrZDzPCxlCzPQxe+QOsHH47nKw9anXhuPhi3pRvIH8n4T16hbjiaDnAL3mv0BVKCqU
	 ZPfE9v/1uDc5fJ677h7u/C5QlT2Z0J0kx+QqmwArOYSDDyG5NIWR4xWuTNdKNeIf22
	 5+gMmWsQMhIAA==
Date: Thu, 4 Jul 2024 00:21:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v6] i2c: pnx: Fix potential deadlock warning from
 del_timer_sync() call in isr
Message-ID: <cvpj5q2laopscchvwvndrl247tlkgyw7tw7nnpuevcs4g5qf52@hpruhtety5lt>
References: <20240628152543.281105-1-piotr.wojtaszczyk@timesys.com>
 <dudh4jdce3yxwv5yw345gw23diwparhwvsl4jrpsyzpv3sgge3@ojtdgsdgwcor>
 <CAG+cZ06sqDuOer=fBcGhQkTUgWt9XqaLkAW0cmT8g=EJ+e8pWA@mail.gmail.com>
 <otsopuw5pqpe637mywdoecnv5xhfhcny5xsxnwoyxhy7gj5yy6@3s43zn2udeei>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <otsopuw5pqpe637mywdoecnv5xhfhcny5xsxnwoyxhy7gj5yy6@3s43zn2udeei>

Hi Piotr,

On Thu, Jul 04, 2024 at 12:19:38AM GMT, Andi Shyti wrote:
> Hi Piotr,
> 
> On Tue, Jul 02, 2024 at 11:13:06AM GMT, Piotr Wojtaszczyk wrote:
> > On Tue, Jul 2, 2024 at 1:01 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > > @@ -653,7 +624,10 @@ static int i2c_pnx_probe(struct platform_device *pdev)
> > > >       alg_data->adapter.algo_data = alg_data;
> > > >       alg_data->adapter.nr = pdev->id;
> > > >
> > > > -     alg_data->timeout = I2C_PNX_TIMEOUT_DEFAULT;
> > > > +     alg_data->timeout = msecs_to_jiffies(I2C_PNX_TIMEOUT_DEFAULT);
> > > > +     if (alg_data->timeout <= 1)
> > > > +             alg_data->timeout = 2;
> > >
> > > I don't see the need for this check. The default timeout is
> > > defined as 10.
> > >
> > > Thanks,
> > > Andi
> > 
> > That's the timeout value which was in the previous timer in i2c_pnx_arm_timer(),
> > without this I had time out events.
> 
> I meant the if() statement. We are sure timeout is not <= 1 at
> this point.
> 
> Anyway, it doesn't matter. I applied the patch in
> i2c/i2c-host-next.

Sorry, applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr
      commit: f63b94be6942ba82c55343e196bd09b53227618e

