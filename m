Return-Path: <linux-i2c+bounces-8851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 820949FF732
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 10:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5603E161F3E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A4B19597F;
	Thu,  2 Jan 2025 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="to/xHWBC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-67.smtpout.orange.fr [193.252.22.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761333D68;
	Thu,  2 Jan 2025 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808663; cv=none; b=U97s+8IMLWPqow0ZbXopnoSIxNxubu5ZZzDq1+GQ+qn1EyAaCQEXeZrEJtL72dxcT51YTQMz0Qt/gkIX0wAkSUku9y+SKDlL7ghnupOg6Eiio9Ybb1PT/JpXH1tjNIQUrJ8O/OLKkT4GxXdrU7Zm6ZiionrosO1BPB2JsCDI/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808663; c=relaxed/simple;
	bh=zghEmGBMc39NZbTdkZhdcwAKGgolK8rFK+hu7TmAzP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkvJfshkbABCa1Gn+GcwnWt4K2GkIUAWzWpMkLMtU5Wncd9RcEVLQOBfNpFLKX4LsrftcjkwKkphISAZ6q03BiNrldNsn8icYlRhuIGGwKgb+Nzf329dshRk3qNQ6BgRyyAaWQdeWmg8nAfX9Qk/7YgrJThCo+lHR9FFltwiQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=to/xHWBC; arc=none smtp.client-ip=193.252.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id TH7UtHho2v8EoTH7ZtzYi9; Thu, 02 Jan 2025 10:04:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735808652;
	bh=39nmaAXlbtXxpI44yh3hY9JN+QCD/Pdn8DUS9Q3fxLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=to/xHWBCunZGAPM3qDXj2KMhg9rv0ZHaJ9AdPbNG69HGM5jyjIW6/U9/+NxQuQcmq
	 Mz7JqqlYDWn/3hGN4UpLLODWsA5EG1Vk3PmG47guje3kKKO/OSw/y+TO4L+xpgjk6D
	 Iv2lUKbd5rCILZwyx1qtyf8cfzzaKbNomR52QHcdi5hwBYJhIAhRyx3jrRBafaTYEq
	 4UjYgMVhsEVw64d3/dyX/ip/+RyUHACZ9swuz4zBl5SEg2BtYCcq9EYR0PzkAnU30m
	 KAgb6kFrgroBU9ZgR8LiUYXpqyaEUZfydeyDcUAALrzeBWfQX2aAcSm++Ee20nwO92
	 m78dDF/2o2tew==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 02 Jan 2025 10:04:12 +0100
X-ME-IP: 124.33.176.97
Message-ID: <1fdb892b-a1e9-4199-a538-d5b98f283096@wanadoo.fr>
Date: Thu, 2 Jan 2025 18:03:55 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-5-a0282524688@gmail.com>
 <41f77d39-bce3-4e3b-98c8-f248b723a24c@wanadoo.fr>
 <CAOoeyxU0ex9_-a-uWda9hFbQa3MkFtNdAFan8C-899Z2pGYy7g@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <CAOoeyxU0ex9_-a-uWda9hFbQa3MkFtNdAFan8C-899Z2pGYy7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/01/2025 at 14:40, Ming Yu wrote:
> Dear Vincent,
> 
> Thank you for your comments,
> 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2024年12月30日 週一 下午1:56寫道：
>>
>>> +config CAN_NCT6694
>>> +     tristate "Nuvoton NCT6694 Socket CANfd support"
>>> +     depends on MFD_NCT6694
>>
>> I think it would be better to do a
>>
>>         select MFD_NCT6694
>>
>> here.
>>
>> Then, make MFD_NCT6694 an hidden configuration in a similar fashion as
>> MFD_CORE. Alone, CONFIG_MFD_NCT6694 does nothing, so better to hide it
>> from the end user.
>>
>> The comment also applies to the other patches.
>>
> 
> I understand, but I noticed that in the Kconfig files of other
> modules, the dependency is written in the form:
> config CAN_NCT6694
>         tristate "Nuvoton NCT6694 Socket CANfd support"
>         depends on MFD_NCT6694
> (e.g. CAN_JANZ_ICAN3, GPIO_DLN2, ...)
> Do you think changing it to select MFD_NCT6694 would be better?

That's a fair point. Looking at the examples you provided, your approach
makes sense. Please ignore my comment here.


Yours sincerely,
Vincent Mailhol


