Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5891CF523
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgELNAc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 09:00:32 -0400
Received: from sauhun.de ([88.99.104.3]:56876 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729336AbgELNAc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 09:00:32 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        by pokefinder.org (Postfix) with ESMTPSA id 5C3C72C1F86;
        Tue, 12 May 2020 15:00:30 +0200 (CEST)
Date:   Tue, 12 May 2020 15:00:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org, tomonori.sakita@sord.co.jp
Subject: Re: [PATCH 1/2] i2c: altera: Fix race between xfer_msg and isr thread
Message-ID: <20200512130029.GB13516@ninjato>
References: <20200508.221248.1850264063769224908.atsushi.nemoto@sord.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20200508.221248.1850264063769224908.atsushi.nemoto@sord.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 10:12:48PM +0900, Atsushi Nemoto wrote:
> Use a mutex to protect access to idev->msg_len, idev->buf, etc. which
> are modified by both altr_i2c_xfer_msg() and altr_i2c_isr().
>=20
> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
> Acked-by: Thor Thayer <thor.thayer@linux.intel.com>

Applied to for-current, thanks! I added the following snipplet to the
commit message:

    This is the minimal fix for easy backporting. A cleanup to remove the
    spinlock will be added later.

I will give Thor some more days to review patch 2/2. It looks good to
me, though.


--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66ne0ACgkQFA3kzBSg
KbbI5hAAoTdFk1hiAir11hJuWQ70t5ErBAtMBPEksvyW0E3S7cGwBfPf9174Po2e
D00D0eQg8uEat1/jKftDVzFANUGbuBBt7G5znHrlofdKPACkfr+L11l98xSPWz88
orlIq3jVa9VqBaLs11orZ76udzcILneU4oJ+3+bKb76Z+tX1nPbs6dnTG1iGeFBI
jLs9tfZUqmQsQoVOsKEMF31Pl6gVYO6Lohx7Rc3f0JZfFqHc4Zi3om7moJhFE+QI
Capf6fD/wpKAgxDWKsapSRViGaYaw67skrQZlfrA3/N2k3Z4HhRVmNQj+UoDZcch
EgGvVGoO6g7YHxgJWTgXkrpMO1pijKttFl7hGFlQ1euwCsU4scIMUJlhQeOC92ud
eWPet3ERhTuwsx5ATi8i25ffMX/qXQ9q9Ak+jO4LbD2qDpLVVxLzTGRhO2QtNTHz
04AHQ2XMyzNe7LIWLVbuzD2kgzP3MKU+/YRF5b3DrjorsDa/W0MSgR/YPmnfmtV5
UlHyH4Y73GTrNfmW3cGG+zgxPBIvOz6Laac/KLiAFEZ3DMOKPffD2xc8Ew3ZdhP5
b9mkgQLnA+k/a4zX5WXUXfmazdl2myhYNV4v3x+TvS6avVH+4IVSO4t+/7pw2K9X
B3uBJktQ/AxLs2v9NxXfLSgX0K4EcLp0YJVEwUO+oG7XzY6khAs=
=btGY
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
