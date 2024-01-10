Return-Path: <linux-i2c+bounces-1252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA28295A7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 10:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF27284D08
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4023A8DB;
	Wed, 10 Jan 2024 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hqvnyL/t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803EE3B18E
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3374c693f92so3098529f8f.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 01:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704877478; x=1705482278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ENsgunoGMbZfgvfEWJ+ROzlMs04fiRcUoBPATIiU24=;
        b=hqvnyL/tBS0TlBEYRYtcX/s2PRQstLiA5MRdZX+Iw0SYA+1MnyfsqVk5pmuLqbLq9b
         5NQyN4LkRzJcqRUBZg/W91WVrw/d0ya6YPn2+6I2DwBCRiAU/S6KBnQ6A2bK5m980TJh
         g/SpbEkiwobk+Wb7QEncVtZCI61Mpnpu0FKUDc6UyuwuWXytrmLRPwJ/uB2XhhukR4bb
         hoA16KxMS4mvfHC8DSDdHW5kIVPrCB0fF5IdBIIqFT+kbrqJkhbgkWZjvdgR08X5hd8e
         1IGhBwNTX6Zi94vcBw16P//lFnsAMO3Me6Qjlin8RHYbFT1jk8IkpcnX+Dmdc7BNSz01
         EbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704877478; x=1705482278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ENsgunoGMbZfgvfEWJ+ROzlMs04fiRcUoBPATIiU24=;
        b=d+yzajFMOakoOXBXfky5IsVzfA6+1DAsk/JHwkGmybQkzyRad0he3I5s88a2D3z5xv
         pbKnnnGWn/8DOvON3YkysGQmdO6nolSXU2h+1MVhls1hNscmzGLPJztK8POvgOVQSXW+
         8QiaY+KOGiCLh06XfIOeBE1EKkqUJ7umHlW/FkbMj5KhvpGBW90UIiGdztWZTYznMBV4
         n2h6rjT6QWVIJtVzuozbER0DoJm+5uFspn4MgNV7V9RTp7JzPyk/usYjaT9aDx430qZK
         3cd62NOsU3vsEGsxLue/CUYLbVwNx3mjS8vO9LGWH+0oQr3scS12rRnqLxQ2nbXHQhiS
         ZZSA==
X-Gm-Message-State: AOJu0YyfLRJ2GuIIp1wIPH0ygRG+MOE8ccEMPQMn98zvq3VNtfHZTQwG
	Ighg2yQv5jg/zOIRJYG9uf48dTvrQdhqNQ==
X-Google-Smtp-Source: AGHT+IGmH7obDcrHPPh8+GTeUn69iyrivY7YHG42CJn+av2pD9yAeNWytG456eVVXSfxMThA2UVowA==
X-Received: by 2002:a5d:6a01:0:b0:336:66f0:e8b8 with SMTP id m1-20020a5d6a01000000b0033666f0e8b8mr342757wru.89.1704877477728;
        Wed, 10 Jan 2024 01:04:37 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d5008000000b00336e6014263sm4339124wrt.98.2024.01.10.01.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:04:37 -0800 (PST)
Message-ID: <aeee178d-f4ea-4732-98f4-fa28fcf2990f@linaro.org>
Date: Wed, 10 Jan 2024 09:04:35 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] dt-bindings: serial: samsung: do not allow
 reg-io-width for gs101
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com,
 jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-4-tudor.ambarus@linaro.org>
 <5d24a5da-e4cd-4d32-ba2b-8e91cfc7dced@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5d24a5da-e4cd-4d32-ba2b-8e91cfc7dced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/10/24 08:06, Krzysztof Kozlowski wrote:
> On 09/01/2024 13:58, Tudor Ambarus wrote:
>> All gs101 serial ports are restricted to 32-bit register accesses.
>> This requirement will be inferred from the compatible. Do not allow
>> the reg-io-width property for the google,gs101-uart compatible.
>>
>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>> v3: collect Peter's R-b tag
>> v2: new patch
>>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Please split the serial patches into separate patchset and send them
> usual way, so Greg can pick them up. GS101 was merged, thus this is not
> initial submission anymore.
> 

Got it, will do. Thanks.
ta

