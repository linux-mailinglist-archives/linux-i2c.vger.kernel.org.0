Return-Path: <linux-i2c+bounces-11550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DA1AE3144
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 20:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5894616CE16
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 18:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEC21F4163;
	Sun, 22 Jun 2025 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M6YPThtA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551351369B4
	for <linux-i2c@vger.kernel.org>; Sun, 22 Jun 2025 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750615271; cv=none; b=Znpt5fnNEVzP0BVtBSXI+Wvdl8EVEFdLkWyrx5USuW3OrkqlrNPFsjJXu9APvagxRlO+tk+GDCj5QzBqraiUJjFIuVIzTvOiNBlZA3N9pwns2EWazrWHQ7uiscDWhnlCDjWnIo0ZaXcMl8qK40rPALbe70b3fHjuSaGEumKb+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750615271; c=relaxed/simple;
	bh=J9W5678xdEPVkrFGIESTOy49fS98LSwSbpQugn1ibXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKgN7KCDXyb+EYVqTIPDtca7CkxYuXl7H2+u4U5haTLXgRVLUrZV1R14i+luG9JzmGm8ZvNf9rpk6gXXiLVs8SmlV7YcJ5Zu/LCEk019pyx5hBZu4K6BxbYmqoGmdPJIzwvLvnDfpfzJMtPadSfeZc0WooBQPrnNT6w1fbLymXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M6YPThtA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso6696093a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 22 Jun 2025 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750615266; x=1751220066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh5CufBu5Z6q/CIQPXB1zoIxJvSFHFQ8GCjbcL7K+Tg=;
        b=M6YPThtAsEQluNG6R/hnUTpip3DB3lbyfid13GOdmRc/vgIPJJ3lRTrzB3jTNPUadL
         ZrdbEWCs/Hg8Dth4BSgX7+WbOjcF9jj4rZaxcKvf3/qbaxlA1noe5gpmJ6o+j7CBhcPy
         ruLy+1vKtQzDpcseKz+HydejjudFjfCgdahJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750615266; x=1751220066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh5CufBu5Z6q/CIQPXB1zoIxJvSFHFQ8GCjbcL7K+Tg=;
        b=O6xsi9QMUJtvxyHAJaa/1qMklBw0RloU1WRgDVXmcAv56nOj4Upo6F+eNE6pMRRDVM
         ldZ0yG28Q9wzCORAoLXR/mnFiUrLPffPLfE7zgQ1tlpEZkYde0M0SfmXs3FLF9FQYUYM
         CKBV7qgeT7ldIhS/1yE54b3Z9q6KGYn2DEBiTJQXSZ81yrU6XnQBg3X4PFF/JUXYqkvw
         D6bWTCweWM97eAiWKz6q1Ld0mPxZQDUCeec7/8n2V3yUAk6gVlVfAyTdgZkaKgFl+0gw
         MXOiEI3wIIW6KMgpMIhtL7ZY5V+nF8935ewKqtFzPs6vA7Z2fQrzqTEpgV2EjulU04Cp
         NBNw==
X-Gm-Message-State: AOJu0YxLXvr0x+Q4kKoD6GHXfMmiM+Abcr5xHgHKR3XyQlB5usD0X4/9
	4Ur5pmFZZvfdTJcWMe0srrsfg/3I6L7Pn/Tb1YnJgbFO4j+NmdjbzkOjCEbi80cbvCiMDx5jv10
	gRO9erJg=
X-Gm-Gg: ASbGncuLD2+jiOMTeDCDcfmRe0ZvoN2bDkeM7w8IlMdhfrQS6UjDoyHYeUB0RqoXPsz
	DR9OXbtqxnuX86arwqPzIgix0lhrflljhQtrQ3wNZc2KNjFafTD6nqiMQupeT9LKSborFdq8F6r
	Zp+TypCVO83/fAzqUJDcCVW5TGl8xfWp2QFcMZqXghDhsg18l6UCme5OwOmHmEIohzOwvgPCSAX
	w+H6JJHusKqHoVSRZRxbMbaezekU3qV7+Qr94XEDb/xnAJl+1UPa33gDRzfdpQqhBmfynFOgKMf
	YqaOxH1Rg8FDk7QUaF+Zu2TzflxE0cWsekTGZWNI6yeahS092ypsWcJ6JkCT71bZ1goxE/u+B7D
	PGLkVCtuckunbv1fym3a4hOctYmLA55x/lF/9
X-Google-Smtp-Source: AGHT+IFyrR+S8qgWT0FVFSODVtz9cZ5YTs+nQ+P9ntto68rM6tWbqY5ieUi8UWYP3zFhqOTAQQoHSw==
X-Received: by 2002:a05:6402:1e90:b0:608:3571:6942 with SMTP id 4fb4d7f45d1cf-60a1cca9d65mr7494314a12.1.1750615266396;
        Sun, 22 Jun 2025 11:01:06 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504e16sm4958255a12.6.2025.06.22.11.01.05
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 11:01:05 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so6833363a12.2
        for <linux-i2c@vger.kernel.org>; Sun, 22 Jun 2025 11:01:05 -0700 (PDT)
X-Received: by 2002:a05:6402:27cf:b0:609:aa85:8d6f with SMTP id
 4fb4d7f45d1cf-60a1ccb4e04mr8893295a12.11.1750615265058; Sun, 22 Jun 2025
 11:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFgDHBHwY5ElWILx@shikoro>
In-Reply-To: <aFgDHBHwY5ElWILx@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 11:00:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
X-Gm-Features: AX0GCFvnn992nxigULNiH1gK6JAY71aQgYXmY-5YsNMdcvTo7T5WTIQaQFNAVDg
Message-ID: <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc3
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Jun 2025 at 06:20, Wolfram Sang <wsa@kernel.org> wrote:
>
> - subsystem: convert drivers to use recent callbacks of struct i2c_algorithm
>   A typical after-rc1 cleanup, which I couldn't send in time for rc2

Honestly, this is just *annoying*.

It's made extra annoying by the fact that you also did some random
whitespace changes while at it, and almost half the lines modified are
just completely irrelevant indentation changes.

Looking at the stats, your pull is:

 45 files changed, 125 insertions(+), 103 deletions(-)

but ignoring the whitespace changes it drops to

 45 files changed, 84 insertions(+), 62 deletions(-)

all of which just makes it really really hard to see that it's just a
trivial conversion.

I've pulled this, but I was really close to just unpulling it because
it was such a messy thing and badly done.

If you do conversions after the merge window, make them DAMN OBVIOUS.
Make them minimal, make them automated, and DO NOT DO OTHER RANDOM
CRAP AROUND THEM.

          Linus

