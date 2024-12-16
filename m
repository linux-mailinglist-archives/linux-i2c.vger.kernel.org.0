Return-Path: <linux-i2c+bounces-8552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAB29F3C50
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 22:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A55E18840CA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 21:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE7C1DB929;
	Mon, 16 Dec 2024 20:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtGXR2Rn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53F1D54D6;
	Mon, 16 Dec 2024 20:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382768; cv=none; b=GU/4B0zUj7PYuH3IHREEKb6CZrQyVJje9krLqOtrxpR+uqk7bdDNQsfPW0adT2KUPhnOkBbjXFk7ORH9pY124d8Iia7tduVfnvaSBURPfBSK9IKBe/AnOlRxNfOxpdrshPXPybYD6kboJxZP7HHvaAFXpXZXGtd2BEM/EvaWfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382768; c=relaxed/simple;
	bh=cD5PM7OGDDTiHdvXQsHPGQgbA8luRKyaLq6yhmbNZUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AypXREInqFaz3neSPIuF5n2nb3dqeNpFidxLRzPeX7+Uv0xWHbYsJzIfRX2rRyINl/vHgSraBQGhotXMubuMxcaMnKW/Tfbzgrvr2Y3LNveAqt9J/3WXaZEeP7lmkPAL4qWx/GZlEAq9U1ICXqlSYTbF7tOZRGV13feYq1hztig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtGXR2Rn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2399330f8f.1;
        Mon, 16 Dec 2024 12:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734382765; x=1734987565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6g8Hes4zmmKkaO7fy47WaMEtflUT5zhFAF/15yb5xHw=;
        b=QtGXR2RnpCDns4PHLZK0iGG5RtfaWWChtAXDHoBZrHzg2IzGXMY7nwHsStgmbWuYWt
         GKELI1EYBU8CclVw16SvEfQmnc/ezF07yH3qn6Z2mgcisl5IicV6WeYdP073rc2tXn+1
         hqY2zAWGqAAH1mLVgOHJQA4fNk5/YI+qoHFY/19zkygDuDYFroM+fF3gxmLL8ACcftBU
         hAnY9KbfstTtvL2oNG2LTOCo6QA1r8wbqwRTJbKcK//rqqpw55mB93fw3KcD9IAq1otX
         4OXyo4XdD53G4d71FE/txJcAxabdVf8o0EZMtUmAIPQ68bW01XgG9+VfKHqnG9KI+Gm+
         nlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382765; x=1734987565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6g8Hes4zmmKkaO7fy47WaMEtflUT5zhFAF/15yb5xHw=;
        b=j6/C9VtbTRrztX5878beRpBmzHTVIyYSBifqVPj07nTKff6hUhtCUymx8YQLZ6a237
         QbQdi+tXfWnKhY5ZOixZaSyaEumaFgKuNUA/jV3yigxB0e9AZoWxWa8xu3axwK4ajTur
         nr76HTxSXdtjIgwAXG/7XKjnYGD+tWVmz0XLL+PW/KSujV4npY0bDXWYudhYHf4QT+xx
         34qQUhv2UwzXdongDvNQdp2Enln1cLXECcoDLPb9Ps8nQMMi/pK01BsK51dlqrmyMNds
         O2C4qTcCLU4QOEOgH2iL5W9NuIuMJa+FR7bbFt/rZOgrvk4DnUTp6NXV++pdBnqaaC/9
         hrhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW59ySkXRSLANiM6Y4qtUjR2728mZiNFJ7MNYaQwlv4soWLFCSRGceAbG8pOvHqth08cyeY3fDEVpMRKfq0@vger.kernel.org, AJvYcCWCkbi8dFSbCUTbN8+Eom7EYigNv9YhblBMf/n619IfZnaeIkcp1ycRDHi5WYMLKS8OLqaqW3FvvY5pSmV1bP2yDsY=@vger.kernel.org, AJvYcCWdhmC6KnAwZIRrz/NN/lifJq8F6Y5H1fKZAYU1CGYQ8GV9w4MDqoqjQGrbuc2kY59ACxF5dBouC5/H@vger.kernel.org
X-Gm-Message-State: AOJu0YwBCF3iLxaLZmQxprcuOccb+UXYy7CjQKYAT5a7kgi/LjPt3Mvf
	RbHR6G8V69JcI+/m/VNx/1sZMdlYbzDmU6nZX1p854TGOddaijpvfaIMUjtW
X-Gm-Gg: ASbGncsxtkdnBobTf/lwF7QQiqJPc1zRhMFUk5W89GDhRVIynep50FdkVlwijs//U5V
	fY/yChHI9C++7pEOJPjYOA0/LRZEU/sVNLSc8f2G6rpacF2OfIh1OZZ8FHA6vcmGQLbcsOu0ND3
	m77lguBvJyZfuUX7U2kULz4aWC8WolAGsv2ks5FOTy7bTi2ZwK0Bwwuq9UY7SqBrUHCQk/XcLYT
	AldICVi8yNi50XUy7o2ZlduGRcc0lbN7erO5Zkyz9nx/OoZ/xo/d2BnCpAH1HLhBEjW+kZhq2jM
	2b2gFVoo9uYpacOA0kr5L5vuLTFqkr4EUxo=
X-Google-Smtp-Source: AGHT+IE/0Wkla3cwdqnUeqQ2X/Luzdc4zJBTGrYgLR8XdM5elRTWNQcVFl4OcK4YhrAEI1OsqZGtlg==
X-Received: by 2002:a05:6000:708:b0:386:3327:bf85 with SMTP id ffacd0b85a97d-3889ad337b0mr11100443f8f.53.1734382764411;
        Mon, 16 Dec 2024 12:59:24 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80470afsm9286956f8f.75.2024.12.16.12.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 12:59:24 -0800 (PST)
Message-ID: <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
Date: Mon, 16 Dec 2024 22:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/16/24 10:44, Krzysztof Kozlowski wrote:
> On 14/12/2024 23:04, Ivaylo Ivanov wrote:
>> Add samsung,exynos8895-hsi2c dedicated compatible for representing
>> I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
>> as a part of USIv1 blocks, they only require a single clock.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++++---
>>  1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>> index cc8bba553..b029be88e 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>> @@ -25,6 +25,7 @@ properties:
>>            - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
>>            - samsung,exynos5260-hsi2c    # Exynos5260
>>            - samsung,exynos7-hsi2c       # Exynos7
>> +          - samsung,exynos8895-hsi2c
>>            - samsung,exynosautov9-hsi2c
>>        - items:
>>            - enum:
>> @@ -94,9 +95,28 @@ allOf:
>>          - clock-names
>>  
>>      else:
>> -      properties:
>> -        clocks:
>> -          maxItems: 1
>> +      if:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - samsung,exynos8895-hsi2c
>> +
>> +      then:
>> +        properties:
>> +          clocks:
> Missing minItems
>
>> +            maxItems: 2
>> +
>> +          clock-names:
> Ditto
>
>> +            maxItems: 2
>> +
>> +        required:
>> +          - clock-names
> I don't understand why do you need second, same branch in if, basically

Because, as I stated in the commit message, we have HSI2C controllers
both implemented in USIv1 blocks and outside. These that are a part of
USIv1 need 2 clocks, and those that aren't have only one. So it's not
a duplicate for the previous - autov9 sets a minitems of 2 and the
others have a maxitems of 1.

Best regards,
Ivo

> duplicating previous. But regardless of that, no nesting of ifs. Define
> clocks for all variants explicitly.
>
> Best regards,
> Krzysztof


