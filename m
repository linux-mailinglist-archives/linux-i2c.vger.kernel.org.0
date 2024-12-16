Return-Path: <linux-i2c+bounces-8533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3F9F373C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEEF516B7ED
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D55206280;
	Mon, 16 Dec 2024 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="l/TNgXT8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-73.smtpout.orange.fr [193.252.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBF9204F92;
	Mon, 16 Dec 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369343; cv=none; b=sFECxdHkokEQNwY7J8ioQDt4+BcP0pZWOCCOhM3c2x7eCTVEmkUUSQA0VerTqhC7rv5XJ46gl1hF1ovA9L1vr/H+cyxM3SynhWOmr6Ptss76weLhCfPx9fH8ErW3PppxN3DvGdCtevsBvsn31YjoTG167pPDabOtqJ/501bMjL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369343; c=relaxed/simple;
	bh=rPcSRu/xLQ3AacbWw5/6imPXGpyHuzRwRCOsO3qDO1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7+dKsrYGqJkJ4rrVV7USp3lNNHv9UsiSKmzDRFr+l/nsGAnZhq6fc2BQdwgo5yYff7fgaMtz7tT5M3/2OYkSkFy4k4FN9WrAN9Rq9sCFw9JAUR+uS+Z1SjwZLSgyRQCknQPBkDRG+OaOI/0nZEGyWT11pxvRtPaaCm7gflXPjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=l/TNgXT8; arc=none smtp.client-ip=193.252.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id NEfTt1ynneZBxNEfetJacV; Mon, 16 Dec 2024 18:14:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734369265;
	bh=ta+/XtD45kiERjaQDCMe+l1Wgsriuw2kZwoHtywgXTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=l/TNgXT8UxJn7zsGoLq3KvwVaLXQarxWaXKYl3SG4WTEiPGu1wXmr0vQYRJxfk9+7
	 ngXLjIRgIyLOOekIT3Qv1YTx3r/I9x8UyhlNQ611mtSrenxitt1R3ofhihCKauB5qC
	 NklyoxNGTWK+g+hKREE7iv5BBH8/bTMQt+McngQrBWADIkRhfgo+C3ceWQfOGt4KQB
	 zNTTA/D7/YJbV1ESVU8FxRrt2xDLc//6G7aszsPTojyKRZvq7eQMfwkD+4/PYD86dW
	 oqavapDqKggTkL4YZ1+B8Dv1pQSGOeKIk0gd0WxHgdNJmt7ZOqlN0bL5kt2EbG587N
	 Gs0tZOw6DLcew==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Dec 2024 18:14:25 +0100
X-ME-IP: 124.33.176.97
Message-ID: <8d66cf66-5564-4272-8c3e-51b715c3d785@wanadoo.fr>
Date: Tue, 17 Dec 2024 02:14:02 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-5-tmyu0@nuvoton.com>
 <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de>
 <CAMZ6RqLMyW6HfTGEOHm7B8rr6=hvuxMEWfEEhxv5Nw7fgpM=WA@mail.gmail.com>
 <CAOoeyxVoqtLPceHxH=eV=QfYuh9E0QEQKaMjdB4dyk9V_JarXQ@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
In-Reply-To: <CAOoeyxVoqtLPceHxH=eV=QfYuh9E0QEQKaMjdB4dyk9V_JarXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2024 at 15:58, Ming Yu wrote:
> Dear Vincent,
> 
> Thank you for your comments,
> 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2024年12月11日 週三 下午11:25寫道：

(...)

>>>> +     cf->len = xmit->dlc;
>>>
>>> what does xmit->dlc contain? The DLC or the length?
>>
>> +1
>>
>> Also, do not trust the device data. Even if SPI attacks are less
>> common, make sure to sanitize this length.
>>
>>   cf->len = canfd_sanitize_len(xmit->dlc);
>>
>> Or
>>
>>   cf->len = canfd_sanitize_len(xmit->dlc);
>>
>> if xmit->dlc is in fact a DLC.
>>
> 
> Excuse me, the xmit->dlc is actual data length.
> Does it need to be fixed?

Yes, name is xmit->len. DLC has a different meaning.


Yours sincerely,
Vincent Mailhol


