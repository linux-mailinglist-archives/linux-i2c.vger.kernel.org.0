Return-Path: <linux-i2c+bounces-3613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D43218CA8FA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B31C1F21EAD
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62875028B;
	Tue, 21 May 2024 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GaPj7+s4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C5D4F88A;
	Tue, 21 May 2024 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716276856; cv=none; b=PR5XKMYh+smNqUTJIuZ4N4F7kv4NqWUuQ09n3VeoZIfB0jKEAbg9FAKHcECDnbAtCUBbHz6GuqEiM0QCr/aiXTyi5MnpGGlSIvWwXc79TkNUg8mpGY1to/jOP2kmaiJmKApT/qOql/XtuUcaMD4hbsO64oqzM3Xw4h8tEqusgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716276856; c=relaxed/simple;
	bh=cCUHYwHUUcU73ns+lR3zvunoCAM8T5MxFs0Kcv5o/qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXAi15IwpRR0lfIyrbPnUfjug9+PTy90LxYKWKMhhr9FEEc1YfKs4Fe/6gOKJLHjQVv6XiACQD4iLbuVzKM30IJQ1e1uPwU1T5T9izmRmUO+cHXys3ob9EMMVm+CkniDnd/ii3RGE/gah1pZFbPUu3lLvGTuh2O6Ekuo4PZWtOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GaPj7+s4; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716276833; x=1716881633; i=markus.elfring@web.de;
	bh=zn+hY6AnEP5z1c/lSffS9Qqf6QfYpj29UvfNSHzxSTE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GaPj7+s4Y4soiqVjtQ9sI9CnLMelXN9004f6A3AlWtjQSY3WXWjtX705DUkEwhiT
	 YkGP42UWqPrBuIXZQ8agTJyuzct0dGcK23qsDfFxYadonVcHfqgCNHKpYXRmmgj7r
	 Z4/wiTG60IqfGfkgaDLhu1W3HXXokF7RcgIVIlK9bcZWc2ajhcZ//e+5N/9aTH40E
	 SxO1X6pOKzt+YbbtOb9nguNcWOgGrCrrekM21TLELzO2jMbDNwOviithS7fshy/VQ
	 Boa7J8zI2XZXfpww2iYlTFJuQM00n43P6PzUOmlIZ+nDKdQ1jAWb7t/sYpa6/17N5
	 UDih9Fl8blmRVeuI+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2BMA-1sX3gU3Zxm-013Zxh; Tue, 21
 May 2024 09:33:52 +0200
Message-ID: <7ffeb91e-97b7-4f60-851e-120062b63c17@web.de>
Date: Tue, 21 May 2024 09:33:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] a2b: add A2B driver core
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alvin@pqrs.dk>, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
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
 <feb239b1-7a14-479a-87f2-dcbf9966bffd@web.de>
 <alv4rqrrnjqw3fb5vsw5r4f6lv7ymvuatcqovt7ddxi5ich5on@aan7wybzrzru>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <alv4rqrrnjqw3fb5vsw5r4f6lv7ymvuatcqovt7ddxi5ich5on@aan7wybzrzru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e69jBfqsU7V39J0EAOpZ3TXV931/rCtohLs+eKf1KNp+TNPo7nQ
 GJHnumpYuZbexnCSr5vp0W59q25zc2+d/sOVIopBIR0W6Q+B8qJo7CmtIpggJLkEkqoUZuQ
 aBfBvv2vFZkZzSMQDpskzUiKAs+lEiSx3ScFjRTxjWfH6UmADO/T3plH57Tt9yduDMEuNYL
 tVgMMQiuusWrDzxYSxzTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T4sx1G3BKec=;uaEzddfo7N87U07ND12zqMDiS0H
 SslBAkamtrtzREOt5rDtiUA+8m+GwUYvQJ1Lpe09X0gslOjpIFS3zI5u5+x994mMA2MO1t36O
 xHjUsLL+vIyH+YuOXISvhWmHdxW+A5GZV7JhqnZNSMYjIu4PSmn5OU+yNXC6OrYRPaBkcEWKp
 5XOPYZujcZchs5DVvkO8ce/V7/ogeQ6Na+hnN2V8ArbcY8M1GRxC2SdrvwWa+YRY2uQ+nfUDK
 Yk7Qep4d5kLRY0LJD75Ssh43aP3tFvvKcgwxqsm3KSLja0L2isHcNVjFEf3iwb7Eq4E6QnXUo
 2dEN4XfVtDpH8gtohQh2xqRVyrdq+TXwoHw0vGZOBKRJgBmFPbpaOticmuyW1qLl1Z96ymp07
 xNxRLqGU1ka32jDWYNlUXpbQVq52dtNAgZLS3hzOXLU9UFVjRcgBfzEoke7ui1k0FVFomINJI
 LJOHeQgxCCSlGyVc1oCkenQZx/6EUFZsP0lHAdPerpPxvhloFviSsub1j7lKZburzyKVgZ8ly
 9TzFPQ6ueOwX7gU0Bh73XrfFfwMUN3LTfqNcKfuj1mqe+RB+eFEddAUaRnOBjDBbWD5qnhyea
 T/fjDuEO49tfpTmsEfgOnN13e5cOgR3FNkZ/4Ows0M6PmroK+K0aVw2O6QLg0rc3jM+kz1Cxa
 Fqs4BE4v2ZxUhgPZzemd1gzclXKcdmT+LgkL6d5v1PnaR7nmIj7u7dFc7qy1209S2V439e7TZ
 BQRrTQLQDeEEtK/jjXyiWwbDI41vrgk3dU0MHh0NUR2XCsx46jck7P1VSuokOXVEt2W+aK/cu
 bk1tv4m1DDfrKxGCy5ANcgTKpdMRD/NltPoLsFujTV0A4=

>> =E2=80=A6
>>> +++ b/drivers/a2b/a2b.c
>>> @@ -0,0 +1,1252 @@
>> =E2=80=A6
>>> +static int a2b_bus_of_add_node(struct a2b_bus *bus, struct device_nod=
e *np,
>>> +                            unsigned int addr)
>>> +{
>> =E2=80=A6
>>> +     node =3D kzalloc(sizeof(*node), GFP_KERNEL);
>>> +     if (IS_ERR(node))
>>> +             return -ENOMEM;
>>
>> Please improve the distinction for checks according to the handling of =
error/null pointers.
>
> Right, I think it returns NULL on error.

Do you see possibilities to reduce =E2=80=9Cconfusion=E2=80=9D about the p=
roperties of such a programming interface
any further?
https://elixir.bootlin.com/linux/v6.9.1/A/ident/kzalloc

Regards,
Markus

