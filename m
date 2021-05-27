Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F1D3936FE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235774AbhE0UWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:22:13 -0400
Received: from sauhun.de ([88.99.104.3]:33244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235528AbhE0UWN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:22:13 -0400
Received: from localhost (p5486cb85.dip0.t-ipconnect.de [84.134.203.133])
        by pokefinder.org (Postfix) with ESMTPSA id 1CCC82C0548;
        Thu, 27 May 2021 22:13:02 +0200 (CEST)
Date:   Thu, 27 May 2021 22:13:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Rename i2c irq name
Message-ID: <YK/9TUCeJ4KK2iOT@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
        matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
References: <1622115110-7051-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sILsGz3QvM1DFVBY"
Content-Disposition: inline
In-Reply-To: <1622115110-7051-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sILsGz3QvM1DFVBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 07:31:50PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> Rename i2c irq name with dev_name() which can provide unique
> naming in /proc/interrupts for each instance of the I2C IP core.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--sILsGz3QvM1DFVBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/U0ACgkQFA3kzBSg
KbYx6BAAkWj58w1lFsKaQkAp5AXfhbhvCamckXfqayy0Ezqeo3McWRJ/xndBAP2M
kr+SatOISl5dFYUm6QKcoOxfzCHtz+BqSFW/Qi8lr141mizyc4dR3Pw9Zdjuj08E
D1IIT7xEK6OCCDpgpgh2fr/gsaZ6vLWeeA8775Wc/2KN5XVDdP7lVIFVG1adTXEH
ucip2ZHgzI0LXYoVQaFyQZuDccBgkqX2iIHvlFkW+f3ikI5x43APXwX4++Kt1cGw
y3Jpjsy7Mu7e4m/AW77CqE0YSkAXRqG+ka8eSCtuT6wB8rVSZNOJnLVubt8muOic
yJcPy6Dp9gv6PwD+TNttz6sDB2ZO2I6ENqNFE/RZQRziGCBAMhAm23zuir0wHbyY
WbK5HZ0Ge5nHixHNUUezwKuQFusTf7aXV+ZIl0H86N8cMgPrWvH+0GSjeApH+Aq9
zfrDLOIL1Dzx1HWkmeEqXA3S0ZmlDhCLOdP/gi3gkPoOJU8PdYkbonFQxgeCdEiJ
1e/sMvpe0PSwAc+I0W84FEIyxCnhZTgi4Vf4GSWYjC9Y/3hDXri0flAa1grBxezN
4yAoC63A6Payws0xWLtPzUrHTQsNFm9zHuTo5ehVYBi71kEpViXZAHmnWle6lOGJ
PuSspzq81THiIxCSRwSwSTmyOt/JG/gEeSrk1CHMD3IZmGCq9F4=
=lM8p
-----END PGP SIGNATURE-----

--sILsGz3QvM1DFVBY--
