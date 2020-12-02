Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E63F2CC234
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 17:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbgLBQZv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 11:25:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:47772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387405AbgLBQZv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 11:25:51 -0500
Date:   Wed, 2 Dec 2020 17:25:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606926310;
        bh=1hzRxcWQ9hD6KVL+wSyejHhyWS0uJ+2OM+wgLLbARKg=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+l7x34OD9S6l+86LdxjMtNMKbNoTNcpSKF6RrqcM3Fs6bpGNvDG5Zlvpz2giG4PU
         TJrHru2s3Grg3wxracEvc/Pgp0MJsSEUg4kQGsj1s8Lp4zNkpSEq3HvIQbP8GeRgaF
         oto1Gtf2N9CGUozuOM+2dpcL1XyKONH2v8UKadkE=
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
Subject: Re: [PATCH v1] i2c: ismt: Adding support for
 I2C_SMBUS_BLOCK_PROC_CALL
Message-ID: <20201202162507.GI13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
References: <20201116153245.24083-1-andriy.shevchenko@linux.intel.com>
 <20201202154501.GB13425@kunai>
 <20201202162322.GJ4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline
In-Reply-To: <20201202162322.GJ4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It's against documentation, please return it back as a must by documentation [1].

Sure. Never heard of or never seen that tag before. Thanks for the heads
up!


--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Hv98ACgkQFA3kzBSg
KbadPg/9F7EUW25NrX78VT+lUAwUonxpNtlSWGcm4WA0Xw99uCDHUMZu0X7Vcteh
7+4V8D6gO9qFsva9sOjiy1LJ+50Mm1E4IM53Szz6HluYdUVc2tAYaxjgGgJBAoyt
OoMLG6+FG7dDrFiGYQZHY1EXuR3wjcT1OdAqvbyl76G5rea4IVXfsEcBAl4nD7FX
XaaFTbfdroaxyjjIk6SEh4+oIo2+r6aYEmFapLGoQh5HE9RFpwjg51oAGLQZoM2Q
18wERbbjQDfAw5XW26OsB0mF8ZfqNk7tdBOsWZB7KQ25+sMvrHLTptB4zivuagpl
CiymIkGRSID+WkBCU317w65cighcU1YCLGDnnKv8xu4l5ib+m0sB5RZ13oNPFCaf
8iz/+uuP1aujr8YogTYOXqSLtDXaYRwoJsC3raJxG2y3D8g3K8FNUW/45nyzKhky
kG69c/LvYaQSupoPxtiLv/Js4qmPuM/6y5iKpmt14Kt0ToV2AkMyfo6ulm0nC2Wt
rcClX4Y3Mg60WIsnMptZi+soT9sKQMnlgu85aLzHk/4+74XN4pxlGX64eka1kzYU
B5ESgDL2QZkddWxlnv6LsUm3kctg8HvY0UUAU7PG9+/XX0k049RvzBt7bHtJsE9H
5BVPdqbIKCNtj7tiWM+ldnfZLdMfvnZ4Jz+4APKV4lCeji4SRmI=
=Su8H
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--
