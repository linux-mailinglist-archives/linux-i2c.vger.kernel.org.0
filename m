Return-Path: <linux-i2c+bounces-9124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365FA140CC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 18:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80C53AC3B2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 17:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64123026F;
	Thu, 16 Jan 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B7pqbnBG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E1E230272
	for <linux-i2c@vger.kernel.org>; Thu, 16 Jan 2025 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048039; cv=none; b=ubVARaXDqRpONw9c+8I7wh2vQv6RjVFlWI3KZjnmZ27dRi2cbCXjt8cjA71zv6S9Wriv8YDTlC/TpKQSh669WbbKjEngG4AhKwnM3S1366l7Dyh0S3dfICZpZENRAU0zrzKpRnQKDcEJbxagGHRXc72dxwiN9auqgmC9vhu2bTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048039; c=relaxed/simple;
	bh=Fg9ItDvfi1uzZsBVGfhP7bNwu2SXnW4w2b4T1KfqrtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzEWuKqan38hh6lt69oBuJLkrhxZSDpuFBIPnxCYsdFoIE9xrm2vfnDM0iRoSLw7Ct0U1CuveQLWDVvCoU7fJKyTpX6Ttey8F1GWWOm2bI4rGQ3DHTeabJg1N11DPkvs49laP9The8Rzt8iqMzBWTYRK+PEwRoOEryrqL8TUsJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B7pqbnBG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Fg9I
	tDvfi1uzZsBVGfhP7bNwu2SXnW4w2b4T1KfqrtA=; b=B7pqbnBGPFeUJOUPYkKG
	FzDWfCvD8/yzZKeCRwH3Gi7vj4fnZZyS5/R8fr3yP5tEajwMcPNPaSyMxX7c+HoV
	2Vq3TQv3ON4sKoHBkE+Xz2TCUCGQNZ9Shr0hH2rS1Yna4AAMjw0VyoGTmRX4OUD0
	TmG8iSJzt0A20aTcRcO2eh+5nshW0tCc4xryzzYwVxlZEAw73xsniFLG5WiAhTJS
	zI00+bjNNn7NDlNiiTDQZ3x6eViTu+dDQFPX+nIV8Xl05i6G339OQSHEG4+AOl0l
	1T4XLIp3VSscRzyQCuqxph/FY/gLkVl1XpeFImbBhUi8W3oShh6IdO2adI6BwOsw
	nw==
Received: (qmail 970085 invoked from network); 16 Jan 2025 18:20:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2025 18:20:34 +0100
X-UD-Smtp-Session: l3s3148p1@QZ8KA9YrrukgAQnoAGFKABs35iVLDC7C
Date: Thu, 16 Jan 2025 18:20:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: add kdoc for the new debugfs entry of clients
Message-ID: <Z4k_4g16ahLR4wRw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
References: <20250115073918.8297-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AV4jHAsn9cZCUYmz"
Content-Disposition: inline
In-Reply-To: <20250115073918.8297-1-wsa+renesas@sang-engineering.com>


--AV4jHAsn9cZCUYmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 08:39:18AM +0100, Wolfram Sang wrote:
> When adding the new debugfs entry, its kdoc equivalent was forgotten.
> Add it now.
>=20
> Fixes: d06905d68610 ("i2c: add core-managed per-client directory in debug=
fs")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20250115163146.6c48f066@canb.auug.org.au
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--AV4jHAsn9cZCUYmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeJP+IACgkQFA3kzBSg
KbZ4Cg//RVOqFsZl0XTpJT03fOCoe9qxh92qTDhgIthXyurKQejd804BZTaBCNK8
WcL57Cp1kbWLJhXIOwt15UwqFnbYlpC4X9zZjDM5PXvVfFjKM6ShT5E+V13jLyse
z95XWRwzXpSzv4yZz5TtNBAPruT2igYt3qAxqSIJQKJYWhXQwkDYwLLHWUiu7HA4
lnaxCbAZ1LwzlSd5cFwHcPaOTOhyfUEflRLI5w9c2AdW03rypkr7JLSU0xu9WE0w
ZUQkaoa+q27Xh38cHS1n72iZufPm7q2bsTikOh12UdEKDh3i8jpnWAgvm7WYOjZv
lDXkKB1jQz+zktZccpG4BUflsDyQ20KrMGJ9PWjHDmDbbPt0H1Y26y/pNaBb1geW
uL0zRus6vRg4MaNO3RKktTCuPzlEV0dHRNBRY8hSvQN25UbbmtQ5qbpnBd41bydW
n4se6E9SeJ82xhjsYxGbWORuMEFN9g7YIuM/AlqbdvCsJdNCgM6yjAmR3CLcbJhP
84DUyB4CUCP8+KJva8EvwLrPX9LuTET+n5mJYEziTecRyNPWgzdezZTyT9ZAaSwT
LJ9Fifw6VoA/5foE9k8cvistdJhQeOLujDE5Ahv42gMl0GSTrol6OOMBj0/l2P/3
gRGxMKEcL/lmIoVinQHhXNVgFV/rJl3NXycFGLgiL5ZB/rA8PPo=
=ge1R
-----END PGP SIGNATURE-----

--AV4jHAsn9cZCUYmz--

