Return-Path: <linux-i2c+bounces-9638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D7A495D2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 10:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E6E163B80
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 09:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC088257AEC;
	Fri, 28 Feb 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="QKaDaYyR";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="wV3eEW2t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D21F9416;
	Fri, 28 Feb 2025 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736191; cv=pass; b=mfNcdJ+eA+IC/lmIHFCr6al5DovTo9f4mbCWsBhjWVLCc95DNoKkqpL9XUDHuRgL4h8+cE0DPXnM+KQzj85IJmZYA8lTN7K9mYlONGVjfXFtCIUGAYr/Ou20RHb9P+bsvHMZBciThIe/KwcSnkfS4OoEG6mD/OkvkmrsD/39Rsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736191; c=relaxed/simple;
	bh=VYGAI3rv8ysclVl7aBNvJn+D75Mvc5tRYEQHog/yWUs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HwEqcJdS5h1xvKOxSbtLCwLD54ywiYGwtdrT7NGwYDCayrbwlQztCpOjvPFfwRPuX0dSxYs9P5ioWqKwH4daKJXRjYli/Lq1VXsuXKH2dUWXXbXQU0xQKXBofG8yvRtM0p8GFz89Tr5QgZiocu12GWuXH0qDUT0YgZfKemmuGqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=QKaDaYyR; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=wV3eEW2t; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740736169; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MoUDHBCqtSFYwuQ9e0LiSC/g2V3goZtdS45GBI8g6wFXWskbQxb82c1Aazw4huB3DU
    SyVQCNgrXK7kNHtQHxwaioPHqESnflJo/B1GqfBc3s0WydAETZuHFKZ4ktNm/G1A3jKB
    /9Jxsde5pxzRZ6n3w/VP0NjYfcpsAp0FJve7/QQnv/f2RcKXQ+F/JYE9KYuMqvoff1xS
    G17u/H1NTrstN5I8Cjn+3HpGmRvujeW05X9xsVSLRzX9PvxUmnYtmItZ5E5J3rrvAXVc
    qz85CwV5OYH6BR1CtCUGwLilJjHXdsb4WeUqmWR7/QbK6mNBO6naGOnsifhvlTNGoik4
    rNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740736169;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VYGAI3rv8ysclVl7aBNvJn+D75Mvc5tRYEQHog/yWUs=;
    b=c1W4Dk9Ng7xrwmvP5Mlyd8aB60hYEmkXYpPTO3hCQSbzjYSGuUEottCLeS0IwhRuZG
    0/obPRt8rh1nCK6Wr/lxhtNlVzTHFOWTIt7zzA/oFKJHh0gIdqYFzeaETPxn2SwkiJai
    GVp3L1ljaJHhVJgQho5IREM4qanDAOKid9oSDwjc18bNr1zuEv7+4+0tSacpwxjTsL1P
    J1KLBUPdo8x05cPrqZJv03qFEThfop/yJvHsoRZ9WKEiwmemjG8Zda5vXvbVJHfZndys
    LAF03I+3h3Aox/gT168ztW4Wa8QcejSgPRJ094j98sjEqc3j/7qp93Gk8TvvAcJA2up5
    Klng==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740736169;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VYGAI3rv8ysclVl7aBNvJn+D75Mvc5tRYEQHog/yWUs=;
    b=QKaDaYyRlqG49ZVDPa96Lm2LFSGCSrbSpA7ZsfXEP+T3JTbP9NwAfMCpbEkiNgKtdS
    glW/+RNe0gdvsw5IzXzmYDylNfq4AP8x8LWgd+V3ufiJOlsxaXim1U844pCKzekEM3r5
    lWElZ2y07TJkHaTItoxv+999mdRZ1PEbOz3cUF/lzBVkDsge9Qp85pT8XwOxJXFSQUXZ
    A6IWri/q6uaahnb3kmCgqjSF7d1t+DcDUlDMLwjAlzkCzjh1SCIQ1kCbQ5GEPDluL0E1
    Oftth+0qQs5JJ/lKDBLzL0fqt+JNEQgNvzGBCOEpheHgCOw3Z6vyI7NUI8ak1P5MFhss
    iBDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740736169;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VYGAI3rv8ysclVl7aBNvJn+D75Mvc5tRYEQHog/yWUs=;
    b=wV3eEW2tPjNrAhtKFZGuAFjsyCV9y6LUgNADBooLbAiqtEDd8Hjb5mNeryHcc3rPlp
    VnaxogI2u01Ks4MY4DBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11S9nSGy3
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 28 Feb 2025 10:49:28 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20250227224738.6d7ebd8e@akair>
Date: Fri, 28 Feb 2025 10:49:18 +0100
Cc: Nishanth Menon <nm@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Reid Tonking <reidt@ti.com>,
 wsa@kernel.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <137529D7-D8A6-458B-9658-2998F31239FD@goldelico.com>
References: <20250207185435.751878-1-andreas@kemnade.info>
 <c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
 <20250220100745.05c0eff8@akair> <20250227142055.ndzavzysaenoducj@murky>
 <20250227224738.6d7ebd8e@akair>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Andreas,

> Am 27.02.2025 um 22:47 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> For reference, the sensor involved was the BMG160. Because it is not
> enabled in omap2plus_defconfig, the issue did not show up early.
> =46rom my understanding, that there is a NACK after the reset command
> data byte is sent. @Nikolaus: are there any nice and simple test =
points
> for a scope?

According to schematics [1] you can either tap the I2C bus at the camera =
connector
(pins 3 and 5) or R206 and R207.

For the camera connector you would need a flex cable that fits the =
SD-52437-2471
connector.

The resistors are located near the pogo pin connector for the right =
speaker (all
are near the antenna connector). If you need a photo please let me know.
It would be better to solder tiny wires...

BR,
Nikolaus

[1]: https://projects.goldelico.com/p/gta04-main/downloads/48/


