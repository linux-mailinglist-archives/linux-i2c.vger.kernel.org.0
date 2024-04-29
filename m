Return-Path: <linux-i2c+bounces-3287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ECA8B5166
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 08:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C131F22272
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 06:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDCB111BB;
	Mon, 29 Apr 2024 06:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Py6EuaIT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF013DDB1
	for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714372072; cv=none; b=nUVZD1bezw5dvV5rpsJDUK1Gr2qP6jYCE010kmy/aYwnORmHpRe9iSPjVyDcmBbpAx4+kePymK8/LVmp1nhhsBT0B3n7qBWM0/TLBHmbDeu63/XF84vtID3Bd5u4/5X7aP+xBKhT+G33EFX2Zoa5G+dVSwdDQ8+TPQ+FiUkPDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714372072; c=relaxed/simple;
	bh=pQ1HlVQ90krhqOnXJ5XQMVdoHSa9+n1hUzM/hln9e50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L37XJEK2De3w7sU/NeC4IEBhN/jjo8+3GGokhIfcOPo5NCIdqb2gsuJEJj5ttrKyxwUhuKgU53TpInkzMAxyOquBH2V2I0M+TlWPpV4kXJjpAX2jGv56chG40M2duuO4S9p0CQ1QIPdgjxwdFnXwkikZQ4DxmfZQfZ2C7kG8hjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Py6EuaIT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so3894841a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 28 Apr 2024 23:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714372067; x=1714976867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qA1Mq+BKArwz7aZn7XQgiZHHBtYnA3j8xSFLJOCXWzY=;
        b=Py6EuaITLY+hOvGO4ULiTbwDKB8P/f2O9c0pbW0ZWvFfPEJ+upQ5Auz4UpsTHZUxXJ
         Omb97/Ua/Pmsitn6DGSTP9lTnTzdOkkmP/Xv5XeVS66AicLUURQ9TVGeD6+bJ8qGzxMZ
         fwLRc39vDGzUKEfiTdVk5+zpirSXyYrU+j+8zVotnP+pDC1CJlmjvlKFhT2PuLorwoyP
         24AE0KDlNw8cvzKvL3MEkwzLRWkv0CVH4zzsrgTQUMzwJ1+LWscqfwfBmknXgdl8IqcE
         YmwGZDEKOKMcda7hysVznjjWK39Q4FPkXXvSw+Heo9xP5uItK7pvEWlFwTrno32lPol5
         3nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372067; x=1714976867;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qA1Mq+BKArwz7aZn7XQgiZHHBtYnA3j8xSFLJOCXWzY=;
        b=A4B27YCPCvpeFzY4SkeTL/rD3eI5gjX0sELJGa8MdHnSqG8ppHqmLSpGnd++wYXwa6
         coX99TC2qgJwqZCwHFq4HwRASN9k89g/TUjBsT2WA4CgvWuaNIT3qpH6LmYdvqL71wvh
         LW6Ubw0OFpD5Rf/n0qC5D9HgAusoeqT0ljvxNUmpCUdkwg9wN4I+Ucp3xPWSJ1Vq5HDx
         yUB5tYYROkCA82rMvAnwt9psb+VE44Z3y8EGu9o7M6VVAEykqzD6C20QW0+PxRCAkBd2
         knj7uO9Q2rkm/g8+JQlRT9VTGgkpxxsd9ASUttWm09f/35wpjemI7HtO4g5+ommFSBKA
         LOCw==
X-Gm-Message-State: AOJu0YzYi7nprlseHqyoJa2ibq4hTT8YA7mL7S5CRdggGbQ+wUS1vqgp
	NipU6R770jKK0m/2umUeCJa50QnBu2FcM0uAuOpXZL05dD31fIX2KWItv6b42Fs=
X-Google-Smtp-Source: AGHT+IESUXN7I7fO318PxM8X0XDcywLSdQf4htvE8HhqgqMtYThdRx/pY4Ue7USfJXLXKoE92r5Sog==
X-Received: by 2002:a50:8acd:0:b0:56e:3774:749b with SMTP id k13-20020a508acd000000b0056e3774749bmr4907398edk.42.1714372067101;
        Sun, 28 Apr 2024 23:27:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id a13-20020aa7d74d000000b005726ee95a38sm2183591eds.88.2024.04.28.23.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Apr 2024 23:27:46 -0700 (PDT)
Message-ID: <1613d7e3-a5cc-4b8e-a905-3699779476fe@linaro.org>
Date: Mon, 29 Apr 2024 08:27:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for mule
 i2c multiplexer
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Except that this was not fully tested few comments.

A nit, subject: drop second/last, redundant "dt-bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


On 26/04/2024 18:49, Farouk Bouabid wrote:
> This patch adds support for the Mule I2C multiplexer.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Mule is an mcu that emulates a set of i2c devices which are reacheable
> through an i2c-mux.
> 
> The emulated devices share a single i2c address with the mux itself where
> the requested register is what determines which logic is executed (mux or
> device).
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mux-mule.yaml      | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-mule.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-mule.yaml
> new file mode 100644
> index 000000000000..458e4661cbc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-mule.yaml

Use compatible as filename.

> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-mux-mule.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mule I2C multiplexer
> +
> +maintainers:
> +  - Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
> +  - Quentin Schulz <quentin.schulz@theobroma-systems.com>
> +
> +description: |
> +  Mule is an mcu that emulates a set of i2c devices which are reacheable

typo, reachable

> +  through an i2c-mux.
> +
> +  The emulated devices share a single i2c address with the mux itself where
> +  the requested register is what determines which logic is executed (mux or
> +  device)
> +
> +      +--------------------------------------------------+
> +      | Mule                                             |
> +      |    +---------------+                             |
> +  ------+->|Config register|----+                        |
> +      | |  +---------------+    |                        |
> +      | |                       V_                       |
> +      | |                      |  \          +--------+  |
> +      | |                      |   \-------->| dev #0 |  |
> +      | |                      |   |         +--------+  |
> +      | |                      | M |-------->| dev #1 |  |
> +      | +--------------------->| U |         +--------+  |
> +      |                        | X |-------->| dev #2 |  |
> +      |                        |   |         +--------+  |
> +      |                        |   /-------->| dev #3 |  |
> +      |                        |__/          +--------+  |
> +      +--------------------------------------------------+
> +
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> +
> +properties:
> +  compatible:
> +    const: tsd,mule-i2c-mux
> +
> +  reg:
> +    maxItems: 1
> +

Best regards,
Krzysztof


