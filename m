Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731154403AA
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 21:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhJ2UBa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 16:01:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhJ2UB3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 16:01:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5739B60FED;
        Fri, 29 Oct 2021 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635537541;
        bh=JxvJaU3K4d7PAj1ltVrWHEghB56nXxJz1faw+qBhQKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BKZ4o03B4rdr/16UsdnRgej/7cJVqvK21TdacXCnKwYa5UVBsgK/o6m44YDF8h8nb
         37BZUho95ivNb5jwlbw633865/4z+i/S/4OAwQ1/t7eyuB8g7DUoqocZA2boCMj97p
         qcOIzrtfLfqLgN6iZ/9SnsYQSA5lQcKS9bJBzzULIHslfIOy8s9pYldArDy6pDfEIg
         w62YN6FZYVnuKfjia+p9KZTWdS4XankXhkH9Kn/aWUJrtdHn6CSZfziD0iDJWKc6Uj
         ZGNZl/bp0ul5jE9VGlH0VZLBIVcBSD3xHN8PkaOM2Cl3dE9W9rdAxVh3rqOgkb7BzE
         mVZBESRev8W9A==
Date:   Fri, 29 Oct 2021 21:58:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: move to use request_irq by IRQF_NO_AUTOEN flag
Message-ID: <YXxSgE3N98YeihwL@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org
References: <1616124571-59218-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UyS2c6Jed8OozTJL"
Content-Disposition: inline
In-Reply-To: <1616124571-59218-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UyS2c6Jed8OozTJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 11:29:31AM +0800, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
>=20
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to for-next, thanks!


--UyS2c6Jed8OozTJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8UoAACgkQFA3kzBSg
KbbLhA/+O695OD1EbqyXBpILT0bFSYMp47U8G4vI4n1yQv0VNVw4iFAfgya3hZP+
YCVHoJKGO5cZjPZZUPxkGMaN+PkHXacWWnIkHCyvrRpwvux6/SGqCc7hDJ3Gdo8s
V6zKTqkYZIkL6nzJgNgziQZdJ4BZU2FaZIglRzLKQjbN51fPL4SgQiBAPPmz8Klj
MJs6djYBjRz4CkxdvyxBwWBvIVXVC7XLESoHN1GH6aGg9OBKztfQ8gRn2H4pwrnU
/jmASI4Q/W0cGXyuANNWCB1QVvrhBy6Qe2763m81hmu7SnO5CE7t8dT0Xzava/Jw
M0IEnlXzK3GR4BTqm/mFaPGyG8JFcXTolHiG9TjEwdQJRdqIIsUNcIjCI1UuOv/A
Nge22AR8m9uEUkI7lgM7eyvfggTizZS8RIKKULGT3GhvurqsqtEUP+9h2FKdXVtW
UytuATBzQHclQo2coxFWjLpA5y6+/OO+dvYXPflFyQl0HMOVHVbyAfZIFYsrGHlK
5xPs9vWcLEWwyC+h1UdDnbaDqep6L2V20p2yTn41i68Rn9MN/nDEeoFzFhNK1834
SRGZcHWntgEQVvC6XaSAI1Wo2yUXoxerEA5n5AGawsR9lt4P+sIGxYEtwCZ9VZ3J
wpFyKB4sR4/R4tzDDGrcKC+hXbNxZ9yG/qJBbxDQUh+J9Swp7Vk=
=JeoG
-----END PGP SIGNATURE-----

--UyS2c6Jed8OozTJL--
