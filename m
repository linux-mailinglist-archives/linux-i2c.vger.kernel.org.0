Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8821689F76
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbjBCQjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjBCQjQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:39:16 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1797310D4;
        Fri,  3 Feb 2023 08:39:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 844D3CE3088;
        Fri,  3 Feb 2023 16:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456F2C4339B;
        Fri,  3 Feb 2023 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442352;
        bh=5L40kHrPbWn9tcA8imgGArZK7xmuLQRUUdmNwkUWgb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=th9w1vYvihKy04K0i1WdmpK4jdqb8D+Ow8id1DSo0qDFqbFL86eY6n5I1sGztw16G
         AmmWRMyxcYLd3KkpD9+lVB7PyJp28pWi1egIabtua4Wq3sGnU/vZtwU2tjxdo40PF6
         P5WAkJjn9r+hnrckgx8indyOS3DoOWzjOU4hxU8OmUqT1ZIH2fWuWHj/Uk+Iq3X3bx
         hCk55JCqPDMmkOs37URDgjcqf39UcY2DgR0609dqc1v76O0Dl/LN/1Ng4au+3ei4O/
         kjxQ4/vTF/aoprvSGFj/Sib7mWUeCovk02YAWW6YxFVaAuFCFJ59hSzr1TLuhewsl6
         RQJCfydOSio7w==
Date:   Fri, 3 Feb 2023 17:39:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] MAINTAINERS: Add entry for the Loongson LS2X I2C driver
Message-ID: <Y904rVTggg9zZqVZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
References: <20230203100002.248482-1-zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KUwsnFhhfAQBIv1/"
Content-Disposition: inline
In-Reply-To: <20230203100002.248482-1-zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KUwsnFhhfAQBIv1/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 06:00:02PM +0800, Binbin Zhou wrote:
> Add myself as maintainer of the Loongson LS2X I2C driver.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Applied to for-next, thanks!


--KUwsnFhhfAQBIv1/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdOK0ACgkQFA3kzBSg
KbYAQBAAlC0TmzcM+SNF3EfhkHhH8XuTDtBst/4sHjt4g5fEZWC6607jCPCdI3nh
twsneROFjCKjOLo5R57bHqRMzENfxy0mW8DNHzk7SZEm3vkQeYNwu+gJ1qBuG3L1
fBIXKfVPKVTXnpTYolPaR5hAZJNKYKTW+vF8O3YUAQqbFAv03PyIJ8bcIphHsgxK
SSW0PxgOSv58B/KlHfiGqI0bo988j4vlzdcEjqMs3hfeHgmUv8bPFTLQMspfsxJ1
EwQcQuYRW+GaQf8HnvPalqW3TTO/qI9I/Z+wKJXWtVteALe4PAFc9YwUi5RNG5MQ
IcCK1ZaBD/NYqWykiVqSQ1wFHZVlyd7j2oZ85ItptgFu2NxqHt76VDn44QSp8leX
0jkj4JrfpD4ml6NKnTGZM1PtG4z1ZjgbBcsQ8QSgAurhTwDhvN40SvEnJ7ZRJ7oJ
scw2DubQglvaYy+lMMD8dS1q2BmvYdbCNqtawnKYtMhYc/C1oyMJsyBjN6wnjWCR
Jb/3h09D4+pD8ePfMv7MYBhYIYIAhS79kbDYDCLdnRV5cWf8z3tU5m6mOcy9qe/E
dnuIExtJF/ElmBhFqxEYnXzfSp+2Qp9J1b+bFnl2+jtRmv6Ajm1SeNmNJTWu6ibI
punGHu26OX96ez9y3jJ+AVYSld5PgNRWj4nkopZhXbVR23XbALs=
=7JoR
-----END PGP SIGNATURE-----

--KUwsnFhhfAQBIv1/--
