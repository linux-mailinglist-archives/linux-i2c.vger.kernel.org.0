Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994F572C580
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 15:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjFLNHq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 12 Jun 2023 09:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjFLNHp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 09:07:45 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CEBA0;
        Mon, 12 Jun 2023 06:07:44 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f9cf20da1dso40450741cf.3;
        Mon, 12 Jun 2023 06:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686575263; x=1689167263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOSPC68jRmmKm/N4lilGrY5D58VwuhvYh8IBlby8n7U=;
        b=bx5uQNrvOGQ9zGPv54Rq+C9z9AApMjvYPPuIzdrbu2npNXrWd/hYB0KmkTqexEzirt
         sFrE1omp083DtjBW2Jd8ohGEMiAQvs7KcOEZBfk4onaOU6MahGTXevH6bAV5rhI/ORWZ
         73MiE4vmIDOf9g0bHLHTiLJy+uTUQDBUXf/r+WLOV7ff0bi3gaYkQzdCb561mNkXWOa5
         cApX8oNCAiemmql1E+5Q7Zryz3cacXRIszCAYsE3ADqKLcRxytxv9dSb/L9EcEorQouq
         +0jOgwIbGgCNSpmu4wX8AsvhMJh3MTq7QyJfZffgx9Srkpv7UK9sbrjKFSKtYjHMNOZt
         oz7A==
X-Gm-Message-State: AC+VfDwb4b863ooux2mR/emXip5SaXv7DhFARx7js3SzI8BUC+0taIfl
        CMvcpzplN8p7sdVzwPLepaxp8sK286+qQg==
X-Google-Smtp-Source: ACHHUZ75vLbBH4+KV+zPfV/EodLflsttpEOFZh151HYYHjvN0G8G0FcoirzScX0zNC4p+cLFxkHFlg==
X-Received: by 2002:a05:622a:1cf:b0:3f9:ae23:5763 with SMTP id t15-20020a05622a01cf00b003f9ae235763mr11553051qtw.61.1686575263455;
        Mon, 12 Jun 2023 06:07:43 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id w4-20020ac843c4000000b003f9af049c55sm3362216qtn.18.2023.06.12.06.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 06:07:43 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-62de8bce252so11959946d6.0;
        Mon, 12 Jun 2023 06:07:43 -0700 (PDT)
X-Received: by 2002:a25:7642:0:b0:bc5:da39:e84 with SMTP id
 r63-20020a257642000000b00bc5da390e84mr6203110ybc.13.1686574813357; Mon, 12
 Jun 2023 06:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <ZIBFc3y9jD59lZ3A@shikoro> <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato> <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
In-Reply-To: <ZIcUEdctlgRsGxJ3@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jun 2023 15:00:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
Message-ID: <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 12, 2023 at 2:48 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > Would this binding allow to not use the RTC if the second reg is
> > > missing? What are the advantages of not enabling RTC? Saving power?
> >
> > It doesn't work if there is no clock?
>
> Maybe I am confusing something now, but if the RTC _needs_ to be
> enabled, then why we don't do it unconditionally?

1. DT describes the hardware, which listens to two addresses, so the
   device node should have two entries in the reg property.
2. The RTC is enabled by instantiating an i2c ancillary device, and lets the
   isl1208 driver bind against it.

> > > Thinking more about this: DT is hardware description, so the RTC should
> > > always be described in DT. If the RTC is actually activated is more a
> > > configuration thing, or? Brainstorming: maybe the PMIC driver could try
> > > to find the node with reg == 0x6f and see if firmware has enabled it or
> > > not?
> >
> > I guess the RTC part would acknowledge anyway?
> > It is always present, it is just part of the RAA215300.
>
> I mean the driver should scan for the DT node. Not on the bus. But a
> phandle is probably safer.
>
> > Sure, you can put that in DT.  But it's a pity you have to do that,
> > as the device (the PMIC part) does know the revision...
> > That's why I suggested to let the PMIC part instantiate an i2c ancillary
> > device...
>
> I see. I'll let it sink in some more.

Perhaps we should first think through what an ancillary device really
is.  My understanding is that it is used to talk to secondary addresses
of a multi-address I2C slave device.

What's different here compared to e.g. adv748x?
  - RAA215300 has a PMIC and an RTC, and there exists a separate
    RTC driver for a similar part (which is thus Linux-specific,
    not DT-specific!),
  - I don't know much about adv748x, but I understand there is a
    single driver talking to all subcomponents.
    What if in the future we e.g. would want to spin off part of it
    in a subdriver, as a subcomponent appeared in an unrelated device?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
