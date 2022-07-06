Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A8B5688F8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 15:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbiGFNGy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 09:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbiGFNGx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 09:06:53 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BE0186F7
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=D0hNbSBzGzNXDpHde8BsfsD5hfBQ
        bb4aorNSvpTgVrU=; b=E6cdQmWOgXODAMsv1qYtftsUDkq8yB2rzDN7nbBj49dC
        OTU5rWih/KddxbSWUIuqbYyZA1DH1debq9NIp/cByt22mxrn5n/ONLBreV56cIbi
        Lq0NaxHrB7CM921l7oThMnvySzFR0PaRyaVsm+XjBJmkMxL8giq3frwg2nVAZ1E=
Received: (qmail 1712726 invoked from network); 6 Jul 2022 15:06:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2022 15:06:46 +0200
X-UD-Smtp-Session: l3s3148p1@ZX/5oyLjKmlZzIq1
Date:   Wed, 6 Jul 2022 15:06:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
Subject: Re: [PATCH v2 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Message-ID: <YsWI4nzQa9gmqKdw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
References: <20220703154232.55549-1-andriy.shevchenko@linux.intel.com>
 <20220703154232.55549-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CdaVGdeblKJUV2jY"
Content-Disposition: inline
In-Reply-To: <20220703154232.55549-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CdaVGdeblKJUV2jY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sun, Jul 03, 2022 at 06:42:32PM +0300, Andy Shevchenko wrote:
> str_read_write() returns a string literal "read" or "write" based
> on the value. It also allows to unify usage of a such in the kernel.
>=20
> For i2c case introduce a wrapper that takes struct i2c_msg as parameter.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

To be honest, I don't think this series is very useful. Most of the
converted strings here are debug printouts which could rather be removed
because we have a tracepoint for i2c_transfer (which is the preferred
unification). The warnings printed on timeouts are plain wrong, because
timeouts can happen and need to be handled by the client driver. And the
change in the I2C core is not worth the hazzle IMHO.

Happy hacking,

   Wolfram

--CdaVGdeblKJUV2jY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFiN4ACgkQFA3kzBSg
KbaOnRAAlv7WrOzngujipBR3pVf3yo6uKVwFX+PykjBTa0wBHwetMP0pYuObpjH9
MPI+xi3IOPO8nnwQgPbg8ke0Yq4akFTTkLG8QOXU1ddT1UWRq1TJXNB9hME3tXGD
WkO7L/wslhrvwy48f+0nOJotVJ3q34bifTQ78CTnFyYY6Tfg6BgF/opp70w7XNgW
5blntGsxPCRsh1VBlDilYsgh3TXzmD934y8v1hFpM2BXFgnHKsID9FOeHVDsuB8O
RL08dyCz/yt2r4M0f7DDOF56PS/35JsJhZ5v2F9er0fkPgEdS392WEeJrQhiQ920
ugWPpY6MhwTuTFZQqaeiv9moB+j1BBcKoEyG3c4quq35KKIYsaaC0fj40+1u9Gel
wlZ5qxgE29BYSWZocpQbdFF8jG/iEhnEy9pIRfGfQagUypOLsqqcsk5Qq9aavWHK
Vu4pI5SRlsMcRWzWO4592D8KYF5Tc/0NQ+qfCj6AO+OwBIBR+S7lBsLiNpIETLil
EMa1kLVlr/ElAFyqXIa8yX7vvK9xHDcHEPWsW3Q30g5QEGT40iXSGkM21l3KebVz
Lw7qzoMkINICUNGP2ULiYOCgafWdlVlev4RmQCDFDljj2ZKH1ph91kJeM7YscDj5
ZGh3HI5USzLFt/C6uFVIwSpz2aM2IMOWcasNvtXlR7RZNu/qwdI=
=srXy
-----END PGP SIGNATURE-----

--CdaVGdeblKJUV2jY--
