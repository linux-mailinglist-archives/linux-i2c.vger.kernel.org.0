Return-Path: <linux-i2c+bounces-3104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D798B09EE
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42582841B0
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 12:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C92158DC2;
	Wed, 24 Apr 2024 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxDiKL9I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39EC1422AF;
	Wed, 24 Apr 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713962698; cv=none; b=ChP0WhOVaaTirECZjUes2qn1IYw+N3U4siPtHt/XAqd+MHeJk8jO7X+gn2C1g2QObrHONO/X8Kbm/lTPrVA7rFOL3YKX7qB5AHobr7l1kqozmMfmj0X7ASr4xMPAeeSRsNjkPD9KSLoLqk4/gJo5Hx3j1AVWIAQhphTZLixG/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713962698; c=relaxed/simple;
	bh=0SfFOuwHAopSGaEcR/1RmEkZxcktC0rnqxKmQDvBO9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=n9NCnX/hGe7wvoM9eVfdgAIrYTIcGMka8kAlsFqPDPjxiBSqWhyVkBM3H6+ddZdI5b5g8Dwi5tw35ipIKFcfiwYh8Y8DF9O+w5Fo9bLMnhydBDILL0piNlXXlTb1220MDFXcOq/nWNiwej8IHdbQJaDjr0XE3Kd17F2tnWXfiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxDiKL9I; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so8045171a12.3;
        Wed, 24 Apr 2024 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713962695; x=1714567495; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBtTsZ2nj+w+rOBShYNHrv35fSs6tv0ZSqBr205SbEI=;
        b=OxDiKL9IH42tjQ5WE6uaTiMzsRIOLpx2BExscNlnvfqIB6uLdTzBUlaq6Y9wZS39Wy
         QG9QjhMyLnrPXx9qNA/OC7h+vzDLBOPFi0QHLzJyZ68uNfL11oUuJLPnbnlyU/N8QRfL
         6ABcVhYUFh+BgesJ4kVElKqd3KM4/Qf5iYmD1FrNTmA7iCgUxWZu24dO4xBMXDK96FCA
         fnqVStbNQsi974JYhyLp3NqE/gn5CgkNjuvpy+7XiY+X2hXKMMlc0lTQL82+BmdFmXKM
         j9rQoJaubNq3M7/Sf0CV1apGvZVqo4sGDbmBZUmW4mC3iBFjuH8bJBsfgWRW7/ezkP3Y
         xeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962695; x=1714567495;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBtTsZ2nj+w+rOBShYNHrv35fSs6tv0ZSqBr205SbEI=;
        b=J+Bk2Ybrt6ee+ElhuPRDVrJwYJcRUFP4d7G5NLVOjIddmjWAWepge1hZO8ANH3AbyU
         cPKB1PFmIRqnRNB+0yshdb6itef+mxPevGmMo+X/ParulW4WOiFBbQ+QcHLBYKXh4k8+
         n75DcYAbkppxkDv+o4lo4FI/Lz7ODtExMjuivd4EwqLdBwqKWfYrbfjC+3RVNxGeL6RR
         77q0j9GxkcICkWTbUoH4mxDTh/VfUp/N09WzwqolP+a+oVfJtHB0odOpaRWbqoLWYL5J
         mjYbNQjLOvs7cc/rgzAH24dHlJyMFefMi5kxPsd+O2tXTxTaYqcUGKqIriRvRwSHy1S1
         Lahg==
X-Forwarded-Encrypted: i=1; AJvYcCXJRSKKv3pgk9RkzZpi3MMKMhcwVj4s+y6yQLIrnXNCEWu1U2oILy8/FLCa/cLqWvLZqG2ymPlWdnpmrtmM3U/7Pp5LGFQJtoj+JV++kK6r38Zjmisj7d+QDwcXfn3uJAwvf4MYsPzqQKgEHM+JXvvPrLZNMSGkk6VKVvw+OESnfHFyyCdALm3JV8mRvq+/83E0g4Sh5g0DkwXr8bp99FvrVL4m/LXDSfe8blpUIRmXF3xrEqd6VoDbaaSRwpka/UJNwJRUfCjwJ3rRMPl8Ib6SytNQBvHOz8fPKaVweRX8OGt8
X-Gm-Message-State: AOJu0YywXjwsBQS+YfT+FDavkzM+DLKH2MynHVluBh0WojgBGgTwNrPT
	aMU+tcCc2eBPsSPdg5z1WR408yT2L4dRF7KDthJVhcrvAS6ckIuB2pP5ZWnUdXdSpi3VJcEyfca
	ehO2dFJ2cIO0JPXo0GpXGYVOtB13dOAyn
