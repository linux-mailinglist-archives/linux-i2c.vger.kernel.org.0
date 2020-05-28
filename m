Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8295B1E6702
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 18:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404801AbgE1QDA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 12:03:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404631AbgE1QC5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 12:02:57 -0400
Received: from localhost (p5486c949.dip0.t-ipconnect.de [84.134.201.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12F872071A;
        Thu, 28 May 2020 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590681776;
        bh=EQZAsITFjSTR/q09X/8lN3XhCtq6tnw+2iECXybITcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cWWZvUeJb6htSFeqHlZSCbfW0IfMKb6k5zowU44QhtYkc9XkdhbdUF1M4kLgaW1nH
         s4SsVwkVaRvoSuJGQFpjDMyOcDAd7nUGpb7keHjLKE/EJO4ydoElBHAhwnghzoLkWz
         Q3Jv3rg/4SoNSsB4slytXldS+pMaEh3PfAmq8UJo=
Date:   Thu, 28 May 2020 18:02:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1] i2c: acpi: Drop double check for ACPI companion device
Message-ID: <20200528160250.GA2875@ninjato>
References: <20200528141858.82648-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20200528141858.82648-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 05:18:58PM +0300, Andy Shevchenko wrote:
> acpi_dev_get_resources() does perform the NULL pointer check against
> ACPI companion device which is given as function parameter. Thus,
> there is no need to duplicate this check in the caller.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7P4KYACgkQFA3kzBSg
KbaUjRAAkH5mW+ULUxU3+We5mKm5Y6z3qpQkoMgz57aORgW4xnWpKoAOsrJvDVQk
cxh4/y9i3FqByU16AkYPCpcCMNnGXkv240uRw0C6kqVQ7ZJzRGVF56cfVjEjbYSi
htr/Bm0JEY0Tpccb+yaNwIrsdIerq8Eywz4dJEk4qirpwtLScKKrd6oCTsa/Th4Y
nksfONEJXfbo4IQwGtHtd3pBCuuLWxnSUla2z/Lf7HP/7T9MYGmqBixZ9RTJwBBR
6lKOqlbAgT4QpfuZxacaJIiPo/Mg+9CYOpACpbrtweYkVSIIU6AMD5v1PGj1h4GL
/pwt7LSE1WRf1PK8FH6wtfdhKUpYVsRLybgJcEKVRPixVmc/3jAx94CN2qRNNgy+
bzz1lh3oKyrmULU8tECw5oetzk+g9YXG+I/rGmCJ5y8byfanLH0bRP5bK4JX3vn3
rchljZQ5JOKvIHWYzKwo24GjVXPR/aaU1HjZtmWyN7FN2mgrqwhbWoEm0QekVqF2
quZhi7D78yYFVvs0JrguMXAC0sTbnyfy5m7H8uVzxu8I2LV6CZCejzbLD6iXAIor
FCaommTHtCx0c2Ff+n4rGEOuueQoSQnUqTz2bwx0QPsfMf5Hhz4aBn6VXw2+Yla9
i07/kDgpELI71aXEVkg5y7S46yxzQSCt1aeYJWgpIO1YtRKPyJA=
=WR8p
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
