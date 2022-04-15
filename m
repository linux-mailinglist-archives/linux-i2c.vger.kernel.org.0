Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB5D5031BD
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352683AbiDOVPJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244735AbiDOVPE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:15:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2071BE92;
        Fri, 15 Apr 2022 14:12:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 85FBB620BE;
        Fri, 15 Apr 2022 21:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270F7C385A5;
        Fri, 15 Apr 2022 21:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650057153;
        bh=S1eI5dmq775LCayHMx3N/pfPBenUwajWdt1s32ub72A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K1VZwuH7MkPb3eAokvmvG8/+fCa6eSxfTr8BBnOGXaCwICqPt8YBNxrkm3ssSXwPi
         GKQVr6OXxjWF2aEYUUk+XDwU2fguct5d7LOF4E74oEyc/P8lxF7qIdrLy4FV5VDQ5e
         VbL6/AYJmLSTib8bYYxzlQfRLhEz+0z6QN5D559XZ7+TEZKbfh/5Ax27hA8dkF7Qko
         4t3KA/uqSMJvCOoSZnc2geB2qK7n25wWoaGmz3Fiy474jtdnMbqsWNcomnEXwOaggc
         QT7g9uKlozIB0Jz1J0mSS6sWMINxMCAWNVZg4ponL+V05da4eo4H5CJ+cwcKiM+QC9
         YrmFs/7YOnS/Q==
Date:   Fri, 15 Apr 2022 23:12:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Jean Delvare <khali@linux-fr.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] i2c: pasemi: Wait for write xfers to finish
Message-ID: <YlnfvJDyluEDfu39@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Jean Delvare <khali@linux-fr.org>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janne Grunau <j@jannau.net>
References: <20220329183817.21656-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h21sbJa9/A5zZIHK"
Content-Disposition: inline
In-Reply-To: <20220329183817.21656-1-povik+lin@cutebit.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--h21sbJa9/A5zZIHK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 08:38:17PM +0200, Martin Povi=C5=A1er wrote:
> Wait for completion of write transfers before returning from the driver.
> At first sight it may seem advantageous to leave write transfers queued
> for the controller to carry out on its own time, but there's a couple of
> issues with it:
>=20
>  * Driver doesn't check for FIFO space.
>=20
>  * The queued writes can complete while the driver is in its I2C read
>    transfer path which means it will get confused by the raising of
>    XEN (the 'transaction ended' signal). This can cause a spurious
>    ENODATA error due to premature reading of the MRXFIFO register.
>=20
> Adding the wait fixes some unreliability issues with the driver. There's
> some efficiency cost to it (especially with pasemi_smb_waitready doing
> its polling), but that will be alleviated once the driver receives
> interrupt support.
>=20
> Fixes: beb58aa39e6e ("i2c: PA Semi SMBus driver")
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Applied to for-current, thanks!


--h21sbJa9/A5zZIHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ37wACgkQFA3kzBSg
KbZQYBAAiTUhdwY7QAuznZSfhNwuVynUucrnWrVKfFiiZWjtxraHqVHG0lN0Mz0I
v56ZVw9aBFtCcK/FaipcGLOm/7JPnIJEovhp7Gjq73BImwBQ/ox/SZ0YQ2uGgt7v
JxGzwpUrInswF6+DL9XpoHBcAEr35BXZ2ZGIb6GbuV/Jalj7BldDCWxHB1O4gsUL
yhDhnj1bmNVG+zzHAHG6nr/ZX8QJk6dm1JvV9W4MlvmRugDRciBLACsNqf4Ffw48
eTdKxGBbDmjPNnYtUplgVV2SZw1uo7lrQLhVHvkcJhE3F9G8InygwWYrmKAMx3ye
TdYI96LNyvTu5C8NQe/+qQCijogwVNm7ZpyXSZ42nciBqdq/1WkiS615cLW5GkVX
x27uKGhldwMUfcr2b4PB8R6rh7OxM9Y/cp3P4+R40fHnrR0y4Ip06BaOhKhn8R6O
kLu/ZuqZ3PhgIelJTE7rnY04FAWcrHHv8PrIClmKgzhWee1WhWmyDfZ2lWJ4UJLs
E/zHma87dnykwAJtUmBIobXle/SZqfUYyrUq0BfGFYlIwQwPxwUVkxrIdS9P9wYg
LG/gy4fD757d3BOQTcYhfzhx/BO7IeCkJEO8GXrHkiUZ92ymy372FUZH+2SHoIyy
HhVFfV6BjTS4A+CAEKVZZ94+S/J1U+kKPUE3R300kMh2FONXNcw=
=47X8
-----END PGP SIGNATURE-----

--h21sbJa9/A5zZIHK--
