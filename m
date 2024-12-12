Return-Path: <linux-i2c+bounces-8460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D80029EDFBE
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 08:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B7616905E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 06:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F68F205AA7;
	Thu, 12 Dec 2024 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlhgRDsq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8946204F97;
	Thu, 12 Dec 2024 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733986712; cv=none; b=gVTLn2QUVQ7WyFicjJWrpD+4L2Y/7rkMYk+FcKD/7afCpq980jsuOytCuY/EGXlN9BtSHpd5s4QecbfcdPWgyNHNfvjjD1jIf3VZgSlmlxUtihpHLOu45wFh441l01BYYe+1FTYgdouZAEQzUhQc3K4456GNEaYCftEbrS63cFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733986712; c=relaxed/simple;
	bh=tl3YxfABMq/tz/S4rtg5u0jspXirem5riBalXgnXggg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UB12sEu4a5rJDRU+zOtbJf0dGkraxPjtJJh8CTMrN8Opuba1XZJdfazVSI2Di1AG38W6RhosqWlf6G/IFISrQq0M3PbDU6/SfetpYTQN84nNhoZI5akdO57GSe1dbz59AuxsB1iSYxxE7yLd/h9Luqcw0pEt/CXN+I/BCpzn0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlhgRDsq; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6efe4324f96so2166087b3.1;
        Wed, 11 Dec 2024 22:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986710; x=1734591510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SBbQIRgkoPJ+zE2Mc145HJltZD8ZKGkbTApj4NmDlM=;
        b=WlhgRDsqPrN3haeUwYNzKbW4/pMUY5uH/+of8dbnb7/DANaA7B0bnEPsK/kOBPmPPO
         vLzQC7Hih2ykC7jKfuhe/EV7oxVxA/hZ7yrKrSxiAlUW6W8mCK9KxLoG0a3hYIUGCh+X
         YXXcmkeDJL0rdWiE8pS0aiiHNv0jjM30Men2NF45kLN5pCCsQ2MG4PYdC64khsUWB2Jx
         2e+t6Ps7b35nXRMqjcHTczTCEgOUKIXg86LJ3yU/t7T40FcHpjJBiS0ufMTP4Jh97wkI
         1uSw5qRlMkQqTGizHSTmgjjlyJtQzxXYld0VJPS5/P+GxuczRtdX9b8W/bZoW0YC31v/
         VkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986710; x=1734591510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SBbQIRgkoPJ+zE2Mc145HJltZD8ZKGkbTApj4NmDlM=;
        b=NlXrAFVOeFTiwhbJdLAEi0rAcK5Ie+eQ9k8ouMT5z3pa4epNY7llklDBbOjnlI/Fp6
         shoA6L8bzHIyjLabWcG4z9Dy2JLsrPmeOh0ei/QkAj16YUVp1m3za/HXvCGcuz/uT/vJ
         gPsh6L4qzTsLqs6awXi9y9jrLCr2FQcIDPznYeUMKTrdYS/xgQxQTV4/7JDmEaLBnEp9
         6VfByUrBvJTI/kHrXK8YN98lLlbJtPxJOP3M1tMhq6WBOZWhm7ViDwq6h2aeJB19SIE3
         aAJVOpzg/Sob/Bk9MWf88xLZChdCgsQXjagxIMhNgGqN0qiTbc4oE0AJ8wBp7ZiMp4Dc
         +mAg==
X-Forwarded-Encrypted: i=1; AJvYcCUexvv/WSM0tS4yCYiUQQCkS9J8aDveKrzLN8oDPgrNQ1RnTWr0UFMa/5DJenklo5V4SrpvDCxtBskcxA==@vger.kernel.org, AJvYcCV9ziBi4zrUnpIDE/3j+KZZz2LXjvwRGxqNeUpo98Ze8JuBufpmBvVYsAJf+vdTC0IxnAYU1bTlvRRm8EY=@vger.kernel.org, AJvYcCVNxU9lZC5PugbGf8oQQ+Lw2sSW5MJ8pODz343gD9ph3EpnEry2Bs4SdTnCKoTXSjXQx0+ikRjA@vger.kernel.org, AJvYcCVQl96U9ynubGQLYvEZZhM+GHoq8qLOTnjUYA7GBN3f0jCVkzEiTVgljF9F2YpRViGKT1xJyOwUkAJi2Om3@vger.kernel.org, AJvYcCWEJuLRaHLboFmo/kc9p0owpRmGTIpt6zKoChvlNV9PBK7eIsN5WAbtGfa/hyWVjbVEi2n2zmOYt7I6jd4505A=@vger.kernel.org, AJvYcCX+ajFMYet8tlpEqoajQSwN6Snur1kbhanLq1ksBtu8XQYpZpOFejugJZKa5auHrQbstTqJOufZkOw=@vger.kernel.org, AJvYcCX0qQgxyJfroRd8DstDB5W/mCSQW3KG8WPrdlLDkqzlsl1pKldJc3L/94/5BlXK8kjX4Efje/npM1nZ@vger.kernel.org, AJvYcCXpdBIYrJybyqkYSxhQWyC5v0dTaHCuDlKLaEmWSWouk0QBCagi48eMVomz7zYq99/NTrLuFockrKWn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8df0HDyoy4tIMD4bFAR1G6BnpvcSJ2cjssY0QXD6lYVoQFcGD
	3aZDf12FAceImLP6VRwrs2qOpRkFEcHGlA3mNKVLg7sWXn4WQVA0/DXC1OY8pvTUbd4E+d24JoD
	F2XaHL34T7MBZj6+VHBj4s+EKj7hLmqi5
X-Gm-Gg: ASbGncsuRmTSrdS5xoQ9DzVk4lIX8VC/R0lk+jV5vjWH+waXFEL90+s0fvEqxao4QH+
	spPdxfilDSuDY1lcbGUH2aCDilw8MsaD2fZwYVBXNQENx3bxRS2bgLJy5ea9L7vkv8wJ5m6Q=
X-Google-Smtp-Source: AGHT+IHc27VmMPaQKcl6qXX4RmzgpwyBgTIEhwQilPevJCxIgXv2yqNK/gefN8IqBrHmgs1Ap5dwa7zLzHGXTy4QZuA=
X-Received: by 2002:a05:690c:640c:b0:6ef:6035:8298 with SMTP id
 00721157ae682-6f19e861171mr20988847b3.36.1733986709785; Wed, 11 Dec 2024
 22:58:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-3-tmyu0@nuvoton.com>
 <CAMRc=Men4QM3a2rydxDYwLjJLYPB7Uid=y_DJ8YNa-So2H3NQQ@mail.gmail.com>
In-Reply-To: <CAMRc=Men4QM3a2rydxDYwLjJLYPB7Uid=y_DJ8YNa-So2H3NQQ@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 12 Dec 2024 14:58:18 +0800
Message-ID: <CAOoeyxXP5nY5edzW32sx+QS7sCSzhykQe9v6f-OHWOStwBDggw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bartosz,

Thank you for your comments,

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2024=E5=B9=B412=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Looks much better now. Please address one more issue I just noticed.
>
> > +
> > +       mutex_init(&data->irq_lock);
>
> This is never destroyed. Please use devm_mutex_init() preferably to
> not add remove(). Also, the other mutex doesn't seem to be initialized
> at all.
>

Understood! I will address the issue and include the missing part in
the next patch.
For other drivers that use mutex_init() without destroying it should
also be changed to devm_mutex_init(), right?

Best regards,
Ming

