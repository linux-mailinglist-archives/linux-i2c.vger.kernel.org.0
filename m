Return-Path: <linux-i2c+bounces-6755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3AC9799C9
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 03:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E688D1C226A5
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 01:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827F879F3;
	Mon, 16 Sep 2024 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPL2KY8P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D06125;
	Mon, 16 Sep 2024 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450557; cv=none; b=fBVkjV5QuaPMScR1cCdNb7G3ja5DgpACEZnH5a5MaQ24xuAhUMYz6LRzBdbf3zMSf0YtO+YRiHyjBUTrOyrnFuTSLwhNed/VW0VQ/HhRnLm1wyZdkPiPJjZEIvfSD5orS1Zn6FtpBebGdXKSc+XtUX9M5oWZarNINjylte1KHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450557; c=relaxed/simple;
	bh=dk0D2Nu/S7DZFSqAvVBmYJDabtPD4bn2iDp41GgT2gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzYlpFTjI4nMc04C1X9m3If1gNQ+L+dySwqELUWgnPCxS7GYIwIPJeESfnWnJ9FQ+Tw7aQeo3E1lVqCrKWAoszZbI1DPsO57S31UqssNqx6zWPtjN7mYnaKex8mn+fM4wqAeHCGMQe3WynZw9Rq8//uRjv1skDSan/ySTJtfMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPL2KY8P; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86e9db75b9so621424666b.1;
        Sun, 15 Sep 2024 18:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450554; x=1727055354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3Opgofkq69zE6QCehvO/0WQhRq7E+ZOUJLxNG6PQyU=;
        b=BPL2KY8PB6sUlJbmvyWsFHDrroUWsny4h5vWRv/cIB+X6jlfG7/vAHKsfqLxGfoYUf
         tldvGI2MC+oZ+CLcFhiX+M7q8fp/oag6vWYfBIFBKLhmMfx4SwE5+BP/L28GP0KuUtRO
         bVhjp+piMiJjUk7wvsv3L2suWUskQ22mwmkOxsxyDHjK1LJoKmweVXaptugcW1lXdTs/
         8Q1a+vAvGv8mwhDjbMahw2iZk3z4vqVxJoru3VdfFyNBezCwiC/i5sHHNy53B4Cl2ZEo
         xdXec5awjMJsRmU35mjiWZkvttQAtrUCHuSPoMltTnNCPbPazc73neH0Np0LA9Vs9BQv
         kEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450554; x=1727055354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3Opgofkq69zE6QCehvO/0WQhRq7E+ZOUJLxNG6PQyU=;
        b=nkOiKA3Ygh2/GeUC6NDKmDHoSU1Fmik7knS3Z7cv/x7l/k4mPXHO9uSxEpY8AxSLLn
         Wol6QqwNKWO6nQWQLKV+UGCLry2qF2txwVSSFIjyvE6T1DFLrIJzLyQdVE4e5m2NxmdI
         yWTaQUUZHyTyz5uq4W0cYzJtRvgz1AV688dmj0sqExnZvpUpyHtMIUuiGSdzf5kdzqxF
         d4MjmeY8nY14PLg2u3pThT/7S9SyVwd/kACDhbY2oYUx4ARMnRRmvO1XCZvtG/+Kvk8t
         j3YH990QDvJ14SxOUiH17YQ6TA+XNBbDVW+UpSt9wg6mv5TLmFF6QfJpNd58Kdg09TqX
         y0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVvIbU7VuSEeWWG0phtO4P1Qo+Z9liIBTKNPrTqtMnTcDE5rI4o2/q4lrGlf5kGQ8YkODUwoOD4FOY=@vger.kernel.org, AJvYcCXR/a4tRC0CIkr1F3gKq+zoQqY0Cg1PsH7dXpf7f+I+INS/MoiSV2/n/l72VOLaCotunupGfSo2Ypfx1h2V@vger.kernel.org
X-Gm-Message-State: AOJu0YwpoJO30xDydPymX4Pgfhl+svQua5tbJcoXmkvbz3aZPoOPhntl
	JQ/bk7wA0BO8Lnq2sXUD23HPAFB441sPhYtjzV1ATINp1Q+ToFxuIGthMVND1xpiII5l1RWAvyg
	IFenA0hGDLcwlQlTudYzTGuzK+w==
X-Google-Smtp-Source: AGHT+IEO62RmfPKA1taE0s+BQuDJGAh3xFptX8NIrEJDh8tUggxJEVWWR+hy0jIiUhytHDQqg3LV3XdeZU5inzye0J0=
X-Received: by 2002:a17:907:efcb:b0:a77:f2c5:84a9 with SMTP id
 a640c23a62f3a-a9029504f45mr1448444966b.18.1726450553787; Sun, 15 Sep 2024
 18:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <ZuQUfCK7d7DuR9eH@smile.fi.intel.com>
In-Reply-To: <ZuQUfCK7d7DuR9eH@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:35:42 +0800
Message-ID: <CACD3sJbv60bYc_CRSa+YEAJuthqDxCu6pR=pgSsKX892LKNHww@mail.gmail.com>
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
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:31=E5=AF=AB=E9=
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
> The series titled as "Bug fixes...", however I haven't noticed many
> Fixes tags in it.
Understood. I'll remove the "Bug fixes" in the title in the next patch set.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

