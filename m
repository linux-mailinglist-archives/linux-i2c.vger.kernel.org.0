Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB495626B8F
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Nov 2022 21:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbiKLUZh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Nov 2022 15:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiKLUZg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Nov 2022 15:25:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8CE14001;
        Sat, 12 Nov 2022 12:25:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4AE9F604EF;
        Sat, 12 Nov 2022 20:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206D5C433C1;
        Sat, 12 Nov 2022 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668284734;
        bh=7HgMIBK5lenZRAF+PVub2ruILciUpgXIG339ihVq6Vo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QSF+8AA/UP3gPwqFcnKpMSJEoSWGd3aRiavja/B71Gg1puoEs6lEaP4t6kylziuHm
         uqjP6NFYY1c24pAS8IFPPjiDuMZ/U06EoIRxizn/wX/XLPdjoj9cdI8Q/aokubDyWM
         JPiPKiVRgC2YxLIn5KLQCPg7DGBXnb/Zi5QPD/2HU04gx1vED7DUfxpr9ncfFQLsse
         nlvX45m2AWUkWTgMg/Eeplrgl6hxmr5Acu9NeCHo8rlds1hwuJu1mcWrPfta7z0yf3
         MEdM9gjLQ8Zmf177q3pTZLc2A5hJNL4GjuaHwy7jOGVjiDAuGNT8hpJnAdf5FDzMGv
         n2nJCg2favBFg==
Date:   Sat, 12 Nov 2022 21:25:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn
Subject: Re: [PATCH] i2c: imx: use devm_platform_get_and_ioremap_resource()
Message-ID: <Y3ABOwd5Do0oDGMb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn
References: <202211101723428058432@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CwPPD4IS7RKOIdrh"
Content-Disposition: inline
In-Reply-To: <202211101723428058432@zte.com.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CwPPD4IS7RKOIdrh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2022 at 05:23:42PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Applied to for-next, thanks!


--CwPPD4IS7RKOIdrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNwATsACgkQFA3kzBSg
Kbbzsg/+NHAfxvSiQfS8FBLF0Asao4ueaGv6Al6CqNLQqrBJH9Z/fBkftst+Og7G
p6XEDG6vYZQ7PJpm5cnyz6gGxBmSXnVqLr+0JjI1bMBHe7TQE1jNFXMJRhMD/Zg8
rMkrywR45v45qg45yVQRhRh12gSkB6rPnc3nnB+u94dkNbgT+ToPB95MHUUvG+NM
gZT3mwga4qlJWD6F+MS8SIb9sxQYvcprYQdgEmXkufmtWfE8CoyffP+/gdAaZN+l
PBTj1T90Yeo0xwWvVP/Y1o0zvT8S+Gcb39dWyO+4ySuwwAMhKyMEkNm3IBhcGv+K
okD1kJVSQU3glCiPXOSwTwjKmXPFxM/h4LzQX3iR4k0neBmb9FzsKKYa6lzxbqr0
1ggQwdlW0vPdoPpEnEGQP1oaaTLqukjUcX3/T5aD5ub9fmJ4zQEzJqw0HS1FuaRi
+Iq9pFAMzZ074eIew2eSs3HSti6d0MdO1Lae861DAoOp1jtA1CDLtDPJTfSqHppr
LEioolMVW4AcHlV5uLzppy/DyAuRXm5H6MordU2+1sNTumnzsz8YSzlzC+HLDA33
C+rUK2N+sWyCWU+mfnL0eRoHri/xPL7RxUORx/cBpW1lhnqCRKg+mQLx/4AgDMIV
gI6c/k40ItfxWv1txx54IvKXR1cDbjvNw+BZSCeZOWwe+17dXI8=
=aqE8
-----END PGP SIGNATURE-----

--CwPPD4IS7RKOIdrh--
