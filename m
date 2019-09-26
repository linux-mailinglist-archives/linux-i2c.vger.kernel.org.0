Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26FFFBF337
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 14:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfIZMnf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 08:43:35 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38751 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfIZMnf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Sep 2019 08:43:35 -0400
Received: by mail-ot1-f67.google.com with SMTP id e11so1853756otl.5;
        Thu, 26 Sep 2019 05:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xaZjgarK9CYThctBUtjyEbiHILC+LTcDWErdkYY4QV8=;
        b=anobDpR82GA6s+NwqOMr5LjMZUNtcE/Ud4QrrQBmOY7JCF5/DPMzm4rQDGgpWRkkZK
         LzYWjaIlQszo75yeblsykR6y4XWnMljwXKXHLveY/frydhL8u2QYO0ZTYt3mJW4e+q00
         +c6p+JvZQ4Ad273LZDVv3crywiVfvr96JtbmkJ4iP0NDbvQngXRcGbu1r1Kq9Qve6nFg
         XHn1taKF5KxFse72qA5Fx1oCkCo+S6PMHbmGXDyLqVHRO1VBUKFqp9YLbc0Am4PpVNmq
         tB3R0RFZhYG0JvvA+jOJVyZ8K5PB7uub7noJrfrhHNpwZmjMZPSLY7SuvKHmE/hxPkA7
         d4IQ==
X-Gm-Message-State: APjAAAXbRKuhi8qS9Y8oyW0FYZpOO3bsQ8F4at2Wukz2fi+eBah+qcis
        PKGvF89Zp65v05pI+J5muiEtXl4RKrk4v8RK1XQ=
X-Google-Smtp-Source: APXvYqyA82AX+5py+5vYcZhKasjc7tRy7AskMCtbibVccfaptnBC9UXxhDazhb2BZGqRkDWUdjaxvZK3E4kQVlrYZqw=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr2503102otj.297.1569501813872;
 Thu, 26 Sep 2019 05:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <1569310619-31071-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310619-31071-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:43:22 +0200
Message-ID: <CAMuHMdXwpSeQPUtKT4g6Oa14w71WM9dw5xXj3DUZ8Qj6=9OM0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 24, 2019 at 9:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 1 +

Documentation/devicetree/bindings/i2c/renesas,iic.txt

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
