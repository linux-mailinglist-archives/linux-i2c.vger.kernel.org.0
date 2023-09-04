Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5FA791067
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 05:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351065AbjIDD1t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 23:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350986AbjIDD1s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 23:27:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF88110;
        Sun,  3 Sep 2023 20:27:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50078e52537so1626559e87.1;
        Sun, 03 Sep 2023 20:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693798059; x=1694402859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OiLgCSQBEnRaQPC2k/p+Y2L6jBO8LUB5T0bZ5tLFi9s=;
        b=kbfmh4aQjpfiIo21MSpgCiHiycF+KZUyiOsNIvqyx6KvZBbU0dUAAE62fPf9/nJRpG
         IZP0e2wNOIzxCAFGRK/2kXClLNg57fQ72m0bRZ7BVa4a+5Dkm7BFlpt8ddz5YYH3hvXh
         z37C3SJIVVO5Ojm3JJEwJSu7AXzNzzXmdNF4nHKOCsnnKFTrFEqWi86Dyy+tFkh9nsuo
         RgT1sJGuGyFxh5I1pQpQuHPC6MU4k3br/fK1cXZ+LWmjY39jEh7TKWJEAIhrZs79b/hd
         R5olzvyEa/aXfcFNl6LPcMX0n6o5kpBxhGwyytxAFl5iq2Kyh+2jw0z9X7Q87Hm49dDK
         56kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693798059; x=1694402859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiLgCSQBEnRaQPC2k/p+Y2L6jBO8LUB5T0bZ5tLFi9s=;
        b=Nw+I6h/INSc9pgIgss1oCW9hLOPG+EpQfU4KhBPmnowsqtuQx8IjPIU7U9AXUhacFU
         6pzSq7hq97fe7OSYUpETMROw2XYPxeVHEfERR43qSnn8c5197Ks9HOLjnTOywltT1zRV
         j8NOIgsPEtPkOIyrHWfCbbUBaRTgVrCnXEiOwAeNSzSyTNX6j/BzZTmNvrGNE8YLpZsu
         aFa3oYWEGCugZ33BMlV5a1zKly8C7adOx3qbUdSeuw8oUGVg3VIdQ6n92vtgoHhFpy/k
         bauFm4nErWZgy8bR+8EFgrpX0wm6Fa47jBKPtOkFeDa+6/f27XY5f/0dj75umFwoB/jY
         Mqpg==
X-Gm-Message-State: AOJu0Yy62K8eyxxSpAjnsKUn229dcNJLVxV6BQ6wBxaE6eMubGZAcsLf
        ZFOkl60VzbSlz1tL20XylXcJRg+uIJG4P/oEX2PpQqKk2h0=
X-Google-Smtp-Source: AGHT+IF88sgWR0wYZU0stUn0NwSueEyT4U2LOfVriwMD2KGhqxs7W6wKckeOWV7hbYTQ5A1HmDgB5X014PBQEWpcETk=
X-Received: by 2002:a05:6512:214d:b0:4fb:740a:81ae with SMTP id
 s13-20020a056512214d00b004fb740a81aemr5173476lfr.16.1693798058819; Sun, 03
 Sep 2023 20:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-5-Huangzheng.Lai@unisoc.com> <CAAfSe-vGXco2PaLEdb8cTAEkX4db3o6v++hz-vL3o00i=7_wgw@mail.gmail.com>
 <20230902210827.7vey3qehpb6gn4m5@zenone.zhora.eu>
In-Reply-To: <20230902210827.7vey3qehpb6gn4m5@zenone.zhora.eu>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Mon, 4 Sep 2023 11:27:01 +0800
Message-ID: <CAAfSe-sEhqggJPhmOmUfLHJ3OCik5fB-qP1+sn66KNLWxOPV_Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] i2c: sprd: Add IIC controller driver to support
 dynamic switching of 400K/1M/3.4M frequency
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

On Sun, 3 Sept 2023 at 05:08, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Chunyan,
>
> [...]
>
> > > When IIC-slaves supporting different frequencies use the same IIC
> >
> > %s/I2C/IIC

I just noticed that this was the reverse, I meant "%s/IIC/I2C" :)
That's saying we should use I2C in the whole driver.

> [...]
>
> > >  #define SPRD_I2C_PM_TIMEOUT    1000
> > >  /* timeout (ms) for transfer message */
> > >  #define I2C_XFER_TIMEOUT       1000
> > > -
> > > +/* dynamic modify clk_freq flag  */
> > > +#define        I2C_3M4_FLAG            0x0100
> >
> > #define <space> I2C_3M4_FLAG <tab> 0x0100
> >
> > > +#define        I2C_1M_FLAG             0x0080
> > > +#define        I2C_400K_FLAG           0x0040
> > > +
> > > +#define        I2C_FREQ_400K           400000
> > > +#define        I2C_FREQ_1M             1000000
> > > +#define        I2C_FREQ_3_4M           3400000
> >
> > ditto

I meant "#define <space> I2C_FREQ_3_4M <tab> 3400000"

>
> why should he use IIC instead of I2C. The file's defines start
> with I2C, for consistency he should use the same prefix.
>

Yes, I agree.

Thanks,
Chunyan
