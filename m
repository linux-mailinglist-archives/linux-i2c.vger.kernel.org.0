Return-Path: <linux-i2c+bounces-9321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45430A2A6C2
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 12:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51A977A18F1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA31F227B87;
	Thu,  6 Feb 2025 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="qNLgkufj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D222654E;
	Thu,  6 Feb 2025 11:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738839958; cv=none; b=e0vUqUWQszlwy6vZdH21B1htS+EQO7k8oiSVZSmOmyqSmnkP2OQoIlqVfxQ9GeOK5RluOd6aP8u+alXjp7OcbVSH0t4YxS1GZxgFkw3++l8mGMP9TO15OEdLWIVebnXfvrqazUNM2i1bmHZN7Wd37+JX04oBIwgR6/ayHKAF0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738839958; c=relaxed/simple;
	bh=NZsOj5Fcsv03IXvzItAxk4Olrw8rpbCtglB2caFfCIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZyhX5m6wNdpgsmcY4OYdNzJaI/fF/UBOMYeasdPHIfIpRIoeO/GYgUiBCP5S2/0ptGQ3OZFhY7vpGJniLnCDqY7c5jl79knp9a+Xm/WWhEBuy1bZuLmBDrzfYgChdNoF0ZYNedRg8epz0xk47nGemIJjU84uPimYF5KVA/2xlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=qNLgkufj; arc=none smtp.client-ip=193.252.22.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id fzhHthr0k30iWfzhMtk9fv; Thu, 06 Feb 2025 12:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738839947;
	bh=Yeb+V8hfoEsFwMLqNg9Wg1OhP0aaKTe+CyROomT+Lmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=qNLgkufjqmHggIua4wEQscAknB0Bb5SfXuOm7Bs/vYLRNWR8yO/VNUWP3SPRmM6gq
	 4wrfKATaLE8LMHmq3nq2TuHuMeWnMHXZ+t8JNx/SJJN+zm8uxJGCVYUpupgg7yAO5U
	 F9vjBSpEfYK3B1jhEaUU2zBfFb13kT35rwh+8/dGfu1/INunadRiiKSdqdd2C56h0w
	 PgIwBC7R9sDlKzXlzp3NF7JMxFrk388p7VUyy5uNhg/ggzHHu2RsQR5M+GxXngebNG
	 9DwlMWPW8EX826d75Nob3mFdfW8mC4u7atqjOB5+Y64DzxzxKc/iwNT0kIw82ZnrP/
	 h46fbam00CLhw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Feb 2025 12:05:47 +0100
X-ME-IP: 124.33.176.97
Message-ID: <c255fe16-da67-42ff-86f3-89c1ac683c60@wanadoo.fr>
Date: Thu, 6 Feb 2025 20:05:26 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-5-a0282524688@gmail.com>
 <fc927b75-5862-4ead-a355-a40c27d8307b@wanadoo.fr>
 <CAOoeyxWivAZmZPe92+_LrL-HvMn7Lqs7M4B__JULKqHeJMTioA@mail.gmail.com>
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
In-Reply-To: <CAOoeyxWivAZmZPe92+_LrL-HvMn7Lqs7M4B__JULKqHeJMTioA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/02/2025 at 12:24, Ming Yu wrote:
> Dear Vincent,
> 
> Thank you for reviewing,
> I will address the issues you mentioned in the next patch.
> 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2025年1月26日 週日 下午4:47寫道：
>>
> ...
>>> +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
>>> +{
>>> +     struct nct6694_can_information *info;
>>> +     struct nct6694_cmd_header cmd_hd = {
>>
>> If the variable only has constant initializer, make it static const:
>>
>>         static const struct nct6694_cmd_header cmd_hd = {
>>
>> Apply this at other locations in your different modules.
>>
>>> +             .mod = NCT6694_CAN_MOD,
>>> +             .cmd = NCT6694_CAN_INFORMATION,
>>> +             .sel = NCT6694_CAN_INFORMATION_SEL,
>>> +             .len = cpu_to_le16(sizeof(*info))
>>> +     };
>>> +     int ret, can_clk;
>>> +
>>> +     info = kzalloc(sizeof(*info), GFP_KERNEL);
>>> +     if (!info)
>>> +             return -ENOMEM;
>>> +
> 
> Excuse me, I would like to confirm, if the variable is constant
> initializer, should the declaration be written as:
> static const struct nct6694_cmd_header cmd_hd = {
>     .mod = NCT6694_CAN_MOD,
>     .cmd = NCT6694_CAN_INFORMATION,
>     .sel = NCT6694_CAN_INFORMATION_SEL,
>     .len = cpu_to_le16(sizeof(struct nct6694_can_information))
> };
> instead of:
> static const struct nct6694_cmd_header cmd_hd = {
>     .mod = NCT6694_CAN_MOD,
>     .cmd = NCT6694_CAN_INFORMATION,
>     .sel = NCT6694_CAN_INFORMATION_SEL,
>     .len = cpu_to_le16(sizeof(*info))
> };
> , correct?

The sizeof() keyword returns a integer constant expression even if
applied on to a variable (unless that variable is a variable length
array, but these are banned in the kernel anyway). This is because only
the type of the variable matters, and that is known at compile time.

So, cpu_to_le16(sizeof(*info)) should work fine. Or are you getting any
error?

> In addition, does this mean that the parameter in nct6694_read_msg()
> and nct6694_write_msg() should be changed to const struct
> nct6694_cmd_header *cmd_hd?

Yes!


Yours sincerely,
Vincent Mailhol


