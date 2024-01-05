Return-Path: <linux-i2c+bounces-1134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D208250E8
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524741C22E19
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1705399;
	Fri,  5 Jan 2024 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0FgxWtzj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC1249E9
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-467a7a376d5so353220137.1
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 01:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704447329; x=1705052129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy16Tgdqsd1dMaFvlOtPKKKWpKjxuB51VsAzz0kP9wk=;
        b=0FgxWtzjLWMlZjH8t/S1gnvrCJXjTGsU2muntNXQpSiDxgyQBcQsR2i9IRG4aJqE4p
         U47tY3bGaZwdSQo+Peus8O7xL/y+t2vRmDQCPnm1/jUarM0FTpx4eX4JOvE775v08a8d
         9tVGi9tnIKmGG/PqjSZjN1Focs4xgBilQmQ7mMfWNrHPlG4GhNtym7kRL2GQuB8v9CB+
         GfrB5KDVPq684ZZ4qIg7dHX8MZjEjMznNsh7O+Fd8GeJat0geqZZush3fs4EvHCFjXPR
         VVIPgtPmEyJ6fmR/LL/dSbM+O4IyhCp9cuatiyXGtIUCMFY5y3JM689FdwPPaa3NXvLZ
         UWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447329; x=1705052129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy16Tgdqsd1dMaFvlOtPKKKWpKjxuB51VsAzz0kP9wk=;
        b=H/EoWzEkuHWzcV8smHSdLNnzToUhrcZMowuBJNYTAoQ+wzpnwSqw+dZJPIU0dy5yrL
         Y5H3GIKuZxJK3S7Pez1MZ9NPo2ureAV2mPafUN2KjiCXiLNuVzZu/xNUbytxHgelnYKB
         lCfmh0VStz+leyABTlfHwEVacRV1XFtcxGEbRQBdfGigOJxgWqPic+tHkKVSr/Ci1Zpt
         SfnPz+apoOwaObR52O7ZXioU2Fi6pwgELYKcBzj8aki6U/MjIQVKg9OUOo4pKwF5LTiD
         F5HOphUzP5mrV4x9d5xMiJXx3PDKvjCOA7tJc0YpnLR/50jg4NtF+8ST2pdgFv0QVQGP
         9vSg==
X-Gm-Message-State: AOJu0Yy3MiX5Gq8wcnp07nh9SZW/Ihk9Af/EZNjJJait+aO7j9hv4LIR
	6Guj/Z3znoxrSMU7kFwnVbQjb5ZmDfH3E+Z/MfgpzH52le5hkA==
X-Google-Smtp-Source: AGHT+IFN7wOscyDLPc9Fg0TghGnW4saxtgNggK5nFmWTV5+OwyVaEHnLc21Dd/TxgiJs8F8Izjiw2f+5AFYNiXhPxfI=
X-Received: by 2002:a05:6102:3708:b0:467:b707:f480 with SMTP id
 s8-20020a056102370800b00467b707f480mr207264vst.15.1704447328837; Fri, 05 Jan
 2024 01:35:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c3045427-da42-4f7c-8a96-3c4756646cd0@gmail.com>
 <CAMRc=MeKEVFFE6Pw3KBXTVgA3Y0sUswBKAWqEOSDyZk_QLhQQA@mail.gmail.com> <a1e908ce-9d5b-4d0e-8002-b25d4b6a7172@gmail.com>
In-Reply-To: <a1e908ce-9d5b-4d0e-8002-b25d4b6a7172@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 5 Jan 2024 10:35:18 +0100
Message-ID: <CAMRc=MetjCb-42uPBEU53RFD1_CcwJ9d22eGHbX1HESOdp1nig@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Use pm_runtime_resume_and_get to simplify
 the code
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 10:32=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> On 05.01.2024 10:22, Bartosz Golaszewski wrote:
> > On Wed, Dec 20, 2023 at 4:11=E2=80=AFPM Heiner Kallweit <hkallweit1@gma=
il.com> wrote:
> >>
> >> Use helper pm_runtime_resume_and_get() to simplify the code.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >
> > This looks good, but I had already sent out my PR to Wolfram when you
> > sent it, so I'll queue it for v6.9.
> >
> I just received an automated note from Greg that he applied this patch
> via the char-misc tree. The same applies to "eeprom: at24: Probe for
> DDR3 thermal sensor in the SPD case"
>
> > Bart
> Heiner
>

Huh? Greg, I typically pick up patches for at24 and send them through
the I2C tree (as per the MAINTAINERS file).

Bart

