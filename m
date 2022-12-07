Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B50C646254
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 21:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiLGU16 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 15:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiLGU15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 15:27:57 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C1DDE88;
        Wed,  7 Dec 2022 12:27:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 07ADFCE20D0;
        Wed,  7 Dec 2022 20:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A943BC433C1;
        Wed,  7 Dec 2022 20:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670444872;
        bh=n8AI6CRmB7iQr9k8GAZ6LtXhPbPWQyCuZIgAdiFEAs8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JCjDnUUPVVuZv5CZU7tEwQkYVgSj/VT004h792j1YtiVSBN3JBR/lNflmi3IWxR/5
         9FGaR0XWF23wR54BaLxOCKTPUkS+u4VgfTwc6XVUH0Vx97YJIINSqMW0OGH/n9RIIO
         sNohauDMn9awBIbM3OZR9lbcl/11YyABJvCkMOjBLx+K/aGoRjO0rGL7VJg5HqpebX
         6lGzNwFtkFdpjeIHhwO51VwNTKq6pwH5i/bNb4QUFc5w/8+cy+H3Pj85+JuhZMsOwu
         gGAkMI+oDRMbX9tZ+a6XivU2OHH/V73TG4q2P1x7sbXh4U4asvoiJ7PC1y1ZR88tA7
         MOV5iuWOvBPYQ==
Date:   Wed, 7 Dec 2022 21:27:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Zheyu Ma <zheyuma97@gmail.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jean Delvare <khali@linux-fr.org>,
        Bill Brown <bill.e.brown@intel.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Fix an out-of-bounds bug in ismt_access()
Message-ID: <Y5D3RbAjkIjpUlQ3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zheyu Ma <zheyuma97@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jean Delvare <khali@linux-fr.org>,
        Bill Brown <bill.e.brown@intel.com>,
        Wolfram Sang <wolfram@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220729110216.557010-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="23ImC7Wm8wIpgV9B"
Content-Disposition: inline
In-Reply-To: <20220729110216.557010-1-zheyuma97@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--23ImC7Wm8wIpgV9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 07:02:16PM +0800, Zheyu Ma wrote:
> When the driver does not check the data from the user, the variable
> 'data->block[0]' may be very large to cause an out-of-bounds bug.
>=20
> The following log can reveal it:
>=20
> [   33.995542] i2c i2c-1: ioctl, cmd=3D0x720, arg=3D0x7ffcb3dc3a20
> [   33.995978] ismt_smbus 0000:00:05.0: I2C_SMBUS_BLOCK_DATA:  WRITE
> [   33.996475] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   33.996995] BUG: KASAN: out-of-bounds in ismt_access.cold+0x374/0x214b
> [   33.997473] Read of size 18446744073709551615 at addr ffff88810efcfdb1=
 by task ismt_poc/485
> [   33.999450] Call Trace:
> [   34.001849]  memcpy+0x20/0x60
> [   34.002077]  ismt_access.cold+0x374/0x214b
> [   34.003382]  __i2c_smbus_xfer+0x44f/0xfb0
> [   34.004007]  i2c_smbus_xfer+0x10a/0x390
> [   34.004291]  i2cdev_ioctl_smbus+0x2c8/0x710
> [   34.005196]  i2cdev_ioctl+0x5ec/0x74c
>=20
> Fix this bug by checking the size of 'data->block[0]' first.
>=20
> Fixes: 13f35ac14cd0 ("i2c: Adding support for Intel iSMT SMBus 2.0 host c=
ontroller")
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Applied to for-next, thanks!


--23ImC7Wm8wIpgV9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOQ90QACgkQFA3kzBSg
KbYQHhAAhTriCfWWeAzuTZBpOIWIYxDXpuczQ+uNShFxKJg1N5mvDuHM6a3lPv0v
cu2EmgF7W5xdOrsJtrXfrMeEl/Pjy8/YBn3RNi7CXDCvlU0mnib4o0dvSLkSxwEb
aYO97t+jvfIKwq/DTtzjIUD+gswFvfDUTaXc2gMz+y9veIRU2aAtjE8uolepuP5p
LEDbY2hh495Dm/mPBNAgVMgw6CVY+xf/2zmTbfTcoroUfm676qNiwhocE9stxAlK
+kB6UlCvuXCOhhQTuloX5L1dTqdked9zoVccOrrIXArSHN8rPVkrE05JZFK5Di95
kZ2/iGNL1ApeNwoclyAlWzoW2Za9Fbxdd0rKEUXruJXsHgVyYSfnUqYxKXM70P/Z
SEtPVoJFJF+CbHxNG1f4ihWg7fi5vQpjJOE4Ta4Vk1gTtmFU8vIXHbiSXcC9ohdU
leDMqhP9eJGS29jZWanGH4BpMpkCIHoq9aTLbZWba28a2pj/nNfgNiwOrJIisPVH
ilKdYNrTBVz0qDcjYWINcgwIw8lmqnTlxh6TMTbLhTHaM19DdN/Fvo34S+7CyRXQ
mwbaDIimdaadXn1JI91of6jWQjxQFBDiIww02u9w5+ikbYbYbQg/a2S83D8eacSu
peQF4eYl6iaR1xC6W6zKbKpRO2Mi6WbtjpCbw+eenle185FmGmo=
=L5vu
-----END PGP SIGNATURE-----

--23ImC7Wm8wIpgV9B--
