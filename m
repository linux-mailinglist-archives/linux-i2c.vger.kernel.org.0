Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0D41E7CE7
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 14:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgE2MPE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 08:15:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:45710 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726052AbgE2MPD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 May 2020 08:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ikiLOmmmRlxKoSjEMckw6zszhFPv
        +PQUVU+DitLA2iQ=; b=TqVqKbwwKTchEYyn035Dv1V70QxQp6toItUfvpoknkAF
        o/w1S+L158o5GLjg7lGlpd/Mo+0nDIf5H8lk+m3rMe0mrs1Nx/BYmsLZlGERaxq/
        muKwVsCb1bLbOBGo0T3utKMH8gP/uTjh+kodChWdaxeGu80tvGHRmxhc/FDHkGs=
Received: (qmail 3917981 invoked from network); 29 May 2020 14:15:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2020 14:15:01 +0200
X-UD-Smtp-Session: l3s3148p1@uA0BZcimvOggAwDPXwezAI8QqI2eop5A
Date:   Fri, 29 May 2020 14:15:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] i2c: sh_mobile: eliminate a misreported warning
Message-ID: <20200529121501.GB20272@ninjato>
References: <20200429124017.397-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <20200429124017.397-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 08:40:17PM +0800, Zhen Lei wrote:
> The warning is caused by the branches "if (pd->pos =3D=3D -1)" and
> "if (pd->pos =3D=3D 0)", because they appear after "real_pos =3D pd->pos =
- 2",
> so the compiler doesn't known the value of real_pos is negative through
> these two branches.
>=20
> To avoid this warning, eliminate the middleman "data".
>=20
> drivers/i2c/busses/i2c-sh_mobile.c: In function =E2=80=98sh_mobile_i2c_is=
r=E2=80=99:
> drivers/i2c/busses/i2c-sh_mobile.c:396:26: warning: =E2=80=98data=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
>    pd->msg->buf[real_pos] =3D data;
>                           ^
> drivers/i2c/busses/i2c-sh_mobile.c:369:16: note: =E2=80=98data=E2=80=99 w=
as declared here
>   unsigned char data;
>=20
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Thanks for the patch and reminding me about the issue, it is correct.
However, an identical patch has been sent before and is now applied in
for-next:

http://patchwork.ozlabs.org/project/linux-i2c/patch/f526f90ea62741716de2ecf=
a310ba22d8cf1d3c2.1557377015.git.viresh.kumar@linaro.org/


--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Q/MUACgkQFA3kzBSg
KbZNCg//R//sVQjPG752lJXc+XtMslCaebpFJcLlEAe/YtOpImSQsVJyFgBKHe3y
J6MKzGdNxj/DpT9UFYpJcOdV4pzKAqSFzoEELYWq0oaSsFv9ZKTLlHIdBSpdttEg
zxld0IUIH5FUJRDU3xGSlBeZXMbOL6vGlII69e5WwhrCQK4ciSMyHs1WWj83/23d
1OZ6cVRvm+LxrUrdDbrsFyfzhTLRT5YSLyM32+lQyb2as+L5FV+AXvnZfS8gmOuE
KwM9zT4q63uthSKjypcMdtxE6WZJPtw8xCZJx7lEU5A7u0X2ZC7V/s3HOZa1fXCS
9qzt6KBp8zgZiF3vuKg/XhcgwXUd0o1INz1aow3IfGC14kqiwA4Qrmh+TnKPWzBD
F7XDxoHkU+lX7T1294XV7V65GPgri9Yc8IcWjYTPrdeDR/vBoMJ5+MpRNMeM7lmJ
bxYV6GfY2ARIZ8/T9t9By0yKAbD2MYe1Ul/TRHl3NAu+331+ySEp9hI02Zksb7sf
U1y8yn0alsoQ2zoIjFVlMKjniEx1jt7teadnsIFsN5bqqgUur72bg/V04FwQYyU4
AZVL+hI37wtvSeSPghsyRRN0PlMunO4QE2P+HU7Da5rOhyl391aWrPBIJGyn0Duq
96WjkyyGRPGVe9bp17qFqy7wLYtvHZ1QNJLpRLtc1Bio9vqThPs=
=Ygc/
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
