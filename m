Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CD85B0D6C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 21:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiIGTr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 15:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiIGTr5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 15:47:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F30A345E;
        Wed,  7 Sep 2022 12:47:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 690F0B81E77;
        Wed,  7 Sep 2022 19:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488E8C433C1;
        Wed,  7 Sep 2022 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662580074;
        bh=2m8bQOz6CPem+JfZFDVne0K71gnYpKvVLgIRrmDybdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gUZXYOCjOlaeDblqkN3vqocij75zRoua+//wm1T5ZzDD0pBG+VKSRqzKNQulS81kz
         gqL9i682Pa3Uf6oh7GxZL6bgI4PVSLMdbrMlrg/qpE8SgqeIbjjgkDhFt+ur7/8l8B
         4tZP1mdDg0bCEfLUoQlxcCp1H82KSgoJGfgjd/Y7jh5xQ/iCaUGeY8t58gddY3T7bD
         Ee3Wm4LNYMxms5czvn+WOl+uaaz6PI/BV++XACIR77ZQP4Sus+ncrCZ28IdQz7/ILq
         uOOu+eGb/UufY8tq9zjvihownF7gkSALd9TDJw4dLyP7CtaU7Uk8Kg7wBQtjkhW9c+
         iZ4ebkEdl+/DQ==
Date:   Wed, 7 Sep 2022 21:47:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Message-ID: <Yxj1ZQjBfdG1u93d@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t4qTkcah3Kmi0e32"
Content-Disposition: inline
In-Reply-To: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t4qTkcah3Kmi0e32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko wrote:
> ACPI core in conjunction with platform driver core provides
> an infrastructure to enumerate ACPI devices. Use it in order
> to remove a lot of boilerplate code.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Josef, do you have resources to test this patch before I apply it?


--t4qTkcah3Kmi0e32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMY9WUACgkQFA3kzBSg
KbZgRA/zB5zY6AwlqRdSxEQrw3ZcMMFggkIbmhIQ9NAJFW4J/gyVxoWQnWsLAIqk
Z9SNO1/3Og+errV48b0/qgkYusdkfvt7JqsBjLpaHmuV1QBJr+BfIuXJgBCjeiyN
WlAYbGSUWNb6gqxl+aoxmgM4waMvE7OA6JelR2G8zkzWxcBg8SpuB6mPHO8v4RrL
TMSKodQzkfjIDGaDbsYRE9OJWZ8pCoJOGTl401Hsi3fZNL61oAb9/6fgUMQuP9hl
nVvNIbRcnXv83vbrZseEswipa9pdiAG45que5OfOVlm6CuWe9d1/7nqYgk4tiCio
gczA5ys+wIPlWsxBTYmmd/poXTiVnqbH9exFPpSZjYke+En/r2vTIhdgEcpFo2eM
wYhDelFVD6u8Gkj3AOQUdFrDph5srO4SG44lgvVljS9pBReMKUmAoU7bIjfArOSf
UPPe7joYFVsiD3BIkQjLMjwphJHl8f/m3odLDwFJRLFpRmJcV3VA4QBVH60T7iTY
p84nmPSW4H3NT9GJ+TF83M2gqP0FeLO+vfQaKWnBqH/DSmsN3nl72ULe5VVg8gGv
kSSCwFBylk5qtX5EbU/LwSMICDC8exYGQFyHGtgbYhypJV1lN4wWwEHV+eDcKxHz
M2G/yVoH3aI8B3KGC7YiXgtTX/CYvFk99ZUuUT5ClfYEWgREcg==
=nSs7
-----END PGP SIGNATURE-----

--t4qTkcah3Kmi0e32--
