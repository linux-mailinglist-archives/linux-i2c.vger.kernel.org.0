Return-Path: <linux-i2c+bounces-5207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7694B922
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 10:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14CF283B2F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63696189903;
	Thu,  8 Aug 2024 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="izdHQVC8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72BC1898F9
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723106293; cv=none; b=ThEDq4tT+H4GiFdf80SuSWxMfo8h7VlrxVlKPKalcVzQ1jTfB3Ud2mHlWAUJqicmIsIHh+9LBmN4M4dweILr3pjTUOkVykXUxrAhM4iqr6B90MbfiOVWXapdvVQhxuc91jrTSRN8A4yVBMJmaqVV/0BA9BOy5fv31YcMWL8hcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723106293; c=relaxed/simple;
	bh=FTitw4ONbiIRDoZiBnYisEasbn/aK6qsD42rfDDtdiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHPnmPgLDW3T1rHX5SDaBqiOuqn/g3jwbc3bJWzW/12K/iQZdnqwfGYr/VlrlOnmxjN7GZE5N6qRrj+BtnWXLHwRQYwQPPs4s6KKz7ZN3GsfnFqkWPEhoo+xtxlf0myJg+UT9LRw670FDHfTPe/sUk4cC5Qlwpe0chyQWUy3Ytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=izdHQVC8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VVrH
	gi6qcDf24C34jG9fj+F0XNS/hwimz0FduHhSN0o=; b=izdHQVC8/I306hJXFOtI
	PPUpRFDRE7BRgYLSimvTVsDrt5OCJdyZpuvk6MzDdJAosCB7FkthvuLQu23R6IGP
	XvrIEn0dW7ErzVKV/fM2CeP9K294xzF2+LVT5o836iN16prfeRLRo4lIq6gijyCm
	Ar0MLQYLjU4G0TAzBvUN+qljrlH27K1qW+/s6FRqmOAPiP79mNsP1sMQH5TzAn7a
	16Ymm7BqoBuIwCTcOtDwqIqzDz0k+zeK6CpTGtUbW5xz/MV1krGmbEcxjeCT9Oj7
	lwrmn28fSapkl9xwZDLwC5EBCo4Y+TRoid6Z3BXqSBWZOtSMn0XTLIZJUCeBNN9h
	oA==
Received: (qmail 248714 invoked from network); 8 Aug 2024 10:38:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 10:38:05 +0200
X-UD-Smtp-Session: l3s3148p1@FQ4S8icf4pcgAwDPXxLGAIH3oZkcU6AS
Date: Thu, 8 Aug 2024 10:38:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 00/11] i2c: riic: Add support for Renesas RZ/G3S
Message-ID: <ZrSD7ZCDAgvAu9EG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YfZ954GBjdQLmkf8"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>


--YfZ954GBjdQLmkf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

> Series adds I2C support for the Renesas RZ/G3S SoC.

So, I will review this series today. I was hoping to also test it on a
Genmai board (R7S72100) but I have issues with it. If I cannot boot from
it until tomorrow, it will be review only from my side.

Happy hacking,

   Wolfram


--YfZ954GBjdQLmkf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma0g+kACgkQFA3kzBSg
KbYOzBAAh3nugwnzIf5z9qZk2CgkzEAghntACi0WA2kCs/FQyYDRe3XP6Zu8v9J8
zALNXE04IuURGcwyN0Noc09ZbyADAIQUuf1hhm0yUCiud+eCnNs59HMl/I112Xai
vP7IrVaEvqyHxPaz/1gLOKx1iqT02Lk9MdUeY2/HW9k8IgcIhIa57TpRhZdcdOOl
Qm2OQTX3E0GxOpNZN3E2rL1ibxMYEuNoHCSJZuAYbMWQBKzb+k2d+/ebMuxALfhE
vNzogZSNxiqlzI9wMKoYhyrUsIgp/7+j5RnGM0FpnQlV+u0ZzV3ogYldNNzhTpDr
Q0BjroWFiBWOQ9f1zj8xjJjL9Ps/IHdMlWQaMAhnGTLmpQcfY8zclHAEPG/3k+kF
8aU2jx2S7kXVSpZsieQFXOJXr32wAUNbO4lStc2QIFK6G+x96H3lx6F62ki9h5B6
4eXPCKcuC7C+fvqnGPF2zT7IvWqCIeGYu3YYKu1BX4PF2emd/3W4Emc97OWLe5s1
tUL3xRGqj+7NbWbLSR3NaiLYb+lmtBkxOIfVRmYCBeHa9CdD8I1ZDyqpwLsnhqyO
KDRu4v9fMFMDcqygGFVOEPen2onvMkVxzhs7O7oxPetq9h/yN4cw4oD2MHeEFYWe
tMlL/fvCglcGlBtiG56/PRyd2DTjht4E8MVpcn7KHZpjt18xqfA=
=nBn0
-----END PGP SIGNATURE-----

--YfZ954GBjdQLmkf8--

