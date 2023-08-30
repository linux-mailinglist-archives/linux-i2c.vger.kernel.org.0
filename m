Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C8B78E33E
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 01:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344485AbjH3X2a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Aug 2023 19:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbjH3X2a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Aug 2023 19:28:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9623BCF;
        Wed, 30 Aug 2023 16:28:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 419CFB81FB8;
        Wed, 30 Aug 2023 19:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42453C433C8;
        Wed, 30 Aug 2023 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693423240;
        bh=QkaXLSaGdawwuEOW93k+nfxmTG8iDf9re9RcTgcirQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mxckDRQ6+P0DK+7WQybVe8blVmGn2f6fg5F7LOuvo8Ouh0astRselAFsMF3KzI09T
         PaEFmC+9hKCocVhgncr7KPFD+qwovOuSZoAtDPgEuNAcaNFq/DPu9eCZe0mgfGaMfz
         KA1NWLaszvgLbRiJv4Xw+Im2OX9jrefNKyGYpB3Hfg5cucJzAeAAhHSifnuaK6T42P
         2LjEAdX/CwJg12pNoZBC3SdFIL/p67n9b+AVEoxbsUj29dqQwScZ2uEwcqSlAIdjNa
         sMWueX1HVY5UFyqkvjyQMirkBukeZUq2ZTiIq4gRr1JtJUbILa+5ycCf4dMY1I+84u
         SE9Z9GwvoFWdg==
Date:   Wed, 30 Aug 2023 21:20:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: at91: Use dev_err_probe() instead of
 dev_err()
Message-ID: <ZO+WhUGFbRQXd3N7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yann Sionneau <yann@sionneau.net>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230825143234.38336-1-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gFyj0w2shawdgBoy"
Content-Disposition: inline
In-Reply-To: <20230825143234.38336-1-yann@sionneau.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gFyj0w2shawdgBoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 04:32:34PM +0200, Yann Sionneau wrote:
> Change
> if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
> into
> return dev_err_probe()
>=20
> Also, return the correct error instead of hardcoding -ENODEV
> This change has also the advantage of handling the -EPROBE_DEFER situatio=
n.
>=20
> Signed-off-by: Yann Sionneau <yann@sionneau.net>

Applied to for-next, thanks!


--gFyj0w2shawdgBoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTvloUACgkQFA3kzBSg
KbbqXxAAkTSIHoQf+8sjpUea7IT9kzaCBjxJ9rTkAtAn1XrUk7d67KuizLumUD3S
L7ByVvL6nZ++JbTA2H/JRKf8AllGYc6wapJR2GNVLF2Oyd/uIQLzWQmIOTeimqci
VYt6vUhM+BeQQJvxCvayJqxo/oLUc45aiKTh9YcIyyCVn/kdMk0fl3TiF3xhBecR
7iJSlBt/0mDz9nfiIxmlM1sBOLqbAnxlDBC7RH9gmxzp2JPGJ0ExZnvGS1x7Q0/u
+zk0QlXue9MUg5Sr9LK/GkZRJAANCVta+Or7jRwGki/j7+dVMX8DWJe2pImyb6Ug
zcJiEY3DdkxsJN6gQxcWiqNOSF9tOeEMwwj0XVg3erO3vEuumiuvMhCUwK8YW5a6
Ip9DSAvt+YHNQsH+WF+AryV65JARUpYaLuK8IK8oFCtQB9/W2bu4v4fBY3ABooUv
S8RiXZMBDsLne8bwnt+EacRQdEIMMtjBzxPQVV32MnDIbjGJxkL3hszGXvnUy3p8
cMlJUneyKoP3sY5iH+syoYQC4Gmd+tbhbOqbklygLQ/iPiNDbncbqRbEmYkrF8C9
OApOB/jmC982w02ijQ/U+il0meBQcYoKFEnbB3bvAOr+x4320ZEV/kZl2j4B1xD6
nETesOuaieit1WZh/qzyS+FZ27CK8RtBAe5wb9zp2DPSo6jIuZA=
=wDy4
-----END PGP SIGNATURE-----

--gFyj0w2shawdgBoy--
