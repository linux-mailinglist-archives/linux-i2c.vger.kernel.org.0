Return-Path: <linux-i2c+bounces-951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290481C834
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DCD71C2177C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DEB12B65;
	Fri, 22 Dec 2023 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0sJpVtR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12298FBFA;
	Fri, 22 Dec 2023 10:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034B0C433C8;
	Fri, 22 Dec 2023 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241320;
	bh=l/sQfHQcuqnqBACJzeTrf6+jAOQAfvHbk4jdeRnVtzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0sJpVtRR29GpIBHcJqwMwuOAlukV/ZNIbULXHej4SixOGmTlZQc4nZNr4ZeJbkPb
	 NgXdiZqyzOcBOXpEyzmrrbFTV/7WigIMtL4gbsRaj0x50CnaEnKxkQegOMEykUgS19
	 /j9rHdnBTiyLJq3aMfKhZFMKAAuLF6Wd0oWAWLDsiTc1XApyDZfVyiRLwnafs01eco
	 5y3iLc4lcRO3pFtIzPGwbC7JL0NHHkjqZgZG6f6oNPUtUn9EFMv2MSaHM2qRdfzEoT
	 hdg0hBDN5LsGz3x8ht0oqn5syPaGvHKrrvlKsKMUnO+II6g/8fa5uDzUxw5IHvKg5b
	 fAW4QYRC7UTDw==
Date: Fri, 22 Dec 2023 11:35:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom
 properties for MAX7357
Message-ID: <ZYVmZXpwgHJhS8Nf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231220082803.345153-1-naresh.solanki@9elements.com>
 <ZYNTfKLFGrLq8qGY@shikoro>
 <497e6eda-a416-415a-b468-fe764c14a8aa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C/jQ9StvqT7gLVfz"
Content-Disposition: inline
In-Reply-To: <497e6eda-a416-415a-b468-fe764c14a8aa@linaro.org>


--C/jQ9StvqT7gLVfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Some explanation was provided here:
> https://lore.kernel.org/all/CABqG17g8QOgU7cObe=3D4EMLbEC1PeZWxdPXt7zzFs35=
JGqpRbfg@mail.gmail.com/
>=20
> AFAIU, these properties are board-design choice.

Hey, thanks for the heads up. I agree that these options should not be
"on" by default. I am still not fully convinced they serve as hardware
description, though. Need to think about it some more...


--C/jQ9StvqT7gLVfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFZmUACgkQFA3kzBSg
KbZaqhAApHb6SPANoyxqls3zUBrxOTp7yb0HZiX68d5384zXqtxpp6F5vVe/CiJx
WLKOMCMG/UkvPGDdkkZHTRgVXcgTvnFYb0xMKy1utDw5JGOXW+CmSV8BJhLRqMBV
8JxhSFsPXCkhNVga6ClqF7jdgaSwwryNa8j20LBQglvzDMSNyWgJFmzbLJEUR/8U
nkJUBjaGfprL/dN8KB/ZX8IveMjh1qzrL1gipJGkPF95ppK5JDi58ENx5fiotgIX
zDVIaq1q74i3Ocf49lvQakMJ5gSf8Hr6Cl7kpfPoVWRDzZMzt3qlNia8Xkc5ZOc7
0oi8pgr/ndmpzdr9ssMwDaikiBPtKb8D/xYWSOsMJCMpE45M1nZ/VThWYBqmcQrx
GJjxerfIvnIuvX86q6xT7DhzsgxeTeTQR6bB5qcEigJ0k2kaxyZkpfjORpfz8T/Z
Zn7GsA47knbYvLkE4T+8DAqJP6XJze8RB8wVXaDOQryBQtRCoXJqr16NspFlm+aK
Ot5UK+Ak+ibfDdfs/wWPySEuYaU8Gc9KlM/BlLlzOIMCB8iZ7jgLk6OVnz0mMf9h
SzNDT4abP/daUktwdj8X2I33aLYUZPKSG/LztXk2FmIoK+ZoXd/4UdDoKkGswE/m
k50U4fFw4nBA6WoNXkU9oq6pKfIpxG6uKvgTJgrwgbI9oZJaNpo=
=DO47
-----END PGP SIGNATURE-----

--C/jQ9StvqT7gLVfz--

