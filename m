Return-Path: <linux-i2c+bounces-957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C447D81C879
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F661C24A51
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3402E14AB1;
	Fri, 22 Dec 2023 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFsjYMDn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA2917730;
	Fri, 22 Dec 2023 10:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3364FC433C7;
	Fri, 22 Dec 2023 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241922;
	bh=j6u6qc8mKIXCYNvw3/ltEB01MEkVvYdNodFa5ihcHbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFsjYMDnA+EK3KETfTX1ys4qoDEGj8edi1SiA3UCa+ctPaH2N4SL38ntWeqBaeQCR
	 tPpy3u9wacnQVwXR8R6XoVvm6/5ocLKyPrTvVTm6u60qNG51ZYJBozfdr2y53MATtv
	 S7KhDddmfTUNaRc4/7u6cP+BnCGx7hcrAAArEaIpISxUaYtB9CxqXCl0805hsDn6bo
	 sRXp9OGzMnys59HVtD/r34EKQuu3kDFvNBJQ0RV5um9pkI5ULmF7WjAMTl/LqG0xkI
	 mP9Poi5YXhzfIyE/EThUtrCFYtxEkc3xXC8iJpgN2pGN2iJOnHBapxP2ORYQq2daXq
	 CmGRAms9DEpeQ==
Date: Fri, 22 Dec 2023 11:45:18 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: i2c: document st,stm32mp25-i2c
 compatible
Message-ID: <ZYVovt1SmdgS58yH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-5-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SfM8nc8lNtqzF+65"
Content-Disposition: inline
In-Reply-To: <20231215170617.95868-5-alain.volmat@foss.st.com>


--SfM8nc8lNtqzF+65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:08PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


--SfM8nc8lNtqzF+65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaLoACgkQFA3kzBSg
KbZWzg//Ql52lah+pe7q8sJkG29V+WvWUxZU+A0JXdE3pcghyKz3zG46xRo3hNDl
wfHBdYj0T6jAcrKDX88BXfCiyqi3MjWf9TK18Ec9YAiRss57wd2RholFYWZCh5nf
lMcgR0+4KmHwte0CH3G+WNUd30AzwtFZy5MuNFWLj7PgNSIHHqvDd/8TFHAj5mCp
aOAnKivDRVHsv4fSCynVDqA1aHs0938+ZG6gqCR3etC13ybQy/cqOhg0e3w4Jx0f
5kVDH9UTpiliFi+ZMxI+CCtesWZ1OnzDIbURxnj6tHU4JmJcAQFVAScp4XTinSmi
DUnT/yN70dYYdzTsAj5FEUbAxTA6FKl3RQUxj7cOyQusFQi2b36DlzVy4MSrEMun
VDQpfpIid1mwc8PNnjbinOba1LXuywnx3aOXT4p2cJ5Jedhn2Mt0TK4CN8Cim6Qp
n+ezbaUyl7lWoWce0JnQZj7SzlojUxkfY8WG71TsPBQPCD4DEJWYW47bv063S5Cz
vWdd42XPQp1BgZwWhAkOPDUA+FGHIncr9ag0rDjHaBgJaHBHEU+xNj7W0G0lnCUz
7W3XGmlVZTlEi1tpsI6TNA261XNAd+0vSueyfy3tNcpxEG2tnfVvDArZu0QlrJxh
nn0pNTyLdsCMG1DU/UkBYC61gJPJbWpiEMfS9ial50vw+Hu6aGA=
=STyA
-----END PGP SIGNATURE-----

--SfM8nc8lNtqzF+65--

