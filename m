Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88CAEFCE7
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 17:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfD3Pa2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 11:30:28 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33042 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfD3Pa2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 11:30:28 -0400
Received: by mail-vs1-f65.google.com with SMTP id s11so8273953vsn.0;
        Tue, 30 Apr 2019 08:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J3XpssCaaRIdY7okL1peQ2px2hJ+XExe2uf8ZFq4b1Q=;
        b=d2YO5yQI1d9ZCS6DdnetE/XMChMVM3fQ9MPPhvYhHoafe9arRw8RurXx7Eow14WhZA
         /E2SZKEco7Bu1/X5Jij1lxLsMz6FdjaYCELuB4xow6Qmr1lZjBsfucR7irEikmmCj1o9
         SUo46BGfPEZ/UzQFEruvsxEtbbaNdgxM3i77QZZVi0YcBew6eIO96DP+G+fHRTcBEZpp
         y03KQJb1iPsromu13l1/oV9CQ9W525/5oOgdegA4e7Q8OStzqlePSuQ3OZbPpv6g99gj
         ccy19N1CLKlUGyKwf026+cWLf6LtCKmVUYDh0K5s9WcT42EDK7nl0gqb9OqpkUsk01Dh
         n/Aw==
X-Gm-Message-State: APjAAAVkM9OMJewWMMabFqQ/Ue2Vi395rgW4Zbz3SEhNxkhQ/yfCVH57
        n4qLS6rY+h23reW3MGFMkvsMDaO/TEzL9jxcdvphzkbH
X-Google-Smtp-Source: APXvYqwZIP/Hv2ipeHx0fPMI4fny2wArCoXj0oVTs0i9ek3R+/gp4gAkcJ0ix2h/lnbLkzxNJyxT507o1S4duct3byc=
X-Received: by 2002:a67:ba07:: with SMTP id l7mr8510846vsn.11.1556638227276;
 Tue, 30 Apr 2019 08:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-8-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-8-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 17:30:15 +0200
Message-ID: <CAMuHMdUSqFQXfbrp9_PxY1a0ieH8AWr6Dh-SY1ULzOXd2h0-Xg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r7s9210-rza2mevb: Add SDHI support
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
> The RZ/A2M EVB supports 2 SD card slots. A micro SD slot on the CPU
> board, and a full SD card slot on the sub board.
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
