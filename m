Return-Path: <linux-i2c+bounces-9883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E983AA67791
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 16:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA603AFEA6
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 15:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FAC20F08F;
	Tue, 18 Mar 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4bw49gc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2644B20E6E1;
	Tue, 18 Mar 2025 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311051; cv=none; b=cPtOdirQ3fv4CIhY3ajI5CJosyQSW0xs146XH/jBspOT2mhJUX+LJK6tAdW/7Hhes/Z7TpoHjCxntJ39jFgPuo99zN90le73KGZqDoxG7Yupq2m5zELWMe7VBHF+H37O0uTCySNGkJ6RCNGT0+iK2ud4j7TukW7ODFOd/sIaou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311051; c=relaxed/simple;
	bh=psTxiGB92gSaGM/Faa8KmerNR/BeW98o+Pr9u0hxNaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STpel70Jn7dIjpWVnRikvBNNif6y7ryaXQhToQlm6gRB73iRML5tRH7XmqT+i22d7v6dyRTvNH5LNSccAuIgnS9tS/tTojA60WNH9+cX9T8TLu2linNCb3TBkOc+ZAndoVtcIri7JF5nNSgVxi0Hh1Ts9mmsNfFDdHCidYN107s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4bw49gc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225e3002dffso62868295ad.1;
        Tue, 18 Mar 2025 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311049; x=1742915849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHAf260asVvJfddY3c+QBCDCOVojVZW9/fzAEGmVdxY=;
        b=D4bw49gcsdqgTSWJ1sFmEZ/nM2B+dsIskmmEv/lR8gG6gddSDorOXtDHpeod/X5peK
         jF3v9RHyNZjTA+VjglycIZTNvyDGlpyUoGDMEb5Zqju/f9szir/9SR9JR7csnRNkN/dj
         uWblDPoraGrJyuv3pspppwACzOs72NqtwanPCDUTWattbLzRV3jIhRf1/IUXI2rvivs0
         Gd9S9T05G8DqDYoSrlg7rrRwbhDICaly3ZE9K2URtI5A/2YIsjpO9peWb62TQ4jnQgOC
         f84nfrqU7/r+HCZFNgWHUW3nnHUopEhmIgvTJHwXqDhwk++7RTwnQ4AFmv+cQ6eW1Nbd
         OuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311049; x=1742915849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHAf260asVvJfddY3c+QBCDCOVojVZW9/fzAEGmVdxY=;
        b=o2sXP+TA2JYqyC/4OkqDmxMQ8iswa1JQv00Ti0fjQOUZNsZ5ScUUATmZJpFpBFLOoS
         WP7TX1wIvhuOs2Vyk6oPMJ1ey3GNWrkSEPPI+PpX/NjugvTHVST3nLnVqCKf266PicOd
         cSyL7/ysHw3pKC3KDnrV1IbVs//lnwPinbrppAjw7lIZOiZLwaiVTCuqSxBRdwEBJCzN
         SjfmwH+kAgml+b9I1DTtGi83ITaZUoOQv+NOa3h/xrnWrwd5QufCA2MWpjpj5B0Eb3Dq
         LhjgV8xsKkOUHKPFhryGkNXVNRE1cw0w5XLZ8sE0duAON6t4JUDNhdDxpSdXkuv0eTYz
         Go3g==
X-Forwarded-Encrypted: i=1; AJvYcCV8veftKbTOGFdal8HIMqGgx0WgJpCy1V1YB+kD7TQjZRqmTACUrP97vLphJluhTr9NQDBdtPPw1d5q@vger.kernel.org, AJvYcCVBaHz6vVD+gC5tZ7Wv07kID1vckyYJuSn2TfWSiwy+rI25RStdUrtNlTfcDaoiemp4+uKImdAviWmC@vger.kernel.org, AJvYcCVb2Ivqvwg1xBxJ0kAwhQqKvTL+UGT1st3nOZgX0xrY9ciA2yvOfOk1YKFf1E67kIhA3WlJ8TzLvY/5ncAF@vger.kernel.org, AJvYcCVnV3dPFo8abpaA1WPyzTw8TIr407mpk2kGBGOZmSR8raXV4OeV/YEpGeJ7raVMPjGz1RJOdVhSIPr1kJw=@vger.kernel.org, AJvYcCWHSpR8/dR2S3ODPa7H+UTM0+JeilxX2N1MMnMnCm2oVKZLHIpcNEicBnW1qklPYof5HaiPMmMQlLqi@vger.kernel.org
X-Gm-Message-State: AOJu0YzgA76Ku79Bj9EWAWcdCIJdG51gx42VSIlkPAe+gDGwzNWNPsMT
	vokXLFvGjBWl/5UdlpBoJzIgsh5hf9sqlTJZY1BcJ8dZeeUags6x
