Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02779FB84
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 16:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfD3Oau (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 10:30:50 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37265 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD3Oau (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 10:30:50 -0400
Received: by mail-vs1-f68.google.com with SMTP id w13so8115383vsc.4;
        Tue, 30 Apr 2019 07:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRfsMFI2dH1qoYhEbME9nsh6N6EQWZKZKVcQzhfJBfM=;
        b=gEQtt4mBunytloUkh1AB/1T86Hzq4XAgRruUY6PNpJWxVTgVSfYVkNLrduaFci45n/
         1eMFA/E0xNcqiapiSKWCP09y/pTTh8HU/gQplRnGduMmzn07yHGGXd+rJd6UdqH/TcND
         TS2xjQDphS5EmPBcCuorjRzPDE4do6DqJrihaLwUQnbJGncXYURP9+RCNMz0xLjIbfr/
         CsMV5C5BnwqnY5G/mYCNQkTdlFY/8liOd/XR+YIq1Uft/n5PcdWpYHdHIAvpAl+b9Vom
         ycXYSI2pPo48gSx3fsXCOPgMKKyRwF9w04egCkNhHq+lQYWGtQQCZ2gzzuTcKpvRZB+9
         suDw==
X-Gm-Message-State: APjAAAW08u026xNuCH2rh2tx3cCocIfUk6VPQe3HagOCBcLIZVlBbH/j
        c0dfHP98T2uyNY8RkexPIzfyPLMSG492vaItfOM=
X-Google-Smtp-Source: APXvYqzTgPvlFQMpxmmo0yJlPLIMj1LIOvrfNlOa6i8nfSo//vzWZRrxaPTM5Vigt9MQWffSpsEcgpQ6cDRB8g9HgpU=
X-Received: by 2002:a05:6102:113:: with SMTP id z19mr5493512vsq.166.1556634649735;
 Tue, 30 Apr 2019 07:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-2-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:30:38 +0200
Message-ID: <CAMuHMdUeuxRNFPW-XVy_JnEpaoMHXZM7v_FPjXQ7xnrGtvFu4A@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: r7s9210: Add RSPI
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

On Tue, Apr 30, 2019 at 3:34 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add RSPI support for RZ/A2 SoC.
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
