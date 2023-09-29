Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4BC17B2F06
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 11:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbjI2JQF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 05:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbjI2JQE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 05:16:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFA11A5
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 02:16:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB715C433C7;
        Fri, 29 Sep 2023 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695978962;
        bh=qhu5luz2FGDlTYdy7sJEYA2TUjY8CqVYAQq3G5aL6bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8z4b+R8yAUxGCBcqpY4DFd4gJefp+aEkGhXhA1a0KPaIhsnRu2PSgkQluDti6rSk
         3qaXiTNEMcTDMGoX6kOjbNT/eZwpiI3KSdqJuDx7XNMQKxAjOdz+D+Nv1KfiU6LgWN
         O+ZgbkSRmBkdvDMJKayZXyLVUjf/GicahnhdO0LHp1uXUB8ThDmb2W8hUxncVnuT1+
         aaA/uMZseA8v1XRkGWQJ4oelxiJZzzgqmGxNBCLEXRql2WxtoK4tt3/5oGn31blmpC
         de+lp9jp+jMJBDh2BAUctUmfbsU3jZhg6x9JgI0gtCHymE8a3CIj8ykpBltrw1/7S4
         dTJAgID/ANN6Q==
Date:   Fri, 29 Sep 2023 11:15:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix possible memleak in
 i2c_new_client_device()
Message-ID: <ZRaVz4pj8zko8x7W@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org
References: <20221124085448.3620240-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5hxmEnCosLPTBQZ5"
Content-Disposition: inline
In-Reply-To: <20221124085448.3620240-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5hxmEnCosLPTBQZ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2022 at 04:54:48PM +0800, Yang Yingliang wrote:
> I got memory leak as follows when doing fault injection test:
>=20
> unreferenced object 0xffff888014aec078 (size 8):
>   comm "xrun", pid 356, jiffies 4294910619 (age 16.332s)
>   hex dump (first 8 bytes):
>     31 2d 30 30 31 63 00 00                          1-001c..
>   backtrace:
>     [<00000000eb56c0a9>] __kmalloc_track_caller+0x1a6/0x300
>     [<000000000b220ea3>] kvasprintf+0xad/0x140
>     [<00000000b83203e5>] kvasprintf_const+0x62/0x190
>     [<000000002a5eab37>] kobject_set_name_vargs+0x56/0x140
>     [<00000000300ac279>] dev_set_name+0xb0/0xe0
>     [<00000000b66ebd6f>] i2c_new_client_device+0x7e4/0x9a0
>=20
> If device_register() returns error in i2c_new_client_device(),
> the name allocated by i2c_dev_set_name() need be freed. As
> comment of device_register() says, it should use put_device()
> to give up the reference in the error path.
>=20
> Moving i2c_dev_set_name() to front of device_register(), so
> it's managed by device core, then call put_device(), when the
> refcount is 0, the name will be freed in kobject_cleanup() and
> the 'client' will be freed in i2c_client_dev_release().
>=20
> Because the 'client' is freed by calling put_device(), so it
> don't need goto error label, release other resources before
> put_device() and return directly.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

The report seems correct to me, yet the solution is copying code a tad
too much IMO. I'll send another approach I'd suggest to spark some
discussion. Thanks for the report in any case!


--5hxmEnCosLPTBQZ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWlcoACgkQFA3kzBSg
KbYX7BAAikOoCf8YzRZyJ5yejpcT05c194QGK07EyVs7YaxavveY+O+raPte2QIO
8dJ4XyXm7q9XL0SDmgbGhQdsHF0OVRklRUtQHMMRIp4avWB8KYB6wiqiN+Ju/wQD
NYiaRaSpuPDTjaKaNS8dQ//CPNTQuF/Ms2uPv53KyG4Sr2Gz4QCqCVWqXE8Uy9vi
1/IQ3ZODEKukgOFhXNU/ek9uvCEAy6mo0rxuPI7IhsJXzF+kHIC+hUrOTEebGCl4
6A0T0UVAPdNwgFLCqOkn2/1r/kkmKTGskpzEdnMOebojBo5cGkk//lCjhUVvlGrq
t1QUqZ6ErIdkAOggrZCL9otJFcSuQBOEsL+sq57yZVDMwAWfNVSUMHvp94mjyDf+
cBXAlTs3x0AcJ0oMHuxMbxTgGkGugcX4aN7Zb611FbHbfXB9dY1SegKP0WTopQMY
CqqJU6Vb2T0iWwdIrsM4QE5SuRDBIGaTQwT4iCDjt2AIcg0PlSiowfBFANH6domd
k2muF9RmkkwWKR7m7g2g7JU84GzlN3M2OycH9IKnbiv+Df/TgAxTqj+JAm2S6ttw
kd31bPeDeeOKH3nZKOcL/A9U1tKMJemRTF9/3KtRcTBFaca5zizWV1lLpD7POmXM
l52I4wYi91hslpJenlB9LfCvh6E3ezeBY1b3fz1DhmNqhz0VnmY=
=wAAu
-----END PGP SIGNATURE-----

--5hxmEnCosLPTBQZ5--
