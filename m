Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78195191C2C
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgCXVrg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:47:36 -0400
Received: from sauhun.de ([88.99.104.3]:55502 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgCXVrg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:47:36 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id AA43C2C08EF;
        Tue, 24 Mar 2020 22:47:34 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:47:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     ajayg@nvidia.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Message-ID: <20200324214734.GI7641@ninjato>
References: <20200324152812.20231-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K1SnTjlYS/YgcDEx"
Content-Disposition: inline
In-Reply-To: <20200324152812.20231-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K1SnTjlYS/YgcDEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 11:28:11PM +0800, Kai-Heng Feng wrote:
> Nvidia card may come with a "phantom" UCSI device, and its driver gets
> stuck in probe routine, prevents any system PM operations like suspend.
>=20
> There's an unaccounted case that the target time can equal to jiffies in
> gpu_i2c_check_status(), let's solve that by using readl_poll_timeout()
> instead of jiffies comparison functions.=20
>=20
> Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Applied to for-current, thanks!


--K1SnTjlYS/YgcDEx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56f/YACgkQFA3kzBSg
KbZ5Xw//cOoQa5Y+68tFpZVVLo4CYZCEFIq6rdbNvDMTfJ1zoRXnGBVVO+E/og2s
Rw3H1V2XIPWhBMlHc/2muuYoP+tNC/O0OV5XWqwPxfCpxhgpoJ4G0MB+MwCTYYH/
80JeHyvzFNJ/2yJ2vBZRABwnuPdytS8JFADcfMTj2zaK0PDjk49b0Bl6jsAPwK97
VDDvK8pfF0Qlr97uuU3W1v3OqPqd08B4iOneHGmSdAYS7igDXyKa0+9xmZcT+u1m
r45F94Co72onsdEmHd5YrzX+KBLztJiERIxgFU89WoUdRDtOkAn0YjgBgan76pPy
31qtlnJ8x+iRx8R25SnSHVKKfAWPY6Y1pEDJAQWFNpXszjkIa8vSBtnmHe1y7Fbl
YPFI2I0GHYThxo6B55ivOqHcbotei6/VCTrH05GzcL4qtD4LT6Q6EoSDzghEnh2a
yrLnnnyQ4Qp2H1ZVx4odW8xrmOLTnnC893jr84tihhDHcYCC6AhxQfmxNq/xiy95
nVyxm4+804cpSill84Za4lquz2DVQaj80KZJkrUiAKFG/yagvWdiHXPL41bfcElG
5+Koioad3cw4dc6Bczdb6WrKIcwjZ4dqKtDOpHtEVaY3AvZFXFi3iQfPXc/YvEC+
AwLMCii1mhUHwSrZ+xK9A0HLsciLjKcYe/jH1XO0MemHKaP/xJo=
=gmtZ
-----END PGP SIGNATURE-----

--K1SnTjlYS/YgcDEx--
