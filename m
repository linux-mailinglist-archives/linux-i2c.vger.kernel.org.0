Return-Path: <linux-i2c+bounces-8359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AAF9E6D95
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 12:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD3E8162D11
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 11:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EDA1FC7FE;
	Fri,  6 Dec 2024 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOAAfRfF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5253C1BDA97;
	Fri,  6 Dec 2024 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733485692; cv=none; b=nt63nswO4Fk70mh+U0Kj3dVwJ7uKKC7njAV6VkA5I7q/eAH/yyzWW67pD0dg53ZnY49Mz0pd/vMdVJC1ZdLRz/6K7AH3/sfok63noqlxwh/gJ5V2eUggUc+OsRkDeHgo8GVTLuAq3WV4n+dEhEL46eaFPBQpUt8n3UXMPJHcjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733485692; c=relaxed/simple;
	bh=qEiT145v+mmmXz/X9So4yw/RdnpSM6fmg8D+g80PLnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+plK4sZ8l6kDoLGFzs0hA5r8CrsXnLFBmefso/RoFEy4Z7HEsZe7hij6uieeRVoaPYTHMd/tRAjaOufF9f9TGAg4UT2O9rgYZhE1oryUfgn0Pn/JH/MJlnaKh4u3CsUecgIkV5nSywvvxrybx94peYBda3CTbKaot0LyGTdSd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOAAfRfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A25C4CED1;
	Fri,  6 Dec 2024 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733485691;
	bh=qEiT145v+mmmXz/X9So4yw/RdnpSM6fmg8D+g80PLnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOAAfRfFmhScD8M4YKfBg2hzYH8fYRKO6PP8IZIL7Ra22OCa9M499fbQ+fQZ715Uu
	 FvFVlvEe+fXm9svkgmCugWUW+noYen6B/6nWguggGORGE+7XAqjE1pNL1N3uKDzd5y
	 n6G2Z1exSB00BxTvr1sardR1LSMTqkhupS1IMTBJyiNMoYszJ8E8fDp7Jbyxmr+zhI
	 UYKFa6qjWlvv61+6eSrwexgt2y1Y7Ljs50KL8opS0XeRCvwTXn/SbMEUqF+kTlyaj+
	 ryKUFjVCrbYt524ZClofRwD/yxQmIxoyiqmdmGk+tuGzQuNdqdKa98fXWxB+YsATBW
	 opKuZyDIwvP7g==
Date: Fri, 6 Dec 2024 11:48:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241206-random-spectacle-9de88d412653@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <Zvu38H2Y-pRryFFQ@shikoro>
 <20241001-haphazard-fineness-ac536ff4ae96@spud>
 <20241024-snagged-elated-d168d0d6bf35@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2o2i0BUpv0Ef1SLM"
Content-Disposition: inline
In-Reply-To: <20241024-snagged-elated-d168d0d6bf35@spud>


--2o2i0BUpv0Ef1SLM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Wolfram,

On Thu, Oct 24, 2024 at 10:36:33AM +0100, Conor Dooley wrote:
> On Tue, Oct 01, 2024 at 11:16:24AM +0100, Conor Dooley wrote:
> > On Tue, Oct 01, 2024 at 10:50:56AM +0200, Wolfram Sang wrote:
> > > > At present, where repeated sends are intended to be used, the
> > > > i2c-microchip-core driver sends a stop followed by a start. Lots of=
 i2c
> > >=20
> > > Oh, this is wrong. Was this just overlooked or was maybe older hardwa=
re
> > > not able to generated correct repeated-starts?
> >=20
> > Overlooked, because the devices that had been used until recently didn't
> > care about whether they got a repeated start or stop + start. The bare
> > metal driver upon which the Linux one was originally based had a trivial
> > time of supporting repeated starts because it only allows specific sorts
> > of transfers. I kinda doubt you care, but the bare metal implementation
> > is here:
> > https://github.com/polarfire-soc/polarfire-soc-bare-metal-library/blob/=
614a67abb3023ba47ea6d1b8d7b9a9997353e007/src/platform/drivers/mss/mss_i2c/m=
ss_i2c.c#L737
> >=20
> > It just must have been missed that the bare metal method was not replac=
ed.
> >=20
> > > > devices must not malfunction in the face of this behaviour, because=
 the
