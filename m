Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5AF7F06E
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 11:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730881AbfHBJ1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 05:27:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37644 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbfHBJ1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Aug 2019 05:27:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id f17so65647167wme.2;
        Fri, 02 Aug 2019 02:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIg7aTH9b3E9kYGWjXnnmsf5j7wgbA4CWkOX/4vG7Vw=;
        b=E4tj0F3UDIp/Zmv0OY1JVyi9rsolG4w5X90sID9pdzFA2sdcvrWNps/u0eN05lrS7g
         869CN+1nkd1u/f5Ijghh+xNgDpgbOGTp5AK9/A3F0BQgaRh8ZwUm78rWxAXSJ/Vw2Myr
         roa7dVl+UbsD33Bzqj63OZB7pl4WS0G63WImnw+1GPhuA8a1tvrvm00yE3nJiv5N75dM
         4CMjD+l5ZPg7lSxRRn+xKUGbJ7WyoH1C2UI177/RiKPHvIqNThQEsrd6wYH0i3mJ2/Ii
         YBbFPWKTNmyZBr2I0DTHF3gqjBe68wNfJoVVZ9sbJ55ukE6hNDKCBHlViuX3UpFtGlzJ
         rSSg==
X-Gm-Message-State: APjAAAUZbnu2t1C1sKUw1BssVIq3sOp0+OhbukEexC155c5bPD6Wrv5Q
        KXRpFmsdVEfI0ZuhSAE2dtGqyfVXRTOb+H2uxnw=
X-Google-Smtp-Source: APXvYqzHpCFHsERb87Qu+YKh3UX6L83Kfltgn3P547FEalqQbpSkUyUYl80wSb/BFR0Zwbuz8d16UiD02FIYz4a3+Wc=
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr3366811wma.171.1564738050824;
 Fri, 02 Aug 2019 02:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190801125750.GM1659@ninjato>
In-Reply-To: <20190801125750.GM1659@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Aug 2019 11:27:19 +0200
Message-ID: <CAMuHMdVBVFbcTDcXbBT18NfTnAxW-Gz6XnBgKO5REdHtw9zeaQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] dt-bindings: i2c: renesas: Rename bindings
 documentation files
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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

Hi Wolfram,

On Thu, Aug 1, 2019 at 3:16 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, Jul 24, 2019 at 02:15:55PM +0200, Simon Horman wrote:
> > Rename the bindings documentation file for Renesas I2C controllers.
> >
> > This is part of an ongoing effort to name bindings documentation files for
> > Renesas IP blocks consistently, in line with the compat strings they
> > document.
> >
> > Based on v5.3-rc1
> >
> > Simon Horman (4):
> >   dt-bindings: i2c: sh_mobile: Rename bindings documentation file
> >   dt-bindings: i2c: rcar: Rename bindings documentation file
> >   dt-bindings: i2c: riic: Rename bindings documentation file
> >   dt-bindings: i2c: riic: Rename bindings documentation file
>
> Applied to for-next, thanks!

Without the wrong names fixed?
And with an R-b I didn't give, probably due to the two last patches having
the same oneline-summary?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
