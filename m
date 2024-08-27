Return-Path: <linux-i2c+bounces-5832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C3960D79
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 16:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E02B0B25033
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 14:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808921C5781;
	Tue, 27 Aug 2024 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vdA3ojmD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187581C4627
	for <linux-i2c@vger.kernel.org>; Tue, 27 Aug 2024 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768468; cv=none; b=hOGB0nHO6BpK2gkyg1MvGOKguEvjPLTRtRhTbnUEqbKzMP21aTAhN0Wgaxpdm6WKBdI71RXe8zN239EDTPcxHWTXpLtEU+EPfuqRRiV8zrZvuiLv08JQhQA6Of7BbbVnak3HS57UQLLNCP4D3SbytKdlKyStUE+VAgb0+8+FMYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768468; c=relaxed/simple;
	bh=RT3Ktxp95IJPO4dUMSJPG4nZBJmg0JPVd7dt6mGlzK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czF/ct3PpYxjL6hiVhrEmZSKw267VtuGBx39qxALDw7rz103EafHACHKTh6+8xfGMYcuGG3VVP4YaymIQBoFjiLi8Zh8BohoN4H7jVJnVHZr/SKLhM7UzSS+Xs2XPdV8VS9o/gC33fYY4TPlvST4eBiwPvFaFgA6jAcqaLkFYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vdA3ojmD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3718ecfa0d6so144570f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 27 Aug 2024 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724768463; x=1725373263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ6VbB8HyBnMsUkl4fKTfDKwt8+aObas/KJf86nrNnE=;
        b=vdA3ojmDDLoOWMoqmpr8UaGqTeZIAqNsQpi9C+jxXuEG0GIVofRTch4Frsv17EyTJ2
         tS1Y/oMQMTXz8Ht5Jy98HokDGNH1HccFnhlcng5v1BpRUkbWAzlKi/oFRvvptjInaQH9
         KbSH4lMAvAcbGFtFp8vt7sWAm/VHXSD8wpV+z6pQLPPJRu3Y28SUPcWIGqFCUpP7zqEB
         7qmm5Zv1nJH2Cx4T3a+MqBZKSdxVUJ14ztC4a65hA8k7zUAAVdOD7tPc8zO2JuwZpt/y
         7FKWXkYMcTZq+Wza0DyX1cEwLrDuzEYF1zTziHkBAF0aR3JGG4luA7M/2UR0uMD4iVHD
         7WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768463; x=1725373263;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ6VbB8HyBnMsUkl4fKTfDKwt8+aObas/KJf86nrNnE=;
        b=QcM6/4s97Oap4Zg4X9C3F/uzgrDGxbhRrrXQfc9FXADlmh32Ma6ydNyBIKp0gnA1bO
         JPLytFxt7+t5SfNpk9wHG2PvPbBfIvV1FJpm5cLf0yn17AcO7GSjnyYQtRu9YpXztlyk
         LhC5DyUwQmsq9PRKE5MJ6fCxLDPNPDOOxPKki5CTFi84vxW0s8lqfyL2HYn/2fXwQtv9
         iGE9N/aBqfiJ+s+WwcQi/96L5JeTRBcPmm9zRhSJdPBe9v6u++aTlcWPy9BeIWg9JMmV
         4cORrfUWc2MY06YK3tzJG5bUl1Fgm1dSRonTFgMLO+pMAXUMB0QNh5KX5cLwI01nXYa2
         3ukw==
X-Forwarded-Encrypted: i=1; AJvYcCXW32izkJxJqa3C8dR3blCwT/1s0cwCsUzMReJFsASfijzZijUdJHnXDtFO6iT10myP67wEhGjQ678=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4EYAHsSYgpSAQPcNuW5I9EQ3+5nhRWfD3/ckzmi+pmbZdCmQU
	Z8CuCJnIVMm2GCM1d2W9a0ki/tEsHN0EH1A2mhN43B8orb9sSpbgT2Pghlz4m8g=
X-Google-Smtp-Source: AGHT+IEEKh54rX7vFqUIV2bypL6OuNfcH1BGVy9P3fIxfJ0cwRO/Flzzh4z68a7zxOFPQB0UpXJuVA==
X-Received: by 2002:a05:6000:402a:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-373118310a2mr5119391f8f.1.1724768463370;
        Tue, 27 Aug 2024 07:21:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730810ff96sm13242200f8f.14.2024.08.27.07.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 07:21:02 -0700 (PDT)
Message-ID: <36769d45-d827-41bf-befc-e7b0e95f199e@linaro.org>
Date: Tue, 27 Aug 2024 16:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: i2c: nvidia,tegra20-i2c: minor cleanups
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
 <rzf7wiv7hvalx4svnnxxsu7z2ciprujxfdwbr7te7cqtmi6xkc@757xhotlbren>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <rzf7wiv7hvalx4svnnxxsu7z2ciprujxfdwbr7te7cqtmi6xkc@757xhotlbren>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 16:03, Thierry Reding wrote:
> On Tue, Aug 20, 2024 at 10:44:23AM GMT, Krzysztof Kozlowski wrote:
>> Simple cleanups for nvidia I2C.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (3):
>>       dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses
>>       dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:then:
>>       dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level
>>
>>  .../bindings/i2c/nvidia,tegra20-i2c.yaml           | 27 ++++++++++++----------
>>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> It wasn't clear who you wanted to pick these up, so I've applied them to
> the Tegra tree. Shout if anybody wants to take them through a different
> tree.

They target I2C and I think they were merged by Andi:
https://lore.kernel.org/all/dkcfnidl3xgvspiusp3zftgdftyvlbxahlbumjdfl7dvxgmdmr@nomisqfu2mwb/

Best regards,
Krzysztof


