Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817CB6AC3C9
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 15:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjCFOte (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 09:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbjCFOtc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 09:49:32 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219CE2736
        for <linux-i2c@vger.kernel.org>; Mon,  6 Mar 2023 06:49:11 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id bo22so9977416pjb.4
        for <linux-i2c@vger.kernel.org>; Mon, 06 Mar 2023 06:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4Vf/GiLha2pSMEvHIjTJV0zZlY5SiXWt3VfrpMrw9Y=;
        b=Ie2D1rH3uU6Nxu3I4xgmVQfmN9AQMA3FIQ3f7FIpgkWhFLNxwof56JqSateLTDBRkS
         fZMUMYBQyimoR3EqcTL9dVwTBu6qt1wGfQld9HoutXGKYMDfI4XZiZJzn283Vt5076if
         gG7vwbotbfpzxzNkFdO9YicOBmPWttyKHJCt/9ljU6qszLUN52G4l1thj22F1y10Opgq
         PYPPFpmqyj+v+lh2bl4kfgT3EZwPKo2U8HiTj7STP2emoD6WVrmSHLw5GUrjSeYBF6Ls
         rFWhT5HnyzJ31O2hL7/yBBhEtgKD7iDiT1qx8WNUsvLHnA1KiaKcKWdunO4h3CKwVJcf
         8sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4Vf/GiLha2pSMEvHIjTJV0zZlY5SiXWt3VfrpMrw9Y=;
        b=759+P+uxK4mDhOuHJEGN1qlgVevo2qaUy6eqDklsCf251o2IagPd4b0iOkWNjwsQ7E
         /iwcDVgiVjqN1wPVd5zKr/MbCs0jnTqZK/Hdr2BNejMD9HeVdW6mGkuxmJNqgmWRbjeZ
         T9PlJCm6DoCbloBFEVn2vc0r9nLWcREiW8KQK88sKK29ptmbFGxs3bJmiAL2B61+RFF1
         OSUn1Qzyksq/w+u+ek7xbnotUBULOG/r5xNAxdFXdoJ4RogwtCSJ0rGjFI9hMMk8hUbZ
         Qyh0HHEgs6Mw6wmSJf1z+2IjR5WDu5VLlRQKtoCu4xoCLOOEVkSL8W1+AvjDdSSLhkqY
         VUtA==
X-Gm-Message-State: AO0yUKU2C7uZEYnw2vBFmiwnh9AsWOZTnzVoHh7IRO5+Iz4OETGmPwV5
        hrXC2Gy9M8lq9zm/CY1mE4VlOSAnokhetNT/JTKqOgcqRWwYk4x1
X-Google-Smtp-Source: AK7set/n8BLSpbkCEy3a4qm95upY/2HMv3F6GdIP+lCqGyyMSVbkr0y4BuVYE7xyzvcDBhJP5Fr9x0ECyU/7lNdQ1Dc=
X-Received: by 2002:a5b:647:0:b0:932:8dcd:3a13 with SMTP id
 o7-20020a5b0647000000b009328dcd3a13mr6562490ybq.5.1678112538925; Mon, 06 Mar
 2023 06:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20230228065618.2686550-1-xiang.ye@intel.com> <20230228065618.2686550-3-xiang.ye@intel.com>
In-Reply-To: <20230228065618.2686550-3-xiang.ye@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:22:07 +0100
Message-ID: <CACRpkdZ4iiN-zeJautqk==kcUh1cRdyrhmeACEBppPYdJwA=Xw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 28, 2023 at 7:56 AM Ye Xiang <xiang.ye@intel.com> wrote:

> This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> GPIO module with specific protocol through interfaces exported by LJCA USB
> driver.
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>

Check my comments on v4, with those addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
