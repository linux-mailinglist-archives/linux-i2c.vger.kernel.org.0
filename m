Return-Path: <linux-i2c+bounces-10520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BACA96C6A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87EA817C195
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 13:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B032820C6;
	Tue, 22 Apr 2025 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADbJt6TW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2CD281531;
	Tue, 22 Apr 2025 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328195; cv=none; b=py5+m0BnDOyC9TVl/4x8GqjJvkDZDJiIidUFl1S+6HVy9HNiT/7RlBEvKFRd2gJvJFEB/vCUXH7r1tmNbwr0eeU4Vi2MKBtek8ob09cb+y+5PaRAJIp0PY+O1LotfA7t9Et+V0o+oGETlfyhoxppr0St3H7FSRJz4NMXIsHItUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328195; c=relaxed/simple;
	bh=gy6Olu40Q32dv7dOUthyDjtLAO+g9DTM0EkTOoNgrF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+S5UFdljGGS2mor0758q17fBlETlv/y8HeygYDx6OUirHlcLW4ALaiaeUZIHGo6jibqLroUV63pDjVIIgvhEHLivWIg+MeqIXT4GBhV2tK1HZydg3lzF9X9NHLNMRlxTTRAHjzTpoj+WrHm5gNWcVgrYYf0hr7tVajc9xKqkyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADbJt6TW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5503264a91.1;
        Tue, 22 Apr 2025 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745328193; x=1745932993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aefdfmkdPPazfnx4OKlatxNvwNlWxlEorRtBR+QDCQk=;
        b=ADbJt6TWDCnPAQOXDz3PFG0/4LAj50UWCb6uLul3QwFqXNG7hu0gdyvl2urnc2K1FM
         yTCQdhC43f6CVlG0SEFSYw+S4f1ocppyMpVtuXjLSd+96dChrUVqpj8J+CFbzkrLy3dZ
         J9S3IDcp3J+dpfvvFU/CiCshlkMEbb/Eir/MhpuVFMIE2rhnsQxQ53t3olORh+yvPYFx
         8oHCzEV9O+PA3UqhGll8iIoJUZGyA4L4aEi/IeuRZDyBo5gqbKW392AZxcXFoyvOvJ3I
         C2LG/X3+JGFk/RH9I7OrrWLeXxF4OEljOUty4R4+xmlxW6RuXm6hc2uIEjjTBkGiD5tw
         eNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328193; x=1745932993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aefdfmkdPPazfnx4OKlatxNvwNlWxlEorRtBR+QDCQk=;
        b=bSgFe31ke+cwFoQq0NFXpS9315iYlXWcD5VBGbvWdI7gaeo9g0QXjk58WyIlwOLDWm
         34Y6zPZPdqlVqXBgqRftvM5BD+dmcOEqPmFSaT97y980V/SgaCWSx0NgS/NQlhMlcKye
         NIZ79AKPNhTfOaxMYuvCnqugtEHpYQrrtyx1BqA8yfqs/3YZqWbEMhpieZVSBs9ALbjb
         L/TRU/PvGsq7e7B+eVVTp+0hAU3J10+6UEjX6Y+ZHJ/c/KwjJ4u/JSQWZZqkGpWZYpEV
         v181RzEGIi4JYf2gRUjES74G55/bUVxgayXZ6cWL8sPqGED92gWxACz2+TXCCYjbfKzi
         pCcw==
X-Forwarded-Encrypted: i=1; AJvYcCU+CvlK5Pli5uJerkcQzsTDlDQ6yPd4m0dfESxiWAgn5X+zKreNfB25dkJ5gRFAQHW2KLdK/C6WftSU@vger.kernel.org, AJvYcCV13IJxwHAjtwJ9ujDXjnHsKR3JGazK6YYcvJN5/OHhN0V/cjDrUsJer20r+daeRDZmobC4D7uTnpvD5LXz@vger.kernel.org, AJvYcCX8b3aPc4Y2dG/QNHs7z+zGZfNPnx5nHiXVmeXAwt0djjPEQ/busZSwyufKL2mM1jPqu7b5a7HS/i9mVpQ=@vger.kernel.org, AJvYcCXGquCRwm5jFPWe26U5m3XUPO5foHNW1z+2AJuxjgaLgdTyAcWmjpRaRNYP1/NB+KsYaN/rfNSeEN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLgFkjmWbC8rNd5I7lEaW0kj2osI6woGA6byPKbKI6DKBfqNrA
	pg0NMwofO+X1RTJdHZYyobW3LwuuvygiR1shJOHiiNH5dKKHIAoHHmVAlQ==
