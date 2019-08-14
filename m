Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193598D72E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 17:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfHNP3U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 11:29:20 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36858 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNP3U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Aug 2019 11:29:20 -0400
Received: by mail-qt1-f196.google.com with SMTP id z4so110608145qtc.3;
        Wed, 14 Aug 2019 08:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkxXFxsppAjXcN3Fnw0Ysp3XgDoee+JKNoPUXSqHEM4=;
        b=SipexNLQTdiqQNlEHJbGyAE3AnuyNLioPesL8ndijjGQV39XVg6qP7TDc8bmQVmGNC
         VsTuWgPlGcQvGZon+ZRlM91lhj4JyGHOEKt1GN7/7pKuEqS2cbSRKQ0gCC4tYhe5uChJ
         oOFQT2s7bRGdJbHlSi2lgucUQdCSMJMQze4uvWWTsqdlhoZzu1fWrLUNDLiFN790dWue
         ywfmCBLNs6drSKoMHyZzjmbAtWXZjcHOsaucD7U8TP+MfgxqFwqYHTC5XVLA9X9AvzYX
         FzHER/W5TthAQ6g9dFcxZsEgLlR5KnbnpKktl3S2lfEdbjbb9QvZN6QepG3IMh7m8jst
         7Hsw==
X-Gm-Message-State: APjAAAVSTknwJ6wDNixg65MosHJEpn0AFb3PjWANwPmW46a+qGY0+mRB
        FqZvJssExL6JWuSGHHkpcoZJqy5s/bIYQ6Hfyhc=
X-Google-Smtp-Source: APXvYqwLKjmuLo6RfGCS8yr97bmaozdgfj78fh2TDXsp3KO1WrajwArEwxXrcfFgURj+QRlR1VEJ90KRLcwY3cq6bcA=
X-Received: by 2002:ac8:f99:: with SMTP id b25mr38079380qtk.142.1565796559558;
 Wed, 14 Aug 2019 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190809162956.488941-1-arnd@arndb.de> <20190809163334.489360-1-arnd@arndb.de>
 <20190809163334.489360-2-arnd@arndb.de> <20190813043324.GN12733@vkoul-mobl.Dlink>
In-Reply-To: <20190813043324.GN12733@vkoul-mobl.Dlink>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 14 Aug 2019 17:29:03 +0200
Message-ID: <CAK8P3a0jWunQFvt4bVn0GtqN5xwcnO2a1jO0EaqxWqw4VMGL5Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma: iop-adma: include prefetch.h
To:     Vinod Koul <vkoul@kernel.org>
Cc:     soc@kernel.org, Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 13, 2019 at 6:34 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 09-08-19, 18:33, Arnd Bergmann wrote:
> > Compile-testing this driver fails on m68k without the
> > extra header inclusion.
>
> Please change title to "dmaengine: iop-adma: include prefetch.h"
>
> After that:
>
> Acked-by: Vinod Koul <vkoul@kernel.org>

Ok, thanks!

One day I will remember all the subsystem prefixes. ;-)

       Arnd
