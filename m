Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DA01DFDA8
	for <lists+linux-i2c@lfdr.de>; Sun, 24 May 2020 10:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgEXIeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 May 2020 04:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgEXIeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 May 2020 04:34:02 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6FDC061A0E;
        Sun, 24 May 2020 01:34:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w10so17621083ljo.0;
        Sun, 24 May 2020 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ym2/jmTuyZ+LCBHY8uUjF46ZmpdYuv1HzG4ugP1Ee4c=;
        b=a2OK68h4qAK4dqg2rQRo8Rc37ilbBu7fedOc1eeY8wPG5npT+PP5fRrec8wXKowX96
         AYouvBDwSKKubCp3bgbXwrqmZeMdpQgvlBCEjsMvsO33DNIzkdlFQLL3N7DSF1NBSc4G
         XcLqHaiig+Cc00/JXzXObmM6xAPryWfXk9R1I/l3Wf1ic2V8QLdRAPjhVzB16InUNBgQ
         Dmumf6k5hUiUhkqRlUEYCt8vOa1E6A7O+Yn6GBL/s1gTCj0GI1GAlh/kAnoKxWTnoxgO
         eHCvEP52/Y8oahSavx4GfwLfLI/orzXNuYHUv22DwIH10YMzeTdOWssMWHJBtIChR+jc
         iRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ym2/jmTuyZ+LCBHY8uUjF46ZmpdYuv1HzG4ugP1Ee4c=;
        b=Sm2Aw+dora/67pmKlF8opISLoASVysQlsGSOofXkkESb1Uiw8DMiHTDWoe3kplU1yY
         WE3eKEfwhTQx4hvmnOW6SgcGSACE4U6gXyL+rNLFy4HoXpinnEJhg8DCB0s3vXHKNAwR
         JOPXRYajl1eEnAfwjDZNhz48mVmEdKMKCDCQ4b9cjd62htWltvvHk5JdoKOKNWvjjdUE
         83euzN9PfsLDD44eKsNpnftZ7U8q8KwuZkRh33K3oYQHv0smtvhvSZBAXP+q2Rk5YTvq
         BlA5pPboU/ABv+jKUuwyaxAT2L21doMv4hyB/9yfRTXjRYrXKSpZskXtca9AwcIhiEEL
         3NXw==
X-Gm-Message-State: AOAM530RDyodp9VK8F8+2VQcGWasqBiq6wdAHAgqiAjPa0IywxHm4jO6
        j9VYDDigHQ+63LJQWLvZlpoWPV/v9203KAZkWoI=
X-Google-Smtp-Source: ABdhPJyBeDmLEIA6+69iUoeLVOe0EjmnE3EcoRmeGkobz8HZ7gPzhnIXQ9hDlQd64+9msfF5i7BtMZDVtdHZlpC2mTA=
X-Received: by 2002:a2e:898d:: with SMTP id c13mr9696182lji.108.1590309239942;
 Sun, 24 May 2020 01:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-2-tali.perry1@gmail.com> <20200522224217.GA847856@bogus>
 <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
In-Reply-To: <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Sun, 24 May 2020 11:35:20 +0300
Message-ID: <CAHb3i=ummYNiqqS4QNi1n1XAzg6bbGXyNPgmFeU_a0T+JP7xqQ@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>, kfting@nuvoton.com,
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

Hi Rob,

On Sat, May 23, 2020 at 1:47 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 4:42 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, 22 May 2020 14:33:10 +0300, Tali Perry wrote:
> > > Added device tree binding documentation for Nuvoton BMC
> > > NPCM I2C controller.
> > >
> > > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > > ---
> > >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
> > >  1 file changed, 60 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
> > FATAL ERROR: Unable to parse input tree
> > scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
> > make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > Makefile:1300: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1296162
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> >
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > Please check and re-submit.
>
> Why do you keep sending new versions with the same problem? It won't
> get reviewed until this is fixed. This isn't a free automated service
> to throw things at to see if they work. I have to review the failures.
>
> Rob

Definitely not trying to use the Bot to check my yaml. On the first
version the dt-check was not updated on my side.
On the previous version I updated according to the bot explanations.
Found an error and fixed it. Now I don't see any errors. with latest
dt-check.
I did:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master
--upgrade
make dt_binding_check

And got a clean log, no warnings or errors. Was I suppose to check
anything else?

Thanks,
Tali
