Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E1D270789
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 22:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgIRUwj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 16:52:39 -0400
Received: from sauhun.de ([88.99.104.3]:48598 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgIRUwg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 16:52:36 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id C43342C079A;
        Fri, 18 Sep 2020 22:52:33 +0200 (CEST)
Date:   Fri, 18 Sep 2020 22:52:33 +0200
From:   <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Subject: Re: [PATCH 1/2] i2c: mediatek: Fix generic definitions for bus
 frequency
Message-ID: <20200918205233.GB52206@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
        <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
 <1600343742-9731-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <1600343742-9731-2-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 07:55:41PM +0800, Qii Wang wrote:
> The max frequency of mediatek i2c controller driver is
> I2C_MAX_HIGH_SPEED_MODE_FREQ, not I2C_MAX_FAST_MODE_PLUS_FREQ.
> Fix it.
>=20
> Fixes: 90224e6468e1 ("i2c: drivers: Use generic definitions
> for bus frequencies")
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lHhEACgkQFA3kzBSg
Kbbjow//QIfxC7xv1/DAD8qHFZKWr2xqf18Z6s90nhgp+f/9icrHa688DcC0D9gg
4pgQlECnkgumniGAothwbe6PejMhlcJu8JnuGlCP5Wtm1i7vk70yvPkl7M2RG3hx
SE39FJF5Np1ztQ+qkk/ETtU70s7IIGmNz0YLBhvqvaeQTy1T/AdVMTR/Hxq4hEB5
SHQkcviltacPNaXwPS+OSoOtxrXYM1PHCnEamcigPbGQwpo7h5PNj4tEOP3elzya
xwzRCxdq4A4F+bd+i2ZMhvriANIVcVxXk6Sxc0vLEAexG/aWIltXgFNGrBwXro0o
1Ol0jp1FNcaWM9kOhs0sv8PTKZY1vd+ktHH2mUCGkT6tTCyHmXZSixFDDIjQ4d2H
y1MPP2RUkjTpfSHXv9v+r76M3o5XdNjpZctvgnqGR9J8DIdW3D76YfjPNN/ML6/P
BeX8BBLD1H1dLMeI9DjnVmidzESvm2xzhf6ftCJEfQTBlDNW9om8UvDTsR2rEQC6
yyjvbZMPnOUi24N5qXxVRc14QUitSJ5nMT/JrgaoqU8ICEZzLhQgSs53HLVFjjY5
V9Xvt2AMo19+f2No0MiU9oSzELCYC3VbOzTRQ/X/MoaPOBy2WMQPCLWvJ4c3Xku9
CeWL5b9x2rSL6KvZLufp6PTnb7cnOGLJKo50vlGrcvPCg4fSUyk=
=gn6K
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
