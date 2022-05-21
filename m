Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4BB52FA9F
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242224AbiEUKSo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbiEUKSn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:18:43 -0400
X-Greylist: delayed 371 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 21 May 2022 03:18:40 PDT
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C981A5A83;
        Sat, 21 May 2022 03:18:39 -0700 (PDT)
Received: from localhost (p54ac0650.dip0.t-ipconnect.de [84.172.6.80])
        by pokefinder.org (Postfix) with ESMTPSA id 4E04D2C0024;
        Sat, 21 May 2022 12:12:27 +0200 (CEST)
Date:   Sat, 21 May 2022 12:12:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH -next v2 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Message-ID: <Yoi7CtG+ZoNHvKdl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
References: <20220514023148.305457-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/QvgFcbHc+KnC2YM"
Content-Disposition: inline
In-Reply-To: <20220514023148.305457-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/QvgFcbHc+KnC2YM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 10:31:47AM +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from mtk_i2c_probe() in the error handling case.
>=20
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driv=
er")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-current, thanks!


--/QvgFcbHc+KnC2YM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIuwoACgkQFA3kzBSg
KbaAgg//aO+UxNd59hJiNRJesX7hbSoNvNi/Am6E07iqb75UlXN1Ljx1FhagnAGY
GvFXynEZsyCG8kFRRi2SN11MSYm0KVcGTQ9R5ZPPMB7YMZkNoUMzm1TOCUPKk1vV
I862euXxp00U7PTZ6MlyzabWcEPhjBTU0pLmSDb5LAnT0QD5Qsb69hvk64ZWk3i6
bpuN+DUehqjQ5tnDURtC6UBwGar7WoY/sAQtLh80fBgKrLY1Q7SzYMmuLerCJmiU
QFR/L+/aJZw9ZLsN9sKFhT83xNxkQRfbBYQ+SY+WSoNapX8q0KajBQkdH9a2lzs0
ORJhGv25QzIudNLVAB1crTPq/uKN4o22T6HZlngIh9Dl+yFiI2WWZg1De2TevgwT
MTV+L9hm9SCkrAwIwpxWHzXdcz31Fh2yM1wNn/HRhH6dxiIxlsEqBW2NeIvbNwzZ
KNLPW5Xa2vE5PI8OeNDBpIMN/hu/YXs9ZBLb/0JjiWbsrpJTrLCwHQ78yxYHk2WN
OvNzqj4cUXeyhTox8xJUFSHtQa1EKxPyRF4QDR7alh7oQ1PQfUDDX1b4PM5oplkf
e9nclfIbgN3l/AgumUc0EGYzUXPGNiznz0rDbQInIGZAjCY6ldLaYjMR9XSxrfW0
Dw22qdw2mTXZ01Iy1BYwNow/BHcyZNIMM1MVvdg3HayduC2xCvA=
=VY7J
-----END PGP SIGNATURE-----

--/QvgFcbHc+KnC2YM--