X-Google-Smtp-Source: AGHT+IHd5n4O533BDSAcLLsV1GUmPQzG7lIU7zyOhhof8PSEyoKk7yoD0RI0ZjEBxo/6Qi19WfkxFFSIHjno1HQIUho=
X-Received: by 2002:a17:906:474a:b0:a58:8fc0:fbca with SMTP id
 j10-20020a170906474a00b00a588fc0fbcamr1389900ejs.45.1713962694994; Wed, 24
 Apr 2024 05:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <ZihNbtiVDkxgUDGk@surfacebook.localdomain> <sbkymvjmrufouqqscpmrui5kcd466gj6yn2bqwf3lhfk55mjos@n4ydx6wzyq4k>
 <CAHp75VfEvifLjPRQ+xsKipjwXA-APR7m_au6OJjafeXp6Wiyxg@mail.gmail.com>
In-Reply-To: <CAHp75VfEvifLjPRQ+xsKipjwXA-APR7m_au6OJjafeXp6Wiyxg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 15:44:19 +0300
Message-ID: <CAHp75VdqcYn9RDVf63N7HL=nQLvFRt8cSO3EfbzAxLKNkwF-Kg@mail.gmail.com>
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 3:41=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 24, 2024 at 12:00=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > On Wed, Apr 24, 2024 at 03:08:14AM +0300, Andy Shevchenko wrote:
> > > Wed, Apr 10, 2024 at 01:24:14PM +0200, Wolfram Sang kirjoitti:
> > > > While working on another cleanup series, I stumbled over the fact t=
hat
> > > > some drivers print an error on I2C or SMBus related timeouts. This =
is
> > > > wrong because it may be an expected state. The client driver on top
> > > > knows this, so let's keep error handling on this level and remove t=
he
> > > > prinouts from controller drivers.
> > > >
> > > > Looking forward to comments,
> > >
> > > I do not see an equivalent change in I=C2=B2C core.
> >
> > There shouldn't be. The core neither knows if it is okay or not. The
> > client driver knows.
> >
> > > IIRC in our case (DW or i801 or iSMT) we often have this message as t=
he only
> >
> > Often? How often?
>
> Once in a couple of months I assume. Last time it was a few weeks ago
> that there was a report and they pointed to this very message which
> was helpful.
>
> > > one that points to the issues (on non-debug level), it will be much h=
arder to
> > > debug for our customers with this going away.
> >
> > The proper fix is to print the error in the client driver. Maybe this
> > needs a helper for client drivers which they can use like:
> >
> >         i2c_report_error(client, retval, flags);
> >
> > The other thing which is also more helpful IMO is that we have
> > trace_events for __i2c_transfer. There, you can see what was happening
> > on the bus before the timeout. It can easily be that, if device X
> > times out, it was because of the transfer before to device Y which lock=
s
> > up the bus. A simple "Bus timed out" message will not help you a lot
> > there.
>
> The trace events are good to have, not sure if production kernels have
> them enabled, though.

Ah, and to accent on the usefulness of the message that happens before
one thinks about enabling trace events. How usual is that we _expect_
something to fail? Deeper debugging usually happens after we have
noticed the issue. I'm not sure if there is an equivalent to signal
about a problem without expecting it to happen. Is that -ETIMEDOUT
being converted to some message somewhere?

> > And, keep in mind the false positives I mentioned in the coverletter.



--=20
With Best Regards,
Andy Shevchenko

