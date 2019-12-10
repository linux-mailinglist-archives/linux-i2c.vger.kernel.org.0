Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD001184BA
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 11:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfLJKRU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 05:17:20 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54840 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfLJKRU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 05:17:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so2473885wmj.4
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=xmLlcTghzPFIQ8mfUoSKx274MOGK7c0q1BOLA3zin5c=;
        b=fcSvCZuDu/jCInvDVS5idg2zFC+JxUezgWsEzS5YwYFM1JFAhzC92Nm24kZZOmk094
         RfkjjBX4Tl7pVGKiTXkb6ZXjC8C5cdJ/xvvMdZu5xSlYUlCaPYcv4skpDFMDdUy6wKkE
         j81+cogTRKJl+jY4iIEWkAoeVhuzbSa1Sg3rYZ2J/NAC82qC8k4qMSaQ9SRIMQ1Xs9VM
         XIeopc2OHN73WVTc7bcO1iL6c8KxgROgkxyPTdf8WVQ+OZrbg/S39bH4Efd6uV/iI781
         OYm3bzPYAf5N4zJXWgkloQEMKq6WKNRc1Jp54ueSiHCXeH4J9ka0xLNn64pC13mRi3qz
         2oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=xmLlcTghzPFIQ8mfUoSKx274MOGK7c0q1BOLA3zin5c=;
        b=lnWfQ14JitIWPJv7p8wbalPTAlpcgQKTZ7u1kGJyxdWSs8e9ZAruBAwtWCDTVvHKJ6
         Y2IP3qFNN/0EeutKZOaPPYq3AQ0juEUq9U2E7RQ+Nbg3r9W+s7L3ZEg5QGf8dEPAOTOX
         mqaCxnA2zxNucWdYpCKBz1cHs/naSKqPgTwXb0hkWZrV+09IcsHRv1J66nSp7vVc2TUv
         McXy3n5nmSZL+7prLKGg0IaIw6MOFNUV2K9cUovWC9WZ/WC0hDcYhLhGKmn33A9F2hSs
         TUbc7jmW1VeUlMjVTbnL2KJ6WzO3B1zcHHNEVy7XU+w7hT9fQqprqUrkUUt4SD+o3v2X
         hcrw==
X-Gm-Message-State: APjAAAWqJdIXSUtMC3l6WISVbhg+PAt0aNFmhdy4WFN9S6KKQih60ZT8
        FMurQ2ThQMDyqh959p5qyokJ/Q==
X-Google-Smtp-Source: APXvYqwVnyN4tOCPyX/fALkBBhtIPe2HLM6zr6GYhucBkFtEKMV/e/35eKhQlSa5MVPgf6uQKl+RIQ==
X-Received: by 2002:a05:600c:507:: with SMTP id i7mr4398123wmc.135.1575973037693;
        Tue, 10 Dec 2019 02:17:17 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g2sm2697067wrw.76.2019.12.10.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 02:17:17 -0800 (PST)
References: <20191202111253.94872-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-reply-to: <20191202111253.94872-1-jian.hu@amlogic.com>
Date:   Tue, 10 Dec 2019 11:17:16 +0100
Message-ID: <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Mon 02 Dec 2019 at 12:12, Jian Hu <jian.hu@amlogic.com> wrote:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG.The I2C nodes
> depend on pinmux and clock controller.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index eab2ecd36aa8..d0a73d953f5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -16,6 +16,13 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +	};
> +

I wonder if assigning i2c bus alias in the SoC dtsi is such a good idea.

Such aliases are usually assigned as needed by each board design:
meson-a1-ad401.dts in your case.
