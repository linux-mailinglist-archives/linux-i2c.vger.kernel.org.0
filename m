Return-Path: <linux-i2c+bounces-11567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D2AE627A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 12:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A76C4C1AD0
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 10:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0AC284B4F;
	Tue, 24 Jun 2025 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DKPSsmCJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9152820A5
	for <linux-i2c@vger.kernel.org>; Tue, 24 Jun 2025 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761147; cv=none; b=ggN5uGg0IxqrI34esWbV4bRGJFyM+KlI9+xspw3V5jhbJemps0KQJQuL+wlV2DhjwmSompqHYy+EkcEDWgNXxufJL+t7jcqEaa7RsOtKWguudwkiAYyzlm0mpecPQfQafUndbomc9yBdpIsJK6c6J7GVEpsCpqpB0a0sFuwy9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761147; c=relaxed/simple;
	bh=97QjSohnV7TFRXHMlexb2Qsf3EZor5C9WloU/sDpTDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0e/tdNXBjtL8m0H6zjDg+GeuAThVQwdqunOy0AUk/oBVIRl3WacjkDHlDk7Wbq+UeYobGr3y1fWZsHRtgwYnDGMHxRr+P0a06fFqLFipiuY3kax9hZGMUMqfrilXdMsTV2JMochdBPC4qUhXkUWX7eZztRqxlOcbc2V26/016M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DKPSsmCJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73972a54919so4272746b3a.3
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jun 2025 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750761145; x=1751365945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
        b=DKPSsmCJYI4u3j3xDEmzRbcqbuU5pvweia/t4jMvPetsIKfrzXIPrrvNTS3PzEQpBw
         1yPPAZqqyjljxj+v9q1KNIURKIFiO4wKLjSa5dOxx5ti9GOt2n04+wCRtkhk2OekjSXr
         NxVW+WigMb8C0idU90PPJXZi/IkAlKIARm/izN88W77k/MxpfRprwXM9BR9l2aF5S6RW
         ld72CMfT/+cs5gAIGVsGTTWwtYnNAM4kUqwx1qiXuOTfFOOmmApBuKW+SDEoQQwaL2Vf
         nid3+yvLtPxtQKZrurWwHi4pD6ldgPRGCuCNq3NtVbF98VydTSQNCg2mBvlAeec2j937
         AUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761145; x=1751365945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qt1G4xdHuGWkr7FJJKwWLSBjfU2TU/J1+xFmV3PeoE=;
        b=Rw81ncf1jgL44EC6fOrg+wKTeDvUI7qCPTmiV/mRa9bzi17nW7uoPx3WHabLNix0uQ
         41mI4pukxIEvMdZzUc5lTaPnWcfczb/xAMCUpmhYMB8+DhJSlvNCt2TvQv9HHXRhVB2+
         IoVGcMi2knqaLjnYnPC+4gkmsJ6Bs3DnZ+C+oUJvPGThlqYm6X3Yk89GKJAes356PM3P
         WQv4dP/OcTB3f9+jPN9ncP962YrjjWyTpED4DLxQDtN0t5ltib59VNOU4ihFrT8Aw1U4
         RuB5cSgOyZH8TO7PgPyYVYrqdVTAcfUDPO86WO/Kb6sut9L7MNH05fk3Zs6TuMDR0oox
         k1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWRchNgBaam84Sat20HX3A/+L8SwluIAJKVH25yJH8RzNWttLmgjQ61xpWfXqu7SEC5tSdMvJ/Xzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtd8b7Rwy17TtO7xKUNUeeydmrRgqsYAwFLEkxh9Wa//OK7K8
	PKlI5Yv76MLD8InESl/5H1+AnS7JpvmemWsGRohZCoMFSBhkreTIiPb4eHUyuvsC5IiVXB35zS/
	lede7onIShY8gzHKcv/pluDRC7Y7iacTtmjPZX7uOhj0dtIHUB8FWq5vhiAwc
X-Gm-Gg: ASbGncuzpl0wEvs09Kn5idQsd1szJDB33Scdrjr6/NzpvMThuPUd0kbh89VUUObQBse
	TvRuuYHNZvsAGnciAWCPEt+KPt7adT11/sTo7vexlOz03/gV26lOx9QmlaDP/tC2ir54mwBkjP7
	xtffLw4SUggDNbbKkZfKrjj8WFV8Y/u2eXZIUyJiTHOSdReJ28Q4Dk9CwVLVegi3kqgCg=
X-Google-Smtp-Source: AGHT+IH4g1PvpyLx7WVlvE2Rf2SzPuo0lTBgVHeaA3gkX79aw74S2PH91wSbnem7obavXSVF9XsoiTDpbAuofP1c8K8=
X-Received: by 2002:a05:6a20:9144:b0:1f5:7f56:a649 with SMTP id
 adf61e73a8af0-22026e92ae5mr23934878637.13.1750761145008; Tue, 24 Jun 2025
 03:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com> <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
In-Reply-To: <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 24 Jun 2025 18:32:14 +0800
X-Gm-Features: AX0GCFsx2E4YDWQnsy0elvsMGQiKKzms4nqUpfwtdkeIHeCrPd6S9MlAaN8RRsQ
Message-ID: <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: change debug level in irq handler
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andi Shyti <andi.shyti@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul;

Thanks for your reply and sorry for the late reply, I was trying to
figure out why this log occurred,
 it's quite hard to reproduce.

