Return-Path: <linux-i2c+bounces-2819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1C89BA31
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C31285F5E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 08:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E31139FDD;
	Mon,  8 Apr 2024 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z6jPgWbJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18239870
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564855; cv=none; b=Jd3X0ZnyhI4ikpfwO0ceexAP2wtRj77fNi2XCaF8vOV87jCZBvyZ8qy1w2JHqynwcZoAl8tm+F+xX6sErSoFYdw8hHy1q1iYGLD1ds78ZQ0SC9IKpgamwQqUKYSCz4zeBHz/2mq7H2wmtUmphuDz1n2k3VMjObzg7WHRtMdPrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564855; c=relaxed/simple;
	bh=acB8XKlK63YaYiZix0/DXS+gQ9+3Ls+Q1yDi2zDPyV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxiSbJqx1U2pz3SmddVy1fuepPRPTzqFdqD5lJNXzVafo7s6I4iiFQT8AEQKY/QTqby/nsXw2aY0wqfHD3WCCJfoivbCB21wBoWZ623h8GWF2SQ+7oOtkH/+Zkwyf7Clho9TI1UT2i19/s7VGpdBKm+Ctm6IbdpscenHA2GC4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z6jPgWbJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=acB8
	XKlK63YaYiZix0/DXS+gQ9+3Ls+Q1yDi2zDPyV8=; b=Z6jPgWbJ0XxLyhyWO9KF
	pwy5/5+FFWGzd0kbfPTcJVszemyuLuMk9wL0qDwKoCRMtqeHXrf7NPO8fQuJ3/GB
	K6WJoVWOpIRzDpNtsojZ1l7nDxt/OS0KZt+FkQZ4Q8yiRfyBuWfxf96koX3bE/+H
	GtsDtwfFiYWhTOzGPTdJjEY/mZUrrFkcWLAt+CZeN5v7PnjJftOPpg/Jx4U/Z0M0
	9+26/C9zOT5kBD6A5ev48aPX8KNBd96ORuNjryXRdkhJdP2czkhGCR1/erm4BzJz
	vUvC17FMYGZzUi5u+PVU/dK5onloZaT9bNBvrvccomr/rJaKPTRA6wwC4pQw5cRL
	3Q==
Received: (qmail 700993 invoked from network); 8 Apr 2024 10:27:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 10:27:30 +0200
X-UD-Smtp-Session: l3s3148p1@SxSRk5EV7ukgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 10:27:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <radpp6rhldonuhtqulhoppscvuv4rdysipbmsba5ffxz5vsbrh@hedc36qvca5b>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-2-wsa+renesas@sang-engineering.com>
 <54i4mvoxegs6vda7cwvlo6a6nn4qrdtibcpif2642bspid4mqu@5qjt5q2xyxoq>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zxnylq37tlfuzgwn"
Content-Disposition: inline
In-Reply-To: <54i4mvoxegs6vda7cwvlo6a6nn4qrdtibcpif2642bspid4mqu@5qjt5q2xyxoq>


--zxnylq37tlfuzgwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Start changing the wording of the I2C main header wrt. the newest I2C
> > v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
>=20
> nit: "I3C 1.1.1" as you added the version to every specification.

Added, thanks!


--zxnylq37tlfuzgwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTqm4ACgkQFA3kzBSg
KbYMMQ/+OhLYGC59tV+TS21FcETbwq/13whmAzPzypftqNkehZq7wULcpAcgbKGK
sjb8/UIK2TFpVQgMKER2VsUIz4nS/7tnI2Qn7xiQUyK+Fg9/pxfmhEd9NS4ZgFHA
XFYXwi86Kqs4M/EoIwmmj4neLnJGMG1zJsZOFdbuLgxg+rf7ZRkNL9LY1lpXVa4p
SAXW1oJv5jtLFPo9iLJioTkJaeuzx6cj8FuPwM5op6ZJo+QWxDPaOI/iLzZDPwRl
O1mMbgHfuvhsSP6oMgun460sVQ8Co9S4C0aftruiw7Cz4j7eqFLPPPqVvGp43xTM
ADu2e1zF3CCpXcF+9hZ7d0fm9p6w8oe+79K18UXQUDDECYNfKS0sB+ASIBiEsvPn
fxrH6+1gaAU9b5RmbrRlY3jPYSeEgdFgybbBmG4eGzMcVdK0OiI8CCmfdjlxa+Nj
tlSTBlMw8jNJBxlsR/+/KzHdLVa0kWH7jyc4a1SEXg85JU8Awg/dpYPE7AA1ICM7
nEsMRTh2tZvpZOAY7A1HQT15PFLWu7Af6/KN+T+0nfz+k9ihvMNEk2kjZFSjkfl/
eOLh9WP+Mt1nI/PBouUYpIvbTAaBeiepymhDfuoVqXJS46FZVk79HT3wZ/ZLXvDt
Ka8N8oDHcqUnb6nTz5tPV+Y3fedPcFu9n3I8ZCKPiGRX9/kKsjY=
=WozI
-----END PGP SIGNATURE-----

--zxnylq37tlfuzgwn--

