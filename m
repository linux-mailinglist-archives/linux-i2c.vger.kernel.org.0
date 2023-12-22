Return-Path: <linux-i2c+bounces-942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B196C81C66D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CDB41F21AF4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2813C8C8;
	Fri, 22 Dec 2023 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b="wL/OXDoX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E18C15D
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=friendlyarm.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54f4f7e88feso2012945a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 00:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1703233357; x=1703838157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twf9Eg2g2/T8YYnh5acOeNxaC2P6fcLLy0RujKG7s3I=;
        b=wL/OXDoX3KkNmBX3i/iVPzsyNnxzbGmZuyX6KJ13yEVfAmBd8aYZoasuA8ADkS7XBQ
         IxRlME5F18X9i1TcLtl8udltT5BjjXJ67Rhf+ESX08zNkaQ9db0vniYdAqhx5cWq1vgd
         F3IPxn402K4rCSOR1gT0MJfHAIBz2Ekcdi8QF6Qs78z6mu2pr3PD1TEtc2fjoo5c/lNG
         3eK63KGvworzXKbRDx7LpDwvchBPLZt+Rnrw5f44MRbFPXaimc9m0s8MIBGjn475Bs1U
         7DDgMK94MARCWxQgmgvmgVeDAbfvtzOmwzGe7GjKZxgNYR/OMz3tQHTz5IThnv4XpKMR
         3Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233357; x=1703838157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twf9Eg2g2/T8YYnh5acOeNxaC2P6fcLLy0RujKG7s3I=;
        b=fGHSoqgU6PlBOxQZMt+hxrKyAQ9STqWC9IgvS/tglDfv1+e0dSkaNoxXuZ7mrLPz6x
         +Cq8bL9fllYX7DFMc2dhPVCN+ovJg7eHpO8rSB7a8UVYYWQK4apIvLid2df1AfbsvN7p
         xyMQTFWA3FIoS3hbpXTT8zE/XdiXJ68EAT7jTCJNeApbSeI9rHT/kzs899Y+bR1VuK4v
         4+nRmyIFuVNN+L5lCcy6uIfPsf5ztxg3gu0bK15/U0WRQy0gu87UzHzkJvqzv3dGcPSJ
         FTyj8uRfo1bw+xYIetbJvFGKNAPdeoafSgol1dV/iNMIpjlGbcg15cMu71dS+iYBSah3
         WYAA==
X-Gm-Message-State: AOJu0YzOd2j+Hrz0iTyFzFuUpqojgcGaUJulZuRT+VbqE6mXit4ALwJQ
	MY5gHOWrmgf6xnQ12bVlAXKTv3GPHRaFYxRnlWHERSLwzcI3rA==
X-Google-Smtp-Source: AGHT+IEKpY4KOAlolRlfTsU0UuQbxYqvbS0e/cdhNavcmLrXstz3zQBqMtd61wFZ5c/7mxpSm18U6wQ3/9+eO/1l9bQ=
X-Received: by 2002:a50:d7d7:0:b0:553:739e:bfac with SMTP id
 m23-20020a50d7d7000000b00553739ebfacmr452460edj.8.1703233357269; Fri, 22 Dec
 2023 00:22:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
 <ebf6cf8ec3b5befd673d295061fa2738@manjaro.org> <CAMpZ1qHUnTDQ78gdrQF9Sx_-XfLM-B+H-0bL1-+twKsno+JOvg@mail.gmail.com>
 <5e11553952c02ad20591992be4284bbd@manjaro.org> <95cc7716-ba01-e239-e7c0-eba0b7da7955@collabora.com>
 <CAMpZ1qENxWsDnvke4jMvK9tYpta3dThHUHxjDWO-u2JV+8dZdQ@mail.gmail.com> <94bf6180-8abf-777d-2dce-498efafb57c1@collabora.com>
In-Reply-To: <94bf6180-8abf-777d-2dce-498efafb57c1@collabora.com>
From: Jensen Huang <jensenhuang@friendlyarm.com>
Date: Fri, 22 Dec 2023 16:22:26 +0800
Message-ID: <CAMpZ1qH1c1WuBmj6DQZjgxS-WyiWq8cbi499tLwwD5yRDhCnWA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>, 
	Benjamin Bara <bbara93@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 1:23=E2=80=AFAM Wolfram Sang <wsa@kernel.org> wrote=