I traced all the master and slave states, and eventually found that
the behavior matches
the description in commit b4cc1cbba519. The issue has already been
fixed in that commit
 it was caused by a state machine bug that led to the interrupt not
being handled correctly.

see: https://github.com/torvalds/linux/commit/b4cc1cbba519

(The state transitions between the master and slave here rely on interrupts=
.
 When the signal waveform is incomplete (such as during power off/on),
it may cause state errors or brief unresponsiveness, resulting in some
log prints.)

On Thu, Jun 19, 2025 at 7:18=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Jian,
>
>
> Thank you for the patch.
>
> Am 18.06.25 um 12:21 schrieb Jian Zhang:
> > In interrupt context, using dev_err() can potentially cause latency
> > or affect system responsiveness due to printing to console.
> >
> > In our scenario, under certain conditions, i2c1 repeatedly printed
> > "irq handled !=3D irq. expected ..." around 20 times within 1 second.
>
> Any idea, why you hit this error at all?
>
> > Each dev_err() log introduced approximately 10ms of blocking time,
> > which delayed the handling of other interrupts =E2=80=94 for example, i=
2c2.
> >
> > At the time, i2c2 was performing a PMBus firmware upgrade. The
> > target device on i2c2 was time-sensitive, and the upgrade protocol
> > was non-retryable. As a result, the delay caused by frequent error
> > logging led to a timeout and ultimately a failed firmware upgrade.
> >
> > Frequent error printing in interrupt context can be dangerous,
> > as it introduces latency and interferes with time-critical tasks.
> > This patch changes the log level from dev_err() to dev_dbg() to
> > reduce potential impact.
>
> Thank you for the patch and the problem description. Hiding an error
> condition behind debug level is also not good, as administrators might
> miss hardware issues. I do not have a solution. Is there something
> similar to WARN_ONCE? Maybe the level should be a warning instead of
> error, because the system is often able to cope with this?
Yeah, I'm a bit unsure as well. Maybe I can use dev_err_ratelimited()?

>
> The code is from 2017, so should be well tested actually, shouldn=E2=80=
=99t it?
>
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> > ---
> >   drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index 1550d3d552ae..38e23c826f39 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >       switch (bus->slave_state) {
> >       case ASPEED_I2C_SLAVE_READ_REQUESTED:
> >               if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> > -                     dev_err(bus->dev, "Unexpected ACK on read request=
.\n");
> > +                     dev_dbg(bus->dev, "Unexpected ACK on read request=
.\n");
> >               bus->slave_state =3D ASPEED_I2C_SLAVE_READ_PROCESSED;
> >               i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
> >               writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> > @@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >               break;
> >       case ASPEED_I2C_SLAVE_READ_PROCESSED:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> > -                     dev_err(bus->dev,
> > +                     dev_dbg(bus->dev,
> >                               "Expected ACK after processed read.\n");
> >                       break;
> >               }
> > @@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
> >               /* Slave was just started. Waiting for the next event. */=
;
> >               break;
> >       default:
> > -             dev_err(bus->dev, "unknown slave_state: %d\n",
> > +             dev_dbg(bus->dev, "unknown slave_state: %d\n",
> >                       bus->slave_state);
> >               bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> >               break;
> > @@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >
> >       /* We are in an invalid state; reset bus to a known state. */
> >       if (!bus->msgs) {
> > -             dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x=
\n",
> > +             dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x=
\n",
> >                       irq_status);
> >               bus->cmd_err =3D -EIO;
> >               if (bus->master_state !=3D ASPEED_I2C_MASTER_STOP &&
> > @@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >                       irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> >                       goto error_and_stop;
> >               } else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_AC=
K))) {
> > -                     dev_err(bus->dev, "slave failed to ACK TX\n");
> > +                     dev_dbg(bus->dev, "slave failed to ACK TX\n");
> >                       goto error_and_stop;
> >               }
> >               irq_handled |=3D ASPEED_I2CD_INTR_TX_ACK;
> > @@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               fallthrough;
> >       case ASPEED_I2C_MASTER_RX:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
> > -                     dev_err(bus->dev, "master failed to RX\n");
> > +                     dev_dbg(bus->dev, "master failed to RX\n");
> >                       goto error_and_stop;
> >               }
> >               irq_handled |=3D ASPEED_I2CD_INTR_RX_DONE;
> > @@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               goto out_no_complete;
> >       case ASPEED_I2C_MASTER_STOP:
> >               if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP)=
)) {
> > -                     dev_err(bus->dev,
> > +                     dev_dbg(bus->dev,
> >                               "master failed to STOP. irq_status:0x%x\n=
",
> >                               irq_status);
> >                       bus->cmd_err =3D -EIO;
> > @@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >               bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> >               goto out_complete;
> >       case ASPEED_I2C_MASTER_INACTIVE:
> > -             dev_err(bus->dev,
> > +             dev_dbg(bus->dev,
> >                       "master received interrupt 0x%08x, but is inactiv=
e\n",
> >                       irq_status);
> >               bus->cmd_err =3D -EIO;
> > @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void=
 *dev_id)
> >
> >       irq_remaining &=3D ~irq_handled;
> >       if (irq_remaining)
> > -             dev_err(bus->dev,
> > +             dev_dbg(bus->dev,
> >                       "irq handled !=3D irq. expected 0x%08x, but was 0=
x%08x\n",
> >                       irq_received, irq_handled);
> >
>
>
> Kind regards,
>
> Paul

Jian.

