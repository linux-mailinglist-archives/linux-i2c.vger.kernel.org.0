Return-Path: <linux-i2c+bounces-4015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 509CF907CF7
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 21:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0C1EB2899B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 19:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A5B7E0F6;
	Thu, 13 Jun 2024 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fIrj4a6P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DE77109
	for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2024 19:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308342; cv=none; b=hfaX+nxMTwDUb0kFCH2aS0wfj/QL+XTwfMGbdZx65VOgkhYbyA4PlC7ILectmmde4+zbo9SX1vCFOpbFcY48W7WWLXJ2bqRYtKh8O3obJfskleDNaIYEgpdC3HAcKczsglfNdwWKZcQYgWcBmqKqMwQa49XZn0ruiqh/Wh++O9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308342; c=relaxed/simple;
	bh=KFvrXf67RTEBCYQPpIVoPpW00n6DFoY1qOKUUMRVFhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DM91Tczd3dP8t5akFsRoXO5b3dq9AQNiwAExDPQpI7wn/ZhH/D4PbJlXKcQUd5lqLjL8u08ecLBUDPm8oeU4In0RNpgXcHgYUFAJhYsljYTuaOMy//E4xwMiXYwh8pxFZY8Wl6uYDXlA8DY1V7h9lTjRso+0+y2wwxC9Xcwcvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fIrj4a6P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KFvr
	Xf67RTEBCYQPpIVoPpW00n6DFoY1qOKUUMRVFhw=; b=fIrj4a6P5X5mKjhJlPjb
	xpwhdFMdeWwkfdwt3+qq3u1tW0Iz+MiOg0vzvsR9bBQr6CTlyi0bPju5wo7BuacB
	OzJMAVS/dNAF/mY8N7GFT/foi9LZ+6oTCBx0UAaJIHpYQz66vz1BQyk1rUnd6SpI
	t6U0Q7qyUrgs/ksJsQOveTNrXbestG9l6qAEW9NzDoY7Hy8LaiuQfq099u1JBrZB
	IZGc1aX7m4a1wMihU33mc+qj00xb+m+7ECZLBCzjp0p9rHGjedPjXFKDDX+WXNiP
	XTXjBUhIO6Xnrbh0adihsxQMDNx9Cop8jMdX7pFsl/uUwV+zFHAjms2jnjUfFiMJ
	pw==
Received: (qmail 1285280 invoked from network); 13 Jun 2024 21:52:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2024 21:52:16 +0200
X-UD-Smtp-Session: l3s3148p1@D1kD1soatMFehh9j
Date: Thu, 13 Jun 2024 21:52:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] docs: i2c: summary: document use of inclusive
 language
Message-ID: <z7j5debqyetpts7xdufguiprzqvd4swupnbdenhl7brx4dtt3j@j67j5ufyzrtn>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
 <20240610081023.8118-5-wsa+renesas@sang-engineering.com>
 <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gyl7wq2x5obpwocp"
Content-Disposition: inline
In-Reply-To: <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>


--gyl7wq2x5obpwocp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > +Outdated terminology
> > +--------------------
> > +
> > +Historically, controller was named "master" and client was named "slave". These

Ahhh, while reworking the series I finally saw that I wrote "client" in
the line above. That was an oversight, it should have been "target", of
course. Next time, please quote directly below the errornous line, that
makes it easier for me to understand what we are talking about.

Nonetheless, the rework is not in vain. I think the texts have gotten a
tad better.


--gyl7wq2x5obpwocp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZrTewACgkQFA3kzBSg
KbZggA/9HEci6D5G4Hzeuv5wNp0PKU/K5dEE3ujqwPK3MstPwDeqdPYEYz77cxQl
6VitfxdO5jYh0ycGZHZXv3C5LRM/VlMz3Q5CHNmDUxybIAtNVVzbs3pe5mdtSK1B
hTbY5SJHKHVzVTLXxc8TM4f3tCV2izy28RiMpDBQbPH07YZjY+Ds6+7XK72BUzQp
BYNMWCVEXmsMKdbsxgEAGvgq3PoEIBUleZ/xvYIIRQEFGZmWShB4u1UsG7Z6WypI
BQsT6tFFogRSzXqI5KpvkOSWQxfER3GLf1YzLj61FFC6bgHgiD1SdbjJPA38WNiz
1gAKaxKe5SM2G2Jf2TW48kLOLr4BspUiCLuTRoWLLhp2TjeAyGNQ7ERrYwBT2NzB
dVC1PkKYAlHpCrQfhu90/ST13eIhK52bpE1lwc6gdMC4z3Y8bf2o2Run08p9Nqt/
tbPf2ixUcNDHGQtrHxam1N4qcZdXkatf0H7cuHbt8Se9e0mgNBE5BukFobmucSSz
xE7KmbsqDcNwrfbI+QZvx1G7ZjUO8FVdGcd6CUjk7Nw9E8cU3fCGFR8vsyyXWpYo
kc1E2mY5BDuOxyHgSKnNhztX5x9cj8EZhNJ0aS9JfTxg9CYVmbChVwZC0p03T/EQ
6fqHxT8djanPPHKvcbHSHIo+b9Jo7HYZ0DabwBXSlfP1cSsbgLU=
=AGnG
-----END PGP SIGNATURE-----

--gyl7wq2x5obpwocp--

