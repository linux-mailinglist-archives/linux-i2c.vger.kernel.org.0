Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BC752F923
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241553AbiEUGDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238958AbiEUGDK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:03:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260FE1A0AD4;
        Fri, 20 May 2022 23:03:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE20360B67;
        Sat, 21 May 2022 06:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33142C385A9;
        Sat, 21 May 2022 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653112988;
        bh=EokiGj4oo5cfXHMFY6g6UZL0cexAYA6NAPqf10lZg3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U7SBCDI3pPxHpZa6gSvWN729HWAZEQ0jslaI8mYXPYuHujUOWbKWdNsOKvj6DaomJ
         h6BD58SCAhLNlZWg0KqJ+bz9hVoKn6Pu/TE+FdQHiItfs1Nq0DNZSTLw9FhZ6cWSJ4
         58KRwdIjdeqGv4vfp30DplP5O+vtzlrVktoSDr1s8PeH16C9kba862YZUYoJZWjeVc
         gjMmOBv0x+/91UP8ITgUUj2zm7UVGN09mbyDD1HU1AqpvcVoB/REhj7ymcyTfQ+vfG
         oKI3GF2n5ebv0Ercz1gDPYif7vTneI4IBsOxPSBtNJnCOkZjZ1vOSWPzKvFeAC/vt8
         8VPvbzfjjYjxQ==
Date:   Sat, 21 May 2022 08:03:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/10] i2c: npcm: Capitalize the one-line comment
Message-ID: <YoiAmI2wZz2Bkcm1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-11-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZbK8rDGXnQ6VwGHV"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-11-warp5tw@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZbK8rDGXnQ6VwGHV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:42PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Make the one-line comments capital in the driver to get the comment style
> consistent.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Needs to wait until comments to patches 8+9 are addressed.


--ZbK8rDGXnQ6VwGHV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIgJgACgkQFA3kzBSg
KbbzXw//QR+IeaTHDI01/DT8AinuZr2I4HR4/3zK48HStcy+B6/IArWJ5O0A3Xip
WAXWqbJOvZX1JxEJMcWfQiX4plJ2Xy6eXbxXLoVGS61nqPEGTO1qpefTMb483M6I
QWkkIqJUh6RKaU2QJN7hoTjrKVQpn8hF48PmRFm3/V4TsJ4WVUeiXAt/V41DjQgm
Q/147ZD2zfhLL7PQbuRfnuorrUucRTUCQZATVR/4mLDvCOvz8T0MDKfpjUpp07Gd
F4oellcuNv4o1oaPSMbc724BVXoSe/0k6CfCDAuXi3EaVfxr4EqiqvsrUIsnXg19
UephlIYzPVK5rTGNPFG5l4UJp7QfNN4GZo37jBpoGEYz9tBtUZlBOAPAeLdi2sSk
8vePWEiP3798XdnYKdNb0egNy91OkvHmaAMsFrdfQV1mlrPNQLJmZhtHlAVzW6G/
yHYl2E2+eQUjpR5GFw3bVkZsJNdyaTX25yfFvta4MOzr7AA7i0GmaSZoJGHR4j1w
AZQ8fm90+50XP/anG5RV+MVCjMGCJ2j2s64cT8vWoBFH6iPFGVOJWY+B9Ya8xbKc
Bz8R/McJhOpxu6TkmkOtVA6uqLBgknE3g/uk7m5R42mxaZgJHQLa9Vas6RueQjQx
UJAtljTQh0XRBPYMUqO4k57yfBvzVV052fGwrLsNQpzqSxC0bYg=
=PckP
-----END PGP SIGNATURE-----

--ZbK8rDGXnQ6VwGHV--
