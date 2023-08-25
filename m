Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D844B78904B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 23:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjHYVRQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 17:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbjHYVRM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 17:17:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4CC2684;
        Fri, 25 Aug 2023 14:17:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20FE262651;
        Fri, 25 Aug 2023 21:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED25C433C7;
        Fri, 25 Aug 2023 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692998219;
        bh=3NF4/9sTUxsy7+cyZVszKONaH5lg0pf6BADotaKBhFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dk4+O2XDPHEOJDIs7SCoeR5T1prK0c4Ap6SYWFKXqZjJL2R74VTYx7x2nAeSE4p5n
         AFn1rw+Oty1qwNh848Kbvkd08i17THrv8FoNVlhO8iy9UyHfNEI1oTOFLzsEucb+3r
         ygFva0FjiN302PDY0bdQAcPv5nEyJIPV7uA6zeXrvjjfSdmr3/S7+bqRrNnJix6Vza
         U0ucNCQV15owskfGcfGa8TBIfsjnCptGk3xai/L+d1zXMSX3Ezu8BC78ZB1TxMWcAB
         1Q2Pb06n5VKsWYzM4Yr5I+F2o7j4TVyoo0I15nRTufH9xWCWTMs0Ko2J0pSlVuzMK0
         4goS7XcZqTTXg==
Date:   Fri, 25 Aug 2023 23:16:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Make I2C_ATR invisible
Message-ID: <ZOkaRx/DqT9fnTXi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MoFTp7i1YP066zwH"
Content-Disposition: inline
In-Reply-To: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MoFTp7i1YP066zwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 05:29:11PM +0200, Geert Uytterhoeven wrote:
> I2C Address Translator (ATR) support is not a stand-alone driver, but a
> library.  All of its users select I2C_ATR.  Hence there is no need for
> the user to enable this symbol manually, except when compile-testing.
>=20
> Fixes: a076a860acae77bb ("media: i2c: add I2C Address Translator (ATR) su=
pport")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa@kernel.org>

I like it but I can only apply it once the ATR hits upstream. Or it goes
via the same tree than I2C_ATR. I don't mind which way.


--MoFTp7i1YP066zwH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpGkcACgkQFA3kzBSg
KbbHBg//ee72Mtj96yDYgt2RPUGkdQdTG7C/hC2b8rMBUr+uKw5Dx1JkzEeSgEL/
UPLVxLPjYacyOk4pSTJ9mPBduvnsmBQVCM6aEiBm2F5gCF8T+29sGTSSOa0Lt7ok
t2vgt1SvUCya8d7UwYamvvfVKjpPAV+DSZu53EPp9xmj+/AOR2jp0I6pnEJ3o212
KaRS82yqOF03vHmy1iuWnDodtEg6BYrP4CdDRXJJLi1rFob4i5Ki4Y1flzC1YWy9
cRAFtdDo1y9LtIxJ73zUvAzIEHTHRt1L9Auws97rQpThlddg8uFmvUqRpg11wLml
RsG7rQj39fEK+gHzsLvXBA48GvYVMxyYlFJq0JytBMXEG8vbNSYuQmeYi2/j+Nvh
a9WtURgqoWNoN/rMDL7twjZPdOH6iEu0aaF5OAR7AVXC/YbtmUaPbEqgTBGi9KO+
cr/R1IVu6M1858fQTBdsC2HLtqC6nxO7/OGAn/1TM0hjpLnKkgpvj5gqJZjhZxsL
at7iTXscfFyjmO8cLIXXgAf6yFMeHgt/QmdwK2eKF1yM08OByagzAO7XSTPrQ9Uq
Dkl9j7v/gI6rhigEwCqb2RfxWNR17rlGsmGrae1yt9jziLER5DFVO0FI+or5loJ0
CTt0KPbkW7uqLAJxkOLY/t1/O6qphdCT/OG+TFOFueJ+tRaTweo=
=HlqT
-----END PGP SIGNATURE-----

--MoFTp7i1YP066zwH--
