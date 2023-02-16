Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D83699E32
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 21:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjBPUrk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 15:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBPUrj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 15:47:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8604ECEF;
        Thu, 16 Feb 2023 12:47:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CD9C7B82958;
        Thu, 16 Feb 2023 20:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3712AC4339C;
        Thu, 16 Feb 2023 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676580456;
        bh=6W/6iiHZ9ir42tfHL5ZR/MR1S4WaGMdD48ch33nju7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L6VP4HV1WFTpbXIkTA89LF6h179TBgYL6L0jLw7n6TUDHIAcdX7TCFyMP22d5qOQJ
         ebLuv67lI+EOjhVHcMjDr7rQJiVDohWwm3i13Ib5AzOdHUPdQPcoOYeAZ1aDK0Q0U1
         eYO6K5eM7fXuvU4vj28QASWzvMIVFE00Gz5cvRkMVGKlzFwlluUka/lFswkAA7zKq/
         6rIucJJY7nmB0eUsUmigVjpieOAvKGMysXulFlRW2a98sMwJYW3SzrUSj4sTGkj6ji
         jP2pwVUEZlsR4lYQCLVbafaT2zBvmmx3KMxrAiJ8gFfl06OT+VTVua0cV5pDoftjut
         szAUbBzbzEdsw==
Date:   Thu, 16 Feb 2023 21:47:33 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH v4 1/5] i2c: hpe: Add GXP SoC I2C Controller
Message-ID: <Y+6WZT4KtqQ2Wg9o@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Hawkins, Nick" <nick.hawkins@hpe.com>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-2-nick.hawkins@hpe.com>
 <Y+1Alvn3eepZ6yAC@shikoro>
 <63020BDF-DD97-4828-B464-8DFF94A2B794@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GeBlnw14vpOmWStm"
Content-Disposition: inline
In-Reply-To: <63020BDF-DD97-4828-B464-8DFF94A2B794@hpe.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GeBlnw14vpOmWStm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick,

> I will work on the defines and get rid of all the magic values.

Cool, thank you!

> Unfortunately, there is no public spec available currently.
> Hopefully, we will have one someday though.

Then, the #defines are even more helpful!

> > drivers/i2c/busses/i2c-gxp.c: In function =E2=80=98gxp_i2c_probe=E2=80=
=99:
> > drivers/i2c/busses/i2c-gxp.c:533:28: error: cast from pointer to intege=
r of different size [-Werror=3Dpointer-to-int-cast]
> > 533 | drvdata->engine =3D ((u32)drvdata->base & 0xf00) >> 8;
>=20
> I am currently unable to reproduce this error. I even set W=3D2.

Interesting. I have this version:

gcc (Debian 10.2.1-6) 10.2.1 20210110

> Would replacing (u32) with (unsigned long) resolve it?

Or size_t.

Happy hacking,

   Wolfram

--GeBlnw14vpOmWStm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPulmEACgkQFA3kzBSg
KbY/Aw//au5PykMFEda7/Z6aVZcSe0rOFYt86Qt/PZNxuPhuaWPJV9EnwKDrqWWl
R+lHP8A+b4g0DMyxt4+F83I8b/gyToJJf5zLNLvY7pBFegL+pC9yqKqqlt+O9V5+
CQ24DbNAWIzHEgC0fPd+Q5Fh2rBxbPeZUzj4HlXlBsXu1nJ+SgaLwCWPpz8hWQU/
UL3FdFcm7DNWB1BmDb1/J8+fIprQeSi+RDkK8t0cz1H6hBgsQ8IdrTwj10djN7tY
gNvn8EHcmnm4jQrgY/SecHJGYyUGG4d+P0U1HWKFNThfK/O5ezQ0FFvvNzJDTYT1
DPVXVVc7hNXV6rTjKqiNIAdzXdNlXtGiHrgUMtoxiKgMx7sHCQtn7QEopywz5BuR
FvTm1gEv9XdUTd9TCAG9Egkn5i9OOVmTrkzrmdxdhESWIxf9kYeCc/eoQnxo5PTW
Rx6dX+oDqJ9wwvFFB0IA7TQm/UOYr8UidVYThJx9LEMX56NmavVLzlbbe53F+iaw
R95DyHsCOOgQBPfZ+5V4U890wVuercQ7315GrQ3HUai42wInLT1YLKa8JQh0nbQF
mPyam6OWBfkGGt03Q3Ihwn4rFggQ9Vf5nTS7TzJtL7r3xXqk0Bv1jVC1JYqP8LjT
TZrCYOOsv1MF8P/IAITUvFY8QOrs/yw7o/AAK9jSMYUw5MTjkoQ=
=M/Ip
-----END PGP SIGNATURE-----

--GeBlnw14vpOmWStm--
