Return-Path: <linux-i2c+bounces-3064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389BA8AE249
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9AE6283C7C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 10:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3A85F84F;
	Tue, 23 Apr 2024 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+iWXxHe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482EA322A;
	Tue, 23 Apr 2024 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713868500; cv=none; b=BOoFtYswEgu62SqVKYiDh89gsWNu2PvJ0tp0XBca7uBs0CtmSOy5y/ib+eKEjQUTbGb0UorQEHRO9dAA3+m5YoX3BPiEOHFj+3VWMHiXuKrWKYItChHQsOOKdhuvyt35RCN2fEO+Ydi20mW1L5LozpSA0b0mf/SFXHAhXUcHJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713868500; c=relaxed/simple;
	bh=BE29/rVJCvFya+GV7ARo6mMJrICMWxGYpyyg3ySIPvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fd/JKyqWK8SiijA0jHTVwiwwd15LXzPC1IinDk8tOOcNx4VLQM5WwjREBNMzYjQfFut8r1pcx6/hQRRBLugdq/wA2Nv4JqB+i0wwdHcYFw5n19wXWVgXWoXMoMndfhJTGeL2xlaPN5uTQNrR2FuHxXs+VtYSKr/0GxW0BuyY0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+iWXxHe; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57215beb09bso1326816a12.3;
        Tue, 23 Apr 2024 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713868497; x=1714473297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpfHmgVTBXM1G+3QVd/pCxFW4zgJHvWXKJ+R0G1BFoM=;
        b=i+iWXxHekub1wE3LPhLjz/AEuz779d9ST0jwdl3qgPdUHjjItQgcixOxGUDwXBrxm8
         Vpbw2G8gjBdKkK33L48UnbvBAINNDsGjtY63mDhn0PZo0ZgHPlx2WqPiONIjLFm+JJdX
         YDNN2peFleEqKroQRwY1YYyNCNr2vf3zwaLONQIAvTzbQcxi5fUmCvy4VMh1qlDmjtcy
         T2SI1yWa/YFsryGQzhNw1w6hPqC5q6a6RRM2NpTUVu0qGU71wJFIgS/zSyDSxneR/KQj
         wiUfqi/nZWAPMDlK85PTwtaMLn4hy1dVivIyAIlr7aWSfG2YPEvau5AHxXCfU6AkV6IJ
         LeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713868497; x=1714473297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpfHmgVTBXM1G+3QVd/pCxFW4zgJHvWXKJ+R0G1BFoM=;
        b=WBfaCMy348WLu47Zibde2xKpbiZhxtRzvmPbGxrc/xJbgz4Xyy/PCJM1Mu6Q5P323u
         YGvl+VbWkRF55iSesSeoctE7ClPrB0gZc5OCiIz/lJrEGhCRT3UiGGgu+f5yy32uavV4
         YdvzFMEkQN3Kfeidz0b6659Ig9l9xPk7MHHlNEDsYc4gPI257+LHA/pEZnogASYq7uUK
         AaqNUSYa+BB/26xGH9o62V2cFZ67zKUMiM80D/qvHjMbG5lJFlGYOJ4GW15PXzrOocLl
         IRGBxmbDdCyG6EZaPXyOPGaU5OvzR1A7F6+8wNYx9DnKWjjBnnspJnC/wy2zHF/tOlin
         Ia2w==
X-Forwarded-Encrypted: i=1; AJvYcCVc4KYwKDYti/OF/W9+DKM5C3a9n1hei5l9hljunFuUfj/A8fW7lbcz1rxHzcOeAJeITevVKqNp7kOGBYV3xW17Hj/t5YLipbjj9vBRbNlhllrHYgmHD6lj6HPBhNGo8pU9JGqN9N+KF/eGt9+R9UZWD1wlu+YzeWy58yJ1XPuyBs9HVSzOO5Nf3RPH7GAxwq57sew0bE/8nzee89HGB0N1mhvAxns5W+yLdI71Qk3MgtsofacIQrQ80Grm0aazHvxEsHhfglfMbWzpRxulS/J1SrOh/WhWYk3L9+DTKQ==
X-Gm-Message-State: AOJu0Yw/CtBIPLEBI4LG69JsBls7p9zDKoEOuro+h0man8tFgGqQNlfA
	yF6fvtbQmQoyMu2FLEGugE4BSxAMCW60GBW4zRdFgchySgB11LARFkqsF7t12cGgdW4n66hIiz0
	JfF9fr9P4htjXOGcuFnCR6NbRtkY=
X-Google-Smtp-Source: AGHT+IHkSAdNfoHHoj8gE8tCVdLt0/qh7w1c39WozB9nDYm8+OzxWhrEGs93n5j5fcE7kwKuVsOivNjDiZwSQXQBRdQ=
X-Received: by 2002:a17:906:2491:b0:a52:6fcb:564a with SMTP id
 e17-20020a170906249100b00a526fcb564amr7200221ejb.9.1713868497304; Tue, 23 Apr
 2024 03:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-1-4b8c46711ded@bootlin.com> <CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com>
In-Reply-To: <CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Apr 2024 13:34:21 +0300
Message-ID: <CAHp75Vf+F3ArczHQ+nSmP4uFvRdMAQWufmR6xR0xtbHfVvFm-g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
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

On Tue, Apr 23, 2024 at 12:42=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Apr 16, 2024 at 3:31=E2=80=AFPM Thomas Richard
> <thomas.richard@bootlin.com> wrote:

...

>         +i2c-rcar e66d8000.i2c: error -16 : 10000005

It probably means that I=C2=B2C host controller is already in power off
mode and can't serve anymore.

>         +pca953x 4-0020: Failed to sync GPIO dir registers: -16
>         +pca953x 4-0020: Failed to restore register map: -16
>         +pca953x 4-0020: PM: dpm_run_callback(): pca953x_resume_noirq
> returns -16
>         +pca953x 4-0020: PM: failed to resume async noirq: error -16

Yeah, with this it's kinda forcing _every_ I=C2=B2C host controller PM to
be moved also to noirq() or alike.

...

> All issues above are fixed by reverting this commit.

Let's revert as we close to the end of the cycle and this is not
something that can be fixed ASAP in my opinion.

...

Thanks for the report, It's a pity that it wasn't tested before from
the mailing list...

--=20
With Best Regards,
Andy Shevchenko

