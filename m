Return-Path: <linux-i2c+bounces-3077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757B68AEB2E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 17:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15A1E1F230B9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 15:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BC313C907;
	Tue, 23 Apr 2024 15:32:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2686273;
	Tue, 23 Apr 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713886336; cv=none; b=tNKgtB6B93n2WBbG7kwJDneKmvObraaQJcvomhCM1SHOynqgF/AgT5Dsa70ayaSMUqsJGXU+RwEMn672LndvqEuIhsoQaR6JA1+FNNTTf/LRaRCD/LaMJs07mmRtccmhZc/ERV0TX/3Xv6NGDE9bCAFCnwUFo7dZEe5Vnu6f7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713886336; c=relaxed/simple;
	bh=Axa3Mn5+KVTK6qIzldvrgQzSEYO2/lcirqLJInKyRG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZXUHKad3OyzKN5sXvMkdcCwHi/SC+qdEiHlkpBu2RC39c/65eVwFVLgqCaKD0yxWm9nxqE7vzg9cGu2cc/n8sXv6gCB0IH4N4+gwcLp6Ao0P/rt5gYcjdPVX0csfc+Zwww0OvvARN5u9n7k5snp8/ROvx7LcmHdmMD3hQDFlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61816fc256dso50988897b3.0;
        Tue, 23 Apr 2024 08:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886333; x=1714491133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCFrzV7qoH1GMPZYbyZsRzzURQK7cGFU6Wp+TTcFvr8=;
        b=LPth/cZFk4JlInnptjMDl2XXrxBuMp0XvL4yz+QzMwOw+nQtJnNxU6IvnOtkHNc26g
         r9Dsdbd1RCRnGCFLbPbtbpU+ComM9edt8DNvVWY+mVi69/tQM/Q2USepwH3CsauSfZ9E
         8exeAQQQQppYsLSrrz5XTkAEV2rRg73eMmQ5p3MyR3zVSBjvdCMOrk1tua83g4WSld/t
         G4aiJ/8uvsFwDgJ6Bsve8MnyL78nzphgOt3ns2KOPA6ljKo5pPAeDG1T2KuJnt9JeXMS
         Cm8teEftdPyUAw6hasL1/6DLyB5YdYc7DcWLwKHaV7dW6tB5VOu+HQCXTCl9K4D9kA8P
         PXGA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Vti+OI5iSIThtBBjC6Chrsdy7O4OEQNRvPLTCumRwOTuJLD5zxzGA4u/7GRbgZeyd/zojaC9pFjziwq/YLzKiWpgfRxHO/f7kClseyR0dQc5vUA/HnCK6hsnlrS2fuuu9YiSIwf0X5CIRmXTQYLHR4h80VlJP2HDo9kf/Q/ztw6ImdQqlRwyANXZYO7kVASOVF+j3ZLvBwXKY7w3mEiuvMhMi1Ki6eWlaWGnH808ZQO0OVKzlHLZNK9gPuz/y0kzX5SRmQOpW5sOuyo7dKWrFoMhXotd02GAZ1suCw==
X-Gm-Message-State: AOJu0YzgtujE/L709zM1lFPaeDlAMuS5nUCbJ3TtZPrjo6NHsudG/Cvq
	GfMAJYIMAaYua5dSWK3IevJZh2dw+E4v7jWNtHEVtsizwisZ6Paid/fXetzm
X-Google-Smtp-Source: AGHT+IEn9o9kwpQ21sUDm3boQ5gEGYvUxHSf9p6oYyBqPVpgAQDC1EghII1JwoT01XsucnyZNFnveA==
X-Received: by 2002:a05:690c:61c6:b0:61b:1a4f:158b with SMTP id hk6-20020a05690c61c600b0061b1a4f158bmr13675592ywb.6.1713886331234;
        Tue, 23 Apr 2024 08:32:11 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id z12-20020a81ac4c000000b00617f1b4943esm2480486ywj.106.2024.04.23.08.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 08:32:11 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso5760935276.2;
        Tue, 23 Apr 2024 08:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI4gBTrDCBV79aoDQ+Z2jvbLk16BClJTyYYOHXBbHU8Dw6HZCDo28WffVKQpmrv7wzQliCHqJ0khwkjoH/BrxdVBlBuyiLZRkb+HuKTWWexZ0C2P7teEWKhR/F2i4ol7O9imDwzh12qvMGkwVfPbXI2S+iVhDSlPEmrxQl/jpA20Mmt9caMzgK+7T3Y+xQ8W9WKB7nFoZAkeTTTbv1Iixy2777zCnQaTNfLmalj6hUQqeCtPncVGQz4zwJKMWH+DChm1sbM90hIcRf31RUNGRC/jTHghxzSNZd4vI/UA==
X-Received: by 2002:a25:86c7:0:b0:de0:d45f:7c5 with SMTP id
 y7-20020a2586c7000000b00de0d45f07c5mr11933981ybm.20.1713886329809; Tue, 23
 Apr 2024 08:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-1-4b8c46711ded@bootlin.com> <CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com>
 <CAHp75Vf+F3ArczHQ+nSmP4uFvRdMAQWufmR6xR0xtbHfVvFm-g@mail.gmail.com> <c5ed5bed-9c93-47eb-8277-d78e12e96b42@bootlin.com>
In-Reply-To: <c5ed5bed-9c93-47eb-8277-d78e12e96b42@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Apr 2024 17:31:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3NbCHchm9eHhGQNuvzmdwuP_fdt31m7vNY7Cp2-3-=Q@mail.gmail.com>
Message-ID: <CAMuHMdV3NbCHchm9eHhGQNuvzmdwuP_fdt31m7vNY7Cp2-3-=Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Apr 23, 2024 at 12:53=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 4/23/24 12:34, Andy Shevchenko wrote:
> > On Tue, Apr 23, 2024 at 12:42=E2=80=AFPM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> On Tue, Apr 16, 2024 at 3:31=E2=80=AFPM Thomas Richard
> >> <thomas.richard@bootlin.com> wrote:
> >
> > ...
> >
> >>         +i2c-rcar e66d8000.i2c: error -16 : 10000005
> >
> > It probably means that I=C2=B2C host controller is already in power off
> > mode and can't serve anymore.
>
> Yes the i2c controller is already off.
> In fact it's the same issue I had with the i2c-omap driver.
> In suspend-noirq, the runtime pm is disabled, so you can't wakeup a
> device. More details available in this thread [1].
> So the trick is to wakeup the device during suspend (like I did for the
> i2c-omap driver [2].
>
> [1]
> https://lore.kernel.org/all/f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.=
com/
> [2]
> https://lore.kernel.org/all/20240102-j7200-pcie-s2r-v5-2-4b8c46711ded@boo=
tlin.com/
>
> I think the patch below should fix the issue.

Thanks, I gave that a try, but it doesn't make any difference.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

