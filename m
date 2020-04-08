Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50E31A2803
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 19:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgDHReX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 13:34:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37356 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgDHReX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 13:34:23 -0400
Received: by mail-pg1-f195.google.com with SMTP id r4so3626898pgg.4;
        Wed, 08 Apr 2020 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=diUjqPLQ86Km63mktmfPd4D5yNo/8RJq9fvckb1eN9g=;
        b=YEjJAQd1On2AgyUJRQy4wTK1HdRI1u96PY+V6k1/GJTY1ObknIJDXqhiQEaAGJV5fO
         7qL8m9IUGcYlsU7B1jqdymiDbDkGtA3qwukNf2NTJ+XepQON3Gv9dM6HN3FsGK+Z5WvK
         PymvA7Z1nKRa6M437qSlWgIibUek3qaLahQBwFSkQ4ZoFmjjSW8Q9jguCUeLv3hxeXMX
         cDPuhFp0edj2hGSjSir09QzKXKuVHsGVVHZa3VwUNJCP9k2nf77alo7G3TRxsFabgllW
         pf0001PKVG5JVU+PdT39bVAjUszF+KgP/VCgIxiRD/+0Jfzrodfl6MR6B7d6e3keOErY
         /Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=diUjqPLQ86Km63mktmfPd4D5yNo/8RJq9fvckb1eN9g=;
        b=rV/WGz3btgvc4zpWB19QRduvP7uDW/GhFmrpl1GTqvkiAljxmdMDQgD0Q/wos7G1Id
         ZMaD2l65zuFq8F0l38JaPW2y967Bz/4L52cwe6ai3DbTKEWDbu4YPMXVtbR6MYVu3tzl
         q5RMyUw7F80XYG7vS7AkGiNgBTMINuzCAgJ8qE7wzoLQh6vfFs96q58lxCehGat90ztQ
         bm4QcECz0zoRUM3e+1972IA/0Gztr7FiUBtrq+x2Auckn+aMwj3n3Jamu7V0BTs6qwqj
         RzDyySWvp6Ozc0eyZF9Lnwo0FQazJ58wyipiQyR0/v/75YPO17q8V29GNFQuHGj5Y8Az
         1eng==
X-Gm-Message-State: AGi0PubM6ZF6MOYJmBgR7yiCo9LJNceahP2SyKPXPHNyYyXq3ytAQmPi
        N3mM10G4Wr9mIaoQvxiJoTA=
X-Google-Smtp-Source: APiQypJhnuArGC86MZpxz+jpjlAwckQgyO/fhkizA5Fxjm4ucHJiO5D3vcHjq6h2DzuG6RWQUGtqWg==
X-Received: by 2002:a63:1a63:: with SMTP id a35mr7653588pgm.197.1586367260599;
        Wed, 08 Apr 2020 10:34:20 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id y30sm17172574pff.67.2020.04.08.10.34.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 10:34:20 -0700 (PDT)
Date:   Thu, 9 Apr 2020 01:34:17 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>, thor.thayer@linux.intel.com,
        krzysztof.adamski@nokia.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>, nsekhar@ti.com,
        bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kgene@kernel.org, krzk@kernel.org, paul@crapouillou.net,
        vz@mleia.com, khilman@baylibre.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        allison@lohutok.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, bigeasy@linutronix.de,
        info@metux.net, hslester96@gmail.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        martin.blumenstingl@googlemail.com,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Fabien Parent <fparent@baylibre.com>, opensource@jilayne.com,
        swinslow@gmail.com, linux-i2c@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 00/28] convert to devm_platform_ioremap_resource
Message-ID: <20200408173417.GA25852@nuc8i5>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
 <CAJMQK-g-Q20fDzy-0DQxoy+dS_USXkZ9DNSqeLmpUJS1OEzbCA@mail.gmail.com>
 <6db77bf6-e1b1-b3fd-8539-7b083b38e7b2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6db77bf6-e1b1-b3fd-8539-7b083b38e7b2@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 08, 2020 at 02:29:46PM +0300, Jarkko Nikula wrote:
> On 4/8/20 6:54 AM, Hsin-Yi Wang wrote:
> > On Wed, Apr 8, 2020 at 12:37 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> > > 
> > > this patch sets use devm_platform_ioremap_resource() to simplify code,
> > > which contains platform_get_resource() and devm_ioremap_resource(). so
> > > use it to replace the platform_get_resource() and
> > > devm_ioremap_resource().
> > > 
> > > Dejin Zheng (28):
> > >    i2c: img-scb: convert to devm_platform_ioremap_resource
> > >    i2c: mv64xxx: convert to devm_platform_ioremap_resource
> > >    i2c: owl: convert to devm_platform_ioremap_resource
> > >    i2c: exynos5: convert to devm_platform_ioremap_resource
> > >    i2c: mt65xx: convert to devm_platform_ioremap_resource
> > 
> > mt65xx seems not in the series.
> > 
> Looks like patches 5, 6, 9 and 19 are missing.
>
Hi Jarkko and Hsin-Yi:

you're right and thanks very much for your reminding. the gmail
server told me that "550 5.4.5 Daily user sending quota exceeded."
in the past 24 hours, so I can not sent any email by this account.

and the gmail server also prevent me send this 4 patches and I
found the patch can be sent by delete some codes. maybe some
keywords in the intact patch triggered the gmail filtering system.

I'm trying to send out these patches. I'm so sorry for that.

BR,
Dejin

> -- 
> Jarkko
