Return-Path: <linux-i2c+bounces-7072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D04009890A2
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 19:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E571F21D06
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 17:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBBA282FA;
	Sat, 28 Sep 2024 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9i24QLq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D83C0C;
	Sat, 28 Sep 2024 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727542814; cv=none; b=hbDNeCOFsrCFainQ482Z9IqN0wLRnxtVJ9QtcPIkbA2jjznMx7/5NjFbjAp8Wh7S1KK1Jn5koNimxlS2HFNuZb/5gGn38xheFtJn6/gcqz71WMsU+nV2YUUI2biwN5zXLsAcCM3tc0sT2nPr4XfbQuSEuRVq02qhl72HRjYlG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727542814; c=relaxed/simple;
	bh=JpzRoktUUw9obs5hnlnh5Thz00aaTtcH8FjeUyreHjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qmsc++S2zITqtRrggAEz8z0gVuOFMVhkzSOremjs6pIjZi8eRc8tvRvrl/j/eyNY7YHTVYY758ZwMhP9Htt7ALwBVSDE43divriRJQyA+RFi8TCCmFrf4I7jgkXM8jWHxcA5ECpH/77kjptBSN7Ssmr4PhjyOFTaPbTMtvT+OOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9i24QLq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-206bd1c6ccdso29322455ad.3;
        Sat, 28 Sep 2024 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727542812; x=1728147612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UTOKjeDI40y0Ue6OUMIPn81yhQAL6Fqgto1k93gouzE=;
        b=k9i24QLqezHZEIq3vcx1R7fkdSi/+moAfSmRldvNcTmlgWPnfwvPMrgQTNJMfaV+v7
         cXoDtDu1Hm7V7dMuGaCul5XemA3LyOLe0XZsDR1Y2jDHOwAZSSUuYxb0fP7wgAAnA0ua
         BpwCGb2UrLm3s3h4HV7t5tBtciztfVb0F7v8WDBmUjYCIM2z+CyX0lP8YRSnjwB6rv6K
         O0CXFRmHq/UI21kbqYKcBK3/Kd7Sg2XcGnuvykmGTjMpGGzWCmILDJDUezg22rL7kMnO
         +Kh8oKrkYDRqvr1+LlkA3JJp7tzaCrKDekk6pSugFDLWqx1izpZN6DxzjWcK5unmTR7a
         JKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727542812; x=1728147612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTOKjeDI40y0Ue6OUMIPn81yhQAL6Fqgto1k93gouzE=;
        b=ioDAiOMyHM9yNb4cicMpbt5M/cln40zlom4GPQAge/Oa/57sSbbhA9qDuYmIK16/xV
         q5zvfWohEwAUn8D8MKXBgqseULoNC4UChxk7R30I3QLIkShDi8lg7wBrL/fOkZhQpefR
         PkWSkUJWzBqUda4DaSktSz1tvc/u7mxmD5XK2fRb/pQim72x9kU5F97uwBZrIDBCaYmu
         g/rfiEdklqaYDUj3kYn24WUDyo4WYJf+rptWJBEqLwaTT7XML8Pxr5W5PIZgKk5xEoL6
         HcegIoxoCN1hpATc7NO2rucrF+7vj7BQyfyRHFLC8dUBQ1T31zwZ1Nlqr/wNekureeDT
         PY4g==
X-Forwarded-Encrypted: i=1; AJvYcCUAJYlkDol+pVRUjeF0+uP6V5ldJAfP1WvCHldmq9WP/0cA6eF7NsjeKYea5lhakURDEdYiC123F0IY@vger.kernel.org, AJvYcCUfYiI9jhPDfHQeABBflFTAOsHBjPSiRQlOLQMJ7knPR2M7yCwrS+3VU32tza+BeLoSYIeBM2oK8QI+22R9@vger.kernel.org, AJvYcCWhu3xBX9LqFUGJFdDusU1NOZ+mSQTPiWKcuFm/5+LQOSfJi6/AfA6kUmKWFND73+8KR55NcyH5uDlwWwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi5q32yyp/p2BWf7Fz/HuN9wb1BcneQ4r4UrcXg1NfcdVgo0Km
	6RYmbcTo8dGSk5Xzv1vU2cqF+1ycNxPCQ+/eboxRPsUzrmanrs1Q
X-Google-Smtp-Source: AGHT+IGueXaitWcvjKpZsS0r/x3tQpaPFWvWmOn4bj9GKrYjJmoVKflnEyoZOOCYNMiX2BUeoiDe5w==
X-Received: by 2002:a17:90b:19c9:b0:2d8:79bf:3873 with SMTP id 98e67ed59e1d1-2e0b8e8b862mr7774734a91.29.1727542812013;
        Sat, 28 Sep 2024 10:00:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c9fa91sm4306251a91.29.2024.09.28.10.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 10:00:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c1b6351-697a-4265-8ae6-f9ab1ee567cc@roeck-us.net>
Date: Sat, 28 Sep 2024 10:00:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Farouk Bouabid <farouk.bouabid@cherry.de>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
 <20240906-dev-mule-i2c-mux-v8-2-dbd28a150e41@cherry.de>
 <316e200d-74b6-4d03-952e-e8612276f0e8@wanadoo.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <316e200d-74b6-4d03-952e-e8612276f0e8@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/28/24 09:56, Christophe JAILLET wrote:
> Le 06/09/2024 à 17:54, Farouk Bouabid a écrit :
>> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
>> among which an amc6821 and devices that are reachable through an I2C-mux.
>> The devices on the mux can be selected by writing the appropriate device
>> number to an I2C config register (amc6821 reg 0xff).
>>
>> This driver is expected to be probed as a platform device with amc6821
>> as its parent i2c device.
>>
>> Add support for the mule-i2c-mux platform driver. The amc6821 driver
>> support for the mux will be added in a later commit.
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
>> ---
> 
> Hi,
> 
>> +static const struct of_device_id mule_i2c_mux_of_match[] = {
>> +    { .compatible = "tsd,mule-i2c-mux", },
>> +    {},
> 
> Nitpick (in case of v9): usually, a comma is not added after a terminator.
> 

That is a bit late. The patch is already in the upstream kernel.

Guenter


