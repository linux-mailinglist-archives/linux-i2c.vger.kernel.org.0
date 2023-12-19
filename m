Return-Path: <linux-i2c+bounces-874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F0818D0B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B151C23FA9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 16:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C30C20DCF;
	Tue, 19 Dec 2023 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2NXajxR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C920DC7
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 16:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A844C433C7;
	Tue, 19 Dec 2023 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703004982;
	bh=SnNbmDtLT6+P7umkLGp9NLZ5G92Et4onaiBrbSI3QD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2NXajxRRGfNKgOLAAfz1w39X8+DhtJYo/8mOfrDLM/9sgTL03YyZfJzkjgwyi0GA
	 vmToktwSwBKwa2/+uHQJ64+DNw1olIs53XeY7O1x9jLB4RP5VOtboG4T1jc3NISeIb
	 l/StNTxLt1g20JbyiKv2Agch67Fd8sC6FyuiPXVhuHuGjyFmG7SPhfJjs2BAdkniTm
	 LF1xmgOHSy49uOjzUvYknMpO7P/AlY264W86aKltQ0kU/2bRMhk11wGMAw1k79iBfZ
	 Hz2y5y0dDoYS1g4InONV/+gqQb1tpvuM3JAa76Mt/tmO441OGRIm/XZVDhYEHYHSva
	 OC0vnr/fEJ52w==
Date: Tue, 19 Dec 2023 17:56:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <ZYHLL8fiLKJNEJ+8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
 <20231109091046.4hrvxr7g5imfrykq@zenone.zhora.eu>
 <20231110122720.cyxtnpj5k6bip3ok@zenone.zhora.eu>
 <2912069.e9J7NaK4W3@steina-w>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kHQ9lrHlsJlBeH8u"
Content-Disposition: inline
In-Reply-To: <2912069.e9J7NaK4W3@steina-w>


--kHQ9lrHlsJlBeH8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> > ... improve the commit message, reporting the real deadlock case
> > instead of a lockdep warning and...
>=20
> I've improved the commit message about an actual deadlock.

That means a v8 is in your queue?

> > ... find a more appropriate error number, I will ack this patch.
>=20
> Thinking about this again, I think EINVAL is an appropriate error code.
> The parent clock frequency is also an input for the i2c transfer. So if, =
for=20
> whatever reason, that clock frequency is 0, it is an invalid value (argum=
ent).
> I've checked other drivers what they do if that clock is 0. Unfortunately=
 most=20
> don't consider this case at all. But some do, so e.g. i2c_lpc2k_probe() o=
r=20
> dc_i2c_init_hw() both return EINVAL if the clk or a calculated divider is=
 0.

IMHO, the return value doesn't matter that much as we have a descriptive
text accompanying it anyhow.

Happy hacking,

   Wolfram

--kHQ9lrHlsJlBeH8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWByysACgkQFA3kzBSg
KbaYxg/+LA9ZHucDgFYv8gSb8Hy4hMfyzQgtPSCwkI8Goqa2nXbBE4EnYL6NrHs3
glg9RUu0AJYQ/RFZbGEj/Y5ZdY9xNMGT2uJ+DOrtwn8M1nHqUHlWacghEFvR1mtW
aQ/njOWc+H8Z0Sl5wI1FXLk6U0jsQgh3slk11DINwHgvaVvm3tc9nKCZnXl/9FIu
xAI98VwF71jXLLT6aITWPFVwJu3LV74BUaK3LYsax071g1uZIhJRCebNBwoHjx+7
Abysd+RHOSn/knlkEk1lTtPRq67cefmePyrf28lgMfn/UynLjfklvV/Rn4oNIk1T
evKkZT6wMa/KCowJFSqKzdxc2/iQV9EsDob+c6lPZ1tsDyDX+cP4nY9/qf1AcQfP
JkuKOoOmA3lnXHuHN6s6r/uowv9vJZiiw9l5Y3KJ+kC57aa1Wa7zRVWTYB4Hbqj3
Tmd2ing3xGzV3/jbOFsaNltjK6pWro76bI720CPPDBwp44p7W3+cyuaXxWousTDj
uUluTKqjRGOu9SEECG7ir4y+N5o8/vimwS6UJlfbTdFWMMGKOPIUDAt+j4+o1RMH
ibrX2S1nUw8Aps/TfTLp0ZSKjKfwh6ubqN3SanESnNVGKkLI17YGwqSQIMN1lwEe
evryrutbmlS/MmYWjWW8hGK2GV4u8Vt1hX0DxIrq6P9dZSvlXJ0=
=c1MU
-----END PGP SIGNATURE-----

--kHQ9lrHlsJlBeH8u--

