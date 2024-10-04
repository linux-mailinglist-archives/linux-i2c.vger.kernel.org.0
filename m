Return-Path: <linux-i2c+bounces-7213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5698FC0A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 03:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766732809C8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 01:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FD017758;
	Fri,  4 Oct 2024 01:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtjS1M7B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FB17547;
	Fri,  4 Oct 2024 01:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728006696; cv=none; b=jwIm9jj6VrlkMI5ppBa9UxDbI/zJ9m0J4jaRLHzeN2EabrPedEcFy2f+75HgW8ZIKKREtyMP2UtaKUoY+qxUG8JdPopvAlcPHDW+i4FjjEgSnsBCY9yrzVMPfcVyF8pAU+dlXynyp91oHooQ4W5uvCdZDis6TX0M5akp/E27WCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728006696; c=relaxed/simple;
	bh=2TbQ2jJT8Gnh+uAuA/LCV5JNC4aeAp65rY23ATPV/rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2s+P8oevjECZu+1p68IXZNrUn3eDZpcs8t9dXKT/XdZIQqBDaWN0QPfXPjCUF00zUpQKNalOihOV8FaNpMxwU/kuly4BIq4DpgfNkxapczFMReKFrepTLrkxd6GmZO5cWQBOIANErJek++ireIRM1OJdeBwd1ZnnZ3A4noZsqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtjS1M7B; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so193070966b.2;
        Thu, 03 Oct 2024 18:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728006693; x=1728611493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TbQ2jJT8Gnh+uAuA/LCV5JNC4aeAp65rY23ATPV/rY=;
        b=AtjS1M7BGxVyIgbNvSKdhuorkEhQVoqzhjatAknCgcn/1EII4fuepW33t378U6NK96
         SHx/cNE/qx+POgLM2gL94xKjM/7fp/3Qc5A+DfcP5zoGrtJ6Ze1vl1ujSU2R2yjT9ZJL
         rm4AvA1le+g9aIZXJ9/o+ON3bCMR18BdQqDeX2bBjbJI1XPfVpJx4qi5q2kWssxB0oeb
         1U56mrLSYPvFFklnr4CPyD9yJxQD4c7yVtWKpQxRigzxx3WS24xRCsReji01N/YmWU3f
         Ihl4TUL0WXGT/t3TzBjC1UD8iino8xKiqnchdFk7lLQeyVlZN1aGXv5RVXLjzj3FaBi2
         9rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006693; x=1728611493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TbQ2jJT8Gnh+uAuA/LCV5JNC4aeAp65rY23ATPV/rY=;
        b=FxS00fqmRi/J1z+CER+PiF+r9IhOi5qZZ1JIhfAbceGKcYflLJutwpoHaXlcHDIPHi
         AS70wZInlkDBA8h0DowRBhqH3PYe2/xVNwRE5eumyQi+WDK6OdCcvBA+27uR8ByQBVYW
         XsPOnah8/cEnlKyvxbdONE0PQfXSY2eKbZGZL/ez/OLRpzUuTmSKfcS855vPA/cmfIiX
         yAAV/mvZubXVA6iRJYIBSBGczuBv5FU3Aho36FvdDXWtRqt1FVWhmihH+LTDFnRO7fmO
         kwuqDFaCz/AUfefWc4rXdRoF9VO4IE5nxmdC7z17v4ztxK42TWoJ7HH/8uQmglzvuW1U
         fU8g==
X-Forwarded-Encrypted: i=1; AJvYcCULpbJtg02tvfVQEC1x3wcX83MNJx3QceclCjs4KGdbZVXU4YZeIf3jHeg58rb8DcZwd7WM/GPkHpfOlIwc@vger.kernel.org, AJvYcCX8FqE3CKV4W+x+oEYb2KbHgksFWLUkf4uJC6oDiwH2H+K8CENasv01wteeIknBUuPmVU4BcyKFdts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKzMwOBobQss5sP89wSsyQ4Fr273s5SY66UkE6PaTV8fNsYmH
	btwx4ZIKyTu93qvle3bUY3D7beZLvLgUq+LZeYC3Q+73CYvYfUNQjBM5iKIdpO9ZDzXWzjbJjT1
	PBNF1Aio5n7Pj8jFERGCE02cLZw==
X-Google-Smtp-Source: AGHT+IHve9h3BM2sNzAq+GFrnYEqz82siIj/A5I9jY8K2jvgSEN8bFP+z0TNPEV8wdGZSf6DKw38vl6lLG3ULmyIVKY=
X-Received: by 2002:a17:907:f788:b0:a7a:8da1:eb00 with SMTP id
 a640c23a62f3a-a991bcfdb73mr96396066b.7.1728006692826; Thu, 03 Oct 2024
 18:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-6-kfting@nuvoton.com>
 <Zvv3ws1_jUMVnAAJ@smile.fi.intel.com>
In-Reply-To: <Zvv3ws1_jUMVnAAJ@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 09:51:21 +0800
Message-ID: <CACD3sJZEUp3PQ=POGtHsN5su6LbXyOfUiXv5EsptiY3GxNrR7w@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] i2c: npcm: use i2c frequency table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your comments.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:23=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Oct 01, 2024 at 02:28:54PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
>
> This two lines have a too small wrapping limit.
>

I'll make the statement in one line.

> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
> >
> > The original equations were tested on a variety of chips and base clock=
s.
> > Since we added devices that use higher frequencies of the module we
> > saw that there is a mismatch between the equation and the actual
> > results on the bus itself, measured on scope.
> >
> > Meanwhile, the equations were not accurate to begin with.
> > They are an approximation of the ideal value. The ideal value is
> > calculated per frequency of the core module.
> >
> > So instead of using the equations we did an optimization per module
> > frequency, verified on a device.
> >
> > Most of the work was focused on the rise time of the SCL and SDA,
> > which depends on external load of the bus and PU.
> >
> > Different PCB designs, or specifically to this case: the number
> > and type of targets on the bus, impact the required values for
> > the timing registers.
> >
> > Users can recalculate the numbers for each bus and get an even better
> > optimization, but our users chose not to.
> >
> > We manually picked values per frequency that match the entire valid
> > range of targets (from 1 to max number). Then we check against the
> > AMR described in SMB spec and make sure that none of the values
> > is exceeding.
> >
> > This process was led by the chip architect and included a lot of testin=
g.
>
> Personally I consider table approach is not so flexible and it is definit=
ely
> does not scale (in the result =E2=80=94 hard to maintain for all customer=
s), but if
> it's hard to calculate all necessary data and there are other pros of it,
> I'm fine.
>
> TL;DR: I don't like this patch, but I don't want to stop you, hence no ta=
gs
> from me.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you again.

Regards,
Tyrone

