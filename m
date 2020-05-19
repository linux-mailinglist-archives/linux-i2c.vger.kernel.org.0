Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62431D909D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 09:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgESHAV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 03:00:21 -0400
Received: from sauhun.de ([88.99.104.3]:50820 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726881AbgESHAV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 03:00:21 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id B30782C1FA8;
        Tue, 19 May 2020 09:00:19 +0200 (CEST)
Date:   Tue, 19 May 2020 09:00:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v14 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200519070019.GE1094@ninjato>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-2-bibby.hsieh@mediatek.com>
 <20200519065323.GC1094@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline
In-Reply-To: <20200519065323.GC1094@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 08:53:23AM +0200, Wolfram Sang wrote:
> On Tue, Apr 28, 2020 at 02:18:12PM +0800, Bibby Hsieh wrote:
> > In some platforms, they disable the power-supply of i2c due
> > to power consumption reduction. This patch add bus-supply property.
> >=20
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>=20
> Applied to for-next, thanks! +1 for the comments Rob made, please add
> given tags if you didn't make further changes.

Waiting for v15 because I found issues in patch 2, so remoeved again.


--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7DhAMACgkQFA3kzBSg
KbZhgg//c67yPIilVIGRMtBB4JmwH/syxgrJvCv1M8pPJOMIddb9VnoDpYjN8WQQ
zrCjSmuW5JzdRGHZUaCqOY8nQUxlFObPJHu9D/4kv6gnupJuSTtyJi9ATgG+agMF
kpFdxaZmJ4epmKif4IV8aJxG+NyS9PyMs/RmEfLiqgTy/FH9lF697maYmowAgCvT
1PmO0WGY/iBrsO5tMrz18+DnW2JVsSMX2wr889Mq8qONTajw02YJusnBQTY66rGP
7mU5NV/ajCKJGPsY7bZ6iS5TAA9chBbYH4s1ZgfcovGcKQ5puPH4Put/lG8cM2/h
wSm/jva4/HIFFKQBTIxD0LP783vslxwbnzK4R6F8KWhZ+/lyM8yfFRgrc6k+E1TO
7An/5h7ZBKYBc4a2ktI2P3lXipKLOlx5yaCZJGk6yIMWzA0Rmo5Enp2Q52beL84t
5dxi91aJwDBT548RATSh9UJQtFJ4SeuMrRdroTAZ406GYyfp63w9wvLA3bqOAmUA
c73zsUXDJQ3PiSA3/UTivgopt+SIUZY3yLw76+9tTmGSJI0P/MRHoDCtNrwmZQuo
jn5Md77ZHoHn014YMC3ZS4LUc6TG9QijsUdGnH6KZBJHs868ZUGi/S20oUtgqkN4
t4wqJU6WzZO2itvJn9sLaOE9wjqY+k2WbWFbrByrzx+xb6KgA0c=
=4hFP
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
