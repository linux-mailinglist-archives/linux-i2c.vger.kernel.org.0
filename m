Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FF53E847C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 22:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhHJUmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 16:42:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233023AbhHJUmd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 16:42:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB7EF60FDA;
        Tue, 10 Aug 2021 20:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628628130;
        bh=jJ180FBSjOp5ONud4DFZlmpBDks60j8CogSBZVlwCHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VJgDuL2lNV00Kg5uY79LdFeXa9qf8NvdStB1Yg1qiseWe4Hmnm/chYADNAhFayXKd
         1hunm8GYTJa2JmsWfGJm6+nqxhi60iUUdG/nwb2ZZimwi9FXosLz2a9p0TmquAeCy3
         wgQ22Z/0VoHGiDr+KtNS6/2YUIAlyZvUewBhv1bcXCCzMRXUxVwtwVsw+kuCLj1l6q
         Mv9h96XtoP3JgvHpBnHghD60z/D3MfAek2m+eKB+gCND4Jiive8/M2Nb9at/sNZiXO
         ga/XnFTjFrQYL9yun7j0a8+oJYvqy/ZRqOxU2b/h2R1cbratVF731JZ338O3G4DU7R
         9C3oNYxgE0RmQ==
Date:   Tue, 10 Aug 2021 22:42:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and tasklet
Message-ID: <YRLkn3ppu0Xbuu/W@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
References: <1628200145-4962-1-git-send-email-dphadke@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="StxJVKW6VyC/wC08"
Content-Disposition: inline
In-Reply-To: <1628200145-4962-1-git-send-email-dphadke@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--StxJVKW6VyC/wC08
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 02:49:05PM -0700, Dhananjay Phadke wrote:
> Similar NULL deref was originally fixed by graceful teardown sequence -
>=20
> https://lore.kernel.org/linux-i2c/1597106560-79693-1-git-send-email-dphad=
ke@linux.microsoft.com
>=20
> After this, a tasklet was added to take care of FIFO full condition for l=
arge i2c
> transaction.
>=20
> https://lore.kernel.org/linux-arm-kernel/20201102035433.6774-1-rayagonda.=
kokatanur@broadcom.com/
>=20
> This introduced regression, a new race condition between tasklet enabling
> interrupts and client unreg teardown sequence.
>=20
> Kill tasklet before unreg_slave() masks bits in IE_OFFSET.
> Updated teardown sequence -
> (1) disable_irq()
> (2) Kill tasklet
> (3) Mask event enable bits in control reg
> (4) Erase slave address (avoid further writes to rx fifo)
> (5) Flush tx and rx FIFOs
> (6) Clear pending event (interrupt) bits in status reg
> (7) Set client pointer to NULL
> (8) enable_irq()
>=20
>  --
>=20
>  Unable to handle kernel read from unreadable memory at virtual address 0=
000000000000320
>  Mem abort info:
>    ESR =3D 0x96000004
>    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>    SET =3D 0, FnV =3D 0
>    EA =3D 0, S1PTW =3D 0
>  Data abort info:
>    ISV =3D 0, ISS =3D 0x00000004
>    CM =3D 0, WnR =3D 0
>  user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000009212a000
>  [0000000000000320] pgd=3D0000000000000000, p4d=3D0000000000000000
>  Internal error: Oops: 96000004 [#1] SMP
>  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
>  Hardware name: Overlake (DT)
>  pstate: 40400085 (nZcv daIf +PAN -UAO -TCO BTYPE=3D--)
>  pc : bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
>  lr : bcm_iproc_i2c_slave_isr+0x1c8/0x8e4
>  sp : ffff800010003e70
>  x29: ffff800010003e80 x28: ffffda017acdc000
>  x27: ffffda017b0ae000 x26: ffff800010004000
>  x25: ffff800010000000 x24: ffffda017af4a168
>  x23: 0000000000000073 x22: 0000000000000000
>  x21: 0000000001400000 x20: 0000000001000000
>  x19: ffff06f09583f880 x18: 00000000fa83b2da
>  x17: 000000000000b67e x16: 0000000002edb2f3
>  x15: 00000000000002c7 x14: 00000000000002c7
>  x13: 0000000000000006 x12: 0000000000000033
>  x11: 0000000000000000 x10: 0000000001000000
>  x9 : 0000000003289312 x8 : 0000000003289311
>  x7 : 02d0cd03a303adbc x6 : 02d18e7f0a4dfc6c
>  x5 : 02edb2f33f76ea68 x4 : 00000000fa83b2da
>  x3 : ffffda017af43cd0 x2 : ffff800010003e74
>  x1 : 0000000001400000 x0 : 0000000000000000
>  Call trace:
>   bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
>   bcm_iproc_i2c_isr+0x178/0x290
>   __handle_irq_event_percpu+0xd0/0x200
>   handle_irq_event+0x60/0x1a0
>   handle_fasteoi_irq+0x130/0x220
>   __handle_domain_irq+0x8c/0xcc
>   gic_handle_irq+0xc0/0x120
>   el1_irq+0xcc/0x180
>   finish_task_switch+0x100/0x1d8
>   __schedule+0x61c/0x7a0
>   schedule_idle+0x28/0x44
>   do_idle+0x254/0x28c
>   cpu_startup_entry+0x28/0x2c
>   rest_init+0xc4/0xd0
>   arch_call_rest_init+0x14/0x1c
>   start_kernel+0x33c/0x3b8
>  Code: f9423260 910013e2 11000509 b9047a69 (f9419009)

Applied to for-current, thanks!


--StxJVKW6VyC/wC08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES5J8ACgkQFA3kzBSg
Kba6gA//Vj75F30x32kRj4lZRiclYz+b7AXrBK+qhx5OISzPFGZkNlagD25Niy3E
pGBlthEkPQRSLLjlMT0SQhx3oN5jz4OAPGCnLZ5Ap57ie3ZPhDy9kEEn8+3EHA8c
pKpaKIEriQ1yTAt8M2i4yXc39BPmNrJ3hLsEinYJSoWNnLclMEe4ZFyWbHvkLG6I
rEcqiRIjXDUtOMM+v27ErU/oGCRikGFMcrlE+BNxgyOd20ugDNtRbXE1/Exx/6V8
VNdLkAULgvJvLH1U0Ln6bbdPsBSRhQKI6YZeRiuZ9rN9xy7RNYNA3lEAPanrZl0e
N0VokQt0EFRHjpLFEs1D6f0jqRJd5pZETuy2ylnUsQfWgemxiMwFZQ3rQvhsPLXr
VbxlSdZqg5OK9TU7J1FAjM6nFjoMw+w46vhXqCBXLGQn9v5pc04GmwvLbBXTi7hB
FUlwEiUuXnBQCGNn2JZFjMNmx1Z+mHnBvTqKxAeKVgLpUjw4N9f6nPvTD2ag1Dub
oG0NzTN1FC9cvyzNfaVYfbW98lYEW/Ppm2iYE6QaRrcEF5CaIGah0ql2RPHkqed+
He93KpNnYLqso8g2VnL+6714BW3J1gww+rWtq+VHuEJ1hftXfQRtJmOPskHrwFOe
3UVblGZ2KlkYMBDwR6iB1lRy0iSo5OVZB8FboQIm7vuGjxCEwpw=
=oGmU
-----END PGP SIGNATURE-----

--StxJVKW6VyC/wC08--
