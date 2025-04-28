Return-Path: <linux-i2c+bounces-10662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243FA9F58A
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 18:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71461785A9
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 16:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696C927A911;
	Mon, 28 Apr 2025 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xt6cOKoB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4F27A903
	for <linux-i2c@vger.kernel.org>; Mon, 28 Apr 2025 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857300; cv=none; b=AZ2sFc4CuEvW9Rimj7qVzB/n1pNBnfvsfm0rpw5EacsQ4NN1tOJHH3iyqkDE45ufrxqunljLsebQTnls4b/f8Wh6fXcBNhsf/iUZzNdH3OCFjUKxeUaJEOwVmlqV5aj90lHW7+0ThpG3EtsRsDGdyzo5eZIDDP5QQw/QxNOhnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857300; c=relaxed/simple;
	bh=VPZALAjR7Zdva25NLVz5KQEgfQ6d4QldoSci+gyc0ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXwaNSxnBLhWATf2nI4LzrRu7ECQtoFOD7ov+sst+9z9JHqT5zFZrEH8RF1Ls3jaKPnSj24xvc08dfaWvyfJtd5j1dddH381vp3yFbjSYWmDIOz4PC9xYMWt/if2QocBVQXy+ex9sx+rRyBUs5jgwQ9jFcs17c2ukG0t+p/gM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xt6cOKoB; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e72c2a1b0d4so4687271276.2
        for <linux-i2c@vger.kernel.org>; Mon, 28 Apr 2025 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857297; x=1746462097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=xt6cOKoB4XZo+QMlm4roWVyroBo4inqMuclDNyIjfBylXzBJa3EdRpbTeN6vxRWi17
         AWjY3rmJn7LOzcwpkIgaeznZyMb1+HpTqbRlovBmX9BfUeJX4zitu/suz3tsPW6oCyNZ
         /Zdqn70P8HHDa7s1E993EUv7lP4e8hQy7HIOsmN4rQp/n156vJrVevdBd53hne00SxZ3
         rST48bq48gpdS0v3Xh/gVsdOPzlrVvkWaUhBwec81wjhNpsPpwL0YZVjBh9U7pBMSaVX
         hQx5uv7xaf2ZWY22qChrO4upTYRfG2rJE2THQxHcApDvk0uAY4CgahwdAD4ymyDkVBDq
         CTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857297; x=1746462097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=h+SzU3yJ4ByeBhzmSDW2vTttaWvXt9n4UmL+7EbyavJfleG3D2NuRlUrusYejDl+Hn
         GNMPeiQWvan6Fds3iXvg/BriDGELJJQQLvhXK3OUWuqJujqi59diXkUPlb+CoGlQZ/gE
         a/dSIGlTJSXiSCFU3nRS/xoNuH/W/t283lUXgdaYTJcYWDJvDDceiCsYDouAVem6nAsG
         Ig+jOs9T685ceAexVzK7LrLYVMo5JSiDFcctxWXrAZJBzE7a/6zZUUFfZl6BtUjAVdQA
         /7D2F2O0LrQNYdV8UgkOV2Wo9nUqmzwHfiLhlAkkqPyrHrT+NSz5TDG6Iyjkep5qrh2E
         i3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYWWAs9Ee/anqQB4oCAr2pmwzNTW6LK/xdufaALzebmunx6NxbSzonbnO/+gSLi69UK6Uj5o/r7Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhz7XMFKYtJnnysjZJ3wqu/lG8dYlx5A2mECneS6up6+ydYnbV
	qSPL7gWyKIitihow8gZChb3/tw0LcgnOkexRk9BDCqBYSLEkc6p/a2NETLBbvuzBk4RY867vUNJ
	S2SNmKCsAbuxJNSuZjVDjuPHxm6PlY9Z+I9etug==
X-Gm-Gg: ASbGncuJG3e6qdvenbiRZSJm2OZkmd4b9VEWGaHhZGcPHpzD0hOS4NdhNBminhHIjDc
	NXVT7CWL94cX4dqItLNo1PUEb3bUJT7ZyJqlR1sde4eCAAPLCnzcNXzlxwqYKAFO15IYya4qee7
	el8Hx219BSkBVbzc6TIuYd0Lk=
X-Google-Smtp-Source: AGHT+IF2+lLJogWYmJ9CklQNKtsYDG7mA++udTlmO/sYgtKfw1zcHF/zNyAnw+6seYbb5sOJx4PEl6rhupOOr/4EHRU=
X-Received: by 2002:a05:6902:15c1:b0:e6d:f0a6:4cd7 with SMTP id
 3f1490d57ef6-e7322febd09mr12474369276.0.1745857297087; Mon, 28 Apr 2025
 09:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413223507.46480-1-inochiama@gmail.com> <20250413223507.46480-8-inochiama@gmail.com>
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:01 +0200
X-Gm-Features: ATxdqUHo5zpHgBeVnQwujIcWP56iQkcuhTXqhu8H3yGRlHLlrSHxM1LpwpFg6CU
Message-ID: <CAPDyKFrM32TVAHzSoMvmO_ZW2Ax=RQmH_7KqSGgqXTOc20UnLA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 00:36, Inochi Amaoto <inochiama@gmail.com> wrote:
>
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
>
> Add compatible string for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..5fb347167004 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                - rockchip,rk3562-dwcmshc
>                - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
> --
> 2.49.0
>

