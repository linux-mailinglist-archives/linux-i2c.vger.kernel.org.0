Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30A4284635
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 08:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgJFGkh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 02:40:37 -0400
Received: from sauhun.de ([88.99.104.3]:57100 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgJFGkh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Oct 2020 02:40:37 -0400
Received: from localhost (p54b33262.dip0.t-ipconnect.de [84.179.50.98])
        by pokefinder.org (Postfix) with ESMTPSA id 4F0E82C0251;
        Tue,  6 Oct 2020 08:40:35 +0200 (CEST)
Date:   Tue, 6 Oct 2020 08:40:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
Message-ID: <20201006064034.GB891@ninjato>
References: <20200928155950.1185-1-uli+renesas@fpond.eu>
 <CAMuHMdVzkRwrwzju0tpsZ3DLvtUaebJDemKTEJZ0BmsdqSme-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVzkRwrwzju0tpsZ3DLvtUaebJDemKTEJZ0BmsdqSme-Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> To make sure external conditions are satisfied, and we never deadlock,
> as discussed in v3?
>=20
>     if (pd->dev->power.is_suspended)
>             return -EPERM;  /* any other suitable error code? */

Let's handle this seperately. I still think this could/should go into
the core but haven't had the time to investigate this further.


--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl98EV8ACgkQFA3kzBSg
Kba4UBAAtRj8Kgu97aG8Clt7RuvBLGN/yocAusHjzsNTKJBslODnULLFvuyY8qiV
61MHPpShikpaIisjoGtP62Sec05u7nS0DC0JmL/74afy5EQAI5QT6asaoKKtL6zS
TuY5b8EhQhSJDyDIwpv/WYc+8qowGK/8gHt2AIm1+6mS80ieq/4wvI51ICaMlCq5
Mp5LfFJnE/83sOdwXOVGSumYRmZk/Rhjolbxvbuolna7pCSxch8wlU66M/dWjekX
azJTxAJPLb2GRAK9E7mkSP1TyvEuAVs4hlfl2tqks2dGIKKbCSA2MlFNQgag+B5l
iIGeW64FxuF1GbRt9Qxoesa4yCwqDAzq94iHTMyBsGBJViBdWhf5YljEYesgFv8p
gEGvza4ffO4fIOuJGt1UAgMLvJmJP7FWpcPHQqKXroM3QpxQu38KDbra1cfOhohN
XC+y7Dfwkq4/C/Na4uJYVii5O9rj8/+VsFjGdZuMlBCH0A2AddQhCK5nXz6YN+ak
q5/NIuDgc87rgb/oKF3ko+TFq2stPxb4DOT11/ecrWFWR8wdDX2WrGmv+/GdqBEs
gB/9MsBQ9l4jtDyq9hI6c2Y7WFHrBFLf+LLRYxx4/2wkjgacQhbfkC+9HjMH9SDW
8NvnrnGRb79D6lHA9Y2zPDs/PJckMuII0o96KLgnUOZRyxAV1Eo=
=DbPj
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
