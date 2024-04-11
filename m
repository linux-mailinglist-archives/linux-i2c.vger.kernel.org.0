Return-Path: <linux-i2c+bounces-2897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C4C8A13D8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 14:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3081F232CB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 12:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C890A14B06B;
	Thu, 11 Apr 2024 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmHqhhpM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE414AD0E
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712836948; cv=none; b=sE4nwxExUAQC/kMRc/w0AZAiSR7makjsZl+zGD2Wm0tTEKEWsh4QLUmQF6Yl1v3HZHRsAUXF8VbyqfIw348mg1yKmerikz3VMCHso9vDB+KZzXFnR4quDJE1ahyRu5BlMaoybvSBq+tV39oc9zOGZ5JeZuLKG37I53H0gJOZkuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712836948; c=relaxed/simple;
	bh=9ls8PLlmdnopOcrtnkQHx8TIJ9694JVXbjxhNM7DEtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRWuIjNvlkTBwvuxnGV4zHnAW8IUEZlRPeOzN/5MVm6uobjywUAopOvYsDlJir7D8gjUXf0e4mPx/z5xl1UNbBLwfVYK4byNZH4C4O6Cx2Xi5nQ6wRADlxPRySnpDthFfSjDSMwI2gx9kt7WIWEJ4oA2tTtVAn1u8GnHQFWlj+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmHqhhpM; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d718ee7344so88569971fa.2
        for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712836945; x=1713441745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V9ZPnaHFEWBZiCEODVKVvmrTMBwzRAOjL7TRk9ZMvQM=;
        b=GmHqhhpMk1AVM1taKy0n0Ii2pcTLCQNQvCx6h6ikAwANz1O1n4JIZ3QwxXU0VZ0yRI
         c/n0ME3w69fcfcOQO/o/F4YXxxTkcXwqKNUFIUTfN/ecmqmESEKcRQpZQMojg4lyZAhv
         r5/RdMm7lzQg0R5Dgl4c63JPjE7W51v31iRjdhV2QB+Dfihw3Cd8fP2uwbhl0fNK6VnP
         B03VP24DEE0C2AlbTNts2vyELGE4e9aaNql+zm6IZ1U+dBbzoDCTPP3xIhMsXo0VCryb
         ukSD/Vzs8dXr6og49Smp94KyxwOgfVZAbqBEOkbHtditCcIY4YvF9wswJpKDgvw0RFwh
         nkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712836945; x=1713441745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9ZPnaHFEWBZiCEODVKVvmrTMBwzRAOjL7TRk9ZMvQM=;
        b=sUv92r18k6qZnSEQCQgzcVu3qIY7tyAfnt3sGiUQLQC38nvFVCU8YkAHC2tmawnU/C
         aDw0xfVFmPNLVCefxRet7DBLaLsWH8X0zvsmTgLtvYXJdzISkA0hzdFbvae7JGjVTLqZ
         cPpI3nuf7nTfgeLeTldtD9MAZW3PQBZ8hyK4gjBvoZaf9SC5QONvmd1I3uk+ZOB7CIhO
         Yj+Hx1UGKFbWyQrOXJDATXFvN0H5gMNrbPQ1OI2sMF0f3mfBVlKCyzgdy+eJhK+XiBT/
         WvD8rhHTB1Q4daU7NAMj+5G/3E4BMVzHiHdcT2kicnFNUGcVD5nnivym8JuJ9CT5yNRX
         iYHA==
X-Forwarded-Encrypted: i=1; AJvYcCWxqwFD9HlTh6n5mcbfsjbXDph21gs45RZ6Owquj3JlPKELwB0SOhsaJgAizKBYTawwpbsrdswXdEYdAVK2tel5BOcAu3/GlyCo
X-Gm-Message-State: AOJu0YxPgIvwVyxppdvnFP3DglCIbBzR2oOUWmT9ZG9KiskRZNERUuYQ
	mFuCxMZArDwIKFLrO4nLrPMJfdwvcQLNFWz+iowosEqDnASOnPoXUejH/1VjqN0=
