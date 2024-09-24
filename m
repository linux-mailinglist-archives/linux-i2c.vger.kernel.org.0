Return-Path: <linux-i2c+bounces-6960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7B984963
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 18:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87361F2439C
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 16:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC971ABEBC;
	Tue, 24 Sep 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ez8/dkEq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E796D1AB6EC
	for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727194434; cv=none; b=fInFbZutDlzUxHNqhq3O38/NI5/XB7z9fsAm9wLvNylwprNV2aoJxRkp8uAm9RqnVzKO0Lx57viUN79w0bsk8Vse+FnBTJpCIseuH6Tn/fZeIQoF0TFMKGCM9IPU0Oq/oCqLGgJdjaow+SiYIKSKpZ51GBTK+d9tPPUyDZoCpcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727194434; c=relaxed/simple;
	bh=+m2vs1tjAyzZjG25G4h96FcK3TH/wzOGNdIQ0VehzkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3b8o9qM5vEVw4VeVeEsd3rFWesZxLcxEQsFxZgjcuFpdG/23IMooED3+cfyEtE2kbHIaSh3wvltssv01Kc549RLO2PJYDdxUffxoETnldxOYLuyjWfg0WdBuzeWxgbl5NeKEscM+p5N+j1z+k5ELCH/O+fGC0hdvKWdkgEk6x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ez8/dkEq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so6959977a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727194430; x=1727799230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWqfELMVwClRrAUsPMF7IvV6+M6/4HU5H8DEiyqg994=;
        b=Ez8/dkEqhCgWHBFNdaz5l+8mP7oQYsEDIYCnd5Vxa16bIr9DG8tK+Zd9KqykA+k+VN
         RH73rPGPg4B9Yv2fxgw1noA8kyKrM7a8Lw9Li8c/L82PumIWCEEXnKJZ1OSBhL+MMgl5
         LUHN3NBxmyvztD7QPKSIxsQ/9456j1IPtPGvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727194430; x=1727799230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWqfELMVwClRrAUsPMF7IvV6+M6/4HU5H8DEiyqg994=;
        b=lk583kf7JkVvWZM40+sxafS3ncohy8nc5lw1U/tsC4rAzlHfpi1fpff7bwCov59dyA
         bb0rX+cyPDA2pYybx5FfpUJUxgN044Qnunug1iM9s0d13DfV5lCrhwwJd0ihq9wseFws
         xFsi1uOcR/bWWlE5Q3mGU54LEsOaxRbXEnS9QDXRULN+HBKrT2iS6lVtEdFVmJHVMaaB
         yWwXbkOmgC2GMHSpY3iTdkleiIRV7gWMV6/Blq1c8c/1nTGyDqQQEnvC0PCZr25VezbN
         rpoIFUUjtTQHcasj/FbsTx+Uoy8WKY+lXoHltX5wKypLFg1gquTe6Dgj2dmLqg4xCj2a
         f93g==
X-Forwarded-Encrypted: i=1; AJvYcCWLSiFsvK3nDnIT88iqqOv74Z9OCvivRrnVsHQIQdB3n1gzrcKMmNj0i4bNbHY1Zlm3/RWI7YmsGSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjSy4md5ggO4Esy6b6e0u6uBvGq3PyAUHKPqyhXj7W+WCnCOD
	/ZwllNFxSfoNhA8I4LehSN9aNydrCuGj4+9DA8skYNp2N0Cyrg/quJH6vsB3NY0saK6DMWpbmR2
	0Xv0Oig==
X-Google-Smtp-Source: AGHT+IGwVuVG0O1rbwA1G/80a8Y/MNUzw3SMgcVZouzHwpk+rbuW/x3PesYnb6xLbtiwtCqQa1DSzA==
X-Received: by 2002:a05:6402:43cb:b0:5c5:b902:a0f with SMTP id 4fb4d7f45d1cf-5c5b9020bb4mr9085235a12.15.1727194430045;
        Tue, 24 Sep 2024 09:13:50 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c238sm875366a12.7.2024.09.24.09.13.48
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 09:13:49 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so6959946a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 09:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAVuzRPyx1RwmPesIs0rJXa7sRVFVsy/SL7osuOnN1VI7goYhWN5WcLRbtJM/biW1t7QgvcmIzDXY=@vger.kernel.org
X-Received: by 2002:a17:906:cae2:b0:a8d:61ca:271e with SMTP id
 a640c23a62f3a-a90d549d1cdmr1474755866b.6.1727194428647; Tue, 24 Sep 2024
 09:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZvEaHWH0IndyeMvs@shikoro> <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>
 <ZvLLoH-Xk_9iVNVY@shikoro>
In-Reply-To: <ZvLLoH-Xk_9iVNVY@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Sep 2024 09:13:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9UN2V3qdQjEjEheYVbYzSzu_JJurovMKwrY-ewS-4yQ@mail.gmail.com>
Message-ID: <CAHk-=wj9UN2V3qdQjEjEheYVbYzSzu_JJurovMKwrY-ewS-4yQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc1
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 07:24, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> ... but this comment is too much. We have a new maintainer here (Andi)
> trying very hard to get up to speed.

Ahh. That wasn't obvious, since the email - and the tag - were from
you, and I was like "what the heck happened?"

Sorry to Andi, but yeah, what I want in the pull (and thus the merge
commit message) is a useful summary overview.

If it's two commits, and one of them is a typo fix and the other moves
code around, then by all means say "fix typo and reorganize code" for
that. But when it's 50 commits, and it has major changes to some area,
the typo fixes etc aren't worth mentioning individually, and can just
go under some general "And the usual misc cleanups" heading.

               Linus

