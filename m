Return-Path: <linux-i2c+bounces-3985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63029904404
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 20:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D763F28369E
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 18:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0087A7E116;
	Tue, 11 Jun 2024 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XdZ0+PDC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776037D3EC
	for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2024 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718131844; cv=none; b=nwzlpxC057TzNeqqvdBTzWwULfetOtJgPdTCoZ4jvHFBYsnQpnbyNcaRrZDp2/ZkPFtcnYgtmKhTNPhnmJH/NMHgx1RqfcRaoPSrqzZFyDU8hrgp6VP6Eu+VcVjY5G0yG5Rmqsh1whcTesu1FPZWpgvOkUCNgISb7z/dAQZpUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718131844; c=relaxed/simple;
	bh=QJqYqkyXvyEJqzCyzCjtVTtnILSZj6FSjyYeZF5lv0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdwH8f8mYQLN5zggK3RSJh/ZP59XhPl6wE+xh1zCJ+WL5iNT+AsP+6IpavJgjGPUCxPG9ADdRDs8gySBFTo62eMapcZ0xB9W2Oljp4lsdrNhG70/jubAfCH6uQLJdLKzQ/wYPSUmzYqTo+5+bPYcwMWLzw1aXTBO/iVhSeKNwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XdZ0+PDC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QJqY
	qkyXvyEJqzCyzCjtVTtnILSZj6FSjyYeZF5lv0g=; b=XdZ0+PDCvsB9qeJnMpWz
	s5Gyi610tc9fF8xw5cx4aH+UD4nXdBERyx0eTBoJCQ8HOoJLsuy0jtFN+IjoqdN1
	+ApJR9hG0LHfbrzOgt47WziFg3BVJTLE7OzTxM9OM0ih6lznuxxaiadOZc8466xF
	/nTSLsejBReljD3WThHpC0p10IqGC8TyWvt1bZZlXeGdvOpcIvEhYPh4qAM34b7c
	jrFqWXZ2PxSp3N7rCI3Q5ROKcgi0DjRvQjjw/arBYIkdjIxjw7E1FXZqGZKqVyJB
	WncDeM8VCJ9c36bVOo3ngyyF1rk7Nw4Y4Pe+jG8h2oxfKUQtmOdyHhjTaLiApCrv
	UQ==
Received: (qmail 528448 invoked from network); 11 Jun 2024 20:50:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2024 20:50:37 +0200
X-UD-Smtp-Session: l3s3148p1@k73TvaEaPoVehhrL
Date: Tue, 11 Jun 2024 20:50:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/7] i2c: muxes: add support for mule i2c multiplexer
Message-ID: <dzou6uwvxnsgjmhzzhfui372bsan7jbjn4uraz6lgclibnih4s@l7lb55cvrr3w>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Farouk Bouabid <farouk.bouabid@cherry.de>, Peter Rosin <peda@axentia.se>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
 <20240611-dev-mule-i2c-mux-v3-3-08d26a28e001@cherry.de>
 <80883dd5-2be0-4f8b-8298-ca076e6ac558@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l65abzh75bgiesz6"
Content-Disposition: inline
In-Reply-To: <80883dd5-2be0-4f8b-8298-ca076e6ac558@cherry.de>


--l65abzh75bgiesz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The class parameter was recently removed from this function but I forgot to
> remove it. Sorry for the noise, I will send a v4 for this fix.

Please wait for my comments to the series. Hopefully later this evening.


--l65abzh75bgiesz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZonHcACgkQFA3kzBSg
KbZSwg/+L3bctenTnBzk2jty+XZIdBqaYWfv/0Q9sWI38wPTRj7QOS+2CVp7IMj/
e4HGYCQmVT1UamUF5bcdedgfQ1L4crkjzZAmqZLCZjrjut992zSwq+GHrVfX2Jdo
V10Ow+MyykNiQVUPMzSsOwcO3lcxp82ECBSdeDgeS/c/rfGyd5Fh3VbFXjdyA/h3
667ujGtLNYMFqKc02ghYe/LmN9c5i6l+id6DDv+Gy/UzRDjbuRfKMylotiSx8Vtv
E+ACZ1sbe889SUV77nJ/JZ+vJ9ckF6riq2NKsfQvtxGuB4o5W42m21Ni+WKxErId
cs/TUl6aQycoiC6rrCjIN0B3J39+nJuHUxqkhuZeO7nYIMe16svuZWgUCZYZ7VSK
+LY0r660fBEWlXh5e0HLerw3N+Xd+7H8Y6byuRsxO2ojNp8Ta0O2o/Pyw+33/qjF
T/yU7vvCFl1FbmgD7uR+2MMTBzDd/J0kq07JXbLZGz7XCTza2MVgrvLaaI0Ab3XJ
e17YccZDOm3j3/0S4d4gsEDu4QPBGMBd1mDlE/9BGjdRUSt4KqojNSg+wDxCjnQ7
EqxSZ0H7InLKgai/kI92hOT1+NY0brOByko0f/lOmfN7kX7ufJnYAxABnQojmWt5
s66HhO1wDNMIXqkuddwJtEwyjBvic4VQlr0+o64joXxqscYecWg=
=c19E
-----END PGP SIGNATURE-----

--l65abzh75bgiesz6--

