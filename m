Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A460D72DABA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 09:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbjFMHZb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 13 Jun 2023 03:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjFMHZa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 03:25:30 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85339AA;
        Tue, 13 Jun 2023 00:25:29 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56d2ac0d990so27505437b3.0;
        Tue, 13 Jun 2023 00:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641128; x=1689233128;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbgcH3UhtSvko8Hm69Jv27j6Hqzm3qXJXgS6ndTlmig=;
        b=AMIEJ1nrbkCMaWLDyo6ESytir8qptDQCbLkhRU1HUGySwakk7DBG5UZPC/K9z7z13Y
         bLnbpnUIw5NeosT4/diNcQVt94Qp3RNwa/bVze03+wkH8zyd/v2VDQlkijDr541ZaZcv
         1cz4+kiwSS20jV87opHk7W06WDLiQY1tUAabrL+HJkO0E6K7WNVKK1rAnauZYDMqtHhZ
         /TOTOsmdNkk+9H9Es+Ru4AMWWpLrYzfmTo0DDpFuEBZfZdPYVCqJsM6uuCnhzxNiY9TY
         b81a/br+1SNgpUvGtj3IjeIj0NGM6zi3jx+TD1hrp4x9qVF7wK9Z/odJpWKSCFd2W1pu
         ukZw==
X-Gm-Message-State: AC+VfDyMeh7o+welHODw0nyn6BieoYvgLl6AX66NUobQMye2zxZGG/CQ
        +OnPfF56oBiaz8+LAGSMgWQoCRXVn6Gnrg==
X-Google-Smtp-Source: ACHHUZ6aoOjXw+VRuQjfDcHt9dFH5S0IIsP2izObMrsf7NP4RvQ8UhPv4zqNjpiVeFEdGCwubOC2KA==
X-Received: by 2002:a0d:db05:0:b0:56d:2ac0:d834 with SMTP id d5-20020a0ddb05000000b0056d2ac0d834mr866213ywe.1.1686641128768;
        Tue, 13 Jun 2023 00:25:28 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id l191-20020a0de2c8000000b0056d110766ebsm1489210ywe.80.2023.06.13.00.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:25:28 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-561b7729a12so91264447b3.1;
        Tue, 13 Jun 2023 00:25:28 -0700 (PDT)
X-Received: by 2002:a25:90e:0:b0:ba9:b304:107b with SMTP id
 14-20020a25090e000000b00ba9b304107bmr886752ybj.27.1686641128031; Tue, 13 Jun
 2023 00:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato> <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato> <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
In-Reply-To: <ZIeDcVcfxfcMx/BP@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jun 2023 09:25:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
Message-ID: <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 12, 2023 at 10:43 PM Wolfram Sang <wsa@kernel.org> wrote:
> > Perhaps we should first think through what an ancillary device really
> > is.  My understanding is that it is used to talk to secondary addresses
> > of a multi-address I2C slave device.
>
> As I mentioned somewhere before, this is not the case. Ancillary devices
> are when one *driver* handles more than one address. Everything else has
> been handled differently in the past (for  all the uses I am aware of).
>
> Yet, I have another idea which is so simple that I wonder if it maybe
> has already been discussed so far?
>
> * have two regs in the bindings
> * use the second reg with i2c_new_client_device to instantiate the
>   RTC sibling. 'struct i2c_board_info', which is one parameter, should
>   have enough options to pass data, e.g it has a software_node.
>
> Should work or did I miss something here?

That should work, mostly (i2c_new_dummy_device() also calls
i2c_new_client_device()).  And as i2c_board_info has an of_node
member (something I had missed before!), the new I2C device
can access the clocks in the DT node using the standard way.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
