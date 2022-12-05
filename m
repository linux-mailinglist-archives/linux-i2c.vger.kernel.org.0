Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3968C6424CB
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 09:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbiLEIih (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 03:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiLEIig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 03:38:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A0BFCE2;
        Mon,  5 Dec 2022 00:38:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D15E9B80D8C;
        Mon,  5 Dec 2022 08:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13584C433C1;
        Mon,  5 Dec 2022 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670229512;
        bh=7LUkgHljyLXmcrQzYuFzCnJfknQ9i1dWFWbYAxACaCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IlDNyN3RzT+SH8Kg/Jy016kBuqRWFYKlZ7iQt7yEx3TinlMDd9f955/sdwD+nFDrF
         Wr/5lIebhpfxivNxJulxLPhfeN9ttSASE/iEtjTQKJn+/sjTKZ1WafELKwVEL4mflQ
         nvMm4m8H1BOAd0jVR1XBSmt7+Oc6kUARk5gz3I/6PoVo1VftriyKOt91WpvRU5dTno
         JD7AQyWZ6dQdvTD1j0ufQBdnAHibWizOcZS+rA6rOxESJihxOhIV1KW8geXWBaDseX
         EbqFSew7+T0s28+yls7O/p/qaIfEOVl8vepHuTaWE0iERQLsYJ0dbo99AmENre28jk
         i+dVZDR0buw4g==
Date:   Mon, 5 Dec 2022 09:38:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V4 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y42uBT34H6alb4O9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6nvsZOHEl/qat1z9"
Content-Disposition: inline
In-Reply-To: <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6nvsZOHEl/qat1z9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 01:56:20PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

There are currently two people submitting a driver for this hardware.
This is the other driver:

https://lore.kernel.org/all/20221128130025.23184-1-zhuyinbo@loongson.cn/

Can you guys please decide which one is "better" or combine the two to
make a better one?

Thanks,

   Wolfram


--6nvsZOHEl/qat1z9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONrgUACgkQFA3kzBSg
KbadTw/9FgjEE7KzjDYc1H4n858esVXuR4jiNtBUY6DCkWmMjGhzPsvpKbkAjf5/
GbG9n7CUh+2XfG/t0Mil07q6nNKrgoID9MQzb4/tcV+D86eP2ED3kLhdoLR0xmVm
UrGjJI3OLiiS7ZEXZCA35k6QoNRZ8MPGOKGpQ4RJ6+/GRG8ba0PDHmbsNvMJAAla
+BpKXcBONleVtGpVis2g2HGaRJCQGg11EQqKrJPzKPky54O022BHctVnFcUnY/W6
IRnJcBz1Aq3F+2HU69DieAdXkHLvx9pDUPwhKjcsNEW2tJgMvYdcbV0p/Df9IYDr
Pof5CZ4/EcoDUTVuMcd2HWfc29ned8qAMfjVk/LnncoHu7elz67ak6Uvv1ON0R1A
+/84HlBXW6wPh3HNIhN6/AJ/jH0ikOEaYkv9b1oDK7ygmFDp5PFJ8rMdgbKqUuUE
EbRxLy7HPPGL5lQaFFUBh/YfClF0IndnC1U+Q1Phh55gWyrjaPLqHzFdTTmiYqkS
kWwFyznB4VF8zzOyjpMtURDUqebEThXiJBcleEfZ5P88hKJ94BYqvOamqHtFpH+l
qtEVqrAeluBhPrEvTveY2m5TdavYtkBxknEPqRLNg5tjHgkEeABRbipFrvJlju/6
nU/u9mWrOG8uSN432ytfQMgPVjMoRc+E1P8M0rF8PeZSOFDr4xw=
=wW2+
-----END PGP SIGNATURE-----

--6nvsZOHEl/qat1z9--
