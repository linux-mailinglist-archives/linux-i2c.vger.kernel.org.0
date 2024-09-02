Return-Path: <linux-i2c+bounces-5996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3299686F5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 14:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B0D283D2B
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 12:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B65D1DAC52;
	Mon,  2 Sep 2024 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="U24EiZf+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00726187335
	for <linux-i2c@vger.kernel.org>; Mon,  2 Sep 2024 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278677; cv=none; b=W6iVD15LUBSPHhpMbGhk2/bb5W6hrpCzKG7A0iCChZW1Tq3c5BXKN58oetOxhZ4vQPlryElBrSQkXZPlbvc3QbaGDCfyk3a8mfdHo4zxLc2ZtQDkDm3SXrIW+1qTVnxFppeyKgaO8wqEdekvfG93rAXrY20XYxus+k/zK3qz5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278677; c=relaxed/simple;
	bh=lox6fW5epfgn4FAPDOXF3hh8zz8KYkeL5GbkYrNl10o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1RAaBmexU2oGwVr0W220ktPwH0T1KsZUyU9rizCOes68eimVs8nDHKofMOSpvv7vniazvwYFK7fYCOXVTMOe+ShJEfn4eb3JZZkAQS524ulbQc6C7C6Q+S1xW/QGBs5Nd//glgLJGP7d4JOgYeC2MLRaxPcQKF7VoFNrZHvQ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=U24EiZf+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aTPi
	xh1xqAuaI+tu+rlRAeX8nd6PO5C2gotdlBn4iT8=; b=U24EiZf+33S03r//eLXC
	9WDpGH4/MzYRxw9xfHW7IZgeIwCrr+GSjZGrEouBaCSRx/2+Nc6dPxXmdRZMvtok
	gyv5Xg+Eq78PXW1QQaESLx2xp1zsGqOYrOnVQeji5CsKK4sSBL15j9tWsjfO4DO8
	+nK+kJ1I77mfL3jljszVHw9s9jSA4pD2e/vkyF3wfIliWYOZDyQ9cKJyuT2kxncR
	d890AHX/fDu6imZVLTNWzYhuyfR5lSEKZs62/0GaqmqNhaY6yAWRE3Nwo5DRbdwW
	zcB+kXVoBSRHgu9w6kMHv9SxZoCjFKBuCtfjog698+WBSRT+yI5ZYUhPUlbXAfmt
	rQ==
Received: (qmail 4102460 invoked from network); 2 Sep 2024 14:04:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Sep 2024 14:04:29 +0200
X-UD-Smtp-Session: l3s3148p1@eLc2viEhEt4gAwDPXwdRANgvu6DX4+2c
Date: Mon, 2 Sep 2024 14:04:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: document
 SMBusAlert usage
Message-ID: <ZtWpzXtaQFRd0v_s@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
 <20240826150840.25497-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdXiOLPm11-nBnFPC4pRa0WP1VviwCwYVVPHAeHLgXLe0g@mail.gmail.com>
 <ZtM3Ufj1akqZckuu@shikoro>
 <CAMuHMdVEBVoBmWVKiVYcKp0As6mo=C9u-bHFwt0zPeRbAgCkvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ak5lBGLc+wP53ZB"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEBVoBmWVKiVYcKp0As6mo=C9u-bHFwt0zPeRbAgCkvQ@mail.gmail.com>


--5ak5lBGLc+wP53ZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Still, this interrupt is not a property of the R-Car i2C hardware block,
> so it should not be modelled as such.

Hmm, you are probably right, given that I need this in the board DTS:

===

 &i2c3	{
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "i2c-pwr";
+
+	/delete-property/ interrupts;
+	interrupts-extended = <&gic GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>, <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;
+	interrupt-names = "main", "smbus_alert";
+
+	smbus;
 };

===

I have to admit this is not exactly pretty. Pity, though, the I2C core
is all prepared for the above. Seems I have to update the core for
"alert-gpios", after all.

Happy hacking,

   Wolfram


--5ak5lBGLc+wP53ZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbVqckACgkQFA3kzBSg
KbZ4FQ/9F1MSfeHT1DMYXHo+XVIYSf0S4IDfPo5hWKb4vn4n18ZyN2rOoGkJT/ak
0YqkK8UBtRaypQ0hcV5HoNmniZloNw7lezyiAJRLa5fzhNw34yQxjqISTizcB42u
e77c0KFh3s8ILvU34zBCDG/PQzEAZOIfUH8BChwDFdKOWORofdEMkdui8zrBe/of
bGjP/DVJnzA1cYYJMAirY2HUjbWasttHY7hnjtJyaGvlCuyuk8I7JDu3LXIkK9wH
3X42WUatkdmmegqddqaknCZszNMRly0jJV/Uhy/FHSSANaSR2MqW14IoEDIcwa+D
ebcNLENqYzed/jwPOS5j7SmnjJ7fQlKvh+cCH8Gi4apR+ovAvig0kDiTLp9ZCYib
gsRBnXvcINk5TlHNJT6l7V64j+UiTeSlkAHxUu6PFdboYqs9De7OY7vO5ZmljVpF
Zba7IoXMqgps1QOluwCBKAUVnanAMuFd890swfDPWMHAqxmQg5Kw3uxeOaWqJ6Eq
zFpqxojviNfFhunQLYLeZOH3tfAdK/iEdP2YOvJxuSKMjjnoc9gmm30sCIfCTjAj
LwB8D90RD4zLAOPOKn8zQg1y9vyDZk/TwJms8XAWP492upau2lHqMAjtmOUgZqAk
CbtCwewt55n1LD5bzDFnslUZF2vQmjjma2OAL9seRLZvep4nxc8=
=E0V2
-----END PGP SIGNATURE-----

--5ak5lBGLc+wP53ZB--

