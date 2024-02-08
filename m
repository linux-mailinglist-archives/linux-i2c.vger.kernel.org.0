Return-Path: <linux-i2c+bounces-1663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830884E585
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 17:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1AF1C25613
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 16:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB1A7F7FE;
	Thu,  8 Feb 2024 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ybhq7Kd4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1557F7CF13
	for <linux-i2c@vger.kernel.org>; Thu,  8 Feb 2024 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411244; cv=none; b=Z4uyFmEZJqg6AkqR9q5Fz8YTpt2f1hFySXRVospZFRkqpwP/FKuDjB6Q6P1uS+stDI3g4+wo7WawNWh2Q+ZxOYVqjli2kRhX9LER1QznP+mk1gwYRvpeClKDmCHAp4TQA8DNbpQsd42FGtplSK+uj4sf9PhTGYOJUtSkOzWkE3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411244; c=relaxed/simple;
	bh=+WnqOpqwrKMN/Ii8lvXs8Tih6LFYmoJMhLY7pjgCWgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQMzAwaFl8A8rfyJMzCe9IG6RG2BK5yK9xmDghTD1cCrepD/94OIhkpJQ4CCQVf9OCcii+85mBhKMLyOCBskOh96pAD2TdYo0Tk7GthwcY/xeOiYi7TeUvsxt0Nt2SrRFCFY4U88a84kNj+PZNnIXSroH5bCq3qqVNtvd9DbY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ybhq7Kd4; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4c0232861afso735638e0c.1
        for <linux-i2c@vger.kernel.org>; Thu, 08 Feb 2024 08:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707411242; x=1708016042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WnqOpqwrKMN/Ii8lvXs8Tih6LFYmoJMhLY7pjgCWgA=;
        b=ybhq7Kd4EMNxKxmH4ppuNsp011IeTINhTWm2q7GuUWAv5EqZBIkATzyQ9VKsHy1R/A
         KoNAq5/5s9fWZdWz2IE4LwathQ79bUe8E4PRhfXAFm+Jwy01C5eoS5LXtfgsgqRDXfJP
         J+UmGtPyvWe9VPaqJeqUgqyWY8R0LtYHN/c2gnoXv4bs2qWlZNTAY6Irczsgi2MitD2c
         ZttpnCpa6Qs+GdkJYreRIgbblmOckIg/yEViEx29BV5Pip2kkZnpYFLGtCg8K989IzdA
         sXJuRd7Pqb1z0d1iTKQzilqo+71GswvYS3E4Pvk8FqkeocxGFcCSZVmWFxx96kgmdOYl
         cG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707411242; x=1708016042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WnqOpqwrKMN/Ii8lvXs8Tih6LFYmoJMhLY7pjgCWgA=;
        b=tMbs/mT0FIkMQxRYVQ8nod7LbThFevJ+bOwmCJfTQIft03Fp5jx1E9rqyhZ9/fD3fG
         PRek1Yk1JF304uwiPY6zLKkAKWektJUo9W6dEF93VSmmnngahOQ1rBzkibU2Fg/+8BzV
         HvvWoICvL9rhPg073v3HWl2OsZPZt+lHxv4R9Ok5zat3436xAu5JCpw2H+Gp+Cgt+MpD
         iu4VLhZSLpEUH6vzbj+Z9i7uv+OJgawM+hNJyM6x0vVBETISdv97v70N5bMg4v9snPMV
         nrZ1AMkQvibZd8X8gHlFLVedqh2vjt0gNoAUAB5nynFKbMXr+i4jybpnOkrFdCM3NP3O
         4ptg==
X-Gm-Message-State: AOJu0Yz+MLHnUKU0gbz827jl//xvGgARYIr5dL5RiOmbQnp8kue3XHQc
	BFbLUHd4QUyQSanYS0O0YJVJdrfct3kUkIQcB27YmUYm2LJzQ4U7PbW1H0gvGn0Y9kwkDPnDx+o
	1PnkizVVUsNGTaXO7CQzYxbCopgWp7q5N3v5w5A==
X-Google-Smtp-Source: AGHT+IHz0CjsWbNfwLVsvbsu2GnwvD6mVTutx2G227R7kTzOxqJNrEtSn6iMso2qq7PPj4o9RHpX9LDEy5dwka8VO8g=
X-Received: by 2002:a1f:e681:0:b0:4c0:2416:6fc2 with SMTP id
 d123-20020a1fe681000000b004c024166fc2mr161766vkh.5.1707411241926; Thu, 08 Feb
 2024 08:54:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com> <20240116074333.GO5185@atomide.com>
 <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com> <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
 <95032042-787e-494a-bad9-81b62653de52@bootlin.com>
In-Reply-To: <95032042-787e-494a-bad9-81b62653de52@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 8 Feb 2024 17:53:50 +0100
Message-ID: <CAMRc=MfSkuYocKMGyVjqQ5qk=MSkR_W4F5PNs+M6HwBkmjcK0Q@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to suspend_noirq/resume_noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, 
	Andy Shevchenko <andy@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 5:19=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> On 1/28/24 01:12, Linus Walleij wrote:
> > On Fri, Jan 19, 2024 at 6:01=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >> On 1/16/24 08:43, Tony Lindgren wrote:
> >>> * Thomas Richard <thomas.richard@bootlin.com> [240115 16:16]:
> >>>> Some IOs can be needed during suspend_noirq/resume_noirq.
> >>>> So move suspend/resume callbacks to noirq.
> >>>
> >>> So have you checked that the pca953x_save_context() and restore works
> >>> this way? There's i2c traffic and regulators may sleep.. I wonder if
> >>> you instead just need to leave gpio-pca953x enabled in some cases
> >>> instead?
> >>>
> >>
> >> Yes I tested it, and it works (with my setup).
> >> But this patch may have an impact for other people.
> >> How could I leave it enabled in some cases ?
> >
> > I guess you could define both pca953x_suspend() and
> > pca953x_suspend_noirq() and selectively bail out on one
> > path on some systems?
>
> Yes.
>
> What do you think if I use a property like for example "ti,pm-noirq" to
> select the right path ?
> Is a property relevant for this use case ?
>

I prefer a new property than calling of_machine_is_compatible().
Please do run it by the DT maintainers, I think it should be fine.
Maybe even don't limit it to TI but make it a generic property.

Bart

> Regards,
>
> >
> > Worst case using if (of_machine_is_compatible("my,machine"))...
> >
> > Yours,
> > Linus Walleij
> --
> Thomas Richard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

