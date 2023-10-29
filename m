Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0D37DADF2
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 20:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjJ2T3p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 15:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjJ2T3o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 15:29:44 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1629B
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 12:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=i5Tg
        5BvQ/ImIMvKSKio3I6w5cPvh+1Knfflxe0lg4SE=; b=J2JFrqrnv3opR8XRlYYM
        Fw0pAR6B9wSormt8DwXxite0dnDEiKunZDdw6qa5PAolXE6z+w+9W4oyoWBV72Op
        pz+iDMoJh7RN6rLHjTDCFvx+cbBUsxq11m6+p8r08GDk5Clo2MWYccy8O/Qi2/UQ
        FbWSTRcQr+uEhs4pva2jfQ/YZzjOL2zyjR/QBca4iO57CHr6HHsyL1FZ4wxcwFmr
        xNuYBqIUgaPChosrJWxp3mJ0+rcEpjK+Ys7hwmptDH1oRTN8OVPkY7XKgevMAdmg
        t0EfJsNFWU6nyWBaeHbq9IxwVt5e8KM8uIENAkYK9KLeN55nNTQdPZrwL0b1KIOW
        Lw==
Received: (qmail 3888785 invoked from network); 29 Oct 2023 20:29:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Oct 2023 20:29:40 +0100
X-UD-Smtp-Session: l3s3148p1@qJVa8d8I9pZehhre
Date:   Sun, 29 Oct 2023 20:29:39 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     ye.xingchen@zte.com.cn
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mux: Convert to use sysfs_emit_at() API
Message-ID: <ZT6yo0Ps+1BL3+QZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        ye.xingchen@zte.com.cn, peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <202212071048339386860@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bzwJ5q0L++IXF+32"
Content-Disposition: inline
In-Reply-To: <202212071048339386860@zte.com.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bzwJ5q0L++IXF+32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 10:48:33AM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--bzwJ5q0L++IXF+32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU+sqMACgkQFA3kzBSg
KbZAeA//ebj/ulzHJnHyDl+LWm2S+o3LI3vc1DqrxiWDYyxx9pS9VgrP7RikD5V9
PaDUuK6+odwvsMMes6COJLYELhFnbsS9jYoU4ehAWB9DRQYlAFxxLVtq/BtsbxB5
b5CMBt5ZVK3dbmrfPKHMNafutTpPZsEy/0P0rOn5gSl9gBnFn6qS07uJG++h0ouW
Ay0xsmPTVkxFXtBCdm5tnRiRsiFjOEtfNfXATiZwC/WXVlPHXs8Wo6jBO2atB8H7
cZw8T8S74JjSEw/L7MU7Dv+KfO9/8rP6fj8s3vtbJsSQ6EqyXW/OPIF8VayJk5hW
x/5Rb1TKQxCPtzbTCkO4KyKh/jL5W8W0lcatl41IZXCuE8ezLCiFs2iabA89NFHH
OIsvW9FzFx9XWBHB5FPiNMuyvHB5IxtEqeW0Iw0vf7qnQ+8vEzcF6xAia8Bxue//
IkWK3VrRLwEYc34zM2ZdOb8K8Y9khBeLSzc9F6RZ7LU4oHl4kEFcnsws7EnQEBe9
2p3EiPrhkjej0vbA9L0QcqyR2jDf1ZzMtdZFL8pZ/9IisTrpyZ08EVOJyso+gO0i
gSvOFLG38Wll6+abncEPL6xtgtzC8w779hmo33AbgARK91VMGsbYD4DkxUJ9RILC
qAnmwMANN6y6yDF9hW5FN0WUK0Z/TTAXDgWS1ItjaKDgH9wNSoI=
=7IWV
-----END PGP SIGNATURE-----

--bzwJ5q0L++IXF+32--
