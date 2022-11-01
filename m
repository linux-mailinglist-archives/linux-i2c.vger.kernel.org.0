Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3FA614B5B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiKANJk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKANJj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:09:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9665F19C02;
        Tue,  1 Nov 2022 06:09:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46FF4B81BD2;
        Tue,  1 Nov 2022 13:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C83FC433D6;
        Tue,  1 Nov 2022 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667308176;
        bh=WSufmy9yVEDlZ5qbeQU4D1okCj9Nr92AV/WW56C6udc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PASCSiEJHM++/+xAG66nSY5pokQStirVMO2ZuO6x2LH0sLyVpuLorIfb0wx29mPFy
         w2hbTiPoWnqaMB5AHdMO4WSXa/d8x0sy7hhcmwZxjlkCcABr/kSw+4Y+r20HvtMBOL
         grEAWqq2V7GpgaGSO0IAo1VFQxI6qICRJj6dGq48VpQX+Kr+kIVZ9xbkome0SSN5bx
         tHTJzG5k2hn00w//Wpmn18nd1E0OOaFx+L0fkptbEEghQ9Ruc3BhoUWjheVpCy9c0E
         jIMfdzZf8PNu7kUqzES1fPQFDqhQYmOGyQZi1u1r/BdfdBNQqroQA7t/YzTuS/VHX/
         BGxlWGmSOW2BQ==
Date:   Tue, 1 Nov 2022 14:09:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>
Cc:     linux-iio@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
Message-ID: <Y2EajA8DU4WXLSfE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>, linux-iio@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
 <aeac9f372ffe0013757e261229e6e23f76f2d8f9.1667151588.git.ang.iglesiasg@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M69caHwk2wYuVsmJ"
Content-Disposition: inline
In-Reply-To: <aeac9f372ffe0013757e261229e6e23f76f2d8f9.1667151588.git.ang.iglesiasg@gmail.com>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M69caHwk2wYuVsmJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2022 at 06:52:18PM +0100, Angel Iglesias wrote:
> Introduces new helper function to aid in .probe_new() refactors. In order
> to use existing i2c_get_device_id() on the probe callback, the device
> match table needs to be accessible in that function, which would require
> bigger refactors in some drivers using the deprecated .probe callback.
>=20
> This issue was discussed in more detail in the IIO mailing list.
>=20
> Link: https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koeni=
g@pengutronix.de/
> Suggested-by: Nuno S=C3=A1 <noname.nuno@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>

Looks good to me!


--M69caHwk2wYuVsmJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhGogACgkQFA3kzBSg
KbY3tg//fGMtP+NadBILucb+yhhywXppgoDc6rkziK8K0CL9gvUom+sHDNa0x7eQ
E7Ep7evCaFpr7oxtcG3nZEbCIS5OKff5x01SjNUANOOU/hoeSG1b9nXvsMhR/OEc
6xEDCUedXd5DOlqt+OLa1s1q/yaE49KNKkPLq65n3iD8v3JQECnwc90m5D40Gbss
O/8ZKoaWzSgP/WGcb8Xuf+0rp3lhXJgFPUXvzv/iWhXTuMsjeuyD+u3oIx1k6nkV
tYqt40Y/s/0ooswMZqz0fcb6DeTyWMfcPXZ6aE55Mn31wit32+0H9E899vT+Kdkx
BVJ1n30palDw1uKPX66p2NhBua56GGrqR67RaRpA4S+uxXZkZl5G7rF1uobWIcgs
khvcpiLpL1bGBLI4BA33CtdWtU2/sRtP6vjebwOi0YTeX9E09YLaY8xtEX9PERZJ
8qKil7+nwSe2lQ6bOfRfOwcOf0PAH4fIY7I0mhQwuJxn/z7emH9RaqzAFL4TRh5j
VfT/m5WQl5cjLi62cvKqK8jnEoEPsuJ3JoKtRi/im8AWsLif8Jo8XmrhwnT7v9uR
iH343EKEeeOG1OP6Vk6kNAPz09HAz2UMQ6Dd9I5cme6/sEV9Ls/gyhKlJ5a9g4og
vVljeG2+ifhlHQl7o5sLNz9nr/IvhBphBFrn9xY1sfxIbuzncvw=
=DRDF
-----END PGP SIGNATURE-----

--M69caHwk2wYuVsmJ--
