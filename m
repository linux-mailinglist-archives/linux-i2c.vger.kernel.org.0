Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDFC27078A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 22:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgIRUwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 16:52:40 -0400
Received: from sauhun.de ([88.99.104.3]:48610 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgIRUwk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 16:52:40 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id 470352C1730;
        Fri, 18 Sep 2020 22:52:38 +0200 (CEST)
Date:   Fri, 18 Sep 2020 22:52:38 +0200
From:   <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Subject: Re: [PATCH 2/2] i2c: mediatek: Send i2c master code at more than 1MHz
Message-ID: <20200918205238.GC52206@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
        <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
 <1600343742-9731-3-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline
In-Reply-To: <1600343742-9731-3-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 07:55:42PM +0800, Qii Wang wrote:
> The master code needs to being sent when the speed is more than
> I2C_MAX_FAST_MODE_PLUS_FREQ, not I2C_MAX_FAST_MODE_FREQ in the
> latest I2C-bus specification and user manual.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lHhYACgkQFA3kzBSg
KbaJbxAAo4wNNMezn5vLQeKn0+GodAJ4sALS9nvYJO8arUk+0fSCI6MB/+5BOV6O
HwcsUHUhfqdg3XnJ1m8RcrS8sI2emNrJPrijm8PYs8xNt4CbXtuc44EZO0qKiQMO
9/fBln1+jfPwymPForcFycETkBAVdBbv7+pYYLcl6qYASyLzeMq64d6TS5V9V9Oz
USWK4dbr7Ynewi8M6aWL9p4c0wEB3I8bTpf2ZDOOQvWdyGfS547etpDOEy71K1+Q
9AVDHap40DjgNoysvKow/DyE0iTyI4zzBqqrcZARSguYVYXX/bmlRnmCCXSYKllK
86ikJeKM6/Tn4GOTo3LJhDT/LD39PdYxmfe+AjUvyjFUwDQ8E771DH0RaiNbLNrU
hIdeNB45ZD1zqRr+E6ihBrgDO+4e3GYFOtyD+ZaJuhaSaAHF8XUCY8+6m/eP86ix
wPlnSNvzm6rhCLJWIwQhC0NSlwlWIyOxosMjCfb7C/gx8dMJnn8IEUFnI0Lph8g0
+bS690O/1V48iT6FSIfGfAebQvdiddulj2T0WMNZxyfuTZoCBlETnE7J8tLNcxAu
/zEupaGjGgR23I2PpiifPOfLxUZRTn9HdTxPSaN7OiYswNsxtp/7Hcfl+a6NBfdd
xBfjNHfIkct66H6kzQpyfQyYnMHNzecGxi5bdvtXbfC+b+ztlM4=
=Fedd
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
