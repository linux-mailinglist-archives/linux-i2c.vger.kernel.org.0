Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B536A27ED
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH2U2T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:28:19 -0400
Received: from sauhun.de ([88.99.104.3]:43298 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726661AbfH2U2T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:28:19 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 85D682C001C;
        Thu, 29 Aug 2019 22:28:17 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:28:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pierre-yves.mordret@st.com, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, peda@axentia.se, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v3 0/9] i2c: add support for filters
Message-ID: <20190829202817.GT3740@ninjato>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <20190712082044.6eteunzehyptsibk@M43218.corp.atmel.com>
 <867070c3-02c8-da1b-04d9-0a1b628577de@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MET8MpPxp2u2c48q"
Content-Disposition: inline
In-Reply-To: <867070c3-02c8-da1b-04d9-0a1b628577de@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MET8MpPxp2u2c48q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I don't know if it will fit other vendors need concerning the binding
> > but for Microchip it sounds good.
> >=20
> > Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> > for the whole serie.
> >=20
> > Regards
> >=20
> > Ludovic
> >=20
>=20
> Hello Wolfram,
>=20
> What is the plan for this patch series?

I hope to review it this weekend and my hope it is good to go for 5.4.


--MET8MpPxp2u2c48q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oNWAACgkQFA3kzBSg
KbZrWw/9HqjOXK/IH1rLw2tSA9GN1022F4IumHkzV+65mZFNq21FwtEAjTScq2uv
nIRFzhRtjtBlov0w3t5prkUAuSKqKXiGgue/cDannWVLvdk/pcrTCERvQsBc5rIe
Jlhya4MgSnE3teHqrJy4XtKn3m1LUJ6I/XtTGzDl50KHsepFWGuITBXKIKpS+R1q
XVG1reJyxec3oWGHh1V1L+klLIb1HHWickcmYM2djZXrpharb7D0fIsdQB+1jSNR
qhOpL15ye5Gc/01JA/rkNsSz/TI7AQBekZrsVaSgehnvN24yG9JzP6jLhaNU+9Xw
lR5YY2FY8ubdAtcfDLYa+pJYBBxAtPuNfCMpVqaT/9woLF0gsCX4S8ggGAzne/MN
KfatKAkosRZhO2rnXfFDnnBpL/wCGFA4/xiECAjYv1kalCopR8dUeYCdWIMcI1g5
7MRqq9c1HE95e3Sh2mEPR3BHgDD83YmEjsYU6TOyYFoa0FS/A7WaQ1iqX7FmqZbm
WRLtrtD3aVGxUncuYxfjLpNRSmOGnowjcIVLrURVCSYMvYsU5ltn0t9xTDp9h6yf
D+rfsiFxcKnoasaeLaPauHCXVrgbbDG28tI+GoNTJkLjTZmWHkH/hPdcam3N6Qcc
hHQImfyLvBDp9ePMb8U8ombH/SLyT2cqdOXgSHTLflZuCazJWZo=
=S1+3
-----END PGP SIGNATURE-----

--MET8MpPxp2u2c48q--
