Return-Path: <linux-i2c+bounces-546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07B7FDD8E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 17:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6F31C209A8
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 16:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CEC38FA4;
	Wed, 29 Nov 2023 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WLP04NEX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA90190;
	Wed, 29 Nov 2023 08:47:25 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F84BFF813;
	Wed, 29 Nov 2023 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701276444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkefkReIWzyqiZJSPhEnTXAmzyUb/Ar5C+Xf+28fWzA=;
	b=WLP04NEXoF/EPNmxNPgwLICEHOen2oXanUWKsWRA1iZ/LZ+Qlo2awceFETEXMG1y8IfaUy
	3tTEMg09JL03ejZwL+eEGrpRQ1gyuQzVpW/ZUmxXeIaIKfdLQu/iYafXA0x9a1muGB2ALN
	h/9O6HydnjVKJS9HwOX/87S7q9ZBkgj08miJRdUhTqNiTiIaDoRjOWjCDgJXhKrY/l4x3s
	v8OZKcQP66DmMgpFcaH53QUTu8q3+Ilso0ECJ2fgkKANdrAbIBc0uExmedh6m8fwDfVX9l
	DIzGskzZEn5oMiHPHwEoadfjGwTHhNqey+gjV0KATl+6GmOvQXATEBcw4UWeZg==
Date: Wed, 29 Nov 2023 17:47:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marco Felsch <m.felsch@pengutronix.de>, richard@nod.at, vigneshr@ti.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [RFC PATCH] mtd: devices: add AT24 eeprom support
Message-ID: <20231129174722.7d4e768c@xps-13>
In-Reply-To: <CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
References: <20231127164623.1008176-1-m.felsch@pengutronix.de>
	<CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

brgl@bgdev.pl wrote on Wed, 29 Nov 2023 10:10:28 +0100:

> On Mon, Nov 27, 2023 at 5:46=E2=80=AFPM Marco Felsch <m.felsch@pengutroni=
x.de> wrote:
> > =20
>=20
> [snip]
>=20
> >
> > I dropped the backward compatibility since this is a new driver not
> > having to deal with it. The old and the new driver can not be used by
> > the same kernel config. So it is either using the MTD eeprom driver
> > supporting partitioning and NVMEM or the older one which does not
> > support partitioning but keeps the backward compatibility.
> >
> > Comments and suggestions are very welcome :) =20
>=20
> I skimmed through the code. Nothing obviously wrong. What I would
> suggest - if we're going to have two at24 drivers - is a lot more code
> reuse. I dislike the idea of having basically the same code in two
> places in the kernel and having to fix bugs in both.

Agreed.

> Though if I'm being honest - I would prefer a single driver with
> backwards compatibility. Have you estimated the effort it would take
> to abstract both nvmem and mtd?

Also agreed :-)

Thanks,
Miqu=C3=A8l

