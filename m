Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079BE7A6787
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 17:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbjISPCL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 11:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbjISPCK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 11:02:10 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B75FE5
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=Z0cS
        dtdCQ00W7uzzuBGbsOFl4pgCUIFxScbps3z/eAE=; b=QNR/9h4PaTCvEnoE5rw3
        avA714OFhfvIUz+2eHPeQWP64qLAtwHYIcBs7wvTjG/Dxj7UdF0I28ofpW3KUcyG
        0l0UhcFHuNyzl9SR+PCfX+QJe/M492ff7bohQm7wyVL6Kbfoi84EwxuuuhVimX1V
        Vf2mEX7/KIua5KLQNwB5XUeOCVzCLCrFjiZ75MDEc21X2yROigAcLqKLlNmqBh09
        +wor/2eoX7I3/mH1NlH+Qq3u3b/UWgirpKjT7NVOwCH9gFbzurZfuWrUo5Y4L/Tk
        PbIoroOlj5NYEYJ/W83+7ZmiHcNT2dUH8QUuVYEdJXV3LbOe1MZUJgrPRoNNP9kI
        JQ==
Received: (qmail 251185 invoked from network); 19 Sep 2023 17:02:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 17:02:02 +0200
X-UD-Smtp-Session: l3s3148p1@vTSKircF9xIucrQg
Date:   Tue, 19 Sep 2023 17:02:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: add FastMode+ support for Gen4
Message-ID: <ZQm36a4IhPL9kN+g@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
 <20230913203242.31505-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWrb2je4tgEO_OmXhHtFiRb8JfUzBJdUp4KFf574GmoVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vVCqwtsTzpx3t2Sh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWrb2je4tgEO_OmXhHtFiRb8JfUzBJdUp4KFf574GmoVA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vVCqwtsTzpx3t2Sh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +               /* FM+ needs lower SMD and no filters */
> > +               priv->smd /=3D 2;
> > +               cdf =3D 0;
>=20
> Is this documented somewhere in the R-Car Gen4 docs?

Sadly, there are no recommended values for FM+ in the docs. With cdf=3D6,
I got speeds around 800kHz. After seeing the BSP also uses cdf=3D0, I got
speeds close to 1MHz. There is a note in Gen3 and later docs for ICCCR2
saying that cdf=3D0 is recommended for devices with a data hold time less
than 100ns. I don't have the PMIC docs here to verify if that is the
case here.

However, I recalled there are some generic filter bindings for I2C. I
will check if we can make use of them here.


--vVCqwtsTzpx3t2Sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJt+kACgkQFA3kzBSg
KbbD6xAAsU8C+txBnNyPnyuIDx6ppzSmC+V+hfzW2+2Ke7nbqQIhwOQwerj9Ysg1
xEsetQ/KNQhK6pX7ueWVsi0YcnOYdzHzcTeYy9XfL9GuHcSr8UFFu31K1U4+WI6l
DQBRPGlOEfGvJb/nICt06r0WYBbFR73HF9z6sjfJH+lCADk85qiiL4Wt5gyzPW5X
QBowLweliHUszj5g9SGTy5qBDE92fi+u05wbpuCNMXeFZNry5el6fHLrc0y/J+Ex
6Kcckld/vy9KqVZ13d7irgbU5cxPaoR3zcYHSGurCZXg2r129RII/HCwmbJIObP2
zLPVkgSCP+xaZNz7VSsU9ii5OzFDPDWaoeMtK+mYGKkgxfT4PSk42RWF9oAkHTGr
0bh47pdqo1Nfdj1QEXcPHv8Z2CRbnt4j0lqne2e3ND15JsCLOxDPRebOthkgY8c6
Mz8o5mubMEZha2uNRGrMKy+NdkC1i59ibY7CV0PyYmAA+eYwa+ww+gmV2BOnrMB8
EL++7DT1sgT8niFss4sd1J+B8LYYwUj4aYTRTU0gAdNTghZk4KaNAgfozo8PHoIR
6i5I/8bRMnRT0QIgwAxvRPOiyrfpBRhYK0rPF3lwpYOnM8ckAagUQTxDVwKr0UYp
fHJRA82b7wc4bJWs7xjRCOuLqgx/2eJbiNVlYQ1av4wtyA2FI4A=
=J32p
-----END PGP SIGNATURE-----

--vVCqwtsTzpx3t2Sh--
