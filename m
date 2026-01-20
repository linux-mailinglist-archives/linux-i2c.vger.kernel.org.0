Return-Path: <linux-i2c+bounces-15293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE6D3C5A4
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 11:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 134346C0F92
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99733A901F;
	Tue, 20 Jan 2026 09:55:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85229A9E9
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902946; cv=none; b=doe8E2xJPOz5VSnnrka3EZZDLC2hsK3obno8hHSbrfUhWfzVYY//ae/54honvcMFNSR/8GiVmZfFPn3YSfIjnAL1hgki6jyGk9V8qN47nSXaXofXku4s31iAYg2ys2uSoWclMqwVu+UzUPAtEyB5+aditUihJ2FmIqvAGmyg/uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902946; c=relaxed/simple;
	bh=PhelJ3YKLy0g5664IUc1xRM3vK2MnAcXyilLWshEZX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cjo6jG52xbP0HP9ri1LCK/elKVD1DTcpObIYJltr/ZajVIpHCh6fUhIDtL0HZttJNVoOanGxYq/QpBTP8yoE7cL1IthqHGVj8U2xHv1sDiZqc0aRJpH11s0DXMV+mSQo9Vfs9lbX5oeyWfzYY1smsW8xdMkVT3sHLs7SCL5CorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-6611c401aa2so2134901eaf.3
        for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 01:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902944; x=1769507744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMqHiB2kIqqBrLa59wdqxa2/T5exJBY1xL1A1svqwlE=;
        b=EVhHpDnqB9eJ+7+j2dfdk9ShbfH9peBxq7Jzi2CPfmKqsGkWPmblTAgHLbcbgNnAxj
         TXYmXJhX2cF6Q4HGwUMfTf5IhyG+9nk6qVjUx0OBsDuqgseNKshfaqthdRELdp8S34/j
         pQgSBikuIZD9XAQ26zphjoc21xvxPr8ezQkpWm13RrvLGm2l+KYNlwc+f1aOC87sW+kj
         apWhrPtPkFTBKgUSowOFoFUWKORa2C+ULclYRu//OSL1O7j2/v+0+j8CyH9rSPJaHwj1
         k8c3EaTOXuZahl+cdCQ+uPLFRfRapIakZhV/uS7tGG/dH0xJZhgni7xGaIizzc9VFB3g
         /bJA==
X-Forwarded-Encrypted: i=1; AJvYcCXSzoitnZ9qruwJwdPioc++FjbC/n6xKXrEMBvoSbcDRwZ0O1aOAR1H11goMGClZTwjdwcTdGioAwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YydzwFwJQcshalFToqzGpoIlbhPZ02U21+fRnPKN6KiHJh7tN4i
	3+9kUEFRYOMyb2VuFkdOrw1bW8kdfVINKlYCwIXgPh0f22qgiJeM6npdVbHgxmLO
X-Gm-Gg: AY/fxX5XAJwEwB7n/qFdgXzT8GMr6FzZA1wBagqxIyqLVKLnWXMXUBPE57+L5gAFSTa
	YTm/qV+2I2nyZ6beYRXME8/BLnh0U5DzF6zc+CtP9cnW9cJMxqUSoHhrniLH1jGHGYSEq2i8U+C
	8XImFzjib42myLntzJ2Nu7mur/6zXVSu3Vr0cfB6taGUGcLLxxdTL/YB0En2N1zhwHWwZKfN3FC
	VoJuSBRWzyWtblw8LWsb2b5KoMO0c+Wqy8hCA8hlGgBeEqUepLcn/jOdIVAObczfn2PZaptvYTC
	trNt11SJGEzr8OpqHfTrFFqnmDIDCR4RzgpEdstwcOuw29EhoU/kHprYikN/nyBcQynOtlRV1Ap
	NS+TGIJjYemdelGazxXValXe1IGpdYdJWI735agyWQ1iOhVmG9Ue9+TR60KKMUNzs5X5avBqthw
	Nddl1jq1qtf/OHTmQSOXffZkpDNvB3OvaB5BY197G8Kb5Qd9qv5gES
X-Received: by 2002:a4a:edc8:0:b0:65f:5dfc:ed22 with SMTP id 006d021491bc7-662affa1462mr496775eaf.6.1768902943730;
        Tue, 20 Jan 2026 01:55:43 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66118781fedsm5779163eaf.11.2026.01.20.01.55.43
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:55:43 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45c958d48a9so2645394b6e.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 01:55:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpjeWVLKEVOs0llHKdYtPLXGFD3yBLJS4CFEIGCKodsSbctnn/kfwI1/qG7IahNoGSLC2O0hOs8wE=@vger.kernel.org
X-Received: by 2002:a05:6102:2928:b0:5db:f6ef:560 with SMTP id
 ada2fe7eead31-5f50ae0a099mr264663137.28.1768902583158; Tue, 20 Jan 2026
 01:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:49:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5shzYs27wO2A0SoisGBMo8RHf9DO-ubC6VrhWECEPCw@mail.gmail.com>
X-Gm-Features: AZwV_QjEUqevj8OUxZ5xnP3V3BgNbEzQSiuy0CgomAkdvyQGaaSlv633jCWavtA
Message-ID: <CAMuHMdU5shzYs27wO2A0SoisGBMo8RHf9DO-ubC6VrhWECEPCw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> Some hardware designs route data or control signals through a mux to
> support multiple devices on a single sdhi controller.
>
> In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
> switching between soldered eMMC and an optional microSD on a carrier
> board, e.g. for development or provisioning.
>
> SD/SDIO/eMMC are not well suited for runtime switching between different
> cards, however boot-time selection is possible and useful - in
> particular considering dt overlays.
>
> Add support for an optional SD/SDIO/eMMC mux defined in dt, and select
> it during probe.
>
> Similar functionality already exists in other places, e.g. i2c-omap.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

