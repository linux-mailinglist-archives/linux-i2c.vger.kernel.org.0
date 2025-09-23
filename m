Return-Path: <linux-i2c+bounces-13125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79DB9768B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 21:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27EB1B2224C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 19:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8FA304BDC;
	Tue, 23 Sep 2025 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VSJlXNfC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36D2FFF98
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656917; cv=none; b=jkza3g9DNW/tq6gBNFq3mQIcZa44KbjjGR1aMy8EllLRWnNIaXLrZSEDllsPDvDOLFpJWjA8Uq45ejJvbWEOYRbh4b1Dg3IPsYnWfY0focGlRt++LUrzDhzllF6+9rjfTAePxVVhktjuPqypUsKapcnTyAfb6bcHL/LJEKXR8ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656917; c=relaxed/simple;
	bh=BnpAhBlz8Vxpj5OlMpCiUIBPap8Wj6cmNHFTw3boeDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDWZtDADiEQKSGHZuyd+X6GlXwN2pvqMX/glndI25zAFOimgqTIVaTK5/W0+Owk11C/Ve7R7HByem4rkG8Kr8BfG/QHK8uqNb1vV0uVJPL+vdY9OYuzfd7yVA4l3Y8z3A6S4t61zoA/aND+V/WPmYElUPn3w+4Xx7fO76m+BaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VSJlXNfC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BnpA
	hBlz8Vxpj5OlMpCiUIBPap8Wj6cmNHFTw3boeDg=; b=VSJlXNfC9PfT6QX15qbA
	P6uS33FZyEzD2z3LeM5doOBFMqMsrJXP1Fi/zePCUmlfRJZZPXsxX9R0J8GAiCV3
	k89Y4wkSUFrW6oTWTzLxkhrutbSuaawPl6LCONXgYVveT7TcJIFk4MCsyr1hl7GI
	pCU1IZpWZqJWo7sy4VD9hYfNXmDhVj5ezmUL1RbmLB7rLI8qCO5CvV4YO063jmGy
	ZYf4O8UdQ8lEsLr8iGwMwylQ57ryGwz/Ujcp7FTEBHddFqDyGgUnRcSKdV9R6OR/
	+lo3dYABhCPqotyPNo3+F9zg45X1coc81Lhp+BjoIvoDWPyi1wTfWCG60flHqdm0
	YA==
Received: (qmail 1224986 invoked from network); 23 Sep 2025 21:48:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:48:33 +0200
X-UD-Smtp-Session: l3s3148p1@y0WTOH0/qNsujnsp
Date: Tue, 23 Sep 2025 21:48:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: i2c: exynos5: add
 samsung,exynos8890-hsi2c compatible
Message-ID: <aNL5kI5VSJwHq303@shikoro>
References: <20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQiVu5BD+7Z6lLMt"
Content-Disposition: inline
In-Reply-To: <20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com>


--uQiVu5BD+7Z6lLMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 14, 2025 at 04:16:20PM +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos8890-hsi2c compatible, reusing the 8895 support
> since it's compatible with exynos8890's i2c controllers.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Applied to for-next, thanks!


--uQiVu5BD+7Z6lLMt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjS+YwACgkQFA3kzBSg
KbYdKg/+PLwFRO5GJ69ibFyhHD4ER6dODjHUCFptee21h7vk3bhQD7DIwXYUY2+g
BkXvYytPpiIGGtbT1E6sqssesZsjr4543htiaLyAvCLyBVZkBKMPLCCaK6lTCnbP
6KOfIj9Ps+3yNaHDNv28/+SfNU/SaZV+E6ACdhOG2Rm2kz93fxCkHGfoQuPO1WqZ
bJskh5r5QqNQBZwUymgWQy1naW5q/Asoimm+BKWk2zGMonSF6bGImQGgWoZLrCiq
7bL1K4OFZuki/vyB2Rc28xccQUpmRgk84cfEXDoweMlgVYXYJjrL4MQfDhnrUz7+
6nVlpOwhL7cjSCcK/F8rNpZC6cKVedEfmjm9japqUWtRqQx9ZUjnsSG3gnYLszgq
aOQk+Q1BiQ7PkRRQMUy1WLWp/RPe4IczznHI6Z6Am4MJW6KSUs2J9lR/tAnq1kEA
qucSkhveVoBf0p2FSzCybGcfwtIfSa/aQ2P7FGQBQBWeA/zPJkIwc10COpCzseFE
GFuS1qHADiBW3NNEhvE0PSoh/1tjjk76kf9xWq8G5sz6NRR6dpwQESCB6VlxuaFS
0dIcEsBKUF9a0CJzIN3JZUswj50M5PkOq7x7AiELIvsYNiTeb753o1Dr/x/e8Hn1
JtHtjZRPZMRthBBGSi//HcvocdAdY0ODCsk6QqZuTqOtBGZBegE=
=gmnO
-----END PGP SIGNATURE-----

--uQiVu5BD+7Z6lLMt--

