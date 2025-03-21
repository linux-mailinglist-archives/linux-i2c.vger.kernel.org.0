Return-Path: <linux-i2c+bounces-9977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB2A6C41A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 21:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA971B60183
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 20:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875DF23026F;
	Fri, 21 Mar 2025 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxCCF+yA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E4428E7;
	Fri, 21 Mar 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742588634; cv=none; b=P1Rs5zaJjehufhrAcnGpRcLZglfr9bwZtmJd6SshKAnF1TOfag5u7sFmG11rbRB6hvPxK0Yr+ozm3Lr+u+uVovjVaQJNpsdfRO+BsFjdyCk1Fwejb/HOHnRfnZcXoe9eRf8FAvsTbVPURgOMyQKnrwhZDMrd6NPXq4o3nwTYQp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742588634; c=relaxed/simple;
	bh=pSGCkutqlhfgmZ9pcispcde5O1dmP4dkXo+z1DTalEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2+SoXbL9kK0PlVcTk+VMSQuAlH8K6MAGLuyrIIKd3u3Aq3ih1cK3HDUa9cgrRyaQny/AlwaMMjD0sPgRK81JzMjWlXPCU09vWz4/Xond3vSg1THRetKUijimDGGpRDum8WNJ8w47mYuAW7J4auhq8czxMsqjCW+7/CTkrP63kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxCCF+yA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2255003f4c6so49518295ad.0;
        Fri, 21 Mar 2025 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742588632; x=1743193432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1djtg26CNE1DKn9YMuQNTPgebMHlacqcSzIFE/uHe2M=;
        b=hxCCF+yAuq5PoaGLqcO8j/Td/R504DpoY3dJckzHI0HN71bG3GSQgRsiC5vG0mrtrs
         +TSIgw97/CQVgrulgKbFYZbTeqzF+50hv3a8mKUrCRVTU5YZ+25qqwyim9jzhNUJbIAj
         odr8RWlMCmlcMB6/YaL2KwVrRJWhNx8LB5rXTlnfRC9EpcffXHZiIR5IW0F1CLANNOYo
         RqLuZv9wuCf9jSuO/D0SeCtFBHgGhWFh0nyysJzmSSnxYiqf7F4C0FA/mNMWEBw7clA3
         8tkyDxv9nCbK/+Azu2b7tBb2V1g36tkXceeqSJrNsESMbOFAvDHFftXKRRkRjt1k6GFQ
         sodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742588632; x=1743193432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1djtg26CNE1DKn9YMuQNTPgebMHlacqcSzIFE/uHe2M=;
        b=QX/nUIq1MTOm7lHm8yJeDQLovopTChM/01pg1gKVlanOehDCtLi5o51dRgozPz7V8Y
         D+5IVxu+KM1MtaeDw9J38MQC3CRi23a13iM/fHlzbT4zDpbPU0AH7NvKWh6Axh4WBqvm
         Z7ZacEPwiMjHg9lC+rsj5x7Remza5JOXuYvyS/nAHW7tqy/CgaeKPOm8MH7xR5464PHY
         3asO+710GiSi9x1GuQwI6yYKbeJ9L+kA0QmU7bHMSXA929f+elc5QnGiywyzc8BXqQG5
         Fw+XEs7+bphKs59ifsGpK3JwwC8gk2Kpreziiww4RAByBLkEoVHyUHvCmuLAGS0r1kOW
         VvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVeAoXML0OvD+RvRamEu5H6TaucTIOEqlI/lCBrgmxlcvYTOjHT/cJrz+V16eZdtmPtl+JMlk8gpBI3mCX@vger.kernel.org, AJvYcCVyMhMtHVV8+L3PfyG3Str0lT22BxcCK1WVCnhNk0kQzvjJTts2tBdFP9h1b7a44i6hIKGrMaOkEcdK@vger.kernel.org, AJvYcCWEHEvdNU+ULtZsb0/NA4V2vZheXulyzlcQuGZKsldenm95O605gzKV8OgHdieNNq7bXXjSyVirsK15oBA=@vger.kernel.org, AJvYcCWpFkJR2IR7GCQMF/L3HRjV17DLoOhB4SPmafTszp+hqEODtRQbjid4A+NcFa3MimQd+rCrvPhMs8in@vger.kernel.org, AJvYcCWvYMpIlMo5HvjA/cbmtyyQLLxRysgDYrJI7XX/XDvtOUY2cYEJB5LsgEGgKZCKEj0HkbuE7m17e95b@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9W2CVqMFOpftLgc5IiDCQbILEGPtfdHKeyhWRQmxrkkEPhkE
	iAUjQ1Pga2TXJu4rQHh/z9x34cu4SlpvAYbXDaaXAunrzRulbOvKRTUaWQ==
