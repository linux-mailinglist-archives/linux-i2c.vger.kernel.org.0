Return-Path: <linux-i2c+bounces-3586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B038C93A9
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 09:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEAB7B20B06
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 07:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF2217582;
	Sun, 19 May 2024 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="O6OwOLue"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046FB666;
	Sun, 19 May 2024 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716102960; cv=none; b=rF2CmOCWg3JnMJ4RVLdd5LMtPUPzy262dB2tKmIkUz4Nh0UHKgbFxMqG06tMvCo1uQmVDrgUPTJuBdDN12PfJdS28dS5EhJLbt0HWo0qwClwMonjH4CCFit4ax9Gryre4deTLIMHs14ewkAL8mdHljrt7u6oaC39S6QIuCt6nLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716102960; c=relaxed/simple;
	bh=3Ib/4jVZX15fK3hvYNLAJEDzsJyGYYDvKxm3yexwV/M=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=dO58ejgtk4GMENwalpis2MtPvyB/FqE5DzDrzYuzbXGRpuEV8+rhIrMO+dz35EH+3DVILrFLlktcRPm+csBMazuTWTia1ye0kWaPxYjXl23Ns4vnhGE4me+QCFS4/ayGYCnYwF2rkOLxJCm73IZFDUNfBwh2+Vzqv/g6FFM7Rc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=O6OwOLue; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716102924; x=1716707724; i=markus.elfring@web.de;
	bh=awBD3TGD+O80uOUmxCjUFbBY5uYZxYKTob1I/UkA+vE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=O6OwOLueNplf1cccVOoDKe+1IWy74wk7u2b2KBJL+76S9QRpUBJPmmZRZlWoT3Sy
	 Dp39K4Zwr2Mj3WAwXLiz6OwEP8sgVZhmOFNAStu0oa6KzCmoqhXiK26g41p4jY3tB
	 FMW6gbMV1gVmaq921lzi0aJ2KJtLxyWBmmc4u041MAxwNwRX3M1RH5Q6IDs08N28M
	 a3d7PLvqWk94gVCNW25vFAzzPHZLyM+UUMOEwZS2FjaT9RLr8Yjc3yLtAhqlYseCa
	 wW4XNr2JwIeYhC2u4Yw4zV+GJh8E5w/mtJTtj0xPBLlx3d59W4/z1u46gSS41041j
	 X52gqx+vItakwwc38g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9LIc-1seOuF3JBM-015Ky5; Sun, 19
 May 2024 09:15:23 +0200
Message-ID: <43f4acb9-4409-4b51-9cb6-543bcf42f0ba@web.de>
Date: Sun, 19 May 2024 09:15:19 +0200
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
X-Provags-ID: V03:K1:NEkB/gm/kIFqYDsQ8gGsUusFhiSrnLq0i2UUuLPVIe+oePa5zTf
 fkVCMhH4sItWIoH/iCPB+hN6FpWGVHAcPkKh82G6vgUD9Jk+guNKQ4BEKH1Avm249Ihhr3P
 Dcx0z+T555vWJCQsByKRjkd9j1VijpPhrZBXd4oqs3lPmrlobaDZdEBo2YQ5BR1Aul0jWye
 t79NiTVhdvkwIknnthtTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A6h29kzZZCU=;scPHcuHdNkNc6ycjFNwFZucbAhY
 MprszvjeRvSwg/FEKzeionPG512gGR6psy9f/yzvvH7DWIGiber5m3EwPhXs3JrkqNYLJGe4A
 1ms8rKNzdCQ7BwZqNLQD0FBHykLpgVqUqBcaLbWCZ0WBfBweg4rqTMBdg3MKf/sWfDVGvIBe6
 9gp4Ev/kLjPwj5+m6VhmfSgMKVz+CDTZjVbwqfXet6gCVbK2YMP6MHJDz2dOsRwaXzWpOTkDX
 Ohe0pZxbrtH35P391zmfXEC5BWfxyjES6IHlbsCrmS5K7gDETbcGMVEOpUvmhGofwOLZzIPDP
 BJ670qzI4gtrMl972fFbchNKJ9Mc2HTL+ZeW/HgIaIOSp3hj1mPxcImQbtdmoJl70W6EF+sus
 HtkSYgUpG9r2j7Fu0xZzYEEu91ozDmMSisS8CPphewaXu6ld999NyGnKJia2iYBksUsZWb/W0
 JwNdNsByuQzaN6/YTNZqNT+Fpzk3sffP3z9ivtwMCwKc+OXxvowQxUjgwjTfrxMR4g+7+pT5T
 oxj10kVao94VNqVyKrNgN5sKyDSIWPp5osh9wEb2nfcFCbbcCwU3ntl1py863QCQfPgaq2Eij
 EnIa+K5QqXtH5s9G24TGflxdSj7771aQ9ycTJ2dnnoXNHUIWNs/HWPrYZxpcGP2XePtxH9XME
 ZPQCwIWyLvHJtxyqWnU/EEaua1iN2ZLKpytT6Pcgf5SCALXQs4UC6W/FJrLxZQ1OQMysh//84
 TIisovgFrB+t66GFLmp9mm09R6bkJJMiu0WvSh4w/91RKFaFUO/j3Rbfvgu5vDB8szLpek0Pz
 o8JUoIa7qfLNAcvTWhEhhTWGvBs6Af68W2s7u951lPgzo=

=E2=80=A6
> +++ b/drivers/a2b/a2b.c
> @@ -0,0 +1,1252 @@
=E2=80=A6
> +#define __a2b_bus_for_each_node(__bus, __node, __i) \
> +	for (__i =3D 0; __i < A2B_MAX_NODES && (__node =3D __bus->nodes[__i]);=
 i++)
=E2=80=A6

I suggest to reconsider the usage of double underscores for identifiers.
How do you think about to avoid that this software depends on undefined be=
haviour?
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

