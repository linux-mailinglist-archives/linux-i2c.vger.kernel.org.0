Return-Path: <linux-i2c+bounces-7982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746AA9C845C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 08:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2007F1F2138E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91001F4718;
	Thu, 14 Nov 2024 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2bM8jB4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246621CAAC;
	Thu, 14 Nov 2024 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570945; cv=none; b=Eqcfz3l/qX9aIuoLkZsuLHEm+voomJQlmpOtBuA+1PI0H4KUhR00Kxiy+4THG+eSEsPnWlLBeHCyWjh3zQTZ/7QbZ27K1Oi1sWOL1ilX/5fD2IC6co6S5H60sGL9U4lnez5EroN4bW7MxipFTVUZ+Jnb5JxF20i8hoaqtSZa/no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570945; c=relaxed/simple;
	bh=KIYoFbDin3lcVwyLqDPbArwgFa9vOBowKdR5I0YRv3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKZfagBqWNVtBQNzCjljfvBsR7F4E25BTO/SlX3alzWk5SgHHOdAzEHwZc0OCut8Z6Px2Vn4ntRH8KgTRGdKZT/E5gaM4OHE8ypU8fcLVXGihiqRMRtzkfa7pXdCOm1A8IiLuL6TpNTelzOIqGCtph+9lndhnn4hfqtE+Pepckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2bM8jB4; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-856cd075b3aso160597241.0;
        Wed, 13 Nov 2024 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731570943; x=1732175743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIYoFbDin3lcVwyLqDPbArwgFa9vOBowKdR5I0YRv3g=;
        b=m2bM8jB4NS4mOP/A5ScnAGSOo+mqinGQwEcvXoabXViSsaGOdnsl076bC3aZzgJE5N
         JtfsWHB1lKd8GSXr3y3ewlRBgoOmVCfJKl+LoajwRtvRqaD65LUAMvwaSP4+370tOrHq
         flofZyWxyWTDZ1eV+KC8xQ5dlWZ+zuNVM4CLId6E4THfnTBfJSUdUeN3tn4z16vTWiD+
         ik5XCSbcdV5fA3E/+vIhZZ+M4OGuyDdY4qVHT6Az0FbjRCz4A4XZfu5dA6dUwzWwBzh/
         Sr2M0+e/gHUZ4Q3ahA5OK9p6CGcc5kTNDgG0NuPsfoYYZPd+kYhAVdCZRBYs3L9lDpL5
         gzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570943; x=1732175743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIYoFbDin3lcVwyLqDPbArwgFa9vOBowKdR5I0YRv3g=;
        b=KzXLXV+YlT7kViUW0sae8Z06i3UX2DDEp8UQujAc6MPw5Mko/7UYooj2g3kyeaL0Bj
         I2+Jygz+HcMTm7kD6uJsRm7mLyjD44ykAFLIuErqzAVrVB0lz1GrexyAai3ul9tzyT3G
         zjhhbfGmRv8EqKtUejTTN2rol28qZLjbafQsaIzlEoVd3COXkyxOtSWy48EqRMKp4uNR
         6UnC/3IZD7WyZPTsrujZ94TdrJuwzc8dRCibvbKz+DU+xChyzOvtLMCrAAA0qMRFz2VA
         goLiIgw/Ua9v9ENGS4olA5aFw7E9PS7hat2eYCP1Xzq5LDrUyHpTR6Ue8cAWFJu/rt1r
         8ENA==
X-Forwarded-Encrypted: i=1; AJvYcCWMy2BMXaM+9G2I2p6ueg5bylg+IE8/9lr1zITBH0o7o25oujni6A8nUOvRI5dpzDO0Fmb3CokoPZU=@vger.kernel.org, AJvYcCX7+b3xFT7EW1VSgWCmKYyNR+e5EQiiga6GzyU883daE5Ys1kKIuHyJI+BWNOXpaMYIugvJ3f/yYq8I8TOZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8TEkhJBhXebkH/XTr8yJtnB8HBvLWpn8VSmN71jUraXYyraB
	kNbKshYfnydyBg8E6JdHzMr98TdF94IuMnMc/V3UmBvmzH9JSN8wEOxoIPgon1pUjkET8Q9YQky
	zDOq7iJGin/Yo67eKcCvA+ZExFmo=
X-Google-Smtp-Source: AGHT+IHeZimHONI8F5rMiQ6QwqJiUgYh9DKo8BSaqPnO7gDfdQOdApPukZRFOjdYUp6VoHapqHsR7oQv7EKAfFqlLkA=
X-Received: by 2002:a67:eb96:0:b0:4ad:48cf:c855 with SMTP id
 ada2fe7eead31-4ad48cfd251mr4937798137.15.1731570942930; Wed, 13 Nov 2024
 23:55:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZzH-KeSavsPkldLU@smile.fi.intel.com> <20241111140231.15198-1-aladyshev22@gmail.com>
 <fnjhtnnwuktkqj7ck7psc3e7potptogz2ioxw2lghkncd2ct7k@pmrk7angjkwd>
In-Reply-To: <fnjhtnnwuktkqj7ck7psc3e7potptogz2ioxw2lghkncd2ct7k@pmrk7angjkwd>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Thu, 14 Nov 2024 11:01:02 +0300
Message-ID: <CACSj6VVp14RJ2WTvB93SbwC0Lh7x2DiQpjf18VrVNCpXTU5s_A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: i2c: piix4: Add ACPI section
To: Andi Shyti <andi.shyti@kernel.org>
Cc: andriy.shevchenko@linux.intel.com, Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi!

Sorry, I just didn't have time to fix it yesterday. Of course I don't
mind your changes. Thanks for the help!

Best regards,
Konstantin Aladyshev

On Thu, Nov 14, 2024 at 1:50=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Konstantin,
>
> On Mon, Nov 11, 2024 at 05:02:31PM +0300, Konstantin Aladyshev wrote:
> > Provide information how to reference I2C busses created by the PIIX4
> > chip driver from the ACPI code.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>
> I merged the patch into i2c/i2c-host with the changes I
> suggested and I also wrapped the lines to 80 characters to keep a
> uniform style throughout the doc file.
>
> Andi

