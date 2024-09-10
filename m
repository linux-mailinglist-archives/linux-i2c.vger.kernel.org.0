Return-Path: <linux-i2c+bounces-6452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3335972686
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 03:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78901C2331F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 01:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7D774424;
	Tue, 10 Sep 2024 01:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huz7G9mV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820D6F307;
	Tue, 10 Sep 2024 01:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725930768; cv=none; b=u/sGZiJr0nuHG0nxr+qWM4PEhnvYT3W8HYGF/sO2F2rI86jzL5Oj2R2ozh7h73gFnzOuYJY5jMBVBkuyWsje6i81eSZe11C2Nj2afrHX9+7CrjS2Wd0MnxdCqUdrrc8aFUxiyO+R3lFpaGWN285KXswb57pLJYrxUMIOnMGCgM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725930768; c=relaxed/simple;
	bh=4hDpP4Lr+SjUubgdvfhA8wUi3pHwhmzJZwS//eqSpHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwgoU/VWYJURSwiX1x6cOLNtFDvriANX+PMhHy9gOdOTswdr+WkayD2ZQBEJLrZURBAWAqndAHHQtucrU7JpEPBw2TN715lhFG/2WEytLAZGoon55sQU9y4yADRybDgou/9Jg5kaI+bLnKnU4dQhHAz4wKfEOw9XIlX5JpUdtGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huz7G9mV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a80eab3945eso469457066b.1;
        Mon, 09 Sep 2024 18:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725930765; x=1726535565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3cOEtOvexh0wx5WjRoJORvf1Auxy8+dLP9Bjy/bEyU=;
        b=huz7G9mVxJ/aQf7ZkTv1Ca44sBRIkpyPzmjweIcyR66r4Z7TgCrnv6up6Uw9chTvbP
         vPnh+zUjQVImELZ6FEMmSkIodvfZwkFxXRN+gZQdIqQi4acARg3VihcHz0KR7qbQnj+2
         qqzMqoZLtu8xB32DyC9GZUQU7dOwqJf+70CF9SCywb7toslqiD8D0E0Gq1ELLLwzVk1c
         OVZHn+IV10sL5hugB3kXOhJMhqW6pY2jC5MIKZgpU/w9a8A6fLKrmUzZlEkDn/MZCsOs
         YTWhfTtA73POKKEKTEltuPvJD4PilzWb7TL9PARUMWqXeSpqhFPK63koIylZuRdhMj6M
         Gy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725930765; x=1726535565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3cOEtOvexh0wx5WjRoJORvf1Auxy8+dLP9Bjy/bEyU=;
        b=nRuA1WuOyGbwTGJWhvKN0DYXmdgU0guuVs2rPwvDlJVaNTA6X7M2gd615LAY/M2A9M
         TNz6NOKCe1GRSMiLq2aBgupykggrQaXC2TGOBW2srq9e1UEe5hPijayHreCz3C4WAurj
         65pncIkuWcH9jEkFJeQfACMM+OQczac/BP6tIH6dIvkn/6nyiFM4g6g0AwiI52YwCBZy
         B3WKhhWQtPGUpJfRBAMiWx38+1kiepyY1HR0XPfE3OMtt7RG9WXeV7fWM+pROjxBgh4B
         mZoBKjG+Cd9oFgMNpbJQNT7aS32SiQPKH1ilm6J0ZKTxHHjE7TC2Mdv17E6u45/zKZLP
         6AcA==
X-Forwarded-Encrypted: i=1; AJvYcCU0UNRnH4TepOnWSXGDJU0rgDwp+XMafUV6eTED07X77Ov8cjfK2D3sjal9IOSb24m54/ftCJnDz5rMlsL2@vger.kernel.org, AJvYcCWQqUpTs/T1sFbFi94+OeNR62OzDMDW4oG0ARCi9oVXtqPMVvBzyBgE66cCmnSOntqo76B1lPeZDDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAlkahse0uDoymnXuqRX8NNn77HgPh38Mi4PbuHzjHk8T2mYc
	6lJHchD9R2R+zgg2RUQn3SO0ijg7AHFMk7YQyVTHSA4ji5UWRhBY4YNiMHxZlj4cYsfawMhEz0z
	X+lMVgy9/ZpeSPQyjRpey36seqSqNtBs=
X-Google-Smtp-Source: AGHT+IHZ7U5FoeeNIb9dCX+fDO0hlFs6276LjKB177SRH9sND3Glorr7LJ/q7yHerwwbgU4TVi/BBZeZ/mGd2OPaHqQ=
X-Received: by 2002:a17:907:3687:b0:a86:b923:4a04 with SMTP id
 a640c23a62f3a-a8a887fcdbemr997704866b.50.1725930764537; Mon, 09 Sep 2024
 18:12:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <qr3q7stbuwl3ylcqnfftg43nvnzi5cz2wcrhinlek6kvzb7wyi@uqgq4z5b6ob5>
In-Reply-To: <qr3q7stbuwl3ylcqnfftg43nvnzi5cz2wcrhinlek6kvzb7wyi@uqgq4z5b6ob5>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 10 Sep 2024 09:12:33 +0800
Message-ID: <CACD3sJb1OvKqa1WsG-st=zmQsQ+-g=GNT-bRh+sQ8S59hi5kBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
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

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Fri, Aug 30, 2024 at 11:46:33AM GMT, Tyrone Ting wrote:
> > This patchset includes the following fixes:
> >
> > - Restore the npcm_i2caddr array length to fix the smatch warning.
> > - Enable the target functionality in the interrupt handling routine
> >   when the i2c transfer is about to finish.
> > - Correct the read/write operation procedure.
> > - Introduce a software flag to handle the bus error (BER) condition
> >   which is not caused by the i2c transfer.
> > - Modify timeout calculation.
> > - Assign the client address earlier logically.
> > - Use an i2c frequency table for the frequency parameters assignment.
> > - Coding style fix.
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> first of all, Thanks Tali for your reviews.
>
> Second, Tyronne, can we please incorporate Tali's comments into
> commit messages and improve the code comments so that we don't
> leave room for more questions?
>
Understood. They'll be incorporated in next patch set.

> Consider that not everyone knows the device and we need good
> reasons for accepting the changes.
>
> Thanks,
> Andi
>
>
> > Addressed comments from:
> > - kernel test robot : https://lore.kernel.org/oe-kbuild-all/
> >   202408080319.de2B6PgU-lkp@intel.com/
> > - Dan Carpenter : https://lore.kernel.org/all/202408130818
> >   .FgDP5uNm-lkp@intel.com/
> > - Andrew Jeffery : https://lore.kernel.org/lkml/
> >   20240807100244.16872-7-kfting@nuvoton.com/T/
> >   #m3ed3351bf59675bfe0de89c75aae1fb26cad5567
> >
> > Changes since version 1:
> > - Restore the npcm_i2caddr array length to fix the smatch warning.
> > - Remove unused variables.
> > - Handle the condition where scl_table_cnt reaches to the maximum value=
.
> > - Fix the checkpatch warning.
> >
> > Charles Boyer (1):
> >   i2c: npcm: Enable slave in eob interrupt
> >
> > Tyrone Ting (6):
> >   i2c: npcm: restore slave addresses array length
> >   i2c: npcm: correct the read/write operation procedure
> >   i2c: npcm: use a software flag to indicate a BER condition
> >   i2c: npcm: Modify timeout evaluation mechanism
> >   i2c: npcm: Modify the client address assignment
> >   i2c: npcm: use i2c frequency table
> >
> >  drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
> >  1 file changed, 172 insertions(+), 104 deletions(-)
> >
> >
> > base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone

