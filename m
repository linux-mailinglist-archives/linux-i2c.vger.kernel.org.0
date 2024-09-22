Return-Path: <linux-i2c+bounces-6918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDED97E3AD
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Sep 2024 23:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D226280FFD
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Sep 2024 21:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25DB76F1B;
	Sun, 22 Sep 2024 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIKkx/Q2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD16CDCC;
	Sun, 22 Sep 2024 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727039558; cv=none; b=SSY0bHEYIkJNO6yBWCnKkelsQwBeQA8qh1T3RNBfy/sHZ99/QpBK4UNnba2Z/EX91xx3Zm4kObr2KLlmaEK34kDdCSEYej51AbRUivJAdMtJeWIl7GEoSYzuTQcAaOM37gXl8wN+zUcatAK7K17g9D7x0IKXb/wXdNYJFzZ9Cxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727039558; c=relaxed/simple;
	bh=Af3MCPphLi9T5OufNL1FwKlpj2eIIwiy0ezVtjS6q0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXBh/M6QKPR4chLtknjW0y28WaQhW4zCNqrG2FiE/k/CZID4Axe9NlOUJfZA3Zh2Esd5tCpc4OfkD78+jXhZ7myc3P9DMsE+MMWJGpIbZc4URKwSIjC+HU4fB2iK9SpvDDXyJl6foKB0czUkUZOGkdf2qgeFokkC/Qk/27w7MGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIKkx/Q2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFCBC4CEC3;
	Sun, 22 Sep 2024 21:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727039557;
	bh=Af3MCPphLi9T5OufNL1FwKlpj2eIIwiy0ezVtjS6q0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIKkx/Q2X8a3bWCGtrYl3Lq43WA2mpeDsWNQf8nydDP8iceg8Le5fTE5Y1BfnH5RV
	 +EULVkJitD5+//TnuzYSNVipjClDUrXmM7aIzDyt8ZiklhD2inl5sZZHEGbntNNwy8
	 P8S2tzSp1slYDtmKHRLe3RWIeAlSOnSZa3b7AOa+Uf5tV49TXCHnSx2KHfT6O4+GWk
	 ZlQz5kT/D5wfN5eHC1Qdb/TwKoyazbhX+6XCdeUsGycKyWLO7ZNtakQ4KgG+t0vOly
	 XhoHzNM35drFeiYLFKRMWMabPO8LVnRhkmQx7YYyUxqyNJfpC3Jj1b3XWk2+FOmXNY
	 4bXzxuLfVcoyA==
Date: Sun, 22 Sep 2024 22:12:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: add ti tps25990 support
Message-ID: <20240922-delouse-yo-yo-c97d0774ec97@spud>
References: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
 <20240920-tps25990-v2-1-f3e39bce5173@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFeNr7/F8ILTzGvI"
Content-Disposition: inline
In-Reply-To: <20240920-tps25990-v2-1-f3e39bce5173@baylibre.com>


--nFeNr7/F8ILTzGvI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 06:56:12PM +0200, Jerome Brunet wrote:
> Add DT binding for the Texas Instruments TPS25990 eFuse
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--nFeNr7/F8ILTzGvI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvCIQAAKCRB4tDGHoIJi
0qMjAP9j+2kLi3Snt3QjbxO8A0L1QDvNTdvEOfxIKreHqgvmRAEArTjvJkF83O3g
bf/jVwkrdw457HrdVpnb0Kdf8ZLLWwE=
=CS5W
-----END PGP SIGNATURE-----

--nFeNr7/F8ILTzGvI--

