Return-Path: <linux-i2c+bounces-14907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95329CF788F
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 10:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1716F314F963
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 09:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2D7313293;
	Tue,  6 Jan 2026 09:22:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EFE31283D
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691346; cv=none; b=e4+yMyYiWvsshOLavOF1Tl8IBkXmoB7wUi49cl7WPnTPF4ahICuf8tMCYHr2gyma6S2CJ6dXW0YT/kQprU1rDT5K4Qzz4wPu7EhyvKEMsCIx9lJtbX48JWoz6sFLDnNJAvlBarvM+bimsXPmWiZTxvhaCh0Wu02BMVcDFJ/KM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691346; c=relaxed/simple;
	bh=oGWEDzx0GCta1OvN+DPAb0Ri8GEUryM+YKckFtZpRpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vs1728Aw+PQ7ZW2gjCwaBMkPsB0uBIEAGYXgVEqKjMXgD84Fh0uz7cicBd24MsHFqb/i5F+Y0Y9l5ZboYJO2ts1rNBX/9Obp5f+HWbmatl7OFsvZN0VKi+zooLWl+Po9J3VBY/ZJxBk7S634gUq7FyKA4ovLhtD3xwp01mCvzDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-559836d04f6so526043e0c.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 01:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691344; x=1768296144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=;
        b=cTupWFrgDv3eO9ZeqAiGrv1HcpyBacZuUZLVclKDH0/6PpOhM3xGfLX1zVPRlnKDhD
         cqTPi/5hEoJYZTi4pg07U2xGDS75zas7YUaaan6pxuwU9nYxC9+/76RI6k/REqBvZ4PR
         YeIxtXSWQ3OEux3oc1RG1Jm2TFwQvPYO6i2Ih6dGqh3SFgT0wX30ERSshD+EXnNiBZym
         YZaR5s00FGEObh56TrwV6+IrECE7S2whwRUVywmfDAPdSIxITvlLFUUyd/+U7ByPp1Z9
         L1t9SvmNWmbfOVv4Xky6WLFZ8kW3NGi645b8W0qDdhDM/H50xRLymuIwUpA1N+SNl45+
         r2dA==
X-Forwarded-Encrypted: i=1; AJvYcCXI9FogK6BmcWjVoHn5uVCBDBjMnKLad+F2HLSGpEAUS2BwgrCfr6gy/q7nnd9PRh8zi39axMEz/Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YySIky/xeamy8s8jAtKEBJAJGEBppJ7Te9X7GbvCYKraHNg8ZS+
	FtglnELnH9G73hjum13WSdKOcSta2ugwuzhpNwkJXiRDRVe3xYWnwg2/tzZOcONR
X-Gm-Gg: AY/fxX4Eh0pLbEI21je3Y6ZkIXpgiIzhkbOdA90QLIIoikL2CUNZUyBA6SK7T/vUg32
	/gqXVaiGs5CQ/gileOl6uWZ8L60hqWAAmDZHcY1ggONi01ZAIZvPPQYyqS45aVLyOyMaCAGCknM
	+WRiRdKvIQZ4AM0aua3SQW6fXPkkp80xb5OEQ6Vm+Wa3QpErxxr5gH2vdvrD8dXRJhpf6ubJSOD
	ZZBlZ/KLcRKEqUQpPWoNcjUiUoOk5gmCg5PRNP82HhPPm/XUiYF2CVWSjZaxCSaVXA+gUvFzE0n
	Ek40OiZPcBHzVvnp6SQ+b9362UBuCOO80PNuQi4bkid+NcxrqWcCMZRcF/bRdwp7OJ61W2hQbIe
	GCiD2Xi63pe3J39YuXxwHuAm3xRNfxvPfCMPP6NqmPTw1LrpkjHUX4exw4CDW3+p59PzUXVRNrQ
	8wDVhYtdGxs4IiMSYOZulvDHjlp2Wd+dxE9JYSzVuqhH6ilRZQL+7ktmhL8RhXAKs=
X-Google-Smtp-Source: AGHT+IEKnJNO2RKi2ibn7u3bZPRaojkstTP1R/1nmQZ4dDMLGYsvE6PiT2R34AMbQ+/5vLXDWcTJlg==
X-Received: by 2002:a05:6122:4589:b0:55a:e007:4c7e with SMTP id 71dfb90a1353d-5633946af95mr754776e0c.6.1767691343714;
        Tue, 06 Jan 2026 01:22:23 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a4141e6sm497139e0c.17.2026.01.06.01.22.23
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:22:23 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5598b58d816so561611e0c.3
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 01:22:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3E/NL/dfUClrQ7TfncA7zt4kGr2zJx0KGWgI4rtMdz6c1p87bOYYRBQp88s+8j6Cqi4Xv9HnVlxM=@vger.kernel.org
X-Received: by 2002:a05:6102:6a92:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5ec74524009mr734718137.28.1767690842994; Tue, 06 Jan 2026
 01:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
X-Gm-Features: AQt7F2rMrz4VfFE8hOXFGnfaW6TUCM_pC_Fx6Bfylmm0kWFPuXvkE1g4WrvoTA4
Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
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
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         adap->algo = &rcar_i2c_algo;
>         adap->class = I2C_CLASS_DEPRECATED;
>         adap->retries = 3;
> -       adap->dev.parent = dev;
> -       adap->dev.of_node = dev->of_node;
> +       adap->parent = dev;
> +       adap->of_node = dev->of_node;
>         adap->bus_recovery_info = &rcar_i2c_bri;
>         adap->quirks = &rcar_i2c_quirks;
>         i2c_set_adapdata(adap, priv);

    [....]
    ret = rcar_i2c_clock_calculate(priv);
    [...]
    ret = i2c_add_numbered_adapter(adap);

As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):

    #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)

I believe this will deference dev.parent before it is initialized by
the newly added code in i2c_register_adapter().

Let's check...

    Unable to handle kernel NULL pointer dereference at virtual
address 0000024c when read
    [0000024c] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 206 [#1] SMP ARM
    Modules linked in:
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    PC is at device_property_read_u32_array+0x0/0x14
    LR is at i2c_parse_timing+0x14/0x30
    [...]
    Call trace:
     device_property_read_u32_array from i2c_parse_timing+0x14/0x30
     i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
     i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
     rcar_i2c_probe from platform_probe+0x58/0x90

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

