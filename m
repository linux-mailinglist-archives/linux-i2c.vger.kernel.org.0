Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97886363225
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 22:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbhDQUC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 16:02:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:37836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbhDQUC2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Apr 2021 16:02:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57E4861245;
        Sat, 17 Apr 2021 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618689722;
        bh=mYlYNe9vhGS5GN1BHRstkMtGknRsuT48a1sa8RFcZL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AK4DfimelZx+dUHM+pQJ1BVccfz/TA8CF5Ab1uKpGlF4gCwO/HPVsuzdaNW3CnY2q
         0NX4to0QibKvQMyrTXa/1Rx41JB/3NF/sSOodH16D02QbG0wCgrskzFSIMgDvPfor5
         jwrSKHZ/LAP5DIwaFNulNl0mpGGE+E+KVxpFKTnVG6lXi5j+QykU3pX0ybLFa+idIt
         v8WRYxY9r1G8fLeq06+YMCL2zTXW4G2lbhqB+y4mMNt72nUFFJoIUXqZH0dc9RNS7u
         YZg0OzYyd50wS614i7K52OImHfq/HK88cktywgABM1s/dbjd4rTuTVxbEVVHr9WiML
         uPr8pEZC41obA==
Date:   Sat, 17 Apr 2021 22:01:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: sh7760: fix IRQ error path
Message-ID: <20210417200154.GA9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        linux-i2c@vger.kernel.org
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
 <5b81bf63-edc4-bb62-3aff-4ae9432e339b@omprussia.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <5b81bf63-edc4-bb62-3aff-4ae9432e339b@omprussia.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 10:05:05PM +0300, Sergey Shtylyov wrote:
> While adding the invalid IRQ check after calling platform_get_irq(),
> I managed to overlook that the driver has a complex error path in its
> probe() method, thus a simple *return* couldn't be used.  Use a proper
> *goto* instead!
>=20
> Fixes: e5b2e3e74201 ("i2c: sh7760: add IRQ check")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
>=20

Applied to for-next, thanks!


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7PqwACgkQFA3kzBSg
Kbb3Sg/+Lvs++C2EEsf0HRgwcF/tryrtpGPIEbj4Ig6sJpWb8WQI1BSgeAYHxEuT
A9nqzNUa/M1/EeXJA5aXiE/mdNSePbf769zqzn4k/NlC4bC10stSm62HKilvgT/f
6d2C+lrz4umURCUmiE5a0/t728z/tctArMm8BqxaYA/4G64LqfXyhb93/tNheL8I
0N29W2z5MWQkIYe1rGR3JxvOEqV1+dAPgwfzGRbt8RPfthPbc3Z/1YkbeclU0UD5
GZB+bV83MRNiaQjdhV3GJ62GIG0ZoJuRR7bYDGLhJL4+9AjcjVbOwEnk90ZtjZtN
Xg18VrNFH3Hz0KOEVFHGQRP2CarXp/VMCNTNJpcpj5b6DQEK9ZYZFhmqpNuStrwj
PZo7vEPZPzRv3QY806JSQOkZSGtT647vRMhrZeHX+LE989OaO7zjjJlQHohqyp7F
qor6E5F7Qd6Vm+qC6S5ZxMssOk2HM0q5YQBvhXFJpbvU2DTKvmLIARHwYukZQcMw
148bnd3H4pxWHkQ1jt/OsBaNet5KRKP0XcdBihZ6RIyDrj0lkaKpHFVJV+f4l/Ru
5oAgNhHM02tSRT9TJVnEGZirGi/Ft6Uq8A3zfO0ycrnW3tlzY1LsNF26q6bbRVaA
Z1IyFvzHiERV+jRCLjiW9Lnlem8/for7YCh2QsoOZ7qJiH5atKQ=
=sl0+
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
