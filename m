Return-Path: <linux-i2c+bounces-7878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FAA9C140C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 03:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FB891F240EF
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 02:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E541E4AB;
	Fri,  8 Nov 2024 02:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4JdFb9+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9F16415;
	Fri,  8 Nov 2024 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731032874; cv=none; b=bGbZsaZDQJTCcY5IipwxO1p5y/s3joIkur0kN2rGypwID8geFDhO1DCZFt5weYe4MbGrbO+u1wx85bAfks+Er2yla9PRotE8Zf1G88OKTz2RCYQYxTOE9+RjRBsXc6OnVITc2D5uCreO6kZUI+/HcnSBqQ6xgDR9S1iTaCY9pZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731032874; c=relaxed/simple;
	bh=TetX7Hi8Q1ybOcxgSqUMEamaLb2Qk87PTjsRoqlWyuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nyd/aVaMYBZyf7JwyIj9uBV5nOD1A79YZqCKkkhuGHosi9+wXmwF3w+D+eQHati+f8z54lBYfVR/PFVF12DRC+0Y9jOKN8gTD21ICXGY2tLmoYYPmENfEESrLRnQ/I+meoUjZexCNhtmun3eSQ8p/3/1l/bYNI9FS7v3PZUFwiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4JdFb9+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4609b968452so9830221cf.3;
        Thu, 07 Nov 2024 18:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731032871; x=1731637671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr8eRs4SHjPP0r1sxbAC2kP54V3AaKPgJpNWlRyvXaE=;
        b=V4JdFb9+s8NQ9K7NXy0OK/qNXdFRjyX+rkI7ih+fEfjJcG89dBuGOgBj+pdrxDnyXb
         bjNrsiz97foFIZtqyog1ugDff8vobXSs4GJWNutqqkPdeVAhQ4CWjM5NWXhxxJweNJ3v
         sNs/VnW2KcqIlGQ6zWKk9JO8717dpvhlkgwXTtbs4DCAdrZH2awBvF2voW8eQ6fh1cwh
         luIDj4C0UJ0M5Z3GZuglrneIg0jpVUGfTnI2F3DXcVPKLptTXaHdnCGDBZztKBGhhaYX
         IOAES23COAwlhawhqYOOWNn1d26JPcDuNiLPSzws20os6z/1MY0TLCJVcYltzXy0ksl1
         ymmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731032871; x=1731637671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr8eRs4SHjPP0r1sxbAC2kP54V3AaKPgJpNWlRyvXaE=;
        b=GKfBg27ECMj6lGgdVD84Y9cydTHkAYUlhHlNEjxrUUb21EkBe+LMdA42df9CwqkZJT
         yGy1K+4xuy/lQ87G1bRSrV2Y0VyM4rqnOljSnu1EKbBsSvPYefZmB3US2miG9F9G7VQt
         3s6Km2XDvivdleK+lR7t5D+7m3/Rk9TMVXCaa8Y5uccnjK5ux/8xCbnCE5St2XiXKqk1
         XxKsB1u4XGSkV6T6oKqgadvELllO9eoBcUOJKnIAPp8zaHrtVkTFh8tx7cjrNEEEPG8d
         ZQfWG5CzMx/02U1hO2Hi5/M5Da3mOIIxULpPvrSOdaF4gRa2nXE47js+9QFA4xO+9eo5
         lpUA==
X-Forwarded-Encrypted: i=1; AJvYcCW6qMK0s1U3DmJPHnF+CKDI7Qa6JVi5zBPaX5xvckDkTrc2adENLhtxwmj0ghQn8SqLjcD7+veqmeg=@vger.kernel.org, AJvYcCWSZeYZY5AzUPu0MCh2nJ3gzxtDun5/JIorKU8dyjJIcp1MaeNITFCqGzQG+BZLFo0znjWKG0rPwHkjBiSj@vger.kernel.org
X-Gm-Message-State: AOJu0YyYqeXM6f4dE8jDpfcLoFnSF462Bi4hbIZQaKeihAFjnCeTtkwN
	grgi0/GSjRPqCMENTA6qb8ArNGq9WW0GG2wZb212K5QEuvvtoV1mf3RaNoKlhpxENP08JhflURZ
	psDiOe/Qw6n5HOtbX/IwFG6wo0z4=
X-Google-Smtp-Source: AGHT+IGstj8nLMBZdK2Z1wIjI3I7rWSl0VEyifRSPPCGHaKum3jtVpH8xqXOtRxg5JmV/A5VNiW2fozV+dPrbpUNYRE=
X-Received: by 2002:a05:622a:4e8a:b0:456:801c:a20d with SMTP id
 d75a77b69052e-4630930ee2cmr18727101cf.2.1731032871559; Thu, 07 Nov 2024
 18:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
 <20241105161820.32512-3-jiashengjiangcool@gmail.com> <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
 <fj2vssllh7zgl76a4jfakrcngcflwvqxzwwa2dhpkauli2u7wb@pz23fznmy25e>
In-Reply-To: <fj2vssllh7zgl76a4jfakrcngcflwvqxzwwa2dhpkauli2u7wb@pz23fznmy25e>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Thu, 7 Nov 2024 21:27:40 -0500
Message-ID: <CANeGvZX05=ePpV4iG2EAQtdnx1x7xNtmLXWe2iH7ATwChPaQpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, rmk@dyn-67.arm.linux.org.uk, 
	max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 6:01=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Doug,
>
> On Tue, Nov 05, 2024 at 01:29:40PM -0800, Doug Anderson wrote:
> > On Tue, Nov 5, 2024 at 8:18=E2=80=AFAM Jiasheng Jiang
> > > Add check for the return value of clk_enable() in order to catch the
> > > potential exception. Moreover, convert the return type of
> > > rk3x_i2c_adapt_div() into int and add the check.
> > >
> > > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > > ---
> > > Changelog:
> > >
> > > v1 -> v2:
> > >
> > > 1. Remove the Fixes tag.
> > > 2. Use dev_err_probe to simplify error handling.
> > > ---
> > >  drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++--------=
--
> > >  1 file changed, 37 insertions(+), 14 deletions(-)
> >
> > Wow, this is a whole lot of code to add to check for an error that
> > can't really happen as far as I'm aware. Turning on a clock is just
> > some MMIO writes and can't fail, right? Is this really worth it? Maybe
> > just wrap clk_enable() and spam an error to the logs if it fails? If
> > we ever see that error we can figure out what's going on and if
> > there's a sensible reason it could fail we could add the more complex
> > code.
>
> We've had this discussion several times. I'm of the school that
> if a function can return an error, that error should be checked.
> It's not spam, we do it everywhere.
>
> On the other hand, there is another school, bigger than mine,
> that doesn't want such a check.
>
> I decided not to bother. If someone adds the check, I'm going to
> accept it. If someone doesn't add the check, I won't bother
> asking for it.
>
> Said that, MMIO reads and writes can fail: in other drivers I'm
> seeing bogus reads due to some firmware failures during device
> reset.
>
> I agree with you with the rest of the comments and thanks for
> checking this out.
>
> Andi

Thanks, I have submitted a v3 series to fix these problems.

-Jiasheng

