Return-Path: <linux-i2c+bounces-5563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C57957C35
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 06:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA401C23776
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 04:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135A3482EF;
	Tue, 20 Aug 2024 04:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="O4+DxqiE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3332A1BF58;
	Tue, 20 Aug 2024 04:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724126816; cv=none; b=Zqy2dNIn618ZVoqrbqLUEz/Hqmg1VwEKz6JhOrqL8lTx1STAQsOCb4MHkqjpwMNzgJKLEAH8BSSf4ZOgRwffuteguMLjzoeI1q0xyUjIvzjEpaEeYgou+1gsRctNpplau5mEBMCBKo9SzniSYJrcK/lTkxi2PcEFmGxAHzi+EnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724126816; c=relaxed/simple;
	bh=8Lhh/q/1r5cGIvDh8S35Xm8TA5qnRALU9SfMrU6eGjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYFZPrvAAHxkrg5q+vqGCzxIUajZUKnmNeG0T6iFH//mXq79dsj4DsNVs7OwiaG37eQV/nOUPqK6J9S7u+yeVg9qt8Ua+SJE4UmaHLkdWlibBdMwtAFUYrV5EgZcSXPmXBxCHDokXmVqeyXUib7i+iJySbm2YTp01DpI5ucR65U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=O4+DxqiE; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id DC14460365;
	Tue, 20 Aug 2024 03:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1724126270;
	bh=8Lhh/q/1r5cGIvDh8S35Xm8TA5qnRALU9SfMrU6eGjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O4+DxqiEGdAkGB/s0A5zr3Ow5gBGGA+3hIBINGocTWrQi6dVfRvz6EdGsbBABSu6N
	 A9Kb/EPATkjG1T6JfZsw9KmNcBQu3kBcxwq1B4/zaI7NgRdy7EhD6oy7HGgHmc1PcH
	 Kqe+PwBLdc4dMbR5URoK/pydeAD1JnK//Ng2Iphc/a/n/thm+1cIFmiMlMjkNq6eIj
	 tfVOnxzCsaU0rmCcX+IqVplkKZFPAIDFQ1pd1e1sPx7vc351tu+VLn5dgKjZjyN0ge
	 zqgo2pEKF8f5/7rwjJ7i9GveKA7/16MPl1PGVjKim+Nk19erwXXW2zRFbIRaZchGnn
	 +ExCrUULoXDxg==
Date: Tue, 20 Aug 2024 06:57:19 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Breno Leitao <leitao@debian.org>,
	dmitry.osipenko@collabora.com, Andi Shyti <andi.shyti@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
Message-ID: <20240820035719.GA5105@atomide.com>
References: <20240808121447.239278-1-leitao@debian.org>
 <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
 <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
 <ZrtgfkzuCbNju3i9@gmail.com>
 <cf2d6ff5-dfea-4e25-8eee-e4e8c9cb1e7e@gmail.com>
 <CAHp75VdHT3g91AirBQGodw1sHbq7U=oKnJq3oSqDcNYS+OUOKQ@mail.gmail.com>
 <6c48f84c-f6da-4f4b-add5-71ec4ea6b963@gmail.com>
 <CAHp75Vffdia3n-FURNa5sB5SwOq+BW84jpTVEYeMCnL+1NZgRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vffdia3n-FURNa5sB5SwOq+BW84jpTVEYeMCnL+1NZgRw@mail.gmail.com>

* Andy Shevchenko <andy.shevchenko@gmail.com> [240819 09:21]:
> +Cc: Tony
> 
> On Thu, Aug 15, 2024 at 5:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> > 13.08.2024 18:52, Andy Shevchenko пишет:
> > ...
> > >>> but somewhere in the replies
> > >>> here I would like to hear about roadmap to get rid of the
> > >>> pm_runtime_irq_safe() in all Tegra related code.
> > >>
> > >> What is the problem with pm_runtime_irq_safe()?
> > >
> > > It's a hack. It has no reasons to stay in the kernel. It also prevents
> > > PM from working properly (in some cases, not Tegra).
> >
> > Why is it a hack? Why it can't be made to work properly for all cases?
> 
> Because it messes up with the proper power transitions of the parent
> devices. Refer to the initial commit c7b61de5b7b1 ("PM / Runtime: Add
> synchronous runtime interface for interrupt handlers (v3)") that
> pretty much explains the constraints of it. Also note, it was added
> quite a while after the main PM machinery had been introduced.
> 
> What you have to use is device links to make sure the parent (PM
> speaking) may not go away.
> FWIW, if I am not mistaken the whole reconsideration of
> pm_runtime_irq_safe() had been started with this [1] thread.
> 
> If you want to dive more into the history of this API, run `git log -S
> pm_runtime_irq_safe`. It gives you also interesting facts of how it
> was started being used and in many cases reverted or reworked for a
> reason.

Yeah we should remove pm_runtime_irq_safe() completely. Fixing the use
of it in a driver afterwards is always a pain. And so far there has
always been a better solution available for the use cases I've seen.

> > >> There were multiple
> > >> problems with RPM for this driver in the past, it wasn't trivial to make
> > >> it work for all Tegra HW generations. Don't expect anyone would want to
> > >> invest time into doing it all over again.
> > >
> > > You may always refer to the OMAP case, which used to have 12 (IIRC,
> > > but definitely several) calls to this API and now 0. Taking the OMAP
> > > case into consideration I believe it's quite possible to get rid of
> > > this hack and retire the API completely. Yes, this may take months or
> > > even years. But I would like to have this roadmap be documented.
> >
> > There should be alternative to the removed API. Otherwise drivers will
> > have to have own hacks to work around the RPM limitation, re-invent own
> > PM, or not do RPM at all.
> >
> > Looking at the i2c-omap.c, I see it's doing pm_runtime_get_sync() in the
> > atomic transfer, which should cause a lockup without IRQ-safe RPM,
> > AFAICT. The OMAP example doesn't look great so far.
> 
> Bugs may still appear, but it's not a point. I can easily find a
> better example with a hint why it's bad to call that API [2][3][4] and
> so on.

Adding Kevin for the i2c-omap.c, sounds like it might depend on the
autosuspend timeout for runtime PM.

For issues where the controller may wake to an interrupt while runtime
idle, there's pm_runtime_get_noresume().

Regards,

Tony

> [1]: https://lore.kernel.org/all/20180515183409.78046-1-andriy.shevchenko@linux.intel.com/T/#u
> [2]: https://lore.kernel.org/all/20191114101718.20619-1-peter.ujfalusi@ti.com/
> [3]: https://lore.kernel.org/all/20180920193532.7714-1-tony@atomide.com/
> [4]: https://lore.kernel.org/all/1463014396-4095-1-git-send-email-tony@atomide.com/

