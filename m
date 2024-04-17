Return-Path: <linux-i2c+bounces-2992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD88A7C17
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 08:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D71221C2170D
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 06:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82300535A9;
	Wed, 17 Apr 2024 06:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c98bEab0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229DB32182
	for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713334110; cv=none; b=fMfj/Uj+7/Y09ZWGrG0UMlQkf8C+wepTHC3pTKO9SKeqRiFolBJ3kXGgW7WFBREpX3i7ClpwiNSO2fsbg6euYopZT6jnmBdr2ElqytPzHCB6OTiU0y0p4VDVIKmTM/F5kOrv5Evf0uflQEh9oqznM1ZJtPLBJ0BgpI3CK9E5XT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713334110; c=relaxed/simple;
	bh=D4KWua1ZprQ5a8JTxFoqCJy87saSKtB7mYJuy20s9wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2jtdgYTN3OtImK1gzjhL7KtyzOjSIkfL5uCPdQ/8gKMmU6hvUCcNaISzjg+V3Ri/zYKx4WRlJcsYHU9clOZovi41VCSI6DD4aoElTn1TWUd8vi9hOAZGGRl4e6GQ5TPjEInGjOKsNuehtb3QuBiXKkxYIbplNHZ2Z3WYJhQWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c98bEab0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yywq
	XfOYQbgKrN6Ho2xnGSTgnmWVUAO6JWYJoQlQPTM=; b=c98bEab0NGszyvhoy0v5
	dfgoq6L07/wVaoJ3n3OVEMMwEvTon51N6pwsiYpU2wLyPp7K9i1JBzx/js+qOYnp
	HHKkNawcbPVqpjuWhJiOXSJEGk7YOBEz2BoECR+Omkn9e8lkADNzNfsVOiBTO48A
	cGDVW/UHpL4iu9nJWkYiftNTYJfXc3AdN0RKLLu8/n8aUugw5f3d0mkjSZx1KZ5I
	YOLr867EEkK45wC324YZiISHPhR1NBx1HGacTPtEiiQU24elYBAdPv60dr5MHomo
	olRTVKbNoqXxB+EQcTa+3Zvrw7JgEM0N1yukmPvxMMJqT99+BrmDDfoch1TsJsBG
	Dw==
Received: (qmail 2622412 invoked from network); 17 Apr 2024 08:08:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2024 08:08:24 +0200
X-UD-Smtp-Session: l3s3148p1@oTGrrkQWns9ehhrd
Date: Wed, 17 Apr 2024 08:08:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc4
Message-ID: <n3guyjqwjqk5doynaxwtmmpsqdh7trkodontshkjewnt4umpu2@3cfh5jnct3qo>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Lukas Bulwahn <lbulwahn@redhat.com>
References: <7z65zupqngw4i4mzgablb37osz3gwz6767og5t4b32o4o3joqy@ypkuxdgilibd>
 <p4vwnqfv6x72qypebmbgatof7k4vlilauqxp77vh5tvv547l6j@lpf3ejegkprh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3kud47yopsbh2mj"
Content-Disposition: inline
In-Reply-To: <p4vwnqfv6x72qypebmbgatof7k4vlilauqxp77vh5tvv547l6j@lpf3ejegkprh>


--u3kud47yopsbh2mj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> good you didn't take this as this patch ended up in the wrong
> branch as it's dependent on

Good that I was on vacation this weekend :)

> Will move it to the right place.

OK, no worries.

All the best,

   Wolfram


--u3kud47yopsbh2mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYfZ1gACgkQFA3kzBSg
KbY0FxAAmx8JjzgVaGG4h8z/t5G5uEI34TiOACyHPZ4+5yIpsHhsgm13nwf7d2mB
JdjSQOc/yu1lh/S6F5eBOZ/7YIfOgDRh6OoBOc7/advILUaDLRAwuRWpq9NgnxJv
gnXqXN3a9LOpPjlYnlOfVsQvueNAWNCHqZVN5ehPUS33Cbxai7Ew+CO0Nt3ovdr6
/DMt+elNfHT5usC8uWBwM5zTGY+iQbopBIFfEAwFr8yx3GgE3ALHViAo271MIrt5
9+5FGx770ztrg5hkfM4E0khy2ySmhOzbEm35qnonQ9vOjFkeBZv3GRQK7MsWcU/4
Amknp+whkLxlRqtyCX9alvWgnl9Fz+K/8iFfQTDTBMSOcQPpj1Rbrh/59hH/AE7c
/EisamteCsbSgkfwSRtHShlh1uOANro2SAWua0Ep+K9Nus4RTV/K6YH/6NjeomNH
ZgbZzjxQDzyp0aBqqupjaDfCVmnoybZhEzPjkW0xWKdYqQ6QhA0htJlGBXMpuS9O
btOrQw9Focg9y5AEu/vSvpJt8gvuh9ka+w/TqJb3+6B5gXXMLV4sH6+bPNm1YcK9
w1gxYoJMM4GC3YldFrQdp/r5x3YrC0ntpw9lOxesszke/6taDdpvVqntaNfI7URW
f17hmJja0kMrevfloP1ZV3BEaKdyRGXIKxpNLqElS/3zYbO2ZwM=
=F7yr
-----END PGP SIGNATURE-----

--u3kud47yopsbh2mj--

