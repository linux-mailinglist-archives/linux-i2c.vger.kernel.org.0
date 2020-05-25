Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7A51E0E01
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 14:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390363AbgEYMAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 08:00:31 -0400
Received: from sauhun.de ([88.99.104.3]:35388 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390270AbgEYMAb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 08:00:31 -0400
Received: from localhost (p54b3318b.dip0.t-ipconnect.de [84.179.49.139])
        by pokefinder.org (Postfix) with ESMTPSA id 8CDE92C1FD5;
        Mon, 25 May 2020 14:00:28 +0200 (CEST)
Date:   Mon, 25 May 2020 14:00:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20200525120015.GB1149@ninjato>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com>
 <20200519084833.GH1094@ninjato>
 <20200522150037.GF5670@ninjato>
 <CAAFQd5CdmcYpSLsgOPJqo+=kOYundF5NZua4QpdOTTWYSYAopQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <CAAFQd5CdmcYpSLsgOPJqo+=kOYundF5NZua4QpdOTTWYSYAopQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Reverted because of regression reports in linux-next. I am all open for
> > the change in general, but it looks to me that we should wait another
> > cycle.
> >
>=20
> Thanks Wolfram and sorry for the trouble.

No worries. Glad you guys are working on it.


--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Ls0sACgkQFA3kzBSg
KbYw/RAAnN5EsOpnmC3+OqShVWwua8wemkNAG6xUCRzfA+Z4FFhF26NxVRDUiste
8tHUjRuVsj9aWjp8ik81EnWGwgdpQ3UeuO/OWqvp0vWfOO3QIseXAaqxfb1heJT6
3m3kpquvgo5pplmQv++f75zfbZQs4cre3TxvYfAKQx6P2cSYGccOZFc0/sQsYRmZ
pD0d7w4An9MnYVxmjkgIcqdUN1DeLKWKR4BvKR2yiW4fleXfTNNxfcwDO2jBMIDF
mpETmazfGbGGHBLFw6Xb5b15m0xhOdshOfaXJbfwKXNiL3OkUSyqjeAfKOTv4ssF
Y1Prbem4dfbR5sQ0FQFtvHNfwSf2BNqlLPxcIttT3zuio4+/Sm34SDb6JUq73zcW
Ka6L3HJvOudwA5MH5UFvQH+Nxatr4PXsd0J2d/tIrxLx462yYINhHffBIlvZoKXY
UyCFE5GSfo0OXtRv4NCTCSD1wtLYruRk1ladOR3PROotOzxnAixzW6bikSpmnofw
sgzLrKhsjgyHPKBalD39EzUZGjKHgcgMzlx8HGkUbArgENUdMBblY+8AH4tiAzEO
s8eyEb85sppbjIukh4rAEzzs3KxuvAlzx56+XSrKtCGiNqlw8SEoddE4f/1tNAbA
pd7VTdGTD6ItZIvgbEle8OC1E2xk0xA0/A0EXuV3s6VeRzjUmTo=
=N1Bw
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
