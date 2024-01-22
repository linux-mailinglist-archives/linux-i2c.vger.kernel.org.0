Return-Path: <linux-i2c+bounces-1423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0598B83757F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 22:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73A14B22B89
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 21:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB91481C4;
	Mon, 22 Jan 2024 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2Oho5DO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739123A8F9;
	Mon, 22 Jan 2024 21:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705959409; cv=none; b=F1x9Z+tJQ2unWZMfGVoZmX/DCZXHKgnsADvgbpKLbSXO17fJ+0Bg/0QmF1m6fQu+1lmjNchlD3nF0YPabgGsFds2vAci0vXxKPbvWE9S26hnXBi+3d2+5yULUFq9Y/A570bp9R9tLVZkgeR56b+vYMkGLfcsfsSsTkVaJJObW40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705959409; c=relaxed/simple;
	bh=xPn3dhVqdpRwTwdijypjx1UWRDaqJN9bDytv0STNJls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htZzLX6Q06qC3n6AEjAgArqJm0FI8PQqKpx2CP6TsSGcSdr/5p+qi4mMAhzrYv1OPk5A1fe15JqEOmzViIVMjFQjad6c+qcIR1o1PllM0eWJHcCJ4I4rp+WeypsCwnJUb1B67VdjCF71XyGQz2PofP+4y37wzxTSFBJFqCgv1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2Oho5DO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26f73732c5so399073466b.3;
        Mon, 22 Jan 2024 13:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705959405; x=1706564205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh1sidT+OYt5uYsBoa3HOhiQe7ArH4ir2l1s+REcQPU=;
        b=J2Oho5DOTLh5BckM2KFoA6tjfEQph6ZfH9tDiolOfR4tkBobDsJDZKF20xzZWgu7gC
         qCIBTSwYGemHYCUHo1IQJ0IndW9eZYHMaEmJtgZWPylJMzMSayHP4kpdaUNSv6hsi3oS
         Z8sn1QaNNyHjDXnuFE1XaYYA7BgWi1ypftt54r0cpa7KTryI1iZhsBEyAjNuOxDPuqcx
         PQTH1C/bWbiPmtpWASd1Xk5Gi4h5wrPSB6O804yUtbg7ypi/EEObf64QOM9t0BBiw+iN
         GKrqh9PoMxdCzDD+3G+Vvfsrzj52gJza/vQpy4jkHxDkgw5mXNEqJuhf73dxN5GD04dJ
         VHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705959405; x=1706564205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh1sidT+OYt5uYsBoa3HOhiQe7ArH4ir2l1s+REcQPU=;
        b=GaXpboMeVjowql7O6AZmDVfQkFIyX8EX2K6h2mloANX5TcgOiJxvgOZD9xG3LCrlyY
         F5iWkrVMkWRrEJRW16/BErdBdRGen+2wjPMTZyeALNLwIWD451HEloO3biXNAB5+k+gM
         m/Nw1O+gUxwmydgzHHDwlo1apBjdHqHlYQ5PPwaUXNTiFWWj4GxmZslSSSfLV0a9MDDQ
         KTttbS3XukRi/v+NcVqqEtA/VfjL4RoUZV1P+Z3EOlotrLbuSU75ijrTUQ9o4FIeJ0f9
         0cVU2JA/qRUusGe7v+XXghi3cpruocSuoAT8Hf8+TbFJIwZkbxsWtLepZQUdR6ujZ6QM
         /Cgw==
X-Gm-Message-State: AOJu0YxregrC5PLjnq15Rjhzp9Eku74iKKTdym1gLM5neYYA3AmSupKq
	YrYo9QbNsVpzJOlSdN8zBXkNEevE5OqpMzq9ScKs2ICYarxjZTfk9OucoRNLhCprxgJPWLoaMYi
	SLFW2LqTjB/gNUSTHzjzLEDeoqmI=
X-Google-Smtp-Source: AGHT+IF/SL58a8hmAkmkCe5q5zm+9sw1I9Kywvqs5C4nI1iPfdBzh55WJjaIzUvjLszirg3nQ/bBqI6uZdDo77QpfCc=
X-Received: by 2002:a17:906:b2c6:b0:a30:9e78:662f with SMTP id
 cf6-20020a170906b2c600b00a309e78662fmr317678ejb.70.1705959405451; Mon, 22 Jan
 2024 13:36:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-14-84e55da52400@bootlin.com> <CAHp75VfPQz4PWdzFUU_n+R=XohBjyXM0zsjD-bUD2jmb42ds8Q@mail.gmail.com>
 <9cb47f37-bd98-4136-b844-33cf2be593df@bootlin.com>
In-Reply-To: <9cb47f37-bd98-4136-b844-33cf2be593df@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Jan 2024 23:36:08 +0200
Message-ID: <CAHp75Ve30T3t0_vHR7TUVVC_WN23dL_rp1k951Da6Re2DJQezw@mail.gmail.com>
Subject: Re: [PATCH 14/14] PCI: j721e: add suspend and resume support
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
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

On Mon, Jan 22, 2024 at 5:30=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 1/15/24 21:13, Andy Shevchenko wrote:
> > On Mon, Jan 15, 2024 at 6:16=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:

...

> >> +               if (pcie->reset_gpio)
> >
> > Dup, why?
>
> This pcie->reset_gpio corresponds to PERST# of PCIe endpoints.
> I assert it during suspend, because I have to deassert it (with a delay)
> during resume stage [1].

Ah, sorry for being unclear, I meant that gpiod_set_value*() already
has that check, you don't need it here.

> >> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 0);

...

> >> +               if (pcie->reset_gpio) {
> >> +                       usleep_range(100, 200);
> >
> > fsleep() ?
> > Btw, why is it needed here, perhaps a comment?
>
> The comment should be the same than in the probe [1].
> Should I copy it? Or should I just add a reference to the probe?
>
> [1]
> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/pci/controller/c=
adence/pci-j721e.c#L535

Either way works for me.

> >> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> >> +               }

...

> >> +#define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
> >
> > Is container_of.h included in this file?
>
> linux/container_of.h is included in linux/kernel.h.
> And linux/kernel.h is included in pcie-cadence.h
> (https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/pci/controller/=
cadence/pcie-cadence.h#L9).

Okay, so, try to clean up pcie-cadence.h so it won't use "proxy" headers.
There is an IWYU (include what you use) principle, please follow it.

--=20
With Best Regards,
Andy Shevchenko

