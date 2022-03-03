Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF514CC819
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 22:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbiCCVeB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 16:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbiCCVeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 16:34:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2198F48300
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 13:33:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8292061D48
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 21:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51068C004E1;
        Thu,  3 Mar 2022 21:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646343193;
        bh=AsnyLkVWz/WbkX9L7YpIhoPjjwoxwkgl406FsGxHgn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UhSfv8373qAHE+Y+ynglO2DPDlVf0Vt4Id04it2nbiTWthm68Xn/fMH7urNmTC2Z8
         LU3Zl2VVwJ+Do0Rq9S6dWqcnPn7m7Pg0lt9XCfdD7FM1PucuxnwWz5e427dN19mKNn
         18BdVDesz7pZdG1vsDrPXYN7IBIxtcaj6LNQ0MAQqbeBeJ2kkvxX6kvDd+HdoENSgA
         QXqI0EHPk1lvn8/xL4hm9PnDc8Wc5VKPqbBr7evUMr8lX6ixdAmgN6O5ULW8Dqd5g9
         n2z73oEc3UA5DF69qWSFzhva9xTUnpum5GVGRQC1HbqK/HlCJpaYI3E+fwpBavMKRR
         c1uAd3tDHGc6g==
Date:   Thu, 3 Mar 2022 22:33:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Ian Dannapel <Ian.Dannapel@iris-sensing.com>,
        Oleksij Rempel <linux@rempel-privat.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: i2c-imx.c: Unnecessary delay slowing down i2c communication
Message-ID: <YiE0FnKL4+4RXEaY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ian Dannapel <Ian.Dannapel@iris-sensing.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <D783F898DE87F646B39A5F514F7A514C672EC8@ERDE.irisgmbh.local>
 <D783F898DE87F646B39A5F514F7A514C672F0E@ERDE.irisgmbh.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QCxX4FJK+pK3xDd+"
Content-Disposition: inline
In-Reply-To: <D783F898DE87F646B39A5F514F7A514C672F0E@ERDE.irisgmbh.local>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QCxX4FJK+pK3xDd+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 03:19:00PM +0000, Ian Dannapel wrote:
> Hello I=C2=B2C Driver Maintainers,

Adding the i2c-imx maintainer to CC.

>=20
> please excuse me if I am not following the right steps to report a questi=
on. I did not find consensus between all instructions that I read.
>=20
> We noted that on the IMX i2c driver, at the i2c_imx_start funtion, some s=
leep/delay was introduced without any apparent reason:
> Line 448 at:  https://github.com/Freescale/linux-fslc/commit/3a5ee18d2a32=
bda6b9a1260136f6805848e3839d=20
> Line 528 at:  https://github.com/Freescale/linux-fslc/commit/2b899f34e1db=
9adef8716d07e872a800dfa60790
> Line 200 at:  https://github.com/Freescale/linux-fslc/commit/43309f3b5213=
02bb66c4c9e66704dd3675e4d725
>=20
> This sleep causes a pretty big latency overhead on I=C2=B2C writes and no=
 IMX8MP document states the need of this delay on the controller. NXP Suppo=
rt also informed that this delay might not be needed.
> Some early tests with removing this delay completely showed a great reduc=
tion on the write latency and no problems with the communication.
>=20
> But since we want a stable and fast communication, I ask here again if so=
meone knows the reason or the need for this delay when starting to communic=
ate on the I2C bus.
>=20
> I appreciate any response and if further information is needed, I can gla=
dly report it.
>=20
>=20
> Best regards,
> Ian Dannapel
> ian.dannapel@iris-sensing.com
> =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=
=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=
=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =
=E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2
> iris-GmbH
> infrared & intelligent sensors
> Schnellerstra=C3=9Fe 1-5 | 12439 Berlin
> www.iris-sensing.com
>=20
>=20
>=20
>=20
>=20

--QCxX4FJK+pK3xDd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIhNBIACgkQFA3kzBSg
KbbW4g/+LuNhbh8LK/ZDEbQA1DAoPdNH126YhFvvfjknVojwUb3pU2f05A+2I5JY
l+yBNTDrheziLr2EyLF2aTbBn7rsgEtj8J4e+mo7d905JFPwJQcWV0uHM/Da+/ry
h8uWbhvgDl+TBbPr5fUYsqHx2x6Ka2n+e8hFjp6B09KGhqaiWrsLFBxp+f/wakN4
fDJqHrkkUsm6sWH9oRPXL79Gy8DG5HCL0rpVpCI9yNLFsFYZKKljglrho71fpaNz
UomjAv0nfsE0+Tr/m4ozsNTwH0gqG+Y3bDpLUtP6ne93o/qivzSGG7Pciqno/Q32
+W3w+64gkwyWdRqob1ANgRecZlDii/g/Gjx+bIjZvvcUs3MFDDkiv1wj7kuHEr1O
DS865aT9HNhF9q4AL2lufT6uv0OA6zrgTMJRn+FWFrYWI4+qEsYaQbm5/RY4QyNm
0T6hAfnabPIgyr8vVvoMkWIrVHW0Gz+kMfQ8NxPZ6iulKbiLJNdjeGGg8bDIU5dP
iHymylyu1cImDmSyZOdRfgPEM9VwHrpFgzFxEviZAv4ewa/SQueT7LANQZmhgvcF
iS1T+acdEGtHctZ+ow7Mdd2xfM5MHc2HQZqqzHpSWgfEHN13Q/jCAmvrRvHG6sZY
VP91IHgDlsrjCITWCrtwD8YToyzItZs78EDUt2FSfC0INPyBwqQ=
=/wnE
-----END PGP SIGNATURE-----

--QCxX4FJK+pK3xDd+--
