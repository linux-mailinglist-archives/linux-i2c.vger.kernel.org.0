Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20524EF874
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Apr 2022 18:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242816AbiDAQ4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Apr 2022 12:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349452AbiDAQvZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Apr 2022 12:51:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC778255AB
        for <linux-i2c@vger.kernel.org>; Fri,  1 Apr 2022 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=W7hfSuRyn1E7HghHdP7BGcwK4daD
        hFOObLkZu3lm/os=; b=B868RuvQjaf2XCQpap4C9lppkrSXYxoUmvTaE1bASwM3
        nWHUV0ezLuQI+y2/50xOPs5Usu7OQ1R5z+LvDxH1r0lPa9IecJ+vYPRor3u9WVYK
        fkRp6JWsZ18CEMTZDWbjemTKVDPpGWcWtkBUHwiHpkCA0B7juv7EtFYwMTcc/u4=
Received: (qmail 805831 invoked from network); 1 Apr 2022 18:38:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 18:38:56 +0200
X-UD-Smtp-Session: l3s3148p1@/6EwaprbfKYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 18:38:56 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <YkcqoIMF2uw4FSZh@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
 <YkQ6XRITOFZ7hLXV@shikoro>
 <20220331160207.GA27757@lxhi-065>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XyHwHtEw0BUCuLMS"
Content-Disposition: inline
In-Reply-To: <20220331160207.GA27757@lxhi-065>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XyHwHtEw0BUCuLMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eugeniu,

> BTW, thanks to Bhuvanesh, we've got another patch [*] which tries
> to combine the best of both worlds:
>=20
> * DMA support in the v1/v2 patches from Andrew/Bhuvanesh
> * Simplicity of your proposal in https://lore.kernel.org/lkml/Yg6ls0zyTDe=
7LQbK@kunai/

This was nice to see. But where does it come from? I don't see it on
this list and I also couldn't find it in the regular BSP?

> Unfortunately, this patch has a dependency to the rcar_i2c_is_pio()
> in https://github.com/renesas-rcar/linux-bsp/commit/55d2d2fb8b0=20
> (which should be resolvable by extracting the function).

This patch is obsolete since March 2019. It has been properly fixed with
94e290b0e9a6 ("i2c: rcar: wait for data empty before starting DMA"). I
am still trying to feed this information back.

> Do you think we are on the right track with this new approach or do
> you feel the implementation is still overly complicated?

The approach is much better but there are still things I don't like. The
use of 'goto next_txn' is bad. I hope it could be done better with
refactoring the code, so DMA will be tried at one place (with two
conditions then). Not sure yet, I am still working on refactoring the
one-byte transfer which is broken with my patch. What we surely can use
=66rom this patch is the -EPROTO handling because I have given up on
converting the max read block size first. We can still remove it from
this driver if that gets implemented somewhen.

> +			if (!rcar_i2c_is_pio(priv)) {
> +				/*
> +				 * Still try to use DMA to receive the rest of
> +				 * data
> +				 */
> +				rcar_i2c_dma(priv);
> +				goto next_txn;
> +			} else {
> +				recv_len_init =3D false;
> +			}

So, I'd like to get rid of this block with refactoring.

>  	u32 func =3D I2C_FUNC_I2C | I2C_FUNC_SLAVE |
> -		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> +		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
> +		   I2C_FUNC_SMBUS_READ_BLOCK_DATA;

Still not using the new macro to include PROC_CALL, but that is easy to
change.

All the best,

   Wolfram


--XyHwHtEw0BUCuLMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHKqAACgkQFA3kzBSg
KbZ3YhAAlZ6U47cxbA5tJaMYHwA65HCGZILIZvzgd46iOtDMuXPsOQ3z+kWfOZMm
4RF2iA7j1i8bNskg13P8Y+DD89mSx/gzVoZ2Ju8W5MeeOPwKlQ6VRgLACAwcZP3W
2T07+7uXso35K5pOLGm7iLge6JN+UxLbE1V2x8wrb9A8zqJMhYNdEnTs7HvvQJFk
FK0v4L+SJaU/yVI9OrjQkITXnZNxtdaNxXtIdtfB+yUGlZSK58N/Ul0bwXk1hqiT
dQg4QEA4N/WEgw6sXc9NU90y1Dqt/ZJFKjJo7fC3lyPFVp3bedFzB44FvHGpxvGs
5dPLyo2lXl1xt7Rh5RCY0DRTsYJoO4joEqNDoPbyOUuAC8G2er84u0Y4TJrrOu7+
v7VlWz0+5lPbpAzGoxzhs5V9WQCIh8LZ+usHiPqR+wSpxBbgp/zglyIhYxqwQJ6d
MLLtvvsqyo9Z02qsUA9yrY40YpogzJFP3MBpB/j6uWhiKGho0H2KmsKO39dcXXMC
5zHhID9JIfRgdWnD2JwSyn/nHqywgfoGofYctvaHwZYEjP/XiK2gNo+wvD3Ji5+R
mfzPaiyiBJ7YBoXW3/Z/czE5yDjmW/1qgrCJdrFhbYQAclne5AYiyH80K1jjPEG0
v7mRS+SsJ7RxekDzHGO8IzefXHYi4o+ddyzEDRSw7VZrqRih5Ps=
=5/T5
-----END PGP SIGNATURE-----

--XyHwHtEw0BUCuLMS--
