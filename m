Return-Path: <linux-i2c+bounces-7850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D19BF2E9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF101C219CD
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038C720126B;
	Wed,  6 Nov 2024 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlbaYnpk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3EF1DCB06;
	Wed,  6 Nov 2024 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909529; cv=none; b=tizaWMBYG25V8XzkEA/8grsKlbs7b2UcRPcKFk3j4LGydcxCbWZPCuWqSXCDlin+lZpNutpduvHf3Ge1CCL4Qxpsz9njykXLpKSDHaHHU5zB5DWj4tJaB/nmyvKYwqOyDOXxmrHv4CY93BkNpl5mBs5V3OdDBu9aM8AinGvQRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909529; c=relaxed/simple;
	bh=T64uivFmO0jq+FDo7HOZZ9v1uoDiLucSFI2ULU1aKPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbYM5OLst/N47UjlEAGiRYDHTHzEijm+WXlGgy0f9NoxYLBbc6g63QO7pQl2d+qiC/eb5RBjFXYTsSvdOBuBtzWPHS22xL5ioq9BGKJdRYeFizU91wec+wJIHrrNL2y2gpFYK1K2cfn3tkQJCUkfvMvMubv7yG9PcyT9TdofxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlbaYnpk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-720e94d36c8so993675b3a.1;
        Wed, 06 Nov 2024 08:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730909527; x=1731514327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tHpwmXx4MDMRV0xW4DkzvkGIJELOPIvIsNOeu6V8YT4=;
        b=KlbaYnpk2UIJYLhaTJXfEZ0SHk7aaOg5qXEOyG8Xa6boU7zbyIAYdcmR9hnfLqFI+L
         9WDFSYrh5BoBi8j/4kpaVU68xVMeluqNhLc3FM2jcpRWhMLXG2zuT9Jykt2ZcSisjbOY
         IXu4RmH/8e/a0KitPk3K9giWNCV0LiwJHdiIjPjiV9/nHoXF2DfQiP8PbIXewHcJd3gX
         2q5NrtQN1GFveWG3e+V1x5bdW4MxmuxmDM5j/P/733TcYOWGZSzzbtediXNaZoA1Th/z
         tAPF6QdUpREoRJDKemuCV48ggJMwIGduVoD3BliQy/T1FKoh52y9wUbSd1B8VAYDbNOW
         GQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909527; x=1731514327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHpwmXx4MDMRV0xW4DkzvkGIJELOPIvIsNOeu6V8YT4=;
        b=YmR3NKeghXKcJADOcQrG49uYCpXmPdZL9DTj8d8cYwm90Kb5TX9wrrsz1/iWmTvobo
         Lt4lxzwFR3zBX5N9stLBQ3M0JfgbdBWxlD+tMGm8poQUpY7f1eMnh9toZj7cE1VwYmcZ
         LWgmkIUIxGXPgXZz6xGfTVgKwgQwCUz/22z51uTsMmb5J5QEpJtX6+SIPXHqAtzn1fGy
         r3vRtyEXFg7AwEmwJgOdcy/jVw8cSkAczYd/hQXxeJuK+hCfxid0oIP1UznupXf4WdKi
         fwc6pMRHp2tHOu5J8wKv5sKTvvrE4vIXBkEZ6ZWQzYqvYP6ddopPgMJTKniYH4lly1w2
         wgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVscFdb42pTeT5eYTcs3I1JIOkcR/88jtJYEZPSLgIvcD5y95TGPjUh/UzaVdmeuq5qwUqQ8bAmafLG9N3P@vger.kernel.org, AJvYcCWaVDskChxV5IU4r11/Y5Hin7sibbDsbgweZ3d/Z2GSuwaNsLU/qHkeCahpgtUZeMyHvJrzXdBh+N0P@vger.kernel.org, AJvYcCXPN+NWzq281G/bpUHlJTkxzQxmoh2NtXRdAgfH/8UmDnaGaOu+opjYUuINqVKuTHyNJq/SKoWVPgmk@vger.kernel.org, AJvYcCXxPJaRSgh1Upst+aPzuxZY2S40utDTe2Mh4y3P0ZAPZ1MoBrdi3itiHeMJmvZuJ2r4DRSQk8pxyqvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+eFhbYJhV7gH2TBjTCFGIWtcO2J9LxwxEp/PnfxrE0QD6pF9
	RFxc6zf3lenBZuYNLux5x4U91ffH7b124yfQgnPX4FWK9xYST9p2
X-Google-Smtp-Source: AGHT+IFHLmQfctSyRYrOZ+ozC5XQjTVXRqG2HGnIAlN9FyyNV61ZC2srgMwwoH/91vVnfsK+F9cniA==
X-Received: by 2002:a05:6a00:4f8e:b0:71e:4798:8753 with SMTP id d2e1a72fcca58-723f799883bmr5725514b3a.6.1730909527146;
        Wed, 06 Nov 2024 08:12:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc3152fesm11922289b3a.195.2024.11.06.08.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 08:12:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e88956d9-0dd1-4a38-8a91-8175223c87cc@roeck-us.net>
Date: Wed, 6 Nov 2024 08:12:04 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] hwmon: pmbus: add tps25990 efuse support
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Vaishnav Achath <vaishnav.a@ti.com>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 09:58, Jerome Brunet wrote:
> This patchset adds initial support for the Texas Instruments TPS25990
> eFuse. The TPS25990 is an integrated, high-current circuit protection and
> power management device. TPS25895 may be stacked on the TPS25990 for
> higher currents.
> 
> This patchset provides basic telemetry support for the device.
> On boot, the device is write protected. Limits can be changed in sysfs
> if the write protection is removed using the introduced pmbus parameter.
> 
> Limits will be restored to the default value device on startup, unless
> saved to NVM. Writing the NVM is not supported by the driver at the moment.
> 
> As part of this series, PMBus regulator support is improved to better
> support write-protected devices.
> 
> Patch 3 depends on the regulator patchset available here [1].
> This is a compilation dependency.
> 

Unfortunately this means that I can not apply this and the following patch
until after the next commit window, which is unfortunate since patch 4
does not logically depend on patch 3. That also means that I can not apply
the last patch of the series since it depends on the ability to disable
write protect. Those patches will have to wait until after the next commit
window.

Guenter


