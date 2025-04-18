Return-Path: <linux-i2c+bounces-10485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790BDA93F81
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566E5442DDC
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FF424418E;
	Fri, 18 Apr 2025 21:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EVIjeafT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28E9213E74
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012340; cv=none; b=PA36mONEaY3HL9WVPWfxOXYzLqJ+tLPnTA2oieOWxE4+1RablM6LItwV1Qcf9Xd0sreTA88Vgatm4JOTRzvVAeRFuQ+rlqbY+Ng80z1WxWydHKcGN2O4vZuJyMuM1ZDyKhRNnaeEAmuJAK0vHcDXWdLx080BFLSZVxjyQVhVppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012340; c=relaxed/simple;
	bh=akhokAyyxuJx/KmpleZXsSJynmRELlCqLTRjS09IYBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxiWbdFz0N+RImsUOpO0UZXktwMkTXgEbAEbQqPm4ZTFcKLvp1firakl2Ue26PtoDpVL6WFnj7JG//cLW3jW8IYqIn0HpaK+VY+jV7DYO1TvIp2Pwg8NT3iZROYJBMsKT36t4JSq4gRIR48QHdqmQ7936YSfo7GTViyYD3aFnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EVIjeafT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=akho
	kAyyxuJx/KmpleZXsSJynmRELlCqLTRjS09IYBY=; b=EVIjeafTdhRjdFUigNJA
	iLVz1CXziirZB6FEnltL4s6gvg3uqsO5j0OpWDlN4wi1bTJHDbRtiPH8cI6IbnA2
	KB08FFrQ8YYjilvGr+sQfmfnaA6KJ6qAayxVp4SJKoHi2RLZuXaj4BJRPHAgZMQq
	Vy8XckOcRo1hlGx6fLbStFP96bnJLbtUfb0kBZ3kc7N5rx9vXBxTb06HEP9REGOF
	d/uXHV5gnQMfluLToKwmAtioSinJMS9Ru1T97fYrYfPTMe1OGC0YCmLMlqIsEsr7
	+6QwMUwnhBa5LRfffEA8Lrzt/DS3r1gab5hQ8vPBAzF1NiYzmjhCAlvg8WeQFwee
	Zg==
Received: (qmail 1538474 invoked from network); 18 Apr 2025 23:38:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Apr 2025 23:38:53 +0200
X-UD-Smtp-Session: l3s3148p1@zMZAWBQz6uEujnsE
Date: Fri, 18 Apr 2025 23:38:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
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
	Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/9] misc: Support TI FPC202 dual-port controller
Message-ID: <aALGbZtz9mN3F7q4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
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
	Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
 <avat6oilygpkcngtpuyentyvjqifav4f3zzvrtnsdybfl6uqja@i2surd4ywu73>
 <2025041525-smoking-among-4b51@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ou49x9tjXwiyVr2v"
Content-Disposition: inline
In-Reply-To: <2025041525-smoking-among-4b51@gregkh>


--ou49x9tjXwiyVr2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I had a look at the whole series and looks quite all right to me.
>=20
> I recommend just taking it all through i2c, thanks.

Okay I applied to i2c/for-next, thanks!


--ou49x9tjXwiyVr2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgCxmUACgkQFA3kzBSg
KbZaOxAAhbVhuhyQYC1gaHi1J0SCUVJJBYZwLmkQ8tc2p4O02kYIgZNO1xumXFai
RqdZsz6fG1x4RLL61oQCdV7Rm/WQ9rU737de6MjtJ3/vn1EmdNQ9+XgwQ+tvSJbj
oLFGOusP+BNOZba9IwupE26Tfrl/leFnnWm/lp8//DZGLTgOsRpgmIIWRe6PU91T
XY7oEJ9T6QseZFbH6O3cGZ7QF56FJ9AVLIVhx8aSa9fz3BJq2gAWmSz8whq+383p
iF1OLVfIxWq7uHtYJUsSLUx4Jmhvj1UpFtdaGcFijCjgmSDGzZF01MFsFvZRD7it
NRGBcBmWEb1bzQsZMapXuwvUdSAisAO0Zhx4ANFt9039o8XIJPddVJjCSfv05Vjm
3jfki9O7p3b0LQ+vhDbZPjogThitWk1dQV/X+agUKPYMYZIgTFcASkgxiWuX411N
ut+VWGlTmtF9p9cggDVSpkWQwCLzyDhW4u47A/vG6bh+3sRIEVcsRM2o/X8cUrsj
UmBRZkMpr6gH7lFgRYCjuMqdpHqalUoEJYaKsNSx3bKSImX117m0/v63WQv+3uNi
nQHAF7+SJPy1CyXwMGsrH17+lbqwodXCEoGcGFeBa6fbwTGhrHlne7GR6B1KVIUA
WzmALhuX0OvCeiVTdZ2oV6SfQYV/HGoayhpqNhD2Pu9X8Mnq/FI=
=nnhF
-----END PGP SIGNATURE-----

--ou49x9tjXwiyVr2v--

