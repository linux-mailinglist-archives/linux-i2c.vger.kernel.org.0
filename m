Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9607EFBA3
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 16:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfD3OiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 10:38:17 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39362 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfD3OiR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 10:38:17 -0400
Received: by mail-ua1-f65.google.com with SMTP id 88so4827247uau.6;
        Tue, 30 Apr 2019 07:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/MpZxpyDtPr1ZLqv6LeD5PWQNm75jdFCBbti4i24g0s=;
        b=qJ78QgHP+RlLxD/wAEFJ5orjGKiavI24OwSoslDHiag0Z0wVNp9fGFTTG2ZDKCKXvQ
         kqL5HhLwLqd1kzi5fj0/41Z9pLbn29ohnNX4jioFaVllNJl2Rc93v5FiMB3YDDx7OzFu
         18To+KaGGv2LPV7CCsbV3jM0ZejlzoI06MhLJ5Ll2JB/qrUOsPxf6h1KtNkNA4ZaPafu
         rEeTarK6fFExofrFYnmoZl1bjKesXb2gTi8tRRb3/cpZBDm3d7TTL/w+bUDmMMxZgqXs
         bREdeExpRT0i5/Bnjq+3NL45DmXtGtKoe2llCc2aAdSNO1yD4rtrVz+ooQLKfDxcDlSY
         lqbQ==
X-Gm-Message-State: APjAAAVAOY2zWqlEYBh74rcqaHouEKhT9/XX9rPCpRIe1Mz1I09T3TTB
        mTMhXzjgfUAqN+gLqQrM+ikPrkE2ML5U/1p/IOc=
X-Google-Smtp-Source: APXvYqwO4IFoo2daahlsdrWpMxEkrp/jRDJwrLdYlgpjoXskQN4SHkJZUyPbx+OfXIbb1TowPaN1E+RbkU7kdGYpncg=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr3899704uar.28.1556635096351;
 Tue, 30 Apr 2019 07:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-3-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-3-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:38:04 +0200
Message-ID: <CAMuHMdVz1G7BTiB2nymahxBGjCTjTdw10ZUecYnPHQRJHTBwYQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: r7s9210: Add Ethernet support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 3:33 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add Ethernet support for the RZ/A2 SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
