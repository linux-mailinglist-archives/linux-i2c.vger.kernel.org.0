Return-Path: <linux-i2c+bounces-886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA78191B7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 21:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3991F25C2C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 20:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484F939AEB;
	Tue, 19 Dec 2023 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uInVRD/s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0074F39ADF;
	Tue, 19 Dec 2023 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F4DC433C7;
	Tue, 19 Dec 2023 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703019029;
	bh=xb8dk6p1RHhv4INmJ7zZ89M+91T1HlupPCg4fGHi3AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uInVRD/sdb+mv3EVpFUzOgm7aOKLUxR1fpXol3XYR+rF+3U+XLg+CVBt/ZPC2wlmD
	 EVU4KFlJhMuc8JJLXOpS3R+mJh/MWFGV0Y43a/GFLhZhUj7HDfZvAIkXZKkelwOfkS
	 jji7q3QkWxr5gcYhmiXcgjAJczWOcXzCYyIS6GyQ3SRaJdDbUYzTNa0b2F9woA7K39
	 mCfMwZiKSB1sLWGOnOjc/tQrxvbJRt82m8dMdVos92NWbZYKfxcMl5iQQAO7QENQL0
	 q2CGukfzFIYrYiCT6zdZ+0ULAz+GMeTEbwvIQSXYSw4uF3S4mv57aqgb4/E+Fds76m
	 dvDUI4E0bmdBg==
Date: Tue, 19 Dec 2023 21:50:25 +0100
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
Message-ID: <ZYICEczlao+pg8kd@shikoro>
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
 <ZYHMvZ3plIQ0zXWa@shikoro>
 <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KAQIevLhiSubidkk"
Content-Disposition: inline
In-Reply-To: <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>


--KAQIevLhiSubidkk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I personally would like to see it accepted but it seems there are=20
> objections to this approach. I've yet to come up with anything better to=
=20
> offer as an alternative.

I see. Thanks for the heads up!


--KAQIevLhiSubidkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWCAg0ACgkQFA3kzBSg
KbYzrw/9HTP8AzWQLqcM+C6TIAYaKJLjE4spZJpDJzE9JJNPDc1avUNCE/2SBn0D
Y+NHTDDs4mTISseTNlJMAdTC5eRZaaTXYc2OOf6E5F9puJK2bwK7xRsTIHy9IodF
80Gf3zGyiV6+Xw8XDVDrzL8aPyV+jb/Zwq+iju5RlnqSazNwCJZogyhfcmRbiqQU
8fQ9arUMHkro0/4lgQmSG4q4cU+uYHuFdXWdiPDSAz1YKym1PHx1wGUu9gHzsFz0
Q9eczVHvttrWDqa2NEpdAd81rftgsNvywuUwk3Gq7gb3snUne0fKNTrTbNqF7W5t
+H1KV6CcBdAHlbm8Tkbt8ncOx6EpIb71d6KcW98o9Vrqomu3Yo28CaSopresBv9D
/ZoWEkoSBNkrxYTdG8i/BE5NCH+r8c1WEdKrzCbuVBekJDDvw+oC4tU1rcmUW5Lc
9rtvQ/q3CjqIaywMmLjqoNWeSYqCdTO/9BWfAZf5bocxwF3vzoJgIsamy1NgRAHB
X9BlMCv8tvnxQN7siHVR6axNDcOpGmmWYgR4v3Twkh62vyyW4CLqAiAWSaYde3OH
V3wO1kd1DjxCMtNZ+mUGNQPs6NiWx1KKj8ZoUSusdtZBp9n6yJlKaul5Hll0tx97
cRAfSfUy6UfVKQLSloM2uloMeA8yR1WbmB8yF4q5RbnMNqPFf0g=
=kggI
-----END PGP SIGNATURE-----

--KAQIevLhiSubidkk--

