Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BBA5BB2D4
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiIPTcO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiIPTcM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:32:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B42B0B18;
        Fri, 16 Sep 2022 12:32:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8025DB82921;
        Fri, 16 Sep 2022 19:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D74C433C1;
        Fri, 16 Sep 2022 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663356728;
        bh=//xoDX9kOXmkp982WJui+uOT9DeSmbvciR+NGZPx6EU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bK4Vpr7ZMnK1HS7eGhhmG9DvDRAwdhutjJR60Pa+S5R85TA3EA/BA7vIqp84S1vVZ
         t0BcT/iSnmUpJrvRNvxR1axHAsuZJQVkYvPVE2sEMKOaiATvv9ua5bXkP9TdNvJ8VW
         NE3R3ast7xLOagKx1tDNTrGLeYmxAtIs3DPZvjZn9elABCqhv3nqbna/HJjlUcSepc
         7qANe6kK/vWBlH4G4NYM+6yOCAFpD+1wlhBdgAujge58I3HvRQO9Kuz2GGBPx9wx0T
         Qagk8veUoGrQRPvTleHMgzr4IJWWeUzWfbHvdTsx38yZ91oioZ7hEDMTvwN8uD0xJP
         /P86z9AmTEIqw==
Date:   Fri, 16 Sep 2022 20:31:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kees Cook <keescook@chromium.org>, Peter Rosin <peda@axentia.se>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YyTPLkOfPlgkLaxq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Kees Cook <keescook@chromium.org>, Peter Rosin <peda@axentia.se>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YyMM8iVSHJ4ammsg@kili>
 <202209160046.016AC8B4@keescook>
 <YyQxuHi2iQIvj0Lj@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LH3CZH+3vzn5Op2u"
Content-Disposition: inline
In-Reply-To: <YyQxuHi2iQIvj0Lj@kadam>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LH3CZH+3vzn5Op2u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The new variable makes it more readable, but beyond that, do you see any
> > reason not to just directly compose the calls?
> >=20
>=20
> You could do that too.
>=20
> You pointed this out in your other email but the one thing that people
> have to be careful of when assigning struct_size() is that the
> "mux_size" variable has to be size_t.
>=20
> The math in submit_create() from drivers/gpu/drm/msm/msm_gem_submit.c
> is so terribly unreadable.  It works but it's so ugly.  Unfortunately,
> I'm the person who wrote it.

I can't parse from that if the patch in question is okay or needs a
respin? Could you kindly enlighten me?


--LH3CZH+3vzn5Op2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMkzy0ACgkQFA3kzBSg
Kbaztw/+N9X2QXwxeCMfK355UzAvNqP0fyKw/53SNJxPqJzaWafNStUjc6C3ADP2
sKfB/I2gjBm+sAso9p1XcIDlV8Cxbdxyt5h+xCWQt1Ybm6XpUIVlapux0gNOX2ER
Y2pc5De4V89fuIY6ZjQMvjwAm4mEsRH25zcXhpS0lVhX2JGeaGDGXc9Iv34L0CW3
qDJOUlF78YJcIoTew5EGmz4WmExudT7Z3RwNKFQOmTuHK4Swmux6rwI18ekAbHHf
s7Cvlc3EpxMYYFPR4ReFQg8wnsHrVbyQ6TJP8flGZ1XL59/N9xwhvPTPcQIjWVI3
O2s7xef3USuyT0m2o+S5VsN4whdLVn3TkvxI9tLz9hEFoBOs7zPP3C5iTy8g9ds5
dUpk+J4tC+cagZahifx4+SM8fBvGxlo6BxU+qjhZUihxE8d8kQcrp0/xQCL+lT2x
2eEjPSuYuBLvUqJata/ccnw70VTPSgqyPiV0DeboK3trFVM+ZBOiQXcvAT4UGoyE
egT1IozpmnunXR8bgLS1al8Bqbz0AzbGg1xB9G0fqg/F/jpixMZh6BVP8qkHTEgK
gs8ysFdupJjLS3fIVDuY/2Jyta1QuBrULQpznjeUFld8QjA8Gy9k2XYBu5UgrcOT
eVm8alL5rMthCrqpP138W6Mes+shwVZG6Nj7LCHx7n8ALrzdHyQ=
=fKpo
-----END PGP SIGNATURE-----

--LH3CZH+3vzn5Op2u--
