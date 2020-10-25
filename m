Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A952981AB
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Oct 2020 13:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415744AbgJYMhu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Oct 2020 08:37:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732079AbgJYMht (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 25 Oct 2020 08:37:49 -0400
Received: from localhost (p54b33def.dip0.t-ipconnect.de [84.179.61.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66B4A20853;
        Sun, 25 Oct 2020 12:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603629469;
        bh=oFn2Q6YtmHEzhSzwSmnquAeQdnjrmF6GgpakRRSDG3I=;
        h=Date:From:To:Cc:Subject:From;
        b=SRZgYYTjv8cZYSO8Jk1LxYHyjsZHaj4iAMd1ZzaiIu9hdqKQ8AXnT5tCoPIvzkU49
         H7kM2gm+bvxqGiGsa4Hk7AxSgfmMCWN25mITD40iE84IMr569Xq0SxydBqvvSW4Z6A
         zf7I6F7PH402TVU9mBN+JLHKGVvZ4hoIK0UQDvRY=
Date:   Sun, 25 Oct 2020 13:37:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.10
Message-ID: <20201025123745.GA7614@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has a regression fix which should go into rc1 and to stable kernels
as well.

Please pull.

Thanks,

   Wolfram


The following changes since commit d76913908102044f14381df865bb74df17a538cb:

  Merge tag 'block-5.10-2020-10-24' of git://git.kernel.dk/linux-block (2020-10-24 12:46:42 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.10

for you to fetch changes up to 8058d69905058ec8f467a120b5ec5bb831ea67f3:

  i2c: core: Restore acpi_walk_dep_device_list() getting called after registering the ACPI i2c devs (2020-10-25 13:33:54 +0100)

----------------------------------------------------------------
Hans de Goede (1):
      i2c: core: Restore acpi_walk_dep_device_list() getting called after registering the ACPI i2c devs

 drivers/i2c/i2c-core-acpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+VcZkACgkQFA3kzBSg
KbYHAw//UgvqHR1T9xq9zPmuVdQjsPBS3rKTt3KI2NCwBrGC7ELXZfHhpD6gL2F2
U4xAe5kjw8AYRhy7INjmYLtXb7lX8XoKoixsg8Zk12mGXUhmvMdXdPVOdZ69KGD9
juU/X1wok81REwXKPgRqkiwwQncLslYxJuht5lL+1EJ96JtvOGqCnNZHqaQGlkqi
DC3nocNXEBbq4Q3aznZ5WM/rUnFVIiZTqNluxzKraNUhok+0g99ng1vPorra7HUp
qEHylxiBVfkH4NYB234EqVCGrTFPSUI9p37Cf2+gUZuENfAeUluTzxbLK0jaRiZ0
S8I499JJR3GkOq691femDrNwhrv5LfXbbSZSNvV1vG/6gSJo1MVvOpiWGJZdCFkE
mNOItCcv63vNd3gMADW8bZ6Sqddq0qoaLJ6478ymLjut9UOJ412OagzFTWjj2yle
dhcYuCPRK/jYbCLCRQFNTjUSGyg7vEELHEGyhx62204ehfe1ElKVB0KRBImbj7LQ
0hHlcAdu3448px3Bw/YN1UrZMUt5tloIIEt9RRKrllSVCZet6FmKDZvCKink1Iru
/n5nffh2AZjiYnGzD/MQjfzSnEoY9iF92H9auyNtWkHmNbM5iQ4OSwpDlKFxT7Va
WfVdpIN64qclUmxJTUlXYU2c4nUS38vC5aAaV9bSLF9pHLjU1Fs=
=NLid
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
