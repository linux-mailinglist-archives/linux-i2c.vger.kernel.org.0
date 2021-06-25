Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB72B3B4533
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 16:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhFYODH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 10:03:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:39294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232338AbhFYOCB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 10:02:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42A6661492;
        Fri, 25 Jun 2021 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624629580;
        bh=ytzKQS8bCkEd3cFquCwj1HLSv0b8bBMJjcOrWIGqJOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YIfOzk9AOpIwg0gcV/qUTK3WaR+kAX26gJIfTzA9U0ADQjf+ZsmjnibrWl215wgn1
         YzFUhvu7PxRPIzj9DuQZXPdiwzZYNAughl5UxXbkuPh8WIj+DbUV4dtA8LK8SJ4Oxt
         /k0DSqIHOOYTzS+QEq8GQGDS8HRlBCnSAGOxCfdPcsFNsvvVECCl8/dV2CGPiIXeNz
         WLwr53y5UIh3VmUhP4YIMNyPTRRNI4ImkSq0JXX2r8M0FSHylMyIYZ/zraSxJWP95V
         F2T5+VIS3/14uaBwwyBAuydj//XNxLLQPK/OggK1vcBsIuKBABU1W6zo+GhWvZuWNR
         dQ5OdaQR5qOhA==
Date:   Fri, 25 Jun 2021 15:59:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alex Qiu <xqiu@google.com>
Cc:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] Documentation: i2c: Add doc for I2C sysfs
Message-ID: <YNXhR+kDysSvZzUH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Alex Qiu <xqiu@google.com>,
        linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
References: <20210517235605.447845-1-xqiu@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2VanknAhnaWgYpk+"
Content-Disposition: inline
In-Reply-To: <20210517235605.447845-1-xqiu@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2VanknAhnaWgYpk+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 04:56:05PM -0700, Alex Qiu wrote:
> This doc helps Linux users navigate through I2C sysfs and learn
> the system I2C topology.
>=20
> Signed-off-by: Alex Qiu <xqiu@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

I couldn't do a full review, but from a glimpse it looks good. Very
detailed! I trust Guenter's review, too, of course.

Applied to for-next, thanks!


--2VanknAhnaWgYpk+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV4UMACgkQFA3kzBSg
KbYEuA/+MRUDfbR/tDsBBv+dPMeRUznHFyd30xmqIxqivd6YSlC0yhrU+9sgpT2M
8xgs9GMT9kq6Q1cjbE/92X/50BzdvOstf+cIqu3lZSKlpz6Hl3XeeTLRsGSGm/ha
wJhQ4vi7MnNmznODWVANHzl4mR1Fo1mNbWTO8KV1DT9a5gk0w4+y5D9Zm5MV0Fqq
yTlKGbVikbBSjvVPYMbnbTEKKCQfqUqZ58vTwpc4FjVCzvunX4qYkCxb5J1fkWSo
9NUyYuF2UzXxHqgUcj22V2q1vl55FrBDalUiG07GHXzEOp84g32h8TKSQwanCDVJ
NrvauDT5BoMBDOhKeZMJ43NGbYZ+j33m3tciOERRElXYftaXk94jM4A1UI2UHivV
GZhXk2CJ//58EpGPPzLXL9oGU9Mzzw/7CP7oq2cog2FtkGwivTQzXwCoHXvrMvOk
u+t1gt8Twgv0veN95Q3kF2bQU6NHkF1yjznsomrtRXfP2VE38OdQNeRiYUqWpjUd
kpbfbwVmSnsMJfajM5mXIK7jS/4bSPF96YP7r3iYowOJ8f2drNtpruvaGeBq0ui/
VTcX6CvrFLqez4sawUZYaoRaXHJLSqwb4Ye8b8aJKXzcDjWRze0xL8sq42CSU0zg
LwLyeBK3Q01kgcLkNFtQpSoI6JGW/aA/42iWMC6PmR51K0PQ0/Y=
=0isB
-----END PGP SIGNATURE-----

--2VanknAhnaWgYpk+--
