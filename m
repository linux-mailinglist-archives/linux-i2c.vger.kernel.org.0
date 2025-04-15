Return-Path: <linux-i2c+bounces-10377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA9A8A912
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 22:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4FF188DD01
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6C5252912;
	Tue, 15 Apr 2025 20:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZsVSG5ei"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22756242927
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748225; cv=none; b=hHgNb4GlUzabO8KqTezHVK6Ulea3FZB5BIZyG/+fex+PW9tODTO01UB+F32dx4+naBgzvcs/n1fxV6j+Qe2qZRRFNKnM6tKUO59MBxaRuv7fCdP9dlMNEkKlimcFs449VHwcHlRcSR54vsAw35IuMGnTgjZPCtLtezEFibnxcrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748225; c=relaxed/simple;
	bh=Aoh6we8ZAkk3RvfV9IuYePjpW6SHUl1r7VIbhUuvXEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZ8su4si7rZddjkE8qAv1qJu6E0CRWl9Y7Rk8/FP0bhAjNhDfoFOJpg6NP9prLxLWN5MNTTzDhbqJ3eROPMLGwi+aFuN3jirXbF5ibI617AD48c4/fH276vIkKzetpdo//bkohGWhky44VPTixcH7RMvReZWjaRSbUWA3ZffNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZsVSG5ei; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Aoh6
	we8ZAkk3RvfV9IuYePjpW6SHUl1r7VIbhUuvXEY=; b=ZsVSG5eiqn5UiuIqspot
	SWOHyxuBIpQP+VN3BdXmLYKsEBFDn3Yvrlw8ciSXcGLEiDpNw9omUDnAfaNEmLNs
	9vMJL5/FadqL1PgJctyh/YZPcJYsfJHkQR2kAtU5fjfvOf3yhluZrNu0WZ7zAryQ
	3lSBUFCMHENAiUyru+/i2mkT9LdMu+WzxzSDjXzSNyJ5+M839BJ0x4urEY2+LiEw
	naDXuDOhGJL0yfgHyWzJLXTUcD2XN/aL1xsCwabCNRvueO27OGL15uuimt6Msckk
	TyWNbwQx/ErTI9AuB/QsDKucBB+cpGae2HSHPSpvKjvvqzfCGuGJyixSR30Yo9R2
	OA==
Received: (qmail 434349 invoked from network); 15 Apr 2025 22:17:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2025 22:17:00 +0200
X-UD-Smtp-Session: l3s3148p1@uJHd2dYy5pcujnsq
Date: Tue, 15 Apr 2025 22:16:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v1 1/1] i2c: atr: Remove (explicitly) unused header
Message-ID: <Z_6-u9o4_v2l13Tg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250331071646.3987361-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p8/w+R2ikgAeb3U9"
Content-Disposition: inline
In-Reply-To: <20250331071646.3987361-1-andriy.shevchenko@linux.intel.com>


--p8/w+R2ikgAeb3U9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 10:16:46AM +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
>=20
> Note, that fwnode API for drivers is provided in property.h
> which is included here.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--p8/w+R2ikgAeb3U9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf+vrsACgkQFA3kzBSg
KbYH2w/9FvUVt6QDu7+/6wmC2YYMpiF40l9EEWRn9dMJzABR4xjAez8kFaxn2dpN
BcEpJ7gOmhMJpiL0stPtzeLU+y8M9Gogs8vTU1TtaqO7NvqVSx2XZ6QJAJZH+q4R
Oky09nTygkcOwORS/AVrVjwOBnowPCky/g2h4HdIJMdJQ3z3wWDU6SCWimXwc/Ah
bIEFwwjzngqBBbkNJ/MtKJssUnQJMlmgxcEprQbnxf2ml6bohsDhIEOp+BD1b9Md
4vjyLJnmU+pY/ZoLSaNFcNiInagTuaK2jUHzUPeIC8F+ccoKA88LMkkfqo3JCftK
vLovbcYUJCtfti3IivxlZAa8vilbSOn0RQu78e2+HWzjEsI3RSg5yCCHQTrK4GFB
wEqBwtQxIAKQfWIw0ldR/4jhh4B6lPX0FXmLnXDNCCpPvnfcXFaU+QZXVx6WRFtZ
7SYrRely1051BxtD2s6rXwygQujdHxzWhKn689Q7piMhSsp1UvgD3WuLw29GvFRm
E3+5HbspG67uzkq1cH5wpn7DY1zzk7Vw3V/GiHSn8CZnyjdcpN09Lpsr4gUQZ9XU
SLRglexZl/qjQGC8Tq4aTmrVj1OXi0kTdJJ+BiWjuEa2G6EO1E9AVoy+eugz0uFq
Zo0TcNdOkbqpF6k+UjqznpKZpjj+uquCZrstmvn5BnoEyE3N2/A=
=eZMz
-----END PGP SIGNATURE-----

--p8/w+R2ikgAeb3U9--

