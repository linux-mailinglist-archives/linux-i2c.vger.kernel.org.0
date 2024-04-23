Return-Path: <linux-i2c+bounces-3062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 210528AE130
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 11:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52782851EE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC375A11F;
	Tue, 23 Apr 2024 09:42:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761051016;
	Tue, 23 Apr 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713865349; cv=none; b=LJ/HoSt1E6m7CaSdBgu9NUQip+dLwlisyrzamlse/KXUbp79JhMd17fppnDLhhYZ6K8nrjwv9UJASlnUZM0qfEawv8RrjMyAsCt9qAzFDP1YYrp9eOv4vhlCifl6Vj6SkgERJ19srs+b3lj7gCrYLlVZzTg6yQ33C56y5/3Tl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713865349; c=relaxed/simple;
	bh=SeejIbtFL3q2Ah+TgrTpf656eWgMzRmReKNJR8SEw/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKPQNB3SE8ua+a0XYloNDAd5UlFsmGsc0Bo2wcTCfGGm8VI4aIxqM160gq5OAOWxr8fCdvEF1MrfrPfuDXNZY4RKDQSCKqbA2n4d4dxkjYOQ+rxNN50mrvOWbDjC5L9ONIGKZ+v5pJa730yKqJIf5NcIZcktUYk+NfU5Rdv28gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61816fc256dso47363617b3.0;
        Tue, 23 Apr 2024 02:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713865345; x=1714470145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqVVfPd+WN3revU4fg7rebmHFdp/AiB0hyvlw5Bb61g=;
        b=uqlflhjQyo+9UkWaG+dQ4pRyc+Mv+OpWEMAW0vD60iz9rdtwHbj+g+de5B/R6Jf2ZA
         Id0x20wVLLl7i0iZTky0o4upJb6sCBLlvXtsXCef7jrSDQCEvprL6cTKyJ51Vi4fAdbv
         t5T5EebEQj09IgyU0yeAJ+oWhQbaOMWzKjYX8n7FpLI4iQ67ko/Rt8I0hRJiN9/NW6xp
         twThh+nUIe4N78sJgLJVcGzp1ZtsIVn1l8tw7bAYdda1NpJAu3L9S65AyFnE6rwD6x3Y
         UyR/C1cVtns40GbYcuz7Oc1uLMEib1wTX4KZ1Tm6mKrA0nA+GwUMDbXh/brJ6mYxH/3T
         X7yA==
X-Forwarded-Encrypted: i=1; AJvYcCV/BtNrVgqwaiHe/N4MnHaMuXWSqtJNmmofUoT01/741JPnVPkp4gdFVBuP8g3lfO55cDv9TSZNFZvzjIaOC1prvNui4ctw70yIk/0Ert5vYxZsvj5zfJ+T8y3CgZlPsd4zhsM2jQM5QWGnCx4FJsIo0sitT1+8GObJ6mO7WXwRQeR4+KgAOGgWx4uzW39TXPhyMATdnEJ9LVX8e2WQHHCRCVqN1UGkyh5vN0uPbgAeiSuCDRyGLzeGnrz8lsE+Pw7FR6Nwiti53Lx8+aDdzn4QCBj9nYbDYldgWYzEFA==
X-Gm-Message-State: AOJu0YxSF6CcvH9qT1ALkXUGgQRpZfkNTwURQ1ob9rpgEe6hQlXb+zgh
	MBuMY5dv3mLrCbjWVbPspOGsXwwBAzRKKy/N6qgh3/usmyR5pIB2HrcwqlUB
X-Google-Smtp-Source: AGHT+IHxjd25aXH4Pg198Wdzat7g29/g3mpyPaK2cuNtRCeV9WCFBJbFMsrV78FnEW7acppO2pJ2og==
X-Received: by 2002:a05:690c:3501:b0:61a:fb4d:6fc3 with SMTP id fq1-20020a05690c350100b0061afb4d6fc3mr12942508ywb.35.1713865345073;
        Tue, 23 Apr 2024 02:42:25 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id p204-20020a0de6d5000000b0061575978d53sm2426862ywe.55.2024.04.23.02.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 02:42:24 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5240006276.1;
        Tue, 23 Apr 2024 02:42:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBe/ttW7jIQwk9mvXAqBujSj9nhpbCsQuTPJY0CECTUuPCrqHHiZhB2mFgyTMrI1nDQp6kb5glsHU4jLy3cr3NIKXyMQGCRXqPJ4AKP9BPNhBEIc4XzgvGCfD54yK/ckAKz/+72YFdRBJyhb9DMWhfpAzENfCIPQK1Uj3a6QPAAh7SANu6/VltdVwXTSt+TA88CQPrrDeY9YW4KnumNDzghIpiTFk8Jg8UhUGHGxfZlHw6pAl7h+gF4svd9Fz6G1BUGuohz8SsZKYRn1rwfc0sO78GOCH2II309HXqHg==
