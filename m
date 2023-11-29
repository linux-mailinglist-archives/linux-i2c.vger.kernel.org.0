Return-Path: <linux-i2c+bounces-545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C97FD934
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 15:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22029283035
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273AB3065E;
	Wed, 29 Nov 2023 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L80lP7/D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521D30340;
	Wed, 29 Nov 2023 14:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4E8C433C8;
	Wed, 29 Nov 2023 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701267817;
	bh=uEINnHilNNToAZ1GUBzJz7tVwPdn3y3/jPZhz8a3h3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L80lP7/DmFjx490yhyox7mwpHFUwjNzTYtOjS2so9TvD4ri5AnHVF3lE0FbCWeVpX
	 riTz70eyypHC9pvz2VTcNGuSaKjNgAqPV7b3nhobMqbe0tc860r0tI2NrIyRUgjnO9
	 DRK5oFj7Dd+jtzQMWsgBgs43xVCPA9l0odYE6PX2f7Wb5hkQcIzM3S7kpImE/bopUX
	 QojwpElox1iuTbWfjDCPqion/nebzRC1EJX3PkPK1Z9M0Pz7gAHMbHNfiqvMB8vPHx
	 8e6Lflr9nevBFjB3KuP7Pd9w+VzqAjCBvfOIaRJTMliS3wJpDx5136pJRNTHh7CUxF
	 W2+7eVJkjqL8w==
Date: Wed, 29 Nov 2023 14:23:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: i2c: document st,stm32mp25-i2c
 compatible
Message-ID: <20231129-haste-emperor-3a8ba335b267@spud>
References: <20231129125920.1702497-1-alain.volmat@foss.st.com>
 <20231129125920.1702497-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zQpTz0PrtyWzX5co"
Content-Disposition: inline
In-Reply-To: <20231129125920.1702497-4-alain.volmat@foss.st.com>


--zQpTz0PrtyWzX5co
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 01:59:12PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 49 +++++++++++++++----
>  1 file changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Do=
cumentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index 94b75d9f66cd..6a69bb6de23e 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -19,6 +19,7 @@ allOf:
>                - st,stm32f7-i2c
>                - st,stm32mp13-i2c
>                - st,stm32mp15-i2c
> +              - st,stm32mp25-i2c
>      then:
>        properties:
>          i2c-scl-rising-time-ns:
> @@ -41,6 +42,43 @@ allOf:
>          clock-frequency:
>            enum: [100000, 400000]
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32f4-i2c
> +              - st,stm32f7-i2c
> +              - st,stm32mp13-i2c
> +              - st,stm32mp15-i2c
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: interrupt ID for I2C event
> +            - description: interrupt ID for I2C error
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +            - const: error
> +

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-i2c
> +    then:

Should this not just be "else:"?

> +      properties:
> +        interrupts:
> +          items:
> +            - description: common interrupt for events and errors
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +

Cheers,
Conor.

--zQpTz0PrtyWzX5co
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdJYAAKCRB4tDGHoIJi
0g/dAQD+vb0YxP+0kOTPgO9Ix2HQBWIP8nOO1XqZgVw+O7daxQD9HemclzlDL37e
tMu44zbX0HySlWbw3cPX0YDONRIM3Q8=
=2fR5
-----END PGP SIGNATURE-----

--zQpTz0PrtyWzX5co--

