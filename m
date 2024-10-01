Return-Path: <linux-i2c+bounces-7135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6298B913
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 12:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF881B2337E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D9A192D74;
	Tue,  1 Oct 2024 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhDVwrJC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ECC3209;
	Tue,  1 Oct 2024 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727777788; cv=none; b=KCIWwcDRqBPoIPtKLdccBDgsxwUkL2U4vVltPYuirrQRTVqvAj+Tdv+gjHc1g0bxZAyc0lQXB5TS2DehQw2BkNX1tu97d3tvWYED36nCNKjUTby3X8eDjoNcZV0aTmDDGpa3w0uBusG/eVWoUtMgaANlwLUB4LSd8rH/z9Gr/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727777788; c=relaxed/simple;
	bh=YQx7FeRcu9P6Be4U/Hjhs4f/myEgGAkd2TSGzXQlQEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8ZAAyNNEuc2fwixRGQqc83NoQZbzPUc25/Sl/IUWDX6cI4LKjj9jqypc6qVB/IYfz8YxTzCiC63j4jDP9LyxHh9j7/yo5ZxrGgnB+k/DsrjOWJPGEBA4yMYbBCB2FeyWrm/S5GezlnlrAutji9+8oHYnAWP4cAHL5/eqlMGDdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhDVwrJC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E26DC4CEC6;
	Tue,  1 Oct 2024 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727777788;
	bh=YQx7FeRcu9P6Be4U/Hjhs4f/myEgGAkd2TSGzXQlQEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhDVwrJCyJ4XMpJIrkjH7E4Vy3XUelLRLUXyqh+IgOP3aApVoJZYM7kSOas1YrHl6
	 cO9tNN7YiO7l9Srm+TWTl0Y+AcgakW/ZSYWKgwU4TO4cgb00FsjTafZMiKwX7j/m8Q
	 Sk0XXB52xzC4iCAwdNKOtrGbZX15kRHGh5p+DMZtfINestzKIOgWqrKf2qm4//ZBIl
	 dUjUhlDkqdo0snXUGr/89oR6Gqc30Lm+ZnR3Ee/QPOOBLEvC1BUssE3WrsXgMR+lhk
	 4ljiE8/f+csi4oKfp6FtgwIVw/eNP3QtpXIY/kEJFe5T3P8LIxRl6EPWELGtXYRyyL
	 rpN2+RQonUMYg==
Date: Tue, 1 Oct 2024 11:16:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241001-haphazard-fineness-ac536ff4ae96@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <Zvu38H2Y-pRryFFQ@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pyVrSTv7wMWn+iPE"
Content-Disposition: inline
In-Reply-To: <Zvu38H2Y-pRryFFQ@shikoro>


--pyVrSTv7wMWn+iPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 10:50:56AM +0200, Wolfram Sang wrote:
> > At present, where repeated sends are intended to be used, the
> > i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
>=20
> Oh, this is wrong. Was this just overlooked or was maybe older hardware
> not able to generated correct repeated-starts?

Overlooked, because the devices that had been used until recently didn't
care about whether they got a repeated start or stop + start. The bare
metal driver upon which the Linux one was originally based had a trivial
time of supporting repeated starts because it only allows specific sorts
of transfers. I kinda doubt you care, but the bare metal implementation
is here:
https://github.com/polarfire-soc/polarfire-soc-bare-metal-library/blob/614a=
67abb3023ba47ea6d1b8d7b9a9997353e007/src/platform/drivers/mss/mss_i2c/mss_i=
2c.c#L737

It just must have been missed that the bare metal method was not replaced.

> > devices must not malfunction in the face of this behaviour, because the
> > driver has operated like this for years! Try to keep track of whether or
> > not a repeated send is required, and suppress sending a stop in these
> > cases.
>=20
> ? I don't get that argument. If the driver is expected to do a repeated
> start, it should do a repeated start. If it didn't, it was a bug and you
> were lucky that the targets could handle this. Because most controllers
> can do repeated starts correctly, we can also argue that this works for
> most targets for years. In the unlikely event that a target fails after
> converting this driver to proper repeated starts, the target is buggy
> and needs fixing. It would not work with the majority of other
> controllers this way.
>=20
> I didn't look at the code but reading "keeping track whether rep start
> is required" looks wrong from a high level perspective.

I think if you had looked at the code, you'd (hopefully) understand what
I meant w.r.t. tracking that.
The design of this IP is pretty old, and intended for use with other
logic implemented in FPGA fabric where each interrupt generated by
the core would be the stimulus for the state machine controlling it to
transition state. Cos of that, when controlling it from software, the
interrupt handler assumes the role of that state machine. When I talk
about tracking whether or not a repeated send is required, that's
whether or not a particular message in a transfer requires it, not
whether or not the target device requires them or not.

Currently the driver operates by iterating over a list of messages in a
transfer, and calling send() for each one, and then effectively "looping"
in the interrupt handler until the message has been sent. By looking at
the current code, you can see that the completion's "lifecycle" matches
that. Currently, at the end of each message being sent
	static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
	{
=09
		<snip>
=09
		/* On the last byte to be transmitted, send STOP */
		if (last_byte)
			mchp_corei2c_stop(idev);
=09
		if (last_byte || finished)
			complete(&idev->msg_complete);
=09
		return IRQ_HANDLED;
	}
a stop is put on the bus, unless !last_byte, which is only true in error
cases. Clearly I don't need to explain why that is a problem to you...
You'd think that we could do something like moving the stop out of the
interrupt handler, and to the loop in mchp_corei2c_xfer(), where we have
access to the transfer's message list and can check if a stop should be
sent or not - that's not really possible with the hardware we have.

When the interrupt handler completes, it clears the interrupt bit in the
IP, as you might expect. The controller IP uses that as the trigger to
transition state in its state machine, which is detailed in
https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocu=
ments/UserGuides/ip_cores/directcores/CoreI2C_HB.pdf
On page 23, row 0x28, you can see the case that (IIRC) is the
problematic one. It is impossible to leave this state without triggering
some sort of action.
The only way that I could see to make this work correctly was to get the
driver track whether or not the next message required a repeated start or
not, so as to transition out of state 0x28 correctly.

Unfortunately, then the clearing of the interrupt bit causing state
transitions kicked in again - after sending a repeated start, it will
immediately attempt to act (see state 0x10 on page 23). Without
reworking the driver to send entire transfers "in one go" (where the
completion is that of the transfer rather than the message as it
currently is) the controller will re-send the last target address +
read/write command it sent, instead of the next one. That's why there's
so many changes outside of the interrupt handler and so many additional
members in the controller's private data structure.

I hope that that at least makes some sense..

> The driver
> should do repeated start when it should do repeated start.

Yup, that's what I'm trying to do here :)

--pyVrSTv7wMWn+iPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvvL+AAKCRB4tDGHoIJi
0mOnAP4+xs5yL6wkcBkpOyCc5Vy7umDFIYydMTIrHO0f3pSOrAD/b1UltiYEXah9
hTtHzrc/2bswOIFDFP4AIzr6rgqLMAs=
=dDbX
-----END PGP SIGNATURE-----

--pyVrSTv7wMWn+iPE--

