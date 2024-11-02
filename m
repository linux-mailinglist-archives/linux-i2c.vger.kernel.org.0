Return-Path: <linux-i2c+bounces-7742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0959B9C8D
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Nov 2024 04:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D720B21C61
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Nov 2024 03:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0108145B18;
	Sat,  2 Nov 2024 03:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="glGHEmHu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E134CDD
	for <linux-i2c@vger.kernel.org>; Sat,  2 Nov 2024 03:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730519310; cv=none; b=NotXqMK3EJ/jvOQbz/eYW0QoT0S92ik38pqB1wGAqS+knBAorSO9wFKVtH+Md2iyZ3CPqvt1mcAX4JwKkrjDiSP1+1ECLRPKfC84KZikOBZld0zEN8wluwBHFs9l2rLduKiso11CV83A4iYyCacowKw+hbJOP3USGSIxZXetHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730519310; c=relaxed/simple;
	bh=vP4zsOqNtMbKO2+jVJEXwJdYxLid9vzXb56DQWl1K9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdOoHx2yB1pv/s2JDS6cKsm0ovkwSxyzlkAdzNTPjIHVFyMSnNS1mjFdcTO1sq+TbXl/hQ75bxsbYGagv1TZ1Wz6vtyAXuyXdXUTpl3wU4PG7DhRwmWaiPyeYbWqMLnYUVWcEvIfm75+tVHslHUj5wj7OgRIUfPI9jm4SW5ATNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=glGHEmHu; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-83ab00438acso79631739f.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Nov 2024 20:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730519306; x=1731124106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFAxfJPYMHZcgM/IbSJdK8jCoxixwBpatcLPEMEnlyg=;
        b=glGHEmHuBRHQ2w1lkMPygKEzcCZXom8snmPAObJGJ5Iobo59FC7HRyd8UQHrimEaJr
         0mpZE4h6EJ0e7g/6YA0NQcXoYY1PcdKYWQiB7P1IvZzpozmqcylsjw+tSjtZWtjrkIlZ
         loCNSltUi22qrUTACQRvDK4ceiDKzlNptknYNBA1VuprCwhMz6911rHwuoMHfhWL3tAq
         U0vc+3fhnvLGI+oB/71Aw0YUJQ9XxlFjumfsPp3sv3SRgkJ8tp7H0TSI2UHN3EXcVtJI
         McP8r+nP4nhmyy/jtPufH01wej5Xjs+gFp7Bz3LotSqFoniCLGhRPLupLP3T62Wzm5yX
         b/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730519306; x=1731124106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFAxfJPYMHZcgM/IbSJdK8jCoxixwBpatcLPEMEnlyg=;
        b=R7Gohyn1gg9bfL9w89wClDLp2D3h5p3/dwwbzVYNbRCm60ZDd/cNHBzrCG+UXZxApx
         hiZKzY8dpZAC0mp0btWAMm+e+74S2PO03n4vtxVDxDsuxJ5qp6rKvw4sj6UqF7m6b5hR
         cblrhIiB8VPG5AfIV/qx5RLVWW2O9LLpal+xYWF75G+3punAu6AblTElKj2TTCYnKxaU
         1yKXeRI0xtYA87WzbtyET/XL6DjlwjAiIMnhck7/juUlIpFl61CO+rZj+otGHp7clTLQ
         suFUKEOmv6kpMItXUx2SDn+REM7VnVgpgHceqarOJLS9/SZlWq9BSeJ22MHa4wF+edpO
         BceQ==
X-Gm-Message-State: AOJu0Yxfj+gzyhUvOBc7ry69AbI17ZAhCmK4YJO921+4olnzs3RxCj//
	IrOV9DecJuFlZL7YP6pM4LL8OfjRRzu6H8ocT6uxH0/xVJQmNXjT4p5o2xVNyJE=
X-Google-Smtp-Source: AGHT+IEjX1mR0HcedUZXdXQVrMhUH8jXN4cBozN2zssjtGKah59T7pHiVZuQPT9WVqvySZ4MDCEgRw==
X-Received: by 2002:a6b:7e44:0:b0:805:2048:a492 with SMTP id ca18e2360f4ac-83b7133cf86mr460121839f.6.1730519306354;
        Fri, 01 Nov 2024 20:48:26 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b67bb57a5sm108525239f.28.2024.11.01.20.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 20:48:25 -0700 (PDT)
Message-ID: <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
Date: Fri, 1 Nov 2024 22:48:24 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20241028053220.346283-2-TroyMitchell988@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Troy,

On 2024-10-28 12:32 AM, Troy Mitchell wrote:
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> new file mode 100644
> index 000000000000..57af66f494e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in SpacemiT's K1 SoC
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2c
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
looks to be standard across the peripherals in this SoC. Please be sure that the
binding covers all resources needed to use this peripheral.

> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
> +      modes are supported by hardware, possible values are 100000 and 400000.
> +    enum: [100000, 400000]

This looks wrong. In the manual I see:

* Supports standard-mode operation up to 100 Kbps
* Supports fast-mode operation up to 400Kbps
* Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
I2C only)
* Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
I2C only)

So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
frequencies.

Regards,
Samuel

> +    default: 100000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@d4010800 {
> +        compatible = "spacemit,k1-i2c";
> +        reg = <0x0 0xd4010800 0x0 0x38>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <36>;
> +        clocks = <&ccu 90>;
> +        clock-frequency = <100000>;
> +    };
> +
> +...


