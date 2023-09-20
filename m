Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89B37A8E78
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 23:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjITVaw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 17:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjITVaw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 17:30:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF16C2
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 14:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=tU3+
        53whVyWx4IIc+67pTZrMSEXGmJXLt2ue9X32Mxs=; b=PZQVZDQo7CsyV7GMPOJH
        y1Rc+wH2pqP4KK0ADYlu9qzzDGf/M9xOTFkVp0/tNL17oXmozQK7x0jGpAi8B9vY
        GrjeZmHPBc9YnHCYQvRT4KH/pDu+hzwmUhyKRLaIyFfjeX7vRQu9wGE+tpVYU9Ox
        SMVjjC34M2+PLdH7HtNDxonvARXBGMTiu/7sraJVeR5crsY+jl1Gb07PeLQ49Vtt
        64Irog1c8m2GSOZPDMkgGShKi58SJNKD69Ipj6/bEJ4JZOMH2ICthDDn+HNG95dp
        mn2atl7d+O3IfPS6PuMe5i83ZKiFrFybWpHy5jqLnaH3nwNucRFKI5frxi6u+xpp
        iw==
Received: (qmail 736686 invoked from network); 20 Sep 2023 23:30:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2023 23:30:43 +0200
X-UD-Smtp-Session: l3s3148p1@5PBwFtEFpN4ujntX
Date:   Wed, 20 Sep 2023 23:30:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     xkernel.wang@foxmail.com
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: check the return value of
 devm_kstrdup()
Message-ID: <ZQtkgivCNyoTSjYt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        xkernel.wang@foxmail.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_190A7366EE04872C45417894D2D33F240806@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7gKApdZdyOuYEfoO"
Content-Disposition: inline
In-Reply-To: <tencent_190A7366EE04872C45417894D2D33F240806@qq.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7gKApdZdyOuYEfoO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 08:39:14PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>=20
> devm_kstrdup() returns pointer to allocated string on success,
> NULL on failure. So it is better to check the return value of it.
>=20
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Applied to for-current, thanks!


--7gKApdZdyOuYEfoO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmULZH8ACgkQFA3kzBSg
KbbX1w//WSW0J3dTBCL4Hh7NTBI2kzX2jnWurEzgkifpTFSKOZL6hQGRxNZjoiOP
W0R3jCa9+/n5KPGBL0bxBwYZJdv7quQj/HqqbX0juITWiCen9KVBc/5vwsyMMUb/
Fp2825N9C5fzruM3FZCbGouIznrj/sUrgy1xu82gShMspgMmeg5gHYL8a1TeLMRQ
DaCfU3/uUsZN2ZWjPKDVJs+i9oioB3QuWrA06ChNEPZfZ1uESWBPUqA4eHQ+Lfes
8xE+ruYihe5lOZEDUs6TTPt0DUFAUxoXX/g79S/wt+bUor5hx77gobmvRcXHJc+k
CFX7B8JBT1B7Nkskigqf4YSsmUj7kYrzayDpUSG3QOpB9lb0V3JNk3UZRlGdC5Lw
XlxeUOv7+uzDsD9Y/vRXlGzluuq2TIfpa52CaCKLzVJe3JA3gm2ZovtqP3fbi3oa
r0L5glkSXd4WGD6wQ2J9I5J6ZAYVq46HoIhyIHiLpEc0N52A9QNpeaFV9jw/daW7
mU4ypUbNsyyDD8IMJmxcKPpvwFxxQWCDHBOYc0TMWUxD1U2nGLDXm5fBVJ2EC9G5
DFD12mbg2QLtHD1a08QhNUkOuh9Inait8WSzk2BtrYpILi95dsvq8ld4fhr0eVn1
Q8XZwtSGv5t0i69ZT84u6oie9n908g0iC8+y4Anp7oQkF169Tn4=
=A8FU
-----END PGP SIGNATURE-----

--7gKApdZdyOuYEfoO--
