Return-Path: <linux-i2c+bounces-2378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3087E52F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 09:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7951F2117B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 08:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D67428DC1;
	Mon, 18 Mar 2024 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="looe8aZR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EE288D7;
	Mon, 18 Mar 2024 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751710; cv=none; b=X46RpzyQ5zPm11PSJyXd7SjU4iGM3HMTEyJOTWtRUUy5aI5ObqZO14SuD0U7zU7Lg/2mqIJVKCuyJ7zMN1RygKFta/j4DKQUiRK0upSHnP0ZDCR/c7ExUSPF9lOoGK1hJjY7kYc4AcjiQe+TZ8rz46GAEeiawRXuLt8B609obz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751710; c=relaxed/simple;
	bh=owIMFRWACGRv/fYCW/6DnXxYC1Wgpz6uLqFLSH/tF08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkOBP6ts7EWGtdLhnPTQhLDvaP7OSSkBkTqz5sIJQmI6Ufg4LChkiFYdSo2jdsjVSsWFONeRb/VHbsaGMZYugyUCKC70tg3/QmUkgqXx8EOQ2NYtC7TS5vUq+W64uuuDznreYs9hlqRg8+ezWXSyrN51mjXlroKVOaIdSm1HeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=looe8aZR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513d247e3c4so3281108e87.0;
        Mon, 18 Mar 2024 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710751705; x=1711356505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpf6P/mv1nh+G+2opKvaPHFGchVDvvH/+dJJvdzBkJE=;
        b=looe8aZRPbDmG3Qkw73eTu7LJJSyPQ/+LUBI3CORf+zXFkySpPV0gJzc7biGT8WENP
         FsH4fcaL5VCitRbHLPHiCQgnGN7tVvqAoyRU3G2KIE99JMAhOga2oEqWEJAwncOHw38S
         5kwwbhz7HSKgAHyk2wkn6ATJt9x7kh4uZAD243A9IVbgKIPSGQWD5N1xFfFanb7kqeYh
         LLY7HUkJMQuoe4oFCRrAd4eVlNFFg+LeoRxPfSyC0cKRKI0WPY7cO2fj/o/FufDTiK85
         LdBCWi+1C69XiBUDDJrxFbHDaPTn3TE/iFCOYfX3ZLL3wqgOSveJL2gCbesCJN6TMhPQ
         i7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751705; x=1711356505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpf6P/mv1nh+G+2opKvaPHFGchVDvvH/+dJJvdzBkJE=;
        b=kXITKmtNZPiL+FALvm1NrBtsadd9Z0o0HTxY2+hno8rPMLJkm92FIQsVSacfX6roAt
         oM81yK/lZC8Hm0I7HyQMP9ZK3GIOrZatgl1nV7MD9uiE1XSt1ZVctMXQhUw2L5i+qZDl
         2fJBzFT213rbEKZ9YhwYGLceXsdjZmhNmqLMXMsM8xkqtFTfjrBS6u0FqqUx4V1Qkr6q
         opL4Rlpqfi8z6AQngBa114RW4XxWbGfing13vn3pA19Mn5X+3SD6I40cy4N0cRs58f/3
         +7MQBujzqhEuM/7ZUrORLz7z+boWuuvH/a9arB6wOiT5UYWreemyQUmT1/ywb+YI6vqE
         WCwg==
X-Forwarded-Encrypted: i=1; AJvYcCVeF1G4NlYG4AtHndYM4/YrTvcDr0627SdWTASXlSoy3InGZFU4tLUPq1nCZkfa/lifQGZX/4ZrIrPQtqsiURJV+JHHuGiw58rhniaXl9cchGbIXVGAu9gDzTr6bsW2knwE/um4o+j/cN9W3hEx1vYde8gV4AEJ1hJD++KPcfbEBEprQBk=
X-Gm-Message-State: AOJu0YwCFe8KBgZS8DeAc2VovGHZ0HoTTLhT/cDnSIcQZ8lI3BOa8xVX
	HhP0McLJxJJ1P31xvHYToQZ1WTx3W2AQcCfOOu5jkBQcu/1KIn1aZDe7Y4b8Fq3CAytRggN1p+c
	D/BkXqTvXNJB0825KQdy/aqPvNyI=
X-Google-Smtp-Source: AGHT+IEEoUIOrSsbRaM8/GVH+vQ+AoLpoQTnF53ccg6k+RNlmOEAGacCjS10S9CMBS6f02FWdVOZf0kD8acLyTH3OD4=
X-Received: by 2002:a19:ca10:0:b0:513:e049:3e1a with SMTP id
 a16-20020a19ca10000000b00513e0493e1amr1779164lfg.17.1710751704969; Mon, 18
 Mar 2024 01:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240317222718.3e03edb1@namcao>
