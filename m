Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6FE4CBDE0
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 13:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbiCCMg6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 07:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbiCCMg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 07:36:56 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5543F17925E;
        Thu,  3 Mar 2022 04:36:10 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id e22so3953488qvf.9;
        Thu, 03 Mar 2022 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4KGopGGDh3N9ZnQy5qnHV4FnEM8H/VnZKXOZ5Q7nKQ=;
        b=cNSL1q3mZ6E7CnNPKrfdcARsqZ4Eno+LMLePOVm6FFSgofxP5NSysdysfPK94l8F0a
         J5ZgOKyPc0pWmXy/WMaV2lzIKLniCFaUPcEVkxqjtORk0UlTIc9OnL8QTXuarTdghZbB
         ppmXgod4sNxsmiVWiDvTTt4HWgKB6BGIGTPnTfxqlYi7Mzw10Pl5YUJPKGE9yMfdLREx
         VNEBkQnSXuzoTHH98U4ATdoy3xf+musdGENdGSgRLkjQNgMglCUPkT71COzHUuZSVtMd
         dt15Xg0A7wEx5cFXvrWt/KgewjnboSl5SYUDDVsyLyj8CxuurObIc+xkolRhvCZh2OuE
         mPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4KGopGGDh3N9ZnQy5qnHV4FnEM8H/VnZKXOZ5Q7nKQ=;
        b=QGa9MzGJxWkhUNMLBIUF2lwRNu3WReKEh0TBwa5DhqRO7nONnnTS0ek118QwECZXYX
         ozzdkja4sS7RLWdcpToj2CIcO3BnHT+7ls4BYG6MgH9+dpJsGFjh1R+03YfkHRivxnUT
         WlGf+fwbP00VqsRsP0pX0jhLCO98u2rSDCouWpq7b6sMtV3r05DZOQl/WUVmTSS1bgPK
         xBbW1ENZaq22V+V2nzljJK4KZQdU4uMEGrp7QZ3VjIkKibXSSMy4M6iMkTQ/s8KLVEFm
         f0dA5fchAOCuRRaDNo2JoY4RezpRSAgkaSLN0Z3t8v7uRuB5Kof29B6P1rlnhi2tNMx1
         JpwA==
X-Gm-Message-State: AOAM5338T/yyU/AoVrnXySRhtTKpLJrZ92t+MSRHWrVZ7MU8zdkEyCTK
        VYBKXfgjacfMBOdRPV0hxef/yZHtzTKz0vrcrdA=
X-Google-Smtp-Source: ABdhPJzQ0GX7pIFvv4QUE8a6vGgiHU4ubSw9lwS7j8KqUYZwl4V7qWLJ6nJgfgTZhogDE3QoxuJ/t4T9nQ7Hn/0o1Nw=
X-Received: by 2002:ad4:5be7:0:b0:435:1aad:6a84 with SMTP id
 k7-20020ad45be7000000b004351aad6a84mr5946245qvc.124.1646310969477; Thu, 03
 Mar 2022 04:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
In-Reply-To: <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 3 Mar 2022 14:35:58 +0200
Message-ID: <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Add NPCM8XX I2C support.
> > > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > > The internal HW FIFO is larger in NPCM8XX.
> > >
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> >
> > Wrong SoB chain.
> >
> > ...
> >
> > > +static const struct npcm_i2c_data npxm7xx_i2c_data = {
> > > +     .fifo_size = 16,
> > > +     .segctl_init_val = 0x0333F000,
> > > +     .txf_sts_tx_bytes = GENMASK(4, 0),
> > > +     .rxf_sts_rx_bytes = GENMASK(4, 0),
> > > +     .rxf_ctl_last_pec = BIT(5)
> >
> > + Comma.
> >
> > > +};
> > > +
> > > +static const struct npcm_i2c_data npxm8xx_i2c_data = {
> > > +     .fifo_size = 32,
> > > +     .segctl_init_val = 0x9333F000,
> > > +     .txf_sts_tx_bytes = GENMASK(5, 0),
> > > +     .rxf_sts_rx_bytes = GENMASK(5, 0),
> > > +     .rxf_ctl_last_pec = BIT(7)
> >
> > Ditto.
> >
> > > +};
> >
> > ...
> >
> > > -     left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> > > -                              ioread8(bus->reg + NPCM_I2CTXF_STS));
> > > +     left_in_fifo = (bus->data->txf_sts_tx_bytes &
> > > +                     ioread8(bus->reg + NPCM_I2CTXF_STS));
> >
> > Besides too many parentheses, this is an interesting change. So, in different
> > versions of IP the field is on different bits? Perhaps it means that you need
> > something like internal ops structure for all these, where you will have been
> > using the statically defined masks?
> >

Those are two very similar modules. The first generation had a 16 bytes HW FIFO
and the second generation has 32 bytes.
In V1 of this patchset the masks were defined under
CONFIG but we were asked to change the approach:

the entire discussion can be found here:

https://www.spinics.net/lists/linux-i2c/msg55566.html

Did we understand the request change right?


> > ...
> >
> > > +     match = of_match_device(npcm_i2c_bus_of_table, dev);
> > > +     if (!match) {
> > > +             dev_err(dev, "OF data missing\n");
> > > +             return -EINVAL;
> > > +     }
> > > +     bus->data = match->data;
> >
> > This is NIH of_device_get_match_data().
> >
> > ...
> >
> > > -static const struct of_device_id npcm_i2c_bus_of_table[] = {
> > > -     { .compatible = "nuvoton,npcm750-i2c", },
> > > -     {}
> > > -};
> > > -MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
> > > -
> >
> > Redundant change, leave this as is.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

Thanks for the detailed review, Andy!

BR,
Tali Perry
Nuvoton Technologies
