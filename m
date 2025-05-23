Return-Path: <linux-i2c+bounces-11118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A30AC1D43
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 08:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA6D50167B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C541AA1FF;
	Fri, 23 May 2025 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YQF9J7Bq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916131A3172
	for <linux-i2c@vger.kernel.org>; Fri, 23 May 2025 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983101; cv=none; b=t/n4YP3vVVD1Lit+qXzRneHWd4P2tBk/SLA8bSGjboorA1dCeDp/49sPql9dhFFmtd/oIIB5OvkkfGE78ny44FIWS2I+ZGZ+PbgrUwntt10TTaHdZLS/AYKpchXCrkAVnhnjuDu1fX6Xq9dHAhopTwhINxiJAb+ergjCTSO6cgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983101; c=relaxed/simple;
	bh=9ppj9PmljhSnv/Q/2BF+4qkTSC2zjD/oSdOtKPEv79Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxfD6RQD4148qly6s+tK7YKSra5rjcj4Yi+YhQeNtnHAS+NxcV6uFoDYaaiCOUIeE1YTA6o891lnC4pJrDwM19E1NozFaWMt4gRfemEbnSHqmQSpZ4LZjRflLypQcNNVB48j80XH5+h1YZey1BJ6279MboWmej0KcByLrIcNkbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YQF9J7Bq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9ppj
	9PmljhSnv/Q/2BF+4qkTSC2zjD/oSdOtKPEv79Q=; b=YQF9J7Bq2+hHfpdSPzSt
	dv7IidbOJRrc04gzzLHFWogxoU/pDTIZMReNonGAPgRj6lRAe6ZpjCAn0FKzyOmz
	dMbOm6P1cy04siXWpqErz+dqlehjSpq/EuLzYGPEvjGpznBnCGD1MkcjgJ3nTZXV
	Vj8OEDzFPKfDQnhuAlpYy9HmDZivCOUuLgmJIPc6p3CKNK62azziq8rFm/tqIS4c
	5KFpeE22ogxUc7rlYIWSxzx2aXTDrEf1gVzkyDXrGNWbja27+Mi+J64YzVCKg+LA
	hiMmXcvNelLitgbnvYn8l/DWiucMqbzX1AZ72RcuQ7ghNijo3gCdYY8edEalz9bG
	/w==
Received: (qmail 3936123 invoked from network); 23 May 2025 08:51:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 08:51:33 +0200
X-UD-Smtp-Session: l3s3148p1@e1pVB8g1GuNehhrS
Date: Fri, 23 May 2025 08:51:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: long.yunjian@zte.com.cn
Cc: codrin.ciubotariu@microchip.com, andi.shyti@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] i2c: at91: Use str_read_write() helper
Message-ID: <aDAa9OqEak_s3lU8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	long.yunjian@zte.com.cn, codrin.ciubotariu@microchip.com,
	andi.shyti@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
References: <20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ir00NtPtgiJQh0DG"
Content-Disposition: inline
In-Reply-To: <20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn>


--Ir00NtPtgiJQh0DG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 02:16:47PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Remove hard-coded strings by using the str_read_write() helper.
>=20
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>

Thank you, but please fix this for the whole subsystem in a single
patch.


--Ir00NtPtgiJQh0DG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwGvAACgkQFA3kzBSg
KbaYkw/+NHM+h+v+Ctyr1yd3xUmRb1Gocb46PIHyk0al5SMQZcyfieWHdqtlKKXj
qCgNCf0hUp6MBrZo9PZQtaNnppUwbifI+bn7WrwwqyAXXouBXHx7LFtrTtFWQxG9
ZC6aPWKtdGHKv3tPyehquybCiu8UMz8VM0sTFQxOWV4fHMdXmeoE2vJe4IHVKZhr
0FG/jAnZHrMIZsiM+JDZP5q0zaDWGpFA0BZl6ckCc5wDq8tjsUQmjDrChTZ2eBUb
R984SIzy3E0m1JSKqCs3EdF7LZYITz8Yd/QgRn6FHdA11CZXvP3cXQxXxTDcTOss
8qoYrryy80beJY7CvlDXTi5Ke0A4ekokPK0HZVxzqby+5rWbnxmzesVFq7Sz6ZEd
nbFvrRBoZhJMuXnZOEkvXYez5eAkHt8kKwZ5UgfW6CjQ86pAT/kp2ntGsLEFL62d
imExiSAiTVOq8tilgJapIOtPySnTBmXg66AKxs8xUkQowsZqyPJrVPDFgCQRQVdj
U91XhRjLmtWJD52FV2ne1pytZcTKV6Bzp1NmFfFmgBLZIYBUaj25S69ybkHVFPNP
0xBxZvtTBs63wqTHu6DRNsGcscz3bQj9wIlON5Tk0PBw7PFEClw54WMnYnp/MUfj
pPwzoTOFdJ0r2Rkg1/UbnMK8syjhBPcplU9yNaJDdlCxeWteQkE=
=oDgL
-----END PGP SIGNATURE-----

--Ir00NtPtgiJQh0DG--

