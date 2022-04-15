Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9BA5030A0
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356110AbiDOVgQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356108AbiDOVgP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:36:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FD1C748B;
        Fri, 15 Apr 2022 14:33:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12F38B83021;
        Fri, 15 Apr 2022 21:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C426C385A5;
        Fri, 15 Apr 2022 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650058423;
        bh=dmfD8gJvfQz8+xpzJY079QIq69bv692mUtRVsFose0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VuPlpI79krHgJhXKyBIRRYgKnTSHtUFLZQ714eenLXVKtw8kGDxbUwQclDwhmA/wV
         BNtwhKqP7E95OMz7fTLaYvJQnZ72K87DAPNXeG/JRZEhKYL8ShVk3VlmBb79kNKA15
         X/SRDd6JQzEY7k75+E2J4V7BDY2hxAkFuLWhw2CeSRPGo2/Tl0W58mn5f9KjhtdMWg
         W/7SYttSs9+ISx5qXvquYKxre9rDkUi+GUw3o8kT6uqsXyVxmC0otUCUZA2vQ8+Snc
         KsKJNZGOul0mrgUfmnzajrNiI23Yy/614QQpy8LGKEgisfQCAP1ZrLkaDfA0eDz2Hn
         y8Ss/P53FOoRg==
Date:   Fri, 15 Apr 2022 23:33:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: dev: Force case user pointers in
 compat_i2cdev_ioctl()
Message-ID: <YlnktBB0uT3kmzo0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220411180752.36920-1-andriy.shevchenko@linux.intel.com>
 <20220411180752.36920-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6CxANf8x6srDia+u"
Content-Disposition: inline
In-Reply-To: <20220411180752.36920-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6CxANf8x6srDia+u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 09:07:52PM +0300, Andy Shevchenko wrote:
> Sparse has warned us about wrong address space for user pointers:
>=20
>   i2c-dev.c:561:50: warning: incorrect type in initializer (different add=
ress spaces)
>   i2c-dev.c:561:50:    expected unsigned char [usertype] *buf
>   i2c-dev.c:561:50:    got void [noderef] __user *
>=20
> Force cast the pointer to (__u8 *) that is used by I=C2=B2C core code.
>=20
> Note, this is an additional fix to the previously addressed similar issue
> in the I2C_RDWR case in the same function.
>=20
> Fixes: 3265a7e6b41b ("i2c: dev: Add __user annotation")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--6CxANf8x6srDia+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ5LQACgkQFA3kzBSg
KbYNOA//bjCJp6EkFMXNUP17edlc97VgHgbxAEKWstAWfaUZoryKMkHsOttvSZc/
eTP2GxMtlgIlYJCQUqrDhaNKS/yXk3hblT+Xxh5MvU95UyKRI3ieBpwzTGHhXyGS
qnqTZCeq1oLgqDnj5ufQd248Xer+c6zqG+dro+fOTxA4zgsDGyuH/UeTdNV03UAD
4C4ZRciX3kSbgXpS1R1Lki5WXKfnSmMP0m2DXAc4c2DFyT/+mIV3AS+XzfHcfmzl
3LvvobjjLfahBy5rOfMWmhFgCJFb8BA+LUbkSQjWz1QGoIbLHPbpuIRmRu5VQRzI
cFRnfU+wUdb3/m3aVV+QEI5TJu1/esfk5CTSM1bBDae/sssfI7q/EYiC2K1Nd2HI
zahKIEouL7DHh9PsInWCOUKgcvNpc0i+Zj86onkiBzmawN+Y/cZwlUD4m7q8LHoX
OQ4VKsFi7l1ara5TVqbVqVjQKqQTl1nss/pYbUivosNAftL/2XpgeEWt/pirLKLo
aRM4L1mSQqw8bynwtc+nq0RvA3KYUgozNSeT794yOc6mGjaTlRr9ImuqTiRk2Y4w
qbvqfejSKwbiYDZPmW70UlnknT7QW2ICF9Cx5Veli1FPoPICqqpkdElq4+t6Dldr
YNSZZiR4LzY/zUFvP72dg0L/9WIncppcNkP7Z9tJFmmskVGxyaI=
=VHna
-----END PGP SIGNATURE-----

--6CxANf8x6srDia+u--
