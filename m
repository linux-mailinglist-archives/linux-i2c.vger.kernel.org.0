Return-Path: <linux-i2c+bounces-918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2BE81A7C2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 21:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313082872CB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 20:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD82A1DDE4;
	Wed, 20 Dec 2023 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WT8jKLpK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAA648CC9;
	Wed, 20 Dec 2023 20:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED26C433C8;
	Wed, 20 Dec 2023 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703105410;
	bh=SCTbrl+xMgjd0CYmPII6l8JIdLWbKGFFqcXQV4hU7Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WT8jKLpKrZw9XXGQ4JrM71qX73Yf8H9Mzqc/5+oMasmITzQ4Fll4XHG6N4SJfTOgq
	 ruYJZiAF217gcZxpKijTl+hR2t1hCX8YvP3K66eJLCXeZgctXtnscPd7BFN3oa+Hep
	 tQErt7pscHlTnJwOORpt0UqFpWYmdFjvEI5kM4ZEGZMLNDy8LIQjO3NZ9Oei2N+Dz7
	 hvHV1ZUz96OYk0BZ8UX3zz8X95n8sPuJCqPF9BZXXDxUoFgeOkxyIJjfKGaF/LmCe9
	 +wX4lErRROth1flFcbXcSYa0W2cweQMTK9rIQngZDKFLQYJR72UBBToS6YtSV09YgD
	 XNHDBThvJXi9Q==
Date: Wed, 20 Dec 2023 21:50:04 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom
 properties for MAX7357
Message-ID: <ZYNTfKLFGrLq8qGY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231220082803.345153-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9k72YHBHIjnGiFBv"
Content-Disposition: inline
In-Reply-To: <20231220082803.345153-1-naresh.solanki@9elements.com>


--9k72YHBHIjnGiFBv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 01:58:01PM +0530, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>=20
> Maxim Max7357 has a configuration register to enable additional
> features. These features aren't enabled by default & its up to
> board designer to enable the same as it may have unexpected side effects.
>=20
> These should be validated for proper functioning & detection of devices
> in secondary bus as sometimes it can cause secondary bus being disabled.
>=20
> Add booleans for:
>  - maxim,isolate-stuck-channel
>  - maxim,send-flush-out-sequence
>  - maxim,preconnection-wiggle-test-enable
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Rob, are you really OK with these bindings? They look more like
configuration instead of HW description to me.

> ---
> Changes in V4:
> - Drop max7358.
> Changes in V3:
> - Update commit message
> Changes in V2:
> - Update properties.
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b=
/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 2d7bb998b0e9..9aa0585200c9 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -71,6 +71,23 @@ properties:
>      description: A voltage regulator supplying power to the chip. On PCA=
9846
>        the regulator supplies power to VDD2 (core logic) and optionally t=
o VDD1.
> =20
> +  maxim,isolate-stuck-channel:
> +    type: boolean
> +    description: Allows to use non faulty channels while a stuck channel=
 is
> +      isolated from the upstream bus. If not set all channels are isolat=
ed from
> +      the upstream bus until the fault is cleared.
> +
> +  maxim,send-flush-out-sequence:
> +    type: boolean
> +    description: Send a flush-out sequence to stuck auxiliary buses
> +      automatically after a stuck channel is being detected.
> +
> +  maxim,preconnection-wiggle-test-enable:
> +    type: boolean
> +    description: Send a STOP condition to the auxiliary buses when the s=
witch
> +      register activates a channel to detect a stuck high fault. On faul=
t the
> +      channel is isolated from the upstream bus.
> +
>  required:
>    - compatible
>    - reg
> @@ -95,6 +112,19 @@ allOf:
>          "#interrupt-cells": false
>          interrupt-controller: false
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - maxim,max7357
> +    then:
> +      properties:
> +        maxim,isolate-stuck-channel: false
> +        maxim,send-flush-out-sequence: false
> +        maxim,preconnection-wiggle-test-enable: false
> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> base-commit: 76998e5bcdf155b36c7066808a0a65b2ee13cb2a
> --=20
> 2.41.0
>=20
>=20

--9k72YHBHIjnGiFBv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWDU3wACgkQFA3kzBSg
KbYCtg/+IHnU4Dlg5ZuJoczu05tDkIEorMC7QYYZauBkjd14V0PJuzdaQYYs6JBe
Z3uEZyw6hNx5fZT87YEH/hXEzmTVAIRuOUzg2aEVmPPy7FCUD8HG0I0siUJGWzSX
eASSmz9A5YaZS/AFAhPg982vespbLVtd0gubN1b2dabx+JCZvEyt2UN4ooiw7IXD
MdXWye8/RruXLZUMP+LehEmUi7JRbRNP8sBJISEIi4xnel6VLHDvIHKo31JWXjMK
6jyzMgIK82gHW1vOHAQsikKCQMFUSsXHBh2qDV9nMNDJc5LRXF7n2ujt+jgvnzSW
EwP8lRYyHxPGwsYYSdxRJ7QnfNLDvAsM7VEN8StXXt8Hlt+NzpJO6bIO69oKtNHk
21xEVsWlgS62W3p9Ro92h2HaircFk4iEYXHFW6mXhh8RVQfz+pNpAz3B1HfCp1e4
nskkKJPVOB7rchZvhf/dStDC9pZNRlXSO4A3irteWU2YB8RI9oFWkfLjAUGoNuRq
IGQwoEAJVA+ywcHp/dO4xYxzTlDK7CBns5TrGWxC5ke4mKVxOzvVjZXgdJ5rzUAB
RFoQKQ/AD08vPHh6lQXweShhc/h8oJEvvWfBZTH5KW/oICFUDyRU7oTcbtHf68JN
7JMP3aC6jApo69gofOmPhT/l5lj77PhuOh6Dpvrsdoro84pqf9Y=
=982l
-----END PGP SIGNATURE-----

--9k72YHBHIjnGiFBv--

