Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C9022CFAF
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 22:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgGXUoF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 16:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgGXUoE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jul 2020 16:44:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6388CC0619E4
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 13:44:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h22so11276850lji.9
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 13:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B82gYYGiPy2JMsI7fbcCJSg3IUC2NN/ufVJBewTAqEg=;
        b=MIx4Nwnw0hQOhBxrC/PQv6JymjkmUdhb4keWH8aN8ACb+ycU5lnNx3lXJuG63vOZjb
         BUAJColHg6jYaO75jafZJMwlxOchGjWwGP0flmY/+dRs+aMNz/mEfimaT0NoBQYPt2KR
         LfWGqfZb42ZNg23nQJGx5oYJitbQLfaPCvDUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B82gYYGiPy2JMsI7fbcCJSg3IUC2NN/ufVJBewTAqEg=;
        b=EujAOsq4g0d0fvsRnarEeaD1Z4GKopFRNRPRE3K0vZgkx1HUKNbK20Y7DAQDW26N6+
         gCsVmsmF+gyZc7asXP6wjcKSKRoj3KUSyy751RIwy8RJzHlDs7lxQ86ZMED0GMSla2zr
         x0l2+emZ4rft0cI9HvWmIIyUQ2Yor8FojGPpPjBw3wxaDTUAmCebhv5GmIR6GnqT05pQ
         W6HEVScRH3Ph9LklA0E+EJI5iUbLUjAc/SkzxYMsmey4u7BH/cVDJ7UHMiiPdNJbIvTy
         2lsWA+ATSuPsSTlKiUhfG+aCfJdvCAm7HTT9LjE+5SZNW/vDo9/iBNS+Rqo4vxWYkhKG
         2B+w==
X-Gm-Message-State: AOAM53143WpwB2gTez0sCAKFxt7CvIFicVJmlVZXK+RttL+Mz1pTKlRO
        YqTf1kR9vF89ZzWsztRH9cf+nE1hjEo=
X-Google-Smtp-Source: ABdhPJywuVBxeAF1SFLziES6krxv7obt1rYF0QttQfFRY+rmHtfkjbmZGune472RK3QpO8GEVYPo/Q==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr5423001ljn.345.1595623442550;
        Fri, 24 Jul 2020 13:44:02 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id b16sm477421ljp.124.2020.07.24.13.44.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 13:44:01 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id f5so11257832ljj.10
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 13:44:01 -0700 (PDT)
X-Received: by 2002:a2e:760b:: with SMTP id r11mr5366037ljc.285.1595623440971;
 Fri, 24 Jul 2020 13:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200724192728.GA1596@ninjato>
In-Reply-To: <20200724192728.GA1596@ninjato>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 24 Jul 2020 13:43:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjaHZKQnOuGLWukvMrTmDrDd6iyiq5toQumB2uX1nR9Xw@mail.gmail.com>
Message-ID: <CAHk-=wjaHZKQnOuGLWukvMrTmDrDd6iyiq5toQumB2uX1nR9Xw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for v5.8
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 24, 2020 at 12:27 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> And a question: can we have an additional rc this cycle because of the
> holiday season? I was away and this extra week would help in my case.

Do you have a lot of pending fixes? Because things _seem_ fairly quiet
for this release, and right now it doesn't seem to make much sense to
delay 5.8.

Surprises happen, and this could change any day, but nobody else has
indicated any problems that I know of, and this week has been very
quiet (until today, when I start getting all the "end of the week"
pull requests, so my opinion on that may change by the time I do an
rc7)

             Linus
