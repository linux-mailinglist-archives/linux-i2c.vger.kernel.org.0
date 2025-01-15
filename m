Return-Path: <linux-i2c+bounces-9091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C9FA117DB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 04:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14453A5B81
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 03:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6856C155333;
	Wed, 15 Jan 2025 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aJNrtlpj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66604C98;
	Wed, 15 Jan 2025 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736912196; cv=none; b=XOOQu1pE8Vi756xd1f10GjQcRDOJl7/JzAYiRyvujxPXbDXQ8HcEaLyFVLjr4iH8dTuB6GwSytPUf7G9zjZ499UPaeOdOn2zRoO5x6ErUpp2HjzuNxzSxx7yFKiK8emLtjLdNJnEnpZymQ7ObVzFsgYs5BCHu5i+kmxtcV4MC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736912196; c=relaxed/simple;
	bh=6uouPwruT4T4lGCnNTZ+epyQ0LFUmA1s6AHNKGnDQZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGWN1HxoNut47d1MQzUfrFkZhjcovoGaaIXeRzsatyaSmQkiY5xDjJydEIK+V+nHxXtRVSxATMxF4Y9+ZaUQPMpVO8SZrgF2UABhKWUydE8Ns2vrUJ0BCIiS2G6LmvCoQvYGSRoXKKduzmuo/kKQa2Er6meQtqtY2xk8gpmzgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aJNrtlpj; arc=none smtp.client-ip=193.252.22.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id XuCUtxHwDebtjXuCYtxLu4; Wed, 15 Jan 2025 04:36:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736912189;
	bh=J8fFcIQP713EnSS7oTLmRNGq2KoaDAy7Nz8BtUjaVws=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aJNrtlpjJhKr+eQJ83siupHLVsBtKjVbPIoFK4utf+mn/hnBPukU4a440qI+NeLzH
	 W4mVuJ12DK8zH/ws9EZYzBmggNxwj6kE3MLVnA9Llw1ARiztpgY/3y/ZKku8kxPd6H
	 9beVFFlw0wPv0SK6OXtW1pGXBMv3hwOBfnV/gfb9bUEmOg4SuYzTa9di2+wVUQh+Zs
	 wzaBW9FOKAIlwhnHBVZevaTHvIutO+XDJVEbCTAuRlK/3iK2DT3HETY6v4pQgsFULF
	 I6POim6Mlv5HRxBeYqS3abhvNDS5YH9Z5ZUJOAt9CCi61Dqvpv5tkNo3nSfAl//mGh
	 VPXtwhfDSuDlA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Jan 2025 04:36:29 +0100
X-ME-IP: 124.33.176.97
Message-ID: <0ccedc84-d429-4d6f-bd21-7487e6a0fbf9@wanadoo.fr>
Date: Wed, 15 Jan 2025 12:36:13 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com>
 <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
 <CAOoeyxW=k35-bkeqNmhyZwUxjy=g3irTBS5mbXLxqp1Stx-Zfg@mail.gmail.com>
 <6e349f0f-6509-4a3b-bb75-e2381e9205c6@wanadoo.fr>
 <CAOoeyxVST6rEqp65rU6ZgmM-rSkAdeUVM=0nTLZYrqiO4DbQOA@mail.gmail.com>
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
In-Reply-To: <CAOoeyxVST6rEqp65rU6ZgmM-rSkAdeUVM=0nTLZYrqiO4DbQOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 at 11:11, Ming Yu wrote:
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2025年1月14日 週二 下午11:12寫道：
>>
> ...
>>>>> +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
>>>>> +                                       struct can_berr_counter *bec)
>>>>> +{
>>>>> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
>>>>> +       struct nct6694_can_event *evt = priv->rx->event;
>>>>> +       struct nct6694_cmd_header cmd_hd;
>>>>> +       u8 mask = NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
>>>>> +       int ret;
>>>>> +
>>>>> +       guard(mutex)(&priv->lock);
>>>>> +
>>>>> +       cmd_hd = (struct nct6694_cmd_header) {
>>>>> +               .mod = NCT6694_CAN_MOD,
>>>>> +               .cmd = NCT6694_CAN_EVENT,
>>>>> +               .sel = NCT6694_CAN_EVENT_SEL(priv->can_idx, mask),
>>>>> +               .len = cpu_to_le16(sizeof(priv->rx->event))
>>>>> +       };
>>>>> +
>>>>> +       ret = nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
>>>>> +       if (ret < 0)
>>>>> +               return ret;
>>>>
>>>> You are holding the priv->lock mutex before calling
>>>> nct6694_read_msg(). But nct6694_read_msg() then holds the
>>>> nct6694->access_lock mutex. Why do you need a double mutex here? What
>>>> kind of race scenario are you trying to prevent here?
>>>>
>>>
>>> I think priv->lock need to be placed here to prevent priv->rx from
>>> being assigned by other functions, and nct6694->access_lock ensures
>>> that the nct6694_read_msg() transaction is completed.
>>> But in this case, cmd_hd does not need to be in priv->lock's scope.
>>
>> So, the only reason for holding priv->lock is because priv->rx is shared
>> between functions.
>>
>> struct nct6694_can_event is only 8 bytes. And you only need it for the
>> life time of the function so it can simply be declared on the stack:
>>
>>         struct nct6694_can_event evt;
>>
>> and with this, no more need to hold the lock. And the same thing also
>> applies to the other functions.
>>
>> Here, by trying to optimize the memory for only a few bytes, you are
>> getting a huge penalty on the performance by putting locks on all the
>> functions. This is not a good tradeoff.
>>
> 
> Since nct6694_read_msg()/nct6694_write_msg() process URBs via
> usb_bulk_msg(), the transferred data must not be located on the stack.
> For more details about allocating buffers for transmitting data,
> please refer to the link:
> https://lore.kernel.org/linux-can/20241028-observant-gentle-doberman-0a2baa-mkl@pengutronix.de/

Ack, I forgot that you can not use stack memory in usb_bulk_msg().

Then, instead, you can either:

  - do a dynamic memory allocation directly in the function (good for
    when you are outside of the hot path, for example struct
    nct6694_can_setting)

  - and for the other structures which are part of the hot path
    (typically struct nct6694_can_frame) continue to use a dynamically
    allocated buffer stored in your priv but change the type of
    nct6694_can_tx and nct6694_can_rx from union to structures.

And no more overlaps, thus no more need for the mutex.


Yours sincerely,
Vincent Mailhol


