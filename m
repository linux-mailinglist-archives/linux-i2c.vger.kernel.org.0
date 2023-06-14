Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 588A572F812
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjFNImQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243705AbjFNIl4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:41:56 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206C526A8
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/Fd3prUQ7Z8GwjHldm7iZrBn26V3
        t7qnAB/YaObOvP4=; b=Gu3Da3qomBWQJLhxt7N4uKSOfJr3HyRbWLLvW2ZBnaX4
        umX8/uNRJODeXsx2NwZfgEYz8MqdDNUDjjBZhTnyR9CRnhICTvdEEwAqIczSAvCE
        ExHsOFyl4BcaxQIu9zt4vpj1szEOLtp19nYsv8pOE7AzNm/5hvk8Ts+Mfu6+bKw=
Received: (qmail 2811553 invoked from network); 14 Jun 2023 10:41:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2023 10:41:31 +0200
X-UD-Smtp-Session: l3s3148p1@pVQb6xL+FOMujnt4
Date:   Wed, 14 Jun 2023 10:41:30 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     ye.xingchen@zte.com.cn
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: wmt: Use devm_platform_get_and_ioremap_resource()
Message-ID: <ZIl9OrI8a2yi0PJw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        ye.xingchen@zte.com.cn, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202301281451442100100@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBKPLPilUhr1hZ9n"
Content-Disposition: inline
In-Reply-To: <202301281451442100100@zte.com.cn>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DBKPLPilUhr1hZ9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2023 at 02:51:44PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--DBKPLPilUhr1hZ9n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJfToACgkQFA3kzBSg
Kba3ZRAAjopGRxHywX3tUhvyqXrbIOZ7326FGILBVEnnas0amhCc5QQI5IR4DCi2
DUef+cmt8b8d4dUoD8GQlFyzgGRoW2lLkVzVLG+Gk6DCS5FlZM5PVhYVZSMadwLb
l72u8dX6Fa1uJ7UoegHKF4Sr+RnonzJg5WTXC+FMNPJfbJWsfejYGOHnEykCWvjD
ywJc/KVQTYcDFw9Q4hNLOK6jObVlGPVNcvoQ3UajoV3QYQvkbv6r/2zWcTQ3ZsQ1
/ZYmw6nhsrz8pDNfKBPclJrNMXm7qzkb2X1m6Rqq0qiIINuQ21eUdmitugN92ZLu
fuiuiLUhPU8Oo8UFUZXfr6Tq98d9laN4/G08B6PoI3xKG99nfjqiSzVs3qUWaIml
Op+Yf+FMfa5h+Si9edIEVEWFSmzJMbMJq5tftOJKusopkxYMPCBRboroP1T3P/jL
Zqeohr71ksELz848zBJ6yKXXHsSOa5oHPFMSMb0OU5hMSGfeAlDgBRDEpKn8+uSw
IkbhmfeJGV3rArqeb7MZAFeSiKXlOKA2uTT9Ba0jNOcaoMTQnefAHOOZRyfEjHZe
rMkiEpz8vJc270r162lgjaW/trsUbDtpsP0wHeI2oYZOxUtmeUhGqRYyUlzDiw2q
ywkUjk5ESJ8KDxuszdQhubrePM3GdzrZqpZDwGM5KUEsHFeasD0=
=hNQL
-----END PGP SIGNATURE-----

--DBKPLPilUhr1hZ9n--
