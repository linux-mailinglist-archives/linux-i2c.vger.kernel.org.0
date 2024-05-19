Return-Path: <linux-i2c+bounces-3589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 598898C9464
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 13:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AFB91C20F5A
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 11:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B202A44375;
	Sun, 19 May 2024 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="jf8z4qKk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116D8F4A;
	Sun, 19 May 2024 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716117554; cv=none; b=YQZ/N9uA2nC3vLPUbQIjKzN9u+ELLaU9nTh58yMmj4Ul5QXdnBU4xWgAshVcf5x/77oX0/2qAUl40eK1vzafDRALkGyyzgXiA2xiMr1wd/VatMuYsyJ+Lj4Jdlq8deeFLS6L+ecWdCri4RThsgEWbVANYhn7/a2TZR5BjXRBHVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716117554; c=relaxed/simple;
	bh=o+j9jim2SFTtDeZRdbP+U9RKRjTg/+TlxstRhKWE3qc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RcBIEd0nlF8u6QJrFg24ytLxHON2m1Diwck8qmMC8lN6uGvkQDMJ0vOserDisp4SsTdXuI018D9GO6uLlMG9XLYvZe0ZZKFOMRkuGHTaEiLXpo4ZBS1yENiqideDcV40zSdYupAFFu/9cMCGrSs9nfLztRqYUAJWs5DUSEIrlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=jf8z4qKk; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716117528; x=1716722328; i=markus.elfring@web.de;
	bh=pEfFZ5uWX6iBRbjnHbEDDBB0vDW86TmIDzEPatgkzPY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jf8z4qKktxGMtw2M8TM27RLbM2wxzTwYKljdcCo8pBRMcVsQiVZocuUSDObfVKZ8
	 +JrDmzADJh0tLDAlnw4oVdFbJcZb5tmo32rl3z04fZUrLNLs9L89wYaLpVDGWoaLg
	 LEJejOFHHrpcp0HnWvTyqzbzyAVGJocMgQ1rLRHn+nviUhsP1ImOPiscldHx59UhN
	 fsz7hPgtOK32kEQ5DnnB7HBRGedkQiL5GxxFWLHR/vKjzM7JG7U0RiRLoccC0bEeo
	 zaMSJmb5/3mh9MQWOnt6GiQILnVZ6UOi3ZURnfuhT7O1l9DestRVr9ftzidSwEVIy
	 SeE3Ra7HE1rrcUn5EA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6JxT-1salOr2p0z-016izN; Sun, 19
 May 2024 13:18:48 +0200
Message-ID: <b546e80f-b07e-4c29-a856-1db347939cd6@web.de>
Date: Sun, 19 May 2024 13:18:46 +0200
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
X-Provags-ID: V03:K1:yvTbyO1e5gC/VYcAH6EfxvkQgIRu0/rRhJ/zMPP4ObyXuyBUpBv
 dY/VPRz/E5LRfDODkJldDZJc/mFZYMnQHvwRMZsd1qaL5zsOcRGPB/7Z4WoW8Q7kbKH/lrM
 3wQ5WDZqp0wyznJRVbz+S3qLi1KYiVRpXALLtB1+F2vwmKcxXs/EwhVaVnfZLftxpd5iY7f
 RF5e3LhwMg4nXWoDvrZWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gwN3dc436M0=;tpA+1NgyAhJH44JfOMHYIcQKkMs
 yvG1VOsgPdl8OM6I/LH7KMzMsn+RMzCqJQrWgc4kwp290KfCsPk8MGTuZI4bGQDJ1X+eUWDik
 MFj06ScZLuXHR52QE6Uq39O5FTfxQCc0jRbJXNjoDceXoATj4mgrxhJPsuxI3JnRwRnKbz5XL
 vBspQGFERoDJCVQpheBcUCejnShFm/WQVTqA34eLDDrrr72M190AzAGRqzgP7RntJUm1JXx4W
 5cAJmjfqgMEPZO8mN0IhVljHM4V8yQs0umVqhHmkA5OJ686zu3J/86W4UEM5RUGBVY0fiS4RF
 hN8at8TDqslzV38oRU/FiteLZswtdqJrTju6VJ43+grBxAklJxzMRIH8z71M15csrVWN46Q5x
 b5UKIwfFcLF3fX5gygRtp/4VsRshzZJUfrgf6Y0fX2iZ1xPmGV+vfUsJss4bj/3S2+1wAWIYR
 e6ZIHW7hzMlhmIIpRoRGfBT4TMzoC9rsXbzLz8T8JX/y9nRXTX+leL9Bi6ajI8/5mTmHuc8J3
 YmEgwexnh25oZKo2lDWN4vVvCROcvdgGHDzylu5FmVvQOMHTAk+sTLEkaP0dtQbgmuABPLLb6
 wtJ8j5aIJkG5XnbFO4Y99vPGoPVHj6uzMeGIRpUnEkjt+dhOjIPNQjXFnU1EAoWRnqlAP1j0L
 XDvcQeKL+OOHkanR/XQi7UUUl2fPuyHXLKz8wUeWWI3hTNtUyw/nV6m9JSeqHa+9rxNjyRSdw
 J9JvJfZlhWbQxVgiXtGptB5xlP9Q7/UpZ5R7VEccQLg6AnPLwTXHo9SGhVyFu2RtRhgu8QFmE
 0Yasz/CAB2jLcLkwMhbDkYHi50VAijJuDMihf7PKlFFsQ=

=E2=80=A6
> +++ b/drivers/a2b/a2b.c
> @@ -0,0 +1,1252 @@
=E2=80=A6
> +static int a2b_node_uevent(const struct device *dev,
> +			   struct kobj_uevent_env *env)
> +{
=E2=80=A6
> +		if (add_uevent_var(env, "A2B_NODE_VENDOR=3D%02x", node->vendor))
> +			return -ENOMEM;
=E2=80=A6
> +		if (add_uevent_var(env, "A2B_NODE_VERSION=3D%02x", node->version))
> +			return -ENOMEM;
=E2=80=A6


I suggest to merge three if statements into one in a branch of
this function implementation.

Regards,
Markus

