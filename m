Return-Path: <linux-i2c+bounces-7759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC579BB76F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 15:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E18DC1C23F4E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 14:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE91D1B6D12;
	Mon,  4 Nov 2024 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwEHLner"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDDC18BB84;
	Mon,  4 Nov 2024 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729912; cv=none; b=cBYi0FvaafFFaWrxzFMffGseA0HuGGR/zLP0ZgR+4VhZqhwiFNA+9Z2TMd9AKxIU4g5Dxlh5V9HWAguSLWcTuwP58D4wy4MQK0IEr0rIrcmIquIlNIdHxMsaK+5Frk6tpJayS27Q2QEiCxAGA3YAZzIbbWGTEaeBj61bVxoAUnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729912; c=relaxed/simple;
	bh=/Chv4Lh3NM8TilLfeoC96pG13MDmYyVvZbe/UZppYDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZMrEw2NDA/JTSZbpzPSjWSxAJTvQzBYQCo8XtwEsPHeHGPcFs15m6FY0Dk/L0ljD0KQbM8zXozF8eSgSirXKDCexFRv0dke7Ayg/eFxFAPHFEtP3ljTGk8aU6OYi09Vu62kaqMo+BKVz5nSTNBgRVowjKMKynN3ljAeh83XcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwEHLner; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso2989620b3a.0;
        Mon, 04 Nov 2024 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730729910; x=1731334710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EomflUWH20cDIjIkMNoiRS0Ceod1M+LUF8r7f2ao0zk=;
        b=KwEHLnerpQNKW2oOrfV5nLrsJDW5Aqh1Pmd0zzR1v9neK6Ga/Kofb2XhJwI00y8lyC
         4zUxnur29T1BDR02vtBkk2E534C4gnz8Jpmqs40gzRFImstEx5H5t/Rb4J8W73LXPmFd
         xCIlX0NEKk73UT3A+yaaNJtbvv35uy1uEbrGhz0YL7gSLCS/xYhs28w+yPDrYGYn33Bj
         qcSa9OOrhzc0Yp3CQcPuQFL/Nwi9L7tcyXKxzI0WNgAD7qWpfsNM0pbLfrh/yOklwxQT
         J0xlPLyBKCs2wNrCMc5BkrVRBU1QiVU74Aj75vG9n9wD5/Bbkc0w++5jHDiu8VgkFJ5G
         HSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729910; x=1731334710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EomflUWH20cDIjIkMNoiRS0Ceod1M+LUF8r7f2ao0zk=;
        b=NaFtZQzwt1KdB026fU6V8E3XrI/zC/z5TxekhMHsM9ZwzNIWedaw6stAjdeeAebhzN
         wuMYoJoDl7jy2w1nwVVm3eQXkGGB29GTX8XKRDfzAQrhTOG+eBBudqPgZX81Ryc26bPg
         U3x/JW5OKuPuaTlsrINhCmJEUbAJbv+8Y9+H0im2a0l6lTLf1MV2FEzJB5mA7WjFZ8mj
         vq1TynLhHRrt9edL8WH0JhPLAfn+9wdmZTLOPfBBTt5iLvVx7L9dQrq9UFio0i735G5y
         ABF1gUKyROlBBT0qrWnyNbeXJFSf2bo1NrqvHsKOOhIA2ARRZfHr2r74XsFk11+TrMPk
         aSZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWwGK0GAyhBdBVEWD6aJZ5QrAkDGZ3kypEjFG+/UvMLOeRTEYrI1225KWwTnMkgjjnfAh/+DF6dIRQ@vger.kernel.org, AJvYcCVNKaEUgFzc1NBm60v58ZPPb05qUscHCOGgCsTOR1ZI6yobWz90zi4fpxsuKv5GRQR2X8SN2oFn3hlr@vger.kernel.org, AJvYcCW2YFbnui5aBCb9AIqY9fpLabb1QJxF/D3kAzLDYeivOpqbOqR/owbOCAGVz3s50rdJQt+AyrT5+SuY@vger.kernel.org, AJvYcCWL3wGBRElxN1z9pioKip+vI208Pwx7qR7ZMOAVVG4bKi1JaoaqUOAYEqTsrDh6+zScsdvysIsN/qJPJ4kh@vger.kernel.org, AJvYcCXABk/aW+QA0de9+IruNfZGglwDmb4G9L2vN0pCUot4IM3kfRx8cB7qTQJGb5/mfc/B1jwdCT+G1UxpT2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrzOysIaZWWb253zZXC4Twj65V9d/sIwlCrv3KG7+Yxy5gtOR
	taD2EIfMQ89BfO86DjR1iMULeIh0bxaz9+OPcH1HhFXQ2TnkOVz+
X-Google-Smtp-Source: AGHT+IHmq91h/VGwfTg2kZ1Kcbf1CrWhmg5nKQ49/4Fo5+DxsEeXL/Du1kVgg7Gc5MY+4+QwCXzX7A==
X-Received: by 2002:a05:6a20:244c:b0:1db:e536:974b with SMTP id adf61e73a8af0-1dbe5369943mr2357337637.34.1730729909851;
        Mon, 04 Nov 2024 06:18:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ea68asm7420203b3a.47.2024.11.04.06.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:18:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fa79de78-aed9-4cd3-bff9-310f2b4a32c9@roeck-us.net>
Date: Mon, 4 Nov 2024 06:18:27 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
 <47164712-876e-4bb8-a4fa-4b3d91f2554b@roeck-us.net>
 <1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/24 00:43, Jerome Brunet wrote:

>>> +/*
>>> + * PMBus write protect forced mode:
>>> + * PMBus may come up with a variety of write protection configuration.
>>> + * 'pmbus_wp' may be used if a particular write protection is necessary.
>>> + * The ability to actually alter the protection may also depend on the chip
>>> + * so the actual runtime write protection configuration may differ from
>>> + * the requested one. pmbus_core currently support the following value:
>>> + * - 0: write protection removed
>>> + * - 1: write protection fully enabled, including OPERATION and VOUT_COMMAND
>>> + *      registers. Chips essentially become read-only with this.
>>
>> Would it be desirable to also suppport the ability to set the output voltage
>> but not limits (PB_WP_VOUT) ?
> 
> I was starting simple, it is doable sure.
> It is not something I will be able to test on actual since does not
> support that.
> 
> Do you want me to add "2: write protection enable execpt for VOUT_COMMAND." ?
> 

Please add it. I have a number of PMBus test boards and will be able to test it.

Thee are three options, though. Per specification:

1000 0000 Disable all writes except to the WRITE_PROTECT command
0100 0000 Disable all writes except to the WRITE_PROTECT, OPERATION and
           PAGE commands
0010 0000 Disable all writes except to the WRITE_PROTECT, OPERATION,
           PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands

The driver uses OPERATION and VOUT_COMMAND, so we should have options
to disable them separately. It may be desirable, for example, to be able
to turn on a regulator but not to change the voltages. Also, since
full write protection also disables writes to the page register,
the impact of full write protection on multi-page chips needs to be
documented.

Thanks,
Guenter