X-Gm-Gg: ASbGnctUFhMNyUoWjxDZ+dpLfcfl7KIKCkOfmXfNixkuy2FpGCW1bgGRJ/QYEBFFbOQ
	WrPGdac1OtWbMSN8lk1QgzE495GsxISIuE5K4P+ueMDVornmSa+9vDPtsuGgO1Je49J3S4nbKqW
	yboddm9OyIJJyF99s21yOXbXe2BcgyDidYnhEnLyEiXO+yiR/WmjRU4K7EdcS5+JH2Y3ActTaFd
	TTpZIMg+d+Ej/Ng9OaQhv0FfISd0FXT6EDoT3JmRFeHMobOFIk7cEq24vJnYUl+dST/n9kKd0Gz
	wQ8RQa4Zin2G2yrQZRSU1gfRQcdCCNrMHMEZLNQSXsC/sarVpmN8FPlbJ60V0ffrYMJNZXGGaDi
	dA851jInow5qQfDkwGw==
X-Google-Smtp-Source: AGHT+IGWdMAUjWh0+9yGqF7S/SRKjyn8WRH2kjJtyo1Nezds6nK2NVqewGCNg4/3iVAcnFSsWs5zUQ==
X-Received: by 2002:a17:903:40cb:b0:221:331:1d46 with SMTP id d9443c01a7336-22780c510fcmr60907465ad.2.1742588631562;
        Fri, 21 Mar 2025 13:23:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f461basm21912215ad.96.2025.03.21.13.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:23:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2bc5370b-949d-4b3e-b59a-d27c3f72026b@roeck-us.net>
Date: Fri, 21 Mar 2025 13:23:49 -0700
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
 <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
 <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/25 09:53, Encarnacion, Cedric justine wrote:
>> -----Original Message-----
>> From: Encarnacion, Cedric justine
>> Sent: Wednesday, March 19, 2025 12:10 PM
>> To: Guenter Roeck <linux@roeck-us.net>; Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>> Conor Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>;
>> Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
>> <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>> Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>
>>> -----Original Message-----
>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>> Sent: Tuesday, March 18, 2025 11:17 PM
>>> To: Encarnacion, Cedric justine
>>> <Cedricjustine.Encarnacion@analog.com>;
>>> Krzysztof Kozlowski <krzk@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean Delvare
>>> <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>; Delphine CC
>>> Chiu <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>
>>> [External]
>>>
>>> On 3/18/25 03:03, Encarnacion, Cedric justine wrote:
>>>>> -----Original Message-----
>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>>> Sent: Friday, February 28, 2025 12:33 AM
>>>>> To: Krzysztof Kozlowski <krzk@kernel.org>
>>>>> Cc: Rob Herring <robh@kernel.org>; Encarnacion, Cedric justine
>>>>> <Cedricjustine.Encarnacion@analog.com>; Krzysztof Kozlowski
>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean
>>>>> Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
>>>>> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>;
>>>>> devicetree@vger.kernel.org; linux- kernel@vger.kernel.org;
>>>>> linux-hwmon@vger.kernel.org; linux- doc@vger.kernel.org;
>>>>> linux-i2c@vger.kernel.org
>>>>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h
>>>>> b/drivers/hwmon/pmbus/pmbus.h index ddb19c9726d6..289767e5d599
>>>>> 100644
>>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>>> @@ -512,7 +512,6 @@ int pmbus_regulator_init_cb(struct
>>>>> regulator_dev
>>> *rdev,
>>>>>    	{							\
>>>>>    		.name = (_name),				\
>>>>>    		.of_match = of_match_ptr(_name),		\
>>>>> -		.regulators_node = of_match_ptr("regulators"),	\
>>>>>    		.ops = &pmbus_regulator_ops,			\
>>>>>    		.type = REGULATOR_VOLTAGE,			\
>>>>>    		.owner = THIS_MODULE,				\
>>>>>
>>>>> Maybe someone can check if that works.
>>>>>
>>>>> Thanks,
>>>>> Guenter
>>>>
>>>> I'd like to follow up on this one. As of this writing, my
>>>> understanding is that the dt-binding should not expect regulators
>>>> subnodes for simple devices like this. There is already a similar
>>>> binding as mentioned in this thread particularly
>>>> "dt-bindings/regulator/infineon,ir38060". I think a binding without
>>>> the subnodes should still work with or without the change above.
>>>
>>> Interesting. I am not sure if it really works, though. I looked into
>>> the regulator code, and I don't immediately see the code path it would
>>> take.
>>>
>>>> With this, I'd like to know what the specific next steps are to
>>>> continue this patch series.
>>>
>>> Can you try on hardware using a devicetree file which doesn't have the
>>> regulators node ? If the current code works, just submit an updated
>>> (simplified) .yaml file and we should be good. If not, I have an
>>> untested patch series introducing another macro which doesn't set the
>>> regulators node.
>>
>> Okay. I'll test this and get back to you.
> 
> The "simplified" dt file (without the regulators node) does not work with
> the current regulator_desc macro. I have also tried simply removing the
> regulators_node setting from the regulator_desc macro, and it does not
> work too. of_match looks for a certain regulator name in dt, and it seems

I just noticed the above. A NULL regulators_node should actually work. From
drivers/regulator/of_regulator.c:regulator_of_get_init_node():

         if (desc->regulators_node) {
                 search = of_get_child_by_name(dev->of_node,
                                               desc->regulators_node);
         } else {
                 search = of_node_get(dev->of_node);

                 if (!strcmp(desc->of_match, search->name))
                         return search;
         }

So, yes, there has to be a name match, but that is on the node describing
the chip. That is how all single-regulator chips are supposed to work.

Guenter


