Return-Path: <linux-i2c+bounces-97-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B93157E944C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 02:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA26B1C20856
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 01:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC532522F;
	Mon, 13 Nov 2023 01:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0N0ETyJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBED522B
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 01:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406A9C433C8;
	Mon, 13 Nov 2023 01:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699840468;
	bh=FmkDoy/0eJPkVYV8ZLaULmptADDlNe+yxrAbDgnex3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0N0ETyJ4+qcohxG3NQYhiFbkKeouWKoLXjNBBrpJMI8eo7nyJGbz6K79AdQ8sTbe
	 UMW1vJMdMoPa44K6FfwGA1+HMpihulSzHaYPJeOj7aqBeriw58ATYzGFHiLmMN/NoF
	 hfODERhtKf9UKxr8ETMjz29t4ePcjqfiwp08rnHLOhqejGC44rCqAxq+205K5iX9I9
	 ZQe0HVnI9DHdYxb8DpAaFd6iJ6/lRGl/LZBDCcj3w1ndmBbegUXuTAg2zVXIaCJ1Mz
	 bh9nOPCPsUeQ3RcVd3BZdlbDIOuw2BnqQZbw68gQr8Hvo556yeWpl3U5zsb9L12JGe
	 2ndXcDIjQa4VA==
Date: Sun, 12 Nov 2023 20:54:26 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Jan Bottorff <janb@os.amperecomputing.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZVGB0ul4MYIdLaWX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jan Bottorff <janb@os.amperecomputing.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eeatwWnsqf/21ntd"
Content-Disposition: inline
In-Reply-To: <20231109031927.1990570-1-janb@os.amperecomputing.com>


--eeatwWnsqf/21ntd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 03:19:27AM +0000, Jan Bottorff wrote:
> When running on a many core ARM64 server, errors were
> happening in the ISR that looked like corrupted memory. These
> corruptions would fix themselves if small delays were inserted
> in the ISR. Errors reported by the driver included "i2c_designware
> APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
> "i2c_designware APMC0D0F:00:controller timed out" during
> in-band IPMI SSIF stress tests.
>=20
> The problem was determined to be memory writes in the driver were not
> becoming visible to all cores when execution rapidly shifted between
> cores, like when a register write immediately triggers an ISR.
> Processors with weak memory ordering, like ARM64, make no
> guarantees about the order normal memory writes become globally
> visible, unless barrier instructions are used to control ordering.
>=20
> To solve this, regmap accessor functions configured by this driver
> were changed to use non-relaxed forms of the low-level register
> access functions, which include a barrier on platforms that require
> it. This assures memory writes before a controller register access are
> visible to all cores. The community concluded defaulting to correct
> operation outweighed defaulting to the small performance gains from
> using relaxed access functions. Being a low speed device added weight to
> this choice of default register access behavior.
>=20
> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>

Applied to for-current, thanks!


--eeatwWnsqf/21ntd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVRgdIACgkQFA3kzBSg
Kbb6AA/9FTw80YLxbWFU9a0wXzwgAAfpQjGY0yFLtR/eKD2xz5y2QW7OECEybEqt
Pw+4AyCQ4bU16u7G00sFr8bIvBzLfdyYJWF3iq/C/DJTgmyntKBhQiwUi1yW2sPL
JaReunURNt3PkvTvJP7gnzrbqHEwCJj5CKVJJhCecQW/mnkEX3ItZiEg35OeqcSh
Dodes8qINljieF6kXdBZi395we+hxWE6IWjEhLLhukqYe8NMN9gvxUSq2xRO3S5n
PyHrXPSjap2YXIaWukbXi0b1c6eBLzEKZ83PlA9x2UVAAsek5jKHK+j/1Xcdw+q2
lwtI+fSsi4M2bu92e4nW68Ztx3FDfz3AJKWZhAxcW3LGAlGqItL/1DogcKCfXr0q
ARUqAHBowZRGfGS1AW/Voyiqu3xMItsYd6DpJFuE5s3pUb0ibitX6WpH7lWDcdaA
GePuB3YTHWPLtyfy2DJG177QWi5vjmhODcdK4iHFnVzhCKKCl6hUnhEFA9249tjB
0g8Z5EEGgv2vTJ+nWUIGUUdJj2moY45W1Q6D/zB9UIqoiQBaDdw0WeksoBh5loPZ
oBoEhO6NFjlSZ7+jypnUtI68vzQ2sMQmRD5yoUldBErdwYnniWwt8RW5xUMzqu0c
ls6fB3PE/dsT/2E7M2lUSxDz870pbFx3bHT6bYfR8lrXw7FeNuw=
=BWQO
-----END PGP SIGNATURE-----

--eeatwWnsqf/21ntd--

