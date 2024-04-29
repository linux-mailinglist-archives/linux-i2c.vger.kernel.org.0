Return-Path: <linux-i2c+bounces-3297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0BC8B5A3E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 15:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068FC1C21367
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 13:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2236F510;
	Mon, 29 Apr 2024 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="pCGJMsAd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ACE6F53D
	for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714397930; cv=none; b=Ovtpj5tGG73OwGoHFGLq8XRBQfzEwTrUofm0oVhTR7uqjADGx9OFrZCaw6IdMHiV9CMHnVdfHPHeB5SA8XRsoiqVwXqC5lNtEyIVWXCrs1PcU7K5kY3N/FK/xTEe27en5uqdCzu1TAuXcc19u5NUAy3JSOH8OBQf4NsKKy4WCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714397930; c=relaxed/simple;
	bh=BgG4r2ZzwmkVHoC8Y+iUIR12GGobZxPL3TajjFp3CA4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIVvtpSyqKWH7UvDu/LLaNGbMLaggpfFS0AANVqtlPkwBHS2A+31N530v7RQIPTEd0M98/9saPzrjWfqgmJgdA0JJhfgayQhz2wI5KNZsrRku+m2Yg1dK71f6q4J9QK3rEcfNQQziaOgtlv8Kv0r3nnuwMW8A4d+otF6uBwfu4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=pCGJMsAd; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FE773FB72
	for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714397922;
	bh=kzInz2Vec2Du6of2Q2xRfBv09lBEjQPll+bykpZr/3A=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pCGJMsAdbesIO5ygg3UU/dSWG3Qg8HAkgdKKtP9gtIpmvWefBNOvAIoqFlkmcLNcX
	 OxWpOAtmIhUjr8boeRNL/NYoE4o1+ag5r4RKC7odHo8OuLiMJSTPYx0BOZ8bQns10J
	 A1uYMvBAGE+P3GvMPgHuVwBZdHkzZ5+BygDRR4Re/4mgikEVy6GPttqjJgmlrc6uYw
	 bvp8PsKmcMmcY0z/02itUeeWNe/9CgCUOJ05C+uUL0BIzaM6cB8we6jR5DLa2c3hFM
	 /SJE46Jang73dLYHS0ykJ8Pc6twXOcpdCgRgEEnQH39mmAQIlFr+M3U2pZfqAKLmJ1
	 ABacP53ckffSQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43ad0f16513so12269161cf.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 06:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714397921; x=1715002721;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzInz2Vec2Du6of2Q2xRfBv09lBEjQPll+bykpZr/3A=;
        b=Y1/yu7QVp1a4h//Q7ehfNzocDOu8ZdrL6vJOhimaizFNI91k2Mzeb/b+wWKZlezEdW
         Gf9bAobNnRnhaBElIdLeZp3w8QbmbRoFHXhLoO0K2a0Ng7zKijkeAUfGxkQdKDAHem8y
         pQ+8xsAxwpC9lCO3KXy6VUc8bzkILpR91vQZ88odw2cYzmrDJxfMezDEdsMPx3oQRVTO
         sKYr7qzmnSb+5YEeVSCXOvjMFgosfUhrlhWsbKzsf27CfFUKeZ0UxrzerMEKX4FxHRxW
         5jt8sStm5DUUydET37KGIT59HriFWgynPT2RoyjZELp3vS2o9lv4F+q3rjPOcxbJKH1E
         wp9g==
X-Forwarded-Encrypted: i=1; AJvYcCUFzkqMLQaZStpKtanwKc5FPc2IDqT0xxLWY7WuijAuAJIizfmO8GHSkBL6ZtKCG5piacErqr/f+WwBY7HuzihrzZ6YsIF4bjnk
X-Gm-Message-State: AOJu0Ywons3ud7hDKjpy8s99NPRrClP+wBaPaWFkLF+Ubf+yOAvp75nX
	qNa6N7pJAxjntnUQJx//xyaceGaVm5JqfADtdf9D8r8kAFJvV/oflEjq6rYGM5QWWM6gAXXmUVK
	u5s1XKPsRvsKiXbcfE17xFWLJjSA1/HOYPApq5NkfiB6he9HKXhJN1ogZTIoLdA7Sw0fVO4h9nL
	0K3lmjohZcqXDTzT4K+pY9HtDsWexBbJjnD4TtheezgbIx0k0V
X-Received: by 2002:a05:622a:d2:b0:43a:c1cd:2f54 with SMTP id p18-20020a05622a00d200b0043ac1cd2f54mr5559221qtw.56.1714397921132;
        Mon, 29 Apr 2024 06:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeybrboGuMYLfrb0LN1/Eksczu7rd1QL7MzncvDdBt5BJRSCjVGbxulLQUKQopeFU++pv+AdoWRrTYLVYMbT4=
X-Received: by 2002:a05:622a:d2:b0:43a:c1cd:2f54 with SMTP id
 p18-20020a05622a00d200b0043ac1cd2f54mr5559199qtw.56.1714397920849; Mon, 29
 Apr 2024 06:38:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 06:38:40 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240425082138.374445-5-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com> <20240425082138.374445-5-thomas.bonnefille@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 06:38:40 -0700
Message-ID: <CAJM55Z8Nj8WAohbANf99nznKxkrTMnSxyC8imYXNJZnuC0XH1g@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, jszhang@kernel.org, guoren@kernel.org, 
	wefu@redhat.com, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Content-Type: text/plain; charset="UTF-8"

Thomas Bonnefille wrote:
> This commit enables the I2C0 controller of the TH1520, together with
> the FT24C32A EEPROM that is connected to it.
> In addition, this commit also enables the I2C controllers I2C2, I2C4
> and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
> P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index d9b4de9e4757..22a6935e7204 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -79,3 +79,25 @@ &sdio0 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	eeprom: eeprom@50 {

Nothing seems to reference this. Are you planning on adding adding some code
that needs to read this? Otherwise the label is not really needed.

> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};

Does u-boot or some other firmware set up pinctrl for these 3 I2Cs? Otherwise
enabling them doesn't really make sense before we have the pinctrl settings for
them.

/Emil

> --
> 2.44.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

