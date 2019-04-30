Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82FCBFCAC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 17:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfD3PWK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 11:22:10 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44966 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfD3PWK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 11:22:10 -0400
Received: by mail-vs1-f66.google.com with SMTP id j184so8188949vsd.11;
        Tue, 30 Apr 2019 08:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2svcNMtHHNUl5TnbjQhyWeAeujJoUOh21meiL4jUDk=;
        b=ieWy6vjERj+fT4MVZ6h+LYnBbOg+jeJKUDjQagNEF6qAg8D3uiXafCsjA1Q4S0r+8D
         c/xc69Amvm2dtJnXuGRTPyupt5V3OQFvQC7Rsi/5NjmVtRJS+e6bbfQ3ScO4YuuiA5DG
         pAAoni9ltUilxb2Bit6KRJNHgCc7z25iQ004t4hpuh1gN8wUMebG0MpuWrF1MD5zYnVw
         Gx6Ns9hvv7nCf5UwPLUEzDG7DRBo6JbY3gYiSzEj9XidcO15e9NokI/UqS+6zZN3UKPz
         A3BcuPYxLm+mHZ22OxeY3bjw9aDAZFuK2dNlAIK2Dj6nUXFOeKbwVOfwLyhJRoa51QTi
         dE0A==
X-Gm-Message-State: APjAAAUkATzEKVefNM1pZR+zYYlBy+tzmDXJlzUpXrzFQZlNAMWqRQjZ
        EdXvvJZ06PEXyl/v+PaRBfQEPFGNN0Gj68Le2WY=
X-Google-Smtp-Source: APXvYqycXJCO1qpyG1TRYg64mS4XPWpfu87kuLjylx9qIE9m6qABJUJRWshJoHBNSshdedCHIIp22ogarKfu6mjneAo=
X-Received: by 2002:a67:ba07:: with SMTP id l7mr8481280vsn.11.1556637728763;
 Tue, 30 Apr 2019 08:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-7-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-7-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 17:21:57 +0200
Message-ID: <CAMuHMdWzN_1XmO8w_otDseJ+bxk+AKNouk-ycPPyM2XWMWritQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r7s9210-rza2mevb: Add Ethernet support
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

Hi Chris,

On Tue, Apr 30, 2019 at 3:33 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2M EVB sub board has 2 Ethernet jacks on it.
>
> Set switch SW6_4        to ON to use Ethernet Ch-0
> Set switch SW6_5        to ON to use Ethernet Ch-1
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts

Perhaps you want to add an "ethernet0" alias, so U-Boot can find the
device-node and add an appropriate "local-mac-address" property?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
