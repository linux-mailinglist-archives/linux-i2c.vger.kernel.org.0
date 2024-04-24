Return-Path: <linux-i2c+bounces-3103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A898B09E2
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59D61C243F9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 12:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834D315957A;
	Wed, 24 Apr 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnMv5Y/3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5741E1422AF;
	Wed, 24 Apr 2024 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713962521; cv=none; b=K7or0xg1+9/ZLn3XVNaxfVlAFfUOXzspx1bPh/qvNEokhd4LuyZ39kspeUDMCBEHrceisp/AzIRS2kL6tyVy0N+d3eSq3m4qKItzvBqNFsHzrPhWOh2nCh3epxgUHn5nUha1Cckk2B803CcKYLjfZkVks/5/LnYxTQihiGWe1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713962521; c=relaxed/simple;
	bh=nyNhqyLFjqr0dCw+Re85psoVUJBi/GoV8lGY2doOudk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Gvzg5vQNaNAyH+ZipPIAC8hscc2JZoCWtuRRyqzXxlj/L5stuh13vnJTOXR413zWPaIGv8BTSuWbYZPPqiii93ZBb4MYOaJHDWwPNonb1AKXdgIC/sss4/ZAdgRtjCSWa8afyra/eSQpDSJ3KtC15AYi0Iyp0i7HO/UbmV8+fVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnMv5Y/3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a55b3d57277so424122466b.2;
        Wed, 24 Apr 2024 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713962517; x=1714567317; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHZIct1D0pwRcJc5TIZbntuTMJlJZEOfxhjoV++WJSc=;
        b=ZnMv5Y/3J5YJMm6xh4LIPGI7WwkxL+dCr4wxp1sOnjmWspBZ7nep5v3N4/6yKnTU8I
         ETAXJmNt02AfHs/TQuVhUDm9Pc5RfHXCBcDO1N6gJqgTX0ZLJHStvH8TnIJlraJeIxs9
         1cFGOHJdC12U1P6YsXwjLmzM3944JbvwJZya7d1cQPDylrFFsTLvgJmpN4b75QnoxGQE
         UzYHiWCscPP/cEEU2XCJZgR8TbenA08FbQVLPsLHad5yTJQie4yDnrvYK9RjeffKN70D
         kKO2LcImii7W+Jd5jRd9AO5ff6FRZqjxM3GFhbiOmzSbcR4njJOeWKsl3tJFlB75rPT3
         of9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962517; x=1714567317;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHZIct1D0pwRcJc5TIZbntuTMJlJZEOfxhjoV++WJSc=;
        b=ZW5GasuOoS3yx7QwHHdG/7qaT0z3MLslUOsbZaNot/nLT0mwFWqGwfciooi1803f0J
         I9vZ5mzITYd1wuHAyJFiRM1u44NXl7t0UvOjyOcUIWVUo604bGfsKgGVjn5NXRNh9fw1
         KL9g/mMtu8sQXoZzVAnxIaw3jhVAiLVhvE47O/8zIBJjEJiaCn+89UB20lOzVAf9hM6V
         OpqrC3mxjQxXjuBrmdlvX14geVUSvrOG3NW3LR7eUJhO0VfRDMSoa/gZiIVD139wRUUF
         B3IGQXcr+dD8f+69PLnnYmb7+zJBRKi9X1XqUanhh0jxOSw0vvz8oi6KpgMFm4XQYGPW
         hZkg==
X-Forwarded-Encrypted: i=1; AJvYcCUPIv9newTI4wWOTA/+yKUoVo4SwdJhxk4s1Y7EoPTSEvKHlndOpIhuQbgldO++aaZMklo//yQww0BjccwoLv4nvm8wMWb53JOPYfvQ/ADKAMEpXaTEJ9wG4PksWd3sAHCgt+qH/uKiY24SLqFAoAOOmJS6V/lcPPZs5kwDtgU3iBSyJCadiigU4ZqdtEl+lXqG5yUXBDdFtVy+s0R1GZ+joD9ARza1DDwAYhnUJoolvGBaH+yZwNNesl7kkVsbEunofDiAeHs1GHWCV21S6WXDU4UsjR4KcaHIE55UC+TEUzER
X-Gm-Message-State: AOJu0Yx+NdjKZDgEMqlkt8nGCDmH7etNG61IocU4mowXrLL+5JWvY85h
	6c0R4CW5ZlG6n9L8dEUQTbUkTlhEjURU3e4aPRiE/oryaA9XW+OwjMkKvyrF44+dLZsdt7ujjBr
	9bKpqaL6EeTEOsrvLZo+SY07WAVA=
X-Google-Smtp-Source: AGHT+IFIhmK+schRX6X3I8Bxyx6tSQB7JSgLCRIm/8b1cT+bJ5PWapMzaGpgKQTyNU3aSrkHw3E716N3QPXAh2TBIrM=
X-Received: by 2002:a17:906:7716:b0:a58:873e:a058 with SMTP id
 q22-20020a170906771600b00a58873ea058mr1515393ejm.27.1713962517515; Wed, 24
 Apr 2024 05:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <ZihNbtiVDkxgUDGk@surfacebook.localdomain> <sbkymvjmrufouqqscpmrui5kcd466gj6yn2bqwf3lhfk55mjos@n4ydx6wzyq4k>
In-Reply-To: <sbkymvjmrufouqqscpmrui5kcd466gj6yn2bqwf3lhfk55mjos@n4ydx6wzyq4k>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 15:41:21 +0300
Message-ID: <CAHp75VfEvifLjPRQ+xsKipjwXA-APR7m_au6OJjafeXp6Wiyxg@mail.gmail.com>
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 12:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Wed, Apr 24, 2024 at 03:08:14AM +0300, Andy Shevchenko wrote:
> > Wed, Apr 10, 2024 at 01:24:14PM +0200, Wolfram Sang kirjoitti:
> > > While working on another cleanup series, I stumbled over the fact tha=
t
> > > some drivers print an error on I2C or SMBus related timeouts. This is
> > > wrong because it may be an expected state. The client driver on top
> > > knows this, so let's keep error handling on this level and remove the
> > > prinouts from controller drivers.
> > >
> > > Looking forward to comments,
> >
> > I do not see an equivalent change in I=C2=B2C core.
>
> There shouldn't be. The core neither knows if it is okay or not. The
> client driver knows.
>
> > IIRC in our case (DW or i801 or iSMT) we often have this message as the=
 only
>
> Often? How often?

Once in a couple of months I assume. Last time it was a few weeks ago
that there was a report and they pointed to this very message which
was helpful.

> > one that points to the issues (on non-debug level), it will be much har=
der to
> > debug for our customers with this going away.
>
> The proper fix is to print the error in the client driver. Maybe this
> needs a helper for client drivers which they can use like:
>
>         i2c_report_error(client, retval, flags);
>
> The other thing which is also more helpful IMO is that we have
> trace_events for __i2c_transfer. There, you can see what was happening
> on the bus before the timeout. It can easily be that, if device X
> times out, it was because of the transfer before to device Y which locks
> up the bus. A simple "Bus timed out" message will not help you a lot
> there.

The trace events are good to have, not sure if production kernels have
them enabled, though.

> And, keep in mind the false positives I mentioned in the coverletter.


--=20
With Best Regards,
Andy Shevchenko

