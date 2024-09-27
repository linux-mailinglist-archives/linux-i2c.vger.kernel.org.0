Return-Path: <linux-i2c+bounces-7038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B681987CCB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 04:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2C8284CE7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 02:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91352249F5;
	Fri, 27 Sep 2024 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/lKUYEl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5E290F;
	Fri, 27 Sep 2024 02:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727402511; cv=none; b=DPTw8whlGfCVvfgpy7u4RPVjnguhQWTQ/D0uRVY3K02RAfx63g0gjaL+EkE1xRvbMPmKLpfkGJR43tQ0pm7KbGUgmLP4R9tUiaaE/dRIUNBDVTJ27305HT/N6KucRH7vvgehHfD7UUDJPbgU/5bghuqKbKHn4NmnpUPcq8EjGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727402511; c=relaxed/simple;
	bh=PY7ysE5TaL+rWDsnEUoyV4eZVnhDLgDtILseSmL7Dgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwqPs/KuGZ3ieXEpUSpYJtwKbymaVMuOo6zELojp82fXZDFTEaaNXfkRvwyMdjIjTr4BclDydxKBQ53CgpI6wNnBzPjqOFXZT4cUTY4UE5gma0XzzfbIFjSLw11iDTRKjExq79guwnkqm/zwD+LNOyzWyVko8qaGqcERou1qXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/lKUYEl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso105885766b.0;
        Thu, 26 Sep 2024 19:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402508; x=1728007308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkTECjsLGOP17IwUdNFjlpHyC8AHloYdla7ykRMJQA0=;
        b=V/lKUYEluawQLDgZxjWQ+LzDqeHKo/Ho/4lK9flQt5bL/mBV8Gq+7sV7kG+9XfKcP9
         EtwPvzCwxVaXPlTU6D2UMgWY7cAtPCoK4hRhJ986iIQNE4FulHrHoI7izeNiGeLBN3Ia
         XOo88i+IAfx470rvbSkfI8Xf4nmxfjNor0+CmfAY8sjYLqJRmu5HWQ42XZLYNp74ZozM
         zV5w+v/0I8ED0hESNMzGGPg5JfG8GF4tpZQ6ioL3XDeRWa3IkxafzD9Chc0QXSxU+bD0
         6rN4nc2X98SVyWg1koZazfyViDMwmRSfeTal/4tMFQ42yzAmgXfrtpkz1ikljUFCsdev
         M7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402508; x=1728007308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkTECjsLGOP17IwUdNFjlpHyC8AHloYdla7ykRMJQA0=;
        b=akv727SdC+fZCDCsQOGGsW/7raZwsZ2vFEh5wy0lR/XiqFx1CJbCPYuNN6i5KzaC7u
         eDL2BtNYCFz0/N3hqmpwOHdE6KdLA90v/N5UN7YGN3H3vOLz999g4jy4dUaMaltyeYUK
         MNeEk92l6CQZja1isPDBs/YgFzzkfCwrE4DsBoaldIK8PSgD3y+mLZbycSn4vX68Q8v2
         2E3iDScSuMRJ8CxmhEzvW/vyiYLBVno6E62KnZALf93909lE22VMnjPiFsH/8jgV56eO
         CHZOIM4sD8MPj+JNiGcu7JVV3F/GPjYXi7NoBCPxLIRzg10403FsEbgtz2ZS/uvk3DbL
         TdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWke3sc6clzEF/SabLtG/p4PVI3LTu3j+THlZVUGTSYxb3qe04PzDErcLG0/wTyNkNWMKxqUfeiRF3DH+2y@vger.kernel.org, AJvYcCXeBjaLCuE7n+/ky7IwhLl31HcUZe9LUFyb/oqyYLFUtYmbnyY5BekGEm5bOWxiZwkZ7RtB5e/vd+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdYLPFG6OnfHDymCYIVdCqGCRNn8FwOAC2ifrXPPgecCuCfnK
	tGg4mIQkP0rWvLowXYvT3oq/zBOEq9meY559ui11DdkNgoD+vpavcfoytr6o8++W62GIKA6ayKl
	dasaH0wh53dSEQE9pBWnlyrjeEA==
X-Google-Smtp-Source: AGHT+IEZoctL8CVImNJMZdfqDrbfmGmv0+KZg1Q9jtDnJdIOA4H9s6GPic5UlvyL1JjK5tLPN+4Y+w5mAOimJVKqtg8=
X-Received: by 2002:a17:907:d1a:b0:a8d:592d:f56 with SMTP id
 a640c23a62f3a-a93b167a9ffmr512809166b.31.1727402507806; Thu, 26 Sep 2024
 19:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-3-kfting@nuvoton.com>
 <5mxsciw6443k5rlpymrs7addvme53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue>
In-Reply-To: <5mxsciw6443k5rlpymrs7addvme53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Sep 2024 10:01:36 +0800
Message-ID: <CACD3sJZuy_6e8hgY9_+gJpHFpOZx_KY=hAb9CY0PtqYP=FMhMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] i2c: npcm: use a software flag to indicate a BER condition
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your feedback.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> patch looks good, but...
>
> On Fri, Sep 20, 2024 at 06:18:16PM GMT, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > If not clearing the BB (bus busy) condition in the BER (bus error)
> > interrupt, the driver causes a timeout and hence the i2c core
> > doesn't do the i2c transfer retry but returns the driver's return
> > value to the upper layer instead.
> >
> > Clear the BB condition in the BER interrupt and a software flag is
> > used. The driver does an i2c recovery without causing the timeout
> > if the flag is set.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2b76dbfba438..2d034503d8bc 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -334,6 +334,7 @@ struct npcm_i2c {
> >       u64 nack_cnt;
> >       u64 timeout_cnt;
> >       u64 tx_complete_cnt;
> > +     bool ber_state;
>
> I need some comment here, what is this ber state? You described
> it in the commit log, but people won't be browsing much of the
> commit log rather than the code itself.
>
> You could perhaps mention the meaning as:
>
>         bool ber_state; /* brief description */
>

Understood. I'll add some descriptions.

> and...
>
> >  };
> >
> >  static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
> > @@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i=
2c *bus)
> >       if (npcm_i2c_is_master(bus)) {
> >               npcm_i2c_master_abort(bus);
> >       } else {
> > +             bus->ber_state =3D true;
> >               npcm_i2c_clear_master_status(bus);
> >
> >               /* Clear BB (BUS BUSY) bit */
> > @@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_ada=
pter *_adap)
> >               dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not s=
tuck",
> >                       bus->num, bus->dest_addr);
> >               npcm_i2c_reset(bus);
> > +             bus->ber_state =3D false;
> >               return 0;
> >       }
> >
> > @@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_ada=
pter *_adap)
> >               if (bus->rec_succ_cnt < ULLONG_MAX)
> >                       bus->rec_succ_cnt++;
> >       }
> > +     bus->ber_state =3D false;
> >       return status;
> >  }
> >
> > @@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >
> >       } while (time_is_after_jiffies(time_left) && bus_busy);
> >
> > -     if (bus_busy) {
> > +     if (bus_busy || bus->ber_state) {
>
> /*
>  * Check the BER (bus error) state, if it's true means that blah
>  * blah blah, while when it's false blah blah blah and we should
>  * or should not do blah blah blah
>  */
> if (bus_busy || bus->ber_state) {
>         ...
> }
>

Understood. Your comments will be addressed.

> Thanks,
> Andi
>
> >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> >               npcm_i2c_reset(bus);
> >               i2c_recover_bus(adap);
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone

