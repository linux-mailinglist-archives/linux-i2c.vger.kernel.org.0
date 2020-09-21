Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C29271F09
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgIUJjS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:39:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbgIUJjS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:39:18 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3A0B2151B;
        Mon, 21 Sep 2020 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600681157;
        bh=aMczpGqXtPI/LNHqyP5LpS7scjs+KqG3Q940lW72ss8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q5Dtqh6rIDcSpfWs/+63d0rQFosBoVOA2fRD46aTCXY/VOUR4PVdMGfNz4i1yWYv+
         eSok+EhNkGgvDV6U25OtfYL6cW/XHVzPY1sEljzA6KgUv3PDf094lfF/ZcZNBQpnJ/
         p3ZrNYA/1vkFIDiymhgds6C/mCkF26rYJdwrimmA=
Date:   Mon, 21 Sep 2020 11:39:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     trix@redhat.com
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, natechancellor@gmail.com,
        ndesaulniers@google.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] i2c: amd_mp2: handle num is 0 input for i2c_amd_xfer
Message-ID: <20200921093914.GJ1840@ninjato>
References: <20200904180647.21080-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvznHscUikHnwW2p"
Content-Disposition: inline
In-Reply-To: <20200904180647.21080-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GvznHscUikHnwW2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2020 at 11:06:47AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> clang static analyzer reports this problem
>=20
> i2c-amd-mp2-plat.c:174:9: warning: Branch condition evaluates
>   to a garbage value
>         return err ? err : num;
>                ^~~
>=20
> err is not initialized, it depends on the being set in the
> transfer loop which will not happen if num is 0.  Surveying
> other master_xfer() implementations show all handle a 0 num.
>=20
> Because returning 0 is expected, initialize err to 0.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to for-next, thanks!


--GvznHscUikHnwW2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9odMIACgkQFA3kzBSg
KbYswA/8Dr/QwVbjfGkDlOvW2zJybPB+fpYamXJdBiftsNc/WyLDoLrw3236A987
oRLA/UXcxyVRaXsFNDc7hoGG1GwxpqmiVFL34mGo02O20PtpO3VBFbDGk+oDYyF7
AqWjxFw1xLSWx2pYQM6KXcd4JG7+wPT/XJ5eoRayLabLMoIboQWTM6LB2QxH4HV1
/uDlVXuIY/q6kWJLuR1kUJ8loYo2n2TV5+9LSPLxNPfkmfnKfbDsf1AnqNEWRG+3
y8CSda2VL/jvP3FAfsef+4i+2hKpW3PWoFrClgSl5mErw5g75+AO9P6WO7mQGdyd
I4RybjsfXh5BaEMzyRVu1jcefcTdsir3Qt5025hRloMxZHNa3FnEU4XYvqHmNchG
zSpMR6ynpQgbUGYh1N0Vi/jv1EJgPVi/vjH7XlA7+wMBOt9lIUiXdABSrWDEquOQ
k4SJpDfIrSc0s2PWwMKiSPZkIH+wcrEnbXiFv/oVEw/AFf6mOihCVGbsomGn0hMh
jSaHryCszQlzWn3J0NIyu/1v6chPTL/WuP9tVXP0lKRmSFzAdCUxupemqLWnIwuf
I454ZgIKhZLsWk7v9qicDG9MTpJEEK63U4tBtmjHzCsg0f5cHO7YY/+liIT4H5/b
Vyp27XqWrVJMriJda3rfF8htS3BcN+FXZtBVmXk22NCGQqhYN6I=
=Kytx
-----END PGP SIGNATURE-----

--GvznHscUikHnwW2p--
