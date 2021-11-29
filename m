Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C74D46220B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhK2UVt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234601AbhK2USW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:18:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEBEC06FD57;
        Mon, 29 Nov 2021 08:51:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B39EEB8125D;
        Mon, 29 Nov 2021 16:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5E6C53FC7;
        Mon, 29 Nov 2021 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638204677;
        bh=WmHg1SN+kwfATW5Mwywh1SO9/fEBScJyIJQzbuVqR+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uYgJNUNQov3HFAQyHt+/z0KcufI0hJX/hyjohnlasyTmtOikWM8KR5bJam64Lh+/l
         7/kZIHMlgdFHFtZ7pDng9V4gPa9BUQL5TYYlacuEZDDUQfk4bj8oTpPG5GT2auuQIR
         LjaD+5lyJkQwW9kr4ovdGC4qzbW4nFYVHlEiWGSzNZ4B73iQK6SEjuYysBc6ci4Y+k
         k+yAiXcwKqcMu0SaUH2xvGYIhO3rJJnA+fKpHzw2aRBcSZQ/9Um9Oxx4FTuB8ry9bD
         /sdx4G3ILRpXnbdt+FAu/wPvy+/juPcLJaw99d53f5ic1Gi1D/mz30f8iyMjqQPa3v
         9MyMZ28igEvaQ==
Date:   Mon, 29 Nov 2021 17:51:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com,
        dbasehore@chromium.org
Subject: Re: [PATCH 2/3] i2c: enable async suspend/resume for i2c adapters
Message-ID: <YaUFAgsH1fMRrswZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com,
        dbasehore@chromium.org
References: <20211025213532.2349161-1-rajatja@google.com>
 <20211025213532.2349161-3-rajatja@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WdV5dsrXV+/86Yeq"
Content-Disposition: inline
In-Reply-To: <20211025213532.2349161-3-rajatja@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WdV5dsrXV+/86Yeq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 02:35:30PM -0700, Rajat Jain wrote:
> Enable async suspend/resume of i2c adapters. It enormously helps with
> reducing the resume time of systems (as much as 20%-40%) where I2C devices
> can take significant time (100s of ms) to resume.
>=20
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--WdV5dsrXV+/86Yeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBQIACgkQFA3kzBSg
KbbGeg//ekeTpryWxILYtJCrWop10hUVSX+ZYflgG3+ln1hQRvP7Zyj4OuoHnXXY
I1+TjxEX7+WaIQ7EBg25b+iDGfYvJR2B66CA7M3dmpRg8ZW7LbDVEkG07hN+3QXt
0zXY3MlnnvG61pRv7bopL0KstjUR7RbwX8bzrShuyBRdAYFkyeybtiGM4nv6E8a3
WmuGXEqM7CdTZTDwv7/wNOrkGzPqwQo5HuwIFIWpBgKtxNFtuXb/J4UgGd52J2sL
JMyLyVq69H/dUaAUPnC3cqQRWjBSjVUHo2nrJwL/3iOtV+zmaOSOgimGf9j2x2oU
BdCDGQTfw9+xAsONjIa2dn7qNXT7w63ShsgazMU9iKuOO/cqpWpXQZAUPHRXRG7q
ZyyXY7RM+Kq4ezfbAn51hGQ/hiseu+OX2UbdZBDUNtSPiZfLq0kxBAgVGRA4Z6Le
DvhkhjaXSYxcSzyoLekEHvWzzVvDT7oih4I+LppNpx/yCrJjBgBc39ErUFYPFZ6s
jTowGFiKOQR68qJoRLxJSmVjcKP9B61hdXG3SwV14HSRWd3SA/OuYyKCSIgQVVAh
Xcr1GD0KQjB0zAm/xdfamhxYA5SKJWQ6GLG8R8/SgGbjxHh+JFI2Cs6xZHkBylkC
Xy7QoRjM56v0324/OYKgxaLgbx1PIiri0+vtTlpSjXAXQ8c5vos=
=Sh9N
-----END PGP SIGNATURE-----

--WdV5dsrXV+/86Yeq--