> > > > driver has operated like this for years! Try to keep track of wheth=
er or
> > > > not a repeated send is required, and suppress sending a stop in the=
se
> > > > cases.
> > >=20
> > > ? I don't get that argument. If the driver is expected to do a repeat=
ed
> > > start, it should do a repeated start. If it didn't, it was a bug and =
you
> > > were lucky that the targets could handle this. Because most controlle=
rs
> > > can do repeated starts correctly, we can also argue that this works f=
or
> > > most targets for years. In the unlikely event that a target fails aft=
er
> > > converting this driver to proper repeated starts, the target is buggy
> > > and needs fixing. It would not work with the majority of other
> > > controllers this way.
> > >=20
> > > I didn't look at the code but reading "keeping track whether rep start
> > > is required" looks wrong from a high level perspective.
> >=20
> > I think if you had looked at the code, you'd (hopefully) understand what
> > I meant w.r.t. tracking that.
> > The design of this IP is pretty old, and intended for use with other
> > logic implemented in FPGA fabric where each interrupt generated by
> > the core would be the stimulus for the state machine controlling it to
> > transition state. Cos of that, when controlling it from software, the
> > interrupt handler assumes the role of that state machine. When I talk
> > about tracking whether or not a repeated send is required, that's
> > whether or not a particular message in a transfer requires it, not
> > whether or not the target device requires them or not.
> >=20
> > Currently the driver operates by iterating over a list of messages in a
> > transfer, and calling send() for each one, and then effectively "loopin=
g"
> > in the interrupt handler until the message has been sent. By looking at
> > the current code, you can see that the completion's "lifecycle" matches
> > that. Currently, at the end of each message being sent
> > 	static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *id=
ev)
> > 	{
> > =09
> > 		<snip>
> > =09
> > 		/* On the last byte to be transmitted, send STOP */
> > 		if (last_byte)
> > 			mchp_corei2c_stop(idev);
> > =09
> > 		if (last_byte || finished)
> > 			complete(&idev->msg_complete);
> > =09
> > 		return IRQ_HANDLED;
> > 	}
> > a stop is put on the bus, unless !last_byte, which is only true in error
> > cases. Clearly I don't need to explain why that is a problem to you...
> > You'd think that we could do something like moving the stop out of the
> > interrupt handler, and to the loop in mchp_corei2c_xfer(), where we have
> > access to the transfer's message list and can check if a stop should be
> > sent or not - that's not really possible with the hardware we have.
> >=20
> > When the interrupt handler completes, it clears the interrupt bit in the
> > IP, as you might expect. The controller IP uses that as the trigger to
> > transition state in its state machine, which is detailed in
> > https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/Product=
Documents/UserGuides/ip_cores/directcores/CoreI2C_HB.pdf
> > On page 23, row 0x28, you can see the case that (IIRC) is the
> > problematic one. It is impossible to leave this state without triggering
> > some sort of action.
> > The only way that I could see to make this work correctly was to get the
> > driver track whether or not the next message required a repeated start =
or
> > not, so as to transition out of state 0x28 correctly.
> >=20
> > Unfortunately, then the clearing of the interrupt bit causing state
> > transitions kicked in again - after sending a repeated start, it will
> > immediately attempt to act (see state 0x10 on page 23). Without
> > reworking the driver to send entire transfers "in one go" (where the
> > completion is that of the transfer rather than the message as it
> > currently is) the controller will re-send the last target address +
> > read/write command it sent, instead of the next one. That's why there's
> > so many changes outside of the interrupt handler and so many additional
> > members in the controller's private data structure.
> >=20
> > I hope that that at least makes some sense..
> >=20
> > > The driver
> > > should do repeated start when it should do repeated start.
> >=20
> > Yup, that's what I'm trying to do here :)
>=20
> I'd like to get this fix in, and Andi only had some minor comments that
> didn't require a respin. I don't want to respin or resend while this
> conversation remains unresolved.

Could you please respond to this thread? I don't want to respin without
resolving this conversation since I feel like we'd just end up having it
all over again.

Thanks,
Conor.

--2o2i0BUpv0Ef1SLM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1LkdwAKCRB4tDGHoIJi
0m1XAQCdwXDfHtbOt/o2xFRN6ijk2Q9nmrqhXvVgFV7mO2qxswD7BTQa1bc4lUaZ
wcUgcQzSvYG39FZbjfGmB8Hf2jCKPAM=
=TYme
-----END PGP SIGNATURE-----

--2o2i0BUpv0Ef1SLM--

