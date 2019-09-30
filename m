Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA93CC1BC5
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 08:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbfI3GxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Sep 2019 02:53:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:47018 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfI3GxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Sep 2019 02:53:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id d1so8159473ljl.13
        for <linux-i2c@vger.kernel.org>; Sun, 29 Sep 2019 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yATsTcqOqIzZMV98qWIAPWwEMjMrM8gXIgA2HND81Xc=;
        b=FtkhRbMuAFq9oBu9QY8Qq4PUBi7P8wG9pwBBI5gh9ZFAP1uE5Z8owLiNoz//UjqGYQ
         fQhndMyHQ1hPRQnD6ur2p6trxwMyp46wm3Vcw6Fyrpl81AW00cOdQytunyp/2v8lQemU
         SaOycOu6xeFMyUosNLzTevrP3MKyY/e5X/5NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yATsTcqOqIzZMV98qWIAPWwEMjMrM8gXIgA2HND81Xc=;
        b=ArTJYAn4lD38/ZqO9/cWYTLhKFqmucQN6kq8DUTfaMnOz6EabJ/RgjHFZaTuGbcOxF
         76r8pU3IYg1tAnTPy7JKee2e9LDU3JIPVpioZZwi6lgfbaib6uS31PT0L3XNg/BhMa6z
         rBu4ENk52LI2SMWzwvsz90csWYLpXF826YYbZe/dptEmwWbPsHDuA2g0S+N5OLWbymKh
         ynYauTnPLqNwkEAxgPb4zHJ5oCaj2xwcaWRmT6k72pgbeQjjGkwWAixVdARLjeWhomnf
         9Y+4G+GCeYEArZ1gDd6/KkRJwNlRtWvHbUQV6sJMPiJhE0xHxJh9ayzMn4TfFnlzsjPB
         bCjw==
X-Gm-Message-State: APjAAAUASJVGWNzK66xuv4eQTd+5b8bxiNMmHKDUViFjo51fhRd0PwSP
        xUgnIMstOK6/1q5RVSjfF45TRPv3oG5iXp4rV9Hipg==
X-Google-Smtp-Source: APXvYqziLiuF94ED9ic8k7xqYKDkQNdzt1q3xAbH4DhKGFt+OHhSfqDtzXLbca2sgZAoi7etyCT/7Lt0hhqj6DqlfRM=
X-Received: by 2002:a2e:1246:: with SMTP id t67mr11165358lje.174.1569826390743;
 Sun, 29 Sep 2019 23:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <1569472808-15284-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <20190928181910.GB12219@kunai>
In-Reply-To: <20190928181910.GB12219@kunai>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Mon, 30 Sep 2019 12:22:59 +0530
Message-ID: <CAHO=5PHj1PQUGi3EYBPVNUsRHsEo9WxU6CsvR=9+bP4n6z-cMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: iproc: Add i2c repeated start capability
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Michael Cheng <ccheng@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 28, 2019 at 11:53 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Thu, Sep 26, 2019 at 10:10:08AM +0530, Rayagonda Kokatanur wrote:
> > From: Lori Hikichi <lori.hikichi@broadcom.com>
> >
> > Enable handling of i2c repeated start. The current code
> > handles a multi msg i2c transfer as separate i2c bus
> > transactions. This change will now handle this case
> > using the i2c repeated start protocol. The number of msgs
> > in a transfer is limited to two, and must be a write
> > followed by a read.
> >
> > Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > Signed-off-by: Icarus Chau <icarus.chau@broadcom.com>
> > Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> > Signed-off-by: Shivaraj Shetty <sshetty1@broadcom.com>
> > ---
> > changes from v1:
> >  - Address code review comment from Wolfram Sang
>
> No, sorry, this is not a proper changelog. I review so many patches, I
> can't recall what I suggested to do for every patch. Please describe
> what changes you actually made. It is also better when digging through
> mail archives.
>
Sorry for inconvenience, I updated the changelog and resent the patch.
I have kept the patch version as v2 only. Hope that is fine.

Best regards,
Rayagonda
