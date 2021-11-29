Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B7F4613D8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 12:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbhK2La5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 06:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242283AbhK2L24 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 06:28:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337F9C061A11;
        Mon, 29 Nov 2021 02:41:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 042E1B80D6D;
        Mon, 29 Nov 2021 10:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FE8C004E1;
        Mon, 29 Nov 2021 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638182478;
        bh=JHRw4mk+Tgg8Qfg/eQA/BR6Po4r2aNWaCwy0qmK7TfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MKMCboA7Vi7fz6z04dlQ+hC+iDwK5xG/eNaJIz97UAsHi6LjZfwJ+qBmccWqoaLIi
         yKMEzVS66v67P9UaynXu5SH1K5sROHWQN5OvfZTX9ulUQo5mVu8yKqJ7YToc2ix9Bd
         cCko54HD/eMuaHAgc04I3Uq7jVnP0wPJq3rSI48VEdbgKfRR6IerZ5gSYKDE/zVlq9
         dG0YSX+arXAdJ0UxHWGROBvhKLAzRuPGtsIZq0aJ283My+DBg6H84swsKJVILmpzvh
         ppbij6/6o0la4JaVI76UHBLhbyResbi47ePAKg0hHF3J/4U5zjVFKoc7C6jmqfTjGl
         5/0DWZndOzelg==
Date:   Mon, 29 Nov 2021 11:41:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org
Subject: Re: [PATCH 3/3] i2c: at91: add advanced digital filtering support
 for SAMA5D4
Message-ID: <YaSuSya1mLicpC8p@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org
References: <20210727111554.1338832-1-codrin.ciubotariu@microchip.com>
 <20210727111554.1338832-4-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SJ5cq32ChkZmrdae"
Content-Disposition: inline
In-Reply-To: <20210727111554.1338832-4-codrin.ciubotariu@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SJ5cq32ChkZmrdae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 02:15:54PM +0300, Codrin Ciubotariu wrote:
> I2C/TWI IP variant found in SAMA5D4 supports advanced digital filtering,
> even though, at the time of this patch, it is not present in Datasheet.

Is it meanwhile? If not, can you add a comment, please?


--SJ5cq32ChkZmrdae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkrksACgkQFA3kzBSg
KbZTcRAAjkWICn+LDyJPK8qFgDlth6ph7MGQz8gWTjbTXq3SvJWrf0/t8kGcQuDZ
gucFBrEbgHH41o8/+mdzv744WeyenVdaGRSBImqeLJe5aM+EMKYI/Hdna2AB/ZHx
ZJ1McCnqmMj+WQhLyDmUleFCQBzsOQYsAvjd51s8kyGkOtSci4UGu1grnTBa9oRi
R3TziszRfG9VLX5sNpnqUHQm2E+71rvykb8XeUL3yJCP8vMQetuGDeJEpCEiklvL
RK2CKMkZrwCelovJBRVWWd8NRXjCScrAQdqvVqItIvagAWb3IBGJq0+Z+1omdXLk
HqZ0leanM99r5E3rXgEV6lyEWCrkGKkW7bcleg5MCEKO0cINcHIAKVr1PKi3PTE1
gP6tWQngfHUOzOYNWR3RaYVRPZNxJzsjUfAjJOboaVQFzgYUNFidUAamjGacrzut
7RKGZVEmIVkkxumrYHRq6mAuRLaDAzUHxXzQXxHu37WIhLQobtrT1unLafyaSCJF
FfYcAKOzFCGSMtg9CwiXbPPTszZSRCh8r5EhNdveeB2rdgAj0cSXzL7bBZba68ju
x+8l5GSH0UcIUQ7UD3wVNtcI8MqteovLcGLhHLfXh08ZtBBLQ+SC4UZ/0EYLSROT
XlAA0Ji55t96mtGcbOeV0jGA13ufxow+4darJl87GyPoo3pTct8=
=rH09
-----END PGP SIGNATURE-----

--SJ5cq32ChkZmrdae--
