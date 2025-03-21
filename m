Return-Path: <linux-i2c+bounces-9974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E200A6C15C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 18:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 446EA7A2942
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 17:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4824E22E3E3;
	Fri, 21 Mar 2025 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjeP4lDS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D422D7AD;
	Fri, 21 Mar 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577869; cv=none; b=kvPwNumgcWfwdC5TlMrIxGXbJUtnZJAbU+cThmXaAYhFwfenygMwpTTbKD3afQG3waPrk+n0lOf7T/Xd/UEuv6DiKXGbBjtNuNRNuAcqrBUKFUKGvIGmn3MRwo1CnZXRRy8Eb+8emC8eORXFhTprBObWX48qS9NPfU88Sckl6RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577869; c=relaxed/simple;
	bh=U3+4/ASbWGUJRsSspefTkVi4q/LOTzkUuqbk6W4voOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=opATwckTBAf5MOY/3w2Ii95tGCL6BM5BHyczqpNA6f++5PNX0fAI8tmHsQG+S0F5lFu6As4DaynGKx+kBotberHxjhB9+h4FPnsXSJVZWCUSM5qIF+PYSvT8ZBAFhYbhOIi4YXaBUw3URCtFrjlu/QCteHezVbotBZMCeB7VSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjeP4lDS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so7320944a91.1;
        Fri, 21 Mar 2025 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742577866; x=1743182666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y/NHqYLciWdiqaCQgtvu2IZg4U/giDGdUChxb6BuJCU=;
        b=fjeP4lDSWDqzdzhkNU3dfvkWmT8W5gsafd2NF6GeRKq5RSdAQbTbeh5JzYQRGeTRaH
         fGWtAIIK3jTk3ygrEoa3SFKceGRTrGIJx44zwY5KGySxQhpF3QbaMPOvyJhGBAs73eKn
         nb/Swknc5p2NptCXDJ/IMmNqikw/MtzEsNIT00o0d8RIy7RwiKbTdU+YKfWpigZDMwNY
         aG/BppdEBYSJyMySYRfrS4u7COBVTuxugZyCawjIIo56+GMz9R1/wk5FHo8V39Da4TPx
         4QmfVag9rJNNWPRIfA2KfAru6DitFKemkkAcHqHPnI6crWpXAa0/IkPysry3FjRTcl/8
         GGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577866; x=1743182666;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/NHqYLciWdiqaCQgtvu2IZg4U/giDGdUChxb6BuJCU=;
        b=pLx/6YlGmSmBFbFJ6Qp8T1/c/8VnTC2K79zEt+Ou5P5fdoYjHOCLlPF8AKX0m5kMjd
         VI3xmBPEmWjvFGLD8NkWOL+NqlWGOcaS5hALAsg/M7RHnN0VsglJBbsdPPqDAxjT93zc
         7qSh9NJUCzkGov+i6xz9ttcw9cBoCxmxc7yzLTcCDVn/L0eR4L1WeE6uQjyjmDHTRWkN
         8PdyP2wB5TtwN5IJNIFzDnsQDk3MTEZws9Snu3FyU83aHYML7OHfnOcD8blLIebnZ/ml
         lM80pvUOyWUiE4rIE8y0RytocRPnA9FhFthtLS6BLkOd6SEMA52byc5sKPTdkQhG/c5/
         HtVg==
X-Forwarded-Encrypted: i=1; AJvYcCUNFpKCHhdtBHT8xhq5ELmOTX9WJ84/mlHGjTMVMU6tMq+Xk3orXzXjYaAkFAEQhJEXcAVmpjrmdMot@vger.kernel.org, AJvYcCUU80YdgTbUTopPAsj6OTjYwVNkd654QvFm/nt6PYSyXbY6zgHspwyRNmjEKKpSMnKl0v6ibq69IFKyUX4=@vger.kernel.org, AJvYcCVLnMaSh4CUziz4jCHcgoxWpSUiVdaWoO5uZ2OttRojTL//1uGQF9Y9FvsfPHe78En7Os/EwHkW53jm@vger.kernel.org, AJvYcCWYQSwcyNJ+3NwRpF9KnOUCmoqtbw4RON/n9x24f5UQWbooNFkP5BkA0INrw3m7/2ITOEHoLHklveFVfqQv@vger.kernel.org, AJvYcCXCgxFr6xyXUY/Y2IDyFE7T31Vos/gnUOPDlsnzu6tKkJZo7I0OwJDU1Jx7moz2FIG88EYBCr6dGLFP@vger.kernel.org
X-Gm-Message-State: AOJu0YzjA5f2WjVZjjOZqetwI2BEFfObNYqIHYkQcAcpHm6g8z88ti//
	D8My5X0bU8vunQ8jK1IbIpTigKfjXjluA25CxUmEbZik8k1PDqRE
X-Gm-Gg: ASbGncsDZCjnIfAi6PSMwSNPbBGtldpCnIZ5r6XnEM7YbTVFTJw3GnI1B1zdq19soJ7
	IIKp/Y2oXIZK/G1mH+PP+Y6jBPCtm5SWV3+eR/D3UtI+qkNup8/lXxis00BoB9xn6/9Q6fPDPez
	5XOWjTFkoQ2OA/T4VnFQkc1KD0x4QQBAQvrz7n7q4F4oezVXc6Ow9UD+Ibmp41WyEPYXB69qiAM
	aLrGPoqVHSlmQBK4bejuHTk36vM89nFaoxAP8KL6wXrYfQLIj8ddW31fiJSKJ/g3GHOAwNajTfG
	dKr47Dh1N/fzX9qfz3SOz1uhO/y4KjofR9GoZZPQQ2d8nr1pua473cCvwp0YsAi4Bzv/Qiu64aN
	eOnN1/rYNly4Idsw0GA==
