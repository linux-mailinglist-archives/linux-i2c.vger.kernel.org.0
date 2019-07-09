Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9657263E51
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2019 01:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfGIXWs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 19:22:48 -0400
Received: from mout.gmx.net ([212.227.15.15]:54177 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726133AbfGIXWs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Jul 2019 19:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562714508;
        bh=u1FhKHCjpKKk4zGtZVctqypPyAO5EX3bGkmrsnhboZE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=J3senOF5L3eWDp79uNdC/JL2KaUMb1y/vzOakiKZELSBLMNcEcdLsvi5mmQlZzBh4
         c4Uy+vXNAS0X0EQnSeb2e05Wu9KHbMntKYhnLKY9hjNk4YhgME/WvX89U/c0eVLE6o
         2vDAyrvtsZMLjguxoYsg1PBiaG0DPtXDwRmaHAKY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M6BKc-1ijAb00RlC-00y83e; Wed, 10
 Jul 2019 01:21:48 +0200
Date:   Wed, 10 Jul 2019 01:21:44 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Peter Rosin <peda@axentia.se>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
Message-ID: <20190709232144.GI22408@latitude>
References: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
 <7d47a978-5307-a2c8-acc2-f29ce7567bd5@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Content-Disposition: inline
In-Reply-To: <7d47a978-5307-a2c8-acc2-f29ce7567bd5@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:hPlL5u4HY5DqxoayKH7gTcS5JKbY7+HFTGMT5QDmJ4clt1D9fTR
 7gdoI2SqD01BLqEZ5Ab2pZAWU+WFiW3xYSgLi3R6iXQaYrWrxCf6eXJR9pAMg5H4ybHmHj+
 XJt6a3PkuKvQoBqmf9kgizXNWgHr4YQx3xRKN4BfcxsGYB9s/frtlv+W+tDBEZeiW5Mhvu4
 IWoEpKF2TnXMcv4HR3kvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vM1z5KBQ2zc=:IfTUzUMz0CjQH7/xwVYryM
 NiIYuZs8mygzWT8JKp4ReYk4EnmHYnxvl/IkOEsxbFaTXU4IyHY3XPRos/MDTx7BT1EcSYwFi
 Ky81PrqJv1rl1/nCYxte2q6HBruOHmI8bazxw+H+bmqH8Fd/Q+9EGdez5uEapv1JHPtU5Bw3D
 8ys313aIX3x3amcPAl5WMwLgA/82/b8rQUY26MazUyth8SGrAM3a3BIyUPLJIT70elzpSyIG6
 CWO5CeZ5S8io0JEFB2C+EAaPRzTTuAW1DpRbUy0ulpp9c3Z17psH+Xu1vf6jCwpOq2U+7WK4T
 89pi7ok8GlSCgUHP9edJxB0TJ/kKWo1ggUvjvlH6+jbUPf/i+7pzG3DOXV2zGo6zPOr0qjUtL
 TevWl5DAAUMy3SgOfftfH2MLDFU/XbRjj3bgSJXuOBjH85pS7goT/H3UmMZtXWpixkNm7/Xe1
 VPKS37Tn2Q9VGNvClf6AYYp0+TRBP7jpQvkrFNCxZzwJ7aGo6uXsLIKDfu9behmpa9WYlldjj
 lvVeNq2i6q4vaaQa3VjqHaIhtp+1ub1iYOWbdgb9Ucva5+nVzCOIYoJuX4UWI77YMeyvkzBpG
 6dfXiOcTRaGGFUG5iVwOWxPZ50B5Nug+L7zwMePsMIJvmqPrCk0pxSRL1pszz4+KxQGnLiZcx
 Exgzia5Nx3NywWJO7DSLtBroYqse8gv/VpKTeMDs4gjZrY9mPsN2REL1854p6A8FuWtmhL8Ax
 SW2A8SjdJbUQ5HZe0nIENm9d+YbX0NhrOuCxW3ozAINSVrADAoNh4xXGAnHv+X1sABmFTWGC/
 F3nigLoFKVfYr2julFJGWFSnn5N7jKRxGY1XYxM7D0bDolVGLsO+oSMoYfLXysmIzjeRUUQ48
 cv8JbqQvorGqFJjPfrhlKSn9KZ02yzfOAvFsn+aj6OKo+SOAywep80hYdGCLlDMVzbmQpfTUc
 2r0RiMhY0hwdyCJyC8e0qm9yL6+jgAgID4xBa87cdvisxQn7JfQOM+zj4uJB6pMxdq0mdeHBR
 F+tPjcttnl9CoJDrMYDuL130CWeRhmUgm+Blfu0H9ADEqMy9GTjLWlaUKW+imd1oVq8whNYbQ
 zuRE8j7ytbdMd4=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2019 at 07:58:00PM +0000, Peter Rosin wrote:
> On 2019-07-08 13:08, Marc Gonzalez wrote:
[...]
> > +	dvb_demod: si2168@64 {
> > +		compatible =3D "silabs,si2168";
> > +		reg =3D <0x64>;
> > +		reset-gpios =3D <&tlmm 84 GPIO_ACTIVE_LOW>;
>=20
>=20
> In principle, I think you should be able to add something like this here:
>=20
> 		i2c-gate {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
>=20
> 			tuner@60 {
> 				compatible =3D "silabs,si2157";
> 				reg =3D <0x60>;
> 				/* whatever else is needed */
> 			};
> 		};
>=20
> But in practice, I don't know if the si2157 driver understands that or
> if there is anything else that gets in the way. Totally untested...

So far, both drivers don't deal with devicetree at all, and there are no
bindings, so we have the chance to write the best bindings possible.

An i2c-gate subnode on the si2168 node looks good to me, FWIW.


Greetings,
Jonathan Neusch=C3=A4fer

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl0lIWIACgkQCDBEmo7z
X9u4tQ//Uspzp7ZgorenRjW67VpJ2QDBh+TAxqGare8VptT6VuPpxAewaQcvuSoL
TvyQPaFLfzRcpAWXLIUvLclYkJxXl5nTjvvrT0UAtiKMFvVG0dwz9TH+8BqMmaXp
87C8/IKZhOslJbqKnSFWhnVs2PX+vQ0rpwX3GlrPXL+7a/QNQ5ElSupxJP77Mmfp
uDyN1mV/G16KbD8dXvbx+cmHJClixxcpxQDzxG3rn+xpfRuRrNyhbKM3leo68n0p
MuNyU97Hxr6WfNXfSXSzvMQfYzs8lKKk6W2z7cA3TIB47TbiARXf2THz01F+Mrbl
lQfi89kYATuEyxGZflFg8TNM3aYUsZnDb7Z0oF6VfgoyrtCvaZ1LUBT2YJN+h1Y+
g7lLcpk5p/iYettqg7Uw+TTVl4eEccrf+iQbe8mpllI1xdEJD9roci4ejazYfSPI
SNA/O/Drt49Boyiln3NqikccL0ZIpFPg9wehe/OANsKIcKjMCcHi8ti5+uuNHWe5
E7U3BDsRfSBHVC2GRLfIzaq9qyfibczB7xr7shuf6fVEjSDQo9qAfRmOmlT+WY8Q
bCRJczQjOYcUrwQjXs+apNFleXm1cU0LAVzTFSwXhYjJpwrMZTojgxYvlmzoRkrL
p982FJil2MjgYPZzVc+pHm2+V4QfRNEecxK7a7TaO0140eMOa4c=
=KEcJ
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--
