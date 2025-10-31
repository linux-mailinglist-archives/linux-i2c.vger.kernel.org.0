Return-Path: <linux-i2c+bounces-13936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB06C25C37
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 16:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB3404F8A4F
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F087258CE1;
	Fri, 31 Oct 2025 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrcwX7Ps"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D6192B84;
	Fri, 31 Oct 2025 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922736; cv=none; b=GeC/pntn5BXBXlRMtIO7Q+Hf9uKVsehALYd2YBdXEMyVso78vb3gLszHFH6sq76OWD1OzvHN+sGu3DGbJ08UJCryQ2HGOYW3YJAbRF61M+Zso0hxKcNkzS2QEFBPxBNkwydhYhi5wDHsBE6ek6pFqq2gtA//xm4bBDGeuEq3jqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922736; c=relaxed/simple;
	bh=uhrdlxXYbAo8AMN1hNHmfe6mVo3BFTeqYCnXrGkeNpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge42zReCNZBAKm56ZqsoCG6rGOyr+cWLekOPC26ocv6q1B5UsWeFQxdYaFCaxC9Nx6fcNph+SQwRKWzDgeR+NNArYFohZWwIFOtHExKfrSNps/CxljkvNTcCzDM1oAIcfpUqBsPyznDlhqMPpCknQUPJNUWBuh9jFH00/9SxNGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrcwX7Ps; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAC5C4CEE7;
	Fri, 31 Oct 2025 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761922736;
	bh=uhrdlxXYbAo8AMN1hNHmfe6mVo3BFTeqYCnXrGkeNpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrcwX7PsgjjlCzk6jFzcWCxDdKSMl47XA64eKM3sNrRyfDPcpB8E6IWehmUL4uaEs
	 zVl0C7ahJqgHoFz0KOWeoLKMjaTxg4Oj1gVTZW5LM60+32FDfNMHKoXv7M0LJ5B2QK
	 7efkiJfImRETflqM9E1NrFX2duLZ2IwbZZgUdK9rMmBDX4VPEmkDmz2A27+AQRVDhV
	 ejWXw5TlXTkeBawqi4PtiyW8YR3ZVz9PZS3CAIaZQRhEOkvDMVS8Ye8dU2mot0G0/J
	 87d5xtn43QIJR2juzsIV5j3GNnIMv0lcrkmSWE9oJrgHOhMrshmJQQDUPUKzm4EOTN
	 a4OdQv8hN4Fmw==
Date: Fri, 31 Oct 2025 14:58:49 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 1/5] dt-bindings: i2c: dw: Add Mobileye I2C controllers
Message-ID: <20251031-segment-chance-40ba410eb55a@spud>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-1-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ST2W6XfdKwMk0moh"
Content-Disposition: inline
In-Reply-To: <20251031-i2c-dw-v2-1-90416874fcc0@bootlin.com>


--ST2W6XfdKwMk0moh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 03:35:39PM +0100, Beno=EEt Monin wrote:
> Add compatible string for the I2C controllers present in Mobileye
> Eyeq6Lplus SoC. The same controllers are also present in the EyeQ7H.

Then where is the compatible for the q7h?

pw-bot: changes-requested

>=20
> Signed-off-by: Beno=EEt Monin <benoit.monin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index d904191bb0c6..bc84631f28d1 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -36,6 +36,7 @@ properties:
>          const: baikal,bt1-sys-i2c
>        - items:
>            - enum:
> +              - mobileye,eyeq6lplus-i2c
>                - mscc,ocelot-i2c
>                - sophgo,sg2044-i2c
>                - thead,th1520-i2c
>=20
> --=20
> 2.51.1
>=20

--ST2W6XfdKwMk0moh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTOqQAKCRB4tDGHoIJi
0vCsAP0WQefK8Nu5rXO98P4kJI737TCfj36gyYkXgaoPsLPgcgEAi3OUS3CUlm/D
42OembnIL52BkQSEmlR7Ku1+Uzf87w8=
=eMaq
-----END PGP SIGNATURE-----

--ST2W6XfdKwMk0moh--

