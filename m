Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0582A4D698B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiCKUic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiCKUib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:38:31 -0500
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B2CA1032;
        Fri, 11 Mar 2022 12:37:27 -0800 (PST)
Received: from localhost (i5E861B4A.versanet.de [94.134.27.74])
        by pokefinder.org (Postfix) with ESMTPSA id 675962C01AD;
        Fri, 11 Mar 2022 21:37:26 +0100 (CET)
Date:   Fri, 11 Mar 2022 21:37:25 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v1 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8168
Message-ID: <YiuzBTybck2ygFGP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
        yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kvpBfzgmPgH6jx37"
Content-Disposition: inline
In-Reply-To: <20220307033649.11564-3-kewei.xu@mediatek.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kvpBfzgmPgH6jx37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 11:36:49AM +0800, Kewei Xu wrote:
> Add i2c compatible for MT8168. Compare to MT2712 i2c controller,
> MT8168 need to synchronize signal with dma.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks!


--kvpBfzgmPgH6jx37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrswUACgkQFA3kzBSg
KbYB/BAAswZN1HvmpZKWvzonpPNjH7FaJ+tKlzhUwGv2PL8JC5YK9F/R2wYZ23Co
0bvhk/d2004q2DjJeEja8YAQ7nkZqq/Tmy64PabF5mRrgHh46ur1eLco3JsuIev6
MOxec7LwCrJMRm56IIIiHRSwLbuKiA9PhmgRp7jw7OlDD3cHA7y9E6QHX234YX5/
ntzJyosKv05rwHuobLDJpQYbRT0kfz7rhuCK07soDlSdtSjNoRWmKK8jk9JGDAN+
Vk8BYje1Nfx5i2zz8++PPQyBHiBn91Qse18D3nxTIc+32BP9rFR7Jmkz21NR4COo
FdugFZxlWumPpTbRyzqh5NWsCSovM9fyV1rCzztVfcqcbdDTnNWrX1l7qD2MOpp0
h9SjGzdwA9xZrAf0awwDb7vYTiKd5gvxsxgNEqP/eT9cyAManNxvbrcZjIyn7bjW
2JUPxzwYLj+9IISovG77X45kI9L3dT1GQkKlXAs7OsPM41uHtSuc832R/YMADC01
ch4QX90Mo1f54SdshPvlYlENhjIu5dBKrXCR7+vuSxEZ45RHPKN1qZX48u42rW0N
/hDS0SSLM4a5AVkyNvSwReOPRm6rfSCaPtVBAWXtp43NOYHzBd6CvzYvtwCsVEMn
JZ9Sg7KFgkznAw5oh1vyEPuyfYGHyuL/7RNyUtcKB8hkkwds4+U=
=DttB
-----END PGP SIGNATURE-----

--kvpBfzgmPgH6jx37--
