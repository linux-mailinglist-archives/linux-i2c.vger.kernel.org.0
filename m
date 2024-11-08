Return-Path: <linux-i2c+bounces-7890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243B9C1F48
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 15:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76C811F255FB
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 14:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521DF1EABDC;
	Fri,  8 Nov 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGgR5Gri"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A9192B95;
	Fri,  8 Nov 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076278; cv=none; b=ctWiNF5Sz3X1nH5Edhufnpjsuy85fKYyqcZwp33DBBNEO/xYzgpYp1Lh3oehXoDp1eR05G2hkEtko5ZkmfawNdkzaFbS79aVH/p2BsqRyj7g7bCguFow1nYc98Qc2pT2ApKAsu90rQUQx/o2PgsOd58y2TkLqPxP1SGN9SvtEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076278; c=relaxed/simple;
	bh=prGBn97B5Be4zo4X5v0514bV7f/nDC54PVHDF3VDcQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+yLP5q5Year28+VpEuQRfP0NN1DsoNMm492Plazf5ag651Vd3yN4EfggYC0aificW+ZdjixLDwKRRTFLe+O1FHiaZXIav8KF2kqzGKjRCXG8hJtE5bUeVPfNye415PlL/PLlmEpDTk0FVL+2S+MWMSvoa8uL8zrR0tJIc8ebd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGgR5Gri; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so1774547a91.0;
        Fri, 08 Nov 2024 06:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731076276; x=1731681076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn3SiAgzI6AioBPH9bVjAZEwx2ghOtXqF4SLZHNkKLE=;
        b=HGgR5GritE1CY3woxMYWRRk/unxu+0OTmQTe3+GXRA9GdAMTdhQycPI6heecrmYB+/
         WKuFWLl3XdGQ9cW72ty27SI+30kGbcCPPlAmiYL91UI5dJ86rnfbhBbRnEVbLtPrndjc
         XwFoddEdnOaf+/0qB7al7/4gW9XVGrzbLoK3TxiUXXa5YTl5VX+MOeFmxuB/YLtSdMcj
         G9PhRgDlHf44GhhFjW1KxTiiVeK+npJaW96e1j2eVLWLy2fSPyFHWTDdxiwi5pGqtmD8
         X1dx5nN9Llf0px9GbZLZodJs6J5YUdR+2R3WhqAvUR67wuzjoDOwOEgAwxrrX+KV8Mv6
         Eq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076276; x=1731681076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn3SiAgzI6AioBPH9bVjAZEwx2ghOtXqF4SLZHNkKLE=;
        b=oBAdMn66SRMfFQ3fBzjYU/9EIFMqZ+ueHPRrmjEggBUABTULbimj4ZeoPTGzUowd8u
         jnMA8LdCGoArEkJVMsNksWFN08aSlF+v+E69bD0a45aXKrMUuWRq1XVJgVoinpbSVkpg
         nazTRKAjDgoI13hnxdGKbBPBI0CiXn/br6eydYAeIvo7aVatSVHixqD99y0fCi6Cpmec
         fnjRfYKCVgpcL0AyNO2vuFwMX2mijlFWgnR/2hm6DmAuNKDyG3dgYnSqiaz5PKtKeOgl
         Jb5yep91QAbAVWKs1VqnCMJH7/PR8WfQ/ZboZdfqz517K2izA5Le8Slsug/exL/6R5DR
         8iWA==