In-Reply-To: <20240317222718.3e03edb1@namcao>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Mon, 18 Mar 2024 10:48:13 +0200
Message-ID: <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, 
	dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 11:27=E2=80=AFPM Nam Cao <namcao@linutronix.de> wro=
te:
>
> Cc: HID folks
>
> On 14/Mar/2024 Eva Kurchatova wrote:
> > If an I2C-HID controller level-triggered IRQ line is routed directly as
> > a PLIC IRQ, and we spam input early enough in kernel boot process
> > (Somewhere between initializing NET, ALSA subsystems and before
> > i2c-hid driver init), then there is a chance of kernel locking up
> > completely and not going any further.
> >
> > There are no kernel messages printed with all the IRQ, task hang
> > debugging enabled - other than (sometimes) it reports sched RT
> > throttling after a few seconds. Basic timer interrupt handling is
> > intact - fbdev tty cursor is still blinking.
> >
> > It appears that in such a case the I2C-HID IRQ line is raised; PLIC
> > notifies the (single) boot system hart, kernel claims the IRQ and
> > immediately completes it by writing to CLAIM/COMPLETE register.
> > No access to the I2C controller (OpenCores) or I2C-HID registers
> > is made, so the HID report is never consumed and IRQ line stays
> > raised forever. The kernel endlessly claims & completes IRQs
> > without doing any work with the device. It doesn't always end up this
> > way; sometimes boot process completes and there are no signs of
> > interrupt storm or stuck IRQ processing afterwards.
>
> It seems I2C HID's interrupt handler (i2c_hid_irq) returns immediately if
> I2C_HID_READ_PENDING is set. This flag is supposed to be cleared in
> i2c_hid_xfer(), but since the (threaded) interrupt handler runs at higher
> priority, the flag is never cleared. So we have a lock-up: interrupt
> handler won't do anything unless the flag is cleared, but the clearing of
> this flag is done in a lower priority task which never gets scheduled whi=
le
> the interrupt handler is active.
>
> There is RT throttling to prevent RT tasks from locking up the system lik=
e
> this. I don't know much about scheduling stuffs, so I am not really sure
> why RT throttling does not work. I think because RT throttling triggers
> when RT tasks take too much CPU time, but in this case hard interrupt
> handlers take lots of CPU time too (~50% according to my measurement), so
> RT throttling doesn't trigger often enough (in this case, it triggers onc=
e
> and never again). Again, I don't know much about scheduler so I may be
> talking nonsense here.
>
> The flag I2C_HID_READ_PENDING seems to be used to make sure that only 1
> I2C operation can happen at a time. But this seems pointless, because I2C
> subsystem already takes care of this. So I think we can just remove it.
>
> Can you give the below patch a try?
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 2735cd585af0..799ad0ef9c4a 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -64,7 +64,6 @@
>  /* flags */
>  #define I2C_HID_STARTED                0
>  #define I2C_HID_RESET_PENDING  1
> -#define I2C_HID_READ_PENDING   2
>
>  #define I2C_HID_PWR_ON         0x00
>  #define I2C_HID_PWR_SLEEP      0x01
> @@ -190,15 +189,10 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
>                 msgs[n].len =3D recv_len;
>                 msgs[n].buf =3D recv_buf;
>                 n++;
> -
> -               set_bit(I2C_HID_READ_PENDING, &ihid->flags);
>         }
>
>         ret =3D i2c_transfer(client->adapter, msgs, n);
>
> -       if (recv_len)
> -               clear_bit(I2C_HID_READ_PENDING, &ihid->flags);
> -
>         if (ret !=3D n)
>                 return ret < 0 ? ret : -EIO;
>
> @@ -566,9 +560,6 @@ static irqreturn_t i2c_hid_irq(int irq, void *dev_id)
>  {
>         struct i2c_hid *ihid =3D dev_id;
>
> -       if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
> -               return IRQ_HANDLED;
> -
>         i2c_hid_get_input(ihid);
>
>         return IRQ_HANDLED;

Patch applied cleanly on top of 6.7.9, builds OK (No warns, etc).

This indeed fixes the hang completely.

I modified RVVM to send millions of keystroke events per second,
and put `reboot` as a service hook in the guest. It has been continuously
rebooting without a hitch for the last 30 minutes or so (Full boot takes
around 2 seconds), whereas unpatched 6.7.9 hangs almost immediately
in such conditions (Reverted your patch & rebuilt to be sure).

Thank you very much for this! Hope to see it upstreamed soon

