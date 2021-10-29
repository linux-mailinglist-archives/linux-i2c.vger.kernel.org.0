Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDD344033F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 21:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhJ2Tcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 15:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:59522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhJ2Tcd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 15:32:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A064660F02;
        Fri, 29 Oct 2021 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635535804;
        bh=ylRvUyFQTXbnFilncWQvz8oj2YOa8vx7OxCvuaR0SCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mnz2vOoepmyqyf9mLef6yQOMA82V+22cFuzBYTJsEigDyT1sMrY2J46yVUNh6Bm21
         xSLpsCOMlPiOd55yJszpPmkICxet8Uxfw0zFO+halM2gDXB1hqMCx4w38NDvGqHi/m
         R8cs/eNzVdVfcyGYWKsGt5K6Myof1qc/YOYkFpevJh9HDvwQ8yHFGXn+dzm3wliOeP
         ezMVPuM013SLQZiVVLKNOHDx5IWFjTI6lbbC1eGC0QgRR/+7DFuCuMXGmZ1viTy/7R
         EZFbA8P4Ab4MW0I8zG81kL/DU4YWRrRokBpzdDTooepy5oKztkD5YWOfR63RZtk3kB
         1tkBXKq9kP7fg==
Date:   Fri, 29 Oct 2021 21:29:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix incorrect and needless software PEC
 disabling
Message-ID: <YXxLt1emHX1Gu0Fw@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AILoS2O9NwQ6t0em"
Content-Disposition: inline
In-Reply-To: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AILoS2O9NwQ6t0em
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 05:39:16PM +0300, Jarkko Nikula wrote:
> Commit a6b8bb6a813a ("i2c: i801: Fix handling SMBHSTCNT_PEC_EN")
> attempts to disable software PEC by clearing the SMBHSTCNT_PEC_EN (bit 7)
> in the SMBus Host Control register (I/O SMBHSTCNT) but incorrectly
> clears it in the PCI Host Configuration register (PCI SMBHSTCFG).
>=20
> This clearing is actually needless since after above commit the
> SMBHSTCNT_PEC_EN is never set and the register is initialized with known
> values.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--AILoS2O9NwQ6t0em
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8S7IACgkQFA3kzBSg
KbYu3g/5AVDsqzDCnOvLZw90p+z5Q6AgFn5R7lR1hnsTK9UW9lp5Xs6lSdj7hUGx
YZ67jD7Y+RA7NKY+ajxAnFfaj86oS/kHrDrhVDbWr+TlO2UeVvPcjuF+B9qkTlF5
4Yz8X7T2ILAmKkj0hG2rZ17jBa6DFo0XQXuS1Fi+AWLDsjIQFrTnhWsMyUSt/NOJ
c7Rqc5aaSs+glYu6QhkSzNVH8RNqffVPTIW9gKWY+eEGKAzXp6q3Es7d8ybXNdcn
5h/dCIEdwXIi9GhO1MzvA0jXE4JyJYDfNv1D2SNEBa8KRqewwVetVkqf6xuaT3sg
Td19m/8K6T43Qfp4buaOfSiG3bUvWcZvab9bbpPkJXcC2Vwie2F+2TcKp/6TOSrb
2hac1H9WkASnEl5wBrh0s/rCkxjock5YAfwRoQWowjZqqIhWc1z1yIVnxW3txhl0
D8rg170GtIb8828kN94qKPhvVTfxwiM9QihuqaWUF3nIo2L2diX1Q47Rnvv3rsEP
lvBSqijbHJczV6iJwhoG8zjTLMCRE6n9pEI4sN6srmJnKeOd1JglfKn/I3fI7Bbn
6Pg1hto1TpwHWz1Cg8q8bECJ5a1TU5KqLWSpIz+2uBhz0/Cw7Xm1GLX38Hsd8qbh
wBp4wylJoR3yg9ihJrih8ZhiUn28U5rrpP50eAOnibz2MzoM1zU=
=8FKD
-----END PGP SIGNATURE-----

--AILoS2O9NwQ6t0em--
