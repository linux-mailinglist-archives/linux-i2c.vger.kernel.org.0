Return-Path: <linux-i2c+bounces-6353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3729705E4
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 10:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933C91C20E90
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125C45FBB1;
	Sun,  8 Sep 2024 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/mS/vFh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B4727442;
	Sun,  8 Sep 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725785705; cv=none; b=IQcEtOMohDkBCNcDH5HRvqHdO/5ylrb/ChLXEwcmDZjjUd6Asp7NGf95MPuvzhJtA0MZOcJb2NCFaC1fWKygo6pkqwaaVaQkpXy0zVrAhUDRTTAwI3zBCVBTuoSsRSL1PJ86Cd9DYXVPCY225jW7qs/ZZDBQjypczsukBG3DFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725785705; c=relaxed/simple;
	bh=9JD1vPA6nENu4r8g78FFrQX/VYp2ni6MK1UWczeROl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlLXknYGMOeOMqLT/6jtPH/qSRmYKJv76e2PLpsL+QexCNYqBARZX0WngjM1FGKZVyuNXLCsmbYqAnqNHwHjER7Y1KM+EBuCbpOvVg4FHnoSWYQa11AR5uVXOi+DAB6cbCHsyNWTnZDp6K0vaDDM8dU1bcJXqtGCxZ75x9SSPv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/mS/vFh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so138696066b.1;
        Sun, 08 Sep 2024 01:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725785702; x=1726390502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq5WJ2pHAHyT2QwFtM7kzrtPjs0zR32si2qK77Z+LEw=;
        b=T/mS/vFh5ktiecqnJiUXDuzb/F2K+uUFyQzemOkzlcaXJQEcjhKMfJ81ys1a4Y8Cqt
         9Te5Ioy9k0p3xJZp9JeZe+Uxoq28rHywGYYFOezk4O4kVxJEY+WljFSaA5R8w3uqRR2k
         8AUW7zWaxS5d6W0nCZFhuGLilFYNLGm9NFt0+yPEonDgErDVWA9Y9oKCtFPlu3AhB5GS
         DbW3Hky8/67x3rM3GCe19JKeUUvhGsBZdwao9YHb9A7uccniTaTeuuWCXSDIZWDYwVSl
         6pzJHfWLfv2DsoEDZ7+y24HK0OZpO5e+sWuvyfS4yeFp47QFsCzIc3ivPvRhs+YS6ENF
         65Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725785702; x=1726390502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq5WJ2pHAHyT2QwFtM7kzrtPjs0zR32si2qK77Z+LEw=;
        b=JcD7XZjhAkQy9NTnatczDjzUjhq2keZYfWsu6sHOyHJfxMb+aY1FMQtwDywGlD7ynS
         M0FfzDnjmV9Op6z0LLOQr7EaV3yMpBQ6JJRrf10rXVYYAnkf1rApgV3lzJk/ijocvl1Z
         xMFmxENlR+iawO1TP3TK6gxBc34XwPgtYsD0bnP20gBx8GOsHE7b4Xm1IU7WjRlrq3MV
         N9RfqSTxebi+lN+PrVDbqd+wcEZBMSahQ4KK+CjDdj/EdYDVTqjiH8jIN5vcPDBxs0pF
         LJ8N/PtqBW3V9+GqVmmeWq4Me/Y0gpS4KDPD5FskRY6zvqcYjzQS2m2gq1gH5HvhV5rV
         QVVA==
X-Forwarded-Encrypted: i=1; AJvYcCU5yAy6e477wTno6fN84PwINA3CauEuRQIyfqiqox5XaGliZTnH/c9VzGW4pBVBVL/E0tZycXs/ck5nVsfs@vger.kernel.org, AJvYcCXZlN7XT6UikV52aWV0wmwnLs/zm2w/2t+9rwQjbg6NTYBbSznaQthoJobww2SMqecbnjjqurNaAHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAHOkjn5XurE457iwj15pJx8Q4aREszD6rQpaXqR6Rkl/wJHn
	36kjmMza1rWlRi2kosmoxuLWdHWOQAc2V6QJlhM08kXla2KiBWkdQ5PADJrj2QD55JC7GrwGWcz
	uwfBMdi6G344BYH0JGmViLtsik24=
X-Google-Smtp-Source: AGHT+IGh/mOI9VQapbeOWVjXZtarUc22MPB8ax7nNK0XjS+Txuppy6n3+QBXGfNuyoB8Y/EZ24dbDWaIDHrHw4x8upI=
X-Received: by 2002:a17:907:7b95:b0:a72:5967:b34 with SMTP id
 a640c23a62f3a-a8a863f664amr914111866b.22.1725785701564; Sun, 08 Sep 2024
 01:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com> <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
 <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
In-Reply-To: <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 11:54:50 +0300
Message-ID: <CAHb3i=uN5jtczEjHhzwL9E9c6d9rU-QZckhU79KzPuY5n81CyA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, tmaimon77@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Sep 2, 2024 at 3:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Sep 01, 2024 at 06:53:38PM +0300, Tali Perry wrote:
> > On Fri, Aug 30, 2024 at 10:19=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> > > > Modify i2c frequency from table parameters
> > > > for NPCM i2c modules.
> > > >
> > > > Supported frequencies are:
> > > >
> > > > 1. 100KHz
> > > > 2. 400KHz
> > > > 3. 1MHz
> > >
> > > There is no explanations "why". What's wrong with the calculations do=
ne in the
> > > current code?
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> > >
> > Hi Andy,
> >
> > The original equations were tested on a variety of chips and base clock=
s.
> > Since we added devices that use higher frequencies of the module we
> > saw that there is a mismatch between the equation and the actual
> > results on the bus itself, measured on scope.
> > So instead of using the equations we did an optimization per module
> > frequency, verified on a device.
> > Most of the work was focused on the rise time of the SCL and SDA,
> > which depends on external load of the bus and PU.
> > We needed to make sure that in all valid range of load the rise time
> > is compliant of the SMB spec timing requirements.
> >
> > This patch include the final values after extensive testing both at
> > Nuvoton as well as at customer sites.
>
> But:
> 1) why is it better than do calculations?
> 2) can it be problematic on theoretically different PCB design in the fut=
ure?
>
> P.S. If there is a good explanations to these and more, elaborate this in=
 the
> commit message.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for your comments,

1) The equations were not accurate to begin with.
  They are an approximation of the ideal value.
  The ideal value is calculated per frequency of the core module.
2) As you wrote , different PCB designs, or specifically to this case
: the number and type of targets on the bus,
   impact the required values for the timing registers.
   Users can recalculate the numbers for each bus ( out of 24) and get
an even better optimization,
   but our users chose not to.
  Instead - we manually picked values per frequency that match the
entire valid range of targets (from 1 to max number).
  Then we check against the AMR described in SMB spec and make sure
that none of the values is exceeding.
  this process was led by the chip architect and included a lot of testing.

Do we need to add this entire description to the commit message? It
sounds a bit too detailed to me.

Thanks,
Tali Perry, Nuvoton

