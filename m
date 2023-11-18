Return-Path: <linux-i2c+bounces-238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E67F01BB
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC9F1F23226
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC5F199B9;
	Sat, 18 Nov 2023 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RHTYULPA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4EDA5
	for <linux-i2c@vger.kernel.org>; Sat, 18 Nov 2023 09:57:19 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9e2838bcb5eso425084666b.0
        for <linux-i2c@vger.kernel.org>; Sat, 18 Nov 2023 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700330238; x=1700935038; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eduw7ZGLL5eENX3+AcWvHdPEGppFMGVV13Yx0vFVox0=;
        b=RHTYULPADunx/kNpYRdFn2trk89MqvzIEwy3gxnkQh6r9sollWjeI7XJ7Ca4YySUhI
         U9pilWNFof+0V8YfwM4WQLhQSrg/6uRqywl+jdR7TcFoCrHsB1XPxokyC/sMPuVxDx81
         I3hE92342075xFLHifE/lR4cLN/XEpft7lQCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330238; x=1700935038;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eduw7ZGLL5eENX3+AcWvHdPEGppFMGVV13Yx0vFVox0=;
        b=wOOKAKI0tch+ocM8vTFOp42YtjVSmWgMctELyDmecBLZFcDdklt25bDLe9Gtay0bnO
         wl1sFytbsImSKj9SSBsLn+HEgzi3sHqgMQBB9mFi5UTwfXie4XmL2YakuVMJ6PzsGRFu
         gwpvKHlyHrcJcz+WV3y45VrI3ZL1ckVl2oqpJ1m4DHaZ/YKXv4C+C+x5BCzy9+Fj9yQg
         CrwLo3oykS0ZdqXC8wpWcW3GeorPg7rGGKK5JQdbmFUSPzAQVPmZmdKXh1417WBcmmAy
         DymB/H6Vk/NqO1hq03HEYWON4UGomLBW/lDA+PwDzlpI/YCXctBFEm55C2nt0eHNynEU
         KiHw==
X-Gm-Message-State: AOJu0YyKmz+OgxyjjYXo92zDVaml7foTRGy8OMjfP49FwtUZg1Q+AY/w
	PBret6tP9cm0kX9bZ3OTdqmcbGLPsQuD3Iu2DxLHZlGO
X-Google-Smtp-Source: AGHT+IH1+51dNOG8BUSy3GhvaRhAjUK1Mnjqcc5AO3DNxuMoX3G3Sg/i7sOLJucKGenZDfBVjp4RbA==
X-Received: by 2002:a17:906:15d:b0:9e6:ccad:b45d with SMTP id 29-20020a170906015d00b009e6ccadb45dmr1725939ejh.49.1700330237854;
        Sat, 18 Nov 2023 09:57:17 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906538f00b0099ce025f8ccsm2067478ejo.186.2023.11.18.09.57.16
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 09:57:16 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso4206113a12.0
        for <linux-i2c@vger.kernel.org>; Sat, 18 Nov 2023 09:57:16 -0800 (PST)
X-Received: by 2002:a05:6402:26d4:b0:548:7a3a:ef39 with SMTP id
 x20-20020a05640226d400b005487a3aef39mr1440410edd.35.1700330236507; Sat, 18
 Nov 2023 09:57:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZVf/pqw5YcF7sldg@shikoro>
In-Reply-To: <ZVf/pqw5YcF7sldg@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Nov 2023 09:56:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi9a9u+1cAxxHw7KxXsfPvdWCbhatK7enFSjgwjrovCZA@mail.gmail.com>
Message-ID: <CAHk-=wi9a9u+1cAxxHw7KxXsfPvdWCbhatK7enFSjgwjrovCZA@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc2
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 16:05, Wolfram Sang <wsa@kernel.org> wrote:
>
> Jan Bottorff (1):
>       i2c: designware: Fix corrupted memory seen in the ISR

I have pulled this, but honestly, looking at the patch, I really get
the feeling that there's some deeper problem going on.

Either the designware driver doesn't do the right locking, or the
relaxed IO accesses improperly are escaping the locks that do exist.

Either way, just changing "writel_relaxed()" to "writel()" seems to be wrong.

Of course, it is entirely possible that those accesses should never
have been relaxed in the first place, and that the actual access
ordering between two accesses in the same thread matters. For example,
the code did

        *val = readw_relaxed(dev->base + reg) |
                (readw_relaxed(dev->base + reg + 2) << 16);

and if the order of those two readw's mattered, then the "relaxed" was
always entirely wrong.

But the commit message seems to very much imply a multi-thread issue,
and for *that* issue, doing "writel_relaxed" -> "writel" is very much
wrong. The only thing fixing threading issues is proper locks (or
_working_ locks).

Removing the "relaxed" may *hide* the issue, but doesn't really fix it.

For the arm64 people I brought in: this is now commit f726eaa787e9
("i2c: designware: Fix corrupted memory seen in the ISR") upstream.
I've done the pull, because even if this is purely a "hide the
problem" fix, it's better than what the code did. I'm just asking that
people look at this a bit more.

                   Linus

