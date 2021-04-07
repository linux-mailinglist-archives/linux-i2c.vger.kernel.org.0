Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AC2357414
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355161AbhDGSUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:20:00 -0400
Received: from sauhun.de ([88.99.104.3]:37598 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344500AbhDGST6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 14:19:58 -0400
Received: from localhost (p5486cf96.dip0.t-ipconnect.de [84.134.207.150])
        by pokefinder.org (Postfix) with ESMTPSA id A2B1F2C04E4;
        Wed,  7 Apr 2021 20:19:45 +0200 (CEST)
Date:   Wed, 7 Apr 2021 20:19:36 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210407181936.GA1614@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai>
 <1617797706.32076.1.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <1617797706.32076.1.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Due to clock stretch, our HW IP cannot meet the ac-timing
> spec(tSU;STA,tSU;STO).=20
> There isn't a same delay for clock stretching, so we need pass a
> parameter which can be found through measurement to meet most
> conditions.

What about using this existing binding?

- i2c-scl-internal-delay-ns
        Number of nanoseconds the IP core additionally needs to setup SCL.


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBt97QACgkQFA3kzBSg
KbZGCxAAjTn07oN3fOfLU6hpW7yIEBiz+GxSzByvRRuqIrVft8GqetCvK5oMvd7p
diD/VhZ+4P1kw4/mA6zzsRpNJNerUBPeQ7xsF7cFMU7cfvG6A0zUuOieWM7+zwvw
zCllS2a+a9Pld3QZQKhQKySazasct2LvhDh2HOpiNwm+mtmpWFur1c2Wra+JovF1
soq+CYPCOB/5OkZvEGhpsXIvoCJp1/hlx3hEuAGPh34ZkOOWoZBXty6yJJsTOH+m
r25H0sceNddaabw05fs+F90zs5Y6wgyCvaIp1mT/R51HKOHzR7dVLq+JZhy+AZKN
uQeGtveLnr8BcS3gud44R3AhBpejil8h0DNYd2BMGp7bqOujiWbK/GkRTfT/gnZA
w+omah9S/tGhZKT9RY/6lFjeI1mn+r1A3vmHfjT5WiONjMLcHLe9+5SvK/N4vfxw
cqEahaLoa8TkOOD7MI5gZROtwe4BDWtFdmyujWbql9a0lO/QGzGuchKgfBCDHGZD
WF35ChYRvunAJr3dyfbaThKS7/KpolBLQz+z4Hs2x7PkRmvyK18AIJkdv/d7c82O
scccsm6zgp1151zd9CfFKm355CmCgfUDU/naFCEic8HsmWAjc/gxjkNYpQyUjNPP
+BjFP14MBlLhaAC2vGVJTqKQnStBlWAfbUr8vaV6yL/0hBnamxQ=
=zMkw
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
