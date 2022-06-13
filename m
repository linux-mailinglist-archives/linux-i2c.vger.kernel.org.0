Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFF2549959
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 18:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240948AbiFMQ4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 12:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241392AbiFMQ4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 12:56:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824311FBF4D;
        Mon, 13 Jun 2022 07:42:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E62E6612DF;
        Mon, 13 Jun 2022 14:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49B6C34114;
        Mon, 13 Jun 2022 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655131373;
        bh=6RUtcC2ezgxpX0fcc7bhWT61oNaYVTXSim1tOI9z8ZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SJ/loUNhH/OFKFpMUaBwV6LdfZLnQhohXNWEWhWZZgygtBSiW13RgUyaulpl8BmEi
         ucPy0xYLklhNYOPl20R5wBljMzm5+DPKd9qfAP+6fZJyz1RzVt8VlhaH5Cx3X09b2p
         mICq8nY+LSElP8mXQq8CXjhBfqMPeoHprkcE3LGoi4aAo9voiryR52k4jDDdYSI/m4
         t7+xI1CgIawQ+0m6dNriXcNvoiWOX/ZczXSysNWJKop+wagu7qvPLSlBhoJNZae5bs
         KhQthrat/tTrKrlaR47jO0tfyzpybTeXfD4XoA7l3cR/pfxEMZKpVrsk35Izc26kGu
         +ln4q3PXv3Jgg==
Date:   Mon, 13 Jun 2022 16:42:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Rectify entry for OPENCORES I2C BUS DRIVER
Message-ID: <YqdM6TAFKAQAyGrA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220610105154.2358-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Humb4uRqxbTH4IS/"
Content-Disposition: inline
In-Reply-To: <20220610105154.2358-1-lukas.bulwahn@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Humb4uRqxbTH4IS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 12:51:54PM +0200, Lukas Bulwahn wrote:
> Commit 8ad69f490516 ("dt-bindings: i2c: convert ocores binding to yaml")
> converts i2c-ocores.txt to opencores,i2c-ocores.yaml, but then adjust its
> reference in MAINTAINERS to a slightly wrong new filename.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains about=
 a
> broken reference.
>=20
> Repair this file reference in OPENCORES I2C BUS DRIVER.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to for-next, thanks!


--Humb4uRqxbTH4IS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKnTOUACgkQFA3kzBSg
KbYCzQ/8CnVbVX/n9OOuxdaPSvaelEt7wJ7ti1XWUYHrqBjQ5Jf8d5Duy70IoW3G
/2o0k7BUxaCMVbLjwiVHBXQai+5ms1jca0qtu3vd0KbtcGMyLvNL0m1/Eoeb2hFH
7o1buKsv5dbuZvGf3QwgvE2BbvQ/dIg3e0OfsKqu/2yAMu3UBz3bbaA3iuva4QbK
ODXGRUsJn3ZmoLGrTaIc9/R6g4gMjKulDefWuF+Mx0uFkfjtOMcf3ggTNDaTu+0s
w0Sh1OulFx2+2gQZ2ebLJcUXFrqSxaTX2rjcHf8f9UoCoLGOLA3L/bKNNmzJgsrq
Ng1inbdMbWsHmys88y2MxTyVvvU0pd2qCOrVt8duhaoIj0BsyRlQT1K4JCl0Q06Y
vBybjZiEgGs7d9uVvZy7a4g8AvTp9n+QIeZcecjNvPEmM5gN/28edIshrx5ODtnJ
3Ek66WPsXnY+y6uPCHbAvt0LirFM3q3tVbawWCKLQMqOQFXceNmUFhytofPzJh34
o/8JXsxE4fs1SFGN88mRbsUOSjrQTBGJM1gurSee6ZrU58DqrSFLT64/VHEWfe3G
er86rmAv1Tq7iWvN0Al1H0zC7xCsmUjtIoL/QxFh2pdCH7UgYusfYuY4eXMD8dA+
vVWufqGZaYl1GiJrLCW5rPRDVYw/1HcslRcdA/ThJxhY+HROgb8=
=wLIF
-----END PGP SIGNATURE-----

--Humb4uRqxbTH4IS/--
