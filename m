Return-Path: <linux-i2c+bounces-12960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7693EB59110
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8F11BC30C4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2072882BC;
	Tue, 16 Sep 2025 08:43:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534B2877FC;
	Tue, 16 Sep 2025 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.40.174.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012237; cv=none; b=mrAK5zqmFXauHkniSRqf7mHSngdkPHJec0bmfIjolz9qHRXAuaDfzZHT/c0ugACQDgd/tg3qqLk7oCCFPmyudpuWKh23XqSH3ViiZ5w/OxaMX5Rj93+yFxPMl3QkHTBzmXj94LPaiDc1Q+/lq61W4QMAdTqp0mfRy40N0ithQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012237; c=relaxed/simple;
	bh=tNN2w6oUbgeoFS+dJ/Y8HAmpg7VvL+UckeeBe2PjOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOzzjby0Yesg1WExwB+uN9CPWICELQt1rVPoVTp04MTVnZRGaO8Ez/ACc7m9COJsZS3X2N9ORfJ6Vt/MPpBqNPV1/ukK84YMgrA/7UPnUHmM094Bg5ZSDUyhWkBtha3JHuj5o/GkLH0eWK2s4IRNk/GY0bPl9F4D67M6eVk5K0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net; spf=pass smtp.mailfrom=lucaceresoli.net; arc=none smtp.client-ip=89.40.174.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaceresoli.net
Received: from [77.244.183.192] (port=63386 helo=[192.168.178.125])
	by hostingweb31.netsons.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <luca@lucaceresoli.net>)
	id 1uyQSK-0000000G1Vn-2hV2;
	Tue, 16 Sep 2025 09:50:28 +0200
Message-ID: <ffa2a954-d161-45f1-a83f-509148be3b6f@lucaceresoli.net>
Date: Tue, 16 Sep 2025 09:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] i2c: muxes: Add GPIO-detected hotplug I2C
To: Herve Codina <herve.codina@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, luca.ceresoli@bootlin.com
References: <20250915060141.12540-1-clamor95@gmail.com>
 <aMf6DLr8pTCP8tKn@shikoro>
 <CAPVz0n3m9VOV5unVHhU67XQnk4jckA+zyJdCHXu2fFxCSht4JQ@mail.gmail.com>
 <aMgzzqhXeOi5cn3f@ninjato> <20250916081955.2826c6a8@bootlin.com>
Content-Language: it
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20250916081955.2826c6a8@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello,

thanks Wolfram for pulling Herv=C3=A9 and me in.

+Cc my Bootlin e-mail address

Il 16/09/25 08:19, Herve Codina ha scritto:
> Hi Wolfram,
>=20
> On Mon, 15 Sep 2025 17:42:06 +0200
> Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
>=20
>> On Mon, Sep 15, 2025 at 02:53:23PM +0300, Svyatoslav Ryhel wrote:
>>> =D0=BF=D0=BD, 15 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:3=
5 Wolfram Sang
>>> <wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5: =20
>>>>
>>>> On Mon, Sep 15, 2025 at 09:01:36AM +0300, Svyatoslav Ryhel wrote: =20
>>>>> Implement driver for hot-plugged I2C busses, where some devices on
>>>>> a bus are hot-pluggable and their presence is indicated by GPIO lin=
e.
>>>>> This feature is used by the ASUS Transformers family, by the  Micro=
soft
>>>>> Surface RT/2 and maybe more.
>>>>>
>>>>> ASUS Transformers expose i2c line via proprietary 40 pin plug and w=
ire
>>>>> that line through optional dock accessory. Devices in the dock are
>>>>> connected to this i2c line and docks presence is detected by a dedi=
cted
>>>>> GPIO.
>>>>>
>>>>> Micha=C5=82 Miros=C5=82aw (1):
>>>>>   i2c: muxes: Add GPIO-detected hotplug I2C
>>>>>
>>>>> Svyatoslav Ryhel (1):
>>>>>   dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus
>>>>>
>>>>>  .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
>>>>>  drivers/i2c/muxes/Kconfig                     |  11 +
>>>>>  drivers/i2c/muxes/Makefile                    |   1 +
>>>>>  drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++=
++++
>>>>>  4 files changed, 340 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotpl=
ug-gpio.yaml
>>>>>  create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c =20
>>>>
>>>> Adding Herve and Luca to CC because they want to achieve the same wi=
th
>>>> their I2C bus extensions, no? =20
>>
>> Sorry, a misunderstanding: the question was for Herve and Luca. I want=
ed
>> to ask for a comment from them if this is the same problem (which I
>> think it is). The question was not meant for you.
>>
>=20
> Indeed, we try to handle the same use case.
>=20
> The i2c-hotplug-gpio.c driver handles only an connector with an I2C bus=
=2E
>=20
> On our side, we try to have something more generic that can handle more=

> than one I2C and some other busses and resources (gpio, pwm, ...) wired=

> to a connector.
>=20
> To move this i2c-hotplug-gpio to our proposal direction, this should be=
come
> a connector driver with a i2c bus extension and an addon DT describing =
the
> i2c devices available on the addon board.
>=20
> The connector driver should monitor the gpio and apply the addon DT whe=
n it
> detects the addon plugged.
>=20
> Also, I am waiting for conclusions in the export symbols discussion [1]=
 to
> re-spin the i2c bus extension series.

I just have one question to add to what Herv=C3=A9 wrote.

I guess in the big picture you have a device tree where all
hot-pluggable I2C devices are always described, but they won't probe
until i2c_hotplug_activate() adds an adapter for them. Is my
understanding correct?

If correct, this implies you can connect only one type of dock. Multple
dock models with different peripherals cannot be supported.

Best regards,
Luca


