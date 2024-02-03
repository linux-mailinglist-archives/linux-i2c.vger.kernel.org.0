Return-Path: <linux-i2c+bounces-1623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52D8488CD
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A821F237F5
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9717B12B80;
	Sat,  3 Feb 2024 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN/4T/Rq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6811C8B;
	Sat,  3 Feb 2024 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706993264; cv=none; b=jlHohH7yfiqm1aODvTEoRzozoJHyHq1DQ7ES2BOcq9dVz2b+4SNndJB+s/+bk8J3g6DofQPr4y1npog3G2IG4G4mHLUVM2cxA/h4uk/6BMUqOIDNV7ie7I63ID0ZT2BZisuax44gcmHw1qfETMPElhTTUaUPmIWMGa7B90w/jjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706993264; c=relaxed/simple;
	bh=f2I8gWEzkwSZbGGlhrQHuwLADXjkshYxOtnScKHw11s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2ieEU5QHTImoDhGtfYNa29Wywi7gIvfmRQDOwqtEX7rQU3S70ZYCAa0Q37NDayfaw5QzJSdzRrwKGUDkcG+c0mOxfiuM6qN9KQ/GLWe4Kk9MBpW7RMnsPttj1gIs8KJjDm2MNRl4GAsJXdiHVc2GPNXG4wN40yX/1kkA+4unpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN/4T/Rq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2F8C433F1;
	Sat,  3 Feb 2024 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706993263;
	bh=f2I8gWEzkwSZbGGlhrQHuwLADXjkshYxOtnScKHw11s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN/4T/RqtAM5pPUfQihjK3Wa8sAV3pUsmPhYvA/cg2Mt2nro2ZyjanWbrJsFNV3X0
	 z5BUbR+pQSMZAeHOP3sXKHIURcwPfLXvK10KTL7JVV6BMqAtJcWeBZZaUNH8BgEZwr
	 WzCvc/4pSyEOOKjimaGiYIRPvzhm5cFZkClqVzDoxmb/PXTafnKB5XS5SvdpzINgmK
	 q/IJVnPabe73UT5UmIzBjjFDfb7yi95qtdPjsD2ng69sNJ9Ox97m8liHEvjdKMoKE0
	 QcQjfDe1BO9oUeMuwNyLPZn3s3kiyHosGSbJT7/8lpjlfsPnQ91fjVkcMwRyGM/tUl
	 QPqwMl+qAzuzA==
Date: Sat, 3 Feb 2024 21:47:39 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, lars@metafoo.de, rcsekar@samsung.com,
	wg@grandegger.com, mkl@pengutronix.de, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 02/13] dt-bindings: treewide: add access-controllers
 description
Message-ID: <Zb6ma9lHMu3SAe0U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, lars@metafoo.de, rcsekar@samsung.com,
	wg@grandegger.com, mkl@pengutronix.de, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-3-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VPm+VxExOC+V7OZ+"
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-3-gatien.chevallier@foss.st.com>


--VPm+VxExOC+V7OZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:23:45PM +0100, Gatien Chevallier wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
>=20
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controller. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to a firewall bus. The firewall can then check the peripheral accesses
> before allowing its device to probe.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--VPm+VxExOC+V7OZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pmsACgkQFA3kzBSg
KbY64RAAof4Gx7h4jhXu9UFvGgxDMB7nucJwU2vnrWAQqslpX78IIuHnDzQGSdx4
YeqQnv3x5PquSqBz8x/rnE1ptR0LqnAgeJdEOQB0AAicQ+VFy75kPngr9dtiCJuf
SrCwaIYQ13qIhhC6pa7HTEUSQN/KX6DVSffmeJmOJoHIqGa1L1ldEH5tujF71Plb
q5ugpGi2Jkmb+UU5/EaXadNKZ5b3BSp/xWur8Eemy9Z4DqqoipzJRzSJHufFNZDR
pRdNn14JQlzQ948vT+YdpGqPE6jrVpd48rygAjaXsPx3cVQx7ouU6tKPnFLjtgyp
tb0R2ZIQNXVaQV36XLwhvv0qFqHEiY36q+GjYSEbMHbO1b0+zneKgmZXNSwCclEp
WQ8DrD3UEKTXcDHmoRV5GVgzZyk7wmK8zq3jofTemYyfKhSvsmAiufzZCQLV/9GI
ScuNib34aJrsiIXiD40DsFNcutPh2v+aBXQmtfpkA++3ZvY9aBQa5KeEqzrKPaa0
AVXFtXPN4hnNkUzTogCTHEvL7dYtbi0h7W5fun3D5kOLdZuewR8vFAotIaDRG7tB
S7AWJDu+x2RT2xAs2yJEfSHMwoBZRdq3nJVugmRDb+VELZmIDBdN4vwBRXfi+cHr
ouzPgt76DcQhfF6JGRUhloWtVuWW3QRQ1uYMpWUrKztG+3WiqBU=
=nMRV
-----END PGP SIGNATURE-----

--VPm+VxExOC+V7OZ+--

