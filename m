Return-Path: <linux-i2c+bounces-12081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB4B15E03
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 12:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57D053B6259
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 10:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B35827C158;
	Wed, 30 Jul 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyQOpxcV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE402266B66;
	Wed, 30 Jul 2025 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753870772; cv=none; b=L+Ao2YRDUh0xIQWhsuVTcQ4+gynhrpCyBYWoA4Gs6XfvPL5ZPj4AjJP22wnoW3bRCG6c6dJqk7Ug5OudumeeZcw3nCZiuiivaCBL6mlC+MQI8zTT64qxBb/c+zf2//oM0MDUarod+NQIsYThgxl5eeDH9w4Vu09LlKRuDu1ODj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753870772; c=relaxed/simple;
	bh=EAo1JwLwQmSVpdRh6bDezMwGkO6es9S03FxPuaNswug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbeqL9dy2oqF8GDT/+kVUw4S7fGhNSByiN/Qecrzd317OH5tao2u3Xbwq3ixgsFHwvlfFjOt0Fh8nY0UZKzCqtzqNVK9Pin+4DOo/P6joeaqpF+UhDZ/6WMaVk5UyUJtgE+BX2AQzCIh6OkSzR4y57uq44CWjMZPFskyQ1+NAfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyQOpxcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582B1C4CEE7;
	Wed, 30 Jul 2025 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753870771;
	bh=EAo1JwLwQmSVpdRh6bDezMwGkO6es9S03FxPuaNswug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyQOpxcVcR1H63+BHWg/CFKigaLqUqMvNvXsUknLdHPeMkodeiZl5MPug/8DsVw/a
	 giBEQoO6YJfc2IYMup/cB5/tzxUNdpq26OkCCKKEyijv3HeDTvTPB42bZ/LAWWap1W
	 HSU9KVqt3jnCYHFHTDpwJjFf8xW2jB/JQQE+K88VmHLkDDwagXryM/B6XDesFEu6sE
	 dSdDZ+j8pNDSjEmeF0IcFGmPg4/QvfL9hUVm6h9WtgU6dBsthpBa+4155dTYEuncfm
	 LoudalTEKGq6b4IJRJAblOtrJzxaq8mDhKnhvwKxJ1GJAz0exZz3MffWB+GUVgM/Fm
	 qi3d0rU9EWtOg==
Date: Wed, 30 Jul 2025 11:19:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 5/6] spi: geni-qcom: Hint GENI protocol ID to GPI DMA
Message-ID: <490091ee-ba84-4f97-96b4-fe30ed082e17@sirena.org.uk>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-5-b505c1238f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bAEzP5efOXdEgXiD"
Content-Disposition: inline
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-5-b505c1238f9f@oss.qualcomm.com>
X-Cookie: Linux is obsolete


--bAEzP5efOXdEgXiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 11:33:32AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> With the API in place, request the correct protocol ID with the GPI DMA
> to avoid having to hardcode this obvious information in the device
> tree.

Acked-by: Mark Brown <broonie@kernel.org>

--bAEzP5efOXdEgXiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiJ8ZoACgkQJNaLcl1U
h9DnvAf+LbcTzds/hsfTeLtLPENpavgpdBbC/kj+eo3NQESPHZy9K7kiL8p7Xjbr
hMSf6upQxsK7NZMFyKsLc0oAEP6LLyDU16ON/R+QDQiNYou0xOm9vYoJwtmhMvDY
PDJaohO2ZSfEwodlxhodZ0HxhrSaPXLEiJt2tA/ASGUdRtCC15yUoXItcUf+b04C
/A3TjgtsVE32Xz6HKLh2/Z6WkBWVgqpGswljAu7JkNAvKlp7BTviSUX645kuiQYz
/o32yfxiCCO5LO/s2/wvMjiCgaKi2Kf8uLjifxymS8nOhqcw/yZjAZ70/lo6j8IO
EmQkB6uCcv8iOoBmuo/fb2/ULFapvQ==
=j7vN
-----END PGP SIGNATURE-----

--bAEzP5efOXdEgXiD--

