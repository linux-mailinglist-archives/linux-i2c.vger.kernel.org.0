Return-Path: <linux-i2c+bounces-6756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4A9799CC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 03:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42A53283098
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 01:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA8F17BD5;
	Mon, 16 Sep 2024 01:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei1Je9hC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5AC17BB4;
	Mon, 16 Sep 2024 01:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450636; cv=none; b=prI76L6MJ0oE0gHGwRePi/lXLgDrunRK+9TUqI25MYYasd16Z75+QJwbDTLs5SxO+/NWgLXrgNNTsSGxDqgyxpthDxPgU4NNeWcHNtbPTUDONw0j6oKa0FtG+E3Q9HecQPIEbr1xoqr7kIWAJTSP5zhg3YIgNaXXz6NfWgTuMBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450636; c=relaxed/simple;
	bh=qWyI+LoudaOfaNGFTPBGe37RTDc6iG7dKfo+swVnopY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Onl/IPe3zMck5MWLZwajS5Sb4duHPUjjtJpGrHLFAbRusuFLSDWghptP36nUIEJbP0SCtebPct+P+KIMIKrOOE08cbEXUl1Eb42obd+Nw8gCYIUfPaYEZgWZDJd3gkWIt/m1n8TZL8cEj+DrGXnChhk3P9JLhIHE8IVCDgkmk50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei1Je9hC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so2966100f8f.3;
        Sun, 15 Sep 2024 18:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450633; x=1727055433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsLTyLRFsCmL1kp1O4cxcOiHcUnnn2FsIW0sJKScEbk=;
        b=ei1Je9hCTvEBKH5JjtwfEXIaY2e5Jud4YHDhLBTBjq9p6BvMI0pkVSIZG61GMJcXKF
         C4WcTGIoqkzZPQYhL0fUVWwF0zNCrStPtXtIz3H/fuN8TF6BxQ4J89JUYOrmAEhNHqsx
         Eb7paEYEvvm3XPj3JlEaq9e3QGFKd2euq3YNnG66uUCY58LwTqunSWFPEHv3VeReQs+I
         4WbqCmmvJxiddW9kLntqlwzJMkw74Y5spzw4uKBpL550puoeueLffFbKSpane6fncHGA
         bDhdwc8PRWqaXzXJOyOY+KW/RFPjam5zob8+wHOv4+YBb7OjL3oo2OgySl9v/1xpstRP
         OJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450633; x=1727055433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsLTyLRFsCmL1kp1O4cxcOiHcUnnn2FsIW0sJKScEbk=;
        b=vH5oDQMIkIgC3wkBL6mWKGsKtn99sb5o/Apm1mhTaozxutX/OpU1e70s+W9mYs+2o8
         YYDZzCpTfo1iZbsZHt7uUALynhP+6JoOTZjvX0/ZR8hnAIi52AMdkLJRsqdBr/cs1YUA
         7i7X63Io7pK8jDu4GIpkFUFqOBNEZi253Hl0eRPwgHOPCVxY1nxITxSf92+oxVByffDy
         mtzCIllaf/ePvSDWvfjkY8bzOukCLuZEhLv+tPx6/6zLlviwbobNeQq4vAm5nmHiJmIx
         gnZLZBJJkaK1vYHNjLXtfLXiBVwJXNUWiAU+n/cbgCJqcgc9jje/yY3pbzsP557lqJU4
         nEiw==
X-Forwarded-Encrypted: i=1; AJvYcCU3KXtTqjeaXyvXWKXY8rcdOuKBkrY+GElhJLW6O0FMDqpUZ5vTp9Fk2egZybal0Q/tvoRTKZPlUdLzKNQE@vger.kernel.org, AJvYcCXj6KzK93kmNZBcvFvxJHTZFuy6E8pIX81uvWnvqRQcONGupNatBAfcciJq4u/uHPxszBIg6a2CPzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4otA7rPBZ7zTXEM5brbwU+w9XxqkDr0zSjxPLZbAxwG9qIgif
	KRYh8PTUxSr9wD7jftJ0iNQoQ07zLrtzSsMDLdCWKAFSRry3YAQXzAbQOEAZQrDqS6dCdKXgLuo
	85pf24UVe5+YXWw2SLLvdSWr05w==
X-Google-Smtp-Source: AGHT+IFEzGlESH/8xUrK4RFZlGDsJIWxG2IOs8SWRiKC0UD1JGyzKSY5sm4jlfIeH0FDTsNo6bUukdbk7KgUfeHWVno=
X-Received: by 2002:adf:c651:0:b0:374:c847:831 with SMTP id
 ffacd0b85a97d-378d6243cdemr8132993f8f.55.1726450633211; Sun, 15 Sep 2024
 18:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <ZuQUOw5Y2hZgGyFJ@smile.fi.intel.com>
In-Reply-To: <ZuQUOw5Y2hZgGyFJ@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:37:01 +0800
Message-ID: <CACD3sJb43CYb3m8H44EuiQH8yw8TsDZSnd=5wZ2rYaNbVKD_wQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation, checkpatch
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

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:30=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:40PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
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
> Somehow your 6th patch becomes independent from the email thread.
> (Initially I thought it was a separate fix)
>
> Please, check what's going on with email settings on your side.
>
Understood. I'll check it.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

