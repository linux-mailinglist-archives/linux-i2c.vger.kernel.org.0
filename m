Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE3B3936AE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhE0TzL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:55:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234847AbhE0TzL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:55:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B37561284;
        Thu, 27 May 2021 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622145218;
        bh=7iGJS3rGmNjwNAFKUj1DAV7UgRQ88ngVvWvNYWXGUKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LIw+N207MJU9jaPOoUDHNfNm9YvYu35ktrOtPCJxKcQT/1YqLFGLcBIQuoIyV21wE
         qdQo3sd2Z/qjEExXmJ6C3e9aRcr7liZPN6gpNGps4r5YUqTxylBzwnyMiftJx/92lw
         saozaZq1DnCDw/y10HPIBqOKIpX7C15IitzaYNNAil8+7AB46MSAD8t86PQPx272yn
         +LaiTd5YgBPZyNSdw3S5iGiB/udPhs0aDfU5uf1keCJ5LpcdTkh8NjwbbonGDOnyM7
         PwYlNrYZiiupB0t0t35RXyF6lTrw2BLoBJdQI51pycFHUvh5QKL45VrJaNt13zrlwB
         5MQ7leL/XfLBw==
Date:   Thu, 27 May 2021 21:53:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Message-ID: <YK/4vuq0o1td4Zhl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <YK1HqE+3ILtGXZ7E@kunai>
 <87zgwigvd6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j+byiAwReNWa+GwK"
Content-Disposition: inline
In-Reply-To: <87zgwigvd6.fsf@mpe.ellerman.id.au>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--j+byiAwReNWa+GwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 11:02:45AM +1000, Michael Ellerman wrote:
> Wolfram Sang <wsa@kernel.org> writes:
> > On Wed, May 12, 2021 at 09:20:48AM +1200, Chris Packham wrote:
> >> The P2040/P2041 has an erratum where the i2c recovery scheme
> >> documented in the reference manual (and currently implemented
> >> in the i2c-mpc.c driver) does not work. The errata document
> >> provides an alternative that does work. This series implements
> >> that alternative and uses a property in the devicetree to
> >> decide when the alternative mechanism is needed.
> >
> > The series looks good to me. Usually, I don't take DTS patches. This
> > time I'd make an exception and apply all patches to for-current because
> > this is clearly a bugfix. For that, I'd need an ack from PPC
> > maintainers. Could I have those for patches 2+3?
>=20
> Yep, done.

Thanks! Series applied to for-current.


--j+byiAwReNWa+GwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv+L4ACgkQFA3kzBSg
Kbaccg//U0FSkmTl8Shy+mkH05iCQ7dM++sZ0S6Zn+tMKSW8773bwEJp4nfYEo/d
FTo5Z5b3tcAXho8jgOf5dY21uTGnXPiExKweICAaxIAbXqVkBzlVN+PoRXQe5PCx
cqCEkgeyMALeS8CRpprb4Vst5YTX1nld6w/cNPWERphNImNBvV0lqomgU39JmoP5
3CqeRrBUpjwmpTwX1r+sgfJ797EVAygGd1lWvq9qOnP/oojT94B69s6QDuZrgT3J
vrzxGkuMZpBFnWTOQuYeYS64UYB7P6/wTas0RU1f4Pfl8wo0Y+JixtjD6kVQbceJ
6qIOretW5JZOvs9b8Qu10dMMuOij+VnJsHu8kl1CkXupXUCw00qIjL02uqN2tv6V
49Z3Qd2b8eXBrMIZCN6F09ZiA4Q6uPvhpsqN3WoDi1HqgdTW/DGlzJjtElG75zkW
4sM/q2u7X95s+zy6KsNHnUrtdjEIKIjTzjDcdW6ZnVHatTVXzRJBqEaN/BZpFRoI
0WdIEAT7k4LXVSeHR/+5EPYZK74Ltqi2sVJJBu+j3+YG3DvcSwfrTqSuh5N3e+j2
A4vUewuGZ0uQcXkGNEW9FkDcTax3Em12JALcHNp6p1++i/RRoblFY0xDJI3o5yTh
hsb5A4L0hPBBrok08lOeW7rjXaQnrABNGss7UatOSHEKcBbR5LY=
=J+s0
-----END PGP SIGNATURE-----

--j+byiAwReNWa+GwK--
