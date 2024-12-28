Return-Path: <linux-i2c+bounces-8796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC299FDC9C
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF024161A17
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 23:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001FB192D79;
	Sat, 28 Dec 2024 23:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OVG00jJX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BF13A41F
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735428586; cv=none; b=Xs3fIu+JyJGdYHPxGqp9h3hBpaY2gywBfnDbCMEVLglA1znDLzX9gc7thsas//5pCIhNMw+3FN8+k6+F/PNqzfPXe0PDdNpheMg0WxMlyaH2OxBH4OyFGYq/KdfJ6iRrbUIgrh0scXvhx2k/j3mi+6Vrc5Ae87TrZDvnyPmiqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735428586; c=relaxed/simple;
	bh=hFIbNk1QxbbBslw4am2KRV+GsjOtddRc7aYN4hEp63M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGvWLw8CRrs4lstD1O1LeGOZHn9Zzr0OOauwm1JSOGzlsDkvYex2Gp/6lU5pvRleWGebFydJWvgHz0sj8C0lUrtcCci9ItM3GiLvOxc78Oj0mxVsNA7saKdpBFgCULUG8Eyijch8UkZGy3uIAL85IhIh6s/EJnLw3W7sBN8K3TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OVG00jJX; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so13802777a12.2
        for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 15:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735428583; x=1736033383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+L28JG1ZV3pD4CneFO0EqD25oOao4zHenB9ViIjpfzE=;
        b=OVG00jJXoqvWgixZCmtVb7+pU/VklWl0A48U824+SZ+6jwBLSM2B0X2A+rlsmWmLXP
         ohcgbsgVPcjXZmK93wmJBcRlHmXXxRJ8Sgr9eY14QL8t8P3GGbLlOWCZ5pIVn1rsjjag
         UwgN7/pa7YaC2KIuAu6VOetfTYfO7+V6PBFwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428583; x=1736033383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L28JG1ZV3pD4CneFO0EqD25oOao4zHenB9ViIjpfzE=;
        b=F/WFdbzLZQIj7ATV0+W5GeJhSGh8tQII154yueKmbdNnBM+HW3voXr6OeXNsXK0r51
         zwR9pqfcqAhmQYrNb/IlNFbovkiw0ZXBRWXjmJIDXUOq1KWqa/q/T84ypXPB3VjMFGr4
         zIdj/6+Jzz9SbKfx02DyVgDmrYYjYcy4HHN2FDf1Wsx2E/D1yjWDKccd/TQuilJLWuld
         4E7wriUVSwNxfw+EYZ699KIkUeY6ZOun2qjpuJI7FUCvXYXpbKqJx43lUCKLrf0M3Z3U
         YuT1Lg7uC8R9EbN8i7S5V2tpUAlAbRHJW6w2op+sUZrRBSMrZj2vybLYlJT0KpDCCbfY
         RCSA==
X-Forwarded-Encrypted: i=1; AJvYcCU/x2lhPoatCF7vm3KOtQ+zn2ewzffFqko1j/Q9bMEwV8UJJdePxE7DxV+FlXJhf929ahjoygQbA5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuqw2FOZ2nDAHmVSJy5cxtgZPaIFlwBOamQG/dFFgXmt1Dj4G/
	8Q+BqLRi8JzPY/RkncGdcaUlfdPXS3WSibSpcL6rIPACYvPXGbelWF1DhDQdym+mrDmb8v+UfvE
	I3+U=
X-Gm-Gg: ASbGncvUjb619ZLWfzyxt97SO5eBskz7dmeTwDHx9tysmlLq0oQJbT/GAAdWSuk71ko
	0OsTWC3Lx1GwpeIAzgYpvR+lYiNjCZ9IcG/zMNsdC1mqa0RI1Hup7VfR8iK7GVprKd+eHNeofNK
	kpj1Supq7zWQUl+3Mjz4uyBuYoO3TJPYMu+qZbh2+4c1g1d/Xzob1zUBIKVMlha0KRlfHvq9k4K
	IziHX6zOu+8lcCOWwVx9RLjb7/N+JQK87PlK78KSyKNOFsQGMz2tbmWe7TNQnlVimhdwvsZpQhf
	DgwA5enno7oV9L2IbhWmYdgOa5qDr/E=
X-Google-Smtp-Source: AGHT+IEUWGtYJexDADawFu8WVIUe9KNmdjEOekAwSjjJlSXyCwCd4dfr/kNETEktmWZAP/ODDLfX0g==
X-Received: by 2002:a17:907:3e8f:b0:aab:d4f0:c598 with SMTP id a640c23a62f3a-aac2d0479bamr2880250666b.27.1735428582965;
        Sat, 28 Dec 2024 15:29:42 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm1315575366b.63.2024.12.28.15.29.41
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 15:29:42 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1204922266b.3
        for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 15:29:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxFJHvB9FyrwB1OApiPDW6tWStXUAcd+ebSShYwqSr/jSYP36yrIvlvzC/l8QxjKWj+Qz4ikr6nZc=@vger.kernel.org
X-Received: by 2002:a17:907:c247:b0:aae:85ad:4997 with SMTP id
 a640c23a62f3a-aae85ad4b0amr2377176366b.40.1735428580954; Sat, 28 Dec 2024
 15:29:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228184328.5ced280b@dsl-u17-10>
In-Reply-To: <20241228184328.5ced280b@dsl-u17-10>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Dec 2024 15:29:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
Message-ID: <CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
To: David Laight <david.laight.linux@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, 
	masahiroy@kernel.org, u.kleine-koenig@baylibre.com, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gmail.com> wrote:
>
> Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> extra _EXPORT_SYMBOL() wrapper.
>
> This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is included.

Grr. This is horribly ugly.

I think the i2c code should just be fixed to use the proper "define
namespace early".

I will also note that 'sparse' has a notion of a "weak define", where
you can set a default value for a preprocessor symbol, but if it gets
redefined by the user (or already has a definition), sparse won't
complain about it, and just use the strong one.

That would have been lovely, and we could have had a

   #weak_define DEFAULT_SYMBOL_NAMESPACE ""

and this wouldn't be the ugly mess it is.

I wish the regular C preprocessor could do the same. Oh well. Since it
doesn't, I really think i2c should just be fixed, and we shouldn't try
to deal with i2c having done things wrong.

                  Linus

