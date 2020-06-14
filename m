Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946331F8921
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 16:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgFNOHX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 10:07:23 -0400
Received: from sauhun.de ([88.99.104.3]:55436 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgFNOHW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 10:07:22 -0400
Received: from localhost (p5486c990.dip0.t-ipconnect.de [84.134.201.144])
        by pokefinder.org (Postfix) with ESMTPSA id 5F5BC2C05DF;
        Sun, 14 Jun 2020 16:07:20 +0200 (CEST)
Date:   Sun, 14 Jun 2020 16:07:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
Message-ID: <20200614140717.heceqlwq75w5if5s@katana>
References: <20200614090751.GA2878@kunai>
 <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com>
 <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
 <CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ttzcavrxsgfcj6ge"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ttzcavrxsgfcj6ge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert and Rafael,

> > I've always[*] considered a pm_runtime_get_sync() failure to be fatal
> > (or: cannot happen), and that there's nothing that can be done to
> > recover.  Hence I never checked the function's return value.
> > Was that wrong?
>=20
> No, it wasn't.  It is the right thing to do in the majority of cases.

OK, if *not checking* the retval is the major use case, then I
understand that ref counting takes place.

However, that probably means that for most patches I am getting, the
better fix would be to remove the error checking? (I assume most people
put the error check in there to be on the "safe side" without having a
real argument to really do it.)

And thanks for putting more hints to kernel doc! I think this will help
the case a lot.

Kind regards,

   Wolfram


--ttzcavrxsgfcj6ge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7mLxEACgkQFA3kzBSg
Kbapfg/+NedKrAreny9QrDywewr7HSYOdccWDlF8ypEtOn6a8AgCHL0tQwkqSZPh
6hsCX3Eet+8pdogl+p/B5QRXXgpSkRd+eV6NDjiIb6MWCRfegz/Dgzo39qJXanfc
oSELotI/jA1/qySS08y9azi4QEgHS9scMcUpnCaaHhqFYwbYQMpXojW4WymaR7Z2
FTi9HRP9+E4KIggKU10UMnECpDqoVep0XLiuKfkLJjAF3AjtxAIcDMCN43+oZHtU
SotkwGThTiSYCOnu9gvBAGm95qtATj2orICxcxdnW4gWjFpV90tTmTRaB9+vrIOS
W/WKlzH5BCljiBuANdikjIz57X2QFz9YTGaPjmCfGMwBfTtWUb7fJvaxoXnYFo7S
w0nEGMlH0biTFPKgtkmSQQiW7ZVdXsDsYHgir/EqEGBNNIB5tal7op2ROT9+eLCa
IsaRycoJBaihulkGrxLpowOlJ6lREEdlhUcg+Pw09+6MrA/rDDBTN/qGnrbCnMKX
yxNuXqZSWA9xdPBE/b+qBFtU4t7Gs05NLaqmejD7/u1Sa/iLU71OYIdbkPEKRIS+
U+bUWJ3dzW4QpVo9m9Sp66IC2yTIVRVbtXS745+bWienhoch4YuPvO8pcOzNOmVo
DnGbIrEMHFkQjmmd+qmKnK/gkdeLkYsIuwAqQmWP5CU/QoujQEM=
=Bx3F
-----END PGP SIGNATURE-----

--ttzcavrxsgfcj6ge--
