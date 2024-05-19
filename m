Return-Path: <linux-i2c+bounces-3588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAF8C940C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 10:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCDAE1F21516
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 08:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13F7383A5;
	Sun, 19 May 2024 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FdK/25nw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987842D627;
	Sun, 19 May 2024 08:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716107950; cv=none; b=lYqgudnHWw8ZVMZRoryUR2ghW3swyMHTexk7HxWauQ5D4DFqlHaAsVESjkcdhMYYDOyBUtRVoGeSKHo5dTp5qadNPTk1YUtAXT0y65fFXnqrvToZce+4igz1UdD5dlTf2TthbsIMmrHSwDOfZUniEAd1VULANqFao4vWTQkEw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716107950; c=relaxed/simple;
	bh=OG/tFUAqoYY73IiNQhTa9yMsYkxiqOkEshKJYuZoq3E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ikDKBhXnkou23IiaKEXu3kFSLtkDllY6oZtqACwCFd8o6IIZU7NyXeTCcDu/8s1VjnnG1M6iQBzNDJgCCm4O7E+nJ4bJLZZJG2Ac6ZoasMeBOaE3rv+GSLmpXG12UPZuc5KyV3RLhqPlmFL3XD6SBj4XL2E4mv2UoS2S+NrFj+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FdK/25nw; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716107907; x=1716712707; i=markus.elfring@web.de;
	bh=mR4LJmey+5na5DaqpNGAQY1Gu3MobXSjLTQaXj5651M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FdK/25nwCvjaX13KoqZoWlurT3IZ9dAoxgkegtddMSWYTyAPkUk7x//SUGcen6Lb
	 s6lgMZRQ8N6FaKKD6uk1R9VCJgUPa/l8vtZtZwPLaUXeJrWHlfRBlyLLdQrpiIjTd
	 A4ZYzrucF+hkGpCIeLbR7TlEf/yNBZrtfsLa5Kw4SsS+oQfas+HawLjpgNz8ujnqE
	 bwBPuhN6ZfA0v+0AudY3+DwEW+AVkwJajuVlhG2lt6Z2eGpqC9G91CZet+MIZatf2
	 9NSWHmrjARBt97meKlK41stWWv7GQ4ogCtBAm0McHaWwNeaGIY4B8LIo6wAIbq2b+
	 LAPqqw2Ol9zpphyoMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvbiu-1sRnL32Qh4-014m8l; Sun, 19
 May 2024 10:38:27 +0200
Message-ID: <feb239b1-7a14-479a-87f2-dcbf9966bffd@web.de>
Date: Sun, 19 May 2024 10:38:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alvin@pqrs.dk>, Emil Svendsen <emas@bang-olufsen.dk>,
 Andi Shyti <andi.shyti@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
Subject: Re: [PATCH 01/13] a2b: add A2B driver core
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+6aU5u5VKwcLLXESSCJnF8xsuqpIE4g1lYcdN79aqgrSALLuexV
 j6Q5oFkmlN/KYjYzP7dplTs7qHuPeGQBbm7zkFL+9Z4rnhJxax6j5KVSpVitC/FZHwjfI6l
 wsh3pVpgGGnuOcIIaXbKVrvGQjEOd5kMwOUDKKiRSzPTKMfDZftdiap5yCPTMTfvbN7ViNr
 svwuIKbYz8wHYMxbZ8QIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QPkp+V2A4MU=;+NWHWxpxk3xHAm8+4xiGSlOB4tM
 7WPwNZ9QuFxh0hJOGJNhkSGyMMS7iLRiBpNtAa8RNVGKSWNjJnv0aOIh9OrKciin8e6nRal/x
 Y1rOFQSpzVYl09hmuxnBO1eEK+wVx7Q7AXUZcyDXTHfKkiCThEv6+UcTG1sUjSOd4ub3vlyXh
 FmmPjsCqAjOPVjUaDzKkW4jc6Or8tT/6KoCSiaz3sdhFJcvDjlNeFOXHumT5TS2/2VgxyiZXF
 ejk6XR6qR5zHIRH4INdUXWMOJ1bBnEGD7AhjF/rkC5o6X2YjWdGzyfQs8bxgJQYmO6X8SyR9A
 vVNTWqRhVgkF5ghyKYp0uzLFBZISOZgQii/ThBxWv8NR1ZW6kW6PIIsBOFWtJNG15xnYNDjeR
 JCHfzHFpQSI6qHbytEA4IDRoPpOPildfBP/WXHiSIyhwRElDJ2iE0n5JKxlizz7P4MeM0WyWz
 OPXGlbh3TIOKMEyuNJCOdjO2c/H6mD+n/dV2F572A/Xvz7SodLy/YgYK6R3wqHzQvronbEJTx
 U5IXnAG4bAer+UfbUOWGa9FdD9MaxySPKbh61outhJubVL4svBXdSumGrjysEtyBZD3CF6gvW
 1J6cTLwG0ULEe4FqtrmQA6reQNdQs4gznoZPnWr/rM0b1FkxEDQR7i/9lNltW/VejKorZrVcm
 WYtLC/PKJDhdpCKlqRFL9civ5Q6ltwAMxULKgZKkSz0NS8Jb6ZpUszJI+LUDYNr47/M2IWTDQ
 4yquGs5L1GMJNWX5LvjnYkiJzrphbcGksTV41Y39NhlQMgkQKW+TW8mj5nFLPY/Ng8kLUZgTo
 +MfcBALkcdpdpW8z1HQaEnIkoImLtRzo1Fsd4A1kkJPxE=

=E2=80=A6
> +++ b/drivers/a2b/a2b.c
> @@ -0,0 +1,1252 @@
=E2=80=A6
> +static int a2b_bus_of_add_node(struct a2b_bus *bus, struct device_node =
*np,
> +			       unsigned int addr)
> +{
=E2=80=A6
> +	node =3D kzalloc(sizeof(*node), GFP_KERNEL);
> +	if (IS_ERR(node))
> +		return -ENOMEM;

Please improve the distinction for checks according to the handling of err=
or/null pointers.


=E2=80=A6
> +	ret =3D device_register(&node->dev);
> +	if (ret)
> +		goto err_put_device;
> +
> +	return 0;
> +
> +err_put_device:
> +	put_device(&node->dev);
> +
> +	return ret;
> +}

Did you overlook to release the node memory after a failed function call
at such a source code place?

Regards,
Markus

