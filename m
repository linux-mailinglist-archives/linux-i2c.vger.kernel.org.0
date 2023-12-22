Return-Path: <linux-i2c+bounces-954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5B81C86A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62681C21930
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1121426C;
	Fri, 22 Dec 2023 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir74O527"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D6F9C3;
	Fri, 22 Dec 2023 10:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C51C433C7;
	Fri, 22 Dec 2023 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241893;
	bh=7e+Utf9Qlw1YNCEUEiHrjDQwDvUaHVt+rooHNGyIPmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ir74O527NqK1c7IXNF3bkTx3shCgDtrS+5AeOie1qboYeD34/3DHCrOfd1yH1KWVG
	 XRNnAlC0HE6zvH2CLyBn4x+sxBY9CB6RsUg0pJjfGxTAmhkvf1bdN77mhgsyvysrjE
	 bmPjdUU3jTFb45kXveHqcaL80Jo9WEuEcyvxeXheQuZ+Xesz5Xr0ngpIvG0CteVJtM
	 +oMy894FyEwLN/JspoqIXB5CivSKK9TNpbVkcg2MQAcy58Z4cOFXJElzkWUzPrvZBF
	 jz6IEaXyDsiuCCa0tYYkXUC8pyntWHIMHreE8CyAQwhCZVxL9lLDIqMDGcLtTWK3ow
	 hXqsWPIz7X02w==
Date: Fri, 22 Dec 2023 11:44:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] i2c: stm32f7: use dev_err_probe upon calls of
 devm_request_irq
Message-ID: <ZYVoolBtWqO7DLIn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-2-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSNLBrCnvxbMjT4J"
Content-Disposition: inline
In-Reply-To: <20231215170617.95868-2-alain.volmat@foss.st.com>


--hSNLBrCnvxbMjT4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:05PM +0100, Alain Volmat wrote:
> Convert error handling upon calls of devm_request_irq functions during
> the probe of the driver.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--hSNLBrCnvxbMjT4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaKIACgkQFA3kzBSg
KbYwoxAApxFJGCB9R+nd+wvF2Bvp64UJBnwx5mwqvzFNB1MvH6EFwmAcOoPINY2P
kCyxayAC8Bumn73LfsMstBXIhtXrE1g4YhcJNlEOADNxIKxTtQKYABkTzXmLYDHa
kXuQ6RBGAE3YpGFZb+/Zwkt3ChsGPuanp+mclugUL09jTRDmpChMRaKtDqwoXl+A
fth/R7PnDnPHfUA5Sa7A9wvxI5Q2lPgSBaw7dDRgLq+InagiHIik/dG+8XcungFi
rTvAv56TuiyUqKfQkEm5ka3PZAF5wToApWfIh5MyMYnhSVAZf4BIkg1wbj5KcSCt
acPlqxYrOMV/YO8S07iOkY7myXHIALeHsk84wWl28stsVAe+C9XNOk7eo1HEUY7X
NWXhTjpBtOOX+tN4mS3NouDIkMi0ojeewGVej527i9x7q5muxLRrjVFmMsJYXB5V
yfyR28ErQSUdGyT1Cjd5LPukS52tzXcKrUykbgadtf+lXjVjqID2W6mfiwxp30JR
plS5NREZ/r3BDM0657QGnw+5M3tU1rpsiFcMa578iocYuV6E8RD6HXKHU4w5MZGg
Wzro00foVrM9gZQgw0m0uOnCjLLuO32jgJJ4PA9l93KABJCcsWBn9guC5NsObysE
CkR8f8YoYh83XQTVvhsw+/iNfLHmb8N14jNTC9a32qua8Hevqrs=
=MpQv
-----END PGP SIGNATURE-----

--hSNLBrCnvxbMjT4J--

