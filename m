Return-Path: <linux-i2c+bounces-955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7823D81C86F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FD0286C94
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D43A12E7E;
	Fri, 22 Dec 2023 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBWVLxPT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50C171B8;
	Fri, 22 Dec 2023 10:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FC8C433C7;
	Fri, 22 Dec 2023 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241901;
	bh=ShupqjdXCK1YHHBcFO8hs750OVy4QTGRAAwSR5iev4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBWVLxPTZhWKm89e6utkeSoLjdoR+XdZLEy8WV+hIJ8ILRw1w0SQQJa+AZx6ZFSaL
	 Ac7Pzih+KyS7es1tPn0jQ3xeopOqVUbIyRku/NL4E9cx+HTc5dd71BymS84hnKibfS
	 jQigEkVotx7dEgpqk+aEeYRh6wRzH4kiAAOQChisvsmAkZwlRlgkdekCQcNFSHiMoT
	 N3Pz7x17v7szXgqNeySKF9SmzR0xfJJWWa3W5CbZ8IN/TBVcBNZ05APQuSf3GPTiOU
	 huX2loCy03cRxDuvm7cPaoK9e3zoqehQzeLPFV6zM60bsJlI4T81Abpjsp2ZRnjBw2
	 hwuoqe55s0FSA==
Date: Fri, 22 Dec 2023 11:44:58 +0100
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
Subject: Re: [PATCH v3 2/9] i2c: stm32f7: perform most of irq job in threaded
 handler
Message-ID: <ZYVoqkoKh0S6yArc@shikoro>
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
 <20231215170617.95868-3-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cJUzRKXF5UJ3Tb2D"
Content-Disposition: inline
In-Reply-To: <20231215170617.95868-3-alain.volmat@foss.st.com>


--cJUzRKXF5UJ3Tb2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:06PM +0100, Alain Volmat wrote:
> The irq handling is currently split between the irq handler
> and the threaded irq handler.  Some of the handling (such as
> dma related stuffs) done within the irq handler might sleep or
> take some time leading to issues if the kernel is built with
> realtime constraints.  In order to fix that, perform an overall
> rework to perform most of the job within the threaded handler
> and only keep fifo access in the non threaded handler.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


--cJUzRKXF5UJ3Tb2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaKoACgkQFA3kzBSg
KbbsDw//aFhyrr+YkjzLP19P98ssW6YFkD5CXluTuvlSoc+3117pGH6kWikSgMTw
IuBTpqf7vRSKDZWa4WX1w1byd8o4imBePSfTOJY0Ed54OrAyXUN8/wb7HQ7o8bbx
a5AvA+sakt9370xz4V2LikLrIcm0bIzVkdLSPOiV49GE9Fdvj6aXv/GVuQaveSTy
pnJhOKenY1F/+80mrJYs1F18DMVTQ7dpY0AzzRL8pdIw9PbMrBUTdqAEI//WnofG
q7LriFLkEgm6b71HtIHVCH+KdwCtYQ/eokp7R/lVvZXdpo4RQXmKBkbdk3Ip1fc9
dQuXlIxxHYTHbuAal1JQctNtr/UAQWOzbrKnP8N83oh4bh7LmXwagC5KfHXS9PAl
N3GCldcrSX6BVU0wFSinVrFh2Dgrv4/lVOff6zYOwtb3SNykgO2ecx6ZSCs6Zh2s
HT9E2a4+1Lu9ubXYT1nE/20sn0+or+ExCb3txD6rdGUAfJiIDoLlf7vBsLlPF3gx
zsPpTdXAkpXdjbcWP1g5QxMmvtdAw+PC8ofQlEYyn8RaDFhIsr/XBOAUml+8MDO+
/PuHsrCHWED68xywUk9ajsbZ/99nPaYHjStk8GgXmZ1nAOty+D+H64WYe4U0Imt0
gPk6JOkIF5N+Dg1DxbyT60jrYRbuZFgJHRyPU7Gm7rkICZUM768=
=/AbQ
-----END PGP SIGNATURE-----

--cJUzRKXF5UJ3Tb2D--

