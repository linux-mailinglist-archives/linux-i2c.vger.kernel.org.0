Return-Path: <linux-i2c+bounces-9958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7DA6AFAC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3CF99825C2
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 21:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A7722A1ED;
	Thu, 20 Mar 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfzUr2P9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B5214228
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742505034; cv=none; b=MuX+732/DJdspR3QNts818OSlw+6Ond+3IP+hLFg9qWni6am1rplhxhTZtSq7ePwukW5eWH+paTs1FY7mP2dEViGtmlrbDGmb5yopKC6EqKlC8TGIawNrg95N8QUexLBs8n08awSlhhpKqY9pmsA0uDaitLgi8Vg1Gm4SiTzss4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742505034; c=relaxed/simple;
	bh=vF5dhv25cXIjlQm9p0FOdzvDwKGvHIfE6LELbLZELyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkJhRzZjYWaXtryGmcAOTJEhKd8CMV3V4sE5HDNsdIzbqaSJfEKuGsSgX+p03Mn31Pf/m+7vfvfJDMPwdV20N7JAp0aUvgl3e/8wg3glr6w+1xQznar9/zXohi7vjfcHYxfIdcb64PmFgHHLrMFEh122uuPzMWh9FEVfpK1vTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfzUr2P9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A07C4CEDD;
	Thu, 20 Mar 2025 21:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742505033;
	bh=vF5dhv25cXIjlQm9p0FOdzvDwKGvHIfE6LELbLZELyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TfzUr2P9OkLS15XWq60CFmsifjEopRPiHXbaOlhxrfU4oJlARCuDD6FMwy3J9bh3u
	 sg5NTkXouQMTdVY7R3mgsyPEzbOJruds0cFQsG1f3XfJ8+pJp1M4JGdtoD29DyREyA
	 B5BOT1XZJlJAgHitmOYuMY+Bm30lmZA5fqniQV5iZNQF2p7mQZfGwpxZ8Vfw2vaqgp
	 NlTID3LsKr/z5F6gimPwikTzWnJ1yISYNingsgj6Db95ULq18fUNeUjfW/svqM0nUb
	 BV8HiqRnbF72lVMLQhTDTQJZuWdMbQ0IsOv+R+jQft76Gn7HolpvwY8NajVbbMcriu
	 dTJ1db2KyJlSQ==
Date: Thu, 20 Mar 2025 22:10:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
Message-ID: <3hhzrc2b6kg4gmvmk76ecq4rzap73n6qvang5uyifuwpez65bj@ptbuqjtxtomo>
References: <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
 <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
 <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
 <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
 <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com>
 <CAHp75VcskbS7mxQxFwhqdSH-KMKLG6E8oeRDV8VhmK=FE2NiXA@mail.gmail.com>
 <f47ebf6f-4cae-4868-98de-7c6a1d2634c9@gmail.com>
 <22rlfg3yhjz6pshwirss3qgen2egl3qinftjshfhbiq7gu3z5u@lttl44appp7y>
 <84ea8650-53d8-4ab9-bcdb-af35960a9beb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84ea8650-53d8-4ab9-bcdb-af35960a9beb@gmail.com>

Hi,

On Thu, Mar 20, 2025 at 09:06:29PM +0100, Heiner Kallweit wrote:
> On 19.03.2025 22:53, Andi Shyti wrote:
> > On Wed, Mar 19, 2025 at 09:26:35PM +0100, Heiner Kallweit wrote:
> >> On 19.03.2025 20:48, Andy Shevchenko wrote:
> >>> On Wed, Mar 19, 2025 at 9:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>>> On 19.03.2025 09:23, Andy Shevchenko wrote:
> >>>>> On Wed, Mar 19, 2025 at 9:17 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>>>>> On 19.03.2025 00:22, Andi Shyti wrote:
> >>>>>>> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
> >>>>>>>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
> >>>>>
> >>>>>>>>> Switch to iomapped register access as a prerequisite for adding
> >>>>>>>>> support for MMIO register access.
> >>>>>>>>
> >>>>>>>> I believe that I at least discussed the similar change a few years ago or even
> >>>>>>>> proposed a one. The problem here is that *_p() variants of IO port accessors
> >>>>>>>> are not the same as non-_p ones. And commit message is kept silent about
> >>>>>>>> possible consequences of this change.
> >>>>>>>>
> >>>>>>>> So, at bare minumum it would be good to test for some period of time before
> >>>>>>>> going for it.
> >>>>>>>
> >>>>>>> How would you do it?
> >>>>>>
> >>>>>> Documentation/driver-api/device-io.rst states that the artificially delayed
> >>>>>> _p versions were needed on ISA devices. And in general I didn't find any hint
> >>>>>> that the non-delayed versions ever caused issues on PCI devices.
> >>>>>
> >>>>> At least put this in the commit message. It will show that you were aware of _p.
> >>>>>
> >>>>>> On my system using the non-delayed version works fine, but I can't say 100%
> >>>>>> that it's the same for the very first (> 25 yrs ago) chipsets supported by i801.
> >>>>>>
> >>>>>> Likely users with old systems don't run -next kernels, therefore leaving
> >>>>>> this change a full cycle in -next may not really help. We can argue that
> >>>>>> we have the -rc period for testing (and reverting if needed).
> >>>>>
> >>>>> My main concern is to make no regressions for most currently used
> >>>>> cases, that's why one cycle in Linux Next is better than none.
> >>>>
> >>>> Even ICH7 datasheet from 2012 mentions that SMBus register space is also
> >>>> memory-mapped. So all systems from at least the last 10 yrs should use MMIO
> >>>> instead of PMIO now, and therefore not be affected by switching to non-delayed
> >>>> PMIO access. This should significantly reduce the risk you're referring to.
> >>>
> >>> Cool! So, can we just put a summary into the commit message of all
> >>> findings, worries (or their absence)?
> >>>
> >> Sure. Would be a question to Andi how this should be done technically.
> > 
> > yes, please do and I will update the commit. You can even provide
> > the new commit message in reply to this email and I will update
> > the rest.
> > 
> Updated commit message for d4ac3f93ff23:
> 
> Switch to iomapped register access as a prerequisite for adding
> support for MMIO register access.
> 
> This changes replaces the delayed inb_p/outb_p calls with calls to
> ioread8/iowrite8 which don't have this extra delay. According to
> Documentation/driver-api/device-io.rst the _p versions are needed
> for ISA device access only, therefore switching to the non-delayed
> versions should not cause problems. However a certain risk remains,
> which on the other hand is significantly reduced by the fact that
> recent systems will use MMIO instead of PIO. ICH7 datasheet from 2012
> mentions already that SMBus register space is also memory-mapped.
> So all systems from at least the last 10 yrs should be safe.

Thanks Heiner, updated!

Andi

