Return-Path: <linux-i2c+bounces-5031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C893703C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 23:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C10F1C21D23
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 21:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1941459FF;
	Thu, 18 Jul 2024 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IomPNg2g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B4143C54
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721339205; cv=none; b=eZbiFq0Dej0ssA0pcnKP5JKnTMAyqsqTlTHT6s5J8sCg5Uz3wiC+qKsaff8B07f20Tt6rQ0nWanRLnwpCCK9GoFpui8VTFnqqMkdbKztcDfjEvzjD1M987vEzfkzkVnCk53ny7fNfBOqT3hCpNwynfpBApdk0XiKIZFCvOMGgoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721339205; c=relaxed/simple;
	bh=9F6i1FAmVDoD7jHejUpq11Kfr0EDw68Wtg4/g2RXVWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pom4nubLkIpN1Ex/U2yfopiiUe5qA0Hz0RPt3MhmKj7rHbTsR85H6S0pcQc4de1Oqr1F0OOJ7qwWIruw+2G/y+EUd5X64TN6GBPBCI656k3FOLjRcEdB5NxOR7oFIhWY3zKr791wZZzVf2nbxkzI/KHnxPBY7V5lIMSDDwBNdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IomPNg2g; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so535804a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 14:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721339201; x=1721944001; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUntPXuIddpotRRbeUHCaia3duUln3zyPmdIc4CQdv4=;
        b=IomPNg2gTHrYXUy7Y4fU/Tl0XN6M0u3hnF0cGVOj6jIKstLgy4t58soNYIdH0M3iIi
         GlUBUeRtNpw0NwI4aYXG0ca/LYV2yCsJX2F9uEkL58pxYY9B8tpuX+14zynS5ZKLD7ns
         /R+hnmuRpy8tpQWTntWq3Dm6RuUxBFFFsslko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339201; x=1721944001;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUntPXuIddpotRRbeUHCaia3duUln3zyPmdIc4CQdv4=;
        b=wfYD/1kXNbkhzvBRGf5iov7oD8lko3yUe7o1OlM72d86zRg400Rf/CSeMQiFlZXkyc
         ejTDKgbW8t6NegqCF2ZhxgIDHGToIasf8x1CpP9WI5DFJYE1IUaNH2hekkOCSLzTcFGa
         5AkVgzzhQQ7jc1104Tum5zUvVd01FUVjm9VIgULmYf9Xnuev0m1CyS2jIVqbIyvB8mf8
         E0ee+dx95SWx+51f3TSn0Hw7nY1fxwHjreeJfqOx36GH3xAuVv4/j8TSx8GzLMk7g9Os
         L5jk5AMzprg9Uc7Hpxv0j+updLHjd9g5+MH9B+drPpNasuFuSaaT0QSLf2R0Zu7dMKHn
         kVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgZEELhf071S0HZxSPrWEmtV2qDL8sWrLjLOX90KN8RKwAz0hI9ltPgGvrUkbvGIl/VGWIBU8LHwdAn7qpANJ8hPh2tLw82ApP
X-Gm-Message-State: AOJu0Yx6eJCNQgGkpp/qxtlp7kefhzh6UCA+6UipahXkE1HTxQfOfFN8
	2q+RCn6T85BNopO4ETZHEd2MAZfwW8TEEmYyKRN64aFtv28uUTAbZxt8GvKaw7XKsgHdqQ/RNDC
	G9SpxjA==
X-Google-Smtp-Source: AGHT+IGjbd7SxEI+mOtb8S7p68TksDkAf/OGw5ph4Gl1p3Gp8HhgijLsOLZuyMJxsJ6VhYwdveeUrA==
X-Received: by 2002:a17:906:9907:b0:a77:cac5:ba7 with SMTP id a640c23a62f3a-a7a0f137b96mr390356866b.8.1721339201499;
        Thu, 18 Jul 2024 14:46:41 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a33a829aasm4897966b.13.2024.07.18.14.46.41
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 14:46:41 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so535785a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 14:46:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgvO8BVGqL/ENmvnx7LMicwJbE9YjICWnkW9ez7nizW67HE67Jg2iGYRAUHP54k1wWnKABgceYdtZF+aTCAfeuGaPgZ3hsJBpk
X-Received: by 2002:a50:ab13:0:b0:5a2:bfd1:b892 with SMTP id
 4fb4d7f45d1cf-5a2cb3382abmr491986a12.11.1721339200713; Thu, 18 Jul 2024
 14:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZpY3X1tggZC3s_1X@shikoro> <CAHk-=wigtUnqv+RXkLZ2TwqV35YQeGrYsMnrowpnmQNN6wyhCg@mail.gmail.com>
 <CAHk-=wir5OYeNSytz+EocQnQxoFX0LY962R6FDj9cAHBiXFe5Q@mail.gmail.com> <ZpizSLI-sAIng0GO@shikoro>
In-Reply-To: <ZpizSLI-sAIng0GO@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Jul 2024 14:46:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=E0smTG5kUG-pSkcHWijF_-Xy-yu-swfTV=23K-RFhw@mail.gmail.com>
Message-ID: <CAHk-=wj=E0smTG5kUG-pSkcHWijF_-Xy-yu-swfTV=23K-RFhw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 23:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > There are other merges in there too, and this just pisses me off.
>
> That part I do not get:

That was me having looked at the list in one of the merges, getting
ready to try to sort it out, and then noticing that there was
*another* set of changes entirely (admittedly apparently much
smaller).

And at that point just going "I have another 50 pull requests pending,
I'm going to skip having to figure this one out".

                        Linus

