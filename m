Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89266CF2C3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjC2TIv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjC2TIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:08:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066A265A1;
        Wed, 29 Mar 2023 12:08:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C9C3B823F4;
        Wed, 29 Mar 2023 19:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FC3C433EF;
        Wed, 29 Mar 2023 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116924;
        bh=A4IDqMJGl5AYIYk31Ydlh53Pr0qz6PWFFTBuq+yeYzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mq7MEMaHjIXDfOeVdj/el5/Le7a3W0xDXQ9YPROC6QOyWy53D9nRFoSAxdhVaj1gC
         srAUq1EspJYzkIJyor2ync+lr8EP1gnbWW7Nf1PUcAsT8a6xij8KVhmEOkemi7QTFo
         d1EjiqBfEfopq75+yQRIZG/57yi5LuYhkKwVjteEFpvwSa5kwVr+UtxTqERlMdNafi
         vHwEeyfaCCSlaLL6QQwKI8aML75p3SPljvECGIm4AU0BTcHvauIK0uRRbEEdO+eflT
         Z52nZzYIPDndqyejxXkgiCi9foJJMt9wbTTHRiOTEbs/nzCA4BCehvzkxsy5On/W+D
         1r6EV2eaRLoWw==
Date:   Wed, 29 Mar 2023 21:08:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c
 property
Message-ID: <ZCSMue5X5eknSbUP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
 <20230317233338.424864-4-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MbDBiQBNZCb7QcSk"
Content-Disposition: inline
In-Reply-To: <20230317233338.424864-4-andi.shyti@kernel.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MbDBiQBNZCb7QcSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 12:33:38AM +0100, Andi Shyti wrote:
> "fsl,timeout" is marked as deprecated and replaced by the
> "i2c-scl-clk-low-timeout-us" i2c property.
>=20
> Use this latter and, in case it is missing, for back
> compatibility, check whether we still have "fsl,timeout" defined.
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--MbDBiQBNZCb7QcSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkjLkACgkQFA3kzBSg
KbbyRA/+LEfiOPgB0L8+ZgIkyh9QNWQRBDJHUMy9u+LKdL5IUclcfflIBnolCKT/
o5lF0TW/7ToDAVY+j7212sS1dh0ci6At3XkAvoFh2XWW9nk24+emJAN3c/MklnDm
Q29xcSq+aAcXpn7DLK+Qx2Pe9qROsaU0BbeU2dFiKEi6E8Q0iB9ewxn55zHUcvGG
N3ddbPdOLL07b4lQLkCQxGLNM4b0GenqOnL6G4xRxZYyWiPRsJw9cQLPWsljNcRP
677MvTHFyAo2mlejywXvuv2cTXPP32V+O8fwK+AIOVfxxB9Tmo3qt0SfXti4jMZS
spLLrgfizDBRR9UtY0EoynD6J+p/jrCdRvYqA9T8Dvs/WyVGHO5aLVYvVlSKij3O
Sd+LNkQI695Omy96T0E8y1XU4AxrPNsbN+NKy1wHNCPo7Ji2RpWZiWPHSXcpm8xj
wdyHa9i/wzJlCOTu67mc/bgOiH0aZNlUnbXK+WVaPaxwDrhJvUZcDZPF62rr4dJg
NCB6xOE7ymPykCEclAFxUs9DU75AXPQVxyDm3sC86RXWB8nUNw5qLHWuO6fe11ZA
tln2FSQkJLdoOgkmiwoH+IxC9/Tpk0htUVx1uynEmKhQCix/ShrBSWD5yvh5lbWj
gwOmeUh1XWKAdwa2F/pOGe3/o4qjIb7P2V60vt+j2GoK2xQHRnQ=
=bQ7g
-----END PGP SIGNATURE-----

--MbDBiQBNZCb7QcSk--
