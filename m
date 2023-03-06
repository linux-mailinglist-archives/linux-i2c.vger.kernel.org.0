Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCEB6AC21D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 15:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjCFODO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 09:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjCFODM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 09:03:12 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FAA1A484
        for <linux-i2c@vger.kernel.org>; Mon,  6 Mar 2023 06:03:10 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id v101so8193989ybi.2
        for <linux-i2c@vger.kernel.org>; Mon, 06 Mar 2023 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678111389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aeI0dDbLr4/ACidaziQGMHF31Y6IixUFDfRpx8Mx/wA=;
        b=vK9FaEHCdgDzRu4DjPJWTQBw0ym3gDa0yjQqQCnqBt7ZdX2V3YknYc0TXVHSTIdTCs
         qc7ONVmFDXY7QUiQ94S/jiXwKX8qVGnMzxPlDbS1V0fMZm/jN7bIQ8qju3NkxY723rue
         Y7hIZb83V+L80LmBAcUuaZyC1DAXPpQGGWS2+jsN9l8ZCwZ0sCyABzVCLUs86RCwf7Hl
         JrAgfwV7cilq74XuMQcLbg/v+/+/Beo/pxO+lCshsMcu08+UZ3WYGEzk4V6H38StpixM
         c8DaUFlFVbVVM+e5qZEBCe23aWnqz/o2WWxXP+Sa3x8+9pOr6cpYrOl4CKNmRCpYpURC
         VVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeI0dDbLr4/ACidaziQGMHF31Y6IixUFDfRpx8Mx/wA=;
        b=AN49saub7URk4lhXg1qVDVacYzKnF4nHWhluRFIlXAL6B4gAIJN/IzKIxFAECPzrm4
         +FifJb+4U7X75pkqeVkxFBgi4DcjvnTYWgHYyJ1u52qJ159MudaZlHSRixbRDltjrUbe
         AXDM7W/mgpnGLV6xMXqQ2c3jbTUJckSY2crT8AVoEfJmGbzyFpmGpCxPsQKprEF338jF
         2FjTjv0HvYjZjUTlMUyVTFfQxsB9vX1bJ6TN46h+9azytwfw0JbO67yfKfj82Av7AkrY
         zcdwaupmlmy4yiJa3VuJa27/WN/NElWMhamW0kmIb0DcEmHFb7gHJFafJ2C7OH9rBpkm
         WG0g==
X-Gm-Message-State: AO0yUKX5QHauUOAKQ6IIaov79DEyjUej9SY4RGqM11Yl2GBkMLaFQT4P
        A2f9n0/SD7oYgYGtDqH3eMo43f2ILJdNuEj5+3t6DA==
X-Google-Smtp-Source: AK7set/HdjPVX0qQf6R2XKUSVQlV3OuX7y4xtLBkiSFmdlwUeEep/Nd0dxjJM+J54cyXaepI50nVK56Wpi2U6362WPI=
X-Received: by 2002:a05:6902:4f4:b0:a06:5ef5:3a82 with SMTP id
 w20-20020a05690204f400b00a065ef53a82mr4989421ybs.5.1678111389438; Mon, 06 Mar
 2023 06:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20230225140118.2037220-1-xiang.ye@intel.com> <20230225140118.2037220-3-xiang.ye@intel.com>
In-Reply-To: <20230225140118.2037220-3-xiang.ye@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:02:58 +0100
Message-ID: <CACRpkdaHUEG2NJxrU+R-VVcpcMzf-BzfOKDBcKQQqh2_zQrFJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
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

On Sat, Feb 25, 2023 at 3:01 PM Ye Xiang <xiang.ye@intel.com> wrote:

> This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> GPIO module with specific protocol through interfaces exported by LJCA USB
> driver.
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>

Looks good to me, also looks like a really helpful adapter.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would appreciate if Andy could ACK it too, as Intel engineer.

Yours,
Linus Walleij
