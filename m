Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ABB307338
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhA1JzB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:55:01 -0500
Received: from sauhun.de ([88.99.104.3]:49816 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229578AbhA1JzA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:55:00 -0500
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
        by pokefinder.org (Postfix) with ESMTPSA id 6C95F2C04D8;
        Thu, 28 Jan 2021 10:54:18 +0100 (CET)
Date:   Thu, 28 Jan 2021 10:54:18 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [RESEND, V2] i2c: mediatek: Move suspend and resume handling to
 NOIRQ phase
Message-ID: <20210128095418.GM963@ninjato>
References: <1610180990-23496-1-git-send-email-qii.wang@mediatek.com>
 <1611661020.15158.4.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yaap9KN+GmBP785v"
Content-Disposition: inline
In-Reply-To: <1611661020.15158.4.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yaap9KN+GmBP785v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 07:37:00PM +0800, Qii Wang wrote:
> Hi Wolfram,
>=20
> On Sat, 2021-01-09 at 16:29 +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> >=20
> > Some i2c device driver indirectly uses I2C driver when it is now
> > being suspended. The i2c devices driver is suspended during the
> > NOIRQ phase and this cannot be changed due to other dependencies.
> > Therefore, we also need to move the suspend handling for the I2C
> > controller driver to the NOIRQ phase as well.
> >=20
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--yaap9KN+GmBP785v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASicUACgkQFA3kzBSg
Kbb1SxAAkdlzqRe2g/+FlrSwbUlvm/+2tdGA2oq/oRPw5uUiSeSC860KEdWS6q0b
eF3cQLo3iiPFeUO0bUc/JPpQn6ItaFDVfbvbBLX2hRJswUPXmVJxHqTQqOKuHgrM
rsCyXohNdxdT40Bf7+0VteZydDXFbcnStJyCKdn2RjjOXnpX4Y5kQmsqkMxKY4bd
4LXYyvKsuqfTSPqdvSKozOuspmNDI+/Vq8x/IZHccR27y2vz8vg7b6yRjiRQp2tc
0dwXzzIUYvMhKEK0ivfNe1uPMI9Sw7SD5i6wFzkT5DIuKfWRpiQxd304nExOvdoI
xe244OgI6WUCXgTax2UwtOnUdscIrP0Edc3wwf7ewdmCAqirUKsZenWbpBOcvdDn
lz5IGU5WOQjjds6rL/dYyUlhQRghhRpsmyiF65vFQ/80h0sEMP/g+CAq7GfuAXw2
rqNkOw4YGCqTy5oidT9s4g+69G8i6alQZ+p1GE0B/2KIzMgwPwcKS3NmIrwcrYEE
+lszyWcK2o3kkcyYls5hvniLK5zSoJomdfqwwRnCNeJng3GqAUaD34Lq5k7lmaIv
IgT3vOzUWN5V/gCtGg6SPEUzkalEhcQ3Z3eu/+nAOj518SLroSdHfWWqwkpktfjs
8KQgg+hYgQxHq5qvs9X12mbYiRI3ZlSnNISA7/k47w3US6BmlLE=
=eBay
-----END PGP SIGNATURE-----

--yaap9KN+GmBP785v--
