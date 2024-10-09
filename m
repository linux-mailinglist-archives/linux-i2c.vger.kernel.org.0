Return-Path: <linux-i2c+bounces-7313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAD49970DF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 18:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7491C22EB6
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5101E47D7;
	Wed,  9 Oct 2024 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnKX3J28"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B7B1946C8
	for <linux-i2c@vger.kernel.org>; Wed,  9 Oct 2024 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728489175; cv=none; b=J2MGPn/mevyCoSt1yjwyRRsNkPwlVarmHlaEJk5/ULqP/Fy7TT7nY8h1LIvLJvGRVAdS02Z0QLxdiYSIF/WPjPYG4869x+DniY4nY0xUyTmxhFwwOaBRpIrDQ4N/jvBpiQ7MndPY1W7ZpgOiK9Yf8v0q5Sf74JaqkTVUEJGjNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728489175; c=relaxed/simple;
	bh=3sFHZmEW2MjxExkKM9sDczuMrw5pPLpbF/k/0RGwpy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdi/vKLwtyriNDFBKxQo+HOAO+wdQc9lRsYM/SUioiezKGyTcgQ9q4rOtPvzrHOp+RdFMM1u8oraErFLY+yxHSKj0bFDVaxNZAuErs5Pr4t1zsyNDtBaiPu3OzPPzV1eaNOum/bZWfvYKJpVxrZXaPJvY1JWFfZc8TKJknEydGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnKX3J28; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so94069411fa.2
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2024 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728489172; x=1729093972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bHHWA6YgsIIeE/IuJksmfuFV8ppv+azpUN36MH750Q=;
        b=fnKX3J280VnWc7hVq33ZOmDU76kss7vxFPjJd1KrU9R2KGGrMsNesmCvvWaBBGiKGu
         7YSwo+YfDZhttlsHNxl0Id6P+2kjddNNQErwjKLbPhodHF6yuiosYmhYfT06GOv3+32b
         r7U+czxl/hj9f2ARaw2gJXJBrQrWsE1gWyBQ2p0NO0BKnB1yaoniLAVWoNFqTm/NdrAy
         veZnG/W+Bf/dDJHTTSlWR+321qsO8r4Ih4b9ciHgZXHsoxKpFIDDjKwFd2/sp/kv/BEq
         Xn4J+Z1Zbg+eLSK7J00aieXZepk7JNuVmCnIH8K2My5GRjfdTqJfGH9d3NDv5fEYvV70
         epxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489172; x=1729093972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bHHWA6YgsIIeE/IuJksmfuFV8ppv+azpUN36MH750Q=;
        b=CtzP61mCPa03uj+dlyzWrBJy59wNc63m6EG0Vc1K/rTXqpyrThocZwiDkgPMa1ciCf
         Jdp4LHyVoS3Etu5r1bDE1ohtPw8z5OdbWDjpUjLjJEh6Grf4c7syTlR2ehk77iYMRXrv
         oRBlVZY6TENu4WIN1SON6uIxN6kPor0ZZo70ZBPa6v9Cz/NpqVc1ob+9VOZZTAk9jofg
         snzfflqNxKCsYvPBmouwOvM21uuicWAoN1n87mPs82wak2OGfRYArVKye2ZEZwYhJZsg
         MMGUMkDouMh0gPlP/35ib/4S3z1tjgAitx/fxGcT05PhcmwMhWj3tronL1LBv47vtjoq
         dRiA==
X-Forwarded-Encrypted: i=1; AJvYcCX7D+nNwuFEuVixUzB7oI0lIO6bGCd8a885xT3UrIGpuy7p+qtUWk5rM472+cgpDH/i2gw+HqkSYL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3MWAZ0dznrljmeGaCmdlKub0bmE1xH1TcmOdElQpSLT89LAoO
	1m+DMde2lGyIuZfyucqaAZ4SEjQ205I6sqREpgaHVcniUVyu2uDs6z0cwJUnoongvkrf39Mhw8s
	ZUDIqOP1r2DEoYLlw9/Il/xYMB7D4igid/p7jfg==
X-Google-Smtp-Source: AGHT+IF8wf3YGhU7Z/W/G2IJaCExiz0JJfA8GJE3/xgVnwbP5cIqnmaCszaOB+meGFdIXUMiUrW4u9T2Eo1BiLhyv4E=
X-Received: by 2002:a2e:a9a8:0:b0:2fa:cfba:fb7f with SMTP id
 38308e7fff4ca-2fb187f36c3mr30878311fa.40.1728489172271; Wed, 09 Oct 2024
 08:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com> <20241009-mbly-i2c-v3-5-e7fd13bcf1c4@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v3-5-e7fd13bcf1c4@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 17:52:40 +0200
Message-ID: <CACRpkdagORGgjjhJOxkU445EQ1AGz-4j15E=tGCrvEx7hAnHAQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: nomadik: fix BRCR computation
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 4:01=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Current BRCR computation is:
>
>     brcr =3D floor(i2cclk / (clkfreq * div))
>
> With brcr: "baud rate counter", an internal clock divider,
>  and i2cclk: input clock rate (24MHz, 38.4MHz or 48MHz),
>  and clkfreq: desired bus rate,
>  and div: speed-mode dependent divider (2 for standard, 3 otherwise).
>
> Assume i2cclk=3D48MHz, clkfreq=3D3.4MHz, div=3D3,
>   then brcr =3D floor(48MHz / (3.4MHz * 3)) =3D 4
>    and resulting bus rate =3D 48MHz / (4 * 3) =3D 4MHz
>
> Assume i2cclk=3D38.4MHz, clkfreq=3D1.0MHz, div=3D3,
>   then brcr =3D floor(38.4MHz / (1.0MHz * 3)) =3D 12
>    and resulting bus rate =3D 38.4MHz / (12 * 3) =3D 1066kHz
>
> The current computation means we always pick the smallest divider that
> gives a bus rate above target. We should instead pick the largest
> divider that gives a bus rate below target, using:
>
>     brcr =3D floor(i2cclk / (clkfreq * div)) + 1
>
> If we redo the above examples:
>
> Assume i2cclk=3D48MHz, clkfreq=3D3.4MHz, div=3D3,
>   then brcr =3D floor(48MHz / (3.4MHz * 3)) + 1 =3D 5
>    and resulting bus rate =3D 48MHz / (5 * 3) =3D 3.2MHz
>
> Assume i2cclk=3D38.4MHz, clkfreq=3D1.0MHz, div=3D3,
>   then brcr =3D floor(38.4MHz / (1.0MHz * 3)) + 1 =3D 13
>    and resulting bus rate =3D 38.4MHz / (13 * 3) =3D 985kHz
>
> In kernel C code, floor(x)   is DIV_ROUND_DOWN() and,
>                   floor(x)+1 is DIV_ROUND_UP().
>
> This is much less of an issue with slower bus rates (ie those currently
> supported), because the gap from one divider to the next is much
> smaller. It however keeps us from always using bus rates superior to
> the target.
>
> This fix is required for later on supporting faster bus rates:
> I2C_FREQ_MODE_FAST_PLUS (1MHz) and I2C_FREQ_MODE_HIGH_SPEED (3.4MHz).
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Excellent, thanks for iterating!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

