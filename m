Return-Path: <linux-i2c+bounces-5104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BFB945E54
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 15:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055491F21E7C
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 13:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55271E3CD2;
	Fri,  2 Aug 2024 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3YqpzYi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EBF1DAC5F
	for <linux-i2c@vger.kernel.org>; Fri,  2 Aug 2024 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722604014; cv=none; b=Liku5McDgmK1EWTMNHdVo4FH3rKuJNXfb0eLvqrzwAgZ6NZId+ClODninZ4xV65hoV2+tk4K1+FZadWwUgS9IkGlYVYJI0ulKQqw1yduIWl7k9GDCcWd8oiSYBquXPtkOlzmgVYGrjqWJv1wBrpztjcwg9pOlZ6bTI774UEmFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722604014; c=relaxed/simple;
	bh=2a65eTmrr1meb69sJwZD3M2pOILYJP+V5IiAssjLCNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLKlMW2hETj9mskJHawIPbdbR375TD+rB25Nkf1hqnapZcwPRNXzoQlAyK+8CRrD5ztJVpcfiV+3GPAeZzZixBfND1N9TJ57JYvyyTeBhuXkrm+F9R52o5ZbHo+UnU3tggNtZlE2HvTZnYK4zYRqaW+mKlYOMJgph1c6TsBWMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3YqpzYi; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135dso626782a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 02 Aug 2024 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722604011; x=1723208811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIO8eCgEJmr4ndeuNxHsAbAFuAOKHxaXfktDyewoPcM=;
        b=L3YqpzYiAc7uegU18zwjlHSCbnsAth3Qzw4+JE5QAZQkLkJTdLHTpAQNnk7Y4EdRUl
         1juhjfzC+TmLztXl6flNauhjeFY07P72narOxrZzKPZKuqkSaJPLPJpQnZpeVIliZsvt
         07HkW/tn1mjC8dopkhEq2DFihLfMCeyAKqS4Tig+JvXQl/T2IAC5Jlu2quDgFiIcSf24
         I1CKlx8Acx76Q5QkNBucYCJiaiaR3BipohAW7Lce4INSEUZ4sVXKuojO8f4MqXHGb9iC
         s4ZOoZFum3fB8KC/XSLBs3skNuTt+8/3HOT0Bc3YDyRUzfUpnfrd2Z9vUsXN0oABIz95
         P7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722604011; x=1723208811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIO8eCgEJmr4ndeuNxHsAbAFuAOKHxaXfktDyewoPcM=;
        b=cWpTgBds/iLrTTjAg51iFohvWWrt3Ffo/kOMSUhX98CQ1c37NzABPxzxUoD1ZhmUJ1
         Qov88Odq2hSo4+PEsUiiu9XnES2IJSYn6dhIWdj+wGS6FMmaf94CEupgvoJlBbvQQRql
         lm7wm4dGjaL8vi3pwKP4DeQrb43Z3rvzYwtAr6tzTVFcR9RIo23Y6yjqUEaW8m8ss6hf
         sjVQg9oJokKGIMQscOUt6qa0iqFP8fWWq12c/R/y46kbWYwiHa7saWlim9ub20WxfRPO
         Wct3mxhHn8EH8cxH3O69X6somNdi1baHN7mFIcP7xNN/RS0nKeEyngGpS4oVlk5lZwQM
         pGnA==
X-Forwarded-Encrypted: i=1; AJvYcCWOeeYs7D0MXQzvHcm5QziaJEIk+pxFSWTAl4C+c8iy8F4gfmIG1r1As375Vtvtsjm2kkESWI5kS6318sJZsCr3sRInlZ/l0/+h
X-Gm-Message-State: AOJu0YxcJejEPSdqM+mS75HTU+liGvorrFCJEN6Fb64rtTJQP4AHxIFI
	sNd3YFRR4Yk4FaPj+fwDe+4WNdq0Jyp3+twhjHZRDfqObBkNQw4sWWcxqMWB1/UoBoy1oRw9zWb
	Iih9qDXP6sF8b8WvlA7Z/N/F+rH8=
X-Google-Smtp-Source: AGHT+IHu9UBAIM+oeQsMXVFCMRsPUz5BdMbMDM0F18KCi8ewoKEzDbaqdZiZrYnc16KJecA+vnu2IOkOq3brZvXMe4I=
X-Received: by 2002:aa7:d357:0:b0:5a7:464a:ac0 with SMTP id
 4fb4d7f45d1cf-5b7f38ebc67mr2237942a12.11.1722604010859; Fri, 02 Aug 2024
 06:06:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717065917.18399-1-ahuang12@lenovo.com> <8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com>
In-Reply-To: <8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Fri, 2 Aug 2024 21:06:39 +0800
Message-ID: <CAHKZfL1fzN5EiGJkv4gpbppOwyfyexH8b+xLgJQYEGRg+LXphg@mail.gmail.com>
Subject: Re: [PATCH 1/1] i2c: designware: Fix wrong setting for
 {ss,fs}_{h,l}cnt registers
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Adrian Huang <ahuang12@lenovo.com>, Dong Wang <wangdong28@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 1, 2024 at 10:10=E2=80=AFPM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
> You are correct, indeed driver miscalculates those timing parameters in
> that case.
>
> However debugging point of view below is misleading since it doesn't
> necessarily match with HW registers since they are not touched and have
> values what bootloader has left there.
>
>         i2c_designware i2c_designware.0: Standard Mode HCNT:LCNT =3D 0:0

Indeed. The debug prints show the incorrect info. Thanks for reminding this=
.

> Would it work if patch just reads the dev->ss_hcnt, dev->ss_lcnt and so
> on from HW registers in case they and ic_clk are not set in
> i2c_dw_set_timings_master()? Then debug prints and HW values are in sync.

That makes sense. The v2 version:
https://lore.kernel.org/linux-i2c/20240802130143.26908-1-ahuang12@lenovo.co=
m/T/#u

Please kindly review. Thank you.

-- Adrian

