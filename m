Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1D0722353
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbjFEKXM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbjFEKXL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:23:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0481194
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 03:23:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8DC0961274
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 10:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55251C433D2;
        Mon,  5 Jun 2023 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685960590;
        bh=ggh0mPdsJ3q1+098cj78DNUFy50hrUvpIj+176nNsvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b+j+T7xkeNiZeba9bpQaF7sh9spDrvtcEF+Nkptogo88vWxXU+QYu3IzcNSy/ZOl3
         8o0OmlJ9E56v5GD/ZtHu+PQPsfdVUAqR4HIecLV1dOPr65rqoXEcs3dYgM4BucW/fi
         HOpCU9Lbgir2/c22bNrExvfoiPXoa+fX5SIDzXoOXNox4ey1kmcpLtbmxC9o+bINmN
         ecjTc1V0BXEZTofRuklHa5W2dhjo9L/7L1POHTxQg0Kg0+gICDwjGdzcqZeXRVfdKD
         jRcXGRR8/dJ5yuuDrPRi4rxK3vrfbPnFQLXIvgvRTIbggYC9EPn4rPdtBSv0rLpVx/
         cDg2riJCk8bMg==
Date:   Mon, 5 Jun 2023 12:23:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH] i2c: mv64xxx: Fix reading invalid status value in atomic
 mode
Message-ID: <ZH23iq1u5jEtsC8W@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-i2c@vger.kernel.org,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>
References: <20230521121940.27057-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QFPWuvnLgM4hLubS"
Content-Disposition: inline
In-Reply-To: <20230521121940.27057-1-kabel@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QFPWuvnLgM4hLubS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2023 at 02:19:40PM +0200, Marek Beh=C3=BAn wrote:
> There seems to be a bug within the mv64xxx I2C controller, wherein the
> status register may not necessarily contain valid value immediately
> after the IFLG flag is set in the control register.
>=20
> My theory is that the controller:
> - first sets the IFLG in control register
> - then updates the status register
> - then raises an interrupt
>=20
> This may sometime cause weird bugs when in atomic mode, since in this
> mode we do not wait for an interrupt, but instead we poll the control
> register for IFLG and read status register immediately after.
>=20
> I encountered -ENXIO from mv64xxx_i2c_fsm() due to this issue when using
> this driver in atomic mode.
>=20
> Note that I've only seen this issue on Armada 385, I don't know whether
> other SOCs with this controller are also affected. Also note that this
> fix has been in U-Boot for over 4 years [1] without anybody complaining,
> so it should not cause regressions.
>=20
> [1] https://source.denx.de/u-boot/u-boot/-/commit/d50e29662f78
>=20
> Fixes: 544a8d75f3d6 ("i2c: mv64xxx: Add atomic_xfer method to driver")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Applied to for-current, thanks!


--QFPWuvnLgM4hLubS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9t4oACgkQFA3kzBSg
KbZHQRAAkV5d+R39LntV83FC5IrE2gQexWjxl5Ut2w/pCDkRbJ6rCmIYoucHJe3w
00Waa7NQfD5oQhFL1ODv2lopdZgeJ7I2SgPKgG0cQL6yoj9yMoe0XVxEC5ndm6JU
eGfx9zytJD33iiF7mGBwIXAky+hUa9+1OBvdlkVl5OrJ1I0qiTv7tO3asip0MZcs
NICSggbncwbp0ZJercG5e1qeGPRqFBLLis1iiZcJnTnQ/WfxGItz4tPbzxEgzLtV
4aqU+fWUDpuIqp0kQ/6MvIiM1FrENvX2qcLL0L/HYXtelDvlVNlfsVq0N1PdKP+s
obRqrDdbNQ7AJCmyHFTZgmwyRRPyQ5J55w7NCA22AyCwrLFmsqaDoen0uXz/qjJM
N0h+blkuaOrxCFmLBTVSHpSlm/4y6pt1pCnc2NamQIkT0Y+FdGetk5gS4LsjAIOp
wj2LOqdoea2ooAgbvmjMavHWQhDX8tSeAhxgfhb4IG4S4pyfB4DtQ2/SQmxaJi5Z
j0Cu+VndufCO0PW5w8vhsRf+wbd5IsOlFsO1SQqOZ6ErLtz8LWACDCoE6LUJ+IMb
1cNStHUxiLQ6iNwt+k5aCUKJMiFEQMmg4pzdhRM/K9VMdLN1grdFEpRoLBMASsfx
IJwJdsolBj5PN+zmATOw590dPf2LyrnkW0IlWgVPVBqJYUk58Cs=
=yO7o
-----END PGP SIGNATURE-----

--QFPWuvnLgM4hLubS--
