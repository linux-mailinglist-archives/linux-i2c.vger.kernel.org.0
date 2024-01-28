Return-Path: <linux-i2c+bounces-1502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2E83F876
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 18:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AF101F21AA9
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 17:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA45F2C6AA;
	Sun, 28 Jan 2024 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY1un6OB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B442A2C68B;
	Sun, 28 Jan 2024 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706461997; cv=none; b=iaIA6GivhSTajkfJVcFSdFg1hPG4gLzFhMqoHSqZwejdlKR9QhD5cVJaKCDQkNbRnEj0hh7WYbPWv9q/ojJlBnFbk+zJqLK7WWmWxR5Klq3jBM60rkH4FOb6sLNg0Kcc7bInZTYfusz9IgpP4w3Z3AoJRnA3gbzIBImiot8o/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706461997; c=relaxed/simple;
	bh=jNDfSP0iz6F45hxisn1nC9nJOoP8Llt5SFMdhiO4ow8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lc14tjP5VG3+E2G6bPxV/9jQxz/Qye+2cQhikwRzuvvBskFjEIGXjrHV5C3bHs4SYN7UaWgEPEZ5j2xaNtIzwVC1FhkaCtR+uzblBuQBeqqvZeZB0nY4VWuGEPaZtF3D+LZB1326BjrXokU++gzxCnGc7Mbx6EyWfGnaZ5zXQlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY1un6OB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d8cec0f71aso2782435ad.1;
        Sun, 28 Jan 2024 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706461995; x=1707066795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6cDy7Rb25xoEXZNoitNmW/3Zfu/z4arLpo3N6K1MDEs=;
        b=KY1un6OB5x0a8E+t2A1PFv6n8QmxOnuvq1EcGpWi4vNjE7ReZvrV4oeLbObwKS2osT
         5rXQ11METOk5GfmOP8RGbOmJMWvr3Jers654XazEIHctnQ0yzXfCzqznDWbHUFX8e+H+
         Bc+JopscQZLTBY1ysB/+UKcS697QePgGQhz9D4GLTng1hwG2UZ8Fc534oZeTrnqettfK
         2ob3aCZ13naOqU/DM8o0HssNEHQowxx+kDRmMnkcWEzHZZjp38K+GlSEen+1y9XWndhx
         jOBSOiv6BptI95EuWkg6ZAi+UGN2sG0RyvcnVc6Xkoyz9twFCz+Vn4t7ysBPPeggyhFh
         /zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706461995; x=1707066795;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cDy7Rb25xoEXZNoitNmW/3Zfu/z4arLpo3N6K1MDEs=;
        b=I9b0h1wekW42HQNT16BVbUMDpQC5vXiWvxS2csyghqJ4YAdMJRt6R/vN4mh9MxOZTx
         eQriFV40uD78cmg5f9ekn8woD6mrVm1+ldwU4KkyOcnZ2Om4fkks6k0BtzjUpOhNivRc
         iFkBR+Uw/sisZcRCtESMEkh0xyuv/Q2n8s7BPRoTb7QrvLTWdBgLeeRiG8pYGkXnbg0u
         BJGU5gCYK6EFbNWHThVuoRj3eB1G8fEXj9PopbY/vaQNyPZnpn3N52bhDy6Yl/IBY3O7
         Dj22Vv1tqf3gZIuZRKk/6ClYDaj15hnYG+HPlGgw0ZvguymMYoBTQ2mpnpk9dAadaI9L
         C31A==
X-Gm-Message-State: AOJu0Yy6QbCyddPjfdiUTK9SxZ6iRiYwOwFU2pihE8SzY2pSURDTIT8s
	VDF/0wmRedE1U4u+w3hrgTMV/mF87DnfCfFn/41PL7WM40XuJ7PH
X-Google-Smtp-Source: AGHT+IHG4xQpWy5Yeqyu7lIOVrg/6i6qbqw0HjEhQzLzzE2jHDaUtrmZQMKIruoyu8kYli+xdFUaMw==
X-Received: by 2002:a17:902:e84a:b0:1d8:dbd0:bb42 with SMTP id t10-20020a170902e84a00b001d8dbd0bb42mr759372plg.21.1706461994795;
        Sun, 28 Jan 2024 09:13:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j71-20020a63804a000000b005d7c02994c4sm4560870pgd.60.2024.01.28.09.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 09:13:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cc561e9a-e493-43dd-ac9b-cf14786130ff@roeck-us.net>
Date: Sun, 28 Jan 2024 09:13:12 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: Add driver for MPS MPQ8785 Synchronous
 Step-Down Converter
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Hsu <ythsu0511@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Charles.Hsu@quantatw.com
References: <20240126075213.1707572-1-ythsu0511@gmail.com>
 <81860c27-43ac-4e55-a653-e7f5597ffa93@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <81860c27-43ac-4e55-a653-e7f5597ffa93@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/24 16:00, Guenter Roeck wrote:
> On Fri, Jan 26, 2024 at 03:52:13PM +0800, Charles Hsu wrote:
>> Add support for mpq8785 device from Monolithic Power Systems, Inc.
>> (MPS) vendor. This is synchronous step-down controller.
>>
> 
> "(MPS) vendor" above has no value.
> 
> I find no reference that this chip actually exists. Sorry, but I can not
> apply such patches without confirmation that the chip actually exists.
> 

I since learned that the chip does exist, so this is no longer a concern.

>> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
>> ---
>> Change in v1:
>>      Initial patchset.
> 
> A change log or v1 tag is not needed for the first version of a patch
> or patch series.
> 
>> ---
> ...
>> +		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
>> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> 
> I am not too happy that all those drivers claim to have no output status
> registers. It always makes me wonder if the definitions are just copied
> from one driver to the next.

I also learned that the chip supports additional status registers. Please
list all supported status registers.

I also learned that the chips voltage output mode is configurable. As such,

+	.format[PSC_CURRENT_OUT] = direct,

won't do because it cause instantiation to fail due to mode mismatch
in pmbus_identify_common() if the mode is configured to linear or vid mode.
This will need to be addressed.

Thanks,
Guenter


