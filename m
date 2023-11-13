Return-Path: <linux-i2c+bounces-133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 687327EA24B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 18:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6FB1F2205E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0507B224E7;
	Mon, 13 Nov 2023 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDSIQ9C8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D9224C0
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 17:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56039C433C8;
	Mon, 13 Nov 2023 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699897519;
	bh=CgcFT+veTcKjCyHdvfNFlsBA0HiNgZz8r9E8ALux3BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDSIQ9C8h4TMewndaNKrIC4pIPQktF9e83HNgStjSpPfKs0uBTXF6XNdXUvf5ZfGX
	 1yJYxSWRvwZxvSQIbyMv1HrbAG2SYBCU2AUcf08BgviU1l+ix8sHMzMu7SLVAJiN8C
	 /CRX9bzk/RHQXO7GNP/gKb+bYjqZ+WXxi4Ov1EY2BtKxfRtwV9MQGT3NwyGDTUDnV+
	 IEy0IiUVv178RZHLpZzx/dlQ8zo5fZJM3wPAOMG1O2+Xdy04rK+1crXhUnbiB57kHu
	 p9nG8KnqkqmeQP2fP04l/ZG+xir07sUTjwgJbkpLnGf/ahOLRA0AIeBuCvlxIc6RN5
	 s8reCReUpVWTg==
Date: Mon, 13 Nov 2023 12:45:16 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: ocores: Move system PM hooks to the NOIRQ phase
Message-ID: <ZVJgrJuCSImHpxY0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20231113023249.1185682-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bDPSe1q/v1JFXA1f"
Content-Disposition: inline
In-Reply-To: <20231113023249.1185682-1-samuel.holland@sifive.com>


--bDPSe1q/v1JFXA1f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 06:32:45PM -0800, Samuel Holland wrote:
> When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
> the regmap-irq code must be able to perform I2C transactions during
> suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
> be suspended/resumed during the NOIRQ phase.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Applied to for-current, thanks!


--bDPSe1q/v1JFXA1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVSYKgACgkQFA3kzBSg
KbYBdRAAow/OUtEPBVFW487SQNrOBs84oOBnrMBPN5YxBoP/ub7dkYu4PCAmJaaz
19jdPmT7JrUdi5f9e0wT9xsopxrJqJj7zrtV+x89Rd2N/7/sOM5kULyOTl6XdEQJ
FSAaImkNkaFYBcslpJ1LoPjQSHahnrzb6MKI+Au82TnN3dwfVwoVuMEpbFfjXtaZ
h8CbOa7VbD1woF9CZBlKbLMRoU0dWr0tRFoyQJJyrdagvTYoTEB2Y62l96X6BeBj
hgCvEaBOuvQoA/dDr4TySYY8Kz1DSLPy5nGF0rnuJZAd91eOHf6pRifU5BUd2sF4
ri8QBzyISLbCzy1C3iO3+Aph8k+3YRe2LRRbotAwI0qN1ehZeJuq56EB0NhOjyQH
Yj5C1/J0mnETm0u6RfPv7ZNGv7L9ynQ4ztqR0NaHoWJGWr6hvbGoT1IvAy4vJlFm
9hpafAI/g1M4KnolhVhsm+mB9rHWcP1AQEZRBZxIC0LnIBSdr1kf9Lj8fSRVB75F
WV3SpptHPwblEvSx8JvcunivPPA6lB5HSXKxyrkuIrAWQxbp8qVtL94ZewYyWSrR
NWVGg4bOyKL2sF4P9AkR8u2Jzvoe43/7k/Mr4000zO01ccQ2hd+EqMV/MyQpPHIz
sAJCx2DtCHz69dzGwHZZo/fnlnBgVT4Bg/43YUjb3mv+LONyiKU=
=T9a0
-----END PGP SIGNATURE-----

--bDPSe1q/v1JFXA1f--

