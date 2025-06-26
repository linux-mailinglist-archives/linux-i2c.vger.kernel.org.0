Return-Path: <linux-i2c+bounces-11614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3796AEA2DC
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF6CC163769
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 15:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165172EBDE2;
	Thu, 26 Jun 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RY9PDGDw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A8F2EB5B4;
	Thu, 26 Jun 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952458; cv=none; b=kRaVHwEG6eCkMIOsvcSUYKVf6P3dLNN4Ey2krpJ6FCXREKnI9WrpJU+miUafC+03IL3qF9BNF2DW7C1g+S9XR5dQ1CEi/g3PGfek1eCFAUQYDwPOMx4L3QHNhahN2rAYyXiiogZfdXI6FQRSstXBYc9B2BqFNxH9kb6C4UwXWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952458; c=relaxed/simple;
	bh=DGUPDEFy7xdCqVQ+Tf3uSe277RZ/z35tORf5iNIWDbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry9rgSydevi1/QrbwNUhSypPReRtlM0XgtKAP8gTAEtPwZ4UoAAvRJQiy/8q9NB9/lrmc+5UcoBXRQ3msCKPCijdCCx0/lccS+vqDR0ui0mxQfMpNm5gBxZkFwSuEM3Zupq5s1Qug0Tf3pVFk9NJFQ5VRxYxtASEFwWMFL2dKlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RY9PDGDw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80954C4CEEB;
	Thu, 26 Jun 2025 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750952458;
	bh=DGUPDEFy7xdCqVQ+Tf3uSe277RZ/z35tORf5iNIWDbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RY9PDGDwNqrJi/wW5kVSe3ZkKfFDw9kItmx6MeS7aUvAwcnYfhDw/TTA2Qpdp7F0y
	 i0iPbzjgv3LCtw21DmcZNpnjanQOXyq1eS1sDecpNTlwRkUGY0Hm3nT24I/8d0ulzS
	 ZosBG4R1vOCXBhthT6h4Ji2TZxx+Wjkm/Wwa5MNwb13+lrY01vhUj+txjM3L25yWr8
	 xR7f5/xaRM2jaGQxedzwDyL9BAc6hTf7txtA5z4mrt33/qxRjnbHqXkmU2KySXQT3p
	 /dv5pquW0gn3GgW3abMXHgmCWr/BL8MVn7NN7zx/6tsHy0mwOdTDfiGEGmJPXLEqE5
	 KUcT+h7qe3fQA==
Date: Thu, 26 Jun 2025 16:40:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1] i2c: microchip-core: re-fix fake detections w/
 i2cdetect
Message-ID: <20250626-reprint-curtly-358d13458b66@spud>
References: <20250612-jaybird-arrange-53b6200548e9@wendy>
 <20250625-irate-cursive-fa0de9009012@spud>
 <fjb7t2c7agr45aw5zrojfxrsqq5fej2k7uymqw2gsqyzjprd63@a4ldxxgg3vg5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="APZQmEsqgORw7CKt"
Content-Disposition: inline
In-Reply-To: <fjb7t2c7agr45aw5zrojfxrsqq5fej2k7uymqw2gsqyzjprd63@a4ldxxgg3vg5>


