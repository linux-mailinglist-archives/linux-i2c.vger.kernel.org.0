Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90903D8AB5
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jul 2021 11:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhG1Jfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jul 2021 05:35:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231408AbhG1Jfu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Jul 2021 05:35:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FEBF60F9C;
        Wed, 28 Jul 2021 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464949;
        bh=BQ7AJ0x7vUvZcwd7pGg5I9RZxeFcT+nYuKI9gEJYQD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IV9CVPy02b0NS62XMVEnR2So9X+6ZfwJcp6E/kI8FQU9Zqt3EDfPAK+B4T6JiWFss
         mpcy9WtMVn6DqCSFpM9uPKZd/b+T8Ju/I0dgdtcTGmUA39BFMn1VdEy7xP0oYYSxzp
         b9oyk+nzMWfuVT36lsVYzJ8a3TwxsejeinHr815fNZLJRWM84HkBNfvUxzghw4yiGU
         5FGctyzl/E+HTtTWLTe/woBIQGfGuq5ipSqLL0vpRQk4zs245IdL6sgqLYz10zrPsK
         T9n85ilY3M0s/F89pqc8UFuI7nIbJ0D1vXd90lGzfHlPi/gtTafxIoJwgmMLYdGp47
         vvNILMvuW6EVw==
Date:   Wed, 28 Jul 2021 11:35:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
Message-ID: <YQEk8ro6R1r4Pwj1@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c738b504-d545-8f7d-ab86-06dba876ddeb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DXbkOj5MWMIt9vUh"
Content-Disposition: inline
In-Reply-To: <c738b504-d545-8f7d-ab86-06dba876ddeb@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DXbkOj5MWMIt9vUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 10:25:25PM +0200, Heiner Kallweit wrote:
> Bit SMBHSTCNT_PEC_EN is used only if software calculates the CRC and
> uses register SMBPEC. This is not supported by the driver, it supports
> hw-calculation of CRC only (using bit SMBAUXSTS_CRCE). The chip spec
> states the following, therefore never set bit SMBHSTCNT_PEC_EN.
>=20
> Chapter SMBus CRC Generation and Checking
> If the AAC bit is set in the Auxiliary Control register, the PCH
> automatically calculates and drives CRC at the end of the transmitted
> packet for write cycles, and will check the CRC for read cycles. It will
> not transmit the contents of the PEC register for CRC. The PEC bit must
> not be set in the Host Control register. If this bit is set, unspecified
> behavior will result.
>=20
> This patch is based solely on the specification and compile-tested only,
> because I have no PEC-capable devices.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Tested-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--DXbkOj5MWMIt9vUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEBJPIACgkQFA3kzBSg
KbbjHQ//W/rUcvVZ3xSCqe9sDuK2C/iflx7hZ0Mzvmc+8Tv9jcrTmD20MZ0xlsrn
zp9iSwaBjmlqeASuw138bNOn7k/KBwT54iig8/UiPizazstIyBY3qvsc7pdLn35j
+3G1JE/aLiZQscuye/apI0eBGCXq0gl7fxDApsvx4wzzdlD03xTRiuXe6gHNO4BV
T2Lmeh/0tcX0DaYhf5OPZBycyRq3AWCA8PU3+UJBCEWoOJS/0v8iotN+AxDRt4I4
CbTxjUvxbAJy+DNnzwM95CBQivWqoBrI/WsU7djBGtU8TRPO1gYrPpb83RMGLZ6+
N4eMHLocbXdmYE2n1vpXqqlbUPCYuBbx8C2I4J+mig3/r4eVolCNvKkgrnNLHSp5
jtf6bOO/dEHqrZLeD3lA/ogsrpgZPjGMfjwYoTyC75lWbAjXME8ovPRCgi0JxZGU
sQjirdW4L2RAvpGUl69MC9RbH6HJua/b6hVp/VvpcsclNzcm+VuRyuEw/ETAAx76
SYTPXi6VIsNthtwygu+Yavoh8VGnEhJPhAg9+I9NjWaxVhgLTuhQEFU3yA6pMGh5
elPCyQj1B8lSACYXk9zysialFOuZtDkbTO0SsoNHXQTuDYr3s6wCtPXPi6rQcZ6r
F41l6hbE/mY06Tl1/GVBRGFpVhEmOODhfee82BXFG502FLk1FVc=
=ayBw
-----END PGP SIGNATURE-----

--DXbkOj5MWMIt9vUh--
