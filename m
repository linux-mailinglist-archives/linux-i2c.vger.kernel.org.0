Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4792C4C2C52
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 13:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbiBXM7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 07:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiBXM7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 07:59:10 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FFD28DDD5;
        Thu, 24 Feb 2022 04:58:41 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id i27so1990138vsr.10;
        Thu, 24 Feb 2022 04:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjFekihS/Muhh+U1v0fi300Fdzno0lDIR6KuI4I6xow=;
        b=eZ6SzqgASD2JY6A7uRzRSXyID72TOVOMSO7skqDIPRt4b0XJEx3dOkIdi5JR5Oscbf
         SNj/sEm90/z3J9X0Gxje8tFIzEReLhUIWEA2geni/adkn5wcHzeum5GOlUw8b15JzCMC
         izVMRxwxdRNMQLYWijdZM+GVzZJgomNjMVCVR4r2khdExezP5uxCY+AkzHGxfUuucwf4
         t5mBLa8X+lP+0XY2DLd2JBu2n5rqOWVeU+mtttDO8bsRP3NmEKoXbwUc/UHjPU5b90CR
         TuNZUV9acGSguYS9/BxMkP0RZhNK0Gq4VXdxf7Dv0FIiQ+Qs45fkdON90UAQ42HxyLmG
         DcIw==
X-Gm-Message-State: AOAM532Xv9m4Ii4z15QMyyCPer8R1CN4KG44pSU0OZ31gqjp7ZsuhNN8
        1utTvJXyv00f/OgM/jpzhNIt/R5eTZe+0w==
X-Google-Smtp-Source: ABdhPJzNEIdKk54OxTdfBC2MP6b96VC+1cOmSzu98fXJglfkoWOmWQNRvG7inrPblfaR8nRlHZhJpQ==
X-Received: by 2002:a67:d317:0:b0:31b:9b12:dd6b with SMTP id a23-20020a67d317000000b0031b9b12dd6bmr919406vsj.27.1645707520215;
        Thu, 24 Feb 2022 04:58:40 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id v128sm376914vkv.2.2022.02.24.04.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 04:58:39 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id w128so1123377vkd.3;
        Thu, 24 Feb 2022 04:58:39 -0800 (PST)
X-Received: by 2002:a05:6122:114e:b0:32d:4662:65a8 with SMTP id
 p14-20020a056122114e00b0032d466265a8mr951435vko.0.1645707519516; Thu, 24 Feb
 2022 04:58:39 -0800 (PST)
MIME-Version: 1.0
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
 <97b69b3a-bf17-6a43-bf96-da19822051b3@microchip.com>
In-Reply-To: <97b69b3a-bf17-6a43-bf96-da19822051b3@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 13:58:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGQDqMagqzD8VNYm2oucE=_nas9mM2sT_RoW2GKhr4vw@mail.gmail.com>
Message-ID: <CAMuHMdXGQDqMagqzD8VNYm2oucE=_nas9mM2sT_RoW2GKhr4vw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
To:     Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Daire.McNamara@microchip.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Thu, Feb 24, 2022 at 1:55 PM <Conor.Dooley@microchip.com> wrote:
> On 24/02/2022 12:31, Geert Uytterhoeven wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > make dt_binding_check:
> >
> >      Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
>
> Hey Geert,
> I've run dt_binding_check locally but I dont get a warning, is there
> something I am missing?

Interesting. Are you using the latest dtschema?
https://github.com/devicetree-org/dt-schema.git

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
