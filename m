Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B57390945
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 20:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhEYSzE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 14:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:43926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230388AbhEYSzD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 14:55:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC84C61249;
        Tue, 25 May 2021 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621968813;
        bh=Vo99kUxBCLhUsq21AlO6qIr3MZcklMd0c23VpmegcA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hhf613AJxgVBTJQjDAdMJmFd3rJwuv4Ii8BoiJF1kCVg0h8SNI0SiVKdO5EBEwlvN
         fs6u+TAbUCkXNrBX+o1pu0wxWadTSyE9YytR94bCy2Fn8Jg1yEBQR39aua6+dzPSTR
         xXZ/RdDav8uTSRr3XzDJx/vqYLCkDYSqdkAGhh3xePqK+dP7UkaV1NtRQIohltS/M7
         jmPv9Ay0tKzc8PcjIRfnQ3bxETCRUjz/fWRZiy3WkwnKMjx7+Y+lwBcnMqrBZmJ6qs
         Nm7+zCyqeFWoUiFnHHrW+QOQRxmYGJbMB3rF+NePez0TTpQ4Xj01Sl/eg9I8ABBl85
         OfZ142TpiQenQ==
Date:   Tue, 25 May 2021 20:53:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, mpe@ellerman.id.au, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Message-ID: <YK1HqE+3ILtGXZ7E@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, mpe@ellerman.id.au, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W57BUIfsg4rs7b9z"
Content-Disposition: inline
In-Reply-To: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W57BUIfsg4rs7b9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 12, 2021 at 09:20:48AM +1200, Chris Packham wrote:
> The P2040/P2041 has an erratum where the i2c recovery scheme
> documented in the reference manual (and currently implemented
> in the i2c-mpc.c driver) does not work. The errata document
> provides an alternative that does work. This series implements
> that alternative and uses a property in the devicetree to
> decide when the alternative mechanism is needed.

The series looks good to me. Usually, I don't take DTS patches. This
time I'd make an exception and apply all patches to for-current because
this is clearly a bugfix. For that, I'd need an ack from PPC
maintainers. Could I have those for patches 2+3?


--W57BUIfsg4rs7b9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtR6gACgkQFA3kzBSg
KbZuaQ//WkcVkNyZUdGvvwmOqCjhTLKY+laTTGgsaTSk6mdr7k1pgoYlBwKGi/h8
sVux/PUF+h2L9lSFv/+sQQg6VNxS2BuOUr2xc1/ljEqikmXaOpgnV0i7rAkZIi1D
NRz+Qu+ZFnHqbVT7TJyoSx8+GZPCkff2pbZA1bUo0pHcbAdKAwmXjPu7LL4xlGhX
N9vzUJHJsDnAdIjGLC+SvdY30qMVTg3lUPsE2o4q2uITKMCfm//agEu9Y4dXXUps
JoDG0DWjaJrQ53SsrPaPTakLazMpLUZZ9SGz6gqtuW31vjm9wB3WITAVewKQ1jRk
1ktMRnJed3Mh+6ZNgLckK9QJjPmkF6P9CiAf4ibAP3DBkV6xWBJW95PdohTAQT+B
G3bk/yj+m8cmRCsH5Tmm6bWeXG2b0nUD9VISWH+qI7xT1+HuUu/Ge8hcGy1qTkgb
meX0Ywh7RbuaU1PNqzQOQPsZJn7qwhD0s3vLQZ0F+H8r3FiJVzlAAX7TSiG80EYL
4mE4SsI+OXznMelivT0oxn7XZfTIJTaoU2oi/CzjQZXW8k+lsY1YQK6QENP/FKzA
GgR4mgkbLlAyHxD3FxrYuC5T5rA714VBWL3Ba2CZ9q/H7Aq21ropRM4FrjPshJL5
1+U6dNj7obyPprt3iGUqFoLS4S+Bg3wfM2GDKspl8UnBj00Cj1w=
=yzK0
-----END PGP SIGNATURE-----

--W57BUIfsg4rs7b9z--
