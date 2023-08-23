Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32104786237
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236640AbjHWVVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237833AbjHWVV1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:21:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9887910FB;
        Wed, 23 Aug 2023 14:21:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1980B62B2B;
        Wed, 23 Aug 2023 21:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9041C433C8;
        Wed, 23 Aug 2023 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692825667;
        bh=Iyj/SmH3OAVbPBie+ofMRf1yo+cSncHOoZU2FBtcQaE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=PaOalsK/nJsnnCc3SWlFWuYuiWQkeDHKwbwAi4B8e8OI7G4xf3eW8TrHOu4rAsABi
         FxxmGdnLjbxCaL09xghDhTCwZ+Ot8hR538bl192L4Pad2i5InMBW0idAkyG5Gvqosb
         y6TCIGaYrcst6FHAkeSCR404TjQcl/6hERu1hDdrl6UQlYYfz1+0NkTNE1hEaRG2El
         6JiyDdkYvp8BTfAGW4l4loy03FU2W96SFFZVfF362DEuKYhQOPwqNQbYasE81J5k4n
         /vpphubGGjAYm0z0TqtWuEfQ2Iv7HobGNf/Ly4NTQwDMzBaOGk3uxZa21kIG14RNn0
         E8Hgecm0lA7Yg==
Date:   Wed, 23 Aug 2023 23:21:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 1/4] dt-bindings: i2c: pca954x: Correct interrupt
 support
Message-ID: <ZOZ4P8rHT+nwK+rp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-2-patrick.rudolph@9elements.com>
 <ZOZ23CEnQ+Cus2wh@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Jg/jTplsJfy0PNOd"
Content-Disposition: inline
In-Reply-To: <ZOZ23CEnQ+Cus2wh@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Jg/jTplsJfy0PNOd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 11:15:08PM +0200, Wolfram Sang wrote:
> On Thu, Aug 17, 2023 at 09:10:50AM +0200, Patrick Rudolph wrote:
> > Only some of the PCA954x compatible ICs have interrupt
> > capability, but the binding advertises it on all ICs.
> >=20
> > Sync the dt-binding with the driver and only advertise it on:
> >  - nxp,pca9542
> >  - nxp,pca9543
> >  - nxp,pca9544
> >  - nxp,pca9545
> >=20
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Applied to for-next, thanks!

I replied to V15 but I applied V16!



--Jg/jTplsJfy0PNOd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmeD8ACgkQFA3kzBSg
KbZBmQ//Q0kPa73CEJv9ToP+DoMvCIxZx392x4LLzOesGUS4qrStr/457jFc62wc
rawi3q0doO882pbQ015rgpgOorzzcp8XWtJRcyV9D0xCZiKEcAsz1ShgxaJ+f+BW
O7h8TNz1bKVSSbzIzux9OiTOhG0fmddgpBBUEdLLAwzuCfSZ9YbuEuMeJZCtrCag
M5ALF37O1nJuTwo944V7LI6u1j3U5scbWjK8R8p3kz3fRy/xPBhB7yHYk7DnWj72
9BxplWwlUb1hSQEHUFrOGLHYcTaWVYPKF2RYl6stvPq+DXoVATPLAMA/3WRUYc3n
+HhcDZEBpUqDnF2euIEitOaCPxxsubNxd6m/iD5eeFXidTJMnIcohARztb69nHyC
ohdWcRAIWuZNzMMjvrxQnd/zlG+shdf3dPTo2mxMGMMV7U6TzChYCY1ggzgc63Lr
boR4mwDvqvc+zazlAUblQtI1De878XEo+3UvjsYoFRD4f9yi9mahWObbuliLCWSu
73T3Yg4aYCeAwYm/L18021M+Jb9g2WcnWOdyFbQbGRGf7/fc0OZpUBkDp4lvkjSj
2Tc5H4FMHDn4xD9vQXASuidx0mkYfBGp1dOyPHzOj95YXIHXUBdXZdxxObFZWp7K
SJ2QAogaGOcuHriTGwoowwrWhhYZGl6bIFnBlua9ABLOyTcC8cw=
=Az6T
-----END PGP SIGNATURE-----

--Jg/jTplsJfy0PNOd--
