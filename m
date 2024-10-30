Return-Path: <linux-i2c+bounces-7657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B109B5AAD
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 05:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013B71F2459A
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 04:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE50719922F;
	Wed, 30 Oct 2024 04:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWAQXd+l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8D63CB;
	Wed, 30 Oct 2024 04:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730262392; cv=none; b=KNizlXkISM8WOb6Hcw5SKSf3V6liI/G3qbIczkXeaLvuEXMBI7zfamH033Gr17QDN0r4VxUXeQg9RwORHCsKyxvXdUHX3lRXCtyT4QHVuM1RXWr6diFsf4LznDRM+UlrjdlQETsZAYmlRS6obOXPPtu9dbVHerFDVcc8lYd7pk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730262392; c=relaxed/simple;
	bh=a+99HrebtQ2MocTLitUdf4M0wR1vKx2d51CbOgiT3bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bpj2/yPvmQxCZaROgIf7aUxfl1llK6MofxNf4ndUT2LoLjuvRYDzNZuJwrAn/mfFU4ZOZOaLbn91wEWkV6ktu9VaUHEseknM8nSi6g34bzn76ox2vP6oQhDnyElgJGZfebEpvdwmxazfdN8sxnOd7zj0RSFD9Iw7ru6G6jamWCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWAQXd+l; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e59746062fso5018575a91.2;
        Tue, 29 Oct 2024 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730262389; x=1730867189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PeV2eXcuovjuaiVjnDWRIrJxqo8228Qv/HbIFLO8aWQ=;
        b=PWAQXd+liMkEVHsth9DoIfRpxr9w/v797g4Tq6AaoJZ2pQeYSjdqTf0JxvJYhKbFAw
         /i39f94BEdnjkbxBmCBt7Xir5nefAitjJgxJILLMbDsCr/qjxn0qmO3nfniumpys9kQD
         zyaxP8atyyviabcj+alnSLYXEyc7SO2siCNthy0BB59iwb5PIXuAcnTR4yW9y1pGWN0e
         nzY4ZrFstHfaFGGubeEPsGI6OLw9yM8h3Wo63wclfsu6XTzm5RFEnmkLpCzl/0KqUAB0
         RlO8TJUAAmkcyZPC87QJJO80EK7E2aMIeVUQf9JZfQZRv/RNsMMNFcyWYHAWgtX23hus
         pK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730262389; x=1730867189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeV2eXcuovjuaiVjnDWRIrJxqo8228Qv/HbIFLO8aWQ=;
        b=sfoGveuS5qAdxagz771BCF7VHTOs974tsJgY/1G6dLvDOkEuEUqXGHsKJ9B9c6Nby8
         4zyAV0quxzCAU8PJ8lHejDCE6UzkGtHRVywdlVVzMxccM3ndMABcEaPWrw6E9xoOf5WU
         snUsKQyCgs8pwScTLB5YOzR54bm69Iw3Tc/FTqeNUj/vx2t7tCS4wTYi92yEqr8z0v2q
         lXcu+daTBRynyiIhBDQoqEMI6CH4do2IRE0XgLj/8kDTdQnymiUrCuQl5VG1m4ryLWCs
         1TSa9wS9ugc2T18wvYiZxV6ysIy5bLMv8oOzOUzju57z7Za58Xvsc2c8b89taTbDwQDL
         RY1g==
