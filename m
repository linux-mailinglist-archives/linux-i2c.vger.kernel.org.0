Return-Path: <linux-i2c+bounces-5010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B633293455E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 02:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5E31F223FC
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 00:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D32110A;
	Thu, 18 Jul 2024 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DYZj4wF9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86402800
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721262305; cv=none; b=LyKYGid2f3tAsWaQG3mFMm9e/ExW8kckFfdn7+8J/Sc1UUlzMO+0yEcBubV5g47gHQr+X7IkUOuJVdq4UJ7rQ5sYxZ7l/vZKJxgZYnbPlXEF/xCvjIcQY60cVkuyR1EyW7lHp9vLAIxbEsWgxwmLEpFI+kWwJsh9ry5F40O8npo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721262305; c=relaxed/simple;
	bh=IJxNKounMxqXQ/v/BKFsifWplKcA9iwtXjgiC1PRubs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=LRtn9M0YsVx7nKQ0vke9kRjWUXx81zzjFOLBy6/ZcFZGfHLwBGByZ1PGESN2JfA/SNCuHYTxMaufArUlM1V/P4kjwpZ9hYZEZKjYiJ0AJnULxEZZJ3u7yPh3QOuef+5W+QPN5Zm9aeGAeshrFB48Bn8rjmesIP5+MhyyRXxPHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DYZj4wF9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ee4e26790so334081e87.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jul 2024 17:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721262301; x=1721867101; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWt5MRgiFwtJHB8UyQZuipfHU1hROtorTGuhqMlfhd8=;
        b=DYZj4wF9HNW4F97jt/TowK4y55yDIFWTkVs4D6CkVtJ0UYzxz8vvyD6hTFy6nmBWlI
         1FtfLqnZ5epYKfd44BX6qnU1X0Dl1Xub3uD1lzoHr+wLQXq4Cl0EalWAr7greOqtYIhn
         icPujdXnuSx0dei4ZTI+rigxiV0UlNO6EIjpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721262301; x=1721867101;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWt5MRgiFwtJHB8UyQZuipfHU1hROtorTGuhqMlfhd8=;
        b=cnVWMb8V1JQJGkpKQJOrvxY39HLlyqz2INS3uVoBjTRvW712XZkrFJuZJAN/c3p1+p
         UOO05+CgxthJb5++32J5vQEfWdVXQTASJSHFUeiK809i+CcoLtPaD3AwUp1A93Jp/ieT
         mNM+C8FBOjlzhZ6jCAQGi+WQKKsi9bFF0RcQCBEFwfTzZ9UeMz9ocdYCdJUIllxnYJs5
         oaQgBHjKQ1rJVNd0DLoAs8/b/EZT6egg/1Dz9WLHbMJyQY0Du9a8FhRyOdPhXV4yotk4
         1e5oqN6jhq2XxAzNgPDpBKt8hrmkT/GBeDXq2igsuyNkTayWUzndI7wEq4eclPvu/Ztv
         LcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhVAZN7sw+lLLTGPTNQ6VaBvQ+C7vCiR5x79hGj4IkQ2wmc4kZjXuRLZ+E/5bXrP6hY3kLy4KEimCQEs9jKTl6DqBm7EwHMMjF
X-Gm-Message-State: AOJu0YwlbeJrhl11fzrSKQwkeV9US2bIXERf2o0aMDNlZe0EWl+wILei
	uBUkqpa4Jz7C1wX6hCeOEIVduMrWVj53SHO7xpdxks8u2bNmanmkOmksgPMElZ4GHYfy+pzQTl0
	T29vmXA==
X-Google-Smtp-Source: AGHT+IHKUkPyStlhjl4nQewnQewWD0v6BF8hrq1Ox33IpiSX2Ghh+3FXnBYJf2vULt1YeT236TfEgQ==
X-Received: by 2002:a05:6512:3c93:b0:52c:df6e:9517 with SMTP id 2adb3069b0e04-52ee53a582bmr2358732e87.11.1721262301506;
        Wed, 17 Jul 2024 17:25:01 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2538e96sm1642163e87.245.2024.07.17.17.25.00
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 17:25:00 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so4151801fa.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jul 2024 17:25:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUntwE2uQo805CnQhE9F7gUZJ1lZMgv2pIqSDui755SJhuwkuZRjDWSZMW3/E5YDFqFAQTKmgvpi+bjJ8If1W3xy507Zew8pawz
X-Received: by 2002:a2e:9d0a:0:b0:2eb:e365:f191 with SMTP id
 38308e7fff4ca-2ef05c6e43bmr5642541fa.15.1721262300266; Wed, 17 Jul 2024
 17:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZpY3X1tggZC3s_1X@shikoro> <CAHk-=wigtUnqv+RXkLZ2TwqV35YQeGrYsMnrowpnmQNN6wyhCg@mail.gmail.com>
In-Reply-To: <CAHk-=wigtUnqv+RXkLZ2TwqV35YQeGrYsMnrowpnmQNN6wyhCg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Jul 2024 17:24:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wir5OYeNSytz+EocQnQxoFX0LY962R6FDj9cAHBiXFe5Q@mail.gmail.com>
Message-ID: <CAHk-=wir5OYeNSytz+EocQnQxoFX0LY962R6FDj9cAHBiXFe5Q@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 17:22, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I have looked up said explanations, but next time I need to go look
> for explanations I'm just going to ignore the pull request as clearly
> just not worth bothering with.

Actually, I looked more, and that's just part of it.

There are other merges in there too, and this just pisses me off.

If you can't be bothered to then write a summary for what the
different merges do, I can't be bothered to pull it all.

                Linus

