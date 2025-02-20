Return-Path: <linux-i2c+bounces-9510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A96A3D989
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 13:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9F4E189B1AD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 12:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D9D1F55E0;
	Thu, 20 Feb 2025 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WNroNV/I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69D1F463D
	for <linux-i2c@vger.kernel.org>; Thu, 20 Feb 2025 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053356; cv=none; b=ho6cHATugk08t+Mmt7CGDUGuYQBZ6Dm91Lh86Ap9cd6dwbkj918vlwVovuqsl/XbkTVReRaFbZJuUpFdBSsKEwLJxcgd4srR24+jK/AEJUn01TgJD16yNJ8rrrniKDyxjHsuO5Vuxpzrj0a0SGHG4AWwJYp/KkwTcuj8dJh8248=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053356; c=relaxed/simple;
	bh=nEqX40Vz37NkqVIbEDIzHqGr0r4DVftlsWBRF0o0+UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmE5tq1UMNow7BiyyGUpfwb1Wshg8CJXX2SMa+88VHTlzdo7H8vBve7zDDoGW16ghgayWVppAAOVQzhdqcrd2gvDCyQAtJnqFKEv2AfqEUNnzmnEyjW1rP6lEAD9G4OiwmsZF9wzT6XXkJ2fy/rjdgzcW2eQrwVzSfdYcaNrxKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WNroNV/I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KXV4
	3S9mj4NgNoGj3IR9BRAKkRD0sIscVF1giSweZlE=; b=WNroNV/IqrF2zznyuPV/
	8htDw93MO2tnXsQG52pOE8irAXu9D1vIUuEClRDkkofeLdzk6o837W0GMNnwpdGW
	x7xwMygJ/8f8k7xt7mxlhnCpFdxAFYLHXugEkrZ2+sOm/1r61jfHnAFpeI8/0ojW
	QdX5iEfhZUXl6gf0LRZWTSSXMTuO7dnlD1DV1qoGmAFqThPqpeHqWsJ0Bj1HLoMK
	K8KLDT7PUQ4rIUBYXctYNKFJ9wGBQtvlHSp73vSJQB2w5sZ1ieIAx8SVt1bJPrdW
	DmqJfc1OpfiYqib2cjGPt0GV3JmnFghGMSWDI4TpWnv4AHL031x0eXfxqUiPaNHF
	SA==
Received: (qmail 885305 invoked from network); 20 Feb 2025 13:09:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Feb 2025 13:09:04 +0100
X-UD-Smtp-Session: l3s3148p1@HhtzvZEuCpkujnvP
Date: Thu, 20 Feb 2025 13:09:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 9/9] misc: add FPC202 dual port controller driver
Message-ID: <Z7cbX5jX3NL4C2GR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
 <20250204-fpc202-v7-9-78b4b8a35cf1@bootlin.com>
 <2025022038-hangnail-rehab-c145@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fyCI02Nk4jU4SBoN"
Content-Disposition: inline
In-Reply-To: <2025022038-hangnail-rehab-c145@gregkh>


--fyCI02Nk4jU4SBoN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> as this is a i2c_driver, why isn't it in drivers/i2c/ somewhere?  Why
> misc?

Because drivers/i2c is only for I2C controllers and this is not a
controller. Other address translators also reside in their respective
subsystem, e.g. media for GMSL (de-)serializers. I don't know this chip,
maybe it has no "respective" subsystem and, thus, misc?


--fyCI02Nk4jU4SBoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme3G1sACgkQFA3kzBSg
KbaylA/+MuSvTASZf+COhcuEvu14/HP0b0PaA7uCLIgDKsCyDHxRS0dc2yfNfqUT
Ta8cinV37PXFRMqPXGuIyjEBNbaSSJ3yV6xf8hIOq0ZmsLid6Mm9Inc4U4afJu/y
vQpZuEp07nEXodwItnxfAuOlXrlDr9nKnK8TqlF75Nw3aBJKNMWjiEcOljA/JQ64
h5ww7RW8OuYISAn+qezHJOFDUuV0dTR1AUJhBio5kRYZTVwE5nnQRldfr/sDhAeC
zY2XVklnyowcioof7TdWh6H77y8G0mdhU9U7Eq1ARkuWRBIjCMOQUOu1JndE7Hnm
ZbBgdefXxmoBr6yBJDk9CikSL3l4tQTJl1DVBTYx4fhbD/iv/S7fL2s5YDfO2Rzr
nRP4q1H+CrwAHVFjasxu+ekRFTPaqfsSrfTv5pjdaAdNvA6FpMdHOTTjo8wKApI5
CO7O/punA/Qjam+aYinEjDAM225nSiwp9grd6gfiPgUsOcVjxDq9qG4KwKW5I9hU
OsgCDJ+HsMaKdKwvXuFOFG5kWb2jTEhzscZgG7gWzo2sWcaS1NM5yQJaUv1Zmf5U
bD8wJhpl1C1H1tT4A+W+4GeHCdS/Ua8aj5ZS0kEHPiSgx9ez2v4N8MbNSbAlO/7v
xcR7s6lXmPQzZGJa7v4Xtac0+acvXQSAXjovLitaWyWOWheIqLY=
=ye8c
-----END PGP SIGNATURE-----

--fyCI02Nk4jU4SBoN--

