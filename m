Return-Path: <linux-i2c+bounces-2380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A4D87E558
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 10:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C50621F22442
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 09:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1039D28DD3;
	Mon, 18 Mar 2024 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Bk5ws+Zg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BN4mcNZW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5B28DC9;
	Mon, 18 Mar 2024 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710752475; cv=none; b=Q7RWJYczDyfrakL0TjJGbxc4iEsxSqefQcFUvoi2vGGP9Xu3PV17JJd2UMz5Nm+q2q77GxgrUyjtURdhephoDSgxWRx0rXyyYAhuwlvF1uL+74/Givxx/v0GXOo4Yw3qfDlyxqKrEfWnbEbMyWT1q9aoRx6A9S2Y+oZqMcWOx7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710752475; c=relaxed/simple;
	bh=2o4/pJGqG1gzwjf7h/MbArnmzBbXAOBen6beh+yYECQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgTZuHNyWF/aupvX+6+gMNspvo+MMW0RwGVe/Z+DPszUHDgNNxrUhLTm3FgHLjlO7EEza4sIFfpCJGQFWqGciDv1M1G9JNrVhPomaRq5EekyHCaR+Cn20AcbfnBjOS2tae1ibsM2hbfG8gP3vDCjqdmkxi3/fwiDJHZo+/eqjh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Bk5ws+Zg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BN4mcNZW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 18 Mar 2024 10:01:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710752469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8EiV2gzXftggen6GL4Tj807WdurcECVI7Wmk1Mm55w=;
	b=Bk5ws+ZgAtsMmV/Bg61xGm2mYCJmRY1ttMRepbifFjRw2oBPFnjigwB9BMyTt1v13+r6GR
	i4eVBe6dZDPGIGv7sVGTx5zwrxqwKAoKKOzmUEnz3+AUG+5EntntcD52cgkuqb6yxg6pVD
	JWRo3UZvmSoao/JhGhxziakluoCDkKobdNXf546RjEzTRBij65hL4KzUTlPc43gohDiGEF
	4sfmHgdsNV9yNq2UA6ID0c1jDk6AKprxiA7Pg2hElMPTw5ZEaPkMTWPPn58hipDXUmqEun
	2whEubn+xf0z1U1NbIK5W2nM5K1jTwQFk/gu3/RbAsT15gVzyYv7av2DN+sE+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710752469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8EiV2gzXftggen6GL4Tj807WdurcECVI7Wmk1Mm55w=;
	b=BN4mcNZW9LJt+7aw5DLrhZ/IG4G7TFzgzFAyO7MnMOJYNUH5J4LApJkR/eC35IYIKmeomT
	GZcT9f5k6/I/x6BA==
From: Nam Cao <namcao@linutronix.de>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
 linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com,
 dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240318100108.4fafd72b@namcao>
In-Reply-To: <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
	<20240317222718.3e03edb1@namcao>
	<CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18/Mar/2024 Eva Kurchatova wrote:
> On Sun, Mar 17, 2024 at 11:27=E2=80=AFPM Nam Cao <namcao@linutronix.de> w=
rote:
> > It seems I2C HID's interrupt handler (i2c_hid_irq) returns immediately =
if
> > I2C_HID_READ_PENDING is set. This flag is supposed to be cleared in
> > i2c_hid_xfer(), but since the (threaded) interrupt handler runs at high=
er
> > priority, the flag is never cleared. So we have a lock-up: interrupt
> > handler won't do anything unless the flag is cleared, but the clearing =
of
> > this flag is done in a lower priority task which never gets scheduled w=
hile
> > the interrupt handler is active.
> >
> > There is RT throttling to prevent RT tasks from locking up the system l=
ike
> > this. I don't know much about scheduling stuffs, so I am not really sure
> > why RT throttling does not work. I think because RT throttling triggers
> > when RT tasks take too much CPU time, but in this case hard interrupt
> > handlers take lots of CPU time too (~50% according to my measurement), =
so
> > RT throttling doesn't trigger often enough (in this case, it triggers o=
nce
> > and never again). Again, I don't know much about scheduler so I may be
> > talking nonsense here.
> >
> > The flag I2C_HID_READ_PENDING seems to be used to make sure that only 1
> > I2C operation can happen at a time. But this seems pointless, because I=
2C
> > subsystem already takes care of this. So I think we can just remove it.
> >
> > Can you give the below patch a try?
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i=
2c-hid-core.c
> > index 2735cd585af0..799ad0ef9c4a 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -64,7 +64,6 @@
> >  /* flags */
> >  #define I2C_HID_STARTED                0
> >  #define I2C_HID_RESET_PENDING  1
> > -#define I2C_HID_READ_PENDING   2
> >
> >  #define I2C_HID_PWR_ON         0x00
> >  #define I2C_HID_PWR_SLEEP      0x01
> > @@ -190,15 +189,10 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
> >                 msgs[n].len =3D recv_len;
> >                 msgs[n].buf =3D recv_buf;
> >                 n++;
> > -
> > -               set_bit(I2C_HID_READ_PENDING, &ihid->flags);
> >         }
> >
> >         ret =3D i2c_transfer(client->adapter, msgs, n);
> >
> > -       if (recv_len)
> > -               clear_bit(I2C_HID_READ_PENDING, &ihid->flags);
> > -
> >         if (ret !=3D n)
> >                 return ret < 0 ? ret : -EIO;
> >
> > @@ -566,9 +560,6 @@ static irqreturn_t i2c_hid_irq(int irq, void *dev_i=
d)
> >  {
> >         struct i2c_hid *ihid =3D dev_id;
> >
> > -       if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
> > -               return IRQ_HANDLED;
> > -
> >         i2c_hid_get_input(ihid);
> >
> >         return IRQ_HANDLED; =20
>=20
> Patch applied cleanly on top of 6.7.9, builds OK (No warns, etc).
>=20
> This indeed fixes the hang completely.

Nice! I assume I can add
    Reported-and-tested-by: Eva Kurchatova <nyandarknessgirl@gmail.com>
to the patch?

> I modified RVVM to send millions of keystroke events per second,
> and put `reboot` as a service hook in the guest. It has been continuously
> rebooting without a hitch for the last 30 minutes or so (Full boot takes
> around 2 seconds), whereas unpatched 6.7.9 hangs almost immediately
> in such conditions (Reverted your patch & rebuilt to be sure).
>=20
> Thank you very much for this! Hope to see it upstreamed soon

Thank you for the report, your investigation helped a lot.

I am still confused why RT throttling doesn't unstuck the kernel in this
case. I will consult some people and investigate more on this. But I think
this patch is good on its own, so I will send a proper patch shortly.

Best regards,
Nam

