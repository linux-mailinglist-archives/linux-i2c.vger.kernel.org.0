Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0CD77BDBD
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 18:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjHNQPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 12:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjHNQP1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 12:15:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E72F1
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 09:15:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 154A2622B7
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 16:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7B0C433C8;
        Mon, 14 Aug 2023 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692029725;
        bh=bF6wx7tMT5k6bVqZuAnSDVZ3QMyu66+UaQiLYCfgbSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i8KAmuOomGsHoyrANHBLOOFpVzYbKrvTRMVbZDYS+8QUROiP91yCuiwlyrtrY5ioB
         rNDvdgOGtu6Y93610d+TIFj0ywKjWE/zWN8wQ6hEfmQZ9xCosNtQgF3n7nnShD3i+P
         zI+HfiTBNZHcmLpi8QG/WPO0F0ELDiQtvw307Qh7nPQx3pXDFcz5pJbDqGe2v18855
         Tif23NVHk1sXeNfa/2MVzPN8ivktTcfE0Em0qjHhmmw/RvX+9M2Ca25+tNsqaJqHjz
         aYHgDQeOLwwGbKeCjotZWdJpKZEZ8QsChpUYyXMEWVOi6HWGo6SUKSVgBRHyi8jb7M
         9FsTJGyqyPRyA==
Date:   Mon, 14 Aug 2023 18:15:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     kernel@pengutronix.de,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Update documentation to use .probe() again
Message-ID: <ZNpTF0rHoPJWy4MS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        kernel@pengutronix.de,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JSQBufAwoVXlD/u8"
Content-Disposition: inline
In-Reply-To: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JSQBufAwoVXlD/u8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 08:45:22AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter") .probe() is the recommended callback to implement (again).
> Reflect this in the documentation and don't mention .probe_new() any
> more.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-current, thanks!


--JSQBufAwoVXlD/u8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaUxYACgkQFA3kzBSg
KbZ9Dw/9GTPTTg2YgSYzWYnLZ9L/U7oNAd6XOY6DkTC1wpN1UawLzvnuKUl1koQQ
aa5KF0DYCDuKUuoBLvi2e/pyp5I8+b8pEn42l8xMlf08oa3CKWkyx3KAtJ5A1f0e
u0qcTOGillsmBA8nFeAKp1sEyk0KuPBiTqQN3vcmCvQOtM4Wi9F7TkLCQuutfJLg
2zrwZbEStQye3kUiBubZSBo5VJpvOv/HNIL5wA6yI24MJzdcXR0+PFU4uwfg5UJI
uvOZ1t6lgeWjMTk+T/5vQ7bgnBxHFocX59SAFJOIZ+v0i5fYJ8S/bcGbTAKgxylk
nSKCsXelyXEY8wKyX8/U36EAotxtNieao7TdKRbbKThiv9odKDYyRr0LGlSyIRK3
+vQ6qiFrCGCOFjtYI2d2dwzJpArleFzfOL+ZKjfa9k7/KctIkJvGLaG9JKzibU5A
0uUlke7g7AaCuprM5lx3SPBLBecZgZt2ggE+8ogFw1/wm+9a2iT0KHnOuSdbYRQd
f1fTawTSmJAmtZ5q77aTu+yrMVZh0e0EaqgwgJFF1bKjDZ60VJLvOpVprZS8B3S0
lv/Z/SwX6MSv4n6leVTO5szPjBtPNQJNksuIOpsQuIEZdMovobwdpB0CoiFvTHNm
5GLuuNoZrgp4fMJPFvdOkXG5ukD0BPzsTCcZ5ec96sLl3jOYOpI=
=EcWT
-----END PGP SIGNATURE-----

--JSQBufAwoVXlD/u8--
