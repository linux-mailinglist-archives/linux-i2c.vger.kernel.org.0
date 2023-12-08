Return-Path: <linux-i2c+bounces-682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CD809EA4
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 09:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E98E1C209D7
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735FF11185;
	Fri,  8 Dec 2023 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b="AVhC9k83"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CB51736
	for <linux-i2c@vger.kernel.org>; Fri,  8 Dec 2023 00:54:00 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54dccf89cfdso2066228a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 08 Dec 2023 00:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1702025639; x=1702630439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZznzSpsp3ftowq6O5Q/Cg5o9GO0Eay4RAUCcfPR/vuE=;
        b=AVhC9k83gKxJJxcAdzBoWahkcE4gAJu5o35ldYSxUWTwhNWFeCORdCVNbPnQNKiMtS
         L5j1HgpPnOg0r5fxmWG1MEoXLxY4rFiGt5r0pHhkpSOWxav1ejVsu33AJmAIrNPP2Rw/
         NHcgqu6DXS8t5POAF6AtsGzoryUyItMEQ76kMibCHr/0zNSPaTRQsA598b65RaC6pJne
         JgOh33vJIZEjA7yD5+QeD2AeQwfK3YAGwVlKYvRzAx0x7BJ/Iu+2rvd+6yJtNLJI86za
         KDk7Xgt2NLPxGh4bd2Q+UL8KjFquxxuqhgK8XsdohDnhWEPXITQ/1f7bV4wIor8mQ5Ud
         eJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702025639; x=1702630439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZznzSpsp3ftowq6O5Q/Cg5o9GO0Eay4RAUCcfPR/vuE=;
        b=QNoS8Vc2ZDcpQAbUHV8JGi7neSDhDO5PBu+RSZ+pmTz3mvYQgYxB1Na3gL0L1ucOw/
         4HmosRkyrmQcqVdKUy0ww1OtsRZRG+JyvfOL5Sl4FaLQp+YTvRq2fKS+CveJ6OOrHMGD
         h/v01GDURpb02/DEBQFXLaAsycBYSHdNqMk8Nc0W8MpAqIqU5x+4UIC/VPVSehY2SN3Z
         9bAaX/Kaj5jqnn4kHhO554gudXK6hAw8iEy2vMn9I6YvBncIcTKHsolJMcVZuTW02+yn
         mW+VeIaZudV7QU64Vao+WSBT0ZyPUJ5XaxUsQpFQbI7Cq23UurJx0KfgRG+3q6fyf/wc
         sLiA==
X-Gm-Message-State: AOJu0Ywdofg6heEKRvNJGQyo7td7dTYwQK8AIpxRC7MpGSmQkIJXXw7T
	C9LIZ+axb+IAwPXAGFzJrc4mf30qDXMekfXAJcqbBSLf+pTUbUIU4WHYBw==
X-Google-Smtp-Source: AGHT+IG6wWYNBrrrHbbpkx0reOlvqmH2SLrfVA+FsX8/gXSUGmBCwnqS4MaSnlIwYSWUKYoWn9oTxFidRIiBD1QBaxM=
X-Received: by 2002:a50:a6d6:0:b0:54c:4837:9a9f with SMTP id
 f22-20020a50a6d6000000b0054c48379a9fmr2315391edc.70.1702025638968; Fri, 08
 Dec 2023 00:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
 <ebf6cf8ec3b5befd673d295061fa2738@manjaro.org> <CAMpZ1qHUnTDQ78gdrQF9Sx_-XfLM-B+H-0bL1-+twKsno+JOvg@mail.gmail.com>
 <5e11553952c02ad20591992be4284bbd@manjaro.org> <95cc7716-ba01-e239-e7c0-eba0b7da7955@collabora.com>
In-Reply-To: <95cc7716-ba01-e239-e7c0-eba0b7da7955@collabora.com>
From: Jensen Huang <jensenhuang@friendlyarm.com>
Date: Fri, 8 Dec 2023 16:53:47 +0800
Message-ID: <CAMpZ1qENxWsDnvke4jMvK9tYpta3dThHUHxjDWO-u2JV+8dZdQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>, 
	Benjamin Bara <bbara93@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 12:00=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 12/7/23 17:10, Dragan Simic wrote:
> > On 2023-12-07 10:25, Jensen Huang wrote:
> >> On Thu, Dec 7, 2023 at 4:37=E2=80=AFPM Dragan Simic <dsimic@manjaro.or=
g> wrote:
> >>>
> >>> On 2023-12-07 09:21, Jensen Huang wrote:
> >>> > Possible deadlock scenario (on reboot):
> >>> > rk3x_i2c_xfer_common(polling)
> >>> >     -> rk3x_i2c_wait_xfer_poll()
> >>> >         -> rk3x_i2c_irq(0, i2c);
> >>> >             --> spin_lock(&i2c->lock);
> >>> >             ...
> >>> >         <rk3x i2c interrupt>
> >>> >         -> rk3x_i2c_irq(0, i2c);
> >>> >             --> spin_lock(&i2c->lock); (deadlock here)
> >>> >
> >>> > Store the IRQ number and disable/enable it around the polling
> >>> transfer.
> >>> > This patch has been tested on NanoPC-T4.
> >>>
> >>> In case you haven't already seen the related discussion linked below,
> >>> please have a look.  I also added more people to the list of recipien=
ts,
> >>> in an attempt to make everyone aware of the different approaches to
> >>> solving this issue.
> >>>
> >>> https://lore.kernel.org/all/655177f4.050a0220.d85c9.3ba0@mx.google.co=
m/T/#m6fc9c214452fec6681843e7f455978c35c6f6c8b
> >>
> >> Thank you for providing the information. I hadn't seen this link befor=
e.
> >> After carefully looking into the related discussion, it appears that
> >> Dmitry Osipenko is already working on a suitable patch. To avoid
> >> duplication
> >> or conflicts, my patch can be discarded.
> >
> > Thank you for responding so quickly.  Perhaps it would be best to hear
> > from Dmitry as well, before discarding anything.  It's been a while
> > since Dmitry wrote about working on the patch, so he might have
> > abandoned it.
>
> This patch is okay. In general, will be better to have IRQ disabled by
> default like I did in my variant, it should allow to remove the spinlock
> entirely. Of course this also can be done later on in a follow up
> patches. Jensen, feel free to use my variant of the patch, add my
> s-o-b+co-developed tags to the commit msg if you'll do. Otherwise I'll
> be able to send my patch next week.

Thank you for the suggestion. I've updated the patch to your variant, and
as confirmed by others, reboots are functioning correctly. I measured the
overhead of enable_irq/disable_irq() by calculating ktime in the
updated version,
and on rk3399, the minimum delta I observed was 291/875 ns. This extra
cost may impact most interrupt-based transfers. Therefore, I personally lea=
n
towards the current v2 patch and handle the spinlock and irqsave/restore in
a follow up patch. I'd like to hear everyone's thoughts on this.

--
Best regards,
Jensen

