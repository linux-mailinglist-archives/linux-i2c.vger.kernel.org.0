Return-Path: <linux-i2c+bounces-4431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4491B323
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 02:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58CE1F25A84
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 00:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D07A80C;
	Fri, 28 Jun 2024 00:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it2hPG6r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F726191;
	Fri, 28 Jun 2024 00:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719533161; cv=none; b=U05hKR2kfIYsiLFkc5DbdCoVG7X3PJyfSw+xRTTBH46cdS5KQ8QwHVLCJiYrN3mWPAV4vPovGIXtPZKt7Iu0cWh4NcJwmpnQr0Fp1Mq0Py95C6lOB9wgG2GI5FoDirP+wTl0+9SZfJDZdk+SsxsIyH+4LmjmepfjKn7pBMMscg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719533161; c=relaxed/simple;
	bh=dokR8Fm2CKhCvAzDfAdyB4SxWiGcs4M3DQR4tXuRD/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgK0w7MtAHqLRx+bitgv5kli5jH/ietkfJWcLjCMkpr8d2ZX5xGwlRKv3C6c6io3MJHnqn7YD+nAsGtKEcdZeghwTNlQCABzO2WA4oHprHYiaZgfbBdo3Crki1LR7q3zVISzuBv51DbsK+orvFliaGSF41d+lYdPkaifFzZKIOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it2hPG6r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f6fabe9da3so113855ad.0;
        Thu, 27 Jun 2024 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719533159; x=1720137959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=q0ZSvkaYPL0aMiPJTdyZjWw4rhkAuBmNQ840zqqrBqw=;
        b=it2hPG6r0Z9y6FvqpBNOD72X/o+/N8qTxPk895VSpt/a9dFr+tTPISWFH6XSdowtYr
         fwKoRou+XizbYLNZWxX6KP00m2uoenaYO4aHiJkohou2sOM3J/qyNMAiNKvAN6fg0egx
         boOwO1xaCU4j80k9KCZ9Kdw4im6Eom9GBBDMBkrLeoFfaQ9etBfSyuaBONB78P+gWvW9
         sjoC6FKcjoO3UNGhMUnRQ6HZeL60ecqjQDtiCmdHCHVe/l6xqhSc44oE8vjCu8XG56hv
         tCQKGNPVZ/SYSnIDGbkaDzv2MXckh5Hn0GVmMPh0h9naGNewbQdHkIYLpNx8cKoO3vWM
         PIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719533159; x=1720137959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0ZSvkaYPL0aMiPJTdyZjWw4rhkAuBmNQ840zqqrBqw=;
        b=hDa7391n9H0yK6yd+CNpGs4Q9nNH3f2WFp3dMp0621RO6xppTZlh1UbZiv9HneSGKz
         IE7Y6gXbnC9/v63VAtqoM+040mh5C+dCkrup5Nms9glpKqviI/9s3BSrvIhfAdZK5rYg
         QmhH7wckEyX+/lxCpaXX02XgKprgJ3GjPZbaVROQ+yasMAtL/wG281PPXRrK2nFM8qWU
         n8nY0UJ91BpF9yhDtZi+EM5nW2sEGo5eX9fBXjjG9gT5nxNOlLxoAXlSLpbkr2zm2XU/
         5V7gTcXPKZ6jJg3Oq4zMKP2WaELIyhXq1xnLNRgoBkAFFPpS69+dtpZXwNm681ntiiSJ
         KKVw==
X-Forwarded-Encrypted: i=1; AJvYcCXmUoXjvBFENBvWyszH9B7qobnmDy3RdvPQSFtk4o4RxM7FXc2IM7wlgGlrCQdR+myYxQNTG9xkA8IzzhaCqvSHg7cPCGyrmFpQQnPn5+8byeeyEbvevMy1KW3k/OVIxS9/KXPpH7aKm8fPKlTmBCVS91uc/k9/0r8xxTMLHy9rxgRjuA==
X-Gm-Message-State: AOJu0YxOE8+ATL/ux+UL4oq7VaVM94AU6pUpGTouaZ7foah9+NoiwXq3
	/pdYi3rKUUmGJ0Q6dz3tA9yJr6txRBFnu9DK+FKZrBpdqX+b64RW
