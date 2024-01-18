Return-Path: <linux-i2c+bounces-1366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784B831048
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 01:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F291C211EB
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 00:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D16928DA2;
	Thu, 18 Jan 2024 00:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hn8FgZrz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA5288CF
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jan 2024 00:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705536188; cv=none; b=f308eS+O39uNDDQMNd4hp3IhQpV6K/eCJRUZTkZbyCjXltp162LbZPO+nyZgiIzHkdLyIfqYvng6eRP0NAVDZuY/yG5wLZhwty5p9PTeqTKFqGSX/1hqluH2JPLZYWdybKs8Fv/0e9MqGQpVCVD91xq0AzGu98j77p5oG1hwY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705536188; c=relaxed/simple;
	bh=NEZVzybzPmNdcNoWNoKOGDd68kDR5PZhrPaw6Fk3lrc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Content-Type; b=Uizv6P/goXRKBzWNFimMBNkG0c95BvGlkG+JqTDW+q82wJgDsKLpqDnLa8Ppl7pfpE9OjQRB6PelxDKM5vRNV7tALVu7albbku3T/AoJXrW7LXJpVX5t6ygytDQ5XllmzEamvirRVgzzlpK3s6onmV20M/shaxbqYtdblvWw7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hn8FgZrz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a298accc440so1427363766b.1
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 16:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1705536184; x=1706140984; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tTFhSt6TuecBRZDSOhTGNO151it+ibIw2r69xqrYOE=;
        b=hn8FgZrzwmLkJvYmvqtLt5HFvlGwNe6RLRBKrPTMuA74dBfX1X5fkBg4gHPvPozhTs
         gnGTfoFYjWvGwE8A3fkF1uyklRMGSgctsemPKhicWo5LYIDR04AxkIT/dg/PHiTSQScr
         ND3/ScMcPc98xasjJesIwTAB7959GTLDIt7sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705536184; x=1706140984;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tTFhSt6TuecBRZDSOhTGNO151it+ibIw2r69xqrYOE=;
        b=p9LytqAX45m9w35HT1LIGleCRV+uAO6TR9v6d8XX5RecpCGkTWWJQoKgbka9/h/c80
         YL74GRPzC/D01NMo6jJqNHg4wa0l1zG6LjpUBtwHUrE189ZrA4o2sK+Ig0bkkKFHcWOS
         knfGdHNOd8Sxu742pKpzb8a7ZHGgD9XUcLvEG8KY/ZoDJxSye2q00cYRve2jb9OA31cv
         unNSq+lgKrdyJY5EsbcGk6wtQRZw0IJf2TltIF9NGIYd5YKYWXxllRdHAtJhshnXSSAW
         beIsWO6YyR0YiizxpP7hsBWvNJN6R/CcvVlToYHCQ/fMMcKlJT/SfQjdpJXxr149j1P+
         +W6w==
X-Gm-Message-State: AOJu0YzDmhVwlJdDcfAjdA8Zttyjettu3H8DxUS86zQrwF6QMojNioIc
	fuVa3suq/Cne8PsaB+JvymCAh+xLQbTNjBLsk+WzOI+WwMb6sbhd6gLAZTXnT3mTEMJ33Y+Ij+d
	zxOfVTA==
X-Google-Smtp-Source: AGHT+IHNFWHl5IqW1UPu0uLZ1MS1ngChi4u5ERxsEjQtriQ2dnqeVCWf70fr04KoTvzTMsrg1xDKcQ==
X-Received: by 2002:a17:906:fb93:b0:a26:e013:947f with SMTP id lr19-20020a170906fb9300b00a26e013947fmr2668ejb.76.1705536184423;
        Wed, 17 Jan 2024 16:03:04 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id cx6-20020a170907168600b00a2d5ef80043sm5597528ejd.129.2024.01.17.16.03.02
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 16:03:03 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-559dbeba085so1532115a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 16:03:02 -0800 (PST)
X-Received: by 2002:aa7:c48b:0:b0:559:b870:e868 with SMTP id
 m11-20020aa7c48b000000b00559b870e868mr50225edq.12.1705536182387; Wed, 17 Jan
 2024 16:03:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZahG7xgHJ4Tf8mHI@shikoro>
In-Reply-To: <ZahG7xgHJ4Tf8mHI@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Jan 2024 16:02:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgSF9zaUCMWe8FuLrfwS0PxJXyxQxFGn7_W22C0rTaQXQ@mail.gmail.com>
Message-ID: <CAHk-=wgSF9zaUCMWe8FuLrfwS0PxJXyxQxFGn7_W22C0rTaQXQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc1-fixed
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
	Kim Phillips <kim.phillips@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 13:30, Wolfram Sang <wsa@kernel.org> wrote:
>
>  And a big series for the
> designware-driver needed to be reverted because issues have been
> reported late in the cycle and no incremental fix has been found yet.
> This is the fixed pull requested with a missing revert added.

Honestly, with three quarters of the commits being the broken series,
followed by reverting it, I get the feeling that this would be better
rebased.

I don't like rebasing, but I also don't like "look, we had most of
these commits broken, so we just reverted them all" all noticed before
it even hits my tree.

So I really feel like at that point you go "this branch was a failure"
and start anew - aka rebase. Along with a big explanation of why a
recent rebase ended up happening, so that there is no confusion about
it.

              Linus

