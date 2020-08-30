Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03C4256FA3
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Aug 2020 20:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgH3SB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 14:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgH3SB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Aug 2020 14:01:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C533C061573;
        Sun, 30 Aug 2020 11:01:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 2so1890286pjx.5;
        Sun, 30 Aug 2020 11:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l67Rw1sesTKoXlj3/enQAM/CdJ/NqO3HI/tHvDZitDc=;
        b=GhLe+JR6MCYusy5seMJga70EhO0dPqsJES/tKOcXiEd5uAQKJgZ4KwCCGcXjxP4YyO
         z8219umkSpaknsvY3swr4PpPl1TiL0u45d5VnMAuJKoDuQth+of2PvQ+D8sj4FV4Crs+
         /7DocExmKVPjmmJ14SFc94TCugtt8/C53e+6L5m1EiRG89Z2P08oJEasVQKE1eCzOaWD
         bINJLMXO9l4LNR5OJ6taAa5qmORQJrex4QLdOGywhGTswbSo05Vw66SSPXy5FC2TpQ/D
         vOuIO66MhbBf6QmaCimw/SUslZ3FvTznWa0hhw6pcnbpHQHH5TewJV0vpuvBKjLYhCjt
         OdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l67Rw1sesTKoXlj3/enQAM/CdJ/NqO3HI/tHvDZitDc=;
        b=Tl5yqiDfDAuxQ++AfIzGQW5V0TnqIh8ODfjAOw5HPzJ52Yfqyo4KP+o+8bIF29Qr/K
         QgkUU0mWkAalEhTGjmP3GBUFB22Tq4fRodI367+CKj27OCgevmvctxGTgCHOERekHW9E
         cJPGzco5wF5tgAalCKQAiN/Sxhkio4h6mo1ON76mfQQgd+LFZwP6+n9/0U08eVfWHPvI
         xJmfzU7eFNqoRxooRrdCfKr7o04D871xRk/0hL22eLSd/hCBkLLZI9po5KAj8M5i6+2C
         xcSL2YzvhXBkuXbVwnRZErekINYR/fCY7F52Iv/YrsvQzCat3JMzyY98hnMEDy/5ANx6
         nszw==
X-Gm-Message-State: AOAM533fvGgWl/YuYUBPr9mlI+YdAce2suiokIbrs2UUhcYyC0G3r85E
        +A4qc/wEiSsZaUCW2eqoekqAWdVcCMAMt74HL+0=
X-Google-Smtp-Source: ABdhPJw+9Yw8+S266cpAmsmm5KS2ZNuUQJG0BrPBnDrpPTXTgGfVD8RPnxrG98llvczA/goxydGlReOrf3ARelFPguE=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr7065082pjb.181.1598810515270;
 Sun, 30 Aug 2020 11:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
In-Reply-To: <20200830122051.197892-1-tali.perry1@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 30 Aug 2020 21:01:38 +0300
Message-ID: <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     kunyi@google.com, xqiu@google.com, benjaminfair@google.com,
        Avi Fishman <avifishman70@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 30, 2020 at 3:23 PM Tali Perry <tali.perry1@gmail.com> wrote:

>
> i2c: npcm7xx: bug fix timeout (usec instead of msec)

This commit message is awful. Please read [1] as a tutorial how to
write a commit messages.

[1]: https://chris.beams.io/posts/git-commit/

...

> -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +       /*
> +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> +        * 2: double the timeout for clock stretching case
> +        * 9: bits per transaction (including the ack/nack)

> +        * 1000000: micro second in a second

No need. See below.

> +        */

> +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);

USEC_PER_SEC

>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);

-- 
With Best Regards,
Andy Shevchenko
