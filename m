Return-Path: <linux-i2c+bounces-14920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C22CF8B98
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 15:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 433C8300A534
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 14:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2313F3126C3;
	Tue,  6 Jan 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOOHiz+z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504A30EF90
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709087; cv=none; b=AmkLKQSkViZ+wkWDprCKNU12IDDXkLpgIBiBSBn4POfGNEczThtO0d6nsLBKiTSH1LQxFmSHSq25EOVJVwAXA9AKbTMjwJFko04R/m+mHV8A3MUPHBEj7cHBS26MXoMd/3TFHaAxpgqpkI6/rTDHbkQhPdsxzk0osMwqkU9/9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709087; c=relaxed/simple;
	bh=9Ym168jY0juUmceNY7e8j0i+6pSJU5pRFOBf6YtVzDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLibY4Fgu8bphwU5GktKaWj/naEUlVF8zeyzDvDxus+21W/XuUaUjeDGuViqRlkqr9g07sKEJa1NL6fyVSHJIIhH12zuWXYMxSJRCyFFax4OBUqE/WV78rYHjzi4kVsi/lhrr91e+zQNzSWTIQoAxb9/8FaZjuFYMOKmsd+/Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOOHiz+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619AEC16AAE
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767709087;
	bh=9Ym168jY0juUmceNY7e8j0i+6pSJU5pRFOBf6YtVzDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bOOHiz+z351DggBlKZJG1l4SIBZi5rGrJuMJFrTSuCC2bhYg3GVmw+EzTJ8+4o8d6
	 mfYKrjdZQleutU3LNIOJvytnRti1+tJxYEb5+FMc6i0af14bQLGN0lgtW7mtsU2Nzu
	 6ryFz4M8Vn1p9iUNI1fLTWCa+m4bpeR2lNFEDKERvGn1VG6CP12akkl/4e/LRbhqaQ
	 62Twt75lEl7bQuHsNLBEHkd+BPwKedPvj2JfLdCbCO/vQwTZc6DBtiCiXsT/Efz4cM
	 7UiMgJqXCVK8SCkbDxCkKvsHQiwcHjxf2pPEiyTaEp11J2cA9WDICgY+7wYxuhNMRE
	 KZcuMKroFvL4g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b935df7bfso9237561fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 06:18:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJEt7nFImM7uQ6LFjoAwJxrK2ovh4ZOSzbj/v+U5G/h8XTUCZKLKaI/i1sCKeKF0zkmnLxRkQFQQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqzg4d3um4PK9fBc7OtgOd4CFQ+TWeYjbHh3QhgqPtkaK0qRPL
	MyDAx9gMv1P8SLBRf0zNEIRZy9UWJK9XQLJR+jwMwmZLIlcKJ9wPbxJTsPWYwMg7Zm155xa/Qe2
	WvEhnFeOD5CwKLPTWaO2aoW1QT8fA/gwAB0yVnxW36g==
X-Google-Smtp-Source: AGHT+IGMmSz6Ltdahe1rVY6f+YVLJmMwESu8W203AziADCClkRGLN7rkSW5dIW6LKxsDjFSC7ntBorz6/82D0HbV854=
X-Received: by 2002:a2e:bc15:0:b0:37a:9558:5bda with SMTP id
 38308e7fff4ca-382eaa05568mr8077901fa.14.1767709085885; Tue, 06 Jan 2026
 06:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
 <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com> <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
In-Reply-To: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 15:17:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=MctSufFn4Ku_8KBHmThvNOXo94DJDep-hzBem1yGw4wkg@mail.gmail.com>
X-Gm-Features: AQt7F2rlYGWw0wYVcdfcu_38DzK8jJE5ZLbWHuaZHuyFfl6BwHPNSW4tcfiCMeQ
Message-ID: <CAMRc=MctSufFn4Ku_8KBHmThvNOXo94DJDep-hzBem1yGw4wkg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 10:14=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Configure the parent device and the OF-node using dedicated fields in
> > struct i2c_adapter and avoid dereferencing the internal struct device.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-rcar.c
> > +++ b/drivers/i2c/busses/i2c-rcar.c
> > @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device =
*pdev)
> >         adap->algo =3D &rcar_i2c_algo;
> >         adap->class =3D I2C_CLASS_DEPRECATED;
> >         adap->retries =3D 3;
> > -       adap->dev.parent =3D dev;
> > -       adap->dev.of_node =3D dev->of_node;
> > +       adap->parent =3D dev;
> > +       adap->of_node =3D dev->of_node;
> >         adap->bus_recovery_info =3D &rcar_i2c_bri;
> >         adap->quirks =3D &rcar_i2c_quirks;
> >         i2c_set_adapdata(adap, priv);
>
>     [....]
>     ret =3D rcar_i2c_clock_calculate(priv);
>     [...]
>     ret =3D i2c_add_numbered_adapter(adap);
>
> As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):
>
>     #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)
>
> I believe this will deference dev.parent before it is initialized by
> the newly added code in i2c_register_adapter().
>
> Let's check...
>
>     Unable to handle kernel NULL pointer dereference at virtual
> address 0000024c when read
>     [0000024c] *pgd=3D80000040004003, *pmd=3D00000000
>     Internal error: Oops: 206 [#1] SMP ARM
>     Modules linked in:
>     CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     PC is at device_property_read_u32_array+0x0/0x14
>     LR is at i2c_parse_timing+0x14/0x30
>     [...]
>     Call trace:
>      device_property_read_u32_array from i2c_parse_timing+0x14/0x30
>      i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
>      i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
>      rcar_i2c_probe from platform_probe+0x58/0x90
>

Thanks for the heads-up. I'm still waiting for Wolfram to decide if
these changes will be accepted or not before sending a v2.

Bartosz

