Return-Path: <linux-i2c+bounces-8547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD169F3935
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5904188AE7B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522DC20764E;
	Mon, 16 Dec 2024 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHBvTw9k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72E81E493;
	Mon, 16 Dec 2024 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374859; cv=none; b=rqV2RHuqsG+i6ilMm7PUKreBB5y1sTh+m1oTqVxNXFudry7sg8S+m1roTMLMIeIQhgazkn7AEIlVpEG+A2qEar6zxjA9zQK4PZgA9xHoJGZEx6pa83PfIJ+H+WENaKueSC2gmCkyqJGTTL6+JwZn5l2/amfwvcQXiyQUKtou5P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374859; c=relaxed/simple;
	bh=J6/FzYFwHnRv9BLzHltNFMIOIxKwdbIG8JjNRs53Fi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IoLHyZJ0gAg1BnJKT4fYfNH2gP/oY5R94xZksIHAcL7mZfH+kfqqoj1t/wDblYmJxiChDUUDLEVsafwGYw4hE8kjMJ199BbxPB9hxedyXiZoD3337Cnt+69BkrafpDwshsCJcKni8/bPMOUAX5lsuHarxEo1dFctZ9DU8Ye9WNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHBvTw9k; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166651f752so47238005ad.3;
        Mon, 16 Dec 2024 10:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734374857; x=1734979657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CqFXFmSmKLaSa4Vhvi8HNeoTtmpRApxU91TTMrXkHTg=;
        b=AHBvTw9kyiNTr2FiytgKeR2Ynd7O0s0IYNLZ5KBJutLCq2m8eXeEhISlCboFAY3IAY
         2l9PSgGQqFRUupclOGuOl5KRsc4XamkIaWUnA3vqsTHDDlOq14ZXR0rt8Smqi5HAbRKE
         Vo1Sf4KYT44tJv868kvtw4jAzI4BOZuWz7sfrCY9kT1YeVugnzNwrR0bSzmtYbcCeW09
         szh9hKZ1ESQzyrQUf/HHjLcrMvIokcBrAQ8oDdTYH25+5OPm5YT4+b3glKKwi+VXswqo
         W6Ov8e0xEoPQsSt+KM07PRRdN4xflVdxlJAW19I7SPJBfVpXAiuXu8upKISpnDdtf4oK
         7nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374857; x=1734979657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqFXFmSmKLaSa4Vhvi8HNeoTtmpRApxU91TTMrXkHTg=;
        b=fYKcDPDbwFeXIeySS84N09fXL9EpR/5jcClo78ETUQz11NYc2mpFzq/x1e0N1q+IzY
         fcdu9h/DHNp56Dbm3/s0tzqcqpiyRgTGpYBarauVRdZdpNg5ODKQIFPGN/FxDlvZ41o7
         RjtQLG6kUzIL5HOilN+1CQnZ19Tn5jcEB00gWpTL8F/aT+Uv+oQmd66Cuecmp1ZA1Xcf
         wG7t3wJEITQIG2QYpmwF/8N6F0dVbOUMLRqDM4McLCk1yXq5n6gJLHZFfCbXtKFPYTQB
         FA1gubQ6Wn9vv+0DI1WfmpKe9HaLPVddLsyfgyjnb2PobyeNL7kdRHEns1ZHzZhy44tF
         SxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa2UN0JJaMhIpgBnAViZpBQRwpYo5BW9837Hwtn9F0lCmW7A1JRN6BNK2OGn+I9tzmdXRdC7TCfEnq8OU5@vger.kernel.org, AJvYcCUq2Vhs9ohHZo28ja41rn7BqpvSnOpXt44onyLMRd6qdEZa9q7SCnpo/ZUcS00RrQUx1Xua4NlEk+vp4io=@vger.kernel.org, AJvYcCWV+rUcZo79EC/NKv79P1pjJwHwI8w8zKGishSI4IWoOCO1iucTdbePeXcI5f5qSnU/+CGOYewZyZbt@vger.kernel.org, AJvYcCWVfcDbeG/12HTBkxH8kueJdEx/5UBLzfv1PJzmbld1D1qj/M2o4lLUDBHR7mfH7fnDoC3SRxYVicuJ@vger.kernel.org, AJvYcCWkjX6lGCmnKWAuR9rTV3H7AGuDGdwcJ8+MEUSbCTsMH+bC7nbZGABp5t8y+jvea+YmJmRlvku9WkDF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Xn9zknBBJuJUbZwZHfmicYG0SDYCjYq/V1kblEaKzcyOIsIq
	ZM9vuGC1/S2cQgQeoDdIT2OzrMVI90EAxeaiXm8TKIH+2d0ywAYe
X-Gm-Gg: ASbGncuINbU8rFWovm+apGEUOrvHikIgS/6qGetYfUGG7DZ33B6bNmhWUv0hlWl69Fj
	u/4fA99POaeNeYZVfThPtFWJqtWRb7Idh0bKBwoejpYANkBW+qfaEVdCSbaeeG3DIKiALG8Z2cG
	EkKCBj85vgSnLjrOPuLreiijV+xr3sTNgGXhJ39s6qnNWRhfIrSYX8PqwRNqwxFFnV93lnijJTR
	gpUqYCJ5ty1LiFW+uJM38DL+7K9aPaF0dtGrHLoGsP5q33eXBTIKIgZ4GjEZNRf2BC4o0sRvQ4s
	N3YvwQqrJfZXTd5RyUJ6NxoWwBV6sA==
X-Google-Smtp-Source: AGHT+IEIIrPoJh1GXWlfdX3/QWjWvj2/h7CMhTzjWUDIMndNQJ5On8mQEgeMF8lUXxA39smV+RBsqw==
X-Received: by 2002:a17:902:ce8d:b0:215:385e:921c with SMTP id d9443c01a7336-21892a7a2d9mr152417255ad.51.1734374856981;
        Mon, 16 Dec 2024 10:47:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb353sm46475315ad.76.2024.12.16.10.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 10:47:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a010366e-b911-43bd-8445-e893e11fa51a@roeck-us.net>
Date: Mon, 16 Dec 2024 10:47:34 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
 <20241216175044.4144442-4-ninad@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241216175044.4144442-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/24 09:50, Ninad Palsule wrote:
> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
> trivial. It is trivial because only compatibility string is required in
> the device tree to load this driver.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Krzysztof had Acked this patch. I don't immediately see why you dropped it.
Am I missing something ?

Guenter

> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 73a49d50c4ef..7d07b08b1459 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -151,6 +151,8 @@ properties:
>             - injoinic,ip5306
>               # Inspur Power System power supply unit version 1
>             - inspur,ipsps1
> +            # Intel common redudant power supply crps185
> +          - intel,crps185
>               # Intersil ISL29028 Ambient Light and Proximity Sensor
>             - isil,isl29028
>               # Intersil ISL29030 Ambient Light and Proximity Sensor


