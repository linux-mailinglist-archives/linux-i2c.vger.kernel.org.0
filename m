Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E651462588
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 23:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhK2Wkw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 17:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234053AbhK2WkW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 17:40:22 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCA1C061191;
        Mon, 29 Nov 2021 11:20:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 65F50CE13D7;
        Mon, 29 Nov 2021 19:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3847C53FC7;
        Mon, 29 Nov 2021 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638213623;
        bh=g/nsYskIq0J2gIpANu+wdPav06i49Mv0L127LqeWDic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZrHcQYuIz2+z6eGi7PKmEwwhGdcpFmkHNkAtnlOxfYSQqQIiZXQV3n/Zxexl1Sne
         LGEaInfaa0NcDRMmyel5OApl5FeUuMg9RenyiQ515L9vJ4pat2aNNkBeZYmcQZJWH9
         BjOzWz3sACWFtEqYz88K1XcKZ7nWgsn+P8gttjAylwKBkTPLbLuRTwtEIhZXsqAamJ
         a23yF2v3+M+z8O4cz2fK0T+/Gpr2DUKiRtx+PGgh5LmqNYhfVKcmYHIDX4KnUw7zMn
         rOUo06+MlC1ypTvTriX/NCB48pFT0uKtFFkOQ3RAWEMOKMOnvTN4YTafK5mDkONbeN
         TEQ9TUa3ZJJ2w==
Date:   Mon, 29 Nov 2021 20:20:20 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/2] i2c: aspeed: Late ack Tx done irqs and fix
 unhandled Tx done with NAK
Message-ID: <YaUn9HO4STM+LmAD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210616031046.2317-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hSONgx73KSpSsJcS"
Content-Disposition: inline
In-Reply-To: <20210616031046.2317-1-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hSONgx73KSpSsJcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 10:10:44AM +0700, Quan Nguyen wrote:
> This series consists of two patches to fix the below issues observed
> when testing with slave mode:
>   + Unhandled Tx done with NAK
>   + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
>   read request".
>=20

aspeed maintainers, are you happy with this series now?

> v2:
>   + Split these patches to separate series [Joel]
>   + Added the Fixes lines [Joel]
>   + Fixed multiline comment [Joel]
>   + Refactor irq clearing code [Joel, Guenter]
>   + Revised commit message [Joel, Quan]
>=20
> v1:
>   + These patches are first introduced in
>   https://lkml.org/lkml/2021/5/19/205
>=20
> Quan Nguyen (2):
>   i2c: aspeed: Fix unhandled Tx done with NAK
>   i2c: aspeed: Acknowledge Tx done with and without ACK irq late
>=20
>  drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> --=20
> 2.28.0
>=20

--hSONgx73KSpSsJcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlJ/QACgkQFA3kzBSg
KbZoxg/+Me1R4XCxqO4t3nohVs8D4zoBBn+b2tQCtqhHNlmbD8hVLPiWu3vfwu3f
xLDMgOHONd6/rxrw5N2bN8t1oX0AXz2yhxMeVYKgO3jm3AIFuf6bQiqNgBEw009r
V0NgFmKmN7VkkA3AX5tZKb67P9MSMoVTmWPteZtSzvbphyZr74U8Gv4XpaX1X6ep
QuQXO3LGvHEJ+WDF5T38eXR1lXZZFTraGqkPmmslFiNOX00XCw5w3zv0PKg8oO4a
7HRqAxvFiWOw+MD29hkSop+Pjt8G8heq+ZUyIFuBJ6VKLWgCtuaBVnR9B4KlSo1U
r96yEHx7zrGx8BMMjp/39Ds3oJzkjQR/LzVMy/DAwb8FO0YtELsMJkg1n18r/BFt
a1ezWd28jFfuVJVTtE5CKZBgPT0wSq4738L236sENmfC0Lo5Zjd3p8miJCnZnlXz
ePc0fL6PjdJCTNZIlM21mBNvNUWiSW+zsF2+ASJDIwFUVbEaBdvt0k4fSW5GoSX0
ribRkt2str4gFtyg+s+19mnb8UHZlQnpQunHqpXiaO93iPGqATZFKpwhCG77qJO3
ifsYMJ+Cui4uPv9xZcTqRJmeqP9ElqYzCz6YVq0EDcLaKaBYfESu0pu1NKTsohB6
JNJlXes7kqTsu0l4dxspbwNwAGiUe8pk+Vfirn6kM41SUNxKaEE=
=MdjE
-----END PGP SIGNATURE-----

--hSONgx73KSpSsJcS--
