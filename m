Return-Path: <linux-i2c+bounces-6057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD1196A6CA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 20:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2021F231B6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 18:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D038418FDAA;
	Tue,  3 Sep 2024 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U/yA3uiw";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="BZWB11Es"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-30.smtp-out.eu-west-1.amazonses.com (a7-30.smtp-out.eu-west-1.amazonses.com [54.240.7.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E2188902;
	Tue,  3 Sep 2024 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389153; cv=none; b=ryDGZdhRmgfcOgGSFTfVPuCrRBrbjFCH8WyLPQKwkDQe54W4di5hpQc2HfeRxk5UoTWyW/y+2wq4c0RLcCioGlEimqHKZa9/0QzswWC8kEHR1Gem+RX6dQ0sf8Grk2hsArKZo+71LD6bKxcVt1jzbrzS2btk04cCEgI//7dxs5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389153; c=relaxed/simple;
	bh=FUY9hYn5geADyH+kdrj52y9UIdFcNquhedRUD29Fsik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ1TxwmlprkG67iFTJOtwUi6iTX/J55TOu6CNIILI9sbvfOFCc3JilEWnLpq4L/YH4+fJ+NLAC/IRWN5pxv4FM+Zk7/QlhjRRJBmZnwZ2tMB6iYENySERjlXqBjx+1xdOtjBo1yVAKTOvonWvgd+7yd7zLBJL0WwJrt61pF9c6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U/yA3uiw; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=BZWB11Es; arc=none smtp.client-ip=54.240.7.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725389150;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=FUY9hYn5geADyH+kdrj52y9UIdFcNquhedRUD29Fsik=;
	b=U/yA3uiwzFGhejaMOTgEn71VUbXXA4FtBZKW+nooVzpoxugqe1P19DU55BH7S1pI
	2xC3f1sWZQBpmUiFkAOAdfRg9hD3BOze93fxdLv9Tr9C/gxW4zJTDoJ68wj0QJlFG0S
	A9/GnWCR3JXmCIF74c6CIXzscPSXtZYyUEIIdOEAnuCa172F8ymtsPs8PFwxImrKf98
	pwQjUzd7oWkwJqY9X3P0u2tgBW2ral/qnITw38Qwm0oQheOI/+YnKWy7qbkFSeKSjGD
	zDksJLtJYrlVCuQClX3U6exICA2fyJYhadYW7YSFiqtdDSnaq5BKOVWkNcSPg6iOPMm
	0swq0dJqng==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725389150;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
	bh=FUY9hYn5geADyH+kdrj52y9UIdFcNquhedRUD29Fsik=;
	b=BZWB11Es4si9zzmuv6tVg/epWhn8fEnKy3A0X/YeeZ0hmSMFSO1jNpT2bOCcRkwy
	2ne/IOOnfd5KnghclRpq7Kk2+OUzCVhVKUTGQbGSgPWqsEfzFR0uLX9VbUrkdKwDHj2
	024+N72czJ3qCAy2PFJjB/BQwKKJCu7cV2uU3Nwc=
Date: Tue, 3 Sep 2024 18:45:50 +0000
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Message-ID: <01020191b9351729-306930b8-deac-4ce7-a447-dfee781cf267-000000@eu-west-1.amazonses.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-4-detlev.casanova@collabora.com>
 <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
 <12506188.O9o76ZdvQC@bootstrap>
 <ycbhqmkwz2hirnvp6j47kz3cxnli3db3i5ah76gngrezs5ww2r@57x2gxnr5hyk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zv4mythi77pto3d4"
Content-Disposition: inline
In-Reply-To: <ycbhqmkwz2hirnvp6j47kz3cxnli3db3i5ah76gngrezs5ww2r@57x2gxnr5hyk>
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.03-54.240.7.30


--zv4mythi77pto3d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[remove a bunch of people from Cc]

Hi,

On Tue, Sep 03, 2024 at 06:47:17PM GMT, Andi Shyti wrote:
> On Tue, Sep 03, 2024 at 11:59:34AM GMT, Detlev Casanova wrote:
> > On Tuesday, 3 September 2024 11:46:00 EDT Andi Shyti wrote:
> > > On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> > > > Just like RK356x and RK3588, RK3576 is compatible to the existing
> > > > rk3399 binding.
> > > >=20
> > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > >=20
> > > I will apply this after 1 and 2 have been merged.
> >=20
> > Sure, although it is not really dependent on 1 and 2.
>=20
> yes, but I want to be sure that everything is coming in.

Why? Patch 1 is not even for RK3576 itself, but for a specific
board. I would say the ordering is pretty much arbitrary for
patches 1-7, so I2C could have been the first patch.

(no pressure, I'm just trying to understand the rationale)

Greetings,

-- Sebastian

--zv4mythi77pto3d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmbXWVkACgkQ2O7X88g7
+pom8A//QngGZOrAOUAOYiA0FZniXpg8o7yPHD/P8hQ5TZ/Ul2p9fO4AI4a3/qZZ
oVZ4zwzw6cEFu25LgelCfbhfdxk5UmKVW1iZDOXBnTej5SKSxWKghFAl4IUxxdrw
2heZBl5ay8rN/o8VYVfQT6uxJ5mnE/aM57/2In/3FAg+8ENPgVnCUY1t5pPA3bkf
aRO6dcVivniOgi1MU1xsTkMvH6ronX1MQquePQUdXusaxL1OLPL5Ic6rzczalqdX
OGyRjuJXLoEEdz59W7fissu3yDzGL0etSNsrM8fFQTdLTh3dQPnLeOwlhtKrvKfF
sPYUlGflQYRwwt3FFIDU7/Mt82WIA72f9EOhIMLBO84FvAnxYcFbTlvPGdsiW4z+
907lrBZovjLVUEppl2jTYN8wdL7DGguJ7l8nHRnXmQPkD3JoNuevmSTNnsbDPL0s
I6fgxjImNPtcA2HSHoZw9Vj+M8T7vQsOIFkgEAV4cFwFrefAXsVM7h0fGTT3gp+O
z/KkoLisffVnY9p1VsEUyRluA30kV+cL7P7yIdimZEzqn71CzJwP4nyXQ26iIZtk
WYd2/43OewrskJraciciiKok5+U5WBYZcUWellWDYhkwaCV0+WpZGzIV0zXEIFtt
+fa1D/WGGCx7EBovacX/EgocLiUkKbSqzQ1DQuje5OZRtGiZCQ8=
=vDja
-----END PGP SIGNATURE-----

--zv4mythi77pto3d4--

