Return-Path: <linux-i2c+bounces-15291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A1D3C460
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 10949460618
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32363D6498;
	Tue, 20 Jan 2026 09:42:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389A73D649A
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902142; cv=none; b=RklBkEVxXXo+hrDMBkNjW8PGSHbza6aC5IopNV94JMwaJhBz5wTIOBh+dtIlgJI/KEm0zonpb1AGqbPJrrnSi6AZEmgF/0XE8FeTlUAlXTGVgisaxKI9FqiryV2MwXlSA9RWS2EPVWVKXZWF6FvhXG3noBwmiYABDTXjTo9uRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902142; c=relaxed/simple;
	bh=8oF7WvkLTpbnCP6yb2DMCynlFu+13M83ZUzjQuNxXOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc/I8hZQ9oBT/+41ccmCk49hVetyP7Bp1Rb5mSRg0ijD6yTQWzy6y5+TdxjzAl2qkKmJKy1nLlJTOelHsO+bQrjuasR1D3VV4Xz3ksEcapJcFz+DGdsjlHSPrf9OG8hYW6OqETvcoRXBjWNiYt8kgEvAjRMe5CmdgJ5jB1NJlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5eea9f9c29bso3586333137.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 01:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902140; x=1769506940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97LNh80TR77S8pwS2e4ZBU/MTmpHjj3Q16znIrdsedk=;
        b=lVAS0I58cpBx4JyGj3jA41+/ORTLchBVGYoq2iY3Cs1OiDV1ehkxKHAuoz1WzKprZ/
         NJOSnMxK9rF3SY5TWqHBA9a1jGoZYqitoXFAwEdrnIPbxWYaeTwCFIe30aKz1ywL+tH7
         5tIGfpGisrgvF32n9XOioh1lWPA35SqIp1nj0FK210QwZjXvmUnD71+xUATJ1IX0XDoQ
         iapw6ZxkCG60fXnqvy6zVVnsTxmaYsnMVXBDPjz2F0etMfTHecupibwsNy6DkYBWMOuD
         42J16XtAMkILVaqkPadIbXC6TMOo6hRupkBO9H3UDKPEH2ItJjEXhaCiMSkDfzWzOhrL
         yFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDb2Z9VTbP2Z2MvGPyZhz6/q6iWy1Y2YaW7AVktMUIw73XCmR95HtJDB/sTsKd+OEJftY8xpbgX2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvI0dn0oFYhnjUEuDtiBtlPIPQihqGqZs1YuVJPTzi52xOTiT
	08DrxsdgHLIBZIM2P4dIzVJNRkvV1lmyteY2GtkG4uqANfPWv5clphd3lX+HD/R5
X-Gm-Gg: AZuq6aI9Qgu4cIrqov7ktxHIf4X3JAqUjWBD6mVGvf10xJs7vRGnTmMpeYsTfQy3KbA
	vlSwvYEUtiY19s3iTDXceS4Ecu6GzU1pJGsdibethnonqJ0XixkDzN3xFalcPb+e3vnYESmy4ta
	em5HWe3LDeCEh8IGfGKGxVJJzCHw+YCALdp1dTUMfqHglvro9Q2Cg304+WUON9UZXg1r2fvr3Wk
	RMD2dEnvPf1QpVQzH2ho55uMQ/c45HFZfX+0otg3D4S0806rqh6RktV6JbB517ztJ+MUz7DlN2w
	NN0fflowYxIsiOPQYFUk0OF2wEEivoL759CaKlq/Mqa0m7xrPyNQqPbJgYhWkVsWPGQBG9ssBQj
	7ntYzJEc8p4O3SKer0FlwQy7GdcDadXawY39ATzyXQr6tx6VPnJU9F25jiyhXgtiCZ/xhBD24OQ
	vh07VxuaJ2PV1KK4C4m/emNwYtbrx8dDjccFh07DYK271dtkNA
X-Received: by 2002:a05:6102:3f0f:b0:5ee:9f7e:b3c7 with SMTP id ada2fe7eead31-5f1a6fde3e8mr4395166137.13.1768902139995;
        Tue, 20 Jan 2026 01:42:19 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a68ff962sm4366836137.1.2026.01.20.01.42.19
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:42:19 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5eb8f9be588so4673639137.3
        for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 01:42:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUWAma0y0FAucbJ5EXLdgyGUb2pggQrgZm/yWxoLbngh1Bg1ItpZH+rkm1NoriTAaOq1EmFkRDsg4=@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:530:f657:c40 with SMTP id
 ada2fe7eead31-5f1a712440dmr4338759137.22.1768901715766; Tue, 20 Jan 2026
 01:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:35:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVf7MjEAaTAy3kgaTcfs240UcnL_yFWfYH_eqVfp-6jvA@mail.gmail.com>
X-Gm-Features: AZwV_QifN5dzgWIfmsNWfdw085d37JEd6a5y3M-TObPOlkszfcRmE9SintqdNzo
Message-ID: <CAMuHMdVf7MjEAaTAy3kgaTcfs240UcnL_yFWfYH_eqVfp-6jvA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v3 is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

