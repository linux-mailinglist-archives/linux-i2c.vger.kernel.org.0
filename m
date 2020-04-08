Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BB51A23DE
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 16:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgDHOQs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 10:16:48 -0400
Received: from sauhun.de ([88.99.104.3]:43946 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728096AbgDHOQs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 10:16:48 -0400
Received: from localhost (p54B334FE.dip0.t-ipconnect.de [84.179.52.254])
        by pokefinder.org (Postfix) with ESMTPSA id 126DE2C1F39;
        Wed,  8 Apr 2020 16:16:45 +0200 (CEST)
Date:   Wed, 8 Apr 2020 16:16:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        nsekhar@ti.com, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net, gregkh@linuxfoundation.org,
        tglx@linutronix.de, bigeasy@linutronix.de, info@metux.net,
        hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 00/28] convert to devm_platform_ioremap_resource
Message-ID: <20200408141644.GA21666@ninjato>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20200407163741.17615-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 12:37:13AM +0800, Dejin Zheng wrote:
> this patch sets use devm_platform_ioremap_resource() to simplify code,
> which contains platform_get_resource() and devm_ioremap_resource(). so
> use it to replace the platform_get_resource() and
> devm_ioremap_resource().
>
> Dejin Zheng (28):
>   i2c: img-scb: convert to devm_platform_ioremap_resource
>   i2c: mv64xxx: convert to devm_platform_ioremap_resource
>   i2c: owl: convert to devm_platform_ioremap_resource
>   i2c: exynos5: convert to devm_platform_ioremap_resource
>   i2c: mt65xx: convert to devm_platform_ioremap_resource
>   i2c: designware: convert to devm_platform_ioremap_resource
>   i2c: zx2967: convert to devm_platform_ioremap_resource
>   i2c: xlp9xx: convert to devm_platform_ioremap_resource
>   i2c: xiic: convert to devm_platform_ioremap_resource
>   i2c: synquacer: convert to devm_platform_ioremap_resource
>   i2c: rk3x: convert to devm_platform_ioremap_resource
>   i2c: qup: convert to devm_platform_ioremap_resource
>   i2c: meson: convert to devm_platform_ioremap_resource
>   i2c: hix5hd2: convert to devm_platform_ioremap_resource
>   i2c: emev2: convert to devm_platform_ioremap_resource
>   i2c: jz4780: convert to devm_platform_ioremap_resource
>   i2c: altera: convert to devm_platform_ioremap_resource
>   i2c: axxia: convert to devm_platform_ioremap_resource
>   i2c: bcm-iproc: convert to devm_platform_ioremap_resource
>   i2c: davinci: convert to devm_platform_ioremap_resource
>   i2c: digicolor: convert to devm_platform_ioremap_resource
>   i2c: lpc2k: convert to devm_platform_ioremap_resource
>   i2c: sirf: convert to devm_platform_ioremap_resource
>   i2c: stu300: convert to devm_platform_ioremap_resource
>   i2c: sun6i-p2wi: convert to devm_platform_ioremap_resource
>   i2c: xlr: convert to devm_platform_ioremap_resource
>   i2c: bcm-kona: convert to devm_platform_ioremap_resource
>   i2c: octeon-platdrv: convert to devm_platform_ioremap_resource

Thanks!

If you want / need to resend, please squash all the patches into one. If
this series is considered fine, I will do it when applying!

Kind regards.


--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6N3MgACgkQFA3kzBSg
KbZBuQ//Txk13XhQ5R2IiDCFyN0ugptKQx8tZldsvcWtucQAK0nl7UXal/9Z2wWk
AaBi9q4AEHF3y1R8wi60aqhHU8HkvI34WJb9AYqpowokgMtIWMcjlt0JHWtHkJdr
zq1b8b2tFThJ79I0/fml+aKztA2QTxqp11zTAI8petz2XvhcO3xdBEWN7xIcBAZy
bsfWhP58rDInJ6n/bDOB2G9PV83yrQ4rFosVh0GINPW7E/mafk2o2kmEOGMnC96/
p4Y9fFx+IrKFUJ5ZK9WL5IIaAATou0SQMEm+l/W3PERD8fU9esYunpsfmvnBrS4p
T5GVkYa0xWo+twx36SgMsRwWvB/zs+bJuFkfM3rLzSL62gmiqTOIZJM52TrXPkvd
bfir+IMYynU8DXhoQbmFeLKQdcHeJCAOScrRChvTGjQU0t78CY4Ee5H8RKjFXnIX
Ex4iYDBOyXVcbh1u3O/D29YuOON5ququpD/aFPteo1cuNHgb4Ax2QR46uSjZLcJ/
NFnrMqFxCnKDIzBfoQhRNL0IxPt7UVjPu78yT+d+v643i3sWvlw2Z9EmFCdSWLA1
Jfq5NiRGDJNzrx4a4V/ruk4IXvZxaxiYca/tADtPxTPeeHkdHboox6SEoPlTH6Kw
AsvL+/bze80d17q5pSh2fEgUaXg6tg0oeH7RJHMHwn0XGtRC1N0=
=AQK8
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
