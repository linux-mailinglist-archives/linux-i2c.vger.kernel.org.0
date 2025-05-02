Return-Path: <linux-i2c+bounces-10738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C2AA747E
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 16:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 235263BC30C
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 14:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E536255F48;
	Fri,  2 May 2025 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p7ILztUJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295D70830;
	Fri,  2 May 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194957; cv=none; b=SK8QUkYQgBgyB5ZlOAZe80ONbtHR4GZ/EyO7bxd/qpmF1nRuD6tM8ZF3Xdhpv1bfjmwZHxYT9zskOptmqQDk7atqC3apJ7qd1Hzsn2OCq6KAZ8dE5CJ46rp8+NFjJjN4167ENO5BwkgIi9LGlWJjiHiqDAeH80BF8X00QXVysq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194957; c=relaxed/simple;
	bh=x10rJVRO+bobuZENwdtQ9uPUVVMm4D4dXAPYpSKSIiY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0RpHhwN6YJV7eCE2lG/atuRVzcPoP2vpwn7ma5McGKloUAdKAX0PkJ+6rwEKuwsZjJ5QSx1nQX03kP7mEWoY+PFDRdiy/lDRD9dC3FZXDSdbmhihnTWPHE8ElfBrRBFck7/1KVPFd44G54Tcby1YxsQG8yVo475xhFSs7Igl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p7ILztUJ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2353A43930;
	Fri,  2 May 2025 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746194953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFncIClPHZHqPRHwYeVO7dn4vVHyo3SFbQeh1DTCLyA=;
	b=p7ILztUJkSqkTIf9Ci0t06hKjp+n8QXM9kCo6TrS6OTCPxYmC6iIf3D7y4H5H1RmYO3M9E
	9VdcVG7O3VmCeaxm1+v//m13J9WSsxZnPNdAiQBUKwsCSj1yAf3Gh8NixBdYJ1tU+qReBW
	A6cGn2FVE/cA2PKDAilyL+GqsTVmJ5fcTlBQdAMIE2bzIgziUgu/36VVOVG2QGGjECh/LS
	ABodCoR5ZKUzIYeQcPvpfZZOwbR9GFf5fLSDxP1M2HavJmKDHWObRcnVm4D62+NyG7OWXS
	/yYlxAPQ6cEwuGsYGUuegenNepzPVKMU+CTr8eDZ+7YyQDD8fE53txxCxs4+2A==
Date: Fri, 2 May 2025 16:09:10 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Ayush Singh <ayush@beagleboard.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <20250502160910.448f63dd@booty>
In-Reply-To: <20250430152201.209797-2-herve.codina@bootlin.com>
References: <20250430152201.209797-1-herve.codina@bootlin.com>
	<20250430152201.209797-2-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghng
 hdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Herv=C3=A9,

On Wed, 30 Apr 2025 17:22:00 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> An I2C bus can be wired to the connector and allows an add-on board to
> connect additional I2C devices to this bus.
>=20
> Those additional I2C devices could be described as sub-nodes of the I2C
> bus controller node however for hotplug connectors described via device
> tree overlays there is additional level of indirection, which is needed
> to decouple the overlay and the base tree:
>=20
>   --- base device tree ---
>=20
>   i2c1: i2c@abcd0000 {
>       compatible =3D "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus =3D <&i2c_ctrl>;
>       };
>       ...
>   };
>=20
>   i2c5: i2c@cafe0000 {
>       compatible =3D "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus =3D <&i2c-sensors>;
                        ^^^^^^^^^^^

This should be i2c_sensors (with an underscore)...

>       };
>       ...
>   };
>=20
>   connector {
>       i2c_ctrl: i2c-ctrl {
>           i2c-parent =3D <&i2c1>;
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>       };
>=20
>       i2c-sensors {

...and this should have a label:

        i2c-sensors: i2c-sensors {

With those fixed you can add my:

+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

