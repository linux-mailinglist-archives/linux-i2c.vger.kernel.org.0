Return-Path: <linux-i2c+bounces-8804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F04189FDD02
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 01:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79119161A55
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8B74430;
	Sun, 29 Dec 2024 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVbZMIUH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB5A50;
	Sun, 29 Dec 2024 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735433981; cv=none; b=hE5nloUwpSTPm6ghDL347XG2WWBbxmoU+eLSOl/qTroavlLvGmWbKF/7wj1d1qQaESMdRWwt0TvzLpiUxPd7SDLYZze+yxZ9oFKF9p2U2PGQwmLAjuDYUDypI8bIKBQJablRwr4XjTQlEEjFqm0k57ov2+8WUop842VxHBHPCuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735433981; c=relaxed/simple;
	bh=5ohkZcKiTvy10fX3Oz2Y3lE3CTl56Klr96v0xMeBtPM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJzmoN6rAFzIPB51ICfhk8tsJB9TOaEorobfogZKZODu9gkH8mFGGP7Zl9y5qgyCpjlqAbwk+33LRchiaqj7HE3hxAtAF/GnpRDnF9NGt4whJR1n2LI3i4GiQwowApgvTe6cJrwNIk7ZlYDx6W+rkVjg26iph94Yadi0mXHzSNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVbZMIUH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19672615e9.0;
        Sat, 28 Dec 2024 16:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735433978; x=1736038778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKbB4Wh2I0hnr6Q7TH3BFU6WCdT0XdLVOB1iWHQKUpA=;
        b=OVbZMIUHIKaIOxTuI+De0NZr7Se7BvUli+lJqYOxYvg7k3Ldn+MwzhBa8XVB8YjTOr
         o8EArVTeCREQ1OuDffFL8tyb+3r4GR7tAHKhd2gbi6I95+8GSpy5dGoFJC0gnUBDUiFR
         iOO0OgvaIazrFXLt5BdfpEco8uwe5EoYq0AbqoEU+eVy5dsDhHcJz28ELCBIDI0492du
         pXvqMfo+wsawlOR1BihzGFbJS+e4T7xxJskcLjL2v9du1qdAD3jEAubk9ebRD2J4IuTw
         YO0qJ7GBlyQrQWDchaD+KsE9fQUGi4ISMUgtzCqvJK83KBhtxKh13Pyh6Wk3QkZ7TkfK
         x5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735433978; x=1736038778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKbB4Wh2I0hnr6Q7TH3BFU6WCdT0XdLVOB1iWHQKUpA=;
        b=s7DuN2A35793GITPHGTlBZ7hcIup81e77s845lGkIyZewytQW5SfPpNvT9r+2Yc90Z
         lYvraamngJ41V50vbjUNXv2fFo5l4D3XfJwQSWQaOpQpfwz0Z4oceAPg4JHuhBeY1O+0
         jHrCtyL6itYI6K+7L8xQCJ13Dt/Wn+81Fav9uxsznIlqJbGYVG11MkbQGpydqMv9cQ/D
         6qtXua7TDyWrNJ0F4bW2yrBzDgObWV2EQzMF9mluSCE7thzblmRmH1sQxLZuZCIowRZM
         Q15TGy/92u1yBhpIJ0uAZP9w0TmkQYLl/Xa0Hnfebe/qq5CtTvCbidYYajQY5HAc5oqR
         HsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUboqmfY4V+acHFmsjZ1t5DGJlWxQniTbJ/AT9t/rlrMkT4MPAYdwIETmGwPRUXOilGeU89A560SB5gjyNg@vger.kernel.org, AJvYcCWUB4ugG8LqY4DHOVbuxilfNaAS9FgpRT22gh2W86KtLjDHzo/tW/ajlx3SXu869yuc1yjrRGP6chg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiWJzWi+83Z1cDjE0KnLpUTj93+Cqp95A/Oq7NO0mGCCU+ZAmc
	xo9pCRninw3YBOLNryyepXsbNPFeWCZ3/YaQfCcKxM8QHKR+Q2Ck
X-Gm-Gg: ASbGncvZly3g3u8KmlCzm8LZUSq59ZTkwJyDVF4H6yZPhk8D5yjY/Hd5QF5eoPFCe1C
	uE/87i3pE8xQU4n5CMK8bdxMoK64u9rikG/jl27Y8xP31arROtkXP7y/3oAePCzXLhiDFs1KHwp
	F+XKWdxNnQVQ2lTnb7U9yHCDvT/9vR3Z0Tj1h9l1WBm77m2sGWcg4+GeVlBkI0eiX9EIUryV+Fr
	SCdCv0UQoy2DQnZtqX3QfV48oRhv53pxCscT5g0hdPtAzNph6cbqqf25J4HjMCVhNiyMuFzBHjM
	LQsQDbE7bhNnwtOQC5v9TlM=
X-Google-Smtp-Source: AGHT+IFl5X5H0U7IET7O4hKNPLJsvaMi2BvA3gNI1Li6MelW2pNhzXFwbEpBpaJDY4Lkgju5MutBWQ==
X-Received: by 2002:a05:600c:3110:b0:434:fa24:b84a with SMTP id 5b1f17b1804b1-43668b499e0mr227529185e9.25.1735433978045;
        Sat, 28 Dec 2024 16:59:38 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b0532a6sm347139095e9.1.2024.12.28.16.59.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2024 16:59:37 -0800 (PST)
Date: Sun, 29 Dec 2024 00:59:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
 masahiroy@kernel.org, u.kleine-koenig@baylibre.com,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <20241229005936.4d54f2a6@dsl-u17-10>
In-Reply-To: <CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
References: <20241228184328.5ced280b@dsl-u17-10>
	<CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Dec 2024 15:29:24 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> > extra _EXPORT_SYMBOL() wrapper.
> >
> > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is included.  
> 
> Grr. This is horribly ugly.

I thought it was a neater 'ugly' than the current definitions in export.h

> I think the i2c code should just be fixed to use the proper "define
> namespace early".

The i2c changes were needed because I found the code wouldn't compile.
It is pretty easy mistake to make and will happen again.

and does - I missed drivers/pwm/pwm-lpss.c drivers/hwmon/nct6775-core.c
and drivers/pwm/pwm-lpss.c

I guess those files could be fixed by moving the definition 'early'.

> I will also note that 'sparse' has a notion of a "weak define", where
> you can set a default value for a preprocessor symbol, but if it gets
> redefined by the user (or already has a definition), sparse won't
> complain about it, and just use the strong one.
> 
> That would have been lovely, and we could have had a
> 
>    #weak_define DEFAULT_SYMBOL_NAMESPACE ""
> 
> and this wouldn't be the ugly mess it is.
> 
> I wish the regular C preprocessor could do the same. Oh well. Since it
> doesn't, I really think i2c should just be fixed, and we shouldn't try
> to deal with i2c having done things wrong.

What you really need is the preprocessor to support a ?: type operator
in an expansion. Then you can have (DEFAULT_SYMBOL_NAMESPACE ?: "") in
the expansion of EXPORT_SYMBOL().

> 
>                   Linus


