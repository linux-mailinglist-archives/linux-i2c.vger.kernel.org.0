Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E88B4D6997
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiCKUmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCKUmS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:42:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0621DEA80;
        Fri, 11 Mar 2022 12:41:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3225C61F93;
        Fri, 11 Mar 2022 20:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F3C340E9;
        Fri, 11 Mar 2022 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647031273;
        bh=aGSTDFr1mOItCF+EmjnB91tTtXHn0Q7LT7/Ixb11H2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKsFwG+HUCZvLry2lkVlILAnr5mgqG5HHg9XCW5mhYAoPLOiyvIFJFt+Uko+6et9g
         hhmt+NL9TxWqlz8wH3SuA08eqTBtq4nUM+PWXUHUEsBomTDQcFxxWobF/VZUb9nSox
         adxoXHGpSkjI3rWRjLasIjcQXTxTVGHU7B5vdWePP6a/2tADXEP8dQQL5zv2JxDoH+
         rQjvr44DVhCoes5DRmxEA5kDoFmqB7yeUDJ9vQPPw6hmhWHNjbIDleNsGMrhJVth5u
         aVvIXlohR1DZ8mKEaqwl3zj2+ZFIiqhaM2UI5q7EoJt3Q6gukYt5IQqB/wnsOws7pX
         61LHcty2l23LQ==
Date:   Fri, 11 Mar 2022 21:41:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-i2c@vger.kernel.org, George Cherian <gcherian@marvell.com>,
        Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust XLP9XX I2C DRIVER after removing the
 devicetree binding
Message-ID: <Yiuz5TxSyswQdsQT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-i2c@vger.kernel.org,
        George Cherian <gcherian@marvell.com>,
        Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220308075414.30026-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UwRiXhRX0iQq/HC9"
Content-Disposition: inline
In-Reply-To: <20220308075414.30026-1-lukas.bulwahn@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UwRiXhRX0iQq/HC9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 08:54:14AM +0100, Lukas Bulwahn wrote:
> Commit 0e5f897708e8 ("dt-bindings: Remove Netlogic bindings") removes the
> devicetree binding i2c-xlp9xx.txt, but misses to adjust the reference in
> MAINTAINERS.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains about=
 a
> broken reference.
>=20
> Remove the file reference to i2c-xlp9xx.txt in XLP9XX I2C DRIVER.
>=20
> As commit ef99066c7ded ("i2c: Remove Netlogic XLP variant") explains, the
> i2c-xlp9xx driver is still used by the Cavium ThunderX2 platform. So, keep
> the XLP9XX I2C DRIVER section in MAINTAINERS with its reference to
> drivers/i2c/busses/i2c-xlp9xx.c.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to for-next, thanks!


--UwRiXhRX0iQq/HC9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrs+UACgkQFA3kzBSg
KbZi8A//RjL/eTRYzIALhHrqaJnbt51Bakzv5M/VospJWtSQnxTd+kT9bD5Pr4aP
OvyEJUlMXdAeDQupbcfwkfGjoyDTy4vbA89VOJ2/izXOzbOTAqTIQ5yC05GrcGfO
qnKfCWfr7waUlk7Db3K3ItfppxUbj2sTSoYEdRSgsGILSzR6uGIANnyets/uutzw
65scror+tqBYPIAwiyCz/CPeSGPofmP7wgCWZvXuZw6DYl/1oLBDKFsjeHsPSueO
o+ev0tN7asEMe8Ftyn2murBFHdxsHrqfali60O3PHXQ2b7eRqYWd+o9Niyw4I6W3
ywTu83argfoXrGbODx5W38ClqWjUDkP6wA1Oa9Q423OadzExO+lKuxy0C07GUpPp
7HFCEjfc1JxjMDGWmWzrpP3lNMKtsNzEVD6/UxvP8FV7jS4WA606+XmkYZWJ/8Hu
fiky9EFCASRgUUr/Q1qEw0o665+1Y9jCuW9QUX5TwogyzUdsBr821GdN5ncuOX6L
vOzACtZDyaoS489ZVyPl67VELQEDUFQQQcNCwya9hdyGYVe5L9lsOuW8QjwPfWIN
9NuZNas1MZE4fgCHS/zLQZI7r8BiKBItQL6IWptHmaUZE1J1s0WVyR8VwqR/IE8l
JmNkwmI3nFFLuFIhaliIEc6Ll8lO2FqOdGX+piOM6ucb4VjpI74=
=/sth
-----END PGP SIGNATURE-----

--UwRiXhRX0iQq/HC9--
