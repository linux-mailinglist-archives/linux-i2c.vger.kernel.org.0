Return-Path: <linux-i2c+bounces-2772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E3899900
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 11:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21726283708
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C18415FA98;
	Fri,  5 Apr 2024 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="W/onljMv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493713D265
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308147; cv=none; b=gR2y9d6iDn+260ktXXhVsGYQAvx+tBiPuV7rTfKD5UONQq/ikRX8obU18G12b91Xy1+n6c+ITTQiX5Yi3g5l3kIFRZAcAH0H0HQEEtgIdsqzx0qNXkHko8FRRxAMWq0nSAmM8Z2ILVFrMc1fWnTV+BWPfUhdmuNjFEasA5edbgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308147; c=relaxed/simple;
	bh=DbVk91+o5nSDhOqZBh5IViCpXtdixNlDJeRhroiF5gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYwRYHAgKVyRcRKGNF7XLzSW9VvpkN4PyuvE7UgCBDeJuKpM2Ni0Ny1gT/nSG7d1c0RTHXgsdg+xnq3315dJbHJ5WxiMPrmiA9+EEEP44usQOCL+wgVpyvAJLNZJW774uMF2dW4NMl+j+Mh0PnexfnUdhf6QtO9qVy0zzsB+idE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=W/onljMv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1ob6
	p679BP1kXxXJmWfnVsLpiMLC6mij4OOJIE3SFK8=; b=W/onljMvLiSzyTriq18J
	KFANwsGw0BHgXqEN3hTlbHKY6usbzn6wuHnVWEgPXHOAno5snhzuwVKYIJyFlyRv
	CmW6nZuc+E/Vp7woBrrRSyFfkVDph5iX3thbvD5ylMI04Zge1aF5yJsJie0RKHW0
	xeidJqX6I3Jntxxmbd0/v5SBr/ZbQuz49aswxUJPXgCzaQN7EXxVugPUM8cU4e21
	EdnjzTBXIEbwQt/CXnGalcrCEmtI9L1bbzlXyVs06tXuR8woGBfohvp/jKUHXLN1
	Q0nRTgEdhqBJIL+oLSmWJS4dWHng6F1k7KfYL3x1fPRz5Sjy7kFAsKmiXfZ5l92g
	Mw==
Received: (qmail 4052702 invoked from network); 5 Apr 2024 11:09:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 11:09:03 +0200
X-UD-Smtp-Session: l3s3148p1@87abzlUVlJUgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 11:09:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: add HAS_IOPORT dependencies
Message-ID: <osgkd7mfd5jhl622hvybsbuaqp7awxcm474zzzlbpxkvxh57l7@hpm37bjuandj>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20240404143351.3950179-1-schnelle@linux.ibm.com>
 <20240404143351.3950179-2-schnelle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yoyydqm5ksdblrwj"
Content-Disposition: inline
In-Reply-To: <20240404143351.3950179-2-schnelle@linux.ibm.com>


--yoyydqm5ksdblrwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 04, 2024 at 04:33:51PM +0200, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friends at
> compile time. We thus need to add HAS_IOPORT as dependency for those
> drivers using them.
>=20
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Basically OK, but I am asking this question since last June because I
couldn't find that information in changelogs:

In RFC v1, you agreed to drop PARPORT [1]. Is there a reason you haven't
done this so far?

[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20211227164317.414=
6918-11-schnelle@linux.ibm.com/

Happy hacking,

   Wolfram


--yoyydqm5ksdblrwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPv64ACgkQFA3kzBSg
KbbENg//VVefPoDsfWFtpFesNmoWTMKT3BaUpB5GSjub1bFY9vrws6fGi026h1In
0lplBJ/zwyIG31VXpG4GCqH/XK8eh972sVmaEdnzWd+0yN0daoMgUXE6VVvfN6gV
Ysl+wieYgvnFAudMDIBZQyCDa1wL/alc4vJ9qcYn01bzrAjhsg+45FzX+Ph5C9hB
VAnvJAiOKk7q23S67Eg2pN4K/wWNRMHTpzJ7jgnG1Ho8nAlJEW9wDc7Yti+r8PeV
Rjnvd5ePIgWuDVfmpjnsSboyJyL9rADvbj5MN1WodN7dQ4/hVh2C53PeyL+HI3eA
uh0idJPex5MhO7GCbbtqwcziPBweV36CIbOZVWGTzZqSdhzBAnfwjBIbaQRGoBKI
0ucLuc+cacaSB16hIJnXtiQ33KEMlAm+L+zKzSg6bY1Gr20jX4B3VKCS0wXZ/tUS
Jk2+kkxJdYqTq+a9Em3MZ+zzurvZSjxdcOw2rUKk3YmL8pNFA7+EyH2HJueCik8x
95uFzl0o9TMXve5R6Wl0t1Rrnrc1puYdG1/2U5XAKrS00fdxFTR+PLLXe5hXOYmW
4qz6AqeYQqnR04iG6bVKqk/SQ62sxh1gJyDPB2RJHXapWOI88pxNfhSiB5cumpjw
YiTipfp54bGUCZI20fZ9woqWMI+EiAveiSjJQzAW9OEv9OpTETU=
=+dqv
-----END PGP SIGNATURE-----

--yoyydqm5ksdblrwj--

