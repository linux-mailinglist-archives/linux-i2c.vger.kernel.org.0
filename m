Return-Path: <linux-i2c+bounces-6376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AEB970B7E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD18282303
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF01101E2;
	Mon,  9 Sep 2024 01:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lm5CkVAz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58101200AF;
	Mon,  9 Sep 2024 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725846472; cv=none; b=UjwSa13CJrxJWuqWCHNDLvkNizefxm1ecLZd6dnoz6QWTdKKMM9Bc8ewhSW5CtyANBRB+SNotdrjnEoWtpcAsN+P9HzcsYqT8I9v0JYgTTPgHVBmvju52s+ciUit1/X6a6FIVLdj59XU7Imzy60nOUizCrHx13UnVpAq8ILg5HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725846472; c=relaxed/simple;
	bh=sMBcjmTPkiGqMm9iJQ9qc2+UW2td00ShQaRS9ZKW8X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uf1T7oUBtdHxRsH/7JhSBXedlWUlsdzrhxO04VEecQegeszQ6PqE+GASS6fsrj6f3LKQWa6lyAkySxam/i1qFYPxS2i7Ebp7noO+JrlxVb/3eL08vGt6wt1EUutEuhMBWYf8zF7xLv9xm3h8Psvh4AJPaDpmqqsMl92D4CedBZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lm5CkVAz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f74b6e1810so32561021fa.2;
        Sun, 08 Sep 2024 18:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725846468; x=1726451268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMBcjmTPkiGqMm9iJQ9qc2+UW2td00ShQaRS9ZKW8X0=;
        b=lm5CkVAz8todWqy3/iiDROsNPAB5NAACGnISNcRg1JWn9x+lPnmB2maVcgPUIOlm61
         vwrTOTVlkPZZDc4ZO6Omo/TgfCKiIJiQK6+MVD7ASe6KcoN4mqmchDurnleVhaCopjuN
         2qcFiYpjEwV+OKJbgBIQlAZnveW68B86X6E8Z344K04fyuQGNJHgYZNUW/Wf/3X71Vom
         BdEu/SieuPTyRgA+DebrUTf+7NAaP7ly7Q2rwpGFT9nqp7iYYeLCYhN39/CA2J32tmWG
         cDnQeCHBXccHnz7n7EA/pP9hRI6KnANVGXyxKAmUC9eV5qLQPkte+LE3Gm6B1wC7eG+T
         8aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725846468; x=1726451268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMBcjmTPkiGqMm9iJQ9qc2+UW2td00ShQaRS9ZKW8X0=;
        b=jHqG/RUWQBayqlm6Sjer7I79wzc++T6g1vYOHZ50lP6/AruKh7i+HnD6CNB+9uQgag
         9c01Dd8a+l7P9KbVTPgHe1Esh6nGnhkhJC3gV0Rk1r3vnGbqY6qf2Xg8mxT8DXgpl9qH
         5wWn4gAzC51byzjeTD2DY6xuojSlX0LFU/fV2vHuIqPsl1QhJncfgUuQKkpJo5YmVAB+
         +e813pFMlDSEzLwkoybSDdi7w4oUzQofu2etRd10/y3+5bVbC/GlvuXFnVRz14jeB9Co
         WjZOJe8ihQoFZSK8PBeuYXgATLm+3vwmlRQp3tcijbqQIFI9WysrWHtv92yHIgQokP7T
         6bNw==
X-Forwarded-Encrypted: i=1; AJvYcCX8+hk5r8gP6p097pUsu726bG8MFv0rXEMjMzKZ5S/Cm0rMVny8FGqrKqAom5N3cy1DKR0UN9eK2w4=@vger.kernel.org, AJvYcCXBLU+7dysYtlEVbqajKKymFJAYQpT310GWQv9GZ4YyL26EuYogWIAXc8KLccG5DhKDRarksX0tpZEBrTtg@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLxDyUJp06Xqa2s4qULtJfRYy4B6nn+v6x83CzeSPSUT9Yj8L
	P7iS7Q0fecDN35aovZTVbKXJwtrRr/K2Mdz7ZEezwpGd5+TEouTGCn801UAEK8ql2vo3Bn1n8Jl
	qttaHwL5J92M0mFlY5jKIIXoYqA==
X-Google-Smtp-Source: AGHT+IHDjA5SvJpZ7TekDlfF9Vtbes/OHdwckVDtaVtHJqTYfJbJlBpPHzMU6b/3YNIwh1UPdH6a36f8y29yhDpu85o=
X-Received: by 2002:a05:6512:3b07:b0:536:569b:a59c with SMTP id
 2adb3069b0e04-536587a407bmr5596365e87.4.1725846467556; Sun, 08 Sep 2024
 18:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-5-kfting@nuvoton.com>
 <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj> <CAHb3i=vSUqbsoRhnnyMOoteKP3GCoXmCd+UKQSN_QWqkRweuiA@mail.gmail.com>
In-Reply-To: <CAHb3i=vSUqbsoRhnnyMOoteKP3GCoXmCd+UKQSN_QWqkRweuiA@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 9 Sep 2024 09:47:35 +0800
Message-ID: <CACD3sJZunRChkWBfntJP=w=8crLB2Afkb4hKz_5ntmiAXCGJQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
To: Tali Perry <tali.perry1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, avifishman70@gmail.com, tmaimon77@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your review.

Tali Perry <tali.perry1@gmail.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=888=E6=97=
=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=886:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi,
>
> On Fri, Sep 6, 2024 at 12:39=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org=
> wrote:
> >
> > Hi Tyrone,
> >
> > On Fri, Aug 30, 2024 at 11:46:37AM GMT, Tyrone Ting wrote:
> > > Increase the timeout and treat it as the total timeout, including ret=
ries.
> > > The total timeout is 2 seconds now.
> >
> > Why?
>
> The users want to connect a lot of masters on the same bus.
> This timeout is used to determine the time it takes to take bus ownership=
.
> The transactions are very long, so waiting 35ms is not enough.
>
> >
> > > The i2c core layer will have chances to retry to call the i2c driver
> > > transfer function if the i2c driver reports that the bus is busy and
> > > returns EAGAIN.
> > >
> > > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_re=
g_slave")
> >
> > What is the bug you are fixing?
> >

I'll remove the Fixes tag in the next patch set.

> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> >
> > Still... can someone from the nuvoton supporters/reviewers check
> > this patch?
> >
> > Thanks,
> > Andi
>
> Thanks,
> Tali Perry,
> Nuvoton Technologies.

Thank you.

Regards,
Tyrone

