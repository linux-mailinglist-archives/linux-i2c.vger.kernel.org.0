Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36215BB9D2
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiIQSHs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIQSHs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:07:48 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B5A2D1D1
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TrXdmARROpbIW6oroxImnZQlUftF
        m/1MW+Ti4qNIvfA=; b=YNRuBxbgALMjnG77t/lY1rMIHlpnmDaYkS42FOaHUwJ1
        Davnav4XpbTdLYrgcCbFa9sKvP5THkqumHoufTbFRbQEuZTo/Ut50PeZJU706s3v
        G5uM6/sTY3iPnvFUsF9Lf1zoRlQ+2j8YPmYp/QVlTfEnZXC9V0rBXSXUS7GWfVU=
Received: (qmail 3854405 invoked from network); 17 Sep 2022 20:07:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:07:38 +0200
X-UD-Smtp-Session: l3s3148p1@3v2DWuPoDNW5aIoe
Date:   Sat, 17 Sep 2022 20:07:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 1/9] i2c-mlxbf.c: Fix frequency calculation
Message-ID: <YyYM6RoxDD+k1kVN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-2-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qSYiDqG8m2LPL1qT"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-2-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qSYiDqG8m2LPL1qT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:35:36PM -0400, Asmaa Mnebhi wrote:
> The i2c-mlxbf.c driver is currently broken because there is a bug
> in the calculation of the frequency. core_f, core_r and core_od
> are components read from hardware registers and are used to
> compute the frequency used to compute different timing parameters.
> The shifting mechanism used to get core_f, core_r and core_od is
> wrong. Use FIELD_GET to mask and shift the bitfields properly.
>=20
> Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueFi=
eld SoC)
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Fails to build:

  CC      drivers/i2c/busses/i2c-mlxbf.o
drivers/i2c/busses/i2c-mlxbf.c:2166:35: error: =E2=80=98mlxbf_calculate_fre=
q_from_tyu=E2=80=99 undeclared here (not in a function); did you mean =E2=
=80=98mlxbf_i2c_calculate_freq_from_tyu=E2=80=99?
 2166 |                 .calculate_freq =3D mlxbf_calculate_freq_from_tyu
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   mlxbf_i2c_calculate_freq_from_tyu
drivers/i2c/busses/i2c-mlxbf.c:2173:35: error: =E2=80=98mlxbf_calculate_fre=
q_from_yu=E2=80=99 undeclared here (not in a function); did you mean =E2=80=
=98mlxbf_i2c_calculate_freq_from_yu=E2=80=99?
 2173 |                 .calculate_freq =3D mlxbf_calculate_freq_from_yu
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   mlxbf_i2c_calculate_freq_from_yu
drivers/i2c/busses/i2c-mlxbf.c:1433:12: error: =E2=80=98mlxbf_i2c_calculate=
_freq_from_yu=E2=80=99 defined but not used [-Werror=3Dunused-function]
 1433 | static u64 mlxbf_i2c_calculate_freq_from_yu(struct mlxbf_i2c_resour=
ce *corepll_res)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/i2c/busses/i2c-mlxbf.c:1403:12: error: =E2=80=98mlxbf_i2c_calculate=
_freq_from_tyu=E2=80=99 defined but not used [-Werror=3Dunused-function]
 1403 | static u64 mlxbf_i2c_calculate_freq_from_tyu(struct mlxbf_i2c_resou=
rce *corepll_res)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


--qSYiDqG8m2LPL1qT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmDOQACgkQFA3kzBSg
KbZmehAAoun+4b6d7KjYHR4r+R0Spq92JW/bTWIBGkNK8voMfz6RmJ+xIKqDMeHY
k7uJOleqO3F0fsVvv8u0hhqq4GcNhrzabXYH3uZQu8rxGHsbbY+aWvO7WqTvYnsU
2eSXc+v8AjTUNoIahKOEgyh82oWCj+RgL2TpR9wDd+IXykrEpvnXxJu75qFihmNT
AnZXEv+xfeRMv4AL5JwSRlaLnWAADydXvYWvqlv8jhejOaaOXWdsVgeXtmMcmbBc
8lbu5tu5gFvUhokMNW7I/rT5BfyzLiCO400DzMShMTVHQ2lG86nVyvB6m1DM7eqr
fwnAjfFhO9eE+5vWaOzZZPOi+tV945vjdbf2YOn5VHhxpP3E4fsBvSslHdyLJy3h
d8iMDnZYjMMTwzdnSgZq5hLFYZcHaM4B9ABFaajbisxFggPyJLVbz1vqs9zpr0Z+
eFQDVxJHGtdcVVJPWcSLOFWvpGX7XFKAOgESbZUNHhKbtbLgZ3B7+21Mgx/FulJi
SuZb3/+2bm/U5/nolaOAq4JOSUpX9SuqqoN/8Iwv1mwGoeg/6q2BRcv4KzrL5q5N
EeJ3iVVcsq0upNcrA+duoLuz4gkoipIJNKKMWJkPTKh7w8bYyyrzwWH2452ehA/P
1rOe6dtehNeoZ/ZMZfHNbzKwSisX2RyEDNwV5pFmASaaJmB5oME=
=AYO3
-----END PGP SIGNATURE-----

--qSYiDqG8m2LPL1qT--