X-Received: by 2002:a25:804f:0:b0:de4:6aa6:9ea2 with SMTP id
 a15-20020a25804f000000b00de46aa69ea2mr11819127ybn.32.1713865344325; Tue, 23
 Apr 2024 02:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com> <20240102-j7200-pcie-s2r-v5-1-4b8c46711ded@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v5-1-4b8c46711ded@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Apr 2024 11:42:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com>
Message-ID: <CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
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
	Andy Shevchenko <andy.shevchenko@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Apr 16, 2024 at 3:31=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks for your patch, which is now commit 86eb98127332748f ("gpio:
pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()")
in i2c-host/i2c/i2c-host.

This patch causes regressions on e.g. Salvator-XS.

    s2idle:

         Freezing user space processes
         Freezing user space processes completed (elapsed 0.006 seconds)
         OOM killer disabled.
         Freezing remaining freezable tasks
         Freezing remaining freezable tasks completed (elapsed 0.003 second=
s)
         sd 0:0:0:0: [sda] Synchronizing SCSI cache
         ata1.00: Entering standby power mode
        +i2c-rcar e66d8000.i2c: error -16 : 10000005
        +pca953x 4-0020: Failed to sync GPIO dir registers: -16
        +pca953x 4-0020: Failed to restore register map: -16
        +pca953x 4-0020: PM: dpm_run_callback(): pca953x_resume_noirq
returns -16
        +pca953x 4-0020: PM: failed to resume async noirq: error -16

    s2ram:

         Detected VIPT I-cache on CPU7
         CPU7: Booted secondary processor 0x0000000103 [0x410fd034]
         CPU7 is up
        +i2c-rcar e66d8000.i2c: error -110 : 10000001
        +pca953x 4-0020: Failed to sync GPIO dir registers: -110
        +pca953x 4-0020: Failed to restore register map: -110
        +pca953x 4-0020: PM: dpm_run_callback(): pca953x_resume_noirq
returns -110
        +pca953x 4-0020: PM: failed to resume async noirq: error -110
         usb usb1: root hub lost power or was reset
         ...
         PM: suspend exit
         ata1: link resume succeeded after 1 retries
        -ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
        -sd 0:0:0:0: [sda] Starting disk
        -ata1.00: configured for UDMA/133
        -ata1.00: Entering active power mode
        +ata1: SATA link down (SStatus 0 SControl 300)
        +ata1: link resume succeeded after 1 retries
        +ata1: SATA link down (SStatus 0 SControl 300)
        +ata1: limiting SATA link speed to <unknown>
        +ata1: link resume succeeded after 1 retries
        +ata1: SATA link down (SStatus 0 SControl 3F0)
        +ata1.00: disable device
        +ata1.00: detaching (SCSI 0:0:0:0)
        +sd 0:0:0:0: [sda] Synchronizing SCSI cache
        +sd 0:0:0:0: [sda] Synchronize Cache(10) failed: Result:
hostbyte=3D0x04 driverbyte=3DDRIVER_OK

    When trying to read from /dev/sda afterwards:

        ata1: link resume succeeded after 1 retries
        ata1: SATA link down (SStatus 0 SControl 3F0)
        ata1.00: disable device
        ata1.00: detaching (SCSI 0:0:0:0)
        device offline error, dev sda, sector 0 op 0x0:(READ) flags
0x80700 phys_seg 4 prio class 0
        device offline error, dev sda, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
        Buffer I/O error on dev sda, logical block 0, async page read
        sd 0:0:0:0: [sda] Synchronizing SCSI cache
        sd 0:0:0:0: [sda] Synchronize Cache(10) failed: Result:
hostbyte=3D0x04 driverbyte=3DDRIVER_OK

All issues above are fixed by reverting this commit.

> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1234,7 +1234,7 @@ static void pca953x_save_context(struct pca953x_chi=
p *chip)
>         regcache_cache_only(chip->regmap, true);
>  }
>
> -static int pca953x_suspend(struct device *dev)
> +static int pca953x_suspend_noirq(struct device *dev)
>  {
>         struct pca953x_chip *chip =3D dev_get_drvdata(dev);
>
> @@ -1248,7 +1248,7 @@ static int pca953x_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int pca953x_resume(struct device *dev)
> +static int pca953x_resume_noirq(struct device *dev)
>  {
>         struct pca953x_chip *chip =3D dev_get_drvdata(dev);
>         int ret;
> @@ -1268,7 +1268,8 @@ static int pca953x_resume(struct device *dev)
>         return ret;
>  }
>
> -static DEFINE_SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x=
_resume);
> +static DEFINE_NOIRQ_DEV_PM_OPS(pca953x_pm_ops,
> +                              pca953x_suspend_noirq, pca953x_resume_noir=
q);
>
>  /* convenience to stop overlong match-table lines */
>  #define OF_653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __=
int))
>

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

