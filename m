Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6473D57F683
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 20:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiGXSjW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 14:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiGXSjV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 14:39:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC6D11831;
        Sun, 24 Jul 2022 11:39:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D28486112A;
        Sun, 24 Jul 2022 18:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65416C3411E;
        Sun, 24 Jul 2022 18:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658687960;
        bh=KECUKZ+1jNDwCbdkpFzcMfyAbzgF2RjJzcCe4yd4Exo=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=sYumfMbvONGxGJ6eRqumgxOoLJO6r2MAAQlYlUaVmVfxzUsZvZvU+6qNjHI1u/jo9
         EWMhcbKGW2cFYqWDVu9zLZkuyW4yjMF1G00xtLWEPqEVu/h1acaenlI01R/jaZYRGm
         D6dMqLkum6/+6R4FVh6MNkebt2uSBQ2XOxlX1yDB2wyvB6J2DI+bwlObrAx+r6WU3F
         +IR4fW+OmO2fjnAdKgD6TunHZ+LD0xtIDSbGfwlHibuRSF7ealNwMyRkNPi0sRgMuy
         //GHqxgKxxjx4IYRBId2DLWbl7OSbKb535MnTtVaja9L8cezrFYilPIh+LPvyzWv6J
         TuTk2lVrKVi+g==
Date:   Sun, 24 Jul 2022 20:39:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <Yt2R00PlnBfFAnCw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
 <YtzSzKmakEWe1usg@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I4L52DYYukU+Xfe+"
Content-Disposition: inline
In-Reply-To: <YtzSzKmakEWe1usg@shikoro>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I4L52DYYukU+Xfe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 07:04:12AM +0200, Wolfram Sang wrote:
>=20
> > -	return num;
> > +	return ret;
>=20
> Not quite. Kdoc describes the retval in i2c_transfer.

Reconsidered and applied to for-next, thanks!

> I agree this needs better documentation in i2c.h, I will fix it.

I'll still do this :)


--I4L52DYYukU+Xfe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLdkdMACgkQFA3kzBSg
KbYh/Q//T/TttTio2xMVq5C3Bnkcm81bwP+rXmfR+VgIEzC3fwiPwxn1nh+lbVdA
Yxd3ffaOuK11TCZtqHczsYp4tcJgGtJAuDfeBwrWqRc5spN6WxIZFnId/CQkl6j3
x2S2Ii2L24uTQl+0Uy3GYlPTt1Zrmnl3GlfPHzHRme29xoCZchxnUgp9DaEcNq73
rtWFPEkFQ0c3lr0bsV+JZs5Qya24U79Pxc2du7/u+qWZUhZKkogEaHtncAVQ8n++
KPoQ2UO9pmLKrcSzFHvtx+GbQMxlp1s4ljTPAYN3X5hVRFHmbV7MzRn4M+LLE8+B
Rn/Bon/QgoQkre2/AGb3SKmwRyCAZiyWr5ZiJvBPT6hHjNk1Dathdmj1DGb/67AY
Zvy7Qj5UPME8jByrHcYGk4qK9fbqSQPyj7097u2wchbbQe8bX8HJOGCA6scCTaX3
PDWUlwcz1B+qwYQJVc0FWb9opew40R1xDBRSQ7MWD4eglskmDJUgCKa96jkvRKdv
rw+OklxYFJEk0Y9Pq/4ukb8L05aZf/0h7hfX3mCQUZO7O04k15jgojAat2GNehl0
jwnF0lnQ6fjb8A182swFr6kO5T6KoFj8Nt2i+RKJJfQonivQ9MBkLcWH3SEbR4pJ
pZ1QqhR39dqzpuQn1MfdM63PLHjfl4jmWvmqh0uAoVN4SejMlck=
=Vudh
-----END PGP SIGNATURE-----

--I4L52DYYukU+Xfe+--
