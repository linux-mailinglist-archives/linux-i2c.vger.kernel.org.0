Return-Path: <linux-i2c+bounces-5612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC339591F1
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 02:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E20B1C21AD8
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 00:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CED82599;
	Wed, 21 Aug 2024 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0k+LUt/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8315227;
	Wed, 21 Aug 2024 00:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724201419; cv=none; b=h0K+RhgrswHCyhtZcpbyzuvVPM5XxA8SZ+m0hsVwP5A5WTsSPO1KImbT5P039XiIBGeVjmJBWGYLEzvO8+3sw0e0XzD/8oxZpA3CIiWB39GMiF/YhMoHJgbdHlEXEwJnbHyvq/Q9pf/YoLng8g7QZq1SpG30i1j9UjAdXVuFx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724201419; c=relaxed/simple;
	bh=msnacrG5UMQf3gDfya9KnhEJ/6a9EztOkkXB5ytvD6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T26zRyjsE2kR9ZsOZnNA6SQMpak5cxiKYV5qAlEgzojIE4MMm9CShmqbXUgGjl8t9GR7V28Qbm1eOFdwBH+NuCwKdihEQdnbl5ovNi1Ty+JTUKX41wefgIzaEQ5V8Y+EigZzgLFouc3q0g0+wYCEOY6yEzrSIsq1NpeHi3fOsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0k+LUt/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so7924019e87.0;
        Tue, 20 Aug 2024 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724201416; x=1724806216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoSSvwv5odqYZjwPeP5RG58rSx4Vvocb8gC0RlFGkyY=;
        b=K0k+LUt/0K/zErXYerNVG/CVVMY6jjZAV9zWYKPKfy5vh3XiRaUvymNEZA/01dGEMr
         oUGaBhO63Jbyj2+Ln+nSSB2DYnq1xlvtzoRQlUBhnt/DuwfpY3c7Rmwl7unOsCCnUx0T
         e4ON5O/88JFN7uwi4JTBVFKm9qYcUjbKTQQpGkyxEbnuM00nCngwrd8TCMmaeXQ8fPlq
         ZQwYzp71WF1UuKoe5HkujLFnI6Qv3iLmlUPjsZ/xN+cRc5nNKzlWB8o/DRK6M+hu7JPf
         s/xMAucMSv8JALXppsvJHjU3ZHM6FPZlZa+pdose2ETujW6ceBJgpQ3pEPiww6kMAu1u
         LH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724201416; x=1724806216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoSSvwv5odqYZjwPeP5RG58rSx4Vvocb8gC0RlFGkyY=;
        b=hxj0Y0xssInNOl5FvZhD2AyQVj8AVf3gcmGD0dEAOX/Xqbvxdx8Oz0sdY2Xde6kA+W
         uKuCKTe3Lbdzmd0t5MKQq7Vp/TtXkJT7XSdnZyuTCEY+sHiNsk8BrOY7OkZKc88uRIFb
         9lekC6GoS2cgTDFkur3AzAHNBO4uxLDjWQXBvsWxY1ARJlBCg1e46b6M/UNcRov/qSpY
         ZCKMfamjWWiOS2md7aMxjSrCBsypIJDTQCEuHgUnn6tEG8LFU+GS7R+ktULuOiM0YtlZ
         JCYRs1GMuxNoC+vYs1+EX16sLp1cWIjFDmiEudIz99I6hFBbQiq57dDmkW6YB0qAMdyk
         HXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBPRIwzSBqKqsTHpmydPJbwL2DyS9c2Xthso/2yjhP+xrv1zUhPIxhzRSJtC5oIWbf0Ck8MaWIGUo7@vger.kernel.org, AJvYcCURpkGlTiphm+K5sR/RYHErRBey59zF38A57SkcypVvF1uKwEAsNW4L66ysJTd3K0tdIkiljAn3zYHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcxw9RQGHnY9SMNwgFs44IPLQbV47jgIsuFYUVPE6u2tszp3aC
	jbhB2lRJbbu8RXbM1tTX4F6R/ObgIHrHf940VXLt+GSkiaR/lyFU+xLCFTNGcHryLD8JKhRSP4S
	YLPYse5l2D+FrNYFXcjg1DaNvkZJgjstv
X-Google-Smtp-Source: AGHT+IGL5tlotafgQN+H2oUJsy7bZc97bFjxi9+qWaGa49KFqvRVw45iOBGC5pZO03tsbf3cUpFaLShwN4gYw0QAdfs=
X-Received: by 2002:ac2:4e09:0:b0:530:e1f1:8dc9 with SMTP id
 2adb3069b0e04-53348590f43mr242435e87.46.1724201416012; Tue, 20 Aug 2024
 17:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
 <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
In-Reply-To: <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 21:50:04 -0300
Message-ID: <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 8:18=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> The pca953x driver tries to write to the i2c-2 bus before i2c-2 is regist=
ered.
>
> This is the point I don't understand: how can the pca953x driver get
> probed before its I2C bus parent?

Disconsider what I wrote above.

I'm trying to recover from the arbitration lost like this:

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -491,6 +491,8 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct
*i2c_imx, int for_busy, bool a
                /* check for arbitration lost */
                if (temp & I2SR_IAL) {
                        i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
+                       pr_err("******* Arbitration lost\n");
+                       i2c_recover_bus(&i2c_imx->adapter);
                        return -EAGAIN;
                }

@@ -1487,6 +1489,7 @@ static int i2c_imx_probe(struct platform_device *pdev=
)
        i2c_imx->adapter.nr             =3D pdev->id;
        i2c_imx->adapter.dev.of_node    =3D pdev->dev.of_node;
        i2c_imx->base                   =3D base;
+       i2c_imx->adapter.retries        =3D 5;
        ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev=
));

but still get pca953x probe failure:

[    1.756761] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.766564] pca953x 2-0020: using no AI
[    1.775333] ******* Arbitration lost
[    1.783811] ******* Arbitration lost
[    1.793701] ******* Arbitration lost
[    1.797455] ******* Arbitration lost
[    1.801209] ******* Arbitration lost
[    1.804964] ******* Arbitration lost
[    1.808562] pca953x 2-0020: failed writing register
[    1.813602] pca953x: probe of 2-0020 failed with error -11
[    1.819222] i2c i2c-2: IMX I2C adapter registered

