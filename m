Return-Path: <linux-i2c+bounces-7607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 764DC9B18C3
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 16:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFDB61F21F10
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E92224CC;
	Sat, 26 Oct 2024 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsPrMCqE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CFB182C5;
	Sat, 26 Oct 2024 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954220; cv=none; b=r7Tb/hUULuUBIYMAx4hxDWTrFy7cHRIbhBB1SY5ynv6wloN1bORiJ2eRWcRfI24DtbdsZmAhcZ8aBu+j6NGbVQ6sOh/6XGEvtivpd2TG5SiaKqBdDNYfhiUqzLKQAqdvthV98jGRyxt/9r0mLE7e5Bcyvh5pqPUyrPHLPt9fH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954220; c=relaxed/simple;
	bh=5KhB5QIPJYmBMlCeam2xpt/6vptZLytx19QUApOgFYI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BT7tFMpns2/RuCgSYy3AZXPbRFGyPIQuOg2Cn0n9qqq1JaRapUh2scHeWu1HuTdU///+4Cm0EmXZBh+7njdOyAdgsxN7IphtV1i2d2Zki95sjcG6BDrUyfDNCNsfBInAnr3ffOb/4/nKAzSOOaBP/eTIPee9PvWTS/3HnNBocGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsPrMCqE; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so2255692a91.2;
        Sat, 26 Oct 2024 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729954218; x=1730559018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+5ngh4M2Qe1tGC7eJcPhLzE+JV0l59Dh4+0Uc0XqMvI=;
        b=jsPrMCqEm5l1K4+VxmG+IPEhnjaHckxrkHEdKEAqLwHq6Gm2jVJfMz6CUDkFKdRede
         R5BNRoI0E/m9Ypj6WJMrNpVP825hBGX9BVNnDqlgXBlQhgxDHqHBA4CYYI6YkUtFDPtV
         pS4NQP48+Ma+d+ivbCQ0a2xBShrm1NpW4qfAqOYwZZUnG+J5E3XcQKkw/qgWILyPDci5
         MNZJOOxO6i2J7DX6S2giWHXAmRsH7/Je25jcbXyVizWDigKM7ATwmDy4bNj/yZy6g26K
         dou/DXIMkuhyhJrbWQ9CCyijFPGpuAIpyhlEj10EvTuf3vrdHZTGX/EaHSwAbmh8+Ldf
         SROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729954218; x=1730559018;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5ngh4M2Qe1tGC7eJcPhLzE+JV0l59Dh4+0Uc0XqMvI=;
        b=XwrxqeSr7EP2ZYsE8deMqv76C4OCu7oQe/A6HkPhufn5KU5in3yuH76wtZ1/9npfW/
         0YasE47MW5ufRXAfobev2TjAUTeG9CV5nGTArfuJuF2orqRzXx0snwWhGnWtA2bqmdJj
         0nIFblfkByBcM0maURB5e1q5inzHna7fnytDGq8y8xAIvsGrNuqBgTOpepcUGobDdMBM
         po1VrrwUw4RtAOBJ6IM0cPljWnT4s9uGAJdo+Z0EVBqNNV43U4w28X6qIYU/vv/3nlCJ
         r01YmCtPtkdzlsKI0Ktzj0uNgBDdKIuARkEy5OH4DDSbH/dl4fSsLiYQI9KevTFhmkzy
         0yWw==
X-Forwarded-Encrypted: i=1; AJvYcCU4smmltobtxg7OgxH7VPO47eYNA0ZpOkWA/iyMkcjMJcI8sLA/4evbY1wR6MFRkhnjGcY5njgyM0W3@vger.kernel.org, AJvYcCUlcBcXcg7OGvblmgtwPU9z9+AID5yyCvkfHR6MyI4C8dkGGzvyw23IWLtAdoAesWfhnlFeMJbh34cGAXJoiro=@vger.kernel.org, AJvYcCV7bGGfO15thmLN7ewzs8U0Vv+Cr6AMeeQYrZrCF1tNcFYVHpe7da+CuWTtCArbFhxqt/HyD7oiAxdcJHN3@vger.kernel.org, AJvYcCW1z1yt/Pqr1oH7GvfR/BRKT+TJwMHqNuHBdX46E3VveXuebc+0etycWn3NoZ6UJ25xgVJ46ADt6XTd@vger.kernel.org, AJvYcCWCD3eVpCTdBW3w3uVMeU6zuCVRdn5jFCFvLfJHyZYHncR0g/64jdMT3/0+qJIQIb6aPsL1ViOiHaI6QQ==@vger.kernel.org, AJvYcCWD/+jOAxeMzWZvtdOD67kLNN4YY6opQTivY0yZ7fW7zrNLe0Rb/+pXac4mp2LAoj4iMzWveYgwIUw=@vger.kernel.org, AJvYcCWhmpYJCClbUp7/hYwkZWju/eOVccRHarZEYDel48un0lAXqAfhV27t7aiLBg8g4MtEIywUOggA@vger.kernel.org, AJvYcCXAoA8SkIU1eXOs83/5ordHnFoTrKSSNIZEU5KhdkMkudN0+p+WVuh0HoXfsSKc3qSdk1tVZY2gdabX@vger.kernel.org, AJvYcCXIUTFCWuiAN1GmxSRuDpeknfrlylGjLkJH4HxiH0KoP9Rdm40psrurumg46DoJB1yD60aLLtYx+CY+@vger.kernel.org, AJvYcCXRT7zq6WMX1iCVhXOjd/bb7NodxgAveTCO
 2mOEgV8zmChicsjoICowkscZ5de5wHG4/XWvXgStJz67x1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rHhHI54vRFMVakqr9sZ+Yc6kcG5vIeVo0lrz+W0D+wIIw71g
	0+UsVBL/iF4hNBpkL7WKM68Yar1z7phBz51aD43yHkAnKthMo93y
X-Google-Smtp-Source: AGHT+IFeGRrUx9En/q17tLcQC74ZYERPxzfculoVjeV6N6igxNHoISIFQdpeG8KZW0CXT3t7vL4Owg==
X-Received: by 2002:a17:90a:e20d:b0:2d8:82a2:b093 with SMTP id 98e67ed59e1d1-2e8f106b0f3mr3933153a91.13.1729954218097;
        Sat, 26 Oct 2024 07:50:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e56f3f8sm5547258a91.40.2024.10.26.07.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 07:50:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
Date: Sat, 26 Oct 2024 07:50:14 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
From: Guenter Roeck <linux@roeck-us.net>
To: Ming Yu <a0282524688@gmail.com>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
 tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
 <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net>
 <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
 <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/25/24 08:44, Guenter Roeck wrote:
> On 10/25/24 08:22, Ming Yu wrote:
> [ ... ]
> 
>>>>> +static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
>>>>> +                            long val)
>>>>> +{
>>>>> +       struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
>>>>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] = {0};
>>>> [Kalesh] Please try to maintain RCT order for variable declaration
>>>
>>> Ok, but that is already the case here ?
>>
>> [Ming] Is there anything that needs to be changed?
>>
> 
> I don't think so, If two lines have the same length, the order is up
> to the developer to decide.
> 
> Question though is if the buffer needs to be initialized. You should drop
> the initialization if it is not necessary. In that case the second line
> would be shorter anyway, and the order question would not arise.
> 

Actually, I just noticed that you also submitted an IIO driver which
reports the same data again. If a chip has an IIO driver, there should
be no HWMON driver since the IIO -> HWMON bridge can then be used if
necessary. So please drop this driver.

Thanks,
Guenter



