Return-Path: <linux-i2c+bounces-901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6E819D98
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 12:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57EC11F23094
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 11:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF3321379;
	Wed, 20 Dec 2023 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwvn1CBD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B69224E9;
	Wed, 20 Dec 2023 11:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE109C433CD;
	Wed, 20 Dec 2023 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703070186;
	bh=GrMriv7ivnlP9h7Q18r2uy1Z2grWFasuxR26KwYb0Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwvn1CBDR+i3BPjmWN8LynrNe7VQW1YBIDFsOxKIBbznBF5Mpp+2lil0a2bNqfODM
	 aLhiyR8JJne58blG9yQCdJaoB1JG0R1HEa5co6psefejF/iqfDqpQbugByrFd5Q3AW
	 K39jhol9fvboYfpGEsIsunq5jeWz7r/7XLy17Rwn7iv3ncvtr5ZOJjVSLYLDqZyvfC
	 p3d6IIKkdnaKAl8r7WQ6LITy9zKiHoolzTZZ8j7t2HZFhCn9npJXw3sghmqyCrouon
	 7eU6yyDRYG+26QZicjNPSMQQUxyVS1fRCiiHsIcrlKMvH5j7pPKVfcBiGI5LceQlSq
	 /Tn59zc0nukwg==
Date: Wed, 20 Dec 2023 12:03:00 +0100
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
Message-ID: <ZYLJ5EMKK1jhSclQ@shikoro>
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
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
 <ZYHMvZ3plIQ0zXWa@shikoro>
 <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
 <ZYICEczlao+pg8kd@shikoro>
 <20231219232545.ksrxgvl7epeewga2@zenone.zhora.eu>
 <e80a06aa-bb44-4993-8e67-dbc910a409ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WHFDagMOY8iIgeIJ"
Content-Disposition: inline
In-Reply-To: <e80a06aa-bb44-4993-8e67-dbc910a409ab@linaro.org>


--WHFDagMOY8iIgeIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>> I personally would like to see it accepted but it seems there are=20
> >>> objections to this approach. I've yet to come up with anything better=
 to=20
> >>> offer as an alternative.
> >>
> >> I see. Thanks for the heads up!
> >=20
> > I'm also inclined to have this merged. A real fix might take
> > time.
>=20
> NAK
>=20
> If you intend to merge it, then please carry:

No worries. If this is "abusing" DT, then it is not going to be merged
by me. I am sorry for Chris, but sometimes simple problems create quite
some fuzz because Linux hardware abstractions has not foreseen certain
use cases. Or the APIs dealing with them didn't forsee that. We have
been there a lot of times :/


--WHFDagMOY8iIgeIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWCyeEACgkQFA3kzBSg
KbYtUBAAhgwr4srMDqCAfVg3lItT80XUcPPuD1wSb+62T/SLusHGQAlIh+qwQ02e
K4+9VWDpZGmlHh00Zsutfu9fcbuRlO3ICI61+7sVp0IoYGJgaCr/t9Zaf59cbIol
tpLwrZnp1JOu3MYnZa6zmitBhYnqyAzyME4//J4Y8ol7jkWMPIZ4/JwYpQaz3dSL
jrYcXGBIrZVUAtS9ZGJShExz3tnVmg69cc05noH18rkUUhPCKeqgQhpNbKlwu/Cq
UqIzYa4MRlY/JXxJcCa0sWtvKOJWxhF1UI1kn53v60znM+Ku+n8uvciX787voveW
zIq22dNIv1iiA4SX3O8/Ncnvyrk+K2JPFBcPMy/XKN5IWtaWQSZsViZ/Y8Zgtg09
C4Z/shQwcjzSd2aJhVNdXnR3fiMdiLNivSkHiBji0PM9KWTcG4bXRSGRM35h95v+
ii6+U13AOp5Thix8oSvmaYv1sH3ZTmkLIh8YHEC9uTVylgIpEoZksOoZn7F+JLrA
LAF6w4e1mbowBwhM1sS8pQJvjOIQDsO80Ygl1feo/+fA//nZYcQCTCBNDO0mebVw
CGoOTlAj4IBUzLi524C3ErLAawO+mrkpqOsc2mmtkkNcWOzaCJmtROLh8AL+ugVa
ll43a7YU4ikQYjfZH3LDE+bzCiaxKrhwp1fRm57D2jn3ISZRslM=
=Xirm
-----END PGP SIGNATURE-----

--WHFDagMOY8iIgeIJ--

