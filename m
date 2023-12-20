Return-Path: <linux-i2c+bounces-905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E47819E7A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 12:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E2C1C227DC
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EF4219F6;
	Wed, 20 Dec 2023 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQu1P4jo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BA249EC;
	Wed, 20 Dec 2023 11:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788DCC433C8;
	Wed, 20 Dec 2023 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703073152;
	bh=B0A5TBSbCrWLcrhtK9MAMby/mX31w/9oNXP4+2X/UaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQu1P4joAhpJs4CbK6ZdXK8yrivIeg6wgpRQ/se+Ds/hVSSd25dCTmbpInLLiAIIb
	 8LqMNOrKI7a0NJDRVrOwHPI17EW2vbjLSm0XSi/y4ltWdFwhDV/o5V1rSHTn/jSGOq
	 fxPQltILl+l+t4g2Azs65EBwzpzD8ECd4o41gQebZ2SUQRBilbg1n1vF3nl1LUcXTw
	 83AbRZa2cfqz7bi0FaAx+Iesv6Ub/YEmYvUyuFwc/zYWKmmkHi1lDj51NdT1nwG5Q9
	 W3zcstn7XxxlJXBPoittmbShm+6sjh3n9srqxxi/kou09mqrR/Q4ejGeCDfyYx9dMg
	 sdmCKXoD8u0Ig==
Date: Wed, 20 Dec 2023 12:52:28 +0100
From: "wsa@kernel.org" <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Message-ID: <ZYLVfK4HBlUOEFs4@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
 <ZYHMvZ3plIQ0zXWa@shikoro>
 <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
 <ZYICEczlao+pg8kd@shikoro>
 <20231219232545.ksrxgvl7epeewga2@zenone.zhora.eu>
 <e80a06aa-bb44-4993-8e67-dbc910a409ab@linaro.org>
 <ZYLJ5EMKK1jhSclQ@shikoro>
 <9c9ece43-75b8-43ca-a8e1-b338b47b5c15@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yX/EVBj0oGz+6SU"
Content-Disposition: inline
In-Reply-To: <9c9ece43-75b8-43ca-a8e1-b338b47b5c15@linaro.org>


--4yX/EVBj0oGz+6SU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> from two years ago. Rob wanted handling reset-gpios by generic reset
> framework, which would solve these simple cases, here and mine, nicely.

That sounds good. Good luck with it!


--4yX/EVBj0oGz+6SU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWC1XkACgkQFA3kzBSg
KbYEFw/8CQ5+bcq28cNhNe8+bp5PRghz6Ow/K/CzSxWfCy//iImtkCkh63I7IC5q
qPq6It+bTz5dJxCDiP81+TXwd5irGW4OrAJbiaCunNB2vmEoVdMKOYjH6DGxR5ip
dqhuMtgq4Jc8TWz7v+Ft83uFmJ7rU4T0lDIXVQGun1/i0c6ibN70WoNAkXETW6/P
856+D9Oyt9mqofcsVPvL8GVkRDBitdpXktJfNBGEi1c/YrWrFs+0MPPN+KQdBZ/d
nzeSbP91v7pkjm6b7u/nTnosiQvG5gvdAz0XZkJb4ZVTaAexB3pd22aFsko6UnZC
vEWTk0dnezm89p1nuVnQ5J+z5hqooMviddAHNZkUHfiVPrr/Zzrrsm3b7d9SHs8l
TdqzdhLbyxNSku6LbM6GP1TstftyVV0EI7N4BceOO1Fz+kflIvr6jp3yjxesuxIN
A/P+vxAHuyy6XzxVqrB7WBaP6RZUpdh1yrzVAELmNydOA8eKgNzS1D8fme40tJvi
lOzuV4/iYfDLtwMnlu9FEaalvHHesI1e8xzeGpVaHMQxzd+h6RZC94AbWYuzCcSS
P6nduPbUyNYYEypibnSAqlRRE0+Tvdu9apYI4hHhdb5z0q3my+0iXYEB42z1+gET
OWK8V07OpKorrdfK9vHiY9qZBzhGzKH4mLF3LM98inZXjWZQKvY=
=elAY
-----END PGP SIGNATURE-----

--4yX/EVBj0oGz+6SU--

