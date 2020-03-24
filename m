Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0ADE190C05
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 12:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgCXLJd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 07:09:33 -0400
Received: from sauhun.de ([88.99.104.3]:49250 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgCXLJd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 07:09:33 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 45E942C08EF;
        Tue, 24 Mar 2020 12:09:31 +0100 (CET)
Date:   Tue, 24 Mar 2020 12:09:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     ajayg@nvidia.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Message-ID: <20200324110930.GH1134@ninjato>
References: <20200311165806.12365-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
Content-Disposition: inline
In-Reply-To: <20200311165806.12365-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  	} while (time_is_after_jiffies(target));
> =20
> -	if (time_is_before_jiffies(target)) {
> +	if (time_is_before_eq_jiffies(target)) {

While unlikely, there is a tiny race between the time_is_* calls,
jiffies could update inbetween them.

So, for the sake of good programming practice, I'd recommend to set a
flag in the do_while-loop and the have the logic above solely based on
the flag.


--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl556l4ACgkQFA3kzBSg
KbY/wBAAscToS9q+QNPmVqqgKttmfAF0VSLyRHwM1Tkhfh80JIsC7Q/KEgmY4Qce
tRTx+oTMfoUx10VGuwKqGOGUbdoAnDJa0JjNYFW0BXUBV4buVTgnvPZ3LWJFBFv7
cstLgkuwIINFUTLPMDr/07M4TMHLYHbUxwToMsCRtNKWij2u6fQBIhBpFB8nOJ1d
vh457vsQLX8ZyR6fbGRVduSDvjmtnE0Z9sw4npphx1gl+Wij4IJmNUmSKOXGEM7a
2Y37hy86NXJN3pveDTmu41XmOFNdEYVjn3TlEAfIZnCIrjC7h3x5FdUP79jomd/h
5PzJXSDRohg/lfH8yVw4xsXO0SchC6atNOB8awXy1JDYiWe3mil8BhvT6BwcI4kB
QyBH5pmDDDaTDOd0CGegSWY7SWClCn3sdHGVq7oCunS9UECsCxXX0tD82ACE4alR
PQt2vlzy+OsP7sfVD6ZTptOxEt5qwRNbEJwim8BtnwiomjP6KSvS7GNwonSZRMDu
NRrRtn5BoHlJG4X45DZwxySSBRwidIn5NdCVURN6rx2yes4yakBP4I/GYpRlFzAF
SqEcDqlJBVrftSuS+Xu0qyO5MB8bOKCpAjVBZ1fDte/IYD7KQZ9Mc77alF7anuC1
McYwgeYKFHRwNgOeSixaIg4dIGdHQnQkXimk1sXhIbholsUcJ2Y=
=1uKn
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--
