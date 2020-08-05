Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE1123C91E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgHEJZk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:25:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgHEJZf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:25:35 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2599920792;
        Wed,  5 Aug 2020 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596619534;
        bh=ERRvfqEriokU7TkTN7wbLnT2FuGkg1l29VyZXOxiN7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PjSgc3SZFpd+xtRwvrWVtY3lwE4NPJVm4XVgvSlI6xTUJZ187Nn/zXb9Xek+Nvli1
         w+Lbg4ApC+JcWgF9mdF3uXfmhIU7gSagg3K4U6nBlRfdQWN6olaw94jL7ZshL7QRDZ
         6k0kCN/6tP9/KiZLYQCz92UN/GmOGgbxH7wyULnE=
Date:   Wed, 5 Aug 2020 11:25:32 +0200
From:   wsa@kernel.org
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        wahrenst@gmx.net, ardb@kernel.org, chris.brandt@renesas.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Replace HTTP links with HTTPS ones
Message-ID: <20200805092532.GK1229@kunai>
Mail-Followup-To: wsa@kernel.org,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        wahrenst@gmx.net, ardb@kernel.org, chris.brandt@renesas.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200717185247.81988-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cN0A5YokcrYPGsSB"
Content-Disposition: inline
In-Reply-To: <20200717185247.81988-1-grandmaster@al2klimov.de>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cN0A5YokcrYPGsSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 08:52:47PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>=20
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
>=20
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Applied to for-next, thanks!


--cN0A5YokcrYPGsSB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qewwACgkQFA3kzBSg
KbbmuA/9GyPdwQnTBTL8GnTKxOd6w5OA3yao0e0dNkRTXdF1+aFUrTOaMoGhEngl
osR+RLfxjL5mVnaIUVF6VmCsbtsu65XnJbl+El4lKXKrpJRRIoINz5rkEEvI4IJq
y/HMnCwINjuhUMWxpBXB9Z8YAfbZBsFgaPUcBBhaLvVLGHPVMc2FUJ9aHvb/dNoy
jHVLyFEC/rYB+Axi77OYOfSRobVG9M40CfjPm2pt1Oe7CQ8k5SZ3q9tvHDgJEKaf
yDlNtN9esKHVdySlWjXiaqbU82rogtDS86/8PMTK6N8FkPQXdOhU/WWQiWH/0wo/
/bjs6Zlc3UpjkdMj1w5v8eFr9Ooufznr8s64dweVTyF7J76S+EZWQ1AuYzEjFD5t
QPFYhZhnsPZRsrXd9clclKKr5UfR/+ZVn8TPl0XPATMOmb9a+PZydzMuPUK/5q7b
zyO4JlDkJKcSP0akrLtwd0kGLbyq2a1V2QBiEx/d3BrjZyYFQ/uH4DLmyVdmQ9xC
N0jtP6CzhJxqAyFJ9ke+V1mDJrofvU91+OqNUkbrcWKccQcuaPNZEwQOByxOK4kh
3uNXXuW5w8Gd+dOQcrwNQv5QR2xLszy77EVbeeuwP7vPTndnkPU8vSwaDmnnX+z8
V5+OJHHchEPeuqRZf8gRjC/C8JXW/XLm/XN1SWGwET3YrvznFDI=
=HSH/
-----END PGP SIGNATURE-----

--cN0A5YokcrYPGsSB--
