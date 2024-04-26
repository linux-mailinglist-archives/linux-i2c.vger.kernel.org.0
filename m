Return-Path: <linux-i2c+bounces-3207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC818B3480
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 11:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B021C22117
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 09:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B445B13FD82;
	Fri, 26 Apr 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N7lILEOP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C213F01A
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125141; cv=none; b=M9JUucJgJSWJy95jZpAG0jvdN9EmoA7Pn969dWifuU/deDXRxPc1qYXc3vw1aI4OzpEZUP+jILQFnYGmu4HINaUsvtYg/FK641KDrpISuCneIZHfWLJw7R0nHbjXgomc6msfURO3QjcY5OhY3LYR6fG+sNoC17yAAEVt2zzK+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125141; c=relaxed/simple;
	bh=Jm6PL9Z2zz8L7yBYNxpGkwSDbMydJQIDEId4e0qQv3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbiOjuIHGVwpEHV0TyrgaC8s8dBkJG6nKA0epQLD5F6XnDoSbD2EtfCRPxEpqgaIWKBngqujE9BhPU/qE3r+ZJWmh2uw9W4khNs7IEmHD9nHWUpQkDkqlB2544UJPu+fqQKZnSAtDg1+2kxS5rj2EkqWjDM/yushfBPkDHII+DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N7lILEOP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Jm6P
	L9Z2zz8L7yBYNxpGkwSDbMydJQIDEId4e0qQv3w=; b=N7lILEOP/oDCwlt+wFOW
	9pDqq5xnixKVLXlkcSc7ZDaNqPhl+zR+BSTQKc4QPScaZRox2JLvuHYCg3R8/cv2
	lSRsL78sPcmWR4ScwzDypIGssjqrIqOR5SQVEcCoxy8SUNBD3s7dJjPth8m6cKCl
	4s0CFwHL0yNXgal7ZyZBjDbQ+cCHqbPUfTi5+aMOWmAq6nEEDLIoOAE4uHhRISVX
	9oj342cK6Yliuzq+90brygoXvrrSCeKjT2DJk3gEabRvds8c/VxZnY2K1KW+RMHI
	bhoBfoNqEcWaPt9FahN8U6637fDGEXOOH+P6w+2GcW3dHLsHQXQ70m4rzGAeyuOM
	BQ==
Received: (qmail 1267830 invoked from network); 26 Apr 2024 11:52:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Apr 2024 11:52:13 +0200
X-UD-Smtp-Session: l3s3148p1@LdSp2/wWgpQujnvp
Date: Fri, 26 Apr 2024 11:52:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Baruch Siach <baruch@tkos.co.il>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <20240426095213.pgk5tfe35kv6ppwp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xht6wkuqmbe24lqy"
Content-Disposition: inline
In-Reply-To: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>


--xht6wkuqmbe24lqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 08:44:08AM +0200, Wolfram Sang wrote:
> Brauch reported an OOPS when using the designware controller as target
> only. Target-only modes break the assumption of one transfer function
> always being available. Fix this by always checking the pointer in
> __i2c_transfer.
>=20
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Closes: https://lore.kernel.org/r/4269631780e5ba789cf1ae391eec1b959def7d9=
9.1712761976.git.baruch@tkos.co.il
> Fixes: 4b1acc43331d ("i2c: core changes for slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixed the name typo and applied to for-current, thanks!


--xht6wkuqmbe24lqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYreUgACgkQFA3kzBSg
KbZaLA/+JjcWZKSCI4lls86Wf67FtVWK7t1bbC/I11yecqS/bs9ypx1kiwOJo7O1
0JVybH4tSOku8x3CP6M0WaIxGWbHfEBPAAX2g9lx9+izvun4xGaLGeRkViesjKnG
nGOx6LyvTmZh1j6rrGis9gmbh4CWBYszryn39VCrVslmlhqaLVYW8O7NluVEakFE
ylNdZ+BPPwaePCU3ptUsSdubajzqgLjWpTWxoAhloUWkU08b5Aj8bfA3fXRybEsg
hAVVg/5Y7sBgljqps5F+7xFf1oBDWVWcKvvidA7Ifj1dBTmRv9HomDhxbQ/2G7RV
eQeb+v0UlPXfvaJI6EY3JdQaCpbJNTzsGKk5GFbetXpmwt/7T4mmlH5fvXdGMdn9
hpmB5Ottzfi/LfUgWfdLb3tHJKUAfKb+u2rdcOKtFVp4xMyWKZL49gpTYLYosJw4
zEkOBCQ4ANfqsZ+ZBgIlfx18NV5vdDLt2EKqjKM1hVtrzqd8TGKbgfJHpo1Ihsrp
C55LUsZYRIImeJSzaMPwMhU0Mk5mtBLlX9JzCd6nSUO/DKJ48W6Zz+PRsbY3l//U
9Ol6c3+doo0NiMJwyRXmu6mMYx8vQj2OIKcTqyIdozwEWqVEwJjolT8y+xweXDus
X4VszIpdA+uejbKUnWOvJ1gLLh+Xoi5WkpjKvXvTkpPoLhsyPpg=
=HZIj
-----END PGP SIGNATURE-----

--xht6wkuqmbe24lqy--