X-Google-Smtp-Source: AGHT+IGncO5GPoknGCPd3eZvPMr23QNEZLCQHNuYIqMmvx/y4L4nEaQRbyGRds5AdTQUhwMNlUfmTQ==
X-Received: by 2002:a2e:8907:0:b0:2d8:5af3:bb43 with SMTP id d7-20020a2e8907000000b002d85af3bb43mr3811766lji.41.1712836944978;
        Thu, 11 Apr 2024 05:02:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c35ca00b00415dfa709dasm2128717wmq.15.2024.04.11.05.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:02:24 -0700 (PDT)
Message-ID: <073d7867-844c-4636-b8af-f39e9cb44f3f@linaro.org>
Date: Thu, 11 Apr 2024 14:02:22 +0200
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
 <b6d9702d-4736-44cf-9a52-b476af4bf94c@linaro.org>
 <7ef1c0e0-bd28-43f1-a46e-4fa551714e82@linaro.org>
 <d6a92b15-f68e-4e01-aad1-6483d53b9ad9@nexus-software.ie>
 <dee67a35-62bc-4ef0-b57a-d163c6679c6b@linaro.org>
 <acca5b79-6c53-4339-b5eb-5a81b7048139@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <acca5b79-6c53-4339-b5eb-5a81b7048139@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:57, Bryan O'Donoghue wrote:
> On 11/04/2024 11:28, Krzysztof Kozlowski wrote:
>> On 11/04/2024 12:24, Bryan O'Donoghue wrote:
>>> On 11/04/2024 11:18, Krzysztof Kozlowski wrote:
>>>> On 11/04/2024 12:16, Krzysztof Kozlowski wrote:
>>>>> On 11/04/2024 12:12, Bryan O'Donoghue wrote:
>>>>>> On 11/04/2024 10:36, Krzysztof Kozlowski wrote:
>>>>>>> On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
>>>>>>>> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
>>>>>>>>
>>>>>>>> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
>>>>>>>> was correct apparently, it is required to describe the sc8280xp-cci
>>>>>>>> controller properly, as well it eliminates dtbs_check warnings.
>>>>>>>>
>>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>>
>>>>>>> I am lost. Not on your patch, because it looks reasonable, but on entire
>>>>>>> history.
>>>>>>>
>>>>>>> Can anyone explain me why original commit was reverted?
>>>>>>>
>>>>>>> https://lore.kernel.org/all/767bc246-a0a0-4dad-badc-81ed50573832@linaro.org/
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>>
>>>>>>
>>>>>> https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195094
>>>>>>
>>>>>> We can you sm8250-cci instead, so dropped the additional compat.
>>>>>
>>>>> I am sorry, but that links point to cover letter and actually the same
>>>>> thread as I linked. What does it prove?
>>>>>
>>>>
>>>> And just to remind because you bring some discussions from driver: we
>>>> talk here *only* about bindings patch. Not driver.
>>>
>>> https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195327
>>>
>>> Konrad pointed out we don't need a new compat because the sm8250 compat
>>> string could be reused.
>>
>> Where did he point that? I see only comment about driver, not bindings.
>> Please point me to his comment (and again, not patchwork which gives you
>> entire discussion and no one knows to which comment you refer, but lore
>> link which leads to specific one email where Konrad said it).
> 
> Konrad made a comment about the compat string in the driver, I looked at 
> the yaml and realised I could reuse the compat string.

For the driver. The YAML was correct, wasn't it? It got reviewed and it
was about entirely different SoC, not sm8250. You cannot use sm8250 as
sc8280xp in the binding. These SoCs do not share anything.

> 
> Then asked for a reversion of the add.
> 
> I still think this is the right thing to do, no ?

So if IIUC, the misunderstanding was about the driver/binding.

Then no, binding should have been dropped.

Best regards,
Krzysztof


