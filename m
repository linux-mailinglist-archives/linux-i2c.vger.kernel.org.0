Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1047C34FC98
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 11:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhCaJXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 05:23:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:44798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234545AbhCaJWf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 05:22:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F8F66198F;
        Wed, 31 Mar 2021 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617182555;
        bh=RytI4b+szUa9Y8qjxl14EVaICLgMoNA/tChtgCeTrQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pWd+5T4hnabsrqVRV7AG2Kgj6zbqAhCbb83wxY90N+uoqGK3ZYpdTwt4t/WR1gNiB
         IV5y5akKmiWL8BkI0ZOuSp5VB9hzzDCiSrA9/0+Ey7w8bDTIPGYgJH1FDTCqBIxn4U
         lW4AcmQ+4180h8lESKlEkgNLUie/Svl2q91XIcv7n69cVDdKrpJhPXqANYcX415eyS
         ynuB5LPc9rIx4oNcRmtQX+xilFT6nkzUIh8ojMzWOBQBIVYniaY/xiqO5Pz873DYYy
         4xRtefrmcXh5DrPldde5/h6j5yZVZpWWvUmAJv5MskrCkF0jz60CNHq2SGS/KW3oY4
         0q8QBhoUCcIbw==
Date:   Wed, 31 Mar 2021 11:22:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c: Adding support for software nodes
Message-ID: <20210331092232.GL1025@ninjato>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FnOKg9Ah4tDwTfQS"
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FnOKg9Ah4tDwTfQS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The old device property API (device_add_properties()) is going to be
> removed. These prepare the i2c subsystem and drivers for the change.
> The change is fairly trivial in case of i2c. All we need to do is add
> complete software nodes to the devices instead of only the device
> properties in those nodes.

This looks like a nice cleanup!

Reviewed-by: Wolfram Sang <wsa@kernel.org> # for the I2C parts

Which tree should this go into? I can offer I2C but am also fine with
another one...


--FnOKg9Ah4tDwTfQS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkP1QACgkQFA3kzBSg
Kbaw6A//ekld1xJ32sOmWlFDDXcO1Mm24LzRLE6F9yiNwiAYvWgqew3z+vQ62Q7W
NxoQuBS/3Qq9ccj1DyS4oylFYGG6taoruy9YLjIH/vFgqc6lbl5ekrYKFCWe61sB
BcwbJB9O8u2WTYSLg2mgzcz9xVCoFCCaQLskx+5LvoLS3xHrO341UlD3nFviJk3W
qGD9lB0DmaOOmGhhTXM/Qdv4oy/slGB4GhO2tMfbYV462vbhjdxSxRmCGkbkI0Hs
Rtc0zL1PKZvR+QgpQTu7BKdnneU07697p+D2sRiXwkR79TW9hhJh9t4c3IbbUl8s
a8QwJaNRxSiKSXhfAojeLSgz0RvaMRrYXSQnkCbctqxOrmnAV46DCoo86jmecBbt
wrruCQVsBoZOs9OvurJgxBdRb1+9d1PJu9nW2pNkb0MMKjbdnWvhPayl0xwoi9Ip
Jd4H76wxxt3sx1IEsRhXyfRQ6iuLxUAFTwfSqU/NStLvw4oxWws9p6sZ9419MiUz
1of8a0lt44DjD+kf/3+dHACCIBLR9dGBx3n8eSO6wuUOQSEhntCN81vkFiTfNyCS
1yqRxf/RnIS6igkeo0EI/J+hn6Ky8K0oH9ZClHzKBwwscpIOCkhfnUiv6g5fblNL
n4hdqOUK9ObDZKOgxooe+jdphYe8jhYmzkQRbyKw49uMlpQNqXI=
=d4SE
-----END PGP SIGNATURE-----

--FnOKg9Ah4tDwTfQS--
