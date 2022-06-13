Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64613549B92
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 20:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245583AbiFMScs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 14:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244757AbiFMScV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 14:32:21 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243C6C3D39
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=g2RC1m/mkaeRN82kXC5R7jd2AVs1
        ntoJQysP2akaihU=; b=0XUHyLz+T+uIgAuJR+jbGhJvVViKWqRK2GG7jfxuNNqw
        JJjNKA5244GJG920B5S9Ldy++QpX7jynsFuER/+e4b9pmUMVKcZyu7vCk+RUDPCk
        bEFYQo0E6ehpN2VFXvHf2GrQIPgK7uv0KPlcDFhiZBcT1U+GudpfDVIuFdVXvFY=
Received: (qmail 1337493 invoked from network); 13 Jun 2022 16:50:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2022 16:50:37 +0200
X-UD-Smtp-Session: l3s3148p1@YGgvaVXhuDRZD+yY
Date:   Mon, 13 Jun 2022 16:50:36 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Use standard optional ref clock
 implementation
Message-ID: <YqdOvDmixVlDYzjO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220610074233.9748-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpjOMnM5Qxa/KRrW"
Content-Disposition: inline
In-Reply-To: <20220610074233.9748-1-Sergey.Semin@baikalelectronics.ru>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LpjOMnM5Qxa/KRrW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 10:42:33AM +0300, Serge Semin wrote:
> Even though the DW I2C controller reference clock source is requested by
> the method devm_clk_get() with non-optional clock requirement the way the
> clock handler is used afterwards has a pure optional clock semantic
> (though in some circumstances we can get a warning about the clock missing
> printed in the system console). There is no point in reimplementing that
> functionality seeing the kernel clock framework already supports the
> optional interface from scratch. Thus let's convert the platform driver to
> using it.
>=20
> Note by providing this commit we get to fix two problems. The first one
> was introduced in commit c62ebb3d5f0d ("i2c: designware: Add support for
> an interface clock"). It causes not having the interface clock (pclk)
> enabled/disabled in case if the reference clock isn't provided. The second
> problem was first introduced in commit b33af11de236 ("i2c: designware: Do
> not require clock when SSCN and FFCN are provided"). Since that
> modification the deferred probe procedure has been unsupported in case if
> the interface clock isn't ready.
>=20
> Fixes: c62ebb3d5f0d ("i2c: designware: Add support for an interface clock=
")
> Fixes: b33af11de236 ("i2c: designware: Do not require clock when SSCN and=
 FFCN are provided")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Applied to for-current, thanks!


--LpjOMnM5Qxa/KRrW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKnTrwACgkQFA3kzBSg
KbahQg//bJVwpD7dUJbwrkCJR/R4p9wzcrnlm3kpsprd/tRq8WSb87PkDFRIP9oN
13zkFyCOfsYb0OCY8+QwprKEV8BJN9irSQHOukm2bN5ShkZpY2CBxfiScDe757F8
Nla7I6ez3EBQeKYV1QF0GW1K1Es5+1nqcU+9DKRA/uYzVQmkJ9bMr4mGTotMJzIS
ey5b7JkDMzIxp/4BLXxdOz0To00WtTVqb/1vSiK7NwCw5ovTdbXlt4o8cL9+G2s7
NmwQaqvOSlyvEny7+nRDitZZKB+zXF8BPSPWCRUJBmToU1jfzWJzfUJMWnkkpXGX
BhDXmAsUrVT/JyfzqGAywxywpphrOqbU9IpXS+8I1LU6qCMN9rizfyjbyGcLnldN
x9HoVQe7vEOUTcEoEQiDbauO6uxnWrHRNFo8ud7KgDECRwJ0ta04vH2UOKCchw7c
yXxCSob3hP8ew+fg5hwlFUhHRQvuRTnm30WaxE/iIxzTyOSCKtLCnAOmOZg0f9zk
ZpA/pRDVaVXRTKuesjwU5SKDOm8JFP3wi8IHX/iMMxlJXek3w89NprAdj2SqWdA6
cI93dQ7Nn/39KyNU+GNp+n+wTzPIRB+cwKFbQ7r8tgMlxmRCZYOGRv4L0q+VDWWG
nzT6jbHlb622SOIfdm45ZWSVrDh5ZjRMqjeBzjGzFcIMSKEwe+w=
=unAQ
-----END PGP SIGNATURE-----

--LpjOMnM5Qxa/KRrW--
