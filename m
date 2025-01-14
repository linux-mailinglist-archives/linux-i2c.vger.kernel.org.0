Return-Path: <linux-i2c+bounces-9088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE2A10A6C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 16:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 778DE1638DA
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 15:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4006615ECD7;
	Tue, 14 Jan 2025 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Dq3OjX15"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF40523244D;
	Tue, 14 Jan 2025 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867531; cv=none; b=X8fHUOUbWPtLTbbSZdPohB1HuWHgEjtFQy3eeau3sXE9puXJTffrYfCNov+L8k6vSStnqWb0rvQtmmFih9L2KldTjGjpdoAt9eJ/2GSqLFUwqz2NbpjMfMzMdDdtL4bGeHLhdBqdi5OwBu9G6/uyLC2pYTle8NWdoa3KbbrUBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867531; c=relaxed/simple;
	bh=DL8gwF1GJ20n33ml1FHEg/aAAglXZ3TF9OFCcZ0ipiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7tXeACVQIsxbLJWHS+B8MIRwMqcTXe/0OQIhHCt243V5kovoJAd6urQxLR8C2nu2sQZaA7qcTcRSd65Vb1m9uWj4cYUvMVC0bC/yfEUiJtfm8et5CtOgUZaqnUHsv2KrThI0XfSX9mnaTN9ez10xD/bb5+QdrvorSd8NKmvxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Dq3OjX15; arc=none smtp.client-ip=193.252.22.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id XiZytlY9xyfdlXia3tQ2B1; Tue, 14 Jan 2025 16:11:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736867519;
	bh=XV4Id1xvYHlaSYqAm96ChNINwUN4AO6c7LrvEBY8Mp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Dq3OjX15koJsiFaPGJLMkr02s81/arOSIzSYmgnER7lakEeU8cyCDas42c5HdzPY/
	 rtU5LMqs+bYPOYqAV7IFYKn9+JamBu8kD18TyYPEwZkmIszlDF5cQ5vQf4R/rv4kwD
	 vb0jr8Hq7oB2aH0ZobATJjChAg69ptArkMXzbqk8F+A2qVdSQBnTlyylL+dEf9dBSG
	 QVNFHAQ5klUnx/5p8OSiqTnxmkhXW+q9SooGiQEd30YcNb3/Oru9AeNc8xRvCv2NZb
	 Gz4hFOD0eu2DbzgtBIWV4Xwk/Xt3nlEipG7y0KH/9b8+7eUZSemzie93loGr+DV/Cb
	 JJXOMvikfVx1w==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jan 2025 16:11:59 +0100
X-ME-IP: 124.33.176.97
Message-ID: <6e349f0f-6509-4a3b-bb75-e2381e9205c6@wanadoo.fr>
Date: Wed, 15 Jan 2025 00:11:41 +0900
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
In-Reply-To: <CAOoeyxW=k35-bkeqNmhyZwUxjy=g3irTBS5mbXLxqp1Stx-Zfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 at 19:46, Ming Yu wrote:
> Dear Vincent,
> 
> Thank you for your reply,
> I'll add comments to describe these locks in the next patch,
> 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2025年1月14日 週二 下午4:06寫道：

(...)

>>> +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
>>> +                                       struct can_berr_counter *bec)
>>> +{
>>> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
>>> +       struct nct6694_can_event *evt = priv->rx->event;
>>> +       struct nct6694_cmd_header cmd_hd;
>>> +       u8 mask = NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
>>> +       int ret;
>>> +
>>> +       guard(mutex)(&priv->lock);
>>> +
>>> +       cmd_hd = (struct nct6694_cmd_header) {
>>> +               .mod = NCT6694_CAN_MOD,
>>> +               .cmd = NCT6694_CAN_EVENT,
>>> +               .sel = NCT6694_CAN_EVENT_SEL(priv->can_idx, mask),
>>> +               .len = cpu_to_le16(sizeof(priv->rx->event))
>>> +       };
>>> +
>>> +       ret = nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
>>> +       if (ret < 0)
>>> +               return ret;
>>
>> You are holding the priv->lock mutex before calling
>> nct6694_read_msg(). But nct6694_read_msg() then holds the
>> nct6694->access_lock mutex. Why do you need a double mutex here? What
>> kind of race scenario are you trying to prevent here?
>>
> 
> I think priv->lock need to be placed here to prevent priv->rx from
> being assigned by other functions, and nct6694->access_lock ensures
> that the nct6694_read_msg() transaction is completed.
> But in this case, cmd_hd does not need to be in priv->lock's scope.

So, the only reason for holding priv->lock is because priv->rx is shared
between functions.

struct nct6694_can_event is only 8 bytes. And you only need it for the
life time of the function so it can simply be declared on the stack:

  	struct nct6694_can_event evt;

and with this, no more need to hold the lock. And the same thing also
applies to the other functions.

Here, by trying to optimize the memory for only a few bytes, you are
getting a huge penalty on the performance by putting locks on all the
functions. This is not a good tradeoff.

>>> +       bec->rxerr = evt[priv->can_idx].rec;
>>> +       bec->txerr = evt[priv->can_idx].tec;
>>> +
>>> +       return 0;
>>> +}


Yours sincerely,
Vincent Mailhol


