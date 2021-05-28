Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA933943B9
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbhE1OD3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:03:29 -0400
Received: from www.zeus03.de ([194.117.254.33]:59474 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233627AbhE1ODZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 10:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=mosejSqzfpsohsvt8TG8Cc+GV5Rf
        j8NU3vRUE9MBWu4=; b=zRu65FuPBkZuHU1NXnv4uvnDOD7VcXFAncyB0pYoD65Y
        7tFkWbsjKXPiUPgnABoTbfhLFk2AJsuWKCJrdG7W4gr1K7bEv9t+Essbz4/O0ZRp
        7SjgchpP+yMrzWMV9MwnFaJI7cayCcuTA+rh8kJ3F0iLU2ym28Ade1D2fuOgVYo=
Received: (qmail 2395082 invoked from network); 28 May 2021 16:01:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 16:01:48 +0200
X-UD-Smtp-Session: l3s3148p1@kSccUWTDQuEgAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 16:01:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: core: Make debug message even more debuggish
Message-ID: <YLD3y3rtMI4jAxxu@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210528091351.70699-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WWhmVuFii2NK0j4u"
Content-Disposition: inline
In-Reply-To: <20210528091351.70699-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WWhmVuFii2NK0j4u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 12:13:50PM +0300, Andy Shevchenko wrote:
> One may notice that dev_printk(KERN_DEBUG ...) is *not* an equivalent
> to dev_dbg(). It will be printed whenever loglevel is high enough.
> And currently it will be the only message in the I=C2=B2C core in some
> configurations that got printed under above conditions.
>=20
> Moving to dev_dbg() will hide it in the configurations where Dynamic Debug
> is enabled and hence align with all other debug messages in the I=C2=B2C =
core..
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--WWhmVuFii2NK0j4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCw98sACgkQFA3kzBSg
KbamaA//eNoMbrQMeNh/xy5vPj5eREfsvtuucQ48SVbDdFIT9SE4ZOj55FDiPFoy
6d/hDukvfJG7WtsBXuueZjdhc/90UFCRU/Yt4e1No+30MHn+j5cak/AyHkB2Id6E
M5cP2m6ZwmH2CcRqTO5F5JijG03emU5YR5c2zaJaz8+jLeIwkn1hOJmiQgZ7kkzw
FuITDMwDU1QH3LVdsBmcDk1LUdZ613tp1J84Y8+HpcdSw1Fupn0N9I57hB0S0/jf
gky7W4OcJ3ZkWHhCrwLOadGoIMORQEsbxlni/1625v3zpOl+zuvBbisptqV+qFlA
+dV9EzTQhfAbTb9d1PDj9KApnMa/PsiUacr0xMpjCXTGx5zYVkiYGVKV/J1B4QpU
zYb+mhzs5uI8yjm/YfjC2UZ+dccCBGEPkkRAUCrlHuwpcsBPw4MeJ+v26FNw+ieL
ZuYSR/yjG8XjU/M1HCVRx3d2F/RoV+y5LSR2CNYnuAKrq9CCifcO1K16HiEgnAX+
TekHpkLMW/86H0xpKvASX/kFyiVE4uhWIQNfmag9/1NBEHfpQdqrpM9aIfjmtgla
cG75dEYswbpToPSKvPum/eBuKxEP3/cmPAXp852IQ2TaQetevdnD485FglwcxPUa
4U5BVE80F7E/yPq1RdRJNtaUEGOYsOwaUWwAMwQjgrwBac0KKBI=
=x/EN
-----END PGP SIGNATURE-----

--WWhmVuFii2NK0j4u--