X-Gm-Gg: ASbGncuCK0Db9klSrvnhXmhLoJanhExTdebh8pjnW3sfwmwqh0V0dK2TYZAO6bco1tN
	SnDiAvr0xQ8+OEF9RbweSiBY5Bn6fJg5+ICE0xKKSdPtKd8hPEc3cpfN20zb3VZkRBYRMBxLizx
	Iz/yM/D3/yEBFLydadkaAfncNVH52PYM9SGeNmYa6sq4a2PaX4JYtMIYWY/cpnaNfSpiM4R2Vh9
	i3oZ7DSRHt6GeVE3gkoFiKMSIbb8zVzTQ0dazPps8JVkhqSCHbO43XD7s8i+wHRiwW3WJIudy7l
	qZZPgYz44UPDNTUDjPpbqsVrykcyfNSiUvYUSNMoSg4i/I5Gp4gEZhwqtzJ3vAUV7UXsjsnfBhL
	C9xZqXSmPZNF9IA==
X-Google-Smtp-Source: AGHT+IHCoPsQu4MKAY49hgZZoGck3wP17GXNMe1UnALlNStOtO0vX+U+4vL7NK08n9PmxQZrsZctQQ==
X-Received: by 2002:a17:90a:fc44:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-30879ac20b7mr23686062a91.7.1745328192990;
        Tue, 22 Apr 2025 06:23:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0acb6sm8607765a91.12.2025.04.22.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:23:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <010b64c7-13da-49a6-b91c-b70bca6375e8@roeck-us.net>
Date: Tue, 22 Apr 2025 06:23:10 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add support for LT3074 low voltage linear
 regulator
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
 <a10230ba-1ffd-4dc2-96ce-3aaee2e30015@roeck-us.net>
 <PH0PR03MB69384B9ADED36F0E0EC5C73C8EBB2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH0PR03MB69384B9ADED36F0E0EC5C73C8EBB2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 03:09, Encarnacion, Cedric justine wrote:
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Monday, April 21, 2025 9:23 PM
>> To: Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>; Rob
>> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
>> Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>; Jonathan
>> Corbet <corbet@lwn.net>; Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> hwmon@vger.kernel.org; linux-doc@vger.kernel.org; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH v3 0/2] Add support for LT3074 low voltage linear regulator
>>
>> [External]
>>
>> On 4/21/25 05:18, Cedric Encarnacion wrote:
>>> Introduce hardware monitoring and regulator support for LT3074. The
>>> component is an ultrafast, ultralow noise 3A, 5.5V dropout linear
>>> regulator with a PMBus serial interface that allows telemetry for
>>> input/output voltage, output current, and die temperature. It has a
>>> single channel and requires a bias voltage which can be monitored via
>>> manufacturer-specific registers.
>>>
>>> Signed-off-by: Cedric Encarnacion
>>> <cedricjustine.encarnacion@analog.com>
>>> ---
>>> Changes in v3:
>>> -
>>>    * Non-nested dt-binding regulator support.
>>>    * PMBUS_REGULATOR_ONE("vout") ->
>> PMBUS_REGULATOR_ONE("regulator").
>>>      New macro needs node-name to be matched.
>>>
>>
>> Does that mean we can (and maybe should) drop the name parameter of that
>> macro ?
>>
>> This isn't affecting this patch. If needed I'll do that separately.
>> Just asking.
> 
> This is used by regulator_desc->of_match to match a node name in dt. By
> dropping the name, does this mean the of_match won't be assigned, or
> of_match="some-default-regulator-name"? I did some tests, and it appears
> the regulators dt properties can only be parsed when the name parameter
> exists, and name parameter == node-name. I have tried simply removing the
> of_match assignment from the regulator_desc macro, but it does not work in
> my case.
> 

No, I was wondering if the name parameter always needs to be "regulator".
I did not (want to) suggest that the name should be dropped from the structure,
only if it always needs to be "regulator". If it always needs to be "regulator",
it could be hard-coded and would not have to be a macro parameter.

Sorry for the confusion. Just forget that I asked.

Guenter