X-Gm-Gg: ASbGncuOgXE1I4FDKDuK3svNb69UwZ1t0RtEVC7rLm3kY89LLXyFhGFckU+gjc6C5iz
	U0ab5imX4mv0Zb5gBJ4Tre3fpM++kiq82Jk5qsEmd4qduprCsrewge4DeNOcWQIsrGn8x9LUiNa
	KwD2w/4pWEorTuEi4gw3lDXXhSwWg4gvGovYzQfw30RZ9iNg9Z9IURuiY9sVfZRrJLPep79EqqR
	7s3zbitKYwJ5DELMynkCxCbOfRhLeswXOq33kWwiKpHW2PKu16cuFdyuQC9HZ4LNSzm5fgRqnlI
	wD+00vLGZikPXWXngVSTIULrgGnusmr32bF4HZtOrSlotUMo5i02y9m47UtDir5rq2YFNJFL/Pd
	E2sryytaVniILn0t+lw==
X-Google-Smtp-Source: AGHT+IEqH1G8VZBeSKB8c6EwNUAE+zwq3XXI2OW9qUH7fPlFDKsvo00z+J1eK41UJAnTlcsMJl8jsQ==
X-Received: by 2002:a17:902:d4c5:b0:223:42ca:10ef with SMTP id d9443c01a7336-2262c6111d4mr51279195ad.43.1742311049329;
        Tue, 18 Mar 2025 08:17:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888675sm95585345ad.51.2025.03.18.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:17:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
Date: Tue, 18 Mar 2025 08:17:27 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
 <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
 <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 03:03, Encarnacion, Cedric justine wrote:
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Friday, February 28, 2025 12:33 AM
>> To: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>; Encarnacion, Cedric justine
>> <Cedricjustine.Encarnacion@analog.com>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean Delvare
>> <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
>> <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>
>> [External]
>>
>> On Thu, Feb 27, 2025 at 09:50:23AM +0100, Krzysztof Kozlowski wrote:
>>>>>>
>>>>>> hwmon code might need some changes, but that's not really
>>>>>> relevant for proper hardware description.
>>>>>
>>>>> Normally, I would agree, but it seems generic pmbus code expects
>>>>> this structure. This just came up with changing another binding
>>>>> maintained by 'Not Me' to follow this structure. We're stuck with
>>>>> the existing way, so I don't know that it is worth supporting 2
>>>>> ways forever. OTOH, is it guaranteed that these devices will only
>>>>> ever be pmbus devices or that other regulator devices which are
>>>>> not handled as pmbus devices currently will be in the future. If
>>>>> so, more flexibility in the bindings will be needed.
>>>>>
>>>>
>>>> I would appreciate if someone would explain to me what the problems
>>>> with the current PMBus code actually are. I have seen several
>>>> comments claiming
>>>
>>> Not exactly a problem but missing feature. pmbus code (at least one of
>>> macros I looked at) expects regulator node and some sort of child of
>>> it (vout), while such simple devices should be:
>>>
>>> regulator {
>>> 	compatible = "adi,lt3074";
>>> 	regulator-name = "vout";
>>> 	regulator-min-microvolt = "100000";
>>> 	regulator-max-microvolt = "100000";
>>> };
>>>
>>> so without any of regulators and regulators/vout subnodes.
>>>
>>>> that the code should be changed, but I have no idea what the
>>>> expected changes actually are or, in other words, what the PMBus
>>>> code should be doing differently.
>>>
>>> I did not investigate much into pmbus code, but this might be as
>>> simple as accepting arguments for .of_match and .regulators_node and
>>> then accepting NULLs as them as well. Or a new macro which assigns
>>> NULLs there.
>>>
>>
>> Unless I am missing something, the following should do the trick.
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index ddb19c9726d6..289767e5d599 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -512,7 +512,6 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
>>   	{							\
>>   		.name = (_name),				\
>>   		.of_match = of_match_ptr(_name),		\
>> -		.regulators_node = of_match_ptr("regulators"),	\
>>   		.ops = &pmbus_regulator_ops,			\
>>   		.type = REGULATOR_VOLTAGE,			\
>>   		.owner = THIS_MODULE,				\
>>
>> Maybe someone can check if that works.
>>
>> Thanks,
>> Guenter
> 
> I'd like to follow up on this one. As of this writing, my understanding
> is that the dt-binding should not expect regulators subnodes for
> simple devices like this. There is already a similar binding as
> mentioned in this thread particularly
> "dt-bindings/regulator/infineon,ir38060". I think a binding without
> the subnodes should still work with or without the change above.

Interesting. I am not sure if it really works, though. I looked into
the regulator code, and I don't immediately see the code path it would
take.

> With this, I'd like to know what the specific next steps are to continue
> this patch series.

Can you try on hardware using a devicetree file which doesn't have the
regulators node ? If the current code works, just submit an updated
(simplified) .yaml file and we should be good. If not, I have an
untested patch series introducing another macro which doesn't set
the regulators node.

Thanks,
Guenter


