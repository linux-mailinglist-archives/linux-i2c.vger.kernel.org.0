Return-Path: <linux-i2c+bounces-5979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A35967739
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 17:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0477B211C8
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 15:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EEC4A01;
	Sun,  1 Sep 2024 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVgnkwRe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D6A2A1B8;
	Sun,  1 Sep 2024 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206033; cv=none; b=JrevbFu8TdLUe5KExvDNxKr++rvtwHH0jh59pnYtyHHb2IZTA/uRpCIx6oq0+lQ+s2jt1M824+EEw4cR9Zzmq7SFVz9dj3nuJEYlzkabEsyO3rvEZgadV2EqWMejdD/OqmurHGYnYr60bhdFZW+lqiY/dOCXIrfjKEwykMdrlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206033; c=relaxed/simple;
	bh=0EsLueHYpE05/k8DkjCbpekvEpEO3R1gaFSQ27++nEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h75148B/H+sAWyf/T3CTfnrYSIrrkBCVWJLqD1tDO+rK3s8r9GLm7Lrc3S0wAEpuSAE9oJ9dU2fOhKPEVQBI7T5lRpUfmjVYnl+9nDFcUNsa0TcA4G0CcvRWDAI4vG0FXFJy7KGrycpsO+oXi8qYKz+AWSRC5gvoMfhf7DoJvqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVgnkwRe; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so3438636a12.0;
        Sun, 01 Sep 2024 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725206030; x=1725810830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EsLueHYpE05/k8DkjCbpekvEpEO3R1gaFSQ27++nEk=;
        b=IVgnkwRe/XjULUeYgnT7VH/90MgpZAQuuul3GMqfCt1oi5suW42ShAvlltV8Knsebd
         AjGJMwX66SnBC6F3SjscjiSs5ECoZY7OovFs0v2YF1pJFxpBSD276dZqXxhEZa6DUfqk
         xmo/tiQPBCDkJKny6vLHVtSXP/NxBvALQRcVo1QOWUOV/a1Mc/y+lW3HNmga90kgh01+
         SPiMbRT04gMOUq+qY49BCafQZZU/L6RksH2XrY27uS5oi4T4r/JzwcCVz1+RY/gkdIm7
         gaCta8/7nLn0EWIXu8q/vLkGanI7dU9ZSQsEfFXGFhdXxfSp2BjPcblEknDC829ikH6K
         SeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725206030; x=1725810830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EsLueHYpE05/k8DkjCbpekvEpEO3R1gaFSQ27++nEk=;
        b=fgA9/bW9e77MQ1YO+I4VSsPb/vt4/MYkrczaC7mgLXlQNNR6+3FxcY1n+Lnb1QRNt+
         J4rYNhK1SIR3Y4zMBWAkA8eB+E2lp1ztFCwHVeDT5WBwZQs3Xc/2Xmp35gzDYx0HNeBZ
         SJlKWhfxDO3+CGdV57eLmkYILJ4LD9k/6vcYpxA1BC8tSkRNEyjTjmVldpNqA8Fa68/y
         HdIqNInaLXCNUeo5JxCVXr97yERzjciGwFZ7wvtfxlg0ke3ztT9cHYeXMYwx4R3cUX7C
         YYvSVncsXnXr2Y6Io8tYmWgVoBUVbq0tRpKOPoBaRpw0WbTL48FPnV5d/CsgiSnDYeax
         j6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUShbyFb7z1KolbpwWkgBZIuil8kkSZ5zzZreSoAmSQJoIYifUgrAnPz3KHlI7Hul9pHYtGp70e+lUwbV2q@vger.kernel.org, AJvYcCWLzyi56iKx7YRRupCpLQFzP4npUaUwWtNyQs5jjXYJ0c9+G/EWMcj9DPLkEZGTsVeUrSKRTLNgAG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxabyjxEkbzriwhIrE6UKd2Es2B1nU9mm7Bal+/YifC8uy5OoEG
	F+eYj8cMunFTNw0PisyS4eUy39ZrAOix4WqVdzoxTDaknkq69k0e4XRpZ3vKkKsoWDOFswxJtcx
	L/192EsFC2U0V4pAvv9fg79QoEVU=
X-Google-Smtp-Source: AGHT+IFxtrxJc3Nb0FnT4i6nTdzQ139VEu0nRk8jjN+wzgt++Y7CTCq/rWvxZ3JKTn6Ca8kjQDdxME9HlenXBNPz5Sc=
X-Received: by 2002:a05:6402:26d2:b0:5c2:1298:35ee with SMTP id
 4fb4d7f45d1cf-5c243724727mr3165583a12.2.1725206030066; Sun, 01 Sep 2024
 08:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
In-Reply-To: <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 1 Sep 2024 18:53:38 +0300
Message-ID: <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
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

On Fri, Aug 30, 2024 at 10:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
> >
> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
>
> There is no explanations "why". What's wrong with the calculations done i=
n the
> current code?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Hi Andy,

The original equations were tested on a variety of chips and base clocks.
Since we added devices that use higher frequencies of the module we
saw that there is a mismatch between the equation and the actual
results on the bus itself, measured on scope.
So instead of using the equations we did an optimization per module
frequency, verified on a device.
Most of the work was focused on the rise time of the SCL and SDA,
which depends on external load of the bus and PU.
We needed to make sure that in all valid range of load the rise time
is compliant of the SMB spec timing requirements.

This patch include the final values after extensive testing both at
Nuvoton as well as at customer sites.

BR,
Tali Perry
Nuvoton.

