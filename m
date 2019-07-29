Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4673978ABD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 13:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387664AbfG2LnL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 07:43:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56210 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387483AbfG2LnL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jul 2019 07:43:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so53537246wmj.5;
        Mon, 29 Jul 2019 04:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jigptzo01XZyGgLtipuPU950QxuAZ3ye0iGsK04xVZM=;
        b=EK5T+3fskevPl/P3wy0lUyvPgc0TCuPGcEx/WdUGethfFz91VIQY2caXQ6CDB2ejF9
         IoSiyiPXRhs/RWr23UeacbYpy4eAxajM83/kAqUfYYZQt9Sy5vLvkCzJ5tYyCGbMsdbj
         HB+zFj+mPuLIDwyXYSjdueP53uijOmMekzHWX4Xk8HxGEljlRLae963eTGwx5RQpXtEg
         gU0aAkQMHQPjlqX+Fs39N9x4TZHt8J9sXln4PaQ4+WC98llVIfRgdR+Su4gNO/nopTRG
         QxXU0B5XQre3yfmD76tJOs52wIB04bmPT96U7qAnMv8uC1KwzGeQsfznoUkPJv9++3gb
         +7NA==
X-Gm-Message-State: APjAAAU/ZLiFYGMUHhAB1czjBw/iTaY0sgFJjLeQKraNmdSCRoVpdaaB
        7+4fYSkIBAtzTCuDayJfdH/D+4Hrqr3Ozo4rROB8h2Wi
X-Google-Smtp-Source: APXvYqyw7637f2weqxwSRxchSzxJmWFT4ZjeK6nN9vKoOEBYdf4ygLTz4RmaK4c3sZ1BE94k33re74QzD+ovObKPg0A=
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr92695832wma.171.1564400589337;
 Mon, 29 Jul 2019 04:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190724121559.19079-3-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 13:42:57 +0200
Message-ID: <CAMuHMdUYTo1_zz4sCv5=PRL90EyFSU_b5WgUJoc4Oii08F_tww@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: rcar: Rename bindings documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 24, 2019 at 3:25 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Rename the bindings documentation file for R-Car I2C controller
> from i2c-rcar.txt to renesas,rcar.txt.

renesas,i2c.txt

> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
