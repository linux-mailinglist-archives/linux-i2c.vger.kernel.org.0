Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD24693A31
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjBLVMC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjBLVL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:11:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4862811151
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 13:11:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EB474B80DA6
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 21:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D21C4339C;
        Sun, 12 Feb 2023 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676236305;
        bh=mVf5ge/3ECc+obNjox/3J3SIerw8/Zd9lzEd4dTgqG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EzMcVrpxkYN0Mxh7+8SLMsdCsnUcUxiDOqtmq9U5jIR+TEYx6g2LmdQYA7UAeU/3j
         GP62yysN3t8gwu0xAeSmVXYOfpgL3ESZOEPjPL/Hh8uUO21cW10R/b9M1ljbkpXILs
         u+xZ79+/8M0sLZbPJYGbeggQdmVYKUvDdW7ag2rxtA4iRX4IWY+w3FfdDMZRmGOye4
         /S/upM1x6Wwhx8lT1cygVzN4wq7nugmTWHQ/0kgmwdMV6oQVdieT20YG0KNFgprF8Q
         d5Fmz8OKMK/ps27+KROZkDcKtSyZoVnadFGHpru8c91SjbEE+WhuoZyWIAOMA3O+cT
         Eq5AiaCthjjxg==
Date:   Sun, 12 Feb 2023 22:11:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] i2c: i801: improve interrupt handler
Message-ID: <Y+lWDqE3zqDFbnwf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
 <dbca2f66-c3ab-428d-74b1-70c472664bc9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xt3GL1XONmbd2J1V"
Content-Disposition: inline
In-Reply-To: <dbca2f66-c3ab-428d-74b1-70c472664bc9@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xt3GL1XONmbd2J1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 07:13:44PM +0100, Heiner Kallweit wrote:
> Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
> and an error flag is set, then don't trust the result and skip calling
> i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
> in the main interrupt handler, this allows to simplify the code a
> little.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--Xt3GL1XONmbd2J1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpVg4ACgkQFA3kzBSg
KbbbNA//cv+NMK38XzQxmu3fmi5xdv/r/eFr2T2VZKcLIYOKmUzAZM3FoXSoosbW
HpNJwTvJ923L+Oshkx4FcwHgGblGUGk6vIn6VKTjhT5+dZnj94WStQupeUo3dFZ5
VfEMmY/FO72fV9FavJa93yv+7CiuPnlq7MyQZ97aMiLn+ZsMDsFGD/q0JrZSKbkt
q/o+1LEqP30mWMD1iCGDKHQT53cT29dsSdvcEhrAnJ1BEZD1iC9maSfAtq0EFQMt
z+dTTSXWlMIOY63BfhY7mHdf0HQQAFrxlim/rk2SWuVkLoKI66NR41+e3jypK9hc
lCvjSr8YhDKPkrFgez3s1rvbf2S+Vt8yZKDeDX9NIntwibhcITEtlVExw9LCa+8w
0u/AcEd1hkjkXYMsVRJq2306IYlYmxg3ybm9ZqWB7g70HuqDfLKNLdr/LL9t7wxK
DLluAswbTpbYahbD5DakVmo0T7QHsyE6RqL5zBBY8/kw0MUkZg6opUFuBJHCzJxY
eVNtb3VjrA0BpNwksyrcB0Ru7evbrZ++X9FDUclArM+JaPrW7WXWg50agWO+VM9y
4kr2q2ID1l7xKEvM2Ild+jZAZHKZjXUY1SESJ34RDGHQ9HEqs/nVgexfbqppQk7s
T1WiXg9YEL4AP7NG6nUeICnIarfxYLXID56JWxRBmNmabAe598k=
=0YB/
-----END PGP SIGNATURE-----

--Xt3GL1XONmbd2J1V--
