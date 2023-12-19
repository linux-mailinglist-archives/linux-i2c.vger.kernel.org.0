Return-Path: <linux-i2c+bounces-881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBF818DC7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F2D1C24EAC
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E446374D7;
	Tue, 19 Dec 2023 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gj8l/OZY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E406E374C0
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 17:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97866C433C8;
	Tue, 19 Dec 2023 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703006270;
	bh=QOETUdoOegCmcBN1FtUN1rYmhGbrg+ulQyZd8d38Hj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gj8l/OZY0OxChbvBGM6oNoyQg6s+j48syrFN4AImldwANKsEfRwJiCreZOee+467S
	 r3fTExIi+mSnaP7KokUI8+LBF1Pmv7Qloi5uw2NBqC3ln4cqW7sYXzchvxWmy0oHiR
	 OVnWcKkhXofNuJm+TXBULHAJFbR6wEx4of3sbdKOEU9CGy0AbNSkUjFFyTqYtDPktZ
	 j5APY/vCr6MELVF5wZB3kr2aD+kbExTKSPg+fl0/aslkvCYTBs7QyZkXrD4lYySIRx
	 YPFIQ9Swl7fQvWtzxE9A1mAelWVMztXN9WZ/SryqUkwVHvK/hsj81pwHUSGNTenzKF
	 oCQ9A6FlBS3Hw==
Date: Tue, 19 Dec 2023 18:17:47 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] i2c: imx: Make SDA actually optional for bus
 recovering
Message-ID: <ZYHQOxjCTZnARK0e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <20231130095751.65773-1-alexander.stein@ew.tq-group.com>
 <20231203220444.thaeuyqyv36hpv2y@zenone.zhora.eu>
 <12335412.O9o76ZdvQC@steina-w>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0e1ZUmcPxOAYu4Ab"
Content-Disposition: inline
In-Reply-To: <12335412.O9o76ZdvQC@steina-w>


--0e1ZUmcPxOAYu4Ab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 09:35:00AM +0100, Alexander Stein wrote:
> Hi,
>=20
> Am Sonntag, 3. Dezember 2023, 23:04:44 CET schrieb Andi Shyti:
> > Hi,
> >=20
> > On Thu, Nov 30, 2023 at 10:57:51AM +0100, Alexander Stein wrote:
> > > Both i2c_generic_scl_recovery() and the debug output indicate that SD=
A is
> > > purely optional for bus recovery. But devm_gpiod_get() never returns =
NULL
> > > making it mandatory. Fix this my calling devm_gpiod_get_optional inst=
ead.
> >=20
> >                                ^^^^
> > as Uwe pointed out, /my/by/.
> >=20
> > I think Wolfram can fix this before taking it.
> >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >=20
> > otherwise:
> >=20
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>=20
> Thanks. Let me know if I should send a v2.

I fixed it up and applied to for-next, thanks!


--0e1ZUmcPxOAYu4Ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWB0DoACgkQFA3kzBSg
KbYEDw//Q6lJ1N/3si27gyA1OhDDmV+KAXD7Twa+Rx3m7krIR6FoVE68zQ7MqSdi
Mg5UfgzYXcK1hJx0Iui6w65lXRAvg5OltRGAr631ouyPvKjDXPrYdiCXDR+3J//w
Pn2T9Qs1zK4bhWNuzl0B/viixUJa9UwCz7yW1+Rk9nR388RIFLjmKsL4k0oA/BMP
AoRr0SsL8sIWQOQULAx9PtHXfSZBbHIWQf0XpsPgrxHG5SjJNuBG1INQ8W44E5sV
b2/HAMBpjIgDuBt7l4zin2JuhpmA8f/j+V0TSF1J26imJpJEL6KN8W+ncFkVxtaa
tDS4WtNXCfA5inS0W4bpnanpXXnPYXRt+RJmSIe8G5rtvz4nHgZmIe6oryZqYU6l
Tn3GmlkDL70Q7IqcRCM61ZTFS8pcgRuJvvxmb+LuWHjOtQw4jM6aF6epzpwIjw7Y
L1TJX9HY5JRkMAbU9BJLB204U/6rp5BzqVaAbi3NaypxCkr3LIGJrxgBRhE226KO
Z/dUHyFt7K+h2pfdU/pzBYcp44Gajjws+DAch/gSTvsJsJXIgIhncSDSBf9Vywvr
ECAot4Qw8J0UFIjEzM9b8y0NFIfIy/1lPo7oLZCxW0N7nFTQxJL2El5puzzvYViy
Pbsv9JzH8my36/qc5OM6EDANvNohP3gKwDr8ISda+fMB0IawGhw=
=wTms
-----END PGP SIGNATURE-----

--0e1ZUmcPxOAYu4Ab--

