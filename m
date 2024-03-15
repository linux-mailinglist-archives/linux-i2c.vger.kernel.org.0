Return-Path: <linux-i2c+bounces-2366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEBB87CD61
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 13:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 705C428225B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD634249F1;
	Fri, 15 Mar 2024 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUam8kjt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355E22F1D;
	Fri, 15 Mar 2024 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710506748; cv=none; b=nHSyDUh6JVE20brHlvIoMpOVRNWpa6k6RQ2GPmtoRVc73K8FF1exOqPAV5k/pxn0yAPffT/ozB+fWaA4yVLLRuB0rohTzxi8uTKAUUnMWUjCvrHGcuO9JxUMFY2Q5Gl5s0rJYrLU6zxRWeioZyiHELKgRvIqeIw2y/B/16a2xHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710506748; c=relaxed/simple;
	bh=3ebn+xDEz/kApOIo2PqJQ1LGPDZrqrbinFBG2nhEO4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYk9ub18uhWFbglA8zyJjoBt+CnIrk21P9nfUIgPNjrzz16UQsJwXMbfULDjxqQdJrcozzttNmcFpOn5jkT0i1ORmA73PQqRts5EOv2oJPt6IRBPL5Kvm933BxlfUdydHn/tjCh8YkuF0Kmjqadsv3nOCfrHfZasiNYg8dxp6Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUam8kjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2E7C433F1;
	Fri, 15 Mar 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710506747;
	bh=3ebn+xDEz/kApOIo2PqJQ1LGPDZrqrbinFBG2nhEO4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUam8kjtL+Vr1KbYvq8Lhu9Omo2sl/D3fUYP9PcLJcP7eq1UGIDOxr6MAtYi+PwOz
	 IGv5c2PoMrcfFgoRMgR1xYzRjMNpJBJvvYQ55j8XmGZmt+48aE1gdysQI3IoEtLEp3
	 Z8XXqS+YBNjysOPyK7DC2wl79JKXhZONFe6A2WvpYz2etlJcuvyhBu0jAPJEDHNVlh
	 T0O3XrSPnRoFBdddKHTdpy+UOzNVQO/xGHQcDry/wax2NQJqEo5SiMBg/93/aVitJO
	 roUHUNv6vFStMyLt+lMao+fUAk0RVs7J8ID287nnibrhBOz22Dk6Ub9ziu4atKGugF
	 46uOjQ3nS01Fg==
Date: Fri, 15 Mar 2024 12:45:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240315-iguana-glacier-6dc38774fb65@spud>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240314-sublevel-jargon-4234df3fa614@spud>
 <CA+eeCSPgxB9VCyB9fmEy4A1rEynNFv34LYA1UDBNT8Po=ag28w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cE8m9TG3tVI3eCoQ"
Content-Disposition: inline
In-Reply-To: <CA+eeCSPgxB9VCyB9fmEy4A1rEynNFv34LYA1UDBNT8Po=ag28w@mail.gmail.com>


--cE8m9TG3tVI3eCoQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 05:33:06AM +0200, Eva Kurchatova wrote:
> On Thu, Mar 14, 2024 at 11:46=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > This immediately seemed odd to me, but I have no reason to disbelieve
> > you, given you say this was discovered in RVVM which is an emulator and
> > you should know whether or not registers are accessed.
> > The very first action taken by the ocores i2c controller driver when it
> > gets an interrupt though is to read a register:
> >
> >         u8 stat =3D oc_getreg(i2c, OCI2C_STATUS);
> >
> > I would expect that this handler would be called, and therefore you'd
> > see the register read, had the probe function of that driver run to
> > completion. I'd also expect that the interrupt would not even be
> > unmasked if that probe function had failed.
> > In your case though, you can see that the interrupt is not masked,
> > since it is being raised and handled repeatedly by the PLIC driver.
> > Has the i2c controller driver probed in the period of boot that you say
> > this problem manifests?
>=20
> There is not a single problem with the ocores I2C driver. I2C-HID device
> itself has a separate IRQ line which is level-triggered.

