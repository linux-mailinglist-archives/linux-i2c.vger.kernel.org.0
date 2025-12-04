Return-Path: <linux-i2c+bounces-14392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76548CA21B4
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 02:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803CE301FF4E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 01:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94469242D7D;
	Thu,  4 Dec 2025 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LriL6Syo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1581FCFFC
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811915; cv=none; b=YbxjTRFR3aR6vmK/VDPq8//VNcCTAbdxbgDke08FRLLiM8JKpe3nl0DOQfmfTAkFGeI/Ms4vNGv193LKAnY8wRzsa2HNbjPdXd/3dMOZVjZIWW1eXVhK7Bvf4ogc5jU6BBcr4vPnqVhlcicYAybhdnYUzoOPppT59NS+3cGei6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811915; c=relaxed/simple;
	bh=yqRq0TAR6wsZWEznBHeDJMwCJbb1TMmKfjuiskaHz6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXIYakPIZFKRnCHYz81ScI9reUP4O3nlI5XCqcY5eQrEHjvpioO4Z0cKfB/tppS4A8vFRjrefp7njU7DPyvWUEg1YvzsS0fdZyiQSdsPzBvW5nFnhyCWzFbnZwIUa8puDrnDMwkxKL7JeL3xKvshada3oQQaYm22FKBg3JtnQ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LriL6Syo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-597d6828085so29198e87.1
        for <linux-i2c@vger.kernel.org>; Wed, 03 Dec 2025 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764811912; x=1765416712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO6gdye/RhzRaWkQiwbtb2L+tSAStzv+9WJjZmM1LrY=;
        b=LriL6SyovnSF4euNsHzkv044RwDujCsilF1ynoxmvuVReyGZKwjmvcWq3LL8TmkKu5
         McNBJ1QgKht6E19z0RdnGhLsSzFXzkxtOzgPOjrrj7suWQWeP9lxLbsAMz3Ke2bOiuee
         0C0sNPZ3IJvtXXfQgeov3vfkiH5zdqmgPGVBDaH6sXL2eX+m0VYYZNtzKmd+S0YP12PQ
         1f1JT0H0LYys7oGiiESWbj+KCbfAjS/s/f8g42lsYbE8SICr6GjVBbHWsASsY9CG7fek
         iJBvi8BLMCaRTKimvkGDZlbSvLZGz2aX7/9cjJGHHPZp4Sct4l678jKyssTYCsxt1rLv
         zi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764811912; x=1765416712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO6gdye/RhzRaWkQiwbtb2L+tSAStzv+9WJjZmM1LrY=;
        b=Fnv3jZ4s9MskwP5IsK8j7RVez/xEEs+07O2gmeyK3h6pvyju7hoKZfIU9iR0Um+PNM
         dwzx10Tx1eYKpY6QIXLgw8ODnlfcQxZ5txwNes1fvmJPFxTzJKreRdhj6Du5qqH6TtU2
         ewu8UekWwheupY1XYdqYp3dPi1sz4vTQh1ZLEtswWRjq+gc7SiVdc7tLxavbNxVbpxkn
         DC2+dAij5FYAC2s6weIkCnmz0yfRLDm6nVUG+VGsYBLrU34sQwF9GtXmC5vVQnOqJKxP
         EcT/LsuxZjDLX1wvs9IMAP1Q/jsDMtcya3lhBLuXIICivyErQurFxwzOYreMkujNvjt0
         WDkA==
X-Forwarded-Encrypted: i=1; AJvYcCXScNwo+CJcktfhJoeXs/Qn3w1VlXdt1DaDqHhZOQ1IbwMUu9dCiL8diJJbvJptaNrpT81OnMp71/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43xtEP8lBuzE4noHnwcVSI7x8k39IqEzq/3ER6V45GP5R8wzI
	MEcFrewqN/PX2JDpm6wg/N2xrYYWC96LfUE95Oow3wN2K1MrmMzLR7omwOJxztvulWk=
X-Gm-Gg: ASbGncuUhuWo6kqJsyA0VPfHYW6Y7heuxjBA69N5PINqCHrrZ/lb8XCgAbdyDA/TcyC
	G20f+/BmBWJkhZr2pFXkfacfE8ww7XUBpaPFpVNaeStaUm/Uj+6m/hLpyPHLb00omKZnDjw22HE
	8SN/D+PdRb5AVSxxPI3zVJpqmXf43WeRHF6dHEE3MmgkN7iSDWkZwQUBiikcqSqh9VyAfZDvMk6
	lQ/jglzXvOBIIA2TcU/cihb/6lVCIAlQ8ZuPSu+d3k+waO2b1oG9hc+5HNtkPfHC6LGtHnVbJbg
	5vFRi5VPp/4XuuvDRq69KnKfgVZatTjCyIybD/c731ZFnDInDB+z4KJDFT2FhPhziyJ3zu+j9Ii
	2vckY95xc0xxbwuDI5iLtOl/aMCuwCiUUrpEtoFB20RMPxh9xqv2+/wjNuf7ifmNmrETPHVmN6u
	RRJG/LeKSx/AXiDPPkfNq9GD/32FoqDho6UpFQWcQHf/ZwssTfuj/EtXaK99pFDJiW4w==
X-Google-Smtp-Source: AGHT+IHo7YgZeNSkYmmPqS3Gf1PHEGCQcMyGJaPj2KfZGUd/FbgacScdkjipGnwCUE2nldbH/0enXQ==
X-Received: by 2002:a05:6512:b8e:b0:594:253c:20a5 with SMTP id 2adb3069b0e04-597d4b2e1b7mr722453e87.5.1764811911546;
        Wed, 03 Dec 2025 17:31:51 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b0668sm6344758e87.39.2025.12.03.17.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 17:31:51 -0800 (PST)
Message-ID: <d2794210-dfbf-4c73-8158-c28595bd73d5@linaro.org>
Date: Thu, 4 Dec 2025 03:31:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
 <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 10:10, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:35AM -0800, Hangxiang Ma wrote:
>> Add the compatible string "qcom,sm8750-camss" to support the Camera
> 
> s/to support the/for the/
> 
> Bindings do not support hardware.
> 
>> Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>
>> The SM8750 platform provides:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
>> - 2 x ICP
>> - 1 x IPE
>> - 2 x JPEG DMA & Downscaler
>> - 2 x JPEG Encoder
>> - 1 x OFE
>> - 5 x RT CDM
>> - 3 x TPG
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8750-camss.yaml          | 664 +++++++++++++++++++++
>>   1 file changed, 664 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml

<snip>

>> +
>> +  vdd-csiphy0-0p88-supply:
> 
> 88->8, so: vdd-csiphy0-0p8-supply:

I would make a minor correction here, it'd be rather 0p9.

> Same in other places. This is how it is called for every binding.
> 
>> +    description:
>> +      Phandle to a 0.88V regulator supply to CSIPHY0 core block.
>> +
>> +  vdd-csiphy0-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
>> +
>> +  vdd-csiphy1-0p88-supply:
>> +    description:
>> +      Phandle to a 0.88V regulator supply to CSIPHY1 core block.

-- 
Best wishes,
Vladimir