X-Google-Smtp-Source: AGHT+IH/QWpADj9D7MciL00kSwES1GkfECaQH7fjfH0/mq7eWSZ/ccaxiPO/zqqPT6IKLCNy18Co4w==
X-Received: by 2002:a17:902:a501:b0:1fa:d77:21f8 with SMTP id d9443c01a7336-1fa23f158c6mr108575135ad.42.1719533158537;
        Thu, 27 Jun 2024 17:05:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1596675sm3333215ad.249.2024.06.27.17.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 17:05:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dbfa52ab-c6fa-4c11-89bd-87445941bac3@roeck-us.net>
Date: Thu, 27 Jun 2024 17:05:55 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
 <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
 <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
 <19ee521d-298d-4718-bdc6-f282666de371@cherry.de>
 <2a1ae708-3718-4f70-9837-bcc50b7c8f66@roeck-us.net>
 <85b2061a-9f5b-4998-b9cb-21308ee1965f@cherry.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <85b2061a-9f5b-4998-b9cb-21308ee1965f@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/24 09:13, Farouk Bouabid wrote:
> Hi Guenter,
> 
> On 19.06.24 15:31, Guenter Roeck wrote:
>> On 6/19/24 00:45, Farouk Bouabid wrote:
>>
>>>>
>>>> If it is properly defined in devicetree, the emulated AMC6821 should be
>>>> an i2c device, possibly sitting behind an i2c multiplexer, not a
>>>> platform device.
>>>
>>>
>>> The emulated AMC6821 and the Mule I2C mux are both reachable using I2C address (0x18), and hence the use of MFD as the mux only uses one I2C register that is not used by AMC6821.
>>>
>>
>> Whatever you do, the amc chip is still an i2c driver and needs to remain one.
>> Modeling it as platform driver is simply wrong, and I won't accept those patches.
>>
> 
> The issue that we have cannot be handled by an I2C mux because in that case both the mux and its child would have the same address which is not supported in the I2C subsystem:
> 
> 
> i2c-mux@18 {
> 
>          compatible = "tsd,mule-i2c-mux";
> 
>          reg = <0x18>;
> 
>          #address-cells = <1>;
> 
>          #size-cells = <0>;
> 
> 
>          i2c10: i2c@0 {
> 
>                  reg = <0x0>;
> 
>                  #address-cells = <1>;
> 
>                  #size-cells = <0>;
> 
> 
>                  fan: fan@18 {
> 
>                          compatible = "ti, amc6821";
> 
>                          reg = <0x18>;
> 
>                  };
> 
>          };
> 
> };
> 
> 
> The I2C maintainer rejected supporting this use case and suggested that an MFD could probably be more suitable.
> 
> 
> On one hand, the MFD looks indeed more appropriate and a lot of I2C devices are modeled through platform sub devices. On the other hand we are emulating the amc6821 in our device which requires us to have it modeled as platform:
> 

The difference is that those other i2c devices are real multi-function
devices.

> 
>        +--------+----------------+------------------------------+
>        |  Mule         (MFD)                                    |
>   0x18 |        +----------------+                              |
> --------+----->|    amc6821     |                              |
>        | |      +----------------+                              |
>        | +----->|      Mux       |-----+                        |
>        |        +----------------+     |                        |
>        |                               V__          +---------+ |
>        |                              |   \-------->| isl1208 | |
>        |                              |   |         +---------+ |
>   0x6f |                              | M |-------->| dev #1  | |
> ------------------------------------>| U |         +---------+ |
>        |                              | X |-------->| dev #2  | |
>        |                              |   |         +---------+ |
>        |                              |   /-------->| dev #3  | |
>        |                              |__/          +---------+ |
>        +--------------------------------------------------------+
> 
> 

It would have been much more appropriate to use a different I2C address for the mux.

> If we cannot proceed with that then we could add a compatible to the amc6821 driver to add the mux device (Basically the "tsd,mule" compatible in amc6821 compatible list would be a combo driver with mux logic + amc6821). Do you think that is more appropriate ?
> 

Implement the mux as part of the amc6821 driver ? No. We could discuss
instantiating the i2c mux driver from the amc6821 driver.

Guenter


