Return-Path: <linux-i2c+bounces-6920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7697E4B4
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 03:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631B92811D8
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 01:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11042107;
	Mon, 23 Sep 2024 01:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu8++AZ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE1184;
	Mon, 23 Sep 2024 01:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727056786; cv=none; b=st3jB2FXnm5q9A7M/YV8CAU/ZMmd69k5CsGveYDupCCTui48NdPITOV74OdTCJzIrjpWjXBd3AdRRTKsM39okuQ9L8ftq2oXdC6AEQDxQ0F7qavfqeutJIHJbU9zZXhEm947RMTXxvsv/7pYYQ02uYzRyWKL8UXS03p83sbKikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727056786; c=relaxed/simple;
	bh=V9OJDWcCedhcvF99YMNzmIyX3NS41PyYP1HFztj9/E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Waqg0+2wyCf5OsytOCUb/5yhU3BBe9ckRWlMpZuj0pNJ1y0xJEbsDNcvX3QGEWBruyC0P0EY8O+yzVfqjMZ0OqMjgnwqweNLv6XbQ+xvX2ZRJdUtKiQcZhNxEwDghQ+JKlm0cq7Xsj9X7LLda7ub40EFsV4adZ5FWtO/FEVoq2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu8++AZ4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86e9db75b9so610615866b.1;
        Sun, 22 Sep 2024 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727056783; x=1727661583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9OJDWcCedhcvF99YMNzmIyX3NS41PyYP1HFztj9/E8=;
        b=Nu8++AZ4FrIlzBaud3UAnDZkI6WEF6u3IGMKv4MFkMM24Db/6ArZnA4wMSrYI2xlyg
         lWSHDJwYGNixrlhJnoymsOj4uw8J/2h0exem7D0p1VPQLZlUUt2hInQyE31NX530qgxS
         t6UtCoVKAXXfJrbFiSub5R9HlUGiNmXmYN644BxKKZfPE1ngLk/FgL/IrhvsZ1IwY39r
         4Fs9+nVlzCF3exZn28tm1h5TLa6y2hWrarxsvaAoDGDA58TSGd3KLWsEd33IAhOdfSPM
         c2W2w3VS9bqWEDhdW4HfhJlsR+gs49UWF/a/GXTUEGmqSzuviyCDO59qnN2z9K/ROAGt
         p5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727056783; x=1727661583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9OJDWcCedhcvF99YMNzmIyX3NS41PyYP1HFztj9/E8=;
        b=thoN+5OFouD+bv4eEzwkWwtGoeUDXkCUol4BcoTRxzqCCOHWzqGTv/7F8DZeFpru3Q
         onQD4lSpRN1JBcCZMa00MohrTAu2n8Dq3RJ7ZexuaPMRz4IEn0HxqNcSSZkKx4tsiMHl
         qxo56PO2vT8OtFSUq3J8hJ0vmNLSF9BjjKv+x5PC/sbmvoPjzzGDa8IccO3csVhgkIEo
         xj/Nojt9OLOCyiOapr8oG0DKdN68L0YlKAMsKPzDpp2LggoW7oodd2nVepWo8s9bO8wG
         +OJ40Uq5fsVAfJWHRy2l0v5e+l4HeaokJJ9/FCstPXvKebUWFgG+ny3l/x2LrOD6Q6t6
         4+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKz5XBnbOrdOoqfkSbdqHR9KZUEhrbR4pt9tlF65pk8yRQNjE208bJuJYr7AuCr0IylGxafCk7iqFWIUFb@vger.kernel.org, AJvYcCX4il6FaO/pBWv6ptUlyLXeWdpoF+ZAmiQMUUmCpvIOye2k622+VXmFFnd9JIGqUe1SRL1Pcz4Ljrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pgyPvJD4G6fOy7h4TUqfyjPTNsOeAm9+q3au8V/icxIHBkVL
	ZvHweaTwaGzJNoFefWIokAn02LAucKuRcyy/fH/AKDvhMRoL/mLLbj0RXWmlXmRcIDYIEgatLEf
	e7B6FYlUiL46fVlSfP922V9njnw==
X-Google-Smtp-Source: AGHT+IGH7hIQ6RwdGcaCJhgymTYoAwrIjsYdLmD0YE9w99TNSkrps9XHNNEM4U6mu/TbDbv6Y2vwBhmssX39HM1Yadc=
X-Received: by 2002:a17:906:d7e5:b0:a8d:4b02:3351 with SMTP id
 a640c23a62f3a-a90d510a5aamr966141666b.50.1727056782968; Sun, 22 Sep 2024
 18:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-5-kfting@nuvoton.com>
 <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
In-Reply-To: <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 23 Sep 2024 09:59:31 +0800
Message-ID: <CACD3sJbD4TuhDwazBwcc4FR2yK40LV=D-mk6VAKwNvxqAHNGLw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
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
9=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:33=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Sep 20, 2024 at 06:18:18PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
>
> It seems all your mails have an issue.
>

Acked in the previous email.

> > Store the client address earlier since it might get called in
> > the i2c_recover_bus logic flow at the early stage of the func()
> > npcm_i2c_master_xfer.
>
> You got my comment really wrong.
>
> func() in my example was to refer to _a_ function mentioned in the text.
> And IIRC I even posted the example, like: i2c_recover_bus().
>

So the commit message in next patch set would be like:
Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

The code comment would be like:
Previously, the address was stored w/o left-shift by one bit and
with that shift in the following call to npcm_i2c_master_start_xmit().

Since there are cases that the i2c_recover_bus() gets called at the
early stage of npcm_i2c_master_xfer(), the address is
stored with the shift and used in the i2c_recover_bus call().


> --
> With Best Regards,
> Andy Shevchenko
>
>

Have a nice day.

Regards,
Tyrone

