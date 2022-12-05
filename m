Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2404D642543
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiLEJAr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiLEJAN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:00:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F148F186FF;
        Mon,  5 Dec 2022 00:58:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 883B2B80D8E;
        Mon,  5 Dec 2022 08:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A99C43470;
        Mon,  5 Dec 2022 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670230710;
        bh=CyytMSAI0EJHLFeZ3ModFSXv5+D4fj2pSfK7LNwIbXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PaLoCxSVdHM3PNcX8lTYwlQsrtKj7I9+DQZzzXpPfGVj90aEmzLIkPsdUsYBx2Z/t
         urs4pCGBaRpKX/8gnh/bgkrbeYS2tmcYduV1yp6DwzvsCFZs1y2Gy56iayOQRRudth
         QS5mD080JorQY7zQ69u6enT08mWHEySgnyYWjmrYM7uTeqbA6ANKod5Wntfnbk8LOU
         R0VwkgLbb29uEZhqjORF+kuAZlre9OHoG+lgPZCjACa+CDvlAy7Ys1W85bqO9foEYA
         f0SAKV1dY+lm2aarEdfY5qG+y9qDk1rm9C2sOIa7NVUTA7z2XioL8fiZS0XIWrAbUK
         P9VqU7zuqzUMQ==
Date:   Mon, 5 Dec 2022 09:58:26 +0100
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
Message-ID: <Y42ysiAqk8ynGxe6@ninjato>
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
 <Y42uBT34H6alb4O9@ninjato>
 <250be32a-adc1-832c-c10d-38d99d23f647@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3AoALBoHv65wX7ah"
Content-Disposition: inline
In-Reply-To: <250be32a-adc1-832c-c10d-38d99d23f647@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3AoALBoHv65wX7ah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> When Krzysztof found out about this, Yinbo and I had negotiated offline t=
hat
> I would follow up on this series of patchset submissions,
>=20
> and this was Yinbo's previous response:
>=20
> https://lore.kernel.org/all/2e10ae64-3c91-ccf8-a970-eb6e3371b948@loongson=
=2Ecn/ <https://lore.kernel.org/all/2e10ae64-3c91-ccf8-a970-eb6e3371b948@lo=
ongson.cn/>

OK, I see. Thank you for the quick response!


--3AoALBoHv65wX7ah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONsrIACgkQFA3kzBSg
KbaqQQ/+PIMd9b8O9j4ykXh7OC3gzCEiA3H/gwcIZQfXcdl3fJ36iieTsj2zWwIN
eRtvFc8ZqMIZGDSJaeHmfBZdkuoDJqJ86Xm4+eGEvXevH23KCtsPe2xVnDf1TVqU
7IieGqB+rRe15aGJ1DZRMhc3MMlX13TlIhQVdi23p3F+6iIDOUmSNUwNzuZTD5YA
k4ET/8+DCKApf06MDbQ0vx5DvoW6hzSenWt0WDgwmo03a2na7Zt9IizkzRXLdAUa
ULxsAWiShOteo87AzPZX14vk6uOuMwptb+E93NcT1I6MQ5pb3+cS+8kodreUT9vf
emmsii8SqdEMKprwFdcgN3sthwVn11SMbhffq6O8wccYwlXjJbiZMzQLuX90tbUZ
moMP1Ttiz3sXiv96mxMpokxc409CAQQwW6u5fwUTlQwX6DshBd1M7uzPnvzISqAT
//9iAGrNt+xxZ6sbQCHPavABIYxEj/cLryjRJSgyZOql2T/hixwuajvYyJsphgqj
BOGDtWghHSwWA7j1PYznIUrgxNyI76dzxD1gfVq63lYAyAbvNUgYzYkE87+MPvt+
ZOKcTweGutofs6SV86MffPXFl+pTFSRZB4L1KBq08U7YUPy8vVCLJbFvoJ0zqaDi
lstby5v7kl24fVKOmR7oPWt0Z7JqFpjlHMqiXiHhsYcc3ouRhVw=
=zoFc
-----END PGP SIGNATURE-----

--3AoALBoHv65wX7ah--
