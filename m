Return-Path: <linux-i2c+bounces-6013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1896914B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 04:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B0981C21426
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 02:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2EE1CCEE8;
	Tue,  3 Sep 2024 02:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMM+Wt7n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2441581E5;
	Tue,  3 Sep 2024 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725329281; cv=none; b=Ro8qQGdmHFToRoW6YhZ9aqllEA3+AyN88+e9MxKfS8udWexm7jFoOab3yQUqQF8bAwINZXCeakfEFqmZNHwygO6HcMKwLTSvuurAelFeCZCuRVtq9D/MM3+pvXCTeaIZnzWNHBShfL+yr6G8FR1+ocvJtdCap1vntq22vfLZ1CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725329281; c=relaxed/simple;
	bh=T1GuxGVThsSRhyDuyn4cmCRQjYF0xXBu34+O3FRfXrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPgRTiqHB8IBAcK3FbKtLxZikqnlfpk0eeXFIFKfBme32qkmHyBN7aQUng4FXpAKmdYYiASvRemppfRESSDG8lTAfRVtOOr3Hxh+9kF/X4nJmGQH0LDvv0ErpObU9nIb3/wz1QKMCZzg8mZfU0TdOoFJ1X3xuWT2HPJPSgTQGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMM+Wt7n; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so4974908a12.0;
        Mon, 02 Sep 2024 19:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725329278; x=1725934078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1GuxGVThsSRhyDuyn4cmCRQjYF0xXBu34+O3FRfXrc=;
        b=cMM+Wt7nOaWGnoagI23gYg4hrOmDt1bYGReoHQ2LexoHbL65kHnmcgAztQdMLwr0Is
         uQa6S08nWGebZU8m9t8Pn2QTtbiOhoNj9xcZ2/T97oYiEJ0Na71V1Cbfd7kiAHOzlA3n
         UzVXXaHb+ymsz4lip72iKe2YOpPil1S1aKdloZo3PYUjcwvXiRq9982mGY2wtpNmxpdV
         b0cjcQPloD05C+gn+zani+3wufWqmiBAQPelNpwKmYrEtZplWt9l2kiXStVh/TcyJlWN
         sbQ7Q2H2CZ9lg3RKahnA1hORT9XvRsTQ3weAG9niKbHsggle30EzzBh4VqkTzvmNk0/0
         h7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725329278; x=1725934078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1GuxGVThsSRhyDuyn4cmCRQjYF0xXBu34+O3FRfXrc=;
        b=vHekfznAeg0fuTs/pQ4U1U2yp5+DVqfnqLzlLbOXGmgcB2lH1igsUqm6AAsrqSC+Cc
         DXg2E5JQoLS+kqUS3wnFBgzutnwjOTFUNpklCOzsP4O+aqJSZAfGr2N1vAJw3kuWOJ6r
         tnzE6sFqAnTeZTznSPk9jjEN6/zUAQlVGlfjniEyutabn1SpSync3P53ieiw9cPFUvsI
         PdchwZTtIypgvuORy3wIaI47YqjVLmQUh8mjTEsTmnNDqrWEiH40ca0uUPXQQ8pIgNby
         0DzEetm0+u/2upBDFDMorXeY93H0I+tCICo2bv0pXx2JwaCHim0lxxD/OC9/7mucsiU6
         acUw==
X-Forwarded-Encrypted: i=1; AJvYcCX2QV9IdUvfyyFcd98TSGyX6nUbSGCEepMssL0DoX2Nx18JajlRTDEIjqZItoqtV+QGyJD2508Qqi0=@vger.kernel.org, AJvYcCX7GoHwiDZtavQpKCJYngLxE2dzib0qjmliP1Zg01T5jCcdqsmbGfbVA4swKvs9nVJqkHStkKOcWhqj7OVx@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjXmYHDff+qPW4GkuZdvTZOFjqCw2IaWs+hXRbBXi7iZSL0B4
	w4Kno0byEJ1QEqWH5gsAzmWGUG/aIwBq+nD0AMDgK8M5WQFuSlVMykZcQltv5cOral77Ixs2lHb
	u5sJwjYQJtWsQ08RDFtcu8X/+pA==
X-Google-Smtp-Source: AGHT+IGrC74Ctz0HzdIiD7tPawwv+UqDvOFvoUGHiH77vBFIYeFjLsTp/nj7HnVFDEBLZ4qvEkvOCGuZe0mvz2lIzBk=
X-Received: by 2002:a17:906:f586:b0:a86:8917:fcd6 with SMTP id
 a640c23a62f3a-a89b9733607mr529621766b.60.1725329277088; Mon, 02 Sep 2024
 19:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-6-kfting@nuvoton.com>
 <ZtIaofiTqyFwNXrO@smile.fi.intel.com> <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
 <ZtWnd8bmiu-M4fQg@smile.fi.intel.com>
In-Reply-To: <ZtWnd8bmiu-M4fQg@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 3 Sep 2024 10:07:45 +0800
Message-ID: <CACD3sJass-6gu6MQxrYwLGi6OMgWnntO+N7Ob9nV6o3siFHNVg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	wsa@kernel.org, rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, 
	kwliu@nuvoton.com, jjliu0@nuvoton.com, avi.fishman@nuvoton.com, 
	tali.perry@nuvoton.com, tomer.maimon@nuvoton.com, kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=882=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:54=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Mon, Sep 02, 2024 at 09:40:09AM +0800, Tyrone Ting wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B48=E6=9C=8831=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:16=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > > On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> > > > Store the client address earlier since it's used in the i2c_recover=
_bus
> > > > logic flow.
> > >
> > > Here no explanation why it's now left-shifted by one bit.
> >
> > The address is stored from bit 1 to bit 7 in the register for sending
> > the i2c address later.
>
> Yes, but previously it was stored w/o that shift.
>

Previously, the address was stored w/o that shift and with that shift
in the following call to npcm_i2c_master_start_xmit,
just like what https://github.com/torvalds/linux/blob/master/drivers/i2c/bu=
sses/i2c-npcm7xx.c#L2043
shows.

Since there are cases that the i2c_recover_bus gets called at the
early stage of the function npcm_i2c_master_xfer,
the address is stored with the shift and used in the i2c_recover_bus call.

> > I'll write some comments about the left-shifted by one bit behavior
> > above this modification in next patch set.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

