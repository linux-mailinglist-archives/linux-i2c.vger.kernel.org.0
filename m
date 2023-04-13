Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCB16E1286
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDMQk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjDMQkz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:40:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7328A78;
        Thu, 13 Apr 2023 09:40:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC7C464009;
        Thu, 13 Apr 2023 16:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA0FC433EF;
        Thu, 13 Apr 2023 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681404049;
        bh=hLSfBGJOhDDBBfSRc7QnU1NHs6omSrkAr1c3JfB3Yec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d8ELSuF9coQ6IgQt1yVjcJg4YVkrZn6LGF61SF5zXO8ZrFvF8Ljsg3ExIlZfYh9x5
         qA48s+ImFXLAev8lYT6DBkCO2iilWczgs4QzZXIa9m+9SBJ0m0aUeTktB/VU33bSIQ
         Ask+EWp2C5BDMasul3Xdaw6tRiSGFBCbUq0yORd7QquZeNY3Bf/8fb+LVWNxcKfKYe
         nlqJkbyiI+eg1N6w6QmPkduqBpTMTeVRct3tyk41VWM6E+e/ofDoNDTeo7inKReTh7
         ATXhpVHAUFWg70YYUkkAGq30JmY5gZlvCNOKvgjiqinDRYLvgMWmPM3ShUnsM4ruGY
         sLyPDaSgh2Now==
Date:   Thu, 13 Apr 2023 18:40:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981
 SoC
Message-ID: <ZDgwjS3GHdPhEWrJ@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z8Cihzoqi6i2kfv4"
Content-Disposition: inline
In-Reply-To: <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Z8Cihzoqi6i2kfv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 05:19:21PM +0100, Daniel Golle wrote:
> Add compatible string for the I2C controllers found in the MediaTek
> MT7981 SoC.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied to for-next, thanks!


--Z8Cihzoqi6i2kfv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4MI0ACgkQFA3kzBSg
KbauHQ//ScKeF3PqVVWjcNRmvwyH0OO/JEWpJ3MPIIJb+BorrmjEYS9dTweuR1bX
dLldsjFdMy0RZ7G4B/MtqhSsco3zG7eAqtBLbTbCX/J8ogD/ieWsx9Jin8Gi1si+
d0zvwaEpZVNur+XsFeEV5RhI5no6RWctYgnGG5GTsX39tDCqkJeZ8vKlA8OMVAZ1
1t9DTocRj+Ztblk0AFJ1pKdpeuKZABXF4bVjLurgKbd2Z4s5Pm72+UMMsBX1Glbx
EMlHEfx7TyvMbdwnJWPpUzomZrC6W+NuS/qda0XEov/w17rKnuBjUk3ujaPeWMsj
dr5FTLh+bpWxhhI3uojhWuSbqJfEnTboEJG2Db72Xrse/Xzrk+eKY/jhl6sGhg53
BjZ5xh6cqRJrB2xDL64WwbdR/BAvhG61Gk1WhoSex/1yatkwvenZDOsilJlKi+P8
IXdMzYMC0xbLOWxvV8GiL6RafVJbwOB7f/Hk6ceaISiTlWlNpkGRbkxr0SIEaKjR
xIm+Rogqk6dSXq0w//O+mTUgKUg62h/mtDklnn4FQYWEa9Hb6dKp7BPdrwbAZJx0
TD15QzkRPnCnjk/Pz8IxrKNvrhpzBUn7QNblODwImNqfEhKe4COywvBBaE0jMAqp
xwwR5MUXqUc9xSlsN/E9HfoBaOiPpCZUKgVE7EB7l5/ik0+3VrQ=
=p8Zt
-----END PGP SIGNATURE-----

--Z8Cihzoqi6i2kfv4--
