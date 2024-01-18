Return-Path: <linux-i2c+bounces-1367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A783128D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 06:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07B90281569
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 05:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7108C147;
	Thu, 18 Jan 2024 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCXElkuO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613DC126;
	Thu, 18 Jan 2024 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705557125; cv=none; b=SO6Nhkv3RG4F5y5bYcbMv0eETzfwWvalP8+hemKE1EK9wx/idKyqCW3T9vdvKPZJpwNySaOHfH/fgQw3Ho2Ccml4tYt/UM4dXAnqZRA6fc/eo/qV+MnzO1MOvRHD3dunBI5HL0uVYam6Y++99naGEg75lRXUzvLOCpjRbvgaX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705557125; c=relaxed/simple;
	bh=geY3+RLqrFptZ9PpXvvLfsyGzOnN912nGbIFsj+YlLA=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qDNtyCgEfi9CegpXs2wAR69PdkjNHYn11UjSHgDBPcZaSlQUWqd0MqiPKaWaqjvEhXT5MYjIxOrhFqMtO6LYcjcLmJ/SRV/WOl3csNjwkEVaWkVNhBNZfdM39eLYyr8catU3AttP440WhSwqq7vnS+5/VtC6f7+4I9ILIZpFZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCXElkuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAC7C43399;
	Thu, 18 Jan 2024 05:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705557125;
	bh=geY3+RLqrFptZ9PpXvvLfsyGzOnN912nGbIFsj+YlLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCXElkuOhNm4Bx1OPinvXfJ9jQzL/CLWDfy0lgJmU21PVZ8uqeQyzPpI02bqv7jkG
	 qBsgs9sDFJ7iJ4WKPwzWtR09WlspWIC32L1XQqB3hePOWvbUYDALprk9Vin0uwox9W
	 fN8CrKbZJozOYbAVvtwqC7cJED7k+vT/iH5jLmBrwJQ0a0QsXClxRVRFIWeQ9ZyLWj
	 ujgkroT8vpDxU/FCAyF2QwSN7t6FtiQ4Vt1BEYKb6TtOJVQ/6aNrGWKaTRUAaBBgiK
	 +yc0voMWMRgXHF+jPMT+AJd1BCKTO+7zHzJ3N0GffjkKrxta4ao00XNdM/whKP5rZQ
	 rHoML7PlSuq3w==
Date: Thu, 18 Jan 2024 06:52:00 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc1-fixed
Message-ID: <Zai8gFMzdP5mqqOi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>
References: <ZahG7xgHJ4Tf8mHI@shikoro>
 <CAHk-=wgSF9zaUCMWe8FuLrfwS0PxJXyxQxFGn7_W22C0rTaQXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BmVMOqKrXq7xmAU1"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgSF9zaUCMWe8FuLrfwS0PxJXyxQxFGn7_W22C0rTaQXQ@mail.gmail.com>


--BmVMOqKrXq7xmAU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Honestly, with three quarters of the commits being the broken series,
> followed by reverting it, I get the feeling that this would be better
> rebased.

Sure thing, will do.


--BmVMOqKrXq7xmAU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWovHwACgkQFA3kzBSg
KbZThQ//Tvz7MwOzvSOx/z3GqyqJWAS+exmeXll8WgXZq6zoXU6MtYCU/Fu/8nZZ
sEB1a0roJ1PGHhW7VjVA080PvpdadAvN5dCCAahJy/KMGd51Xa4yTk2SAwE2axgG
cU4xnK4FgbflQaxC4s660hKCmrHf29kAigVnPoN5Gw12rDS94xrPOq5/6H4N1uIK
3aNsUNg3lZoivrGCNDyoPSNLI5rI1ClmdQDL8OLr9l+fCuZoF71o4zFbPt3+adU8
GyhxPQNcnrl5krXK/9Pstk2I2IPxJdW5oKV3HwJeHfPQoU+L8Rn3QKFwG9bOCVQg
HxvFR+byRLdiQoH504uJ6zIThgeBc9Tjim7uRTCvQXLTxemBajtwfsWb5BHq9bKH
h1TUDYzTl8v5Hf/enXrtXbR7Q3z58lXbKlfHop2bC1Vp3P6p400e7dEhGiVEDZE8
W5+8FfUVznepqSD1C0EHl/rK9hzvYZcns3Sy1w59J71sq6/I+9DxgkS66TfQkKi3
JWkBMQYKzN+HS2mna1gp1cFUzEKcy4Hx0MJ3YMlVffJh83tKPyCSpqVUbSuJE9DV
YX9XrpL+dsYVV9LFB7Qgc0by1jzH6BDzpfxe7WcJtSAw92ZVOQLNG7LYHe7KnDwk
VGt1OPK7rbtYbWTBlQBGiG7LooH4VIX0cieJjPdM9uj+5RnDpjM=
=TH0H
-----END PGP SIGNATURE-----

--BmVMOqKrXq7xmAU1--

