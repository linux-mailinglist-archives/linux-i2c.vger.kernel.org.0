Return-Path: <linux-i2c+bounces-5032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12357937412
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 08:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B190328209B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 06:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0702242076;
	Fri, 19 Jul 2024 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgcYeT8P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E3383A5;
	Fri, 19 Jul 2024 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371278; cv=none; b=BZt43mEpwN2qonP3XQjE0UQ+6y+244G1211gIO1OBLetQMKXS1QBMDg8YrvUrTk0MRAjpaPykxyoLR5BCOoZx+dE/rvO+s6dalEQNdpONMWE8u5HOuxPGdrixPudBmOVpyt/DN9+0kRYUD3c7eKjU5vo9JicsadoT3sF6kntf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371278; c=relaxed/simple;
	bh=wnRHkCcsp2HkpohgU9XPRNYn+o7k8mTAF1Ghy3LwOa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ex+J77jNzwuWakPCoTJQhPwVHJZhPhkXqnczJCq+rSlVYwtf8qgeckgoy9g17hixdvKmxY9OgZB1ClZ5KxkXAoNeAlBKBKUhOcqMs/A76RuxCRCcGD0hAAYcQHPDYRMQBMMmcFrlipSMFs1VAiR6bTU0eYAKnAt6iZWn+eWuWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgcYeT8P; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70b703eda27so438688b3a.3;
        Thu, 18 Jul 2024 23:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721371277; x=1721976077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wylj3kGOIDYE2cN9wsFtunTW5uEeiidj5QZYKMEAguY=;
        b=CgcYeT8P9IgXY0v8mSKjYZXvgL/jA+W9LJCil/4V4nTSirkFcLLiClvJMZEZ/P/gZA
         o2hpWrk5eQQrNE/1JQwaw4sw2CjcFdZilXqe83A2PLDECeQJ8/bFbGnqGkNWCzbCwzOW
         4InDE0EEtYsN9QtGYCFIKfORVS4YS1bDQyIjFJMN1Wd/PbnT/HFkwKG9y2kZxHD5Dn/O
         7tBIWCnAREiAF+K44O/Gbhmfhh9CBn8FewIn8jQ40LoylVgDkxoYRn50IHu+gyckSpc1
         n9vDidpz2OjTWNF25sS2zQGFIk+bLyUSSZsY0AXGYJPIwFs0uo6PXIQxwT8nA5vH3fzi
         0gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721371277; x=1721976077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wylj3kGOIDYE2cN9wsFtunTW5uEeiidj5QZYKMEAguY=;
        b=AhH4b4Mn4OHoWUG1BInDVYWY09rRer5Y6Iv+dhBfdR7x7uiQYwcbDcl2I+Ebu+7Ks2
         i05XKV8+102+osq3FKfQU8s1VCb6RrJN6I3wsNs6rpTwzensyAPcvAKDZGcJATrzHMso
         ieBnFSv5CXZNR5+pTNBA+G5focis6+rPM/z0GzNyQ0IwK/T35kK20iW3hL2rhvZdjCHw
         UokfCqUaj1KSuJMmMpKZW/0VRX1qKExSBt8uFM5/OcoaZ1vq2cmFGKb7KPgKLamL+9w4
         uupxJM9LXe29oY1QbZFpnNlTYTUGr9UsMJKtuDxjZGOq6pSTG779AnF6neJnMDqbJhSt
         311g==
X-Forwarded-Encrypted: i=1; AJvYcCXvJ8vjitD4yRmZw8OCaOisbTR+g504y7yKz6xZaz225/env5bCaxiG7aEqe5h7HBSvBU8ar5lIV6tF0hvuePCDp+YKFsu852uiPoGyGpoaU/0K1e6bEtmEP/s6JFClVS58GucnGvm9
X-Gm-Message-State: AOJu0YzEGEH3rVE4YGCF1y8ZTrvrQGa0nXiGEE82b9v7fntIWjLWw5gz
	5fEutJtQu6Yp71iNiclfMk/XVdv1qLDn4CTl9b8RW2TfqO8QXFiqSPms0QqZNpkzJjllpRQgWFA
	RiEytCuyrnhCxyz9ggZbyb07xIj8=
X-Google-Smtp-Source: AGHT+IG3nMlwOix2gzmKqVxWoGCy1vqIpD7oDhq77rjL4jTUXExgzWOFWJAse1xqRxzwvbBJ9JX2jQl4LZlKlWyksdY=
X-Received: by 2002:a05:6a00:13a2:b0:705:a13b:e740 with SMTP id
 d2e1a72fcca58-70ce4e43247mr8232515b3a.19.1721371276612; Thu, 18 Jul 2024
 23:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu> <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org> <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org> <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org> <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
 <ZpmKho9_t0_MeOP7@casper.infradead.org> <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
In-Reply-To: <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 19 Jul 2024 08:41:04 +0200
Message-ID: <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, Mary Strodl <mstrodl@freedom.csh.rit.edu>, 
	Christoph Hellwig <hch@infradead.org>, Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org, 
	urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

>
> On Thu, 18 Jul 2024 22:35:02 +0100 Matthew Wilcox <willy@infradead.org> wrote:
>
> > On Thu, Jul 18, 2024 at 02:31:03PM -0700, Andrew Morton wrote:
> > > The hardware is weird, but we should try to support it in some fashion.
> >
> > Why?  It's been around since 2005, and Linux has done perfectly well
> > without support for it.
>
> Oh.  I was assuming it was some new thing.  This does weaken the case
> a lot.

This wonderful interface is used in recent products from them too.
Adding support for it
in an upstream-able way could be still a benefit, as these products
are used in different
industrial environments running on Linux.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

