Return-Path: <linux-i2c+bounces-13122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93592B974DD
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 21:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBB731AE0173
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 19:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCCE30277D;
	Tue, 23 Sep 2025 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZhJwk5YN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDF0279DCD
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758654690; cv=none; b=mmdG2nMrnc4rt5nVn0tu5h8z49aQZPsOEBIn85JvQnKxAbYgjdZmeQ8v+9ez6OKvUGJSVrzSDGit1ZXg1mpbRpRD/zTbTQs0Kkiw2ofu13cE8InVY4ED/tuNcCeEvuMXfogwkoOHweFgrAi98qvApD5fYrqFCF0UEO0NLV+lywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758654690; c=relaxed/simple;
	bh=A3afEZdKgo5Z/7ZqEzvlNOe7esxm3ReOhyYgrzD0u4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htsE6A0UfDRDlRwB/2dA0QL0jwg8pMbFPrfvR7YQysKnXBJ/JgGPqiosdE9x2pLleKaaHTxe37W3aIXRlvNqrKXtET+qzhn01bFtp8/RbGE4WnqiuxnE/54B8PYbCNN6qRQja4MqyF4MFL9+7jvF2Xz7+WeDiaLbAMy3Wr9oMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZhJwk5YN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=il7m
	KIbhlLFMxwpLXF7xOPnLrfLY+tEzDRhciDghTCE=; b=ZhJwk5YND1dbL06X8MPs
	hH3nvXXUbt7S+acll8W9ysH11+1S9wCRgQq/kF6l9nmma+iAzYksbry22NIGZbTu
	+FyxUJuCNC0/8bDWLaPTmc6fYIoRn2M6hXUm7oVM9BruQk8S4pJ1LwBKuMiZKpT/
	fKmxynKZ2OJO+o7BQjnYo1kFQ6234Oy5tNmDg30f/htbVuZ+gzFCYupWmnF1EGoJ
	Y/fYZh1esjCxVaTTF3NE8U+ksgxNGgfV8RawhadUOITTs+wTEq1zoz0jp1zsXyJS
	/XdV2R3XgWjFHRf2Z+CsuGP6WHbPmUig+b7Ps38j3uwRJzSXqETKF0GI/YDhAIx1
	oA==
Received: (qmail 1216493 invoked from network); 23 Sep 2025 21:11:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:11:23 +0200
X-UD-Smtp-Session: l3s3148p1@qlyrs3w/DIYujnsp
Date: Tue, 23 Sep 2025 21:11:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself as Synopsys DesignWare I2C
 maintainer
Message-ID: <aNLw2qMlHYJXQhk0@shikoro>
References: <20250923132603.50202-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9GH0E5554jnKP7h7"
Content-Disposition: inline
In-Reply-To: <20250923132603.50202-1-jarkko.nikula@linux.intel.com>


--9GH0E5554jnKP7h7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 23, 2025 at 04:26:03PM +0300, Jarkko Nikula wrote:
> My address is going to bounce soon and I won't have access to the
> Synopsys datasheets so I'm going step down being a maintainer for this
> driver.

Oh, noes! Hope to see you still around hacking the kernel. Thank you for
all the work on this driver and I2C in general!

>  SYNOPSYS DESIGNWARE I2C DRIVER
> -M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
>  R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  R:	Mika Westerberg <mika.westerberg@linux.intel.com>
>  R:	Jan Dabros <jsd@semihalf.com>

Maybe one of the reviewers wants to step up?

Applied to for-current, thanks!


--9GH0E5554jnKP7h7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjS8NoACgkQFA3kzBSg
KbaKeBAAoettWrl+Gsafmb2pihOEFpMpILB3Iu4T5Q7+qonUzay9rLSJNfY/KrqV
JwA1l4xhBf58KJSdk0I45ePdfaLj55z+sovhdfpCgdq8wD0gyZPXTD4eQNy7RYHz
jijgjK6DfA/SaAutzHjH8kpwiZUiqsNYhOrgIQgRbWbsnWIlB5wLeZDIEErZApAa
3XOtATrbjqFRv/rWSRFk/wtEwDIY4yADRMmYry+ZgomiYRyAuuk6MOFNVQxpMs8I
Q/A34r0BEwhj97z2hbQjtyFYJ02xrmITszMWQ3Bk+I9FS3r88FkQ6XQ/9vgHlVQK
oiwKUmUyF5pEidiKlX+JbddLiWkB3NM5VEfbHK0Ssz8KdL2ul2iS/d9MWzpm2oHR
eJd/o+v6iufvvYERWnouJG0ZLoT6vdM5IOa5Sc9D8ny/o39/A7c+UqyahzRRzhix
I4YK1DkFA/K66i4PajLL7CxVJOhkW5asmvgd9zFbIVM9wupLP+berz360zFP/mSx
fkOe/foEz4CDNhN8lFp6Ol2QZHT4RF7gUyRT+KRqhs976PQipiLeMT9yJGktwGtS
V/3PdEsKlZrWkVRKzXKhigtZRTD+KMSSMPqK1tKd6IPGaWVAL6vf2UY0k1a3vjXu
W4p96GiSNb4ZmXBiFy5g1JtE1D6SoTV0DxIA2yDv3hGUBM7M0cc=
=ytPn
-----END PGP SIGNATURE-----

--9GH0E5554jnKP7h7--