:
>
> On Thu, Dec 07, 2023 at 04:21:59PM +0800, Jensen Huang wrote:
> > Possible deadlock scenario (on reboot):
> > rk3x_i2c_xfer_common(polling)
> >     -> rk3x_i2c_wait_xfer_poll()
> >         -> rk3x_i2c_irq(0, i2c);
> >             --> spin_lock(&i2c->lock);
> >             ...
> >         <rk3x i2c interrupt>
> >         -> rk3x_i2c_irq(0, i2c);
> >             --> spin_lock(&i2c->lock); (deadlock here)
> >
> > Store the IRQ number and disable/enable it around the polling transfer.
> > This patch has been tested on NanoPC-T4.
> >
> > Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Applied to for-current, thanks!
>
> But I'd like to see the follow-up patches somewhen which have been
> discussed in this thread.

I've made some attempts, such as removing irqsave/restore, but it
didn't meet my expectations and
requires further testing. Therefore, I may not be able to submit such
a patch in the short term. However,
if someone else submits a new patch, I'd be happy to test it on rk3328/rk33=
99.


On Fri, Dec 8, 2023 at 8:17=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 12/8/23 11:53, Jensen Huang wrote:
> > On Fri, Dec 8, 2023 at 12:00=E2=80=AFAM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 12/7/23 17:10, Dragan Simic wrote:
> >>> On 2023-12-07 10:25, Jensen Huang wrote:
> >>>> On Thu, Dec 7, 2023 at 4:37=E2=80=AFPM Dragan Simic <dsimic@manjaro.=
org> wrote:
> >>>>>
> >>>>> On 2023-12-07 09:21, Jensen Huang wrote:
> >>>>>> Possible deadlock scenario (on reboot):
> >>>>>> rk3x_i2c_xfer_common(polling)
> >>>>>>     -> rk3x_i2c_wait_xfer_poll()
> >>>>>>         -> rk3x_i2c_irq(0, i2c);
> >>>>>>             --> spin_lock(&i2c->lock);
> >>>>>>             ...
> >>>>>>         <rk3x i2c interrupt>
> >>>>>>         -> rk3x_i2c_irq(0, i2c);
> >>>>>>             --> spin_lock(&i2c->lock); (deadlock here)
> >>>>>>
> >>>>>> Store the IRQ number and disable/enable it around the polling
> >>>>> transfer.
> >>>>>> This patch has been tested on NanoPC-T4.
> >>>>>
> >>>>> In case you haven't already seen the related discussion linked belo=
w,
> >>>>> please have a look.  I also added more people to the list of recipi=
ents,
> >>>>> in an attempt to make everyone aware of the different approaches to
> >>>>> solving this issue.
> >>>>>
> >>>>> https://lore.kernel.org/all/655177f4.050a0220.d85c9.3ba0@mx.google.=
com/T/#m6fc9c214452fec6681843e7f455978c35c6f6c8b
> >>>>
> >>>> Thank you for providing the information. I hadn't seen this link bef=
ore.
> >>>> After carefully looking into the related discussion, it appears that
> >>>> Dmitry Osipenko is already working on a suitable patch. To avoid
> >>>> duplication
> >>>> or conflicts, my patch can be discarded.
> >>>
> >>> Thank you for responding so quickly.  Perhaps it would be best to hea=
r
> >>> from Dmitry as well, before discarding anything.  It's been a while
> >>> since Dmitry wrote about working on the patch, so he might have
> >>> abandoned it.
> >>
> >> This patch is okay. In general, will be better to have IRQ disabled by
> >> default like I did in my variant, it should allow to remove the spinlo=
ck
> >> entirely. Of course this also can be done later on in a follow up
> >> patches. Jensen, feel free to use my variant of the patch, add my
> >> s-o-b+co-developed tags to the commit msg if you'll do. Otherwise I'll
> >> be able to send my patch next week.
> >
> > Thank you for the suggestion. I've updated the patch to your variant, a=
nd
> > as confirmed by others, reboots are functioning correctly. I measured t=
he
> > overhead of enable_irq/disable_irq() by calculating ktime in the
> > updated version,
> > and on rk3399, the minimum delta I observed was 291/875 ns. This extra
> > cost may impact most interrupt-based transfers. Therefore, I personally=
 lean
> > towards the current v2 patch and handle the spinlock and irqsave/restor=
e in
> > a follow up patch. I'd like to hear everyone's thoughts on this.
>
> Please don't use ktime for perf measurements, ktime itself is a slow API
> and it should be 200us that ktime takes itself. Also, the 0.2us is
> practically nothing, especially compared to I2C transfers measured in ms.
>
> I'm fine with keeping your v2 variant for the bug fix if you prefer
> that. Thanks for addressing the issue :)

Thank you for clarifying the situation with ktime. Honestly, I also
believe that the overhead
of disable_irq/enable_irq should be minimal. Considering that system
frequency adjustments
involve I2C transfers, I conducted this 'somewhat imprecise' measurements.


--
Best regards,
Jensen

