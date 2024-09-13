Return-Path: <linux-i2c+bounces-6672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAA9779DB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311851F27061
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 07:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2370E1B9847;
	Fri, 13 Sep 2024 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYBkklt+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF371BBBE7;
	Fri, 13 Sep 2024 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213290; cv=none; b=I3Xo8f7ZnSM/QtDuPuRt2/ETJceC5PexKiw7SMj0s+IOijf0EdQPcsGUHTVL9n0g56cTVKaPu62k/QP+0+IZBhXNPZ4J6XxkQSmCrmJvpmizkpZ0dw+iUWiDV2ayIwl94fuXvXzriYfOI2cS0/94l2XNTFlLq6y/0jczbOXvcNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213290; c=relaxed/simple;
	bh=zeg2qkt/gbPvOI1XbrcEwUkJJMigRg4I2dr171V1oVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHm0N7zPCzMvjwC2o8+YeIsZVy+IWCrrkuQXUx8hffNMrhhd8ijmM+lXz5H1rmcMhJecj3kSvjdhlP9/gZ2lbLmZ0oScqvYZVFPd4KMNV0q9PhawjuKJw3FqEUcVfgVNmsbkq1WFJkQJTVRVXPKefWSU7Z2FRqvxiqX40QV7i7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYBkklt+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso978951e87.2;
        Fri, 13 Sep 2024 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726213287; x=1726818087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aqKHDGgT/Avl1l2iiu1IVAS8Az57Nt5afFHheXxbWg=;
        b=XYBkklt++RqmUoNGDWOUP6SVHMaHn0wgm3tKpPAZMMYYBCqU84wju5gSYLYsuUHDOj
         c2biJWBvDkyDLl8mk4TtSUiuNa2aAvhhCGdBcB0NetyIth31ePwVJyCybo6T3qgtgX7A
         KnAg68Nixf9BNiiaVgcNHFFYG7AL+v89cB/00LnnhCApcbPCqQtBIf65pzBDCzwJE8HZ
         3dj370yEcH4ra5Jeq36Nj1fftdfZJs4a/kxBkBQbUvCIhjAVpZ5C0a+nI9IWkDAj1CM0
         6B9ZCdEFkxsVkJngu2CmraOH1aQQR1hlCv+r8m1dzJxXf7luwz06kWEbUv9YOcKhDdSJ
         H0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726213287; x=1726818087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aqKHDGgT/Avl1l2iiu1IVAS8Az57Nt5afFHheXxbWg=;
        b=ZgHB3NCo6yr6sxQZyto3HMBHT9/4xoZEpCDJaAObnRQpmY4K+DyzePjz2Wlf49ALp0
         3X9eguTWdwq76yRfTpw58zOQFl6YMo0nQB+cHAs8oScHxTd5YrwvN4v0rVIFwu6U+peB
         V5NLWYgRycPeWAUU3qf9cpAVtpuqrJ4Fw/LFaFKNJYFWrLxHWJWw6ZN83LWTfjwuLlJ8
         GkMpuxGImk+aOhqj04ZYC0ODy+Wyf3b3PJD4CxpUEYkYLWboMleqHUyVWjvg6JqiIQry
         YXQLl5Eswk/z6NjN6jORd35XhfND88f9rogjJKRQz8GDQv38otgG8tcZ2H6cZ7552GWg
         qmqg==
X-Forwarded-Encrypted: i=1; AJvYcCWHDKNz/BRhBp2MMMAuUp2SZ4pzN69yeGvfnXKYUd23qY0wIbHWmiGDjtl0nmlNyJ5P4pNdkh3U93otEBdZ@vger.kernel.org, AJvYcCXg/slqoe0oh5xqy9z/MCkNAY2nOaSUtkv/kxfzGR0FTevUZXSuPYaqafIcUyRkLq6JR+ik0t2V0Us=@vger.kernel.org
X-Gm-Message-State: AOJu0YygqMg8EaR0vIcNR3ia+21I5ZYZJl92liCJkKW2ykDbgheTwvtv
	+8Hmk9U2G/DLSFsqe3qZrfBAIb7QDcXXj15nK3kg7dfj7S5BOIUC+jaOrPYUrrxPSstnOFL2GJx
	MAGX9t1xwgOug/P1RGR2KnApwurfxreQ0SYM=
X-Google-Smtp-Source: AGHT+IESt59jRpVTS7hGAYllFP7xe2ESqy6lFpk8iaKA1m8Mhdj1PjseowShMAkgsqkdtMWbybjcUcWnENFtXBYfups=
X-Received: by 2002:a05:6512:1581:b0:533:4497:9f29 with SMTP id
 2adb3069b0e04-5367fee953cmr1429735e87.31.1726213286955; Fri, 13 Sep 2024
 00:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
In-Reply-To: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Sep 2024 10:40:50 +0300
Message-ID: <CAHp75Vdbr5sJejwfkxYrgkdNMMZV+D5w1mipTxz=R+EkEUrA0w@mail.gmail.com>
Subject: Re: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, andi.shyti@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 6:35=E2=80=AFAM Kimriver Liu <kimriver.liu@siengine=
.com> wrote:
>
> It was observed that issuing the ABORT bit (IC_ENABLE[1]) will not
> work when IC_ENABLE is already disabled.
>
> Check if the ENABLE bit (IC_ENABLE[0]) is disabled when the controller
> is holding SCL low. If the ENABLE bit is disabled, the software needs
> to enable it before trying to issue the ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
>
> These kernel logs show up whenever an I2C transaction is
> attempted after this failure.
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> i2c_designware e95e0000.i2c: timeout in disabling adapter
>
> The patch fixes the issue where the controller cannot be disabled
> while SCL is held low if the ENABLE bit is already disabled.

...

> +                       /*Set ENABLE bit before setting ABORT*/

Missing spaces

...

> +/*
> + * This function waits controller idling before disabling I2C

waits for controller

> + * When the controller is not in the IDLE state,
> + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> + * Values:
> + * 0x1 (ACTIVE): Controller not idle
> + * 0x0 (IDLE): Controller is idle
> + * The function is called after returning the end of the current transfe=
r
> + * Returns:

> + * False when controller is in IDLE state.
> + * True when controller is in ACTIVE state.

Yeah, I know that this is a copy of what I suggested, but if we going
to amend, these should be with definite article

 * False when the controller is in the IDLE state.
 * True when the controller is in the ACTIVE state.

> + */

...

> +       return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +                                      !(status & DW_IC_STATUS_MASTER_ACT=
IVITY),
> +                                      1100, 20000) !=3D 0;

You broke the indentation again.

--=20
With Best Regards,
Andy Shevchenko

