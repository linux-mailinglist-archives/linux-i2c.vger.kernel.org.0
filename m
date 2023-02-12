Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1199A693A32
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjBLVMH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjBLVMG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:12:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D26113CA
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 13:11:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C04960DDF
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 21:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02478C4339C;
        Sun, 12 Feb 2023 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676236313;
        bh=ULPL2nCCQeoQ2axBiWZc2cd3GmKZKJUSZ0Y+nigvFww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DnS9CX5yLTSWMEO4YzkMFjgALmU3a1spy5dkzdEUKto1k9KtQ8MU3WfUQ7HbNb4Rl
         GI4GEsOci/D+l/GxQ8jQZDqFxgmgk75ZldqULxbO7OrRa/EmwI1Z4tGeuo4zBT3c2Y
         k8XqwWditYdPw63J3/KOiJm8IFHbi1vnguJUOO5YZD2vvJHuwlxCmI/RQj0HDE7j5H
         FaahXkzGvFvNVs5oCYfh/LbHacdHp7jm3yXSIrDTheY+Qi0fhaMUHIJ0GraeUquBOq
         3hADyCilCr7Z3CfoNNk1wtdtq+fgoMucT7QVK4UblotfwDG/wKH0QOjreklq8aEI25
         UygwOHlUASocg==
Date:   Sun, 12 Feb 2023 22:11:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] i2c: i801: make FEATURE_HOST_NOTIFY dependent
 on FEATURE_IRQ
Message-ID: <Y+lWFoY90q2ak03X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
 <2f09691a-c0f5-4aa1-8338-1066c0a6c63d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XSWofV66HlpOLEVS"
Content-Disposition: inline
In-Reply-To: <2f09691a-c0f5-4aa1-8338-1066c0a6c63d@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XSWofV66HlpOLEVS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 07:14:43PM +0100, Heiner Kallweit wrote:
> Host notification uses an interrupt, therefore it makes sense only if
> interrupts are enabled. Make this dependency explicit by removing
> FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--XSWofV66HlpOLEVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpVhYACgkQFA3kzBSg
KbbJwA//RlVRUTQYBKm7xQqmJd3oWV47cZLGpNToSyUbBt49hvy/BSIynqrnvq5K
x6piIyUEK4S3isDxV6Mi6V06HqHtEPX+YcI8h5YL39kFPS3baCWE4QNqpZnhhLIm
8vVag+PwZB8HAZZ45Vf3QnywaV40bombnI7x9CUJyE9ZTrdru7DYQAx7v/IzrDbw
L7uOy4InWv0uIg+gcaQWncxZNAxj6V2/V4/jqm64h3pxZzsFAm0OBd+eLVP5l/dF
CvXsy9LEFQqvZHz1DhzfDKFVPt8zyoM1Amw9YUhKhgRn8kuhKKrY7CvXU+Gg0EIE
PPYDLYOWmHhO1v6YLxAEri3OsFeGtuxkQoBbqfKop3zr/gsM0ni8wGKM/9/HV0c8
HYzle/kTMuB8MJIJOcmHppORYAPt5KU9CyJhvxfoHIXOrxwJkeVpBUgjcVv/fCHO
9SxzQY+cf55j5j0XlgfifWpAfaON50nM0VwTrpTsQqtNhtOlk1nxWE+KcC1OidRR
sM/ClHr0x77OBRrV/0LezJdc9KpA9xHBg0Tlxs6QOP/2OR6lWBN9DQK2Ss7GEr6F
7wh2CRHZqeLsHeod1YuAZPfBvxI8ui48O75qpjqEsRRoxn+vKmr2jjzDM9Mh5V8a
xm55x+COGvzcIrA9Um/OCUKS+/gCu+3RX39/hyjD2gVPbKjU/2E=
=7wH5
-----END PGP SIGNATURE-----

--XSWofV66HlpOLEVS--
