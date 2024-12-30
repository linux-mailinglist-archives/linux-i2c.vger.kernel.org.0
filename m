Return-Path: <linux-i2c+bounces-8823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 402319FE58D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 12:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22B061882F97
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 11:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0605E1A726F;
	Mon, 30 Dec 2024 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK6swDtV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4799199938;
	Mon, 30 Dec 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735556857; cv=none; b=JarHFJms7EzJadYoWq6ycFLsj6WoqkfrKnbTOZCWR+2u4MGuttbj2i4JbGnvZyonxiMvImxf/GRtt2RM9nBkKNpppWEJkkYdSsfV9lzQUwAeSWA8c9BaIUnzhqokxmhSAd7XhOghzGUGip2TpbDG/Uj4ZLzGpWriqQBzR9c9SHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735556857; c=relaxed/simple;
	bh=N3755K03KwotneIF2d8SQ+6CRN2D9xOPRVP7JL3mfAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB1eRmIEn85heBTeHcX5fRWxMlnLVoQef8fZBSeR4Ad/fHjLn6gcaiNXyUSpfdVmuApWFFCCVQfGJ+DLvaFTTzByoQbvQc2UIEjiUUR1hUHRSGlPc+gCoBzjVeGIE+6vU1JqgmCa2HCDJmOLOGl842N39tVgivD6hHQE1lJjFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK6swDtV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFF6C4CED4;
	Mon, 30 Dec 2024 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735556857;
	bh=N3755K03KwotneIF2d8SQ+6CRN2D9xOPRVP7JL3mfAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OK6swDtVkjT1oaqmQhJN/9ECLNZIy1FZUr/t8ykOAvVxoXNhRdAhrOhuVXNZj1fPf
	 Q3/Qdc67HOPoLiVeBNbrrxSvQqWb23ZqJoR/KSnGS6wiyNZ87+/2HbWJa5nCD/nfEl
	 dbjtfrbOAWYrIwP0jSRwsKUvwSpwQTgKF5UmxLU//caLTPfa4PBc0FmBb2pKMpBzxD
	 ky17k70a31YpvXwFGQXtgtuqzViGSTQb5UTLsPWGqnDapmjVgAY7p5aQkTPn1UtpLp
	 UZLcRNkUPIQIRwa0njO+odzMBKYd4A/rV3LymQ/fgIPJXUpUGLuWPObCFYTmuUkWPM
	 t+/w38f1mh3VQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso7883969e87.3;
        Mon, 30 Dec 2024 03:07:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7i6hOGXLv+SHzVxDgJfP6k5UjdADHX4omx8AlBRK8h9QT5wfQLW7GAGxViFLSzxdHjV7dbAy3u0WBBz6u@vger.kernel.org, AJvYcCVQd30MWpXZJw9Aa4lazLOGdBhvxxqhRqxxxibAiFVr+Xv6QmnsWvqSXNkmYbvDlGU7aTmscr2uKSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOzAbv6/zmdgwTp3wHo0c2tZcte1O7hXzEYSH9UhC9zhDNZhfH
	xYTnz5ZbZvNSsUdIyvmRY8RLNIHfJsExeHnk1YWj1wvOqjOmej17vGH/mH2QMHTs1ztMsif/EB3
	rMy3OlSkU5Bz0fCIGjJd5ixURUGI=
X-Google-Smtp-Source: AGHT+IFF1Ldr/xgB0k4fsZWE9isDxa8l7/QZ3RQc4yZ/tmsYuPUysJ1AegzD+aYPCAEFNzIV/dIAWrclcyvAqROsCCs=
X-Received: by 2002:ac2:5682:0:b0:542:2f5a:5f52 with SMTP id
 2adb3069b0e04-5422f5a5f9dmr8983244e87.13.1735556855850; Mon, 30 Dec 2024
 03:07:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228184328.5ced280b@dsl-u17-10> <CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
 <20241229005936.4d54f2a6@dsl-u17-10>
In-Reply-To: <20241229005936.4d54f2a6@dsl-u17-10>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Dec 2024 20:06:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPBBHz8duZa4OkxbFP3tCsF29ctj5E9GKC-MxwoU+1pA@mail.gmail.com>
Message-ID: <CAK7LNASPBBHz8duZa4OkxbFP3tCsF29ctj5E9GKC-MxwoU+1pA@mail.gmail.com>
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, andi.shyti@kernel.org, 
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 9:59=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat, 28 Dec 2024 15:29:24 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gmail.co=
m> wrote:
> > >
> > > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> > > extra _EXPORT_SYMBOL() wrapper.
> > >
> > > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is inclu=
ded.
> >
> > Grr. This is horribly ugly.
>
> I thought it was a neater 'ugly' than the current definitions in export.h
>
> > I think the i2c code should just be fixed to use the proper "define
> > namespace early".
>
> The i2c changes were needed because I found the code wouldn't compile.
> It is pretty easy mistake to make and will happen again.


Agree.

Currently, the compilation still succeeds, and the empty string ""
is used instead of the specified namespace, silently.
It is difficult to notice this mistake.

So, I like the change for include/linux/export.h
since it causes a compile error if
DEFAULT_SYMBOL_NAMESPACE is defined after
the header inclusion.

Perhaps, we can add a comment about how
to fix the issue.


/*
 * If you override DEFAULT_SYMBOL_NAMESPACE, please define it at the very t=
op
 * of the source file, before any header inclusion.
 */
#ifndef DEFAULT_SYMBOL_NAMESPACE
#define DEFAULT_SYMBOL_NAMESPACE ""
#endif









>
> and does - I missed drivers/pwm/pwm-lpss.c drivers/hwmon/nct6775-core.c
> and drivers/pwm/pwm-lpss.c

OK, this patch breaks the compilation, and we can notice the mistake.
This is good.



> I guess those files could be fixed by moving the definition 'early'.
>
> > I will also note that 'sparse' has a notion of a "weak define", where
> > you can set a default value for a preprocessor symbol, but if it gets
> > redefined by the user (or already has a definition), sparse won't
> > complain about it, and just use the strong one.
> >
> > That would have been lovely, and we could have had a
> >
> >    #weak_define DEFAULT_SYMBOL_NAMESPACE ""
> >
> > and this wouldn't be the ugly mess it is.
> >
> > I wish the regular C preprocessor could do the same. Oh well. Since it
> > doesn't, I really think i2c should just be fixed, and we shouldn't try
> > to deal with i2c having done things wrong.
>
> What you really need is the preprocessor to support a ?: type operator
> in an expansion. Then you can have (DEFAULT_SYMBOL_NAMESPACE ?: "") in
> the expansion of EXPORT_SYMBOL().
>
> >
> >                   Linus
>


--=20
Best Regards
Masahiro Yamada

