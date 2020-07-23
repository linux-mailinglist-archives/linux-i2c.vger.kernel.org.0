Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90CD22B75E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 22:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgGWUQi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 16:16:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgGWUQh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jul 2020 16:16:37 -0400
Received: from localhost (p5486cde4.dip0.t-ipconnect.de [84.134.205.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6378920792;
        Thu, 23 Jul 2020 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595535397;
        bh=ExgUqBonORZH5yAuDGyRAEVV1j7jfEoEVqtQOZhXuZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7jXfaSb+jCA0yR+hxqBjPx6JmE28Na0uDbcTJt2xZhe/uyxzY1hqlETLF9uRyuBf
         irDyKd/wAz4JO/hg6NFo4xLFbsqv4KTyldiPjRPxiUocjXZ7JIaEqMG9NEGNWyp/8O
         EkEyLbOPsinQ8d05J0kQn+DwylB5pfMR4167RSeA=
Date:   Thu, 23 Jul 2020 22:16:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] i2c: add PEC error event
Message-ID: <20200723201634.GC908@ninjato>
References: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
 <20200717090155.10383-2-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <20200717090155.10383-2-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 02:31:54PM +0530, Rayagonda Kokatanur wrote:
> Add new event I2C_SLAVE_PEC_ERR to list of slave events.
> This event will be used by slave bus driver to indicate
> PEC error to slave client or backend driver.
>=20
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Definately needs documentation in Documentation/i2c/slave-interface.rst.

What is a backend supposed to do? Does 'value' have a meaning?

> ---
>  include/linux/i2c.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index b8b8963f8bb9..e04acd04eb48 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -370,6 +370,7 @@ enum i2c_slave_event {
>  	I2C_SLAVE_READ_PROCESSED,
>  	I2C_SLAVE_WRITE_RECEIVED,
>  	I2C_SLAVE_STOP,
> +	I2C_SLAVE_PEC_ERR,
>  };
> =20
>  int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_c=
b);
> --=20
> 2.17.1
>=20

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8Z8CIACgkQFA3kzBSg
KbZegg//ejixvJjrb23pMlopYY4XUnLdUGFFZRrPc59k1p5j2eIR7Q0OBXwzks1u
qiVDZj+VcdfESI7r7+BTWz8xlbWWMuUKXIM8MTZCTJFkNV1FMm/oP5MZdX8LkrpE
XRMW5qrjDNlNCJuY3KKqqD7FNk4SXK7Mk4UNoUHcoJy3aybR2SBUZlHhqYmhrnOr
yU1e97iwEV8Q4NsAwaZsd2aXzs3ijpdzEK2XME76w1fkAEu+8KQ+i/OnMOc9fo5l
QGxzJ6X3QsTnJU650Ch/6XNsToVDU4yGVOJougVeJaEJrpVbT8hKzSi+S+9rONVa
ojhpiD0uc491WOglzPmQYRIkRUIISip36BuUHXQQymwMbtkPV1PpPmox9TzBgU9G
tqx6FXvCGlUQOdc5oLpM3yLuqzj2Kj+IKqW90A8Xffm+3FWvHS/Q5KC69c0Swjd0
izfpf2p+1/Ztn44gAYFJ5peelwjG7D9rcgiGQdoAR2TG/lGKzaHhNRRGRv9kuWvq
9j7iZ1ex98mLnQSvErn4Tsph6mPMjLdnqy6dZycEWwMDyxvGOXGyUDOXZIy7ywln
18CMxUjmKHSAklxtsZpw6+UsJ+Xek+H4jKlpWt804J27kcXNnRBVpjDDUnO3gqS3
H4h3YZZqe9ud8Jf7wbacKEuveXHBdE11qPqUuVX3Y3iQSZaMx0A=
=r6EV
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
