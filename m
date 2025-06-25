Return-Path: <linux-i2c+bounces-11588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1658AE88D8
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 17:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A62188B25F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 15:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FD429C33C;
	Wed, 25 Jun 2025 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PsfX00sT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59FE29B8E0
	for <linux-i2c@vger.kernel.org>; Wed, 25 Jun 2025 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866799; cv=none; b=F3xeOtYAagxf4Wqs/FPq5IVbpa7n4xTHmqEgKXm7oOGJfrg8kLulEnsjnuwxsHynuvYrVdDztl2JCbT+VMjTJHsPK0k5oG6PXrZItfxJYsDZt13RyZcMiIiYfxsJhoR8ySafz/cvHjaHI5ryEyc0AsCB5Oz8wQMijs4If9bRnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866799; c=relaxed/simple;
	bh=efuYxcvP+skPRYGGDBZaIE/0l6fqS0GIgaYwfjG5Be8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3p18VbnZGicZJxdicfl2Tjx70K4zo0xxGRR6l5UiTrBAlPnRYxzBrZMjzPV/rKHmEfnLdYDSsBHvZrT96bfOJf8Eyf+cqwEvWOGakYYkRI8FsO5sRCexXpd3Lt+mZfV9kJAzwEfLNil22+UrjscL0e8HzSjU9LBzqVHjdfGpC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PsfX00sT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso13979866a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 25 Jun 2025 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750866795; x=1751471595; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrLwKO1XcHNnhg2ay9rGcu9ksg+hf0NCQY+Nwy5u5pE=;
        b=PsfX00sTSMhzYjG2FK3M0IdlHHZt8zgWWoqL/hSDGp26mhdNwRHWAHr3lYqWtWLng0
         7N00/nzAz7iYJEnVgObXmDxSjEPTC8dYzw06hyyJdrDXR7WpKo4vGiO9Tl+mXBd1DpDC
         8GtbUwluGj1pU91pWHiI68h8+cqskPIlxWnwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866795; x=1751471595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrLwKO1XcHNnhg2ay9rGcu9ksg+hf0NCQY+Nwy5u5pE=;
        b=ArNOBfhN7vsvUkfHhltArLuw4QTQQGES5Sofus7j/9IF6JwbSTOLbe2+X/+H8QOQyn
         RbybxkDsiX8b22Y5ltmBeEWHH4o7dQ7i/KDgpD9y2URa91HNKGTIUxVJWY81C05N1EIi
         TQUAleHLAvkmpfYWiG5Ic7mOeGtlBqU452S2Zur/dv0W7MWOtGsnrw+xLq+VeoAJ5GR8
         15bK29bkCg7NDdV3Sl8jI4sjd7EOJ/AZ985zK71pc+gZZ4FAMV8ZVpWBBPhnlYrCvawf
         F8GzbKszzdBIsHpxNMMTOgIo3/HdL605q+e0G8baOOoJVJMuRe6CXhGQB+dLw77JDtnl
         /YxA==
X-Forwarded-Encrypted: i=1; AJvYcCXrszaHteaIXWpOsRQLdDuaqPwm+df379KstHX0IILNJ10WtVAnaKrsUG1y99h1Sk0Lbc/ip/TxoSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmseofnpojA6a/mSb3gUKy/app9L7YybJl7P3t1fGR1XyjUlke
	kBtRZMUSEmMJlR8Ytgry3XB9//e3ZayNVGeF3LqYZSRzyC2f+cTYX90abY8sxV3YhTyfN326F7a
	2yGOwzQs=
X-Gm-Gg: ASbGncvYdyUN9TuWFUH8mZqau0/LG79PJluER4WaThW9xHyB+1XSUiwHnNXyzumUfpB
	dVxNEyziDjYc67QKnoJG4zX60Nj8rfmAKnjK0CHeRm7Gh5WhGAKCenx0s4+M0FE4mhKWAMim4eo
	E9SeXRw7tujRs7dJYPAi7jp7ZnGSJhBW3sbHoBVacgq4s6hEzcRyqjxrl5atBr7Mel/Gbr2en7N
	AsExi8fBeGj1B2VxgOXKU8Ad/OWowJy21tQ7sahoZbQzomtydmbrtx15V9RY0WXD97BYdtdq4Y1
	kEZEeZ1wVLHM1LURM7v0OBVZMvrXDPjWa1xkyAhJTo+CehM+Bb3mgfzvxm+bRa1+kRub7yPgJjy
	Vc0kpxmUKcnZoHwwLf4mBq52iboeVDcpCbM1LRT5Zs1M4UOg=
X-Google-Smtp-Source: AGHT+IFcJQ4YAquNlQvMySVVP8ZR/9//ooi+9YBb1ZHJi4fKUXyBIWuUOautSxlvWoSPtrxlxDi0jw==
X-Received: by 2002:a17:906:6ac1:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-ae0bee52de0mr302354966b.47.1750866794735;
        Wed, 25 Jun 2025 08:53:14 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0c870a75dsm90875166b.39.2025.06.25.08.53.14
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:53:14 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so5353461a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 25 Jun 2025 08:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4KKyZYMzgFMr/za2tgPjkgAemIA57yvBL4lB8672lYjEGJNXBVKdt5gBZ8bH8RDWZ931CvX9lRTk=@vger.kernel.org
X-Received: by 2002:a05:6402:5192:b0:601:dc49:a99f with SMTP id
 4fb4d7f45d1cf-60c4d35506fmr3264384a12.18.1750866793588; Wed, 25 Jun 2025
 08:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFgDHBHwY5ElWILx@shikoro> <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
 <aFvAlSQICukBzt7K@shikoro>
In-Reply-To: <aFvAlSQICukBzt7K@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Jun 2025 08:52:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+yt71aGSmn4WQjFouxoQuxAmjmM2xO_SD4KipCXjwLw@mail.gmail.com>
X-Gm-Features: Ac12FXxccCDQgyxAH3o8NoSDNlLJraqyT6j1-BMwC9gqJdDbvSHNUAqg9CvMSYs
Message-ID: <CAHk-=wi+yt71aGSmn4WQjFouxoQuxAmjmM2xO_SD4KipCXjwLw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc3
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 02:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> I assumed that it was obvious that everything in this pull request was
> automated. I honestly really don't enjoy pushing whitespaces around
> manually.

Actually, the reason I reacted was that it wasn't so very obvious.

I took a look at the commit just because it was larger than expected,
and it didn't look very automated

If you take a look at that commit 614b1c3cbfb0 ("i2c: use inclusive
callbacks in struct i2c_algorithm"), about half looks very
straightforward and looks like a sed-script or something. So you have
things like this:

-       .master_xfer = bit_xfer,
-       .master_xfer_atomic = bit_xfer_atomic,
+       .xfer = bit_xfer,
+       .xfer_atomic = bit_xfer_atomic,

which looks like a very straightforward rename, and may well have been
done with something like

   sed -iE 's/\.master_xfer[[:space:]]*=[[:space:]]*/.xfer = /'

or something like that (same for the 'atomic' version, of course).

But almost half of the lines changed in that patch (ok, 40%) is to
things that didn't actually change. and is just whitespace changes to
unrelated lines that didn't change.

You do mention it in the commit message as "Fix alignment of '=' while
here", but that really did make it much harder to see what was going
on.

And no, this isn't a big deal, but it ended up annoying mainly because
the line count in the pull request was bigger than I would have
expected from the description, which then made me go look at what was
going on...

                Linus

