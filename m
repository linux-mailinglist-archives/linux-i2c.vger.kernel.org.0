Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DA4309EAB
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Jan 2021 21:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhAaUJW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 Jan 2021 15:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhAaTqL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 31 Jan 2021 14:46:11 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F67C061A27
        for <linux-i2c@vger.kernel.org>; Sun, 31 Jan 2021 11:35:17 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id f1so19875825lfu.3
        for <linux-i2c@vger.kernel.org>; Sun, 31 Jan 2021 11:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=TMdAwgGCU0UK2zGDufFD/rnwy1XjE0usi+CtbeAisS8=;
        b=XZNf2G5ga3i/e0kxJm4Usq8ojU9pUUov9Ps2+vp3HvTpxsIJVu8VDUJLGxtXGyvwcQ
         AAnh1Lu2EQb+IGdRHowyxfY2TJ6TxDwoC0LovnoCrtz25JVV3UJKzw3zRjVu0gFSlSnM
         98MUPt4nnZIrbp+Jl0FWzGyR6UG9YyOQib4Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=TMdAwgGCU0UK2zGDufFD/rnwy1XjE0usi+CtbeAisS8=;
        b=FKRW7TWKd4ARSBqI6FD5gUimVVCJKMcJueRflYfpeX+5U78pI4G0+fgYr0Atqa2Jjj
         DjzfU4koTOO7qB0gFrRaY4QC66h9FLNVrqQNhWK9djnJ9ErQ9DHiqv7o2M7Mo0rhUV2y
         wdh9UhSZ+DdK0mn/dpHVCWj2qWBgA9yfD9Fm0Mp/leOxqGH53Jcz562mIG3MT6Q2Zi4v
         Yxq7IqYNMxMZCjZ5W94D+wbN3+oYmBDRByQtTdYrxXmLb47MpHpVW7N9Nx8PUPF3NVwg
         NNNAK9HNy87iEBrOvQbo68uaBaa5rFy+Mmnioy6gsN6WWhDBHRUZFOGO5UAv82Q6W3ey
         6lKQ==
X-Gm-Message-State: AOAM530H/3D6zWy6kL9cMEoCdj/xSRLkX4pTjysvfKP5w3ThZLAZxFub
        mB2LmWJJujmT+oZl4LhF0vOeAKpj8IzaGg==
X-Google-Smtp-Source: ABdhPJw4qjVpQytKFEPXlWVrVNMlSBhDsfxiYtDc5aIU1EFL8yMzSNAfGXCzrqfvfkDAX0vixOo1pA==
X-Received: by 2002:ac2:5462:: with SMTP id e2mr7330386lfn.655.1612121715436;
        Sun, 31 Jan 2021 11:35:15 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 127sm3528908ljf.132.2021.01.31.11.35.14
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 11:35:14 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id y14so4314831ljn.8
        for <linux-i2c@vger.kernel.org>; Sun, 31 Jan 2021 11:35:14 -0800 (PST)
X-Received: by 2002:a2e:850d:: with SMTP id j13mr8269533lji.507.1612121714111;
 Sun, 31 Jan 2021 11:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20210131114017.GA1332@kunai>
In-Reply-To: <20210131114017.GA1332@kunai>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 31 Jan 2021 11:34:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiZ5-eiJbkJxQo+kXPN=wRBTGZZHKUB8eA428Uft7j1Eg@mail.gmail.com>
Message-ID: <CAHk-=wiZ5-eiJbkJxQo+kXPN=wRBTGZZHKUB8eA428Uft7j1Eg@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for 5.11
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jan 31, 2021 at 3:40 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> one I2C driver update this time.

Pulled (manual notification because the automation seems very flaky).

            Linus
