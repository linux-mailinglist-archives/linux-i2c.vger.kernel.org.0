Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEDA6E22DC
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 14:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjDNMGc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 08:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjDNMGb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 08:06:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD41AD04;
        Fri, 14 Apr 2023 05:06:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49D896474A;
        Fri, 14 Apr 2023 12:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C73CC433EF;
        Fri, 14 Apr 2023 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681473973;
        bh=aBs+AS6+f17UAltPdz6po0f/ewoyDusvX93dOe4ixs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RDzS0C+UzIF8DgtBKzFu+KXNXT9SsCwx/lYuiM4Rk4IN7c3KL9rJfHXn7C0tHeUjH
         1xwil1Cnc1ckEbmovywwlISt05XZLSLZot7oZJEF4yAN2y7PoM1ki1YkISG1lhvJRj
         jWs+rnCI2aDGfySGL7KPSiwVMBzQAqjrjYCB02ZNr1FUKr8lyTlYMYer8safXbFK1l
         6tswb4Q5p6LRo2AD+RlW7VjKB5f8lkZiBxiQ4ihmkUO0YQBmGkde7oTmPkVNyjli+N
         Lg36Ch6h6UJQg0Lzj3myHnbkh/KtHLXOX/7w7/2UtvZDhw0dUg3xzK8tZ9n/3LITWc
         2YnHlmMzALdXA==
Date:   Fri, 14 Apr 2023 13:06:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] i2c: muxes: pca954x: Add regulator support
Message-ID: <59e0bd39-c510-4340-8781-feac1b6b4604@sirena.org.uk>
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
 <20230414110137.401356-4-patrick.rudolph@9elements.com>
 <84a81f6a-4a35-4b30-8a5a-6cb0eba37594@sirena.org.uk>
 <CALNFmy0RwiyLAAd_vOYxY+yhRn7cnP6Xw=okH17OQ75_vQ3BcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhmouV5ZG4HOBVX6"
Content-Disposition: inline
In-Reply-To: <CALNFmy0RwiyLAAd_vOYxY+yhRn7cnP6Xw=okH17OQ75_vQ3BcA@mail.gmail.com>
X-Cookie: One Bell System - it works.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zhmouV5ZG4HOBVX6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 02:01:09PM +0200, Patrick Rudolph wrote:

> It was using the normal regulator_get() in the last revision, but
> Sergey requested to make it optional.
> Please advise me what to do here? Who is right?

As I said regulator_get_optional() is strictly for the case where the
supply may be physically absent and shouldn not be used in any other
situation.  Using the wrong variant will break error handling.

>=20
> Regards,
> Patrick
>=20
> On Fri, Apr 14, 2023 at 1:47=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:


Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--zhmouV5ZG4HOBVX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5Qa8ACgkQJNaLcl1U
h9CnTAf/Vfxr7DRparptYBBgAru4eMeWXRRYZtfZ0sh9ogFFhYUJ3mBI8rak60EX
lx2JOdq6oh7YyQkR8QRG4pKOmKw41zD2iOPrkrs/MegC86ET0gm7AaVW/xcFCRFS
BtOxqmQofGbMs1FA2DqK27c5TWbz0BkCvABVkO34UZ5K6PeJiJJiIJsC7hl2+5tm
s5LjC/TE9fxMYiJhL2v3MgWhAu+QcnTHpqonXDxiL6mFTz5tgI47r/4sP01qsUIj
jaeHReoHlyYheR3d9zxHZNVgmmx9K5ipJ9cAFThe7S5WbZeNeW4wm1r0gBf/UuL1
YI1pqpYeoAH+PDl/jaQoTkEPcbh+mw==
=+OOw
-----END PGP SIGNATURE-----

--zhmouV5ZG4HOBVX6--
