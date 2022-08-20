Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B35BF59ABB7
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 08:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiHTGWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 02:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiHTGWj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 02:22:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBB29AFAC
        for <linux-i2c@vger.kernel.org>; Fri, 19 Aug 2022 23:22:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 02A24B81F18
        for <linux-i2c@vger.kernel.org>; Sat, 20 Aug 2022 06:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7A7C433D6;
        Sat, 20 Aug 2022 06:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660976555;
        bh=1DwHVgvxf+u+H10tm3jo06swxdTIt6r5JADU34LNPaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dLujTLP20QKvuMVUN9MPAH1PlTVbYYf7sSgTQ/CTGJ0Qsw8I132OodJ5tO4cP2utF
         cdsv6BY1thL/feEWLENhVWEo3JUh7vOFiWUIS0o+r4gTWt/3+LgeQWVtBgBsJikwys
         PHrl6bdEwvQf9Xaf/7kJmCPqtGDMKyUbh9eVrfAz87c1xL39OxuMZ2GHMkBVM9k+2d
         O7nC4ttv4oWraFX5w2X4wUGOWuZXRNr1fULdkvoQHtFw+sGsBUBE75ehsxzQz5P2Wc
         BOHDyBIeBXthzsw0ybpCZJVyTRX8oRqfw9ZPnWB218V9YqtRfI8kSozIQPs9vVY9Z7
         1t0TLJ5dIW0wg==
Date:   Sat, 20 Aug 2022 08:22:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH] Revert "i2c: scmi: Replace open coded
 device_get_match_data()"
Message-ID: <YwB9p+q6rllB9KFF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Josef Johansson <josef@oderland.se>
References: <20220818203113.1745-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TvvHuSoloqMdkg5x"
Content-Disposition: inline
In-Reply-To: <20220818203113.1745-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TvvHuSoloqMdkg5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 10:31:13PM +0200, Wolfram Sang wrote:
> This reverts commit 9ae551ded5ba55f96a83cd0811f7ef8c2f329d0c. We got a
> regression report, so ensure this machine boots again. We will come back
> with a better version hopefully.
>=20
> Link: https://lore.kernel.org/r/4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oder=
land.se
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--TvvHuSoloqMdkg5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMAfaMACgkQFA3kzBSg
KbYu7g/9FSaPLWzZ4MVbq9X1rWlUwsxR8RJd0yHGhMD6obg08ekEHBF7eh3FAlCs
qgY/GXaT5MGbuPqQihwHrpi7AWEGvZxh7lUNJes1ema4GKkJ8kC5jq3hO9meyTf9
8+78I7xi6mG+uc4w+n2494fZRIu0Dwp584I0Vwr04vCyJhBi4VW1UwgmIZsxmOva
j1X27ArShtjXviDXReAM5nd+9f82Wq3h99jpFu40sFMMh96Wq4MND81Z9+U5oeFr
ISn2N/4o/z7hR8PHmfTKpfxD6jbIk2+x6Vre/xtSDmfkttzD0/2aAlRCRXJfKzH1
GWkNPo474kx6nYj9USWOabAYIjPh/3njNVxv0qu9bzelO6Hft4PHdcACdLhrNVOq
+MJwRADvIwOFoAtIKrugD1hqqcJcAjf5bg7jD96Jocg56gGG7O935sOGbJxfDaR2
lLX1zkEv82slXl+SlUBJDiaWGoPpR+c7XDyuBmgT9l6aiYN5DPxi1PxiczGWNGMQ
g2k7tFf/B763sNQmYpM4kTRot2lmjfdap+VhPQgUG3D75lLuYcFOmtYoaL4o/CUy
mg3NmUwqi9XrVjl0WrseRCWgqyVFypG5AFaBCv/g5rOQA+tLHjFkr3yB2yiM5sZN
guUD9qIp9dONGLh3eW1siz6/+TUToUTQYdXOxnzeRQND/IJzPcA=
=1yps
-----END PGP SIGNATURE-----

--TvvHuSoloqMdkg5x--
