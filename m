Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD275EE606
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 21:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiI1TwN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 15:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiI1TwM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 15:52:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846455B046;
        Wed, 28 Sep 2022 12:52:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1B930B821DA;
        Wed, 28 Sep 2022 19:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2354CC433D6;
        Wed, 28 Sep 2022 19:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664394728;
        bh=+OL0HwkPt60vRVtBHGWFCjrgOWI9WW012wo1ahfHcsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ve4GuaGKgVyYIiDVmqu/n02Q7MouLynC0bMVG+cFQKh6kZ9kk57WBgGv6uw2zWZKY
         +6YPKDs7Zl2K56CaBD0yJ6elE1xzT/ZyQU63U6yXdGPm1yEGJufPhRejLEWoDQDU08
         OFTE+7PNHeydA5vCAz2QIBHiz5McycHCr5xN9Fx31sjbK4oU80y4Etj3cwrjETlN6q
         3O+yIgxrSVxf7oJunP+nrruJYCJ0e71saPN1GoH58IAHIm78lPx8IeclEXfNDOVWTg
         pEh+mQ/8+y9nW21whw0Iw3mWw4yfyxaj2jaCpqnBy16Ob1grn0wVMOUjYL8TPaOmGO
         44mPpgNGNkKfA==
Date:   Wed, 28 Sep 2022 21:52:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v3] i2c: hisi: Add support to get clock frequency
 from clock property
Message-ID: <YzSl5Dm15ZDCxf15@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926091503.199474-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s/3WXlL7qU/MTWH0"
Content-Disposition: inline
In-Reply-To: <20220926091503.199474-1-chenweilong@huawei.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s/3WXlL7qU/MTWH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 05:15:03PM +0800, Weilong Chen wrote:
> Support the driver to obtain clock information by clk_rate or
> clock property. Find clock first, if not, fall back to clk_rate.

This commit message describes what the patch does. But it misses the
explanation why this needs to be done. Could you add this information,
please? Patch itself looks also good to me.

>=20
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> Acked-by: Yicong Yang <yangyicong@hisilicon.com>

--s/3WXlL7qU/MTWH0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM0peEACgkQFA3kzBSg
KbZ+ORAAnNRdXp01dfBdAQgs8TNVhrNpXV2utaY+dGiGonIjruQi354t6hLr8276
3myO5OIrHChb57/8BJeCUYA95RC/wOwGTOZ3/LnV8fTF2XrFJfdN0/Lr/Y3/taid
koOYouyhzHZs6PT7+zTyzpMkwSvChKgDoDqiZdqBmUgcH6XtXJlGteimwsOf7r3K
Yj8tcea5WaDSNjDaGNXCuWK/BwMNdwQL1A5jEcQIYrPEmRW8Kf2oc8n7ZPiecs6i
DCo/Y6WrSYy1mTqZ99UNtxLpCBVzN4LIiVYE9Dqv2eGv9PoWj298BQYNezR0i74h
7FD6Mlky18nGdBfdfYTo9eNuW1tWFWcwV4f/q3hFi7dUHDu/Mam72qTrnr28/60X
6zvSimfadD38nglNSyeo3jpyhg4DRAUshkY2pMUPVriTsjM7xDyAknWZByawlU2k
x2sfWx11BxXECME+Lm2kgqy6TAA54FfkeKVrDJbxg+g2jhkvvZ8XmwY4ogr7L2pP
NbQ5ESig5ive6ipddcegPhpt3BX1+HikmV6ApHgyfgJ0s8wqcLEw7r8lkEM4zHxY
dYpVc1vz0eupfxEwxD4blT4TXljifpDwxTVWnURi//W436JPkWW7RAFdsRT81Ape
yj3F4m+TadrMQ9mGtfBXO9EV0TScWLXJxXbvYzvvyDTuBNU1EJM=
=ljii
-----END PGP SIGNATURE-----

--s/3WXlL7qU/MTWH0--
