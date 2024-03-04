Return-Path: <linux-i2c+bounces-2131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911686FCE0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DED1F23685
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7467F1B7FE;
	Mon,  4 Mar 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obHW5v9R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2943D20DDB;
	Mon,  4 Mar 2024 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543623; cv=none; b=YwrIRQOJ2AfSilWzXvEcVKWiTwZ4rNtAhHsaGdXs82OfXO16S6cN8w06sgsvSdRW4mtnBjj6AeRRkTu8YEkmR+1R1gcgIDif8bNM2/zW0rGffGQsc2K1NOdy33mNu8EA5zSpOCgCGEwNoMVTqqfS6UOIAaRJOBc8d/SThsXYoNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543623; c=relaxed/simple;
	bh=P8nuIh++xRkNNRHSKN38/vYbt3eNpRBeOZLEj92Ny/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN70G5gRPROvNxrNqGHe7rJr9HbcTJgO7t5w7T5kyKT87t1PD0mjsU8Mrvqwx5dkSHS+++oFPzI3tTMXSpWiyY/szYXTH5/aHiJY+opuaEET0USFoIbq+vhomzerqpqPRd2Os3+KfiYglFBn4TxmoWtUEJg0TDHt9XVIU5r8Pyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obHW5v9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226CFC43394;
	Mon,  4 Mar 2024 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709543622;
	bh=P8nuIh++xRkNNRHSKN38/vYbt3eNpRBeOZLEj92Ny/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obHW5v9RjMQ9WnrWLPFMjLWV257hOelNfFeUi7opg4XaHFH1jYvsSmmWjvU+k/axw
	 meqe0KINf+My7gX+4spY/GRJTlTYWDAlzuaxT3fqLYZRsaW/xQjI9PVieQN3iyG5zH
	 PLBaz70GBvK8I9ZuFov02duFazclGcujaK8wVR7YZPB1rIWAn43scKFtsRb0bWl4s6
	 pTYo83efdcQq5E63+CfbeaC9r9BjBYp/XSd0+2ahnuStropgmtnWHr8p/jVAwcDRbY
	 E01i/kI+19yN1HMCFfbWIPXHsiJu3p1jtOJY/XiGFJTneyphJNQL9mNzQxu2n65Nea
	 cMtlmQE5fr33A==
Date: Mon, 4 Mar 2024 10:13:39 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 03/11] i2c: nomadik: rename private struct pointers
 from dev to priv
Message-ID: <ZeWQwzuEcj6E1N3K@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-3-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L0ioVPZ9vDuw4eEX"
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-3-b32ed18c098c@bootlin.com>


--L0ioVPZ9vDuw4eEX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 07:10:51PM +0100, Th=C3=A9o Lebrun wrote:
> Disambiguate the usage of dev as a variable name; it is usually best to
> keep it reserved for struct device pointers. Avoid having multiple
> names for the same struct pointer (previously: dev, nmk, nmk_i2c).
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I think this improves readability a lot. I didn't really review, but I
do like such changes:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--L0ioVPZ9vDuw4eEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlkMMACgkQFA3kzBSg
KbbC5g//d/FvD4vAs/4O309G+glAvRqqik/d5LlefofbXB0L2uWYyOJ53pla7mDx
9RSJftrY31EwgtYEDBekpt70jlzV/IkCNqq3mxQWCC0sT+k8Su9FpFRpYgA6+9Qe
NA0ssvMBPLn1RPhcuv9omX05jBwlSIbTuAdj8uF1g16PnJKKYEbxQme2DEU06ggh
y9IXa2Gq+8Txr/GqkHOhBgZGCuMkDjVrTU7ozkUpjWIlq7ltn2xcVQwHTfXlcyvc
Q6QWyAQFsuX2JUyqsYSlgxURYWficUz7ZvcJwwMB1HqqMywrXI17T09J95A/u5Fd
JMwnWgmki6FauTpz6+6taOGqZ+8fCSI6UvjMz8nzgy7Pm3jKY38QSj0wmePXfpC8
PXwjVjYCstrVnXAD3r54iAByGVdaysVD91t4BaPb542jM7EvvvE0P/ebmoDXgY65
sAQY2Opm5R9Hk/YPWbW5+995BRKJa7Gzl9RmFyQTKTpF04tOLJQfK2CBXYtVhCAU
pQF+a+Dh4lQv3/flGbCPGTq4Oup4Q+EAmSKTW2vv5a7jK6v9UF0lW0W2MOJ3z9L4
JoFQYVYUABAFqADbiLATtpHiUTeNXobzuuqF4DjOyhXrnWt9l4tebG3xS/bylK2r
hOfxVGJQgqYN8ZNgB29CF4rv4kIRz721CFxKghSlqn6SxZTYM5w=
=WUmR
-----END PGP SIGNATURE-----

--L0ioVPZ9vDuw4eEX--

