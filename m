Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684BD4C8ECD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbiCAPTj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbiCAPTi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:19:38 -0500
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E12B52DA87
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 07:18:53 -0800 (PST)
Received: from localhost (35-123-142-46.pool.kielnet.net [46.142.123.35])
        by pokefinder.org (Postfix) with ESMTPSA id 9657B2C00BF;
        Tue,  1 Mar 2022 16:18:52 +0100 (CET)
Date:   Tue, 1 Mar 2022 16:18:52 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
Subject: Re: [PATCH v10,1/1] i2c: mediatek: modify bus speed calculation
 formula
Message-ID: <Yh45XIAnC9mQNqyr@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
        yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com,
        david-yh.chiu@mediatek.com
References: <1645100563-59441-1-git-send-email-kewei.xu@mediatek.com>
 <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GUdQBt0v2xcPs6AE"
Content-Disposition: inline
In-Reply-To: <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GUdQBt0v2xcPs6AE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 08:22:43PM +0800, Kewei Xu wrote:
> When clock-div is 0 or greater than 1, the bus speed
> calculated by the old speed calculation formula will be
> larger than the target speed. So we update the formula.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to for-next, thanks!


--GUdQBt0v2xcPs6AE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeOVwACgkQFA3kzBSg
KbY+Ag/8DKZF6+5v+fhOkRi1ryNi19EnaO8Gxu81up/6Z0iJUqpNit5DTeWAa0r2
j/HUbLyFI9eXU+UBTSPF0Bf6FClRQYyV2fATBGPz5THXgg+893RgcSvKKauFv19l
u0SnOFaK9RbIAc3dwRbARNrfD9aaXOriLdbRHhYwmIImaIQLs4Z4yCI49HfvCGnW
/duo+0aP+3TWbKKNJLJiV2UhepW0cUg5ksyo5myAHxafV6DgPplry1Tl5fCku3L3
RGLmHG8b5IECvbj2NYVWGsss6zTE1zCCJAmF80hJvmprzwpnN+HSCCKmwRoRafPT
lOUInQlQmGBxkbFYu8HeNM6EWUIONlto1H6ZAEer0gJVn1B9lzdTjuxBTsnO7IPH
x2vYseUH1mKRcfPGMlJS/q40v4jF1Q5eU+gbptjxPcwF0q6KLYw9Wxfl0Kx/TQ2V
Ne3uc/z8+MkjBebwSZkYCc9ZiL00cBADaEWd3J4F+MYuJeY8Dl/JMDQdup60khDE
4x+RZoodR2t6KvgEz7GdnBFqE4dA9RXuamQxYZqP46vzC/ogJ7Xzfg3UiD+651M1
HjL4LRCHbVXl3etzVvRxItNjEKP9CLM8xGZ5JDhI90qHPCz9gl8+9GHVLTiZdqZO
HtDVW2SD8bihM92LKMcrxCibRJ3frQ9LbfyhYeo94tsLUCYALAk=
=M8Mv
-----END PGP SIGNATURE-----

--GUdQBt0v2xcPs6AE--
