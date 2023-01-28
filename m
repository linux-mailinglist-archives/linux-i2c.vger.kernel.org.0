Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B23467FA52
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 20:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjA1TCa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 14:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjA1TC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 14:02:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737C06E9F;
        Sat, 28 Jan 2023 11:02:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B748360C3D;
        Sat, 28 Jan 2023 19:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE882C433EF;
        Sat, 28 Jan 2023 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674932547;
        bh=M1BaetA5Guc7ua4DBwESir/jN+iI2rmX8dXmh51UAyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JXdBvyWgokN/BDMWoiVKMz8nXL9dd3896rVFQk8QiTqPes1u4BvrulHtGfSVcMAJK
         QCwbrlianAJXQIINbUwyN9QoLbbSe/pUXI8bra5ZSSTWBjaO1CoZjV+e81wmlDS6Pz
         yUqh9YGmiq5goBFHh+wDtlzDovZsSHmoSWseUgr8csL43zeithPDIJEFtGCzbDFxzK
         jrYEh+CBUdh3p9VNjY0SYv0U4BWdK2AnJPlrKsUr8nf7xXHbQR7JYBbrGEWDhFR1sa
         1QBDY9Y49LcvRRwfuMf9WsWGO9+W3UmgNfrxbKyl0i/HrLRi2xr5AqH91eQpYFu0cL
         5xswMDqX6Rssg==
Date:   Sat, 28 Jan 2023 20:02:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <Y9VxQCu95HfGnWNe@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230118134940.240102-1-brgl@bgdev.pl>
 <Y9DpbChLZfDONHPz@ninjato>
 <Y9GpL9RBNM8H2ZSL@shikoro>
 <CAMRc=McHowkYJBckM1eikcrBUoXXZN+OkozA-dNXZc1Zgd+Kfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x1qiOeeMy5CsaL0/"
Content-Disposition: inline
In-Reply-To: <CAMRc=McHowkYJBckM1eikcrBUoXXZN+OkozA-dNXZc1Zgd+Kfw@mail.gmail.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URI_DOTEDU autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x1qiOeeMy5CsaL0/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

> > https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html
> >
> > There are still drivers using i2c_del_adapter()+kfree(), so removing the
> > completion could cause use-after-free there, or?
> >
>=20
> Ugh, what a mess... I was mostly focused on the character device side
> of it but now I realized the true extent of the problem.

Still, thanks for trying. Really!

> It's all because the adapter struct really should be allocated by
> i2c_add_adapter() and bus drivers should only really provide some
> structure containing the adapter description for the subsystem the
> lifetime of which would not affect the adapter itself. This way the
> adapter (embedding struct device) would be freed by device type's
> .release() like we do over in the GPIO subsystem. Instead the adapter
> struct is allocated by drivers at .probe() meaning it will get dropped
> at .remove().

Or, like SPI does, use controller_alloc() which initializes the parts
needed by the core, returns to the driver which needs to setup the
private data, and finally calls controller_register().

> I don't have a good solution. I've been thinking about it for an hour
> and every solution requires sweeping changes across the entire
> subsystem. Or else we'd introduce a parallel solution that would do
> the right thing and wait in perpetuity until all drivers convert -
> like with i2e probe_new() which is after all much simpler.

Thank you for spending time on another solution. "Perpetuity" is a good
word to put it :/

> Anyway, that's all I've got. We probably need to drop this change and
> live with what we have now.

I am curious to see if this finding will make it into your FOSDEM talk.
Looking already forward to it!

Happy hacking,

   Wolfram


--x1qiOeeMy5CsaL0/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPVcUAACgkQFA3kzBSg
KbZU8A/9GmtzVWAI+1WUZeFcVea9Ubfv2FWwMDqCv44tB1CT9rKSC+v3MJd7R47P
/KrvdSUlpUXY88QZocmeEpQK9eBHOgNYIoI/0/MRkhlF6GVSFHfYexPrfnpjilJ6
2lbWwPHbgXUfbl4HT2ZfxUrWwju0xhFuKY95BJGSuRUpVcva7JjLCgSYt/tTZtS9
nn1j4S8p457fdkXWC80QROUOCYUwRNfgXj0ZZtpU9YSEbfzASKWqNFj+Ictf9Lji
s4MFlHSCI6RIQtKBMjrw28JCUWKFjsNAbhf7NOUdawPoVSW9PVUuEcriIqmx1qzg
Gj1+ZCFW1vOPaes41eBn3GcirWfGynlO7oSCXCOdXTH5lE7kX58YEICOteJKXUBC
i2zE6CbNk8pWkMqkywnwCDnmXjDVhM6zXW0TiI6nk43k4d9vSnnKfcuNEgaCNa8h
o8oPlTK5x+NpCmZZgidW0njnNIWqhWEaNvqQrbkUgx3GE4uf08vDFQAhwWLQDavJ
HnT0WRxddO2Pwp7y54ypFdgCgPQ/FvjnP47VZTqFCltOHrkLaf20nycIdON7guMP
kMYjIvzNm4R/dFLquAErIruPezWP0Kot4ZRwycogZH00IhFWEKzrAkoHARZAsfXg
LJ40GfV4ocNCyf+8RMQaz2ljv1hh23XUFLJUNXr6JWdwZ5Cf4do=
=BOjt
-----END PGP SIGNATURE-----

--x1qiOeeMy5CsaL0/--
