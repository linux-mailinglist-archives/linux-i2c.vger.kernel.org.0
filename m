Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F9246274C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 23:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236820AbhK2XC2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 18:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236549AbhK2XBD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 18:01:03 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5624DC201FA7;
        Mon, 29 Nov 2021 11:16:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A2F71CE13D9;
        Mon, 29 Nov 2021 19:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA6EC53FCD;
        Mon, 29 Nov 2021 19:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638213366;
        bh=wIrJH7fD/ii2c8bMaSD6S8JEizqscQz6lVSTyBzI8JU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kx47l5OTKg1vN9r/MTLjkmfBpazKuqqCw1/hRJP0s4/Xhh31ZmPsa/7NYZ2qXzIsu
         E4IhWrDJA8WYEOftKtN6Nxp29XOAbupPGw6abuFcHLauggK1hGsR5w7mUAyPmh5qXP
         Y1i7DJsIdMcOciQvA6pPzfiNwKrYLxafVDvNIj/5YV6sP0kxm+YF9gblUl/czG3KcY
         2zPj8mtWc75nzspLe17V2cSD5fjqsgoE33/sNCp/QHcB3srg/J+z8iV8yPqKGkkzWD
         E8lEJDV4PYMCOY50peAoUdZLe2MJimyg72g96HQNvXG+NY6ZHO6cYxGAH2CPukm1mU
         x2JL3vH2t91nA==
Date:   Mon, 29 Nov 2021 20:16:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] i2c: thunderx: Use pcim_alloc_irq_vectors() to
 allocate IRQ vectors
Message-ID: <YaUm84z9SFnsMrj3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dejin Zheng <zhengdejin5@gmail.com>, helgaas@kernel.org,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
 <20210607153916.1021016-5-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OwiRqPXW8G2p85nK"
Content-Disposition: inline
In-Reply-To: <20210607153916.1021016-5-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OwiRqPXW8G2p85nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 11:39:16PM +0800, Dejin Zheng wrote:
> The pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors().
>=20
> Acked-by: Robert Richter <rric@kernel.org>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--OwiRqPXW8G2p85nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlJvMACgkQFA3kzBSg
KbbUzRAAg4FkJV3NdbfTuOvW90Qq50SYxY3w65NGScNrrk21HxeJ2jWBDKxecXU6
mj9B4z7tU+3WL8PVl9vnuiBebFtT6LpWZSLpLga3OdA5fD73F5BXH0HyVda1Defn
CtnjmWVzc6CVuHYkV5dfhBhYusuaewMDGQDfiWycnMnawT3vAWfePZ7ThjBfx2Ab
eaCEujtgRdM6DjnNrvJxcmBiLCrAgxvlawjLzDKjaP9RWHPUtSrtwBxVjhfJMhsF
BMEiT4nlSwYLuavxAZrfOCWAyI7Dz7zknLgdb9arcDQrmwGvjuc69UEdgNeEzmvB
P6i91j6Pe51nWRnxfRt6y7UPrsZCjwnglrJmhgeCk8I+sVM+aFr7rDM8Pqvz3MS5
qbC5KoP6chJgr5yLaXSOyBgwFhyDoG+pb+7zupOnQShiywtu0fC57qrqMZk66+lD
+LJOyXFZGNp5N0ngUVPHxqUQVBkHYjK3bfCJWHCvbODvR5gwcLpR8FfB7C52QrjB
TbVzWLj/qItlGdPwyf8IpbEHf5zWD3/u90n4q/gh8HRXgQabo72cGBjfqdNbtunA
kpmDoE8XX5JIG2FgPaczXTnteAnEI/H4j6ZwxBVuQTvakQtIX9ek46wamZDyEywF
fQc7gs0FIrJgQ3heVy555h2TXB5tJRTEdsfza8RKepwG9G0zif0=
=Ailw
-----END PGP SIGNATURE-----

--OwiRqPXW8G2p85nK--