Ah, I see. I am still unsure as to how that interrupt is handled by the
PLIC driver before the user for it (i2c-hid) requests it.


> This is to signal the host that there is input available without polling,
> since I2C is a master-driven bus with no "data available" notifications.
> So in reality the I2C-HID driver should handle the interrupt; Then it
> uses the I2C controller to access I2C-HID slave registers (via I2C) to
> read the incoming HID input report. I2C controller interrupts are unrelat=
ed;
> it's the link between the HID device and the host and it doesn't seem
> to be touched at all inside the I2C-HID IRQ handler (So it's just a pair
> of Claim/Complete actions). I2C ocores interrupts are not generated
> (and shouldn't) at that point, because no I2C transfer was initiated at a=
ll.
>=20
> There is a way to make I2C-HID device edge-triggered, in RVVM
> emulation code, but it's not actually spec compliant. It gets rid of the
> hang too; However the same Claim/Complete actions without any
> handling inside the IRQ handler are observed at least once, which
> technically means a lost interrupt (Pressing a key somewhere early in
> boot thus doesn't propagate the keypress to the guest until you press
> another key later, after which both HID reports are read), so it's not
> a way how I'd like to mitigate this in the emulator code.
> I, and another developer from Haiku OS team (X512), are almost sure
> this is a kernel bug related to level triggered IRQs with PLIC or a
> specific incompatibility of PLIC/I2C-HID (Not the ocores I2C controller).
>=20
> This hang is not reproducible with a Haiku OS guest in any way and
> most of the drivers involved seem to be FreeBSD based or written by
> X512 (Specifically the PLIC and I2C-HID drivers are). This person also
> believes that this Claim/Complete behavior on PLIC side without any
> other actions made in between is erroneous kernel behavior too.

Maybe it is, I've re-added Thomas and Samuel to CC as I said before that
they know much more than I about the code in question. I was just
pointing out that the behaviour you were seeing is inconsistent with
what I have come across myself for interrupts that have not had a user
request them.

> I am open to discussions what specifically could be wrong with the VM
> since one of my end goals is to just make HID devices work without
> issues there; However if a simple 2-line patch (which I'm not entirely
> sure of it's implications) that removes return path at line 223 in PLIC
> driver resolves the issue (I kept a guest in a 24 hr reboot loop whilst
> spamming fake I2C-HID input and no hang was observed), then it does
> lead me to belief that it's at least not some blatant emulation issue.
>=20
> I came here to collect some kernel devs opinions since we are
> debugging this for some 2 weeks already. Your initial understanding
> that something is wrong with ocores I2C controller is not what I meant,
> sorry for lacking in my explanation.
>=20
> >Are interrupts unmasked by default on RVVM?
>=20
> By default all PLIC ENABLE registers are set to zero. All PRIO,
> THRESHOLD registers are zero on reset. So all PLIC state is
> simply zeroed on reset, as can be seen here:
> https://github.com/LekKit/RVVM/blob/f81df57a2af77cbae25fd3cc65d07106d9505=
e23/src/devices/plic.c#L265
>=20
> > Have you checked that this actually affects any actual hardware?
>=20
> I might very soon if no one has immediate ideas what is wrong;
> Problem is that I don't have hardware that exposes PLIC IRQ lines to
> the user. It might be possible to use some FPGA or at least reproduce
> in other simulators.
>=20

--cE8m9TG3tVI3eCoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfRC+AAKCRB4tDGHoIJi
0sZQAQCs8x+fdD7uyy/sSkILvwAQeA/OzbkXq4IeDm/4oaopLQD4p7m8YJuT6z7U
4VGyV9mSNWX9O/PzZB7e5M5+Zqy1Bw==
=1BNN
-----END PGP SIGNATURE-----

--cE8m9TG3tVI3eCoQ--

