Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917341A9A30
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896339AbgDOKMf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:12:35 -0400
Received: from sauhun.de ([88.99.104.3]:51402 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896333AbgDOKMc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 06:12:32 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 272D72C1FF1;
        Wed, 15 Apr 2020 12:12:30 +0200 (CEST)
Date:   Wed, 15 Apr 2020 12:12:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: busses: convert to devm_platform_ioremap_resource
Message-ID: <20200415101229.GG1141@ninjato>
References: <20200409135224.7426-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Content-Disposition: inline
In-Reply-To: <20200409135224.7426-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 09:52:24PM +0800, Dejin Zheng wrote:
> use devm_platform_ioremap_resource() to simplify code, it
> contains platform_get_resource and devm_ioremap_resource.
>=20
> Reviewed-by: Barry Song <baohua@kernel.org>
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Acked-by: Robert Richter <rrichter@marvell.com>
> Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Removed "my" Suggested-by and applied to for-next, thanks!


--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W3g0ACgkQFA3kzBSg
KbbvDg/6AuDzpKihXYH/WBCmS2baaoFc7NYDSFPl3rNinWlRPjBPDt56O+r0CzHo
G8fQGCaQmrc4BjRo5fFeKJdUwI4LIziigv0XmhHPaGjo3pjT8gjcfcfgMYlg64w/
loC9yZOqaf+wCT1E+2omdi0Lgcofk82ViHfH+wt25UcG91og5VtDFwCNhoOltMFl
m/jrmi04994LX0qPkelhve2BomrDGbTWW8I5VQ92mnOCfowu1b8Qh1nEByQMcnvy
1qbPbJyI96slNtab/C9SfeBDluTVXvxUsNUiLQYrge7fliFx1KSywuTH7snbMjiE
yVn8fSMLeUzpqwoC8iq4CLXJggV/BX+KdXIEI3tQFI4lArp0O1Xpc65Ri2A9O0oI
cncXHYCUP0r5/8/LFS1CgVyDV/VZvfqP/qQqJQ6bBqWG2hBStjf2ysbowtJvnIuR
B9rnzi9lsU7wC7YGHnZXRy1wJ8deh4V5sYOy8lRi8LL7kmP9ktVbLxbaXA+QoiZe
APO77TP68ORPuoM8gMjDO7vYk7SAk2L0abz1VpGofJ4KPWao6w1CVpaUfdJIBYt5
4E4r9i7XmYs9Mn+uHd4D01kcEIKr93b6nU8s7hd88hb+6Ee1YUSFTaE2jmV59rKJ
6MgTxXuvU/BjF/wr+yP1CHNs8sipsDF2IjDP3qBSg11v7e/YsM4=
=FGo9
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
