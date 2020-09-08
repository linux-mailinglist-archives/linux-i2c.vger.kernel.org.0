Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4F2260B85
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 09:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIHHGk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 03:06:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgIHHGj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 03:06:39 -0400
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A56542078E;
        Tue,  8 Sep 2020 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599548798;
        bh=fqYvBYmENcUKuM05hBKTFF4834yUPOhVdHnQb6n0AlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S1FWuPl0lCeMAFrCseZLRH5u42zbxXf8aFyHvBionCIvL7rP9HrMAhFnR2DlZLSDC
         SUFOVFAWrvq5nqtjw+ra4FGAUniVLWY6D/E1fK3xPmvmSq2uNrTA8+TQ2UPpfp+YFM
         WF+7FAaLdP5DQ0o4nBLybvrBcoB3Vs9H6cu33PjI=
Date:   Tue, 8 Sep 2020 09:06:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Cc:     andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, chris.packham@alliedtelesis.co.nz,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200908070634.GC5936@ninjato>
References: <20200902211532.22684-1-evan.nimmo@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline
In-Reply-To: <20200902211532.22684-1-evan.nimmo@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Evan,

> changes in v2:
> - changed lowercase "pca to uppercase "PCA".
> - reworded and reformatted the multiline comment.
> - moved the clock frequency KERN_INFO closer to the call that sets this.
> - moved the i2c_bus_settings struct to the more generic i2c.h and removed
> - the comments indicating this as being for the pca chip.

As mentioned in v1, I think we should not have it in the generic i2c
headers yet. a) it makes backporting more difficult and b) we need to
find the optimal generic set of parameters which is a seperate issue.

> =20
> -		pca_reset(pca_data);
> -
>  		clock =3D pca_clock(pca_data);
> +
>  		printk(KERN_INFO "%s: Clock frequency is %dkHz\n",
>  		     adap->name, freqs[clock]);

Minor nit: I think there is no need for the extra blank line, but I'll
let you decide.

> +/**
> + * struct i2c_bus_settings - The configured i2c bus settings
> + * @mode: Configured i2c bus mode
> + * @tlow: Configured SCL LOW period
> + * @thi: Configured SCL HIGH period
> + * @clock_freq: The configured clock frequency
> + */
> +struct i2c_bus_settings {

'pca_i2c_bus_settings' or similar?

Rest looks good!

Thanks,

   Wolfram


--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9XLXcACgkQFA3kzBSg
KbYlJQ//S6vZ98amQPpR33oXQtLX0cUQPC0OE9kkMetgOLuJlvVt5bDF8y7FsPwn
BS/Bt6JLD2UPptlxLzRfB7t7LcerN1vhqS4pHPoqArhJioI1oOS62Luje1Ae4+vN
cRigGgr5UUCUkCSVfiIP1n7f1eDdrmhkEs2LSiSEdUHJPtsXeMJaT/485lnGXyID
wviXyjrAaobvSPcm0QtvvqT4gPhnQZS7DVxyTY9sDdQat+azMxE358KxOwvcBdKs
pEQxhlnubSoA9PMmXsz6HIqyA4vtSEB0afBsz3qVzKm6nzDB5CJbve3YymBsIiYH
n+gpMnt2sxPZ6AVHLCWH/mrqBJXgkxlBKZX0g9zZsnQmnl7ilX7GjVBxh5wyFgwq
2U108E0OX1p6I6eu6GOWJFwKKGZC1Oc0rS3NTs4ez7Y5vpmd6ILB8glfx4TTwFRK
5Y5qekyrjHHH40JGm/tJpjjs4jPwKjt8u+kQscoMr0TTncgSCTdKySYJ34SZ2r9y
b7LtUeqktrqbZm9y3ull71O7PG/ZwCVKJm8TCwJdFRsNeTT+KnCJSynbfL8rThPg
vjVSRHbFB/gc9HZD10vrDiaCanoZeLYDkUQk3opNvmu2oF8spSLFA2kfKanQL5q0
hTCa8wTtFWe0mnY+bBMm6dnKduEx6WljyuRxwF7rP7eCLnz1FAs=
=lT2Z
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
