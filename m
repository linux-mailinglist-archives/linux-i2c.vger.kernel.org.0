Return-Path: <linux-i2c+bounces-798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9981344E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6FE2280E5A
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CC15C8E4;
	Thu, 14 Dec 2023 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVOLhbu5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412121BF0
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:13:10 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d351cb8b82so9652685ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702566790; x=1703171590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etJ+/wYoAcvEaSoojHqnnim2gYjZh1zVJDqnc2kSXpQ=;
        b=QVOLhbu5Qr7LsTyMe6GposwU9a//7P8AI8YTz2gIDYOAzbBvHGBX4ILfoweHvJk4rV
         9HeeiUWpwpDgwlZEV7VfHFf4MSpgc5jQt4yISG48Qnn/wGouHI+JIZ60TLeO7SC8HYAl
         zn3gND+PF/S3Gq32PnP6Q4t/UjsZNizhxuFfoP5HddnbgHeGGOgwP16NJt5xOfliu5bp
         /KhHZK50OVgHv37IvobrrHNnCbfZrXaZMPLe7jdRkhMChG/4/wVPnBKU2ZXFd4MG1NZ1
         KunmMzEVO9wsXOnlo7kyW5xsaVx7uM2JySchWwaoyF31fiZlCBTyEzLcgYkUeYSjnJQa
         2jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566790; x=1703171590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etJ+/wYoAcvEaSoojHqnnim2gYjZh1zVJDqnc2kSXpQ=;
        b=FtUwqEJiv38oCzPCGdKNWj3X3KpOdQ+KnbnOv7OJHQ6o+RVd91FKI2eGkNUjBYe+Xc
         driAp5V8JOf3UCSCMrRtRNTGq4oyscXC469DwuWhODlGlkYUQ3xXiX/ZWcoPf8t+KQ+l
         RVlOphVxsSC4dcOSLvHw+aK5tTIfiM85Rk0a/PWhTvg+qnVhQffee7o4xSde0CZIa3vi
         7/ah7JhFPItYRoAdE+eCareLHs5I5cOUJE71iKMKT9GQbcZw7kb2d5CkdTnaUX16ZD/L
         xEgk8s5lQpwy6B416OAHfXI982R3LhIGUajjqKz2rtAzppQElI73e3Afcoi1n6t6W2kg
         jTQQ==
X-Gm-Message-State: AOJu0Yw2B8jNnJmvDqehTv9QFbIvULbpmEqU9mPysp2lGUSQTr4yL4Hi
	LRH39M/Q/5rDs30Sjms4/6/0W81D7anvLr9zZletyQ==
X-Google-Smtp-Source: AGHT+IEFL6tnUHSNVnMcU+kCLIcfGx/R1ZUOTFN7/bZVIiGtPzpJjiJX8aWhelM2KXu+zN0404N10HK44v1+/oTJCzM=
X-Received: by 2002:a17:90a:de94:b0:28b:1fbd:27de with SMTP id
 n20-20020a17090ade9400b0028b1fbd27demr197844pjv.29.1702566789746; Thu, 14 Dec
 2023 07:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-4-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-4-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:12:58 -0600
Message-ID: <CAPLW+4mBN1g0ojYiE_AVt7ZWO_1yEFpx58x4+1U9spxaS=abRA@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Add google,gs101-hsi2c dedicated compatible for representing
> I2C of Google GS101 SoC.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Doc=
umentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> index df9c57bca2a8..cc8bba5537b9 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> @@ -33,6 +33,7 @@ properties:
>            - const: samsung,exynos7-hsi2c
>        - items:
>            - enum:
> +              - google,gs101-hsi2c
>                - samsung,exynos850-hsi2c
>            - const: samsung,exynosautov9-hsi2c
>        - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
> --
> 2.43.0.472.g3155946c3a-goog
>

