Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56449718215
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 15:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbjEaNiN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 31 May 2023 09:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbjEaNiK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 09:38:10 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB854101;
        Wed, 31 May 2023 06:38:09 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-19f56608dc2so1878808fac.3;
        Wed, 31 May 2023 06:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685540289; x=1688132289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVaRbAXqjrI+Y8VEfYiLARtKsf04kthNVoHQskLsENA=;
        b=Mt4nsdPDzRHqS9Ohcw8/WfJKgKrGLK43Vu7vfOqgfUXQKGYKTccG1RHcVKS77GTXGn
         F2dxu4GHcJCmQKVyd28WrnxzOJyHFvxozXiYMCOPtIVMMMSPFhwXpyifelZqOWG3y2gz
         QZXqdaugPi/NHdv9EJLTLi0kE6s1YQ5EQtix8I2FgVmr2m+yAFf8KU5yWIBcLZaP0LYI
         gLW2GDbpVkrGwwGDS2c0JvpfG9NRNZNWwsb+IZAr3RbQS8mQGUmGwljIQzwBMZV2e5CI
         nrkncQC714g66lPTCgRXrtoLWTPxvpuRVjZr6U0JqdLHgEh70z0oAqUSwyhleigUEa5G
         hatw==
X-Gm-Message-State: AC+VfDwe0xtOdV6irAv7r6NdfqxHraH0EVL/0wbUdaYNAP4tP2jLMYLC
        nMyLGUBX0YvRbCpzmO8oHfLNZzkAvV53dg==
X-Google-Smtp-Source: ACHHUZ7WG9l5bXnNCyNkSN4ryMoJtdBFJbfp2O3Sa85sGeLfua/o5vwOzjTvS/MD9/M0yP5yvjSMAw==
X-Received: by 2002:a05:6871:2306:b0:19e:d5dd:53f5 with SMTP id sf6-20020a056871230600b0019ed5dd53f5mr4423239oab.45.1685540288897;
        Wed, 31 May 2023 06:38:08 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id u2-20020a05687036c200b001931cb17a86sm540103oak.27.2023.05.31.06.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 06:38:07 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6af8127031cso2536928a34.2;
        Wed, 31 May 2023 06:38:06 -0700 (PDT)
X-Received: by 2002:a05:6358:e489:b0:123:44bd:bce7 with SMTP id
 by9-20020a056358e48900b0012344bdbce7mr514077rwb.31.1685540286373; Wed, 31 May
 2023 06:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com> <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com> <OS0PR01MB59226E87241A61A2CB255DEE86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531114103.GD27043@pendragon.ideasonboard.com> <OS0PR01MB592217BBDCD7C0072F24493D86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592217BBDCD7C0072F24493D86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 May 2023 15:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV56T2P4fGhs-_Sf-N-ow8rf26TAvk77diHc3wQMH7_Zg@mail.gmail.com>
Message-ID: <CAMuHMdV56T2P4fGhs-_Sf-N-ow8rf26TAvk77diHc3wQMH7_Zg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Wed, May 31, 2023 at 2:53 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > * This function creates and returns an I2C ancillary client whose I2C
> > > address
> > > * is retrieved from the platform firmware based on the given slave
> > > name. If
> > > * aux_device_name is not NULL, the ancillary's device parent
> > > * will be set to the primary device otherwise it will be set to I2C
> > adapter.
> >
> > The wording is better, but this is not what you have implemented in the
> > code. The name doesn't select which parent is used.
>
> It is the same implemented in the code.
>
> For the existing users, aux_device_name is NULL --> The parent is set as "I2C adapter".
>
> For instantiating a "i2c client device", aux_device_name is not NULL --> The parent is set as primary device.
>
> The primary device is the one instantiated the "i2c client device" using
> i2c_new_ancillary_device().
>
> Please correct me if anything wrong here.
>
> >
> > > * If no address is specified by the firmware default_addr is used.
> > >
> > > > > > > the ancillary's device parent
> > > > > > > + * will be set to the primary device.
> > > > > >
> > > > > > This doesn't seem to match the implementation. With this patch
> > > > > > the ancillary device's parent is always the primary device. Are
> > > > > > you sure this won't cause any regression ?
> > > > >
> > > > > There is no regression as existing users only instantiate dummy
> > > > device.
> > > >
> > > > Sorry, I don't follow you here. Existing callers of
> > > > i2c_new_ancillary_device() today get an i2c_client device whose
> > > > parent is the I2C adapter. With this patch they will get an
> > > > i2c_client device whose parent is the main i2c_client. That's a
> > > > change in behaviour, which could cause all sorts of issues.
> > >
> > > Please see the patch snippet below, there is no regression.
> > >
> > > client->dev.parent = parent ? parent : &client->adapter->dev;
> >
> > When called from i2c_new_ancillary_device(), __i2c_new_dummy_device() as
> > a non-NULL parent argument. There is no change of behaviour *for
> > i2c_new_dummy_device()*, but thre is a change of behaviour *for
> > i2c_new_ancillary_device()*.
>
>
> I don't think I understand what you mean.
>
> For existing users, i2c_new_ancillary_device(..., aux_device_name=NULL) the behaviour is not changed.
>
> Could you please elaborate further?

Laurent is right, there is a small issue:

    struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
                                               const char *name,
                                               u16 default_addr,
                                               const char *aux_device_name)
    {
            ...
           return __i2c_new_dummy_device(client->adapter, addr, aux_device_name,
                                         &client->dev);
    }

To preserve backwards compatibility, the last parameter should be

     aux_device_name ? &client->dev : NULL

Sorry for missing that before.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
