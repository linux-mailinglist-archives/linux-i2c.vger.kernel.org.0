Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B727242FD9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 22:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgHLUHG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 16:07:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgHLUHG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Aug 2020 16:07:06 -0400
Received: from localhost (p54b33361.dip0.t-ipconnect.de [84.179.51.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C795E2076B;
        Wed, 12 Aug 2020 20:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597262825;
        bh=Mo9S/fSa42wkTlWZw4/HDWgzGIqLPGEJ/WM9xG+aG2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YYIYlLM394gUgnNIc6EoqJOsz4CMFMML6kT07txR6Wt7hwYBphPss+opu8lYVvdGY
         lNhDFDsuqB243DYCpE0t2LeXuNlISLa6u5rmc3YDg45/crpzWrKBnQ81ahMWRrEM4w
         C370y0vzK3/+uy77Mmpy/b3axoOyN0Qg8OIWdzCw=
Date:   Wed, 12 Aug 2020 22:06:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v3] i2c: iproc: fix race between client unreg and isr
Message-ID: <20200812200659.GA2324@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2020 at 05:42:40PM -0700, Dhananjay Phadke wrote:
> When i2c client unregisters, synchronize irq before setting
> iproc_i2c->slave to NULL.
>=20
> (1) disable_irq()
> (2) Mask event enable bits in control reg
> (3) Erase slave address (avoid further writes to rx fifo)
> (4) Flush tx and rx FIFOs
> (5) Clear pending event (interrupt) bits in status reg
> (6) enable_irq()
> (7) Set client pointer to NULL
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
00000000318
>=20
> [  371.020421] pc : bcm_iproc_i2c_isr+0x530/0x11f0
> [  371.025098] lr : __handle_irq_event_percpu+0x6c/0x170
> [  371.030309] sp : ffff800010003e40
> [  371.033727] x29: ffff800010003e40 x28: 0000000000000060
> [  371.039206] x27: ffff800010ca9de0 x26: ffff800010f895df
> [  371.044686] x25: ffff800010f18888 x24: ffff0008f7ff3600
> [  371.050165] x23: 0000000000000003 x22: 0000000001600000
> [  371.055645] x21: ffff800010f18888 x20: 0000000001600000
> [  371.061124] x19: ffff0008f726f080 x18: 0000000000000000
> [  371.066603] x17: 0000000000000000 x16: 0000000000000000
> [  371.072082] x15: 0000000000000000 x14: 0000000000000000
> [  371.077561] x13: 0000000000000000 x12: 0000000000000001
> [  371.083040] x11: 0000000000000000 x10: 0000000000000040
> [  371.088519] x9 : ffff800010f317c8 x8 : ffff800010f317c0
> [  371.093999] x7 : ffff0008f805b3b0 x6 : 0000000000000000
> [  371.099478] x5 : ffff0008f7ff36a4 x4 : ffff8008ee43d000
> [  371.104957] x3 : 0000000000000000 x2 : ffff8000107d64c0
> [  371.110436] x1 : 00000000c00000af x0 : 0000000000000000
>=20
> [  371.115916] Call trace:
> [  371.118439]  bcm_iproc_i2c_isr+0x530/0x11f0
> [  371.122754]  __handle_irq_event_percpu+0x6c/0x170
> [  371.127606]  handle_irq_event_percpu+0x34/0x88
> [  371.132189]  handle_irq_event+0x40/0x120
> [  371.136234]  handle_fasteoi_irq+0xcc/0x1a0
> [  371.140459]  generic_handle_irq+0x24/0x38
> [  371.144594]  __handle_domain_irq+0x60/0xb8
> [  371.148820]  gic_handle_irq+0xc0/0x158
> [  371.152687]  el1_irq+0xb8/0x140
> [  371.155927]  arch_cpu_idle+0x10/0x18
> [  371.159615]  do_idle+0x204/0x290
> [  371.162943]  cpu_startup_entry+0x24/0x60
> [  371.166990]  rest_init+0xb0/0xbc
> [  371.170322]  arch_call_rest_init+0xc/0x14
> [  371.174458]  start_kernel+0x404/0x430
>=20
> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for s=
lave mode")
>=20
> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>

Applied to for-next (i.e. 5.9), thanks!

BTW my code checkers found this (unrelated to this patch):

=3D=3D=3D
    CPPCHECK
drivers/i2c/busses/i2c-bcm-iproc.c:723:14: warning: Shifting signed 32-bit =
value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    val |=3D 1 << M_TX_WR_STATUS_SHIFT;
             ^
drivers/i2c/busses/i2c-bcm-iproc.c:741:19: warning: Shifting signed 32-bit =
value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
  val =3D addr | (1 << M_TX_WR_STATUS_SHIFT);
                  ^
=3D=3D=3D

Use the BIT macro here.


--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl80S98ACgkQFA3kzBSg
KbaE8g//TIX6SM/WuqXJDkrSKWPa7x2q7vwgWh89sPZW3oer1d0T0wP7xY3BQ2Fs
RthbEGqgVFcoaJ97sL/Hi51R5uisknbSY+Tfl6MO6IR1+Q+d2MrX7QDVzzqkKLdF
tNEr3JcPPhNOj6LN32aIplBkCBKMLoUE9cFqSmLtontzY6dpX+/Y8XgWjvkF953E
+0MaSAPnXFLma5jk8CqGM4dD2eo1k9wYbnMCJgS/DdZVOAJObIc7R6d8GRK42gMJ
kFHryjwD+7bbSTwnTOrrDJpNRpyQbrTJqM3f6zcZAFy2a/BMM+pwMqvlZDusBc4N
cwD/4VXtoh5QWhwxt3uyaVx1+wS5zxqZFaA+kdhACjqijC4yb6SFwrDjKDAb46FB
qtD6O7NxWkA2Qvtso0EXUaA/dyehMze2m9ogiZ5jZHaS8tTea6OfHac4th/HfZc/
0UTGY4E5UNwSnOG5X1oKUmLz4z0B6hy6IShxRL/gfjFNjsIwlPKID0CsaCy98Vr1
173QLI0bmyR0NbYJgm6sRTMoGms4OLZZB9M7d7BGu/yor60uwocXEJ/kR4VhIkvm
osgwJudWexNgi3WT2HMqYw0b8OeQjzV5ToENYAQhHrUW8twVEiqaZXrcMbLnLz0X
zrV1HNJAyT0CQYqwlkSHXPyvjglp3cGPiHI59RleMa4UesWLu8M=
=bRvo
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
