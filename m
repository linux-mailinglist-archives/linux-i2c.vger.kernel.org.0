Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFCB355C88
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347140AbhDFTtK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:49:10 -0400
Received: from sauhun.de ([88.99.104.3]:54776 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347121AbhDFTtH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:49:07 -0400
Received: from localhost (p54b3309d.dip0.t-ipconnect.de [84.179.48.157])
        by pokefinder.org (Postfix) with ESMTPSA id 463B32C04D8;
        Tue,  6 Apr 2021 21:48:58 +0200 (CEST)
Date:   Tue, 6 Apr 2021 21:48:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210406194856.GF3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
        matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline
In-Reply-To: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 13, 2021 at 04:04:24PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

I tried to understand from the code what the new binding expresses, but
I don't fully understand it. Is it the maximum clock stretch time?
Because I cannot recall a device which always uses the same delay for
clock stretching.


--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuygACgkQFA3kzBSg
KbbOjw/7B8MXTjgR11P25HsLFbayUrZDnsFzJtjHOTGDx/XGm4IVlf/c0RHjInRz
VGWqF2EyJA4cDlZTnnsYGadOBQ+SJSAo0xyDqwxmYIV5goFZdV0pFklMLuHEe4ao
rwSeruU9SCM8VdTGMBqsZ9Sh3nApC0ydn5EU7AIwtB+UwRKL7mFwyLX2ZfpGBJDp
gF6j+o/ag3nKMgsLdIf0l3afKMgbeTTepTkEAXYY/y+e06Ea77HuwghsLvoH0cxB
mKPuWLsF6Pr2J8FVb+iqBT6NDwfj9yNGdu96wbFTQaHzJ8rjjXdDyykju0whq8Fe
kux0ugGcM75AlJSxvJhhjcxjcA03LMbOrxhBCzLy6M46ho0GnFFJPFTF8deeOLwu
ZsWI3tifh+MW6tvSKcZzrooevCHTErPncCIxbVTJgIQu3q2HQK0hXBDz/7ede/oU
SlQSrxjU6jUzIYVkASYF3wN/eCj4e7fUuMXioyBf5v9BnMRLjJs1eHGs9c10ah1F
YbTm0oBxADH26HU3KZkAPcWajjWDmgOyjmfcmmcx6y0jyP4k+4ysvunP7QBUgwyC
PLEnZyI123oI9UToZY1UR9v/VEn8tkIhf1qmgI++yQtvwnFOmrvmzcvo5otc3G7b
2x/Hwt1/skpWkj341hmYG3q7ehYX4auMBCSs66OBLYD6UzSS/jY=
=LA70
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--
