Return-Path: <linux-i2c+bounces-9920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A9A69B83
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 22:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38ECC4203F2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 21:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204320899C;
	Wed, 19 Mar 2025 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPu2Dmpz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27451CAA81
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421232; cv=none; b=PePiD6CujpxcvncHfmTmujecpI6dffEm0hzdXMRz9MaOsWSg9ru5m5ViCZHcfgUP5nhwlAayBaqdVJoqBgUsgGdpwtLN9APBcTb9C0+kqGCSD/2aADO8BNr7NCCmalI9KrHdyOyv0iTBNOKM9DHzoHKkO++NAOr516i0libUoC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421232; c=relaxed/simple;
	bh=hQt91yHDgJdB4ighq8TvMlrQ/eEWiyTLNTpwQdCZsWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ckzksxo0Rz9q2M5FXZrqSk1KhvzngZZ6NTUiy6rL2oA/k5QaTii8zrde7qeT8gS+GamPZc+YjF1UF7U7HW6t7wiU6IziJiNGGTCtFDiUewLXjf3Qk51pZUEzm2LwN0+/ahxMhCrWyTVDhr4XYj/+u98kf52Emcwl31eQXsq73Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPu2Dmpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C01C4CEE4;
	Wed, 19 Mar 2025 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742421232;
	bh=hQt91yHDgJdB4ighq8TvMlrQ/eEWiyTLNTpwQdCZsWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPu2DmpzoXJWC8VOtcBJjZNcz5wk9mOC18eGWhxS6CHwOL22H2IYGLwAGNGVwXluU
	 IeHTpjHJy4ul0EsNuvxyXxUewf0qF2PLSKTeYNmzyAtcOLkGVU18bhDCJVWOYxry6x
	 YtxDZrB1P7xoaGHspvMoFclACAN1qQIHEgyagOKdwKqe9GBMGDeS8Mrxp1vMFSvGDM
	 /yGl5ELzNVPqfLJ0wTqWaVmunBid8B75SXDU5MVkTcGliXAKU8yBziLokuK9daP0JT
	 a+FrAlDGeJiWtM814li/QUt9ssUr7UGvvCrcSvLKXZfL2BCnbbo81bPiwBH8mT5yQk
	 SL8t+rL3vf9bQ==
Date: Wed, 19 Mar 2025 22:53:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
Message-ID: <22rlfg3yhjz6pshwirss3qgen2egl3qinftjshfhbiq7gu3z5u@lttl44appp7y>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
 <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
 <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
 <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
 <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com>
 <CAHp75VcskbS7mxQxFwhqdSH-KMKLG6E8oeRDV8VhmK=FE2NiXA@mail.gmail.com>
 <f47ebf6f-4cae-4868-98de-7c6a1d2634c9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f47ebf6f-4cae-4868-98de-7c6a1d2634c9@gmail.com>

On Wed, Mar 19, 2025 at 09:26:35PM +0100, Heiner Kallweit wrote:
> On 19.03.2025 20:48, Andy Shevchenko wrote:
> > On Wed, Mar 19, 2025 at 9:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >> On 19.03.2025 09:23, Andy Shevchenko wrote:
> >>> On Wed, Mar 19, 2025 at 9:17 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>>> On 19.03.2025 00:22, Andi Shyti wrote:
> >>>>> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
> >>>>>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
> >>>
> >>>>>>> Switch to iomapped register access as a prerequisite for adding
> >>>>>>> support for MMIO register access.
> >>>>>>
> >>>>>> I believe that I at least discussed the similar change a few years ago or even
> >>>>>> proposed a one. The problem here is that *_p() variants of IO port accessors
> >>>>>> are not the same as non-_p ones. And commit message is kept silent about
> >>>>>> possible consequences of this change.
> >>>>>>
> >>>>>> So, at bare minumum it would be good to test for some period of time before
> >>>>>> going for it.
> >>>>>
> >>>>> How would you do it?
> >>>>
> >>>> Documentation/driver-api/device-io.rst states that the artificially delayed
> >>>> _p versions were needed on ISA devices. And in general I didn't find any hint
> >>>> that the non-delayed versions ever caused issues on PCI devices.
> >>>
> >>> At least put this in the commit message. It will show that you were aware of _p.
> >>>
> >>>> On my system using the non-delayed version works fine, but I can't say 100%
> >>>> that it's the same for the very first (> 25 yrs ago) chipsets supported by i801.
> >>>>
> >>>> Likely users with old systems don't run -next kernels, therefore leaving
> >>>> this change a full cycle in -next may not really help. We can argue that
> >>>> we have the -rc period for testing (and reverting if needed).
> >>>
> >>> My main concern is to make no regressions for most currently used
> >>> cases, that's why one cycle in Linux Next is better than none.
> >>
> >> Even ICH7 datasheet from 2012 mentions that SMBus register space is also
> >> memory-mapped. So all systems from at least the last 10 yrs should use MMIO
> >> instead of PMIO now, and therefore not be affected by switching to non-delayed
> >> PMIO access. This should significantly reduce the risk you're referring to.
> > 
> > Cool! So, can we just put a summary into the commit message of all
> > findings, worries (or their absence)?
> > 
> Sure. Would be a question to Andi how this should be done technically.

yes, please do and I will update the commit. You can even provide
the new commit message in reply to this email and I will update
the rest.

Thanks,
Andi

