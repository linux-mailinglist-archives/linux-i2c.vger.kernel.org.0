Return-Path: <linux-i2c+bounces-14200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30BC767B3
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 23:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 5E785313F2
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 22:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4168F302CBD;
	Thu, 20 Nov 2025 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lO8WHtIB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC12FCBF0
	for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677421; cv=none; b=f71aqVe0tCpgQDz4sMcKbHuS/0D4QraV+R+ue1p6CBuW5zLN+XpTwl4NfQd2g4h6TtnOvLUsN+A4oSkSv3z9sGMXc4793ga7CB0unQFhM0uBSn024D9Z5whDxuZlPI07OY4ICR6RyUTgEXHWh3NYX2KlxxHcx0jDGZK8zX0jPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677421; c=relaxed/simple;
	bh=USshnoHSSZv3EUBo+tmtjVHVPpt1sVdFBFQFvqB0Gi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF2xtfspWUKZig/76IsvDq5zUQYNTk6BaYW37ZVvDk+lfp8+KwU6rgG0LqrE89++phmeOyON5bH4uEzf0LxhY9YbmSfGUuhzFGmVu6EftNpyPeoTWIjiw7pBXQFfk5Sg9KT+tICxoP08V6MK9ur2u5jh8LYerdCoTmPNF7DDydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lO8WHtIB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dXRC
	9cyUZdvuHESH9jXeEXaYN4Ell2oAleKGYmU0BOs=; b=lO8WHtIB7SqPtOj8bxn0
	M0I5bBnAbhLKQmv9RzuutfKsHkqpW0/hs+AQ21B1ui6rx3QSe7kBkelvOpaVVI/W
	2eB6N+FHyu+tKbb5T+qRfpvBpbbcb1K05EDNfK9QZvxtv9oFPYktv1oU3EVsKtX2
	tL69KpkbRPQ0PZdahznudcggfxnppHygbwD3pwDf5v5777M89NCHHwWvXl0bnWFU
	rk4ccnRw+kT/DNNHSacWihmVI8E5/AvEPxFIiaivPwndeAhE35IaZhnqTY6elSe9
	JHffUANlqpzk5hc7RptJVnQVnAuJ4f2CFSJVXZBPpLZFU5FwA+Kdyi+phvYEzPVD
	pQ==
Received: (qmail 541832 invoked from network); 20 Nov 2025 23:23:26 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2025 23:23:26 +0100
X-UD-Smtp-Session: l3s3148p1@q9lQJQ5EKoQujnvV
Date: Thu, 20 Nov 2025 23:23:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: lm75 on i2c-elektor.c
Message-ID: <aR-U3kr-IyXlgYdV@shikoro>
References: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oXuIEr1e82lcvR+A"
Content-Disposition: inline
In-Reply-To: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>


--oXuIEr1e82lcvR+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> when building a SMP kernel, does anyone know why that is?

In history.git, I found 51e9e9743877660198565a86034ca72de73dcf7e from
2003 which adds BROKEN_ON_SMP. Commit message says:

    - let all drivers that don't compile on SMP (due to cli/sti usage)
      depend on a BROKEN_ON_SMP that is only defined if !SMP || BROKEN

But then again, there is also 4b16dac1d9 ("[PATCH] i2c-elektor: get rid
of cli/sti") from 2004 which converts the driver from cli/sti to
spinlocks. Maybe it just works now?


--oXuIEr1e82lcvR+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkflNoACgkQFA3kzBSg
KbbJ/Q//a1c8m8qlfX+9WI12sCbBOb6cGpHSE47B0NCr2eTplOvq/KsWhFfjBcAp
pIvjFZHXI32xjnc4sUlpqNbzi9HILUNxLLIYkh+oiy+/+dM5KnhedZieHc2kZfDM
kZztGjT6ywffqPgNi5fas3v1tDqmzu4VHTC07jN1cGEeRqVXJxBFXD7fKJJjIy4t
A40+sE8Lhqj/COnpYA3R8DU5Z//fvhmxH5UH7cmOmJjIMAJO09WimYrk+ya095JB
Fjfc9+LH1CaFgqLGkNtz7cNBKHs+K9HeDlzXsAuvG8K/QjZJAeSjeHgiGgGXp7kv
rsO4vJQZqHcbOQKzbniA+EK1WhX0suRYOWkjdFDN/UDNY/FZYnfcReUlh7sk/Z+M
sDzmYGCocQ0PbYIFjoUUPfIkWTQDZlWd4r0xOQq0SlYxcBYOe2sVLIfO595BaGSv
8aXbPVjJJaf1+w+sV48eKBbuegcIqMU/0nsbh0HsZVmmdqCPPkb+7A8bdkZvIHjh
hsBltoZaNl8ZRndZXDdGWqk3RTO2jNPhYI/YkdCZeo8UY8G2nICxMuk1fQFm1yKY
ZdhjU5CTYt323Hxr+sYi/O1O3MJA3340apOoPu2MpIkSn3sfdEsYBD3ExIHRspka
RnoxUxC65GD+qXej9kSZXKa6OEZ7V6PgWfe6o6OiR78gL/qpmtM=
=U2Lg
-----END PGP SIGNATURE-----

--oXuIEr1e82lcvR+A--

