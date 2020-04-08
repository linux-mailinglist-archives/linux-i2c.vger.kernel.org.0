Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA291A29F1
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 21:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbgDHTwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 15:52:35 -0400
Received: from sauhun.de ([88.99.104.3]:47128 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgDHTwf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 15:52:35 -0400
Received: from localhost (p54B334FE.dip0.t-ipconnect.de [84.179.52.254])
        by pokefinder.org (Postfix) with ESMTPSA id 4B0EE2C1F39;
        Wed,  8 Apr 2020 21:52:33 +0200 (CEST)
Date:   Wed, 8 Apr 2020 21:52:32 +0200
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
Subject: Re: [PATCH v2 00/24] convert to devm_platform_ioremap_resource
Message-ID: <20200408195232.GB22619@ninjato>
References: <20200408182311.26869-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <20200408182311.26869-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> v1 -> v2:
> 	- delete 4 patches of can not be sent by gmail server.

I asked you to squash all these patches into one when resending.


--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6OK30ACgkQFA3kzBSg
KbbJrg//YB1abNWBUtHOjd6WYwEHpk0pyCEvijRy9NhmP23blGcNWDCoShvyBjtL
m3Y9ko5Elpbk4Sc8T773RsTEBj6X2KsbP4s54EQ3d08RfgWWHycP2jGr03T1AyGe
FXn34LZiHg0Ljvl/YBwNTwbmEcapYhGFDYQn9pWtpx6x/EONfmCBc2Ct9e4O6GLV
5L4hBx/M0XeplEasOvyizNsg/q9WSqUvHJTN6TTZlqj2Lj7n1V0wLpU/fuHiq6zl
7JOdDpsGCQJgJzrMKt+Ik3W5zZ0N1q+WaRy1Xmi5O7PyA4EAv6dldRMMfGeJKoiu
+aso1daNqTZ7zgr+nOZhaKDJ7aKxGWazlsUXgtTvUGQtCK7+hEchqAKpkckaw2rC
otptvek1FPBt8TjJ1A/2bc5HsPeHi3dVNfnUztYEh5K/UkA+J4vFVY0YK70tdfoJ
zN4Sct9EnwKDJGYcn/OY8/8/mzhBGkXnCwwfyNgtFPke+K+wucALuD+PKczw+pFe
yZlueeRDrPzuTo/6sg2PmR7N+ZZw0MVFHf619+RpJmjBUZtDHFpTQMLYLEybXADo
eWClPXL5rmxHiM/Nuja7/oZSMh770G11mlcocq2WVeHYvEOHIYXrCsEt/HUAh/nJ
FZx1CH2iTMHklxDIwYr6PfKVSjvHmiGImgcX0sCXwHIruwMysVg=
=4Sxq
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
