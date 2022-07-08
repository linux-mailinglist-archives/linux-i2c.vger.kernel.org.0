Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EECB56B91B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 14:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237862AbiGHMAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 08:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237672AbiGHMAt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 08:00:49 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F319B18D
        for <linux-i2c@vger.kernel.org>; Fri,  8 Jul 2022 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=deq1/ZSP7j0uIXHZ3zd27VbyV1ru
        /BltTDPcvYhni2I=; b=DUJ1cdQeQPXPlPl2xY59/CmcI9ivyTxVDKF2q1AFp2dJ
        kgxMosYhjVnNuoQzsOhuoofWbr7FTLhAHkVWNF1f34nSOK85B+mWm8I3T/uygBFe
        oXsrILkddhzESkJs69t0ouBnBz+LCTbTbnSWTTDRdwHYMSYmFSgivZ3AU0vEMFo=
Received: (qmail 2505774 invoked from network); 8 Jul 2022 14:00:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jul 2022 14:00:40 +0200
X-UD-Smtp-Session: l3s3148p1@+xtC80njj2tZD+7L
Date:   Fri, 8 Jul 2022 14:00:36 +0200
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
Message-ID: <YsgcZHzjzqyJjKqQ@shikoro>
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
 <YsWI4nzQa9gmqKdw@shikoro>
 <YsgBkDeq/KeQ15HU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sq82JupuAgPLDLmZ"
Content-Disposition: inline
In-Reply-To: <YsgBkDeq/KeQ15HU@smile.fi.intel.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Sq82JupuAgPLDLmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just noticed yet another (but not in the category of the above) debug message
> [1]. Would it be acceptable to use patch 1 from this series and its use in (a
> completely new) patch 2?

Well, it falls into the first category because we also have a tracepoint
for smbus_xfer :)


--Sq82JupuAgPLDLmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLIHGAACgkQFA3kzBSg
KbaYABAAr2nYnOk9xmIU5H+KZGkaK+s/X8AUWPUDFsl/n0MNiDdYVxAz5wvEvxKZ
Iul3hmIswn6oontyJKdI+e/gXkQMdXnbzPSn9PxywBPmW71EopxPFX1WMcrg5RIe
wmNMDQu7TDMUwrjMe7G+G4QqTeywXXwHV40AhnpL0VVzB4ZnPkzucmZYf3SZ9GvI
Ggami5cnVmHl9Ouqvs7+B86/5o6mo5ZGVFOnhxu+Q8EoAS1BjXBFG0xBJ6hN/wIt
uO4rwbDp7z6bp87qJeFEeWQzD8ld8nSfGuj8FUbVQ6LPuXtEqDDEyyMPOruJ7jYF
Y0xa5Q+RaL7vJrxieVOTaYkqVsTZ8M7PzMnScoGBKqllzbc2iYW3udn8a2XQ3CI9
X67c8CSjCrvBsuQkTbwn9py3R2cSk9K/AuuGWLYulSGXuUFKk94nYYPjLOsnRkQd
ceYLYiFpjowNT2evvGSc0mF9tksYRvqDMSW9U9XAUFLKjLugCS3D70oj4Qu8xz5v
LDUOIcy0wQ9KaoF9Q3SCenyLOg9b3mnXB3+tTVOxCCBT9dMxTNwpZ8xIBZpvP++P
luszN3gUUk3YJoBi2QYKKD4Mf2pi4wPFQi+X3zOtru+SUHafwfcdIYTQEB5L29j5
IyeYj9nEvWEkqtD1TsNmbff2wTbsybm2dtWVppb3dQZ6WvCoMks=
=JOUV
-----END PGP SIGNATURE-----

--Sq82JupuAgPLDLmZ--
