Return-Path: <linux-i2c+bounces-876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A68818D9D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C52A286DD7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FEC241EF;
	Tue, 19 Dec 2023 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQOBKgeR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77B37148;
	Tue, 19 Dec 2023 17:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9211C433CA;
	Tue, 19 Dec 2023 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703005376;
	bh=+d3PWc22cneSKyoZwUJ946g1x4VmVLxHqaRDVN/mlWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQOBKgeR+29pUnTzy/YBIN7/xcmXKfyH49vsfiHy68lvefCR2a43BtKdMrq5HmPra
	 V0E9TcpqwgguxlylpIwlhsyA2hJGFFCU2StzpKXHQswLVHc3zes4gbcfLjEaKy9y+i
	 gvX96wjp9hfAI3ystFkmfo5eBVjm2ISj2zXsvbSIpmI8Hr6QZzi7Z2B7O4cpnkOq8L
	 4WD+n2m31HJfX4OBiZNvsGRze0i7sQFmYxriuxaq+Htgq4P0mdZL/ieJtUddCcxA8Y
	 0/NHNxImDiKj/vjKLmUkTTfS5e/NZqXlUIFoo6Zq0m6EOD3eBnWO24uO/nZBvL93TU
	 nILKMp0UPv3Jw==
Date: Tue, 19 Dec 2023 18:02:53 +0100
From: "wsa@kernel.org" <wsa@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Message-ID: <ZYHMvZ3plIQ0zXWa@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73ObVNrSXu8UU5Wl"
Content-Disposition: inline
In-Reply-To: <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>


--73ObVNrSXu8UU5Wl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Putting it into the controller bindings looks like solving OS issue with
> > incorrect hardware description.
> Yes that's entirely whats happening here.

So, this series can be dropped?


--73ObVNrSXu8UU5Wl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBzLwACgkQFA3kzBSg
Kbb77A/9FqgeYX0ZKvzZXeSfMb60AxxuxaGZWce6ogX+I1B0JckQ5t4QrN8TB+Rv
cBSUnHViBg7CssvtC1WScKLDe0KzO+66xTw1eOUagTdftnE3p+rDAmtbMPUXWaoE
rCVV540pcXXsfSr/BOdGJLDHeOnwublpF0Wf0R/UwvC4o8V6HJ2koUPZMnjZlHKf
y62/VxlzRjHXs3ZxLh6D0uEFQR40Bj7Shd8U5wCTsxf0dwejSYmrq/QKSJAQb0Ej
IkamiDQjDbgN0SyRDobfVk+KsY73Hcbz3/EcjiP3uyh2MjZ2DrjRpC8J1D8oeNbB
szxwFHfsT1BCrEjWyU48D2dnnFZs9e7D0yfuArcrtGYvIsS98WejYFuPezhqVo5v
Py6IyDU7vK/J1WaQ5tfwoB8OcSJUcN1yOhxeU+djgQ0gwNANYa7bA8HfcuBjdr4z
onC/zJyimlAhd5lre1Q/mLAKjrDoYpHGyDvL/8QquJ1fBGDhdXNqsL0djXrwR6LN
AZ5yet5thI74/X8ht3nFiuP+TxOGWYgOaAPIYR/6g0tDiIHpPPvTYbtPtR3KhrPp
/r2G2OQkxtA6Q/lWSBwNSl8fHuXHZKWhS+7bvvrhu7boOTguFAlxa0WhNW0emXyJ
jGVnxshVL45GFepN94yDhSZ1MsJdsgteMP07MGdTEM/e9gZBozw=
=YJZ7
-----END PGP SIGNATURE-----

--73ObVNrSXu8UU5Wl--

