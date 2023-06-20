Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77533736B23
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 13:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbjFTLjV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 07:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjFTLjU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 07:39:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50207A1;
        Tue, 20 Jun 2023 04:39:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA9B96101B;
        Tue, 20 Jun 2023 11:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77360C433C8;
        Tue, 20 Jun 2023 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687261158;
        bh=9UVOE8Cz1DsWBg3eucEFy8b5dI8qWQk4N+oAeWZJiHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CGQaYXeFqY0uyDWCnOxfZEn/Vem4fSxgIjT6iEQGEB76XzdHtm8SMgPyVTiGclCrd
         OJHgBi07UogJDHYETygVTciE0ZwhTbtvq4KSV6GfYIZ6AhMFiZCIfN5yVEQODaY2Q+
         rfZXJNYZWzyN1EYtORWyvXeXyUhM74sOlvryMpVaqJ0HT0kYi0JPCaJ6jScplEi0yT
         KMfTOlOEs2Mim76X3Ozkk4ws8rIvmFRqe0aBWe0Dzhbjq7vrOE3FiZpZe0oWMRCOYs
         aLMTE8EVwFnp1oB+rqVBW6ZtEFuCfMGfbpAL+wsWj0ZPHUcVNsbrEAGmBQMXUTu4RS
         RryAMhDp8allw==
Date:   Tue, 20 Jun 2023 12:39:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "Ye, Xiang" <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: Re: [PATCH v8 6/6] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <7b9192d1-6b63-4ab7-a41d-1a122fa69480@sirena.org.uk>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-7-xiang.ye@intel.com>
 <ZF2+C0CqaBff2hl+@finisterre.sirena.org.uk>
 <DM6PR11MB4316E9530309ACCEF55AD0D18D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6vhFdTOxhYEajwKy"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316E9530309ACCEF55AD0D18D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Cookie: Chocolate chip.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6vhFdTOxhYEajwKy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 06:47:11AM +0000, Wu, Wentong wrote:

> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Intel La Jolla Cove Adapter USB-SPI driver

> > Please make the entire comment a C++ one so things look more intentiona=
l.

> I see lots of drivers are commenting like current one.=20
> But sorry, you mean the entire comment start with /* and end with */ ? Th=
anks

Other way around, use // for all the lines in this comment block please.

--6vhFdTOxhYEajwKy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSRj9wACgkQJNaLcl1U
h9C0kwf+P5WR5e8HGsaUTr3bxMcjGPrWXvavqs+q5qEvE0tyVRo+SAqub9c74fyW
vScdJYyrO4Ah8v0IsOIkyW+UDIWK/wgZ125S3aVKkgtzVXpI0gTCqC9xGXR8GVEZ
4+5o293GihaPW4kGy/8zqzqszu9A3y2lvjEaARFgMwN+pC5mFXPIJ+wDTtftcyNG
Mi12BYb5wgTlrtPLO0/qY+agcsbOI3puA48GhNxOSme8EWpAlOxlJxdNdivdVIQW
mDRZ6h15xm06jTDEtOFFqk4bqZU8Ethw0SQLPzo/FcZw9CBXaK7qXDURXMvCo80G
G27kz7xr6LmWBJhAxuFL3sE6NrHEbg==
=4nOU
-----END PGP SIGNATURE-----

--6vhFdTOxhYEajwKy--
