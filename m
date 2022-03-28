Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9545C4E9A56
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 17:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244250AbiC1PIB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 11:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244188AbiC1PHu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 11:07:50 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583654EA0D
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 08:06:09 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id m67so26539614ybm.4
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/wRiyThS5X8/D2KX8GPji/87UrigbGUnnN2Y5aIQZk=;
        b=yV5Sdnq4Kjd2UWp/LZ5lwEEIERJNIr6KcM46CNCVWFvx5wlzaJKddNK3VRi9pv7R2o
         hWLbRfqsYLG0O6BNwadNXFRL0YPv+6GRHkR0IzKLPhfmrUR2KryNXljHadxnyCDBIKfG
         KF3hEMCHNIbTbUadbfHl44Bxavmpj4Yv1hA3CuM83B2CxsfvMWvxfFESE+lhkcc2sl81
         sVn2fmUkIK1jSq6CSafEfGsW+woSpsvXDMkS8B+IG38HEM9XFKMRr8RrXUF/P0GXJxbn
         0RCKTCb0nMdQINyuCCC1bFgIRbmReMA7sVoFZOdeeWwD8F4hNP9k17WhtrZi3ge5CPd4
         ikkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/wRiyThS5X8/D2KX8GPji/87UrigbGUnnN2Y5aIQZk=;
        b=diJ0jNJNWBf5dlDbWI2ufIoKZ5h0Ie+UirmYUGau8203UZwAMm9BRFZJTzllZeSTl7
         T4RKSwJcNLynMwQ5lpB8Z0f4yZpIVdJ7RHIgbjUFZ6fQEcDCUatQDQTEGIyrMUhJHqrF
         Tjg2eM17GCt8W1YElxwNfKhL58lZPIcXjJT/KBNElWCNxJ9rvEcWB8EleAUmpvdAEyOl
         HlKb5TnL9Kk2tCoL8OcjsCmU/9YCVAlV93cdM5mS7Z6SBtQYMkZtA1pQnKXW3sA63QaS
         M4v5RJjFFJUEelBR/K7jM8ncUrmY2OzEeNn9aUG0vgpX2VNiFTi1WMQgjn/O2Wv3wizQ
         K0cw==
X-Gm-Message-State: AOAM533/+a5gbnZBuPXHks5oAryBX7i+R1TeJkWTq1kvJdvQRg+WtzRy
        TWqscP2WXTo8VubxH/WxRLmbznMw7e5iJCaX1Bfa2A==
X-Google-Smtp-Source: ABdhPJyBvWP4T/nWYSh2/FjJMHmzkTwu66lNSkHUz/fBNP/OZSAqAsPGed14FjOgCZ7TguMcw0Nj5dmdm+VJ9v0F0CI=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr23196123ybi.492.1648479968482; Mon, 28
 Mar 2022 08:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220321042142.69239-1-frank@zago.net> <20220321042142.69239-3-frank@zago.net>
In-Reply-To: <20220321042142.69239-3-frank@zago.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Mar 2022 17:05:57 +0200
Message-ID: <CACRpkdaOHHkJnvB=RQ8dLXGxT_h5mGgy5Np87QVMcPzegNi2oQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: ch341: add MFD cell driver for the CH341
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Frank,

thanks for your patch!

I see you already got a bunch of homework from Andy, I will do a more
thorough review on the next iteration, just a few things:

On Mon, Mar 21, 2022 at 5:21 AM frank zago <frank@zago.net> wrote:

> The GPIO interface offers 16 GPIOs. 6 are read/write, and 10 are
> read-only.
>
> Signed-off-by: frank zago <frank@zago.net>
(...)
> +config GPIO_CH341
> +       tristate "CH341 USB adapter in GPIO/I2C/SPI mode"
> +       depends on MFD_CH341

I would add
default MFD_CD341

This way it gets selected automatically if the MFD module gets
selected. (I suspect you should do the same with the I2C module).

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/gpio.h>

Use <linux/gpio/driver.h>

Yours,
Linus Walleij
