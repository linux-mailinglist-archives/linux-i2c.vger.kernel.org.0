Return-Path: <linux-i2c+bounces-758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BE880F40B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 18:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB751C20AF6
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 17:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F6F7B3C3;
	Tue, 12 Dec 2023 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAi0UICm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913957A221;
	Tue, 12 Dec 2023 17:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA70C433C8;
	Tue, 12 Dec 2023 17:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400862;
	bh=J/lDad9QrmDvv4QIJLMBuzqTunxmfmWR+ks34mIko04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAi0UICmaENZ3T+M5TG7HDCc6sJCcZ8HaQJxeGXrjzmPUdaJtXEQHQJvGQWzzKGEM
	 bEv2+iJ+NEw7xlqJDyNxi7j81X9Y444vBIOT7c+bRgpWKqQPygU/twIWYzgPowxlfS
	 J1SZcysNWY8o/bnTrZwtIRiUXLD5mo6D1xRoMh7yFTKkUWp/ZEZ9eGDjXF/ptE+x1Q
	 80nmw9+aEJ3i9RaO0ona2ewwPe2cyl0Wdk74F3ITBtMnv7C6l68pXwIIKcVE/WMEqu
	 Mj6sXaPiHAxKU5wZHt1mwHLPkEdo1lRq2bCTVZ22X28qZFY5SVXoq6JIPrF851KP7T
	 JG2NxvQ1d/r4g==
Date: Tue, 12 Dec 2023 17:07:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: i2c: document st,stm32mp25-i2c
 compatible
Message-ID: <20231212-slander-violation-8893701db296@spud>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RxsCoi3prQ3ojpc+"
Content-Disposition: inline
In-Reply-To: <20231208164719.3584028-4-alain.volmat@foss.st.com>


--RxsCoi3prQ3ojpc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 05:47:12PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RxsCoi3prQ3ojpc+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiTWAAKCRB4tDGHoIJi
0ia4AP94GUpXrWSgXUwTiHVQEqUOc5uleAfgethSzbxUEhDU9wD/WJXmyLAmhwPA
9/YV+dk3M7vTu6PZXunKOZOX/JRu4Q0=
=iMKk
-----END PGP SIGNATURE-----

--RxsCoi3prQ3ojpc+--

