Return-Path: <linux-i2c+bounces-2891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 638588A0E9E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 12:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A25A283F6F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 10:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1647C1465A5;
	Thu, 11 Apr 2024 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZvRdSR7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DE145353
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830588; cv=none; b=MeZDIzwUQFjIMPKkEzOs5F4m7BAykthl4C9jY+8xSfNuHyfzxgutcOYA5NeDVq161KP9Dpes2rrUjhH9cp/ujaYef3u0PFTYJO8LleoEMqzJV8EpGIr9PHA62IsCRzxKeOw5O6LhKwWoVq70XMcTF+V3OTUJ7a1X6bqDEaGxpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830588; c=relaxed/simple;
	bh=Pn2gQiTi1p9mgyaKM+Bk7C8zw/P/dR25PNzX51W/IrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIaz5jkmiyxn4oodzPKfPVXlR9s8GBo46vRwxhHTA8kgbtLrTQ8atiD+TkqR9OqS36lijELzKjprECIL4yF45u60g29cq7mUtQmQcDkhdDTXMRlcPX4aiQzAsT2+x67yv7v6cN2WrnSBezdin70bhoBm9ifY6BuvUMqzopHlmcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZvRdSR7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343c2f5b50fso5008552f8f.2
        for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830585; x=1713435385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Som6CGa5BfE1UG504vsK30lRRpMYmzNHf1ZLO9xS0Z0=;
        b=AZvRdSR77H8Kx92drPQ+ZlnVCd9cn0+LsindP0ySZ9nMkpCE0M0firmun/xRcgI/6k
         m22ydTefyUg2uDivzkMmzoMwHK2M5TyIf/HRPm7oSfRS2qKVsGMUDy5xuGE+gT/oeWZl
         svw2o2E/Le/pMXxRt3WA/LYfU68dFMLjMWfcaXODxU/ECa5/WLPvSX9+tr/6mSUnSVhZ
         JwXB7Hh7HNGrxdog7v9/U2IXboq+eHuEiCsJINrISpgQ6x4wTfEy1L7uSFpfz8LkfDU+
         omepY2/epTr6MXAZBtZIkDn9tqZa5Jsj7LOpHt31WpcaDSla4kU5YCH7QR1pcqcptoU8
         MTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830585; x=1713435385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Som6CGa5BfE1UG504vsK30lRRpMYmzNHf1ZLO9xS0Z0=;
        b=aVj9tZzcGh9VuAFMsRrQriFxSQUledU4k0p9AnaJHkE4/MyS90vRByt3dQVnzDm5Ve
         RTrIs71QhRTzrJzxqK24Fgebf/HfH9nhQCNCQEAYW46BtazjlyOHyDMS9Mfdy0wUCS+J
         BCXgg3Nri3HqRRgS9M/eG0zhsiCdgQoSQB9ci2fm0U+PxoLl6ZzSmK1hpJE1KR2oENZB
         4vd4Rq8CQxUivDtyCiRrNdTvLiR4Uw4YiHTsf2ufROV2uhbkWB2bAVMDEDHUKcXS05e5
         HoTN9ZlvLPMKmAYLf5t4XjBagjgx81V46CCEi+149r6Qu7JI/7VCNl7Na5w43XHRbGS2
         RfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBAeOrelvpyw6XH4MUaa6meVNtXqNAZrLVFz6eC56hi4fuTm8052n8pTgRGw7urL++6otZSJfHj2ibjubekbOhPhMyNRvG/E5
X-Gm-Message-State: AOJu0YytIjnsMmo+tvoIU5pH6PrXZ75fiELjCIhMIw9WGPBpBgNfKiof
	uHSTi7RHyqKBjc0LG+9ul/uFuyXTnwDM9dsJNwiY5/ooVevOyelAH3QjkfB5UKA=
X-Google-Smtp-Source: AGHT+IEzsJNBeyb/d6YM4/2QeTWIZJergPf6IxoQ1tI3mGkumjWfHoOf9nP01oYRRX/sHghacyXydA==
X-Received: by 2002:a5d:6709:0:b0:343:b942:326b with SMTP id o9-20020a5d6709000000b00343b942326bmr3164470wru.18.1712830585365;
        Thu, 11 Apr 2024 03:16:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4cca000000b0034698307cf8sm1414656wrt.15.2024.04.11.03.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 03:16:24 -0700 (PDT)
Message-ID: <b6d9702d-4736-44cf-9a52-b476af4bf94c@linaro.org>
Date: Thu, 11 Apr 2024 12:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document
 sc8280xp compatible""
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
 <94779d2c-d159-4429-b0b2-6baa83461bbd@linaro.org>
 <1b4f745b-67d3-4044-9b89-de6c2c496af5@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1b4f745b-67d3-4044-9b89-de6c2c496af5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 12:12, Bryan O'Donoghue wrote:
> On 11/04/2024 10:36, Krzysztof Kozlowski wrote:
>> On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
>>> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
>>>
>>> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
>>> was correct apparently, it is required to describe the sc8280xp-cci
>>> controller properly, as well it eliminates dtbs_check warnings.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> I am lost. Not on your patch, because it looks reasonable, but on entire
>> history.
>>
>> Can anyone explain me why original commit was reverted?
>>
>> https://lore.kernel.org/all/767bc246-a0a0-4dad-badc-81ed50573832@linaro.org/
>>
>> Best regards,
>> Krzysztof
>>
> 
> https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195094
> 
> We can you sm8250-cci instead, so dropped the additional compat.

I am sorry, but that links point to cover letter and actually the same
thread as I linked. What does it prove?

Best regards,
Krzysztof


