Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6041DF24E
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 00:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731285AbgEVWre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 18:47:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731223AbgEVWre (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 18:47:34 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73FE720812;
        Fri, 22 May 2020 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590187653;
        bh=5hfFawpXKpCIutTjpG9U4GCILvuIjBPoHRWtulw0l8c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JuwbAV7rthezSwZ6bubdRj8+FUWIO64x4TTlohWp7xFl/QLYqMtzV6y+BqfagCib8
         4pbFX2FRyQsWb8qmmtUEgdsAmiWs7cOJkvOrt02J+a9viVUk/kQ7QAvXJKWO74muv8
         N3ENYsEw/WqnBRjs1DK91rQaiAN+qPgPxbia76FM=
Received: by mail-oo1-f52.google.com with SMTP id z6so2502429ooz.3;
        Fri, 22 May 2020 15:47:33 -0700 (PDT)
X-Gm-Message-State: AOAM531Uzz0kh6dKIB0zm49roaGuhXvX3dc8+8sfjkPVSkaVyBGWhz/T
        Tz32+3bE9UKXYNTd3pl+P/zmEAIYYhR8qMJONA==
X-Google-Smtp-Source: ABdhPJxaHHJNI0SXO4KjlnRK9YfXoFEB9IMHVZp7IAtsCVAsNspsWHvXuCKHPqC0HjG6YargWTUGM/jccxuGbhpguqs=
X-Received: by 2002:a4a:3790:: with SMTP id r138mr4741311oor.81.1590187652677;
 Fri, 22 May 2020 15:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-2-tali.perry1@gmail.com> <20200522224217.GA847856@bogus>
In-Reply-To: <20200522224217.GA847856@bogus>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 22 May 2020 16:47:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
Message-ID: <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kfting@nuvoton.com,
        Benjamin Fair <benjaminfair@google.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Nancy Yuen <yuenn@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Brendan Higgins <brendanhiggins@google.com>,
        Patrick Venture <venture@google.com>,
        Ofer Yehielli <ofery@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 22, 2020 at 4:42 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 22 May 2020 14:33:10 +0300, Tali Perry wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM I2C controller.
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1300: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1296162
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Please check and re-submit.

Why do you keep sending new versions with the same problem? It won't
get reviewed until this is fixed. This isn't a free automated service
to throw things at to see if they work. I have to review the failures.

Rob
