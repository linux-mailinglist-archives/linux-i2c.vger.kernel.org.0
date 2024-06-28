Return-Path: <linux-i2c+bounces-4489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7B91C5F7
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A30FAB223A4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323061CE085;
	Fri, 28 Jun 2024 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fTG0xSr5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162B25634
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 18:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719600126; cv=none; b=Y7nTj36Au/A0VnDMG1XonemD3wh2cXh7yJKFSv7IBbqMVwK7uEhWyxw4bRuqNywXbh/rOCCdz/LBtnYyM1FTMgJ9H1JFz/vz3o/nNVyl8OwKfrY28ceYNICrQdQs03hNcuTomjkFaYoUvVx9o7+HpYtcZne2jt41o+TipvGf1qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719600126; c=relaxed/simple;
	bh=YCVkc9iPSXczDiaeqNrWf1L5k3rfa9S5h26/C/AJnrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cG4X1oXlF7lu4JV3qghOCs45hV2hz2u4zM6zTptsCjTG6o7a+cCqzpa2nkvvQI7ZTkBx+JlbXrbote4HPxIvVYcsFBcDnPQIy3mdYvU57DJ5rEx2jp8AbLbTHo9Q4wrhSYN3HU8ce1UGmNGG5e0aY9AR2jIcAITYJVcEc2Yxhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fTG0xSr5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YCVk
	c9iPSXczDiaeqNrWf1L5k3rfa9S5h26/C/AJnrY=; b=fTG0xSr5CIRVIdroMwMH
	wrFzOkxavOR0cyAdrQBqL0+Iv0GdEIU/EP5h5yKZhxN4iRsby+O0N0dWDTEgjMlm
	80+Zitm00+c4y3EraspDZ93XYAKARm07JnIqjKZhOS6U7SnPD5zySUPrY3rExfBA
	4alkVMZ4ilWLxUV7BtkIWw64pWVK02y/FOMBKbnrdRwKLTCJAllyiQvyq6C8v1ax
	fDJ0qaqPygA99EB6jRp/huV9Vn7M6EYmH0ktF7KWLfaWuhmFn+4nxqWVtOP6Qb0o
	GxMIwlvhJbso1UooWX1+yeuHVsir6Pd3bvuTAOZ7d0AI6nUiU1D0mNDBSUSmaFYO
	EQ==
Received: (qmail 1339998 invoked from network); 28 Jun 2024 20:42:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2024 20:42:01 +0200
X-UD-Smtp-Session: l3s3148p1@cONZmvcbpIVehhrE
Date: Fri, 28 Jun 2024 20:42:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: testunit: discard write requests while old
 command is running
Message-ID: <Zn8D-GpAfvHvfPzz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
 <20240627111445.29751-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uGCRiHNXQDpJ/gnC"
Content-Disposition: inline
In-Reply-To: <20240627111445.29751-6-wsa+renesas@sang-engineering.com>


--uGCRiHNXQDpJ/gnC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 01:14:48PM +0200, Wolfram Sang wrote:
> When clearing registers on new write requests was added, the protection
> for currently running commands was missed leading to concurrent access
> to the testunit registers. Check the flag beforehand.
>=20
> Fixes: b39ab96aa894 ("i2c: testunit: add support for block process calls")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--uGCRiHNXQDpJ/gnC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ/A/gACgkQFA3kzBSg
KbaZ5w//XdeVpWmIRN3xR2lsfgyS7kaCOSjJu40lKxTazoFrl5d33urkLITwH8yo
KZKVbWwfqmcQYVUvaBNf7KT4TTk+ISxdm/ySYcDP39EoimfXBW9QxArosHYJRUE4
mchSDaYxaJNFcknHIU1BrjwZnI6hgtl9GzcdfvXWO98Gu5eziIOoTmhQhHAmGZj2
nwLi0W1OnfYEzan7TtCezlqgIq4KvUfAHLJ6JYsuICpgRzf+brje9u+z3Pc8KYkw
k+NFool4QX72FvENs9BmYf2P1+Az4v1sqTLYF3lsK3ubggXDjNXChCH9cl9L0Vfb
FEPfg9vzIJxqje4Ay197oCS9XjvZDBSpKBb/E74hhoOO9LwXUDCzWy53xUckp+x2
PV+fPCdMiOGKauNqIcrBb4h+gXRcNFBR0Y8I7889nAs7dOZQUIoN+6rcy0sexRNQ
lIw9ZmiqsMV699IJS0a8q4AefVmwy3gIE70EXM9+kwOMJ8pdO14RpJ7zCpOnctw2
2EJvIzeu1+xwunEFYeGKN3zmE/xEGTjU6BVdnSNa5ciLwuXzVb20P5N550cxNrCu
xzZS/4z0pznhHxhFZDoi+9vBrnhQ9aV6mdLDj+vllhvq0qOXBTXnbslz1iMSmwZK
M60rq6y+x/i1geCkmisjuKBhAChGMYA+axPBq8ztjFehPYLm6x8=
=Rx88
-----END PGP SIGNATURE-----

--uGCRiHNXQDpJ/gnC--

