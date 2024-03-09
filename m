Return-Path: <linux-i2c+bounces-2307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8778770EB
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 13:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0A7AB21149
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 12:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC48838F83;
	Sat,  9 Mar 2024 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/+myp+4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC142383A6
	for <linux-i2c@vger.kernel.org>; Sat,  9 Mar 2024 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709985654; cv=none; b=TN6IhStCkd4DRZhDYTSLCJfHqE7ObiOnxFyuQRx4OQoR9/AIZivPRZzjN7NUj9GhCrgF2VynTT5qQBx01FO1fOx8Dsmbg3PgA4DoXgFxcQ9zwExBSFjN61YA8keoxUbe4yMcF/xLrPrj24+YdOCBSTp7xFVnhG1aXOZTQYF3YrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709985654; c=relaxed/simple;
	bh=EIZp/DZYIJQs7FLlAZBsbBX142Sbq6uoNYK04yn2Pj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGVbV0gps+3A89kDnc3R9r/knPFK48yIR8QE+Pc3HPdChOeKGfkVcEr8R+htLHFqiCgMNcvPyckp1wNIwinhYM0OlH9PBQur7OvvX7IqAZkFvAdWUYV5OSWv9X+ZuieqXTzhpF6uXyaaNmHcA8jqSdWE8cEW21TC+6j2Z/vyZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/+myp+4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e2268ed96so1789617f8f.3
        for <linux-i2c@vger.kernel.org>; Sat, 09 Mar 2024 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709985651; x=1710590451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8HgyH56g3O3xcj6rBdnw/1tHjvEVGODzmMGuWLLQYrQ=;
        b=d/+myp+4Au6fo7syPkiykcjhbXKDqTs9eC1bwUiLdbQhaIlHo/ILgI0DBv5TeyknWt
         T2vRCzvGvbkcu5niaDYgWT/Au74X9E/aZiUsfC9NWmZuszI7epF40WrnFm70uANFkpl8
         pvfqMVY6tCEJ8DY+CaiMApZwEG0K5cJJYOrjuULttKgREP/5C5TXLONSIvMGJk7XLnHj
         ITice/Bn8aKeldPi17ftxexzEOa8ofQHyqfASOYpJyxwfOLe7usy4KQTc4POHOahQRbC
         xpLV+N2EvIVyRJ9zPR7dEXowXpzXEWNdwpap7vIphjfZOTlpSdVMqzP5d/x/p1No4Psn
         bPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709985651; x=1710590451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HgyH56g3O3xcj6rBdnw/1tHjvEVGODzmMGuWLLQYrQ=;
        b=DpZiujRkQLzdJfmhZRYTz+BMuwf1JaYmNn0Ayz0WhVYT67qn5D9l6DShg0giyhvdmh
         f+O+9BxUGJ6iWet18CaesKkmqCJSildVQXleo6okeugzVlXJ/Ff+yVyzrqq9MnobqsET
         NhzOASSclf3kUuEQMtUrdM1ry5atJxKbn+kVxweN5r+SiceCH4ERUEfa8ADPogyaiiQm
         e8OT7DfDGIsL9Lwa7yMIXkH2//T+Yaq6FtZE77ZuNHbKAxJKH4aoMDpbStwoGj3QWYTP
         h7318ayxoqtVu5TN+xJJVi6nNTi3M1nx0rwmGLsZOuFsMGKIjz8tN3YMXS8E39wFRPQY
         72pw==
X-Forwarded-Encrypted: i=1; AJvYcCXERXLouv+4VIY48TDAxs94flod0iL4jjP38UnprghxLCDAvmJXiUVTC8WSJf8lIjkwrQbqtJXwm27Z1epULRfyO6JP1CkTOUYk
X-Gm-Message-State: AOJu0Yys03YeSBXwQSUM1HWC60fJbjE642SDnde/UTpNCmL7DQHS/Yvm
	D+Inau4kxnlZpWIT5aaRNzxZ5VcJTbNvdaT+00SiPjVw6zlkU+NqMEbqJOb/J74=
X-Google-Smtp-Source: AGHT+IHdvusZdY4jgrUhp+EdKPNQYYFLXs9AB4cJFIkZg7sqaUivlyMe/OKuNG+TJ86fz0qTe8Kzug==
X-Received: by 2002:a5d:4ccc:0:b0:33e:77b2:ff86 with SMTP id c12-20020a5d4ccc000000b0033e77b2ff86mr1033012wrt.69.1709985651051;
        Sat, 09 Mar 2024 04:00:51 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id r13-20020adff10d000000b0033b278cf5fesm1680467wro.102.2024.03.09.04.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Mar 2024 04:00:50 -0800 (PST)
Message-ID: <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org>
Date: Sat, 9 Mar 2024 13:00:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057
 support
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/03/2024 18:27, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the I2C Bus Interface (RIIC) available in the
> Renesas RZ/V2H (R9A09G057) SoC.
> 
> The RIIC interface in the Renesas RZ/V2H differs from RZ/A in a
> couple of ways:
> - Register offsets for the RZ/V2H SoC differ from those of the RZ/A SoC.
> - RZ/V2H register access is 8-bit, whereas RZ/A supports 8/16/32-bit.
> - RZ/V2H has some bit differences in the slave address register.
> 
> To accommodate these differences in the existing driver, a new compatible
> string "renesas,riic-r9a09g057" is added.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

I have doubts this are true reviews. What did it even show? Why this
review did not point problem with generic compatible?

> ---
>  .../devicetree/bindings/i2c/renesas,riic.yaml | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> index 63ac5fe3208d..2a7125688647 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -15,14 +15,19 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,riic-r7s72100   # RZ/A1H
> -          - renesas,riic-r7s9210    # RZ/A2M
> -          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> -          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> -          - renesas,riic-r9a07g054  # RZ/V2L
> -      - const: renesas,riic-rz      # generic RIIC compatible
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,riic-r7s72100   # RZ/A1H
> +              - renesas,riic-r7s9210    # RZ/A2M
> +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> +              - renesas,riic-r9a07g054  # RZ/V2L
> +          - const: renesas,riic-rz      # generic RIIC compatible
> +
> +      - items:
> +          - enum:
> +              - renesas,riic-r9a09g057  # RZ/V2H(P)

No, that does not look right. If you added generic compatible for all
RIIC then how can you add a new RIIC compatible which does not follow
generic one?

This shows the ridiculousness of these generic compatibles. They are
generic till you figure out the truth: oh crap, it's not generic.

Stop adding generic compatibles when they are not generic.

Best regards,
Krzysztof


