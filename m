Return-Path: <linux-i2c+bounces-5916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C649640CB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4EEA286124
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376A218D651;
	Thu, 29 Aug 2024 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALkcPi6i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E818C90F
	for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925702; cv=none; b=ZtKevMTqY2x4Jf714DDY6pGtXvNI9/Gni+cZUjCA9tJGihodGQ2WNKKuwJAt2lTTtIN7j7sEdC9A0E9u554+ja0df5FVZYs94GMIVDMhxyGlzpKxDtLVH7f2PQTE1HImv24SaOlT2Oc//mAs+VCETStQi5CvoujBWaM0o2MAevs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925702; c=relaxed/simple;
	bh=QkJs4CrekP9zveKcRB8E5vMSHA3LUXNSKxF0D4rR54c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=m8M9d+llb+eFEnCG1Y1bkJ5sLRJ++vtECJEhJPmLhnNS7adWscCP7esSw3ArvKqTp4zlN5od2JdacACv4ivkUeEdIaJBjzu7qnGuu0dtKM3cGyypz2yqoKaAlaJpXrqJKCL13MvlgDX27sw4PHrRtJv+W+qpEMMiBB6yUKvoxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALkcPi6i; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86c476f679so48813066b.1
        for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925698; x=1725530498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fs/w7RGOKoomepefPnSh95RXx0WMdJK0RxeYg2QBR8I=;
        b=ALkcPi6iS284ReEG/KdFqgsz8bufWmYqO/IMdvW1sdD4DDjtAQUSGKpsDBpvbpCJCv
         LRhRQwuDQZVMVL2AktOeg5Vda11oZY8pDsZMoCxcgCzL3wf10gee3P2iD8tXf5/Pl/T3
         Q4qn4V4+7oCBrOX1JnP1ingQKA4RrSrxuFQZ6staeDNAT+uJLF8QT5CTW36GpwhAJyeM
         ns1BevueBbpolsmfUa+xYDMLPI7Cl4bmGoZAb2fAGROK7xGWF49N/kGMi2lxFO2N7TBu
         rwt4jOGnrYz+0mh80gXWwVddLMyQmfU+XNlt5+Hzdo+nq5wxI0LZESUlZYLgDlOQyKvQ
         wwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925698; x=1725530498;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fs/w7RGOKoomepefPnSh95RXx0WMdJK0RxeYg2QBR8I=;
        b=IG6G7j7P+yM3eQ5wYK8iNHRGnwz+uSV12o8JseivmpmY4Xe2w6RrWjP0QELH90WpxK
         npc5LV8oJ+5FLS8gyeqJDMJWTqzm/cVbBRaimwd2WEwCzdoZ7P2tazbS9g91NDfi2z/g
         ihy56RRml6PpVwfzysUJ/U5QlMaTYyayldjb/VOqFAPdPg93fFgudMg5YqKnTD2lX6hy
         BJrz+vUmXrRkDomzyK1EesJzmIpxnPp+ZgqOXPk1XfGJLvrx1nLULTPdY/yVU20Dw5zl
         fYyz9ubWAWYXF6ypI9bSnlUE7iom5Hw/Sw+2Hbpm8cKOPASZUSCs6uEgXvfSXSfB1J5r
         Ohvw==
X-Forwarded-Encrypted: i=1; AJvYcCUz7IW4ON96AB/DnpfJX1tFNI9FSLF9umO68ihU7IhJnkVgSI5JLT9aoClV7uCJD7vueOpORAM09NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKiNuHoJTuDfBdOLu6IBX+DDG6wjSE0PRJqwMDNB9CMNkFq8cI
	m+fdMmWn6CEwNlmeSXuU1PzMaGcTEe/zpfAo0pPfQAWWUky+YdhGROwqGd5hVD6IHjXl2gLg0i1
	E
X-Google-Smtp-Source: AGHT+IFiJjRLJqEBHrBxAeKhFuSOYhxbp+eWk1q/oUNun9oHTLDnVUAlE6tWzNqyPEolTRb6dSK1Pw==
X-Received: by 2002:a17:907:1c28:b0:a86:9058:c01b with SMTP id a640c23a62f3a-a897fad6fdemr162051766b.65.1724925698450;
        Thu, 29 Aug 2024 03:01:38 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb32asm57927366b.23.2024.08.29.03.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:01:38 -0700 (PDT)
Message-ID: <b2cfda34-f8e2-4db2-b4d4-9c707bfc8417@linaro.org>
Date: Thu, 29 Aug 2024 11:01:37 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
 <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
Content-Language: en-US
In-Reply-To: <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/08/2024 10:58, Bryan O'Donoghue wrote:
> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..ae423127f736 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>> +  qcom,shared-se:
>> +    description: True if I2C needs to be shared between two or more 
>> subsystems.
>> +    type: boolean
>> +
>>     reg:
>>       maxItems: 1
> 
> SE = shared execution ?
> 
> ---
> bod
> 

Serial Engines

This is a good example of defining TLAs

commit eddac5af06546d2e7a0730e3dc02dde3dc91098a
Author: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Date:   Fri Mar 30 11:08:17 2018 -0600

     soc: qcom: Add GENI based QUP Wrapper driver

     This driver manages the Generic Interface (GENI) firmware based
     Qualcomm Universal Peripheral (QUP) Wrapper. GENI based QUP is the
     next generation programmable module composed of multiple Serial
     Engines (SE)

...

