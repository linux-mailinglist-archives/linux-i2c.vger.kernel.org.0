Return-Path: <linux-i2c+bounces-3603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C99778CA0F7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 19:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 563E6B2119B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 17:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A832713775A;
	Mon, 20 May 2024 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wkaxZbFQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5111184;
	Mon, 20 May 2024 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716224427; cv=none; b=V5/k03ZZtbcun33VOLx96ULAYizCou6jiTKo4KuMuHi+u+0bpQMkWLqOLdrMkzv/g8jm48jcR+dQKlDnSuhOo8mB4PU4EMm9ajl3sH1aBAELEq6/YH6qi0YWXArm080qYhq/dPGJhNX2idUNlMrYd+WQ9AVg3wSDoDqPVyGYsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716224427; c=relaxed/simple;
	bh=w6g49xcGEthjVP0dxErZ8gbHgtAup/lb9gSSJAEdNNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2dllvDZi/VtKAz/1tTw5GoijtxO9uQOgv47VLHDFIZ4s3i+Lh5a6bxDm+IB6l83aaQQPiWUwWamEMp2uJwJsfLyqSFlvzEzy4suZvxnMtyN03oNSE9MQuRTgqN/C55TQ2XCsb85EsSM6hlL5G8HkwdFEP33UAg1ptsGXj41OtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wkaxZbFQ; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716224410; x=1716829210; i=markus.elfring@web.de;
	bh=w6g49xcGEthjVP0dxErZ8gbHgtAup/lb9gSSJAEdNNI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wkaxZbFQiTHULWpXJK1diJvTBB7F1H9GGL2xWIeZrUS9IqLqIElEvhvo8kR6BPZY
	 uqtRw90ynSHGYzPZJ+WAn3OdJKagfVlMZRxNrlGsN2nxIvmsYkXLh29xy051uWLzf
	 NdVnCnMzlvjeIg6HnickKlmwUsWRSd2lwKmL2Wg2DdDD0rgnE8Nn52z+wFGnQu53H
	 +Oe7O0JpS6hGlKDaNV8m6TPuixUzsCNkfrl8Rjr26YRjvpq8qQyJr/9yagYPxbg9z
	 z28Synx2Y7fWVBMeVkN9aZlCYPbaxIdg2li80FbIUt1sjOkxH8X5oHZmlB/bsksoj
	 OyyXdUQpMMQH0mG9cQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mho04-1smZuk0Gki-00dbB7; Mon, 20
 May 2024 19:00:10 +0200
Message-ID: <e98f8e4c-bd1f-43d8-aea9-52ea45c0d5c2@web.de>
Date: Mon, 20 May 2024 19:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: ocores: set IACK bit after core is enabled
To: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>,
 bsp-development.geo@leica-geosystems.com, linux-i2c@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Peter Korsgaard <peter@korsgaard.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Grygorii Tertychnyi <grembeter@gmail.com>
References: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0DR43tciFBEsUrfkqLfVrYfuElTHRWtQCtsVo1muoNj/g5bQoma
 wm429Yrg6vVaTnf+xg4/QcM2XWJZhMYUUKEqzwaoKXtsFYJRiFH7J2gkDVvTUW/vA45pdjN
 9Lcf80zpFAiZHJHtia0CwKfca61k3d3H2a0sCl3v85o2fvB7s1i1PIqIkarri1QJ4T4tSXQ
 Uo6KPbPbPcZYpcdqbTfLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f/r08ZsaOiM=;ROj7G7ROQF9zvjZekoF1tDas+zA
 yl9YZS88I+Qhxkgv8YNJlGWs/D9I/DdRiPtTsxh633PdQtcge0zWSiWForzqIXtEIBk2BI75z
 yFEzQCEbZy5cy0ugtwPaGr6iPakdSodNgW73TG7O2t03DjwTZaGG8TJ+9eZp7jDacZ48EX3fV
 ufEDeVriu0FXCK8mKYmAOred60Vy6szKAlPNb+rrLncyTmPwmTPlw9m3Nnbw3GnDogeki93IH
 4ZCpLA4/Lf81AstVias/sov1UjHnWZnvzaTBsqFuHg22AlHpVopcUCtGrSDVQs705gsxikyOj
 Mz20YnHLl4/EgrCRSkDaxsf4y9IiuYmHk64DSAs3DNQXbWlfkUynHyQyUqImPqgp53u/qSLFV
 RGPbpdBwQXpF693McSld0UGIV3SB/zU4lwNIyWewCx3UyuVDoWomV8efCPGZiQqaSWqGXzIdp
 1jblEdci+/lu2kI7gCo/dCBnAtG0CC4AyB9wycIdIYXv7bVnIGdBVpAESzKmZCN9qA8knaxXm
 Of0VOLRJ88tMwX9M4orbSjkOVaJgd2KUjRjnu77fIKuVws2X0rDLE0SEVs+ibBZKyAi18XxIB
 oMg0DHImU4a4KWf88AdzgLDe8YIJOObNpZysflc9L3/4iI/dbkb+W51/jf5rsKwJnw9tgxdmL
 EkJLNwH4Pg4DITSdsjuFMLsyOsoFEIcEf17MTXsfkyT+PLP/j2WUfiYeGTsrL1gVNTAA9Fe9C
 V32111B6Mbirsy3lJx6qZ8bn676QltJ4okvEcP8dAWeoR+z6kj2t44UPC8KHLLyV/D/j+qk7y
 o06Kx3ERaUyKBDcFnG6Htj8MMlsgmg6U+MWpQQJXkjADg=

=E2=80=A6
> Sometimes it causes failure for the very first message transfer, =E2=80=
=A6

Would it be helpful to mention the term =E2=80=9Cdata corruption=E2=80=9D =
here?
https://lore.kernel.org/lkml/CAGFuAuwot_7+R=3DJ4NC=3D0Z_48YZ-RTJjRUoQnSjZU=
vpt=3DAWF39Q@mail.gmail.com/
https://lkml.org/lkml/2024/5/20/549


> Fixes: 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C =
controller")

Will the text =E2=80=9C[PATCH] =E2=80=9D be omitted from this tag for the =
final commit?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9#n145

Regards,
Markus

