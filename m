Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9558272C4EF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 14:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbjFLMux convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 12 Jun 2023 08:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbjFLMuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 08:50:51 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43835E51;
        Mon, 12 Jun 2023 05:50:47 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3f9cf20da51so34004511cf.2;
        Mon, 12 Jun 2023 05:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574246; x=1689166246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/8p0Dr0nAJ3rltZnl/XZZhJet57aER46/0/40+UUJQ=;
        b=dIQQWtdUNTFmqB99J9QKP0+jCLbMiu6v5oGlxn+APgpclzdF668UjKP+f94/mTyxnc
         312SFbynpLqQWAHtsu4i45gIdrQDNkbSFe98vIJr2lmxp0HlS8mvKxdd4Tx7vq0oh1mH
         I6CVZG5QlnHQJXE/ZmUNXarW4zwuubcCd5qQtaQLIEK5Bo//lxOX5zmLzyHVE6Mfow5d
         Vk+WH/z+bxqff0QRjgSXwWRaAwgV562MIP5zwxsa4YrqEFVKb0nx8IJ2vXHoXYv9evA3
         Q6/dPVqanPAmOYGVy3IU45RAhMSXoUZ1no4/awQk5CSmFeZOe3FwleKbiQSdBIJIaYFR
         1PwQ==
X-Gm-Message-State: AC+VfDyfAvQYA3IR0iquD9sI5d2nY6ZDdDyymlWcffN30/A9ttiZRcyh
        hUU0Cswd330/yipvW8Xwx50dvJqUJ9vnGw==
X-Google-Smtp-Source: ACHHUZ5Mu6OHJu5qwwesiIY71tVXQt8aUZZCA4IETnoqsTuAhw3sA2B1msCAMFAKNMH5GchbGtqfJA==
X-Received: by 2002:ac8:7f0c:0:b0:3f9:a73b:57c9 with SMTP id f12-20020ac87f0c000000b003f9a73b57c9mr11758704qtk.47.1686574246059;
        Mon, 12 Jun 2023 05:50:46 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id fc23-20020a05622a489700b003ee08d3e073sm3389515qtb.42.2023.06.12.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:50:45 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-75ebb3d57d0so362852785a.3;
        Mon, 12 Jun 2023 05:50:45 -0700 (PDT)
X-Received: by 2002:a25:becc:0:b0:bac:85af:89b1 with SMTP id
 k12-20020a25becc000000b00bac85af89b1mr8375955ybm.36.1686573751530; Mon, 12
 Jun 2023 05:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro> <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
In-Reply-To: <ZIcRKl3PDy0+yZS9@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jun 2023 14:42:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
Message-ID: <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

Hi Wolfram, Laurent,

On Mon, Jun 12, 2023 at 2:36 PM Wolfram Sang <wsa@kernel.org> wrote:
> > DT-Maintainers suggestion:
> > [1]
> > raa215300: pmic@12 {
> >       compatible = "renesas,raa215300";

If you go for separate nodes: "renesas,raa215300-pmic".

> >       reg = <0x12>, <0x6f>;
> >       reg-names = "main", "rtc";
> >
> >       clocks = <&x2>;
> >       clock-names = "xin";
> >       /* Add Optional shared IRQ resource and share it to child and handle it both in parent and child */
> > };
>
> Would this binding allow to not use the RTC if the second reg is
> missing? What are the advantages of not enabling RTC? Saving power?

It doesn't work if there is no clock?

> > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > [2]
> >       raa215300: pmic @12 {
> >               compatible = "renesas,raa215300";
> >               reg = <0x12>;
> >
> >               /* Add Optional shared IRQ */
> >               renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
>
> Thinking more about this: DT is hardware description, so the RTC should
> always be described in DT. If the RTC is actually activated is more a
> configuration thing, or? Brainstorming: maybe the PMIC driver could try
> to find the node with reg == 0x6f and see if firmware has enabled it or
> not?

I guess the RTC part would acknowledge anyway?
It is always present, it is just part of the RAA215300.

> >       };
> >
> >       rtc_raa215300: rtc@6f {
> >               compatible = "renesas,raa215300-isl1208";

If you go for separate nodes:  "renesas,raa215300-rtc".

> >               reg = <0x6f>;
> >
> >               /* Add Optional shared IRQ */
> >               clocks = <&x2>;
> >               clock-names = "xin";
> >               renesas,raa215300-pmic = <&pmic>; /* Parse the handle to get PMIC version to check Oscillator bit is inverted or not */
> >       };
>
> I have been scratching my head around this and wondered about one thing.
> The RTC driver needs to know if the oscillator bit is inverted. AFAIU
> this depends on the version of the PMIC (which includes the RTC). So,
> can't we simply encode the version in the compatible string?
>
> >               compatible = "renesas,raa215300-isl1208-01";
> >               compatible = "renesas,raa215300-isl1208-a0";
>
> I dunno the exact versions, but you probably get the idea.

Sure, you can put that in DT.  But it's a pity you have to do that,
as the device (the PMIC part) does know the revision...
That's why I suggested to let the PMIC part instantiate an i2c ancillary
device...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
