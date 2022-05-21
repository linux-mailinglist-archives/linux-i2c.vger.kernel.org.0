Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749AA52FAA0
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242374AbiEUKSo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241526AbiEUKSn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:18:43 -0400
X-Greylist: delayed 370 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 21 May 2022 03:18:40 PDT
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C798A503A;
        Sat, 21 May 2022 03:18:39 -0700 (PDT)
Received: from localhost (p54ac0650.dip0.t-ipconnect.de [84.172.6.80])
        by pokefinder.org (Postfix) with ESMTPSA id 2E2A32C01B6;
        Sat, 21 May 2022 12:13:20 +0200 (CEST)
Date:   Sat, 21 May 2022 12:13:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH -next v2 2/2] i2c: mt7621: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <Yoi7P//OBmZJ9fYS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
References: <20220514023148.305457-1-yangyingliang@huawei.com>
 <20220514023148.305457-2-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/1HGW9nXdbcfngwT"
Content-Disposition: inline
In-Reply-To: <20220514023148.305457-2-yangyingliang@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/1HGW9nXdbcfngwT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 10:31:48AM +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to for-next, thanks!


--/1HGW9nXdbcfngwT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIuz8ACgkQFA3kzBSg
KbY5nA//YOH2uqeLuwIvPdKPHoj3FA7a5OdgJj6DrdP3HZ1ETBze7IT2YTWs2gHJ
1q4qfDUkgq1xcPfChXmVqpUPwk0ABAVntALdr0ZGxhXO/L419LrGEIeJ3d6hi+N2
Mt9a8Z7/zP/aU/wduNhi2hykfB62Am/vQ3JZ8ozhh1eAyTTmrUHGCTnSz3YWHaPD
jRQ9kOG6qqwAkSHe/MpvPgKzLQPXMitNRuk4+cSz4u6pUncaNeCqPErWicXXDRKz
sM0wuVS4oGVysClHtlZjFJzSeIp3g67oSVmWkOADplB1JoJWwhAdNHg5e2n4Ot9t
gWrST3ol4/AOrdh8uI4If0K7zKg/BkqMGF41uqO6kFvq5NEjzVizA7Dikl0giiEz
Hdgc6xtSJdjjgX7OMhSMy0nDUt17pPRBGWmvXZaz7cPtKCiVzmRAbg5UuAJMHmXw
J5dg8DH0oj5WfHlfF9DHaw25ENYHYuqjo4ZxH/Uxxtqvw4aTpum/UpZ7vmNAb5a3
mCHoLXRT/JRk72VEBrZJWgrVbOzhy+GjdqsERr7mPhd09oowP3lW4h6WmDy+gik3
xy3LZP+eo+RR6AiR04vGNwz7a1/+Em80gt8hISK+jBCfTl3qbPbXWLtM2u96Avgf
gad9uKzW85Ml0OXo7D8Q1qaqrQIhpLjHLJcmwIAkWJPQX9WdaDY=
=FwFo
-----END PGP SIGNATURE-----

--/1HGW9nXdbcfngwT--
