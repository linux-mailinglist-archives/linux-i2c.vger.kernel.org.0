Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A276543D2A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234204AbiFHUCw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233542AbiFHUCt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:02:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7170714558E;
        Wed,  8 Jun 2022 13:02:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC7FD61C58;
        Wed,  8 Jun 2022 20:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896EBC34116;
        Wed,  8 Jun 2022 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654718567;
        bh=fOeilYXwytop+oGSxZ1LqPitweKw68M3Rw2KIU8vzW0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KpDtqJLFoIYj0hsVC8Ekj5EWaFS0g5ZLwt8d2tznwf1HudmIsPXYf8ZtLbxnoTSJj
         s9C7zzlEG/fxaeF/PtJtrlI8InnG2wAU9cQ7+dsH0h7+/xGuVlH2T4RPo4IffqgV1a
         OG8vwUe5pXdMRJmEZuZdUt2B4Cal8S+obznxqDwaIMx7r/Ltwy+qtrwxvQxbS8EZJv
         vY4PilVsyphA7hyGUxisisQITnOa0geUFOO3HGCIQB0k/vRrfxgLje0jGKf9S+w7js
         fUcqCz6j+au7l+yVXVO+26HYC25c3siZ9YvKsAL4klx+bkcdpN+1UQrLf65G8/IeFP
         ooT6J0ruZLnEQ==
Date:   Wed, 8 Jun 2022 22:02:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
        sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YqEAY2jUQC8itp6h@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
        sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220525032341.3182-1-warp5tw@gmail.com>
 <20220525032341.3182-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eOEfobvHUxMla7mI"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-2-warp5tw@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eOEfobvHUxMla7mI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:37AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--eOEfobvHUxMla7mI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAGMACgkQFA3kzBSg
KbbPwA//TUBjvk1YsaJncMxAWQA5U+8iQHievylO34AceXllsye/+zAPEOTWm2mb
N4kNNtvmOVHDiQrJF/tUJJCbp1PlxH5Lu5PA7sntMTiDb6l51IFtWe42eUDBbQcN
cgc4vx9DLG+0qFV0cXcQ4F/V1AkhZFvoAmbLKr4vbjLSHjtkhTcOBWHBuClfZg++
/B+9knOKF7+HbEv9aqK4huU6BoAf3j9eCHwqTu2OlrxQQ/oC3/ttDC6EOENpJf/I
S43JXxY33G1nknOnWJBT74v64uCuuumjTHREqBUkmCF0v72Pfp9qW02AZ3t5ArJF
Re2hPKn9Mq1NZECeD02D8hvFyFv0llD1vSSs8M6Y3L2y1PmWYxaHNyUqzzYP5voO
sS9XyUWTjOTjHHSl0V7eORM84HGPXpunY3AM6qhM8ut8cgTw85Yz4zBfGliyeG21
iX5iArRTy4rr0Aw+AntRSPgTk3BnZFHvPZUDtnQPeD18lT+MZlMcFYy4f3WzUfCQ
RzlxhCAxegRNgrxQoEhYtONLMkRrgxfNvXv2GNKb8zXPc9B6N3ZhcW90JdkYZ4nS
8YANTox5TOwJSfHu2VkW3IYS+ISFrvVXeeKLg9Fd6YmYoUUR1WFoPW380WurxnxF
ABt/X1CT8zmP65TZk83v75V3m56QRF0VFkaTRZO0Wl0SPNU6iJ8=
=r/Nu
-----END PGP SIGNATURE-----

--eOEfobvHUxMla7mI--