X-Forwarded-Encrypted: i=1; AJvYcCUTk4oW6gjAuClcUCxqBLMQyDk2nX9q/VA8C0H7BDlnej3ufvhJwe1IcQkQJoJKZ5Ej24U2PwEYEj87oNukJOg=@vger.kernel.org, AJvYcCVCG2c8xLl9+37MYTNh1RlhANh1/nLtCdCqnWuV/K6gMt3qC+khZpdrS1RvFCcoAfbxlJ+b/HR2i/wz@vger.kernel.org, AJvYcCVJ3hdVfB5nbGfcCm7bQYa3zE1biTLy7Ki7f7hawL0BGVEh1c0ATZMxWN/vEAvvN2FHn8KyXlG7Sy3t@vger.kernel.org, AJvYcCVWWhKXlhsZwU2nAKJLGS/slyzqVFLqYlrrlSF6i0/z3EhMGa5GzAyd63cGsW1uRo1hSBaFVjd6W0pl@vger.kernel.org, AJvYcCW7mq4lSek3usi7Hn1FgAyL+iYYmnQo07DeBXDDfE0fzvs+dUCtc82JgyoPItMj9qIwrgLgjSbKe8Vh@vger.kernel.org, AJvYcCWLXXicSwo5XMWDCvOs7HHBA+GziEWhh12oe5E65vNjPpHLSE5u9pC8eyv5gJFFww/uQdjVteim@vger.kernel.org, AJvYcCWfzBh2oeQ4TMAeIQioZHf2IkF72g3quJCJmAj5CV48YRVeDVn0TN/esLI7T8ueruv5c+7607sQaRAKJQ==@vger.kernel.org, AJvYcCWnn4Vp/aQwX1+1EaoijqS9CfWPwpenpwfFmzrsbrdYORQN6aUS/FTY4U14d/8eYECtM4RjN7CU2gg=@vger.kernel.org, AJvYcCX67w5TsDzrBTCKuuKE9fsqQJg1kmaDxNQvg0+w6sRQfRwEQ7pqBXyIJqA61eBimXdmOL/P57A45q6nlr0s@vger.kernel.org, AJvYcCXAMRONShIWVzqNNGl9h0arqfy776P/WcrI
 iStli78u3VE2Yg/qlPfOwdd/NiuYt4qNt+LM3UKo+S0s13Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL71KEcLYI1oiXFcXSRnJ0Gg+HcUwBkoAR+sg9Bxaj3JimcXxa
	fYmONY3+0J134D5cWtatV83lXD/vH33dzVlNoIoSs/sbBXYnbfmD
X-Google-Smtp-Source: AGHT+IEcLJIjDtbwHlrtoFSWOdzDcSzGC7W/jXCJ/1EpI78fu4G6cQ2qr0//fOch7Jrr4SIkMlnVHA==
X-Received: by 2002:a17:90b:4b0d:b0:2da:d766:1925 with SMTP id 98e67ed59e1d1-2e8f11b9e12mr16223220a91.37.1730262389557;
        Tue, 29 Oct 2024 21:26:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa9d220sm581019a91.45.2024.10.29.21.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 21:26:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fe2a7f2b-6405-4be7-90b5-0490761908db@roeck-us.net>
Date: Tue, 29 Oct 2024 21:26:26 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Ming Yu <a0282524688@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
 tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 jdelvare@suse.com, lars@metafoo.de, ukleinek@kernel.org,
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
 <02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
 <CAOoeyxX2Jk+76Cedu5_ZGgeRCPmT8Yhczmx7h+K-za7r2WS=Sw@mail.gmail.com>
 <20241028185414.65456203@jic23-huawei>
 <CAOoeyxXJa05XxTg0JpZ6GRV7XMMa3Rct4+c5Q3cqCtW9KZzQLw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAOoeyxXJa05XxTg0JpZ6GRV7XMMa3Rct4+c5Q3cqCtW9KZzQLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/24 20:29, Ming Yu wrote:
> Dear Jonathan,
> 
> Thanks you for your comments,
> I tested your suggestion in both the MFD driver and the IIO driver, and
> the iio-hwmon bridge worked well.
> On the other hand, my requirements involve accessing thermal sensors,
> voltage sensors and tachometers, so I should implement it in this HWMON
> drive, right?
> 

Duplicate drivers for the same hardware is not acceptable.

I see that so far only pwm and fan control is implemented in the hwmon driver.
There is no public documentation for NCT6694, so it is difficult to evaluate the
chip's capabilities. The summary doesn't even mention fan speed readings, meaning
pretty much everything is guesswork.

Either case, I do see that you also implemented a pwm driver which _does_
duplicate hwmon functionality. Sorry, that is a no-go. Again, we can not have
multiple drivers controlling the same hardware. A pwm controller implemented
in a hwmon device is supposed to be limited to fan control. It looks like
the pwm controller implemented in the NCT6694 is a generic pwm controller.
It is not appropriate to have a hwmon driver for such a pwm controller.

Guenter