X-Forwarded-Encrypted: i=1; AJvYcCUhqIcgWJjj0jrCthVsl2WPx5dqE9Ig/hUKq55yxCQNwYF8r2y/sjgLG3fwo3m+K1fp/4jvfoYk45RD1H8=@vger.kernel.org, AJvYcCW9pG12IHA5CE3S4K8mQbSyMtcQIykFJHeH3ImoIXgSzE2ahYPewhvEyiynNxLlMpXEYplqAAbpZQNyXsE+@vger.kernel.org, AJvYcCX8PKlUDNMqg9WpbUva/kCIAgqUonCLOPPsCqJDkukVq99rhe56FJYu9E6OvHv9h60I1CHXec8zffB7@vger.kernel.org, AJvYcCXIuNQhrfd3hLxyDLlvE/jTAYbqnwFVTvsBmJCZyzvKvRnJPxwFgM/gFUuqGxSjrVOoaRpMwk+8NaPG@vger.kernel.org, AJvYcCXiXjCpYIr/oAW5mY+6bLbzlsgeBpPHSq8ZeAN2lwhG36D/oTv9ZyWYjSVygDNWXjyxc0zKSZPtrfHb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLHRDzKIhCKNr5ESihqbdqn6UJv5aHnptF1J4KGSeqGFg5s05N
	HjRjQSKXivHJBryKwx2ItLGKZ5fjCfAZkns+l5ZLqPWYnwSM1ijm
X-Google-Smtp-Source: AGHT+IGZM7BORZHYd1ECKtWCNiUq7cTPyLDkw7XowYaKmlJagEZq7YOHxzvkuB6FtCwSBT04tUY6iw==
X-Received: by 2002:a17:90b:1649:b0:2e2:bad3:e393 with SMTP id 98e67ed59e1d1-2e9b165642amr3718946a91.3.1731076275479;
        Fri, 08 Nov 2024 06:31:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6a388sm30683975ad.245.2024.11.08.06.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 06:31:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c6b1718a-1a16-4670-b9b6-d8d9bebad4f0@roeck-us.net>
Date: Fri, 8 Nov 2024 06:31:12 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
 ltp8800-4a, and ltp8800-2
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
 <697a9596-f5aa-48d0-ad26-ebe06b831ee8@roeck-us.net>
 <PH0PR03MB693869F52D961845C8388D258E5D2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH0PR03MB693869F52D961845C8388D258E5D2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/7/24 23:44, Encarnacion, Cedric justine wrote:
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Thursday, November 7, 2024 9:45 AM
>> To: Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> i2c@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>> hwmon@vger.kernel.org
>> Cc: Jean Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
>> Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Peter Yin <peteryin.openbmc@gmail.com>; Noah
>> Wang <noahwang.wang@outlook.com>; Marek Vasut <marex@denx.de>;
>> Lukas Wunner <lukas@wunner.de>
>> Subject: Re: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
>> ltp8800-4a, and ltp8800-2
>>
>> [External]
>>
>> On 11/5/24 19:09, Cedric Encarnacion wrote:
>>> LTP8800-1A 54V, 150A DC/DC µModule Regulator with PMBus Interface
>>> LTP8800-4A 54V, 200A DC/DC µModule Regulator with PMBus Interface
>>> LTP8800-2 54V, 135A DC/DC μModule Regulator with PMBus Interface
>>>
>>> The LTP8800 is a family of step-down μModule regulators that provides
>>> microprocessor core voltage from 54V power distribution architecture. It
>>> features telemetry monitoring of input/output voltage, input current,
>>> output power, and temperature over PMBus.
>>>
>>> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>>
>> Looking closer into the datasheets, I found that the PMBus commands are
>> identical
>> to those of ADP1055, and an extension of the ADP1050 driver to support
>> ADP1055
>> has been submitted.
>>
>> With this in mind, please explain why this series warrants a new driver instead
>> of just extending the existing driver to support LTP8800.
> 
> It also appears that the LTP8800-1A regulator makes use of
> factory-programmed ADP1055 but this is not explicitly stated for other
> variants. Initially, I thought a new client driver would be reasonable
> since this device is intended as a regulator while ADP1050/ADP1055 is a
> more customizable digital controller, and both have their own multiple

We use the same driver for many variants of ltc2978. We should do the same here.

> variants. Indeed, it may be more reasonable to extend existing driver since
> they are exposing the same feature. In this case, can this be done in
> succeeding version/s of this series?
> 

Succeeding version, but please synchronize with the engineer adding support
for adp1055 to the adp1050 driver. Another option would be to make adding support
for adp1051/adp1055 and adding support for ltp880X chips a patch series. The
introductory patch could then reference the original patch series.

Thanks,
Guenter


