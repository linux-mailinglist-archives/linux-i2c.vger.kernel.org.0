Return-Path: <linux-i2c+bounces-1676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51A84F3BC
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 11:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76A61C21502
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 10:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97A22420C;
	Fri,  9 Feb 2024 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsm8t898"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD208AB
	for <linux-i2c@vger.kernel.org>; Fri,  9 Feb 2024 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707475815; cv=none; b=GJ6zk7ZyDfaS4p6CFOH3oq2yJqeBmIKwmAyFdCni4YkvO9yCN3H4fSLBHuuQJrWHlpzuTQ9wkYcBLTs26orwAjQWVwgMuOWMw7wGisr46ZCf8gqJYV3u+esLVk/GX9CXEicPCFVdi4JAvHu30ULYfpb+EPDmDn7/OKsRKctK5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707475815; c=relaxed/simple;
	bh=6iTZ3L1x+uoh1UT8BZM96Kcc36zdm9shl9bdfb9ciug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyWbCPGH7cZENd0Gct6aH1IqoOEpBjLe9Qu51Rs+epg+Z5RTDi/6ycPRC07PJYFkeUyafQTfokDAVCKbuiolBGNyvr3vFe2CPd9zucOQegZVwOmdbcSRGEJqYuXV9aTSg5GsAtVwbR2EFKvYAYxolU+c+h/M3ZtRpJgoPSoPYTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsm8t898; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc755afdecfso252743276.2
        for <linux-i2c@vger.kernel.org>; Fri, 09 Feb 2024 02:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707475813; x=1708080613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iTZ3L1x+uoh1UT8BZM96Kcc36zdm9shl9bdfb9ciug=;
        b=nsm8t898w1F57MybizoZf7LLprLyb2IjPSaiyee6Ye5FCuDIzdjcIHKRx3K4ShQhup
         +WOMm6OXsYmXUC7Fv63R3+XedfAGJn/SAsmFpTWHX1AMt1wrFiX/Gr5u8HRUaN/VsAsd
         peJfwnugCU8VEtTDFY3UXGhMzksTrtvOErk/CjYO0h5LlCuTb2V3dWVFa0mWo66WLqAh
         hnwUkfrGKRodOCGjqjn7wMKjFst+xAZFowJG5G0HGuQmbvq9pr+oIngGzoKA6VcAjtvr
         PjSHMe1IFcG3n8MyyjZVBodCxBN529NClo+oy4QrpZU7qjt+0tPdUAArhdRvGRj3xcWx
         wOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707475813; x=1708080613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iTZ3L1x+uoh1UT8BZM96Kcc36zdm9shl9bdfb9ciug=;
        b=P8e/UV8HaM7yJCmu3D3K2HhBrqXw7L+xW2EVU3ydzjuOSCE47cHc6N9Bj/WaVNFxlZ
         YZuzv/eL9h3oE97mkO1ywd3Bak65MDFbbZ+EpFTju3tYS5wjIVRk4e18qkYebX6sYfuB
         6lMv5fxy70kUDClE6ULEMGJmpBoetJDIs4QCslPmuU2qZzriuXSSk1irkpM9ErcRGMSJ
         dJnX1R2Z98O1rDyD0B+7PjOm6t84gBM0HbsF7fwZmFjJMyCVsJDSUIDXCjVOs1GuVH9m
         kl7fZyhGmzMFaFB6hJ0Q/JZ5H5f77P/pwjmrTbyPpjDhrM9N167tAHlrGMe0QRMzvJts
         iJyQ==
X-Gm-Message-State: AOJu0YxG7ycY64IUrPuNIzMVqo1g7CH9+TySqQ55TA+lcdKn+2zDDD6i
	4XQ0KKLnO13GuMQ5NUWYL919qkPBW6hJBo4xODp29uHkswzlzSN0doxlonoUKOhL81CbFYKm7DT
	+I/rIgnx1Mn0UA6ThFOpXXqH6EQbrDuQuUHoi9w==
X-Google-Smtp-Source: AGHT+IGLvOd9/MBitQXhfAzlH+623tzVUG7WaQ7stY8iXEbXC38uzHJ96hKdcn9vmVOBj+lQYRfk9XfqcIwuAYfUmAs=
X-Received: by 2002:a25:d804:0:b0:dc6:7937:53da with SMTP id
 p4-20020a25d804000000b00dc6793753damr939249ybg.39.1707475812934; Fri, 09 Feb
 2024 02:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com> <20240116074333.GO5185@atomide.com>
 <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com> <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
 <95032042-787e-494a-bad9-81b62653de52@bootlin.com> <CACRpkdY2wiw1zH8FsEv7S1FW044PBSXpLPqanF5yyH1R4oteEA@mail.gmail.com>
 <68d4a1bb-5b40-47fe-a117-647d77009b43@bootlin.com>
In-Reply-To: <68d4a1bb-5b40-47fe-a117-647d77009b43@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Feb 2024 11:50:01 +0100
Message-ID: <CACRpkdZOhZu8OjgFHtqjeuujav3-N4dQFEqB2yvM+5QKNP37QA@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to suspend_noirq/resume_noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
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

On Fri, Feb 9, 2024 at 8:44=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> > *FIRST* we should check if putting the callbacks to noirq is fine with
> > other systems too, and I don't see why not. Perhaps we need to even
> > merge it if we don't get any test results.
> >
> > If it doesn't work we can think of other options.
>
> I think all systems using a i2c controller which uses autosuspend should
> be impacted.
> I guess a patch (like I did in this series for i2c-omap [1]) should be
> applied for all i2c controller which use autosuspend.
>
> [1]
> https://lore.kernel.org/all/hqnxyffdsiqz5t43bexcqrwmynpjubxbzjchjaagxecso=
75dc7@y7lznovxg3go/

I think this is the right thing to do.

Maybe we should just go over all of them? (Also SPI controllers?)

We will soon merge a patch to move the pinctrl-single PM to noirq, and
that actually affects more than just OMAP, it also has effect on e.g.
HiSilicon so we can expect a bit of shakeout unless we take a global
approach to this.

Yours,
Linus Walleij

