Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4F844DC91
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 21:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhKKUna (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 15:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233617AbhKKUn3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 15:43:29 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8C7C0613F5
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 12:40:39 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so10609210otk.13
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/q0Nd34GVOW6Vtxlxyie8tWymeB+50LKpXfiwevblXU=;
        b=XZHTFAlBg00W3A2TcZsb7/yLfISiWxehJykSZWM4yzx/UI2VWUY6k0sBYaSx2Zdg1m
         LtpJyG/iAG04oYD9l/YrHBSaq1sZt11hMnWgXYPVlqBAsW/AWYpD4ojphCVZUacyAxVU
         2zcTrwTemXbvSwDga8q/o3xYzJAXiiaJQpmb5XMq0KiU3/xDwMnoB55ab27Iec9k0UAf
         fYJ1y5Zy1wY5TI0ttf9RyILiu7XyD3GZOIqySy+OuxAXLped/3ENBcQcqouh9y0H1XhH
         shJmLQSHbBPTt7KIZ0ZoC0s/KDdKwsty03sbid0k70qCYYDep8V61zmd78tw0NTVkMzL
         3Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/q0Nd34GVOW6Vtxlxyie8tWymeB+50LKpXfiwevblXU=;
        b=l2eDuoCjRyi1mWxIR6GyQLore8kBSo3PWJJK4ehM9GwygA/uAKwdewmgJnAA7s9Elh
         YJ/VFO7RekXU5fGgyTtnDOUu7ZnySDMxQekiLNv3Zvn4YXtSskWnDZ3WJ8u+fDxo8JMy
         x72OrHNEWpaeHnPuYSvSk+LtD9AErTWR/rPpOcCTddo2TVDJe8moHCxg8By38b2As9g2
         qZtJWD9VWtibQpV72REPEB/JnpJz5x3j/ewCBCV3FejH5nrX/9Y2XEMBxmkK54RvReMM
         z4ns9ZeVABtkIu6wmxi7pXgL5OONE97veSbQdpMkkd90TuOEvNiOT12P4fycODSGwkKm
         1qCw==
X-Gm-Message-State: AOAM530stM9oh83F38ng0WMxPo7Uah0wTTTIMv/iRinvJiQLiRqjSKG2
        WwN6x59p9YT3FkLewubKrbniiK8aHPv/vDntKV5J4g==
X-Google-Smtp-Source: ABdhPJySsR95LrrExB2lAp4D7yILSqjeWebOdJCZOAFeTEf1VDzCywTgpKbXhktGmNdDUukENe/NseuXLB+TFyiClIY=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr8309151otk.179.1636663239280;
 Thu, 11 Nov 2021 12:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20211018220504.8301-1-shreeya.patel@collabora.com> <202111101719.VzKfSYAQ-lkp@intel.com>
In-Reply-To: <202111101719.VzKfSYAQ-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 21:40:27 +0100
Message-ID: <CACRpkdZFX2xvFSjjg2Kwh4vn4zNoCfnp_xRmFmtVffADdokkoQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     kernel test robot <lkp@intel.com>
Cc:     Shreeya Patel <shreeya.patel@collabora.com>,
        bgolaszewski@baylibre.com, wsa@kernel.org, krisman@collabora.com,
        sebastian.reichel@collabora.com, kbuild-all@lists.01.org,
        kernel@collabora.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 10:16 AM kernel test robot <lkp@intel.com> wrote:

>    drivers/gpio/gpiolib.c: In function 'gpiod_to_irq':
> >> drivers/gpio/gpiolib.c:3068:15: error: 'struct gpio_chip' has no member named 'irq'
>     3068 |         if (gc->irq.chip) {
>          |               ^~

Right you need an #ifdef CONFIG_GPIOLIB_IRQCHIP in this
case I would try:

if (IS_ENABLED(CONFIG_GPIOLIB_IRQCHIP) && gc->irq.chip)

hoping the compiler is smart enough to deal with that
(but I'm not sure it is)

Yours,
Linus Walleij
