Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C398172F7EF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbjFNId4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243564AbjFNIdz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:33:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9246019A5;
        Wed, 14 Jun 2023 01:33:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 285F563EFF;
        Wed, 14 Jun 2023 08:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D7AC433C8;
        Wed, 14 Jun 2023 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686731633;
        bh=0rZ8RWY+x96dvex3Xf8bOyg3oVtLNa1ds5FJhH40Hfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fMMneEOvp1Z3C0JGsSjn1GBvFcdhMz5kvaCbD66tQWVpUvUd1Zb/Oh0gEw+Qj/gFB
         boIjowFuIEoewwLqnHSEtPXLdLuM7Tm0wa9z32xDhB3jVbbOkMp551e52o0ZILXXLx
         3rAoPpvuFeZSzYl9Iy4zi86f5T8I5qnBB4s2CSZcdnyrZHDtwP0cw2KRcpPDqxZdzf
         qh0kzzWEecqTnTXcPTkGF1yT9KK6Sa5HeqPYEF856x/AuQnzAWMT4nMxHRQtV7M3rO
         EpmEij/vWxR/ieKpuMBpwVL+DlHy/LiklrAkwLYRaM83tqbHAJcNva0zpRDMSwqwE6
         GPIKRvT8BtGIw==
Date:   Wed, 14 Jun 2023 10:33:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: opencores: Add missing type for
 "regstep"
Message-ID: <ZIl7bcQ/cldwd2O/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230613201105.2824399-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iCgwqCn6iatDu4+P"
Content-Disposition: inline
In-Reply-To: <20230613201105.2824399-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iCgwqCn6iatDu4+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:11:04PM -0600, Rob Herring wrote:
> "regstep" may be deprecated, but it still needs a type.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Added fixes tag and applied to for-current, thanks!


--iCgwqCn6iatDu4+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJe20ACgkQFA3kzBSg
KbbfkA//anGUwFbI7yfPlKq9xDKxmk6CVk/CrxQAwUpWKP/upFsgHsUV9WXMAKJ1
mJOrXtfWovOBlvj3PZo80JuymI3k+/VOlqYOcfxLZ50XvrRA2ttqnC7LrCbzOltW
wEOO9pHRCMJbeulr9+WN+vA78XAxVYVrCjTEXB3rkpApxqd9GV45H5VJ+J3tDMep
62XqwqDB0fO/aqHPCJ4AinPzlnr+9y0ng7HgxEYcV0aW7mgmyGns1f6u1R+CgPjt
TSQfJes6s28YhpZePh84QjIoyRZ02AjcetYJxyzU3ZumM4zbScf83uYjtW8MhmiQ
iBFeoWeab7cqwG1nbdq2SElI2eqciXD7b+vF7mtmdMIkQ0AHXf2xPYZZSMuL+WUn
Mkbx7jLj/vFoiTU5SQa34fcJwDtEXhfyMzv5xlg5/ebSsRgpvczg0nhZiVyIND+X
vpOFuo6hgbCw18aWuIaq2cu9FLofTdYQHpUm6xRCYfq77DfXo99/FsDKfB9bIgS5
Yc/hFZavXUG6i+wh7mI55tpZTlKh6jIAMXJdqgFgJBF3pD0wd41aaLaBBeQ9y3BE
n3Fy8u8NjwJHTNw5CFmAlJvbCyQsLEtiEQc0nrxT8cyWmKI8M18F1BgEES3s9jM1
LtSlVKTPHb5oataiWhfShUBzVSCFMAj2GRsye356+TS5ZEbV5iw=
=HbBV
-----END PGP SIGNATURE-----

--iCgwqCn6iatDu4+P--
