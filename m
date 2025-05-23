Return-Path: <linux-i2c+bounces-11120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB0AC1E74
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 10:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23381BC7C2E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 08:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32958289378;
	Fri, 23 May 2025 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jgjcBtA8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDE1E7C32
	for <linux-i2c@vger.kernel.org>; Fri, 23 May 2025 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988185; cv=none; b=IK6Ho+9bVBVEVOMJynAXR9URdWapqCRug/rxyE870V4GEbtlD8GMyKZ6HgEoRpoUIxdmrTlM9lqkGV+p11WMkS+Guu/AeXc92P8ueBC1HFBEVJ6NsMY8ZdMqCp5/JoT9dSiiH/DaOqZ1pXrmqjUivKt3vieTg7LkCgdOOXCwk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988185; c=relaxed/simple;
	bh=igIz2ufI9GzFZGN5MxrYTCHCP0zC6WWpfICma8JqbL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwuouKsyUUHL4ZQlUuD/2zzckI6l3G8/S2sN6m2tHt/XIfC9uioltoll5cE0bZVLjrzIVKKY0TcH/Meuh+PGcmvmRU2i3PynGqkQBX5ckZ0PD6nL0D40HcJq+zWxE8R1pWQdYdPko9a5QrB1aspfWSlBFtmu5iwFO+hcs1ARQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jgjcBtA8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=igIz
	2ufI9GzFZGN5MxrYTCHCP0zC6WWpfICma8JqbL4=; b=jgjcBtA8X97WSpkUcCze
	p4wHfM8dFlzEaCIgUKgie9sfGi6R+TdOSzNF/iNjdpezthHqhGdrY4H3XqEKYUEn
	NjKJk0+o8NR6zOIJkMlWA7p8X65Cjno5uMpvExvnho1bmHXelK+12posZ9qGf+ch
	CGqIm8yO0T2n5c+ZgtgBHjn8n+KhE3n3tnUeD4b5YTAZhc7HL+QZJmKPQfSVxFzM
	PTx4TvFNUPS2XJz3AkZFMrDQR8xisd96WeCPyEtt1W15ZO2A54tPR2z/9OOMR8tr
	6WiEu2m04r3SYc3l49oeyvu7GLX1ckIg+59/cvwHVoG4PdvYk7p9O0qk7jUIQmQK
	Yw==
Received: (qmail 3962463 invoked from network); 23 May 2025 10:16:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 10:16:14 +0200
X-UD-Smtp-Session: l3s3148p1@X640Nsk1RrhehhrS
Date: Fri, 23 May 2025 10:16:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Till Harbaum <till@harbaum.org>
Subject: Re: [PATCH] i2c: tiny-usb: disable zero-length read messages
Message-ID: <aDAuzS5pvUZczBye@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Till Harbaum <till@harbaum.org>
References: <20250522064349.3823-2-wsa+renesas@sang-engineering.com>
 <aC7LfOYdq49yDsDt@shikoro>
 <kqvsib7qm74cgoeopjldepgios4lpjs6xxbnbgkf3m7lgkk2dw@d3tkxzzgsusa>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7kpfp3UJ4Qa/ul3"
Content-Disposition: inline
In-Reply-To: <kqvsib7qm74cgoeopjldepgios4lpjs6xxbnbgkf3m7lgkk2dw@d3tkxzzgsusa>


--O7kpfp3UJ4Qa/ul3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >=20
> > Fixes: e8c76eed2ecd ("i2c: New i2c-tiny-usb bus driver")
>=20
> I will queue these up for next week. There are a few more fixes
> that I deliberately left out of this week's pull request to give
> them time to be properly reviewed and tested.

Sure thing, this problem has been around for years. It can wait a little
more and will go to stable anyhow.


--O7kpfp3UJ4Qa/ul3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwLsoACgkQFA3kzBSg
KbZx4g//YQ6Ay5ODp33RG+DflQ69pHt8uoINbQSZ3mc6Ncyfgm3QMaIzceFK+Wlq
3a/ZLCyU7UBmwhNZyWzt+GLTqFub68ehL1nzXEm6yRi1UG2lxoD33m4swAIWwHzS
8d2b2sTMyry12Nsfy1Yzg6dRn0j2AnyIuuAIzdyTvq/8r8U2i+ACtngg5I9uFwsz
FyAZ2foawkRZ6nr/QNyTbwtxhWu/59nhjtlREbBQVo8Ix6tetEgQ8hTyhVSu1X6W
72zRdin8KfWvu8eMcJPyfzClBn7NVYsrTL16Z+7QXyJay277h0pCSvwu1SfteIz9
QEU+PACf/qjxFxV6d5O+qr+7HXy/lkQJXtTrTg08x1Zj4J48/bCc+hojNJHrjG6j
biqBNCMWubplG/jWTLAZgAY+KqHyFvRIOZmkyoLMF+/IK/3tr4gHYtFrP21U93FN
S5AX/8C7N7PohG74Lv7uPEVhTtDkHW/30u2Wx7EIXvmpT9b8KXzCgbyXYZTfy1Zu
J2ITjMJisNcrXkjZR2WIh/NmcGA3VY3L/QOFLTeXCdt3Zn9kdHlGF3du/a7478MO
JX5jx/zq+THR+9a7j0ci7yLtqjt9HNL+HmNZ768IG1NfZxRUblpBwVeKtPufekCU
98Ee0JZltF0X7ZaizPemegVcpdGZgJwjF9qQGecfaQeVFlR319o=
=NtIO
-----END PGP SIGNATURE-----

--O7kpfp3UJ4Qa/ul3--

