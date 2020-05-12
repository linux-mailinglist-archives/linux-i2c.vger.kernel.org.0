Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF921CF29D
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 12:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729474AbgELKfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 06:35:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729436AbgELKfY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 06:35:24 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7495B206DD;
        Tue, 12 May 2020 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589279724;
        bh=bYlpjeOLM+eNZLJAMy5eB40kb1P7roU6QXc1usu4kpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uYyEZIPSoM+wFG+6EsFPrKDvITIhQZWivPuAW2dFUxjSj6NZctZbX++oeOG5vxbDF
         A3NS8jWdsMAIxcVN/vSiZMW61bAeZD0i+lsUFCi3KwWoVPu6f9FPW2pT/rhfHQHRJw
         gkrJcwZyv1Mjoe2dQHoCRr9VlCXdltZ+tU6cQE/U=
Date:   Tue, 12 May 2020 12:35:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i2c: pxa: ensure timeout messages are unique
Message-ID: <20200512103521.GD1393@ninjato>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
 <E1jYFh7-0007KG-I9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline
In-Reply-To: <E1jYFh7-0007KG-I9@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 10:10:37PM +0100, Russell King wrote:
> Ensure that the various timeout messages can identify where in the code
> they were produced from to aid debugging.
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-next, thanks!


--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66e+kACgkQFA3kzBSg
KbYV3g/+NP8BqUXOMq91byuobUIzpfhX7p7uwH09uAhH+Ks+BMBs5iloTxtAZq40
ii+dtfqcFYEQpFRQrrdyHot79n51GaG/TFZKVFmsLOQOJySapS537o3whUIU/9jp
7xO3Qu+brGrHTD5AdpCR7bNBWuSKAOs2+N1P6jJdFvXHcBcBmsmKXtIasyCPpqy2
vZSiue6ExoiCoY7DWJ5bvZojQbHOQoPCl90LXs1Ye8RaGpJJLbIPZfnCD2OVEEsU
vm9lH7P1MJAtSGBVyx/1X8DIVprc7zL8kOoAT7g+WQMzL5ar8OJQQsA1HTzoKTK/
/UhdQlmKvFBoYijQPlVInvsAVXWWCoQLdcOdjs4ctge1vMxs9U30Xog2w/wphOzT
R5h3hB7Jmed772/hxawOhXCZlDb9ijUZql2s2Pb/mtyhyacLnY21+76Gissl1oTy
MhGcqe4oDjLsMl6wZIOppRCQyFr2vz83BV3kZxcAeKViTkUVOsUSuzjqG4w9NoLI
F5s5JVZJnVU/f+hF20YYsoasF9iUrLlVnfLFvVrs3OIY0IpmkPbxPTDnKHJnCQr4
BdKGHjK9gcxdRW9RW4/49AYBrOnY0Mf6UIlh6vMjy2hNN61bAaHhLMxlO3kLLZZF
3LeiWbcKJuc6mWfF8qh3GqLIh54N+OxrX/dGBIcCCzVCEvEHhkE=
=arvk
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
