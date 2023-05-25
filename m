Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D24711175
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 18:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbjEYQ4g convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 25 May 2023 12:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjEYQ4V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 12:56:21 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A743135;
        Thu, 25 May 2023 09:56:15 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-557c9d7011aso157678eaf.1;
        Thu, 25 May 2023 09:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685033774; x=1687625774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKef1dTnXLWEPcPkzPdiI1P0Q5fDcYjlFcAukfwXA8Q=;
        b=NDXYLxHYnLebrUD2b4bbuSoy2H1BhPw+5e8Tity+BD/qPkRV4G9OZfV3EG+rU/un6y
         yQiwbzn+c/ccGqX1EIU9T5m3z0uv0rr0mm/dvLbu2P39JYJCG4qHFi3bJ6yvr7/fbk1X
         D7K/oM8+eIsJ1w4E9JTTkrFzdWvoC+zu5jE617f+lkeXPhtijNbg/fqkRsxqqEdgetqq
         FURi9WF6qjpMDCr41SQJucxG5c2LhAWEimZFI1Za+vAcWb2gkjuvRuoo6QlO8j31WThY
         R9vIqRk50lkhrCgOmDn1Nqo/ykWgcFhKGQM+qpyGJzNvHUdfmr50DBd8J83dpo4gl6bF
         oY6w==
X-Gm-Message-State: AC+VfDyBkhjU+NIxbZ+H27+VyDTg3kEA8mkoVr3b1+ssgXfHalPCD+PD
        e8K5kmpGCYRz4ugnHaLgCXj3adQomHQGeA==
X-Google-Smtp-Source: ACHHUZ7XWYq00+YKH/Bs7smB5LaLZQCXD42dq9K5bNvgdHrFNxe1ZSQOia14A1W7PVgAbp+59esV4w==
X-Received: by 2002:a4a:6f50:0:b0:54f:84ea:84e4 with SMTP id i16-20020a4a6f50000000b0054f84ea84e4mr1779684oof.3.1685033774211;
        Thu, 25 May 2023 09:56:14 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id e187-20020a4a55c4000000b00555718c0c5dsm641469oob.37.2023.05.25.09.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 09:56:14 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6af549a7fb4so819830a34.1;
        Thu, 25 May 2023 09:56:13 -0700 (PDT)
X-Received: by 2002:a25:5cd:0:b0:ba8:b425:6bf2 with SMTP id
 196-20020a2505cd000000b00ba8b4256bf2mr4131400ybf.20.1685033408372; Thu, 25
 May 2023 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com> <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 May 2023 18:49:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkZe+v5-MFXrVdUsqYnLuWE1OfuFCq7xyzT=PtjSFw8Q@mail.gmail.com>
Message-ID: <CAMuHMdUkZe+v5-MFXrVdUsqYnLuWE1OfuFCq7xyzT=PtjSFw8Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
        dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Mon, May 22, 2023 at 12:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Renesas PMIC RAA215300 exposes two separate i2c devices, one for the main
> device and another for rtc device.
>
> Enhance i2c_new_ancillary_device() to instantiate a real device.
> (eg: Instantiate rtc device from PMIC driver)
>
> Added helper function __i2c_new_dummy_device to share the code
> between i2c_new_dummy_device and i2c_new_ancillary_device().
>
> Also added helper function __i2c_new_client_device() to pass parent dev
> parameter, so that the ancillary device can assign its parent during
> creation.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Replaced parameter dev->parent in __i2c_new_client_device() and
>    __i2c_new_dummy_device().
>  * Improved error message in __i2c_new_dummy_device() by printing device name.
>  * Updated comment for ancillary's device parent
>  * Dropped aux_device_name check in i2c_new_ancillary_device().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
