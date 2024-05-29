Return-Path: <linux-i2c+bounces-3703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87C8D34E1
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 12:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B476A1F259CE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 10:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59ED117B404;
	Wed, 29 May 2024 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D2MCXWgb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F548168C25
	for <linux-i2c@vger.kernel.org>; Wed, 29 May 2024 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716979687; cv=none; b=tc8cVGFcbGM/+8Ew1gCrpxZzQ5RlDAbOJAG+FkTaH9XwGCfsXqml3tjMBILv4+xoy7CAdqe9rQnDabUVldgH0FYMkai90jm6kJDs9h6JiKDxAe4Vdwcp9q70HDwdsfxV0tx77HGYg4zrJUp56tHtxsr0Ba0yjpG+i57ecUfEXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716979687; c=relaxed/simple;
	bh=UuBz9NpKC3LfAEUF6XHyO/mPJoUuAa8n6WFMNdtjHRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWYn7WNynOghvMLEsfbsjeYond80jI7XQ6I4ytTGPAWJ5yC0WM0Wdh+dyk7ff0BhjxI/DLL50ZozhBOERnRf+z7ufyh9tf91XrpwRm372r+lrCWhMzj4qyDpiiJAdO+ZOUwWwsu8w9h9WnB0rOhdoTLtQsx4EpKoFtmZuzJY464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D2MCXWgb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LUTU
	xzwpj5OfdoulffEOvISQnoX7hmIXHuKgntYYBik=; b=D2MCXWgbZHy+7lNHMyx7
	TU+qaQLlB4DqzaFsYoNeUk04LGfxt2i9srNnT24qxPBbnJTTYWDhekTY0dFNj66s
	mg3WpFsXcgXVu6qPrDL+p+0Pg2ySy4r6HYFAsFtL3OnL7MmJI3CYY1LNea/lXL61
	x7C+UaE2BYH5b6Bs5eouL8X1PAOezf7pEZvNRZdHYWyB65+495FEkoFlMFmSFS7X
	HHpI9VL3Zv4M05mLWggmzX4R9Wnp8C6ErtyDmTC5Yn5tFQGx8ahqPpBgQJS0U7Lw
	hL8YkGGr4iaXR831ufgkMmrRs9RvAO8c7TQ++I3s832Ymx+A7tFn2WFtfZNdxHGj
	DA==
Received: (qmail 541755 invoked from network); 29 May 2024 12:48:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2024 12:48:02 +0200
X-UD-Smtp-Session: l3s3148p1@fyMEfJUZIusgAwDPXwS5AFh1mWvQq9Po
Date: Wed, 29 May 2024 12:48:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: James R T <jamestiotio@gmail.com>
Cc: linux-i2c@vger.kernel.org, matt@codeconstruct.com.au, dns@arista.com, 
	jdelvare@suse.de, jk@codeconstruct.com.au, wsa@kernel.org
Subject: Re: [PATCH v2 0/4] Increase SMBus max block size to 255
Message-ID: <pfaira6bleblcrxbziuqj4eqvu5rjhpzonqe2lrtxabavmw3ei@74brgbygttaz>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	James R T <jamestiotio@gmail.com>, linux-i2c@vger.kernel.org, matt@codeconstruct.com.au, 
	dns@arista.com, jdelvare@suse.de, jk@codeconstruct.com.au, wsa@kernel.org
References: <CAA_Li+t1vFuHPx+ySijxPme3+2Jyg_ekY+7X2df-Fh5uQZH08A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmwto5rt6obiypo2"
Content-Disposition: inline
In-Reply-To: <CAA_Li+t1vFuHPx+ySijxPme3+2Jyg_ekY+7X2df-Fh5uQZH08A@mail.gmail.com>


--kmwto5rt6obiypo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

> We were looking into support for SMBus v3.0 in Linux and found this
> patch series. Could we kindly check if there has been any progress on
> this?

Well, on the drawing board level, yes. I gave two talks about how to
tackle this issue. The latest one being here, but, sorry, it is in
German only. Maybe you can get an idea out of the slides:

https://chemnitzer.linux-tage.de/2024/en/programm/beitrag/252

> From what I understand so far, a previous version of this patch series
> was applied to netdev/net-next.git (master) but it was reverted via
> commit 2f6a470d6545 due to concerns over ABI backward compatibility
> from Wolfram. Then, Matt submitted this v2 patch series which has gone
> unnoticed. It has been more than 2 years and there seems to have been
> no responses to the series so far. I would like to gently bump up this
> patch series so that we can hopefully move it forward.

True, it looks like it went unnoticed, but it wasn't. I need to update
the status of this series in Patchwork to 'Rejected' sadly. Renaming the
old transaction types in the UAPI header is a no-go and will break newer
userspace with older kernels. The new SMBus sizes need to be opt-in
completely.

Like I said, I have sketched this but both demand and work time have
been limited, so no actual implementation happened so far.

All the best,

   Wolfram


--kmwto5rt6obiypo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZXB+EACgkQFA3kzBSg
KbZxmw//cfomnyAorWdfc5bqUwevO81dr0AWOWi1VMf4FziKlT4Mo45IMCnk3uIA
hbsVpBu512tgn3Q433VDRqbOyOLnzqnDZXkTWb/pkoLUosJJ12WTxJwPrzj1ybFr
3S7LqgT6eBdu6q5rDduFAd3ATIOrEMKsfyYP2hrpE8/SQ433InowVsNG4zdEnbU9
29Q1sp0Vx2mA/FQF7VfzRLTZXf6z1R+PQxodSxcDZyRLJHm5IfsUvsw8I3orP/eA
MvyLgmcptYbmiVn+65qgkuSsFdxWbtrjIuoP0rv+iOJoDq4gIRpIhonClpEIj/2k
RuwArn1PNvLfBVjuSF9PAFIxIw3ZzxFFRbwvUSYnQvDRPLZMSfS2FC2/RXBlKiE9
+L77OtRGxJdtjTGhlos6e25KKtpyK7W/gMB71DYymua8EJRO+T2IZPe3wl8eORhO
wnJx/lwhCJTxlZU9ez08871VSdW3n5qqK5/oZmpRUcV9/CRRCGwZvUTr2h0XlV3e
sDnZ7c0TxdLnv7UIbTLRla4C+vfxTtsRH2hrIaz4vX5bjSJINdjUXyHgsjmWOnvX
SxMOTw6rw+yyRN3LOqM1mfwKriA1tI3MNHi38G3m39mZIbfsC9kayZIJUziph9Uh
yzD5GHVIgRxN1LOE6/ne/rZV3D8gR790oCbwdZSGax4X81hv7xI=
=lHTw
-----END PGP SIGNATURE-----

--kmwto5rt6obiypo2--

