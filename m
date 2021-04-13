Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF7835E784
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 22:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhDMUSD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 16:18:03 -0400
Received: from sauhun.de ([88.99.104.3]:39832 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231886AbhDMUSD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 16:18:03 -0400
Received: from localhost (p54b33d59.dip0.t-ipconnect.de [84.179.61.89])
        by pokefinder.org (Postfix) with ESMTPSA id E9D332C0570;
        Tue, 13 Apr 2021 22:17:40 +0200 (CEST)
Date:   Tue, 13 Apr 2021 22:17:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210413201740.GC2751@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai>
 <1617797706.32076.1.camel@mhfsdcap03>
 <20210407181936.GA1614@kunai>
 <1618228994.32225.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
In-Reply-To: <1618228994.32225.3.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 08:03:14PM +0800, Qii Wang wrote:
> On Wed, 2021-04-07 at 20:19 +0200, Wolfram Sang wrote:
> > > Due to clock stretch, our HW IP cannot meet the ac-timing
> > > spec(tSU;STA,tSU;STO).=20
> > > There isn't a same delay for clock stretching, so we need pass a
> > > parameter which can be found through measurement to meet most
> > > conditions.
> >=20
> > What about using this existing binding?
> >=20
> > - i2c-scl-internal-delay-ns
> >         Number of nanoseconds the IP core additionally needs to setup S=
CL.
> >=20
>=20
> I can't see the relationship between "i2c-scl-falling-time-ns" and clock
> stretching, is there a parameter related to clock stretching?

( you wrote "i2c-scl-falling-time-ns" above, didn't you mean
"i2c-scl-internal-delay-ns" instead? )

Not yet, and I wonder if there can be one. In I2C (not SMBus), devices
are allowed to stretch the clock as long as they want, so what should be
specified here?

I suggesteed "internal-delay" because AFAIU your hardware needs this
delay to be able to cope with clock stretching.

> If you think both of them will affect the ac-timing of SCL, at this
> point, "i2c-scl-falling-time-ns" maybe a good choice.

Do you mean "i2c-scl-falling-time-ns" or "i2c-scl-internal-delay-ns"?


--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1/GQACgkQFA3kzBSg
KbaUfw//WWDtCLJl71HVdmHWvPxYnsr5Q4WBAWP/wumIKyK7zaRS3r65zjoNv2d5
ozx5g3tlGjdfZWqa46V/y4M6V+7/UyREfhO+SEbz8UGE4Ch81+pDhLuc4lZMa5B7
tmt+mrZi1aHk0YsVxSXlPzTCfjbz4FbKDvNeOIsOyMj05Ar42RPBGnpeEKII9iJR
MmU9CpYv9y2kdejX/GiLwCwOihra71aahOwpR9iBsMTbC3ffFr4Xp6mhkWQaX7nG
8hhZbSomeBvgfQuLbVrzMbX0MzCh8W7Jy42xmLjJeJALt7EziJl6la+ANy16XqM0
azhtH6wLzPJnmrqN80EfEU43zENk3A1wpgEhz4iacoj/06sPinN8SXl10Ofeknzq
iFBK/kBcI9gtUsfs6q05uqS4sWvkZz6xZeRRAkSDRr7WKIt3np+o8tVQXX9tHBWz
/YnXwrbx4Vph5LO7dAF1RX3bfoBql9ElBPNsFexuEmNG54f6gBH5HEUoVfN9Vy2R
qxAcXgYPmZe5c9JpgASu9ehRYDCa2iVPTiSaxfYfbv+cZEtP40PaLrKnrnycOIi9
wMl4Dzr1llwrPqsCQpk5PvmZk4z5mEtCEKkTMn1lKTUF7xBVf9RPJbj588M8wLem
YrcqHgG4fmYb45AwlZEq4P66P9cuUowM1WVndjEBLPJO9pIM9hs=
=RODH
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
