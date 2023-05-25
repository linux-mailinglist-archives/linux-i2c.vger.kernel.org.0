Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BB27110A8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 18:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236061AbjEYQP2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 25 May 2023 12:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbjEYQPZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 12:15:25 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDAF10B;
        Thu, 25 May 2023 09:15:23 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-561bb2be5f8so9959677b3.0;
        Thu, 25 May 2023 09:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685031322; x=1687623322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CovcvpuQCcWTlsPBeZxVFQxU8LQBLbcnv4kqQqCo0kE=;
        b=BMxYLzZvg3WJ1drCi1sxo4vISc2kfh5oEvLunspqYGRnLRyDaSERamt5LWPBtc8m3l
         vGStqGJZuof4/kAlTaaBEBDUuTx1+c9fWhHsgiH5ROo5RRbnL49z1jlRQ5ddQCLG659c
         nV13+Nso2O3ZmItbM5ebJ3u7o1z/3u6I+3bjkNQhNTWyIPc7HrQMLd3tqt2c3xsxlI5K
         MuhWqKLI/JL3BkbOOeBFUTGDl4xz/sRz/hks4hP1BSsFVZJ1TS61P3J2NkHGM8X4ukrL
         z0iL1rgdDEeDbQA8x+odSBGsAhdLjaoEex2obtkUBOqYk2f0WBMxmC2OSMjN0Av/3Asj
         W1nQ==
X-Gm-Message-State: AC+VfDyU5PCzy/2rnN86Acfd9IvMFxbmlKTVhYaYxrtEe6z0UiP8DdTW
        eN/3KwB9y+Jt6H5vjRkiyi7ktOBLBRvq5A==
X-Google-Smtp-Source: ACHHUZ6QRlx8eSe13WolCvHKoh6Ac4Ca6KZd8pCFg+An4daY6XvGTut2TXf0mqU7WfSk95ocZXvuxw==
X-Received: by 2002:a0d:ca88:0:b0:55a:6430:e8fb with SMTP id m130-20020a0dca88000000b0055a6430e8fbmr127627ywd.8.1685031322590;
        Thu, 25 May 2023 09:15:22 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id d123-20020a814f81000000b0054605c23114sm477537ywb.66.2023.05.25.09.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 09:15:21 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-561bcd35117so9783817b3.3;
        Thu, 25 May 2023 09:15:20 -0700 (PDT)
X-Received: by 2002:a81:8444:0:b0:54f:179:cef2 with SMTP id
 u65-20020a818444000000b0054f0179cef2mr81923ywf.19.1685031320607; Thu, 25 May
 2023 09:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com> <20230525135108.240651-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230525135108.240651-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 May 2023 18:14:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpvxpmKNo7wUcxdPq_s0u4jLioFUqxGB9rgogxioz4xg@mail.gmail.com>
Message-ID: <CAMuHMdXpvxpmKNo7wUcxdPq_s0u4jLioFUqxGB9rgogxioz4xg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rzv2m: Disable the operation of unit in case of error
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Thu, May 25, 2023 at 3:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The remove and suspend callbacks disable the operation of the unit.
> Do the same in probe() in case of error.

Makes perfect sense.

> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/i2c/busses/i2c-rzv2m.c
> +++ b/drivers/i2c/busses/i2c-rzv2m.c
> @@ -454,8 +454,10 @@ static int rzv2m_i2c_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, priv);
>
>         ret = i2c_add_numbered_adapter(adap);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               BIT_CLRL(priv->base + IICB0CTL0, IICB0IICE);

This needs to be wrapped inside pm_runtime_resume_and_get()/
pm_runtime_put(), like is done in the .suspend() callback.

Note that this is also lacking from the .remove() callback.

>                 pm_runtime_disable(dev);
> +       }
>
>         return ret;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