--APZQmEsqgORw7CKt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:50:28PM +0200, Andi Shyti wrote:
> Hi Conor,
>=20
> On Wed, Jun 25, 2025 at 02:27:51PM +0100, Conor Dooley wrote:
> > On Thu, Jun 12, 2025 at 12:12:49PM +0100, Conor Dooley wrote:
> > > Introducing support for smbus re-broke i2cdetect, causing it to detect
> > > devices at every i2c address, just as it did prior to being fixed in
> > > commit 49e1f0fd0d4cb ("i2c: microchip-core: fix "ghost" detections").
> > > This was caused by an oversight, where the new smbus code failed to
> > > check the return value of mchp_corei2c_xfer(). Check it, and propagate
> > > any errors.
> > >=20
> > > Fixes: d6ceb40538263 ("i2c: microchip-corei2c: add smbus support")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >=20
> > > Resending cos I think it attempted a send using my korg address on a
> > > network where that is not possible.
> >=20
> > Seemingly this patch has exposed an issue that causes a hang that was
> > not noticed previously:
> > # cd /sys/bus/iio/devices/iio\:device0
> > # cat *
> > VDDREG_IBUS_1
> > 0
> > [   92.178899] ------------[ cut here ]------------
> > [   92.178921] WARNING: CPU: 0 PID: 291 at kernel/workqueue.c:2496 __qu=
eue_delayed_work+0xb4/0xbe
> > [   92.178981] Modules linked in: pac1934 industrialio autofs4
> > [   92.179024] CPU: 0 UID: 0 PID: 291 Comm: cat Not tainted 6.12.22 #1
> > [   92.179045] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> > [   92.179055] epc : __queue_delayed_work+0xb4/0xbe
> > [   92.179081]  ra : mod_delayed_work_on+0x4a/0xa6
> > [   92.179107] epc : ffffffff8002b2f0 ra : ffffffff8002b3ba sp : ffffff=
c600863b70
> > [   92.179122]  gp : ffffffff812d6068 tp : ffffffe5a5bc24c0 t0 : 000000=
0000000000
> > [   92.179136]  t1 : 000000000000ff00 t2 : ffffffff80c01210 s0 : ffffff=
c600863b90
> > [   92.179150]  s1 : ffffffe5a2aa7568 a0 : 0000000000000040 a1 : ffffff=
e5a2054000
> > [   92.179164]  a2 : ffffffe5a2aa7568 a3 : 0000000000003a98 a4 : 000000=
0000000000
> > [   92.179178]  a5 : ffffffff8002b1fa a6 : 0000000000000000 a7 : 000000=
0000000000
> > [   92.179191]  s2 : 0000000000000040 s3 : ffffffe5a2054000 s4 : 000000=
0000003a98
> > [   92.179205]  s5 : 0000000000000000 s6 : ffffffc600863c5c s7 : ffffff=
c600863c58
> > [   92.179219]  s8 : 0000000000400cc0 s9 : fffffffffffff000 s10: 000000=
007ffff000
> > [   92.179233]  s11: ffffffe5a2806128 t3 : 0000000000ff0000 t4 : 000000=
0000000000
> > [   92.179247]  t5 : 0000000000000000 t6 : 0000000000000000
> > [   92.179258] status: 0000000200000100 badaddr: 0000000000000000 cause=
: 0000000000000003
> > [   92.179273] [<ffffffff8002b2f0>] __queue_delayed_work+0xb4/0xbe
> > [   92.179302] [<ffffffff8002b3ba>] mod_delayed_work_on+0x4a/0xa6
> > [   92.179331] [<ffffffff01375980>] pac1934_read_raw+0xba/0x1fc [pac193=
4]
> > [   92.179392] [<ffffffff0134942e>] iio_read_channel_info+0xae/0xc4 [in=
dustrialio]
> > [   92.179704] [<ffffffff80442fde>] dev_attr_show+0x14/0x46
> > [   92.179748] [<ffffffff8020ca3e>] sysfs_kf_seq_show+0x6c/0xe2
> > [   92.179788] [<ffffffff8020b15c>] kernfs_seq_show+0x18/0x20
> > [   92.179814] [<ffffffff801bc1ca>] seq_read_iter+0xd0/0x328
> > [   92.179844] [<ffffffff8020b634>] kernfs_fop_read_iter+0xfa/0x15c
> > [   92.179871] [<ffffffff8018e128>] vfs_read+0x1aa/0x25a
> > [   92.179895] [<ffffffff8018e998>] ksys_read+0x5a/0xcc
> > [   92.179915] [<ffffffff8018ea1e>] __riscv_sys_read+0x14/0x1c
> > [   92.179936] [<ffffffff807662f8>] do_trap_ecall_u+0x1ac/0x1d8
> > [   92.179981] [<ffffffff8076e3ba>] handle_exception+0x146/0x152
> > [   92.180018] ---[ end trace 0000000000000000 ]---
> > (The issue was detected on an internal 6.12 based branch, but the
> > content there is identical to what's in mainline + this patch).
> >=20
> > Obviously adding the check for an error here doesn't cause there to be
> > problems with a transfer, only actually report problems that have
> > occurred. I have not yet been able to reproduce this on my setup, but
> > the reporter saw the issues going away when they disabled hardware smbus
> > support and used software emulation instead.
> >=20
> > I don't know if this has any bearing on applying the patch, but I wanted
> > to mention it for reasons that should be apparent. I'm looking into the
> > issue still and hope to figure out what's going wrong.
>=20
> Thanks for letting me know. I'll hold off on this for now. Please
> ping me once you have some results.

Well, I made a mistake in my patch, so I'll be sending a v2. I still do
not know what is causing there to be issues with corruption of the
workqueue in the client driver. Nothing really makes sense, as the bug
in my patch causes read date to never get populated into the rx data
array rather than writing to something invalid. There's nothing obvious
in the client driver either that is blindly writing into some address
based on the result (there are some reads indexed by it). I'll continue
to look at that more, but I have a v2 that fixes the patch here.

--APZQmEsqgORw7CKt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF1qBwAKCRB4tDGHoIJi
0tM/AP0Rj8p7kPDlIv1Bz7/oVIJ5mmKT/rqfA4Vtd67pmZYIjgEA/TuOAzYKrYTe
zn12InyTK4ibqxMsreSCiaVMDqOxOQ8=
=SyWM
-----END PGP SIGNATURE-----

--APZQmEsqgORw7CKt--

