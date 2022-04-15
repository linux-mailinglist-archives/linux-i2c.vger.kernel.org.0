Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481EA503076
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354635AbiDOV2o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356101AbiDOV2M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:28:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4105E887E;
        Fri, 15 Apr 2022 14:23:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A985620F9;
        Fri, 15 Apr 2022 21:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2084C385A5;
        Fri, 15 Apr 2022 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650057834;
        bh=rMZHfPgTxp0w7o330XCGwc7nclovto2ztInozp46tEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oNIhl2Tb/myzHgBJm4+ejY4J4Pz9rQCl0EWdG7YVIw8auxewWqmA6aGfSrHy7ZW1x
         OqSfib2gNFV41K6gCywfgM+DzvsWK2LYAnhyMpAcSI6+elybWBB6wW/La9dxmQ6rdU
         tvIf6BjN9kcrgWf33j28nNu42zdT4WXL25ajY98jv8PK+D19XbvYJ/8V+yFxlTy1bK
         wkuOBUZ/StVaP9FlruhJqR9lL5TAZoWqTAb6of10/+KacvHfIoDz8oPvfD8btKuPGK
         zi2O+76TLOChj6UbxIGGouvnSEtgOWq4p60ERmlm1uuvqFAOqblYof357wWkT4UC2u
         b+dwz8gg88IvQ==
Date:   Fri, 15 Apr 2022 23:23:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: dev: check return value when calling
 dev_set_name()
Message-ID: <YlniZ1OU/4rcAj9l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220411180752.36920-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yqMCW1QLrF/5bNY5"
Content-Disposition: inline
In-Reply-To: <20220411180752.36920-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yqMCW1QLrF/5bNY5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 09:07:51PM +0300, Andy Shevchenko wrote:
> If dev_set_name() fails, the dev_name() is null, check the return
> value of dev_set_name() to avoid the null-ptr-deref.
>=20
> Fixes: 1413ef638aba ("i2c: dev: Fix the race between the release of i2c_d=
ev and cdev")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--yqMCW1QLrF/5bNY5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ4mcACgkQFA3kzBSg
KbatKA//X6NweyIi55S7R6C4yxSthsMsDHv1B/wxJFLvqRZ1kj2zxuAvWTP+UkAV
6GxHZaZuotWP5Q391Tc2jn+j5I50Mtz4XfoxwLt5PC2OLzBIY+vpCPGUc7xkZPqR
CRJC0/tmg7MoNE/3oFeHcxWhn4k/9Rdd8++mI+m3NjpScO0DY+Ye5AkWSgtTWMGh
r8vkcpNPmhMLVhL1v1UwZAHAZlCIWSVEpAoXRpQEnopCco5ZjxNRT38pjGi4PhiJ
aD45TgPYqJrqu17COPftPm70PMHQommgqk7nDKFRbLP4ie9YEb6OtggELbMx2Yb0
s8kq6ApixL8tJF9kwLyr9NH2H3BcdKm95ggxYoPuxdHXLHxfA2vjT4WNU1UAjsZ1
NFi4eAyeffNnpOL4IRSQbgbKwWqJJ1sE3GF9lGmd2ok7wAwMqYJPksDuf0tTP6EU
tzKPBFUqdCaawmh5npKtSGRfDSLPLD8/Hk+a3q9EU38ZZ6dxmpZUNndabH+yFnFS
BgqhfdjiIFar1hlpLuROaTZS7hDes1nVyQ+6XxsM+LY2YEn2E/F/sscBuGR/k39z
33+iXHzVumGpWpGQ9PP//4ssG+bhc1T55gXCW6U/tJ6+ur84xGvx4Wgqwy1bZGIO
dAiAWZ8UWxRSsEtLdTlj/Q7Id3/NpdZ+Dz4A+3KoIAvq+Shqdoo=
=iFAS
-----END PGP SIGNATURE-----

--yqMCW1QLrF/5bNY5--
