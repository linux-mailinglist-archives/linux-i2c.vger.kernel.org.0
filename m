Return-Path: <linux-i2c+bounces-2356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0687C4D5
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 22:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78AE528207D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 21:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F06E768E0;
	Thu, 14 Mar 2024 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4DLrRAR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31827641B;
	Thu, 14 Mar 2024 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710452804; cv=none; b=RTIG5cfnRDLetp92eGXApT8804LY6wizXNRnwM1dml9DhQBsgEBVtjpVwNDWBx8nMq3ScLSopCx/z0iW8RGujz6x7XosOCeSBqyL5BZv+Ix8PcONHlJV1DwTgMEbn/ZWygziEC6tfFHf1LKZIVGZbFarNFk2aKuQNg5/XPm9Q70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710452804; c=relaxed/simple;
	bh=/2od1+DS2akp8OKCYAE5pl/cHr9uEBHeLESjE/2dc88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhQvHDm+x3OUiaN+BY/CagOV7/vRWgOPHoo43UnNXZa9VzcODLBvjqYsXwMEXebibARzsc+oZ+L+0jZqIoqCdWisNeRMiQVoav5R7VoGF6Hkkc7Dc1OOFPPiyEJFuqSw8MbdM07Ds7ZsgRD6OB3fSxCFk0Sf+J0gSIYtahNBx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4DLrRAR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3266C43394;
	Thu, 14 Mar 2024 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710452804;
	bh=/2od1+DS2akp8OKCYAE5pl/cHr9uEBHeLESjE/2dc88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4DLrRARj2zmrrmzBtZx1Am32ATALTBimfIcBHdt8rBy+ZteyZkklbW6rQt4BUSBM
	 qT+9SlGVguYxJSZX0MGlLy/ojp2P8phVeVU5rhKNFpCSQKWulO81Uosk0b12Sh5BHe
	 WmltGWurLBW9XXlbYvEDETl3Cr7ycbj78CB3Q5sJK/1EJHXwvNXusUCwX8w/Or3UAx
	 5GsVAFsThfyef6YLUqMs+xDxN6+HKb7fmRI6tJxAPFk1lexLvKbJ37qFGYKzIxPH5D
	 kpDtS/avjYd7m56x5wekY5WlZMq9b62JYGc1LqSCpL9cQa+0fjAzPUlbRTqxgRTaPc
	 0kftrIUf/Fh5A==
Date: Thu, 14 Mar 2024 21:46:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
	linux-i2c@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240314-sublevel-jargon-4234df3fa614@spud>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iXQ/4Ga64dEQTg/D"
Content-Disposition: inline
In-Reply-To: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>


--iXQ/4Ga64dEQTg/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

I'm not really all that familar with the plic driver itself, so adding
Samuel and Thomas who will (hopefully) understand this better than me.

On Thu, Mar 14, 2024 at 09:12:40AM +0200, Eva Kurchatova wrote:
> If an I2C-HID controller level-triggered IRQ line is routed directly as
> a PLIC IRQ, and we spam input early enough in kernel boot process
> (Somewhere between initializing NET, ALSA subsystems and before
> i2c-hid driver init), then there is a chance of kernel locking up
> completely and not going any further.
>=20
> There are no kernel messages printed with all the IRQ, task hang
> debugging enabled - other than (sometimes) it reports sched RT
> throttling after a few seconds. Basic timer interrupt handling is
> intact - fbdev tty cursor is still blinking.
>=20
> It appears that in such a case the I2C-HID IRQ line is raised; PLIC
> notifies the (single) boot system hart, kernel claims the IRQ and
> immediately completes it by writing to CLAIM/COMPLETE register.
> No access to the I2C controller (OpenCores) or I2C-HID registers
> is made,

