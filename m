Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729366A1AA4
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 11:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjBXKxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 05:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjBXKxX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 05:53:23 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3765653E
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 02:53:21 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p26so11108934wmc.4
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 02:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=znlB4r6XgBnVvoPNdtfBl1Kal49FRfFG/+7iFF5NYGM=;
        b=CahmQVC0rEX2m1jIBvE6lKSxFcwQU1naGbPwl5uJTZm/xt3OVS5j+dFDUEAE5bI47D
         y7OTTOaRAVxAKM9Xc3WS0vgDoD/4QOvQZbmgi1+3CSkfBn5PCTxvhYxZinzQjHjkcSwH
         vrZzACVqhT1DZBwONy84w3W6wIMbfNenvSdCOUy80uEhX7AxuFey85ZNEqb217X16kgu
         snf2uDewRFFP4pp8CMj7t3sQddZx7XlxFfryOIbFMRIZUIVXpnNXbLGcpd+nIEC94N1i
         cMaSmABnB0x+SYcjEiGRpfSjdC4/r+dxeC67BrywGgLvNYKhPCAng9bk+onkcJguS/Zj
         HEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znlB4r6XgBnVvoPNdtfBl1Kal49FRfFG/+7iFF5NYGM=;
        b=cjU9njQoXFPR5jbp/SoIv7JbBY/WMgHZymPLeA8Fz+0Dnrq6+R9ywF7LE1cM4Jd2pd
         hge61H2OxxuO0tLHZLPEyY4RTyLSHG3TIK4EF6lQPLY32k01NZ3TzKLja66Grxp6HaR0
         MfrKe8psI9JYI77RiIGcZp8rAJtvd1sbSi95ygJ78YPTEQJ+jdpQv4Evq5zokrTsrZZ5
         5b6AD3Rm+OW3tX85qYFhRYzTNfA1t57dulXrA8duG54OoYUW52Xyf42zQv/uT+yJMx9Z
         5doASmX/VW+kqx8w6w3wMhA16fcQrrWhmnYVj7IMf6NyiOToOBijA02Q7tPUStpnnoAN
         NPvg==
X-Gm-Message-State: AO0yUKXHS+e1wg3hxvIFMM0BzLU3YmFc4xg6V8kuP58h+q92TNEgFMdE
        guQdYOC0sFwee9Lv1aRnR/mrxM3kbvM+gC7tFtunPA==
X-Google-Smtp-Source: AK7set+zOA8EjyMhKkZVWtfwPH0x6BD+VAP4kHCLJYaqtwjn3LBX11LdH2RvdSQmmQorzU2SLOOhUBwb1opCmFKAC98=
X-Received: by 2002:a05:600c:3ba7:b0:3e2:98f:1d76 with SMTP id
 n39-20020a05600c3ba700b003e2098f1d76mr1152618wms.8.1677236000306; Fri, 24 Feb
 2023 02:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20230219183059.1029525-1-xiang.ye@intel.com> <20230219183059.1029525-6-xiang.ye@intel.com>
In-Reply-To: <20230219183059.1029525-6-xiang.ye@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Feb 2023 11:53:08 +0100
Message-ID: <CACRpkdbAve++nA0zwHvOm3fy0t9J9g0fR_FO71TTv=TwM6CJYA@mail.gmail.com>
Subject: Re: [PATCH 5/5] Documentation: Add ABI doc for attributes of LJCA device
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

Hi Ye,

thanks for your patch!

On Sun, Feb 19, 2023 at 7:31 PM Ye Xiang <xiang.ye@intel.com> wrote:

> Add sysfs attributes Documentation entries for LJCA device
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
(...)
> +What:          /sys/bus/usb/.../cmd
> +Date:          July 2023
> +KernelVersion: 6.4
> +Contact:       Ye Xiang <xiang.ye@intel.com>
> +Description:
> +               Commands supported by LJCA device.
> +               When read, it will return valid commands.
> +               When write with a command, it will execute the command.
> +               Valid commands are [dfu, reset, debug]
> +               dfu:    Force LJCA device to enter DFU mode.
> +               reset:  Trigger soft reset for LJCA device.
> +               debug:  Enable debug logging.

Given that there are kernel drivers for this device, it looks pretty
dangerous to make it possible for userspace to reset the device?

But maybe it will re-enumerate when you do this so all drivers
unload cleanly and then re-probe?

I guess the DFU mode will use the USB standard class for updating
the firmware?

Perhaps a short blurb on the use case for each string could be
helpful, like "echo dfu to this file so as to put the device into
DFU mode so the firmware can be updated".

Is the idea that e.g. fwupdmgr should provide a front-end for this?

Yours,
Linus Walleij
