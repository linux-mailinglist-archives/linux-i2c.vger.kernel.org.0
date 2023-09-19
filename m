Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C517A6BF1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 22:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbjISUAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 16:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbjISUAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 16:00:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFB3F3;
        Tue, 19 Sep 2023 13:00:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86024C433C7;
        Tue, 19 Sep 2023 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695153635;
        bh=yBHFcggJxfr9oVyoIAK0o3aPJKqRcii1MV+oGVQdXZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g9GnttkX6pnlKaOvdIWEdiYttOsa//ixBKxQcYdRUKBhDPiPd+gPE3ScJGJcWUk45
         KOiFT/R1BUeRa2fBQhdm9Ms9ZqoEhxbgd/EFQwmQOpEQRrEgeAPuneyqJICSwLNsSG
         wHFW1jc/GvdbHm0LIGvztT0waf5WZAQ4S7CACQBzMjGuBXRTcXj3S+faHGq8wYv2X+
         QuAYKB14Xk+d7GmWiICflEGaSQAUfB5zEXTPIdcksxNl7zDDTPNNm6eKrg15+gVNxs
         QOAHZwlsdPD3/KYT9ZMUHxzW4v/5smxYxxw/zY1pvZmbXXnGIV/Ay6vSayZ065dc21
         cJnzbNGL++SYA==
Date:   Tue, 19 Sep 2023 22:00:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <ZQn93wz9fndNWh2Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Daniel Golle <daniel@makrotopia.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r7tFlyNNSHuH/Tsi"
Content-Disposition: inline
In-Reply-To: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r7tFlyNNSHuH/Tsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 03:13:30AM +0100, Daniel Golle wrote:
> Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> be enabled. One of them, the pmic clk, is only enabled in case
> 'mediatek,have-pmic' is also set which has other consequences which
> are not desired in this case.
>=20
> Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> is not present and the bus is not used to connect to a pmic, but may
> still require to enable the pmic clock.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied to for-next, thanks!


--r7tFlyNNSHuH/Tsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJ/d8ACgkQFA3kzBSg
KbZP/g/8Dv1fJqUjSajNDpfl/NUL4+PviUZe6O6Z8+AZ7hfmvNQOu0xnUs+13G5u
NDk1tEiaFfhhrzgHRxgZyQfwyqPV3JCmEnu2sAWyDMA6MebIIoyF0TJLvqGZSZa6
pwTwI1dJ6ZB2rqvuLvGs2lxYGquMacY4jX+iZ5RCch6jXCZy8oj4VYMn5GNPdOls
Og84v8KQJgsbx76LG7wk3daJb5sKMkP+MTqVw9uty6jgcFRk/OorwDoHNjAQYMRM
1FVJ9W0pu78S0klNaySzlP0YXFnM8Jr+DVQSTgA9p2sbXpwbJm1hZ/z0IJUW9Rdv
B9Rt4GdQz8J01XKWAtNtlRU/BdJiMI6+IuLM7vssV/eZcJYtmSOpYdR0DJ3Hv8fL
rxHQe1ol2nCNtoBH6ih19L+f2sRMXnQaSx99YJguNBZC6OqT1HqwX3qSEPr35ofV
9ICJ8x1nbzjrTDvEGcty4MeV2ijGy4zeBJi3cyJyXsLFYJIixDZHmB6l4y7eyHei
6ky1JM0+7fg6LtDQqYc9jAF2/dYcMBTlLCcqgyIiEyUId6fE7fr/91aSokRx5QPU
PXi/vwktQWPQ+5xGPudJ7MO0JXSkOcvFQiC5c7Fuv65sas75diN0+hmIqmKP5eWI
cNteSvLwQml4fNdW0hk8SzyB7A2tN7mPVfRvHNywYLmeGKVltKY=
=Hdch
-----END PGP SIGNATURE-----

--r7tFlyNNSHuH/Tsi--