This immediately seemed odd to me, but I have no reason to disbelieve
you, given you say this was discovered in RVVM which is an emulator and
you should know whether or not registers are accessed.
The very first action taken by the ocores i2c controller driver when it
gets an interrupt though is to read a register:

	u8 stat =3D oc_getreg(i2c, OCI2C_STATUS);

I would expect that this handler would be called, and therefore you'd
see the register read, had the probe function of that driver run to
completion. I'd also expect that the interrupt would not even be
unmasked if that probe function had failed.
In your case though, you can see that the interrupt is not masked,
since it is being raised and handled repeatedly by the PLIC driver.
Has the i2c controller driver probed in the period of boot that you say
this problem manifests?

> so the HID report is never consumed and IRQ line stays
> raised forever. The kernel endlessly claims & completes IRQs
> without doing any work with the device. It doesn't always end up this
> way; sometimes boot process completes and there are no signs of
> interrupt storm or stuck IRQ processing afterwards.
>=20
> There was a suspicion this has to do with SiFive PLIC being
> not-so-explicit about level triggered interrupts. The research of this
> issue led this way: There is another DT PLIC binding; a THead one,
> and it has a flag `PLIC_QUIRK_EDGE_INTERRUPT` which allows
> to define IRQ source behavior as 2-cells in DT; and has some other
> changes to the logic (more on that below).
> When attempting to mimic a THead PLIC in kernel DT, and rewriting
> all DT interrupt sources to use 2-cell description, the hang ceases to
> happen. Curious as to what are the kernel side implications of this,
> I went to see what `PLIC_QUIRK_EDGE_INTERRUPT` actually does and
> bit-by-bit disabled the actual differences this flag makes in the
> driver logic.
>=20
> This return path in irq-sifive-plic.c@223
> (https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-sifiv=
e-plic.c#L223)
> is only enabled for SiFive PLIC, but not for THead one. Removing
> those 2 lines of code from the driver (whilst keeping the DT binding
> properly reporting a SiFive PLIC) fixes the hang. I am not an expert
> on the PLIC driver to debug further or determine what would be a
> proper fix to this, but this probably gets more experienced devs
> somewhere (I hope).

I'm not really familiar with this code either, but just checking what
the affect of your changes are, AFAICT it just sets the handler to be
handle_fasteoi_irq(), I noticed that that function has some code that
will mask the irq if there's no handler registered for that particular
interrupt:
https://elixir.bootlin.com/linux/latest/source/kernel/irq/chip.c#L710

It seems like in your case there might not be one registered (as the
i2c controller's interrupt handler never performs it's first access),
so I'm wondering if that masking of the interrupt when no action is
registered is what solves the problem for you.

That's mostly just speculation though, because I am not an expert on the
PLIC driver either.

> This is reproducible at least from Linux 6.4.1 to Linux 6.7.9 on RVVM;

I clearly cannot make any definitive statements because I'm just
speculating here after all based on this mail, as there's no logs and I
have not tried to reproduce this, but this does seem like the interrupt
is unmasked before the i2c controller driver has even requested it.
Ordinarily (at least on the hardware I have done any testing of
interrupts on) the interrupts are masked by default and only get
unmasked when there's a user for it in the kernel.

Are interrupts unmasked by default on RVVM?

> Affects any hardware that would have SiFive PLIC + I2C-HID combination;

Have you checked that this actually affects any actual hardware?

Thanks,
Conor.

> Most likely this is reproducible on QEMU as well if it had i2c-hid emulat=
ion,
> or if we passthrough physical I2C-HID device & inject PLIC IRQs from
> it's IRQ line.

--iXQ/4Ga64dEQTg/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfNwQAAKCRB4tDGHoIJi
0j/gAP49veZAGuKcvAfq0Lh0oFqcH3fKhBfWU9XHTyak9/a5iwD9FrxTiWU0yMSf
xQBVMWw1oap+RZ6q9cZRv422KdRtFAI=
=jDN5
-----END PGP SIGNATURE-----

--iXQ/4Ga64dEQTg/D--

