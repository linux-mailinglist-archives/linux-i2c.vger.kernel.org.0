Return-Path: <linux-i2c+bounces-14949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B1CFC0BD
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 06:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9192F302B750
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 05:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED24025F7A9;
	Wed,  7 Jan 2026 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQrBYa9s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C51A5B9D
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767762999; cv=none; b=Oxa2xCwFbpbuNytzzM9ymoV/kVS6BrzO6TftVetzQnJ7ffVQFnMKge/NxRvzgs6uNXJkTd2z3CSzEUvxfkypY4QYb/JZ+gPMQRoLO0gvRBmtLbYmmad3XqNoK2C4MQUQSIZ14y3F/+2D4KkeM8gq50A2c7fNu7eGQuV3ge5Ew5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767762999; c=relaxed/simple;
	bh=r0Z/FGLdNUJcWaP0KFFmDyvF1sQpF0U/FrXBPBCEVeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kh5NXyz7ifD9BBnw2v+owAykvOyf3YzbviwoJKRHK+L6j/1dmI+7shGpz2CsoExboROlP5483U7Q+4nQgYKAS9zGJ39Qn5T/fppl0nwuqccEBl4mLeR/W+QIGir9D2ed1s4j7mgrySTzkqTdGZU2e/z6DV16l8w+KkN+s411NQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQrBYa9s; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b6eb4aca0so75235e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 21:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767762996; x=1768367796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqAELyi4+X9hoxR9GKK5xZxWKWw4/73gk/G+MxbQFVg=;
        b=YQrBYa9s8m08TXv6+GSJc9guZIiPsJ6VjOe3NCsO/Y/A9koHl6fW1JFGy3hFpNlAHb
         YEjSh2ppdiMHy//btSKDx/HzctBzqRz9Zv51BBmLkw898f3Y7vF/+34VS/kRhYtZGIdT
         nqz7UOZ9q9ywLy287cmeniOqrOAteX+a/4LJA1kZksTuC/5V41skF1btJmviznJAwr7n
         +nAH7X7T1R8RtKrty8qTwUg9+J93XpifS4fkcASzZZ96FXT72yTgX5xilqvc5KDeeo3L
         3yK7cvDwqgmnx+wtscwbieJLAalqAvZifclU3DRmfE6ymnCG534AWPQ0QbS82WcZ5SWw
         3R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767762996; x=1768367796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqAELyi4+X9hoxR9GKK5xZxWKWw4/73gk/G+MxbQFVg=;
        b=dIKNY7eJmn6YH+k9Bynd4XvMsWVhtBLsHP04Q7JDszSR6ZxQWeYHOWbXx7u/eC5dtj
         GPQiEouaRrQdFM6NjFHxH9356QxqdffCaMYUZ8iCgSeV0JcwFOxFka+99qLXTxS1soiP
         +xWqVwJG7RdTCeda8I2KF02gBHQghghNRj0Vpl+gXERa3H9WoPBhcY+wGG2LZ6glj1l9
         3wQWqulLYbkegoOY1vZEONUyJJC8+vPicHpAr/I0uj7JWGgeu27anV2on/c07eP6NJID
         PeV1cjSZdR0Ph1DPrGugN4RdKDTih4wt6DfX+7hdfMaq7/T9Jl0XwTr+nf62KVOd4VCP
         HWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDqX939l913b5KDEimWTJIii93tdzXxVOR0DKDK6ybc66scQ5CM9CAqqjefflMQ8MBuz2pdlbsWuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rKRA9c4FFLd4P83gf/XP0k8JxCDHctjTg8IgwgaET71XA64X
	83YSaQsb3Zoetp1rec2mzRHXPXr7kKYYbNM2t1bb7h7ZK9jpqH/EmzVLD5EoShkZ4Mw=
X-Gm-Gg: AY/fxX4Y6XxlcWsVqWYXxZqeFMNN31IXED2TtQRnZ664niS13EIqOZ0B0Ta5KDCjxa3
	ZCFsfrpzl+/AcwSZk2HlF6mYaX+lFUjr4VY8ET15hBRIk9DfQoLn5/78BBdy/NPFQTFhXIVauB3
	OLXqCq5JIneWm0+98rGdv1yXsHY+oZQQ1PwvmQXJbzs8MY4l9KxmlqqRXtdJTABVNZCE6/qhzyR
	OcJ1mv3je6WWeXkD19I1IJd8og8FEzHktGL+kPUeFQOBMFVaMYJIEIM/36eGCfsR4vRRQ1nf5gb
	MUhYnrZJcupwv9FFhCe3PhKyqgYBzTwZhU3fRSD1vVeTV3nOxO88LurKftkRn7t+9ebqtNgdb/l
	B15gLX48lOazRkSclLRXf4KquF2eig553Zri4PRg86fFK9SeLwrouySG5GX5K6OZiHa8bB6kHNh
	G6T5EY+z37pf9rRsayqvpT8TATK40iaHHAKoDJr9s226LmT6pyrTvJJGMChOQU/y2pWw==
X-Google-Smtp-Source: AGHT+IHpD7HZvIJALwMPTqhikXe6Kx/ivzmXk1SXf0Q/2OaBXAZk7P6dm/tG48Z5K4TR/Q3NzHJ81w==
X-Received: by 2002:a05:6512:4016:b0:595:9161:f837 with SMTP id 2adb3069b0e04-59b6f047f21mr207025e87.4.1767762995882;
        Tue, 06 Jan 2026 21:16:35 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5db5fsm1087038e87.56.2026.01.06.21.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:16:35 -0800 (PST)
Message-ID: <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
Date: Wed, 7 Jan 2026 07:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
 <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 05:05, Wenmeng Liu wrote:
> On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
>> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this overlay reflects the possibility of
>>> attaching an optional camera sensor.
>>> For this reason, the camera sensor configuration is
>>> placed in talos-evk-camera.dtso, rather than
>>> modifying the base talos-evk.dts.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>    arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
>>
>> Is it possible to attach other sensors? If so, overlay name should
>> depicit which sensors are attached (compare this to the RBn boards where
>> specifying "vision kit" defines all sensors attached to the device).
> 
> Okay, we previously had a discussion on this. I will rename the file to
> talos-evk-camera-imx577.dtso.
> 

Other camera or display .dtso names commonly repeat the name given by
the vendor, and the bare minimum is to name it the commit message or in
the code. Is it Arducam 12.3MP IMX577 Mini Camera Module or something else?

-- 
Best wishes,
Vladimir

