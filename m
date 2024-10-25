Return-Path: <linux-i2c+bounces-7588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860AA9B08C8
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 17:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C4001F28153
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4841714BD;
	Fri, 25 Oct 2024 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKAN5jJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FEA158219;
	Fri, 25 Oct 2024 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871057; cv=none; b=JdKlwIUsJT5A59wJ4AR/iOXtAWmCGoKQngo70XL+imHYVO7zeIYta/vlXC0xfrn0LNKI1ti0DF+ZHHxLV15cnhAGbXIX6yW4ObasvES/tonVx1bx35CP5SDOQO5GD+b7O9fIHXD57ahTjepADHGRFMG7NU2oArGVBYibY9mzWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871057; c=relaxed/simple;
	bh=vn4L0Kssm4qHDv91ZX0qDxoa9pCjsHBUmi11Lv0rAEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5A4ENxXCUzmKMQvvxkL/ug9m3P4ZBJLEduKQTU5sWbS0ILG4+hxB7ytBWaEphLROHBlG4uSNyUJnn7QHhZZhb/tgOWjHBSN0r7OuNeBAi0G7nMcM5XvUuJaFkHeEiUCInfSTFTpvqZWxpMPMcY+DdyF5qEzTobEpUednJ2Xt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKAN5jJl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c805a0753so21098445ad.0;
        Fri, 25 Oct 2024 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729871054; x=1730475854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SN8DcWX/dROqTArXD5nH9xajfGXdWvMk5oxxXOT+XxU=;
        b=eKAN5jJlqIG/9pVTTQUuzq9wsu6M/HmM/KbKtiBF5OpUALPDMOhn8YfCcQoO9cM+/0
         j2ACBVj4+Va1vYhfh4DsKe6UjgzbayFOEUcS8iT2VmWiOfwxYSKthFSBlxQigZGP++Cf
         9ifsXnyJCEAGVRs2ovLdVqK8m9AlDhGFg093mh3CzgkxETTonf6bia7Mb9FLJIu2ba1L
         GeihZfrG+mFxKzkihRfa09fcgO57y8hVSqHZDBzm3Cm6SRpA2f8LBIWLYQfESJ7v6LAz
         yoWTd2rwV2BIh9GE8Y5Xi/H8s5+zPWGhGFPKVqd9qgfxvvXM7kkOy21Dn2riFEzVruVP
         3pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871054; x=1730475854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN8DcWX/dROqTArXD5nH9xajfGXdWvMk5oxxXOT+XxU=;
        b=E23APc0XYcm+/debEqxXdnmVnnrEckVno0ZX7TyxhO1JB+3E+t064Adbg4U1Dj9YvZ
         9fQtNyPuVmxNzIHRtTZu9I/Wy59St7MuvxxUZzLABaUBl9ssh0+sdqWTo5T0Og51m5pE
         gjUVvVwBVVCb6cftjx7ET50zq4Z2cjZy7Zk69N2jTRScLM364fJDS9h/0gAOASU/Wljq
         2alkZ9eAxevxgteHlD1To19EZDIKCsWYYlc2a6bASdtBmzWCvu0HiMFqva+1kjDdImAU
         0QKMVkzGZOOPlpN+Rax4CQmSo26wNfQiM4fLOdeRSSWbaJu0nFVUT6T2aAGi/b0EZV1i
         rAjg==
X-Forwarded-Encrypted: i=1; AJvYcCUFWOz9N7ucZpdaoV6IuywkhcBGXy8c7KKh/tvXzhVGxqXm66GxcM4H8bj3+ogMxD8QGhXdYYfvbIU=@vger.kernel.org, AJvYcCUMh14mN4GYjQpPgX97Bt1s/P5PKf23KJHz/3/nCM/eWcJZIl6iOfTQC8UjRahnfX8ftgG4FYnBWefwzzr5@vger.kernel.org, AJvYcCUpk1fmZDAkb72U+nfmfiQpxku/TbjwY6CZbXnbuemRsqp5aaOlzITqVICggX9SsfpJw9sp1U7r02Ab@vger.kernel.org, AJvYcCUvxp7dnhpn9aDx0rwzvqI3sQOlQnoNaiANWCneoU5dAFtYhsytOx4xugUCL0UA6EwFY3111zh7@vger.kernel.org, AJvYcCVCxJ+XRZR6EQ0BLF3vEGah/gksdxilT4pXJE7B7xw8dYoctbrc87tL18SRuXKr/+NAkYwRhuhn6T5U@vger.kernel.org, AJvYcCVskDOMGAnA39rPr2zJ0ILMBVVTzIy1g3cmtClGQgkj3deXeQkx+N9ucjMUQsvKvZdMx5gmeqXKv4ai@vger.kernel.org, AJvYcCVznUGOYXdTV8gj7rt7oHcqADTYv68uBo/qXZS6dbcs79w482YyWEgkpseppaRbRUH3Y725cYDk7GUJaNs=@vger.kernel.org, AJvYcCWeh1amK8/z9mGNglE1ysuVQz4NdrPyBuIXv40fbywb1PTPZmPYvOh1CaJq1u7l3/GFFJTL8xdewjj+opuD0DU=@vger.kernel.org, AJvYcCX88ITaoM3RllEwTaauV7H1N78FG6smoCzL5sKxlxDsDXHfYjTPUqIFdUXuQ8y2s8LOFtpJbltaf4C37w==@vger.kernel.org, AJvYcCXs2TmkDtDG8RiNXXPvyAbHttVDL1u4
 ASluOqKm9nGHggjwix4jzRMBhcxqExnBLhNzeHEzG2E4wmfC@vger.kernel.org
X-Gm-Message-State: AOJu0YxNa2cgkmll2rMuBpVk6vTCMcudxkPUm7EYWiRknnV0wfar9pi4
	QfEJZmZKUsoy55UUdxtX12TUWxbzfxtJsk1bRMr4XKJ7hJyZYL6y
X-Google-Smtp-Source: AGHT+IE+7zMSTWMWl0WD/H7aqI4fO7bMiX7i3W2UCxfMlbQ/sZdV0uOKx4IL/fYIV7PAJP1kE+ECSA==
X-Received: by 2002:a17:902:f549:b0:205:8bad:171c with SMTP id d9443c01a7336-20fb98f1e18mr74160475ad.12.1729871052720;
        Fri, 25 Oct 2024 08:44:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e94csm10715745ad.198.2024.10.25.08.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 08:44:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net>
Date: Fri, 25 Oct 2024 08:44:08 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/24 08:22, Ming Yu wrote:
[ ... ]

>>>> +static int nct6694_fan_write(struct device *dev, u32 attr, int channel,
>>>> +                            long val)
>>>> +{
>>>> +       struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
>>>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] = {0};
>>> [Kalesh] Please try to maintain RCT order for variable declaration
>>
>> Ok, but that is already the case here ?
> 
> [Ming] Is there anything that needs to be changed?
> 

I don't think so, If two lines have the same length, the order is up
to the developer to decide.

Question though is if the buffer needs to be initialized. You should drop
the initialization if it is not necessary. In that case the second line
would be shorter anyway, and the order question would not arise.

Thanks,
Guenter


