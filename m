Return-Path: <linux-i2c+bounces-10396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0BA8B1E1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BE9E7AC02A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C297224891;
	Wed, 16 Apr 2025 07:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XAhv3wSq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DF419CC0A
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788056; cv=none; b=QJAyemDqO2DfVBohjdTouv4wcfrpJtN5+r7W68GuVa3NQqiBlzSr4CWQ2V8WcBlDVXigACfd697GZUmDyiT/UUP1IEs1OxrOoHKPPhEFCpT9MNgojC3fOV8XafjJnKtkzMit8RqvUUAGUDDFGBhkan7vemQp8yOxvSfzOwAn3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788056; c=relaxed/simple;
	bh=HbSQ4NtDO23j4t8HgM8OxJhjmesIZXJ3fWWYio93hI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlJJGgIcxCeFsXafUUAtu9U/jgT8zlhSu2MGOSwUExHFTGNCXzlLbdXcPL69ICzNitmSmc4lYrWaawsY+SyImZuH4ueSouYPEieUp0MDb/m2qCqe8GPH1Jk5oMMAK6hbWFSGCCdMg0+lZ8xI7KjdvKsw9Q4oduiQQBLG9byIG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XAhv3wSq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HbSQ
	4NtDO23j4t8HgM8OxJhjmesIZXJ3fWWYio93hI4=; b=XAhv3wSq9Jr+x2102pgX
	5C1Ht4YqPn8vUEAwyVt7TewguXohXKuGai5cMPwgXqfwmhNhLm0gGrGGTh+QXYIv
	yeRVou3Mg3yo2ccL3yCr+PmO+Dj2SpDgDKvYUcOCliguF+3a8jrzLl4oV3pFjfC3
	F6OZQEaq/GiKZ/Hcr8QykJ9LOfYOvpYEQOzR1RytiugYdpwtXRdJ0knTDBr1rMwa
	byK5RzDArDZJjeX6VCZ6GaQKH8H63KN/GuJL6cqleNXMau3WgG3gBDCILe7zu6D/
	dMdK+BSX4M/gb1mgXmr6O4gx8D+ndK4hctG0/ABFL7oBNzEJV2CdlMPhO/pBu//4
	CQ==
Received: (qmail 611509 invoked from network); 16 Apr 2025 09:20:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 09:20:52 +0200
X-UD-Smtp-Session: l3s3148p1@1iMOIOAyZJEujnsq
Date: Wed, 16 Apr 2025 09:20:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 5/7] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <Z_9aVAYrorIyO8sg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-6-andriy.shevchenko@linux.intel.com>
 <Z_9UX9xkGjvhnub_@shikoro>
 <Z_9V9x_YBfxiCh1w@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="50L5zDTdtr3ZRFZg"
Content-Disposition: inline
In-Reply-To: <Z_9V9x_YBfxiCh1w@smile.fi.intel.com>


--50L5zDTdtr3ZRFZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 10:02:15AM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 08:55:27AM +0200, Wolfram Sang wrote:
> > On Mon, Apr 14, 2025 at 01:01:55PM +0300, Andy Shevchenko wrote:
> > > In order to make the underneath API easier to change in the future,
> > > prevent users from dereferencing fwnode from struct device.
> > > Instead, use the specific device_set_node() API for that.
> > >=20
> > > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > I'll check this patch later today. Rest of the series looks good to me
> > already.
>=20
> Note, I'm planning to send a v5 shortly with the style fixes and commit
> messages as you suggested.

Please wait with that like half an hour.


--50L5zDTdtr3ZRFZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/WlMACgkQFA3kzBSg
KbY36RAArZuN2YCs6A86ERt8m/ZiAy7Oa4JNbxJFeVJbD7FjrPKWRgZDZqEpJyVa
BWLVtsms699zLzO0LpNhJL9pqOVmZNczi2e0zF4Q5QxHRx5AVaxHjtdtbosARqOq
oW+3tQsB8FNs7lf50NI4vmOLnvwKuevSkVuKPQnLSIUwXyf107N8fXHM9GmVtBTA
GLlrsGHMcewcdR/PxOE+XD8H+2qlegucm9722aHJOscQSGY3HC4MlHPqOYVN87Mj
+TrAYEIVAOxjmF3URvAa1UYYgKbWPdXilnRaVarbQMFC19WvrHygeWB0rb1GWD+o
dIazZAOP04AOm5STGxFgk3EZ6i46Pe3YVn9PuWBlPDtwLkvAGY/1WbnWdIZmmT7s
7Wv/a208alEejnpLvYhHdxebwjFw25dLRQG0yLrZTFFEKdHQi6KvZSZpefBWF8ak
a8sKqs6IYL0anQnq6Tzhy4fkX7o5t1nZMa/r8sMFzUq/gltAoP5+mABSwfAwvn90
IpjyzcHlLB48PgHP3ymR5lkRyAn2kJjP2dUyUvQNNv7vUtuZwlnnVdKR5D/cBaDw
3MzUMTo5U34QE87ityQLovYvSbt4/O++A3ffnOzZhKtfvRt3srvpN7nvZ4k6XpH6
FAGvVWyxQWtqK8uKrVkOu/r1JUKxoI5RTQR446ajaZFBp24lC0c=
=JD3a
-----END PGP SIGNATURE-----

--50L5zDTdtr3ZRFZg--