X-Google-Smtp-Source: AGHT+IGmFUdskVpDqaqmcl8pptczuWmbp1SYS3fxjeHts1BDLHMGTQ5HPEtOq7WmGHrgADYdhHBT6A==
X-Received: by 2002:a17:90b:4a8a:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-3030e54fb12mr6914349a91.2.1742577866361;
        Fri, 21 Mar 2025 10:24:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61a579sm6412483a91.32.2025.03.21.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:24:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <16b6b98e-711e-40d5-970e-af1feb46ce91@roeck-us.net>
Date: Fri, 21 Mar 2025 10:24:24 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
From: Guenter Roeck <linux@roeck-us.net>
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
 <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
 <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <ab329813-2903-4bd1-8734-ab36466650c2@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ab329813-2903-4bd1-8734-ab36466650c2@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/21/25 10:09, Guenter Roeck wrote:
> On 3/21/25 09:53, Encarnacion, Cedric justine wrote:
>>> -----Original Message-----
>>> From: Encarnacion, Cedric justine
>>> Sent: Wednesday, March 19, 2025 12:10 PM
>>> To: Guenter Roeck <linux@roeck-us.net>; Krzysztof Kozlowski <krzk@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>>> Conor Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>;
>>> Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
>>> <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>>> Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>> Sent: Tuesday, March 18, 2025 11:17 PM
>>>> To: Encarnacion, Cedric justine
>>>> <Cedricjustine.Encarnacion@analog.com>;
>>>> Krzysztof Kozlowski <krzk@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean Delvare
>>>> <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>; Delphine CC
>>>> Chiu <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>>>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>>>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>>>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>>
>>>> [External]
>>>>
>>>> On 3/18/25 03:03, Encarnacion, Cedric justine wrote:
>>>>>> -----Original Message-----
>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>>>> Sent: Friday, February 28, 2025 12:33 AM
>>>>>> To: Krzysztof Kozlowski <krzk@kernel.org>
>>>>>> Cc: Rob Herring <robh@kernel.org>; Encarnacion, Cedric justine
>>>>>> <Cedricjustine.Encarnacion@analog.com>; Krzysztof Kozlowski
>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean
>>>>>> Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
>>>>>> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>;
>>>>>> devicetree@vger.kernel.org; linux- kernel@vger.kernel.org;
>>>>>> linux-hwmon@vger.kernel.org; linux- doc@vger.kernel.org;
>>>>>> linux-i2c@vger.kernel.org
>>>>>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>>>>
>>>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h
>>>>>> b/drivers/hwmon/pmbus/pmbus.h index ddb19c9726d6..289767e5d599
>>>>>> 100644
>>>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>>>> @@ -512,7 +512,6 @@ int pmbus_regulator_init_cb(struct
>>>>>> regulator_dev
>>>> *rdev,
>>>>>>        {                            \
>>>>>>            .name = (_name),                \
>>>>>>            .of_match = of_match_ptr(_name),        \
>>>>>> -        .regulators_node = of_match_ptr("regulators"),    \
>>>>>>            .ops = &pmbus_regulator_ops,            \
>>>>>>            .type = REGULATOR_VOLTAGE,            \
>>>>>>            .owner = THIS_MODULE,                \
>>>>>>
>>>>>> Maybe someone can check if that works.
>>>>>>
>>>>>> Thanks,
>>>>>> Guenter
>>>>>
>>>>> I'd like to follow up on this one. As of this writing, my
>>>>> understanding is that the dt-binding should not expect regulators
>>>>> subnodes for simple devices like this. There is already a similar
>>>>> binding as mentioned in this thread particularly
>>>>> "dt-bindings/regulator/infineon,ir38060". I think a binding without
>>>>> the subnodes should still work with or without the change above.
>>>>
>>>> Interesting. I am not sure if it really works, though. I looked into
>>>> the regulator code, and I don't immediately see the code path it would
>>>> take.
>>>>
>>>>> With this, I'd like to know what the specific next steps are to
>>>>> continue this patch series.
>>>>
>>>> Can you try on hardware using a devicetree file which doesn't have the
>>>> regulators node ? If the current code works, just submit an updated
>>>> (simplified) .yaml file and we should be good. If not, I have an
>>>> untested patch series introducing another macro which doesn't set the
>>>> regulators node.
>>>
>>> Okay. I'll test this and get back to you.
>>
>> The "simplified" dt file (without the regulators node) does not work with
>> the current regulator_desc macro. I have also tried simply removing the
>> regulators_node setting from the regulator_desc macro, and it does not
>> work too. of_match looks for a certain regulator name in dt, and it seems
>> like it must handle NULL cases as well as suggested previously. I would
>> appreciate if this would be also verified on other ends. For now, I think I'll
>> wait for another macro to be introduced in pmbus to support this kind of
>> bindings.
>>
> 
> Figured. As it turns out, there is also a patch series pending which tries
> to fix the problem for ir38060 by changing its bindings.
> 
> I'll dig up my patch series to add a new macro and send it out as RFT.
> 

Question for DT maintainers:

Existing bindings, such as
	Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
expect a nested regulators node even though there is only a single
regulator. What is the correct approach: Keep the nesting requirement
for those regulators as is (even if there are no in-tree bindings
using them), or update the code and the bindings to drop the nesting ?

Thanks,
Guenter


