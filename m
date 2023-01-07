Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD081660F00
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 14:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjAGNKc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 08:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjAGNKc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 08:10:32 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A3357938
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 05:10:31 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id f3so2953388pgc.2
        for <linux-i2c@vger.kernel.org>; Sat, 07 Jan 2023 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9A1byRQmre4GrmttCcN4I0zGqTUMV07g3QNFSHLt3I=;
        b=nmh+m0JPzNAPlkB1OWzmhQIJLL60+wkDSc+wLP7BPAx2bQTUhOI/Nx3gitRffLHmSw
         5Pel9Bs9jHxC54ZjZVKu5fkk187xNcUESu2xpqG5iFZfso4Mm7xDiPygAgthxu/QqadS
         gh2pQWNm0ICKJBe53B1mq/31cJlHPHd898MQNiv7FfDE3BQ+Mid6x5fFovnE0ptgNh1c
         ON51ECUoRv2ajksTYFzxJwNS0LBUKza/c/Su7cz/vd2kvkomA56A1kWSy4W4coFWH28t
         mcxjZQYYXNuoPiwJciflUx9zblDdle7+k9GDwLKlBCfPaYSoXyUGihrzGSB0k6hOtcUb
         klLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9A1byRQmre4GrmttCcN4I0zGqTUMV07g3QNFSHLt3I=;
        b=7u5e+I9YdK/w4tmrwv9hUqVvExxRq5TExDlPejTRz5OpLQKKpngflpV0uo+PXo7Npm
         CbkfG/wuqu6k222qBKZB+iW1N9TvuxNKwbwSRfX4GM3tLAZbAKW+/uYM5DdewSuYL20i
         a9yzKsEYV5NccUEn2abM/UbrySfNlCIL4Si/r3X28Jko4bmesUPsmFx74mLNdk285OG/
         2egw6KyrWrueXDGJOIcvYCpZ58zjH4AT9FkG3oUaCXd5UMyxFOIdoXjrZc4ZxuSgX6pz
         D2JmQDoN9a9d7fT8O0a3oWGCkWUCERHEsvN6Yc2Jct3mn6kg6mMToHIxLhEsLnBaYZS6
         bhJA==
X-Gm-Message-State: AFqh2kqrXAW86upfs1cutHLUWEJI42fuMvno5rfYfhTsho4yQdoQIC0A
        7hMPFQJTVGPpPf8G/CMmcLSXUeAQ3hMkUbcBRosNRCxX
X-Google-Smtp-Source: AMrXdXup8SYLNnTebJepzMcp17uKZ8B1sGEwa3GMN/gthFa1JcpQcBj2dL/ozzPwLRFFfBTIFwPL+yIAI/hHSILKPaU=
X-Received: by 2002:a63:154c:0:b0:4ad:7773:fd02 with SMTP id
 12-20020a63154c000000b004ad7773fd02mr129883pgv.603.1673097030795; Sat, 07 Jan
 2023 05:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20230107123229.4218-1-stefan.wahren@i2se.com>
In-Reply-To: <20230107123229.4218-1-stefan.wahren@i2se.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 7 Jan 2023 10:10:18 -0300
Message-ID: <CAOMZO5AFM5NmmNoybD0C-n+dVPjqYGTn0cP7N8MSJameXZS1nA@mail.gmail.com>
Subject: Re: [PATCH] i2c: mxs: suppress probe-deferral error message
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stefan,

On Sat, Jan 7, 2023 at 9:32 AM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> During boot of I2SE Duckbill the kernel log contains a
> confusing error:
>
>   Failed to request dma
>
> This is caused by i2c-mxs tries to request a not yet available DMA
> channel (-EPROBE_DEFER). So suppress this message by using
> dev_err_probe().
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
