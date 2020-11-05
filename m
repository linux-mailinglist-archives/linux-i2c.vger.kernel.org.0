Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C572A75B9
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 03:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388405AbgKECq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 21:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729344AbgKECq1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Nov 2020 21:46:27 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23365C0613CF;
        Wed,  4 Nov 2020 18:46:27 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id r12so52075qvq.13;
        Wed, 04 Nov 2020 18:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zH+kMb2mDjz1gX5zpF0a3PDNXVCGzlWx/K6lQCiKGKc=;
        b=YGoL8RA8xNYLHqY3S/Pow7ScfXhZ+NHg3KG2sFDp1vrk69nTzdZjnZEgyVcEa23DP3
         5AVqAHdxRhqohKQnk/orxSmSkdjsZz/msU4FvR0av5kh4orWJOKNiUPoVojECaqfpdLV
         USunAfpGmA6asrCShm7HKBG1kFdEifnz8nWX2XM/JKr/aaWm77yk8hxpD6HrnIHue+Iz
         3bFfVVHjIqFwG/7QiABgW4kjszOmgw2LyvPgZ+kN3Y7DQX8UcyaU3bAAYS87OaG/REVo
         YaQiv/WXI6/laHsz0fd5kRdxMwAgBfUwUhj8QypurIyohzQYYAZ96lvqJEWjGGdG5iUd
         yGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zH+kMb2mDjz1gX5zpF0a3PDNXVCGzlWx/K6lQCiKGKc=;
        b=fNvNE4JTvpHMKGk1alIXX3WXzA8zwJTdPssK3xENP+elCJs6tQizDB1YdqqIs5i54h
         3vMQTpE/T+vLiPcUUQSA+byEjBgC/hUABQqWc5JxmtkkKuqeg668O6aQLVponr1v7rd6
         FJstAfmlMjyLaZ6pUbo0hgZyGLD3cNnsO72MR1NDzt0Apwh6OHtr/pgvjufZchCAGJzc
         jEGOPrkAOMw0djrR6bwbpNVUhOD2b1Y6cIfwvISgl6+5i+beWXaA2oUmF1O9lJ+J7HpK
         2wU48o9oja2ULic7/AHjcWtTVZYHp6/JQp5fEh28aIDT+UiCHm6cPPmKXyzZYCgroZh/
         JYKA==
X-Gm-Message-State: AOAM531XLHw77s4Jv/9S9HHlGyM/yYRXIHpSEK7IvcDjnWVcUoVL4OGC
        bJWF6IPM3R3ucZ95RUdrReLqoSs76epu0M+zBmU=
X-Google-Smtp-Source: ABdhPJyJqZy48DS1EOiXhFl59rFvwoXHhy/yx5I4o8AoD1t6Y2MFUL3MWcUeZtJ+h/P3/ZJ4wWGTdy+YHqy+fKC0Rds=
X-Received: by 2002:ad4:5345:: with SMTP id v5mr177080qvs.15.1604544386360;
 Wed, 04 Nov 2020 18:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20201104220223.293253-1-lars.povlsen@microchip.com>
In-Reply-To: <20201104220223.293253-1-lars.povlsen@microchip.com>
From:   rishi gupta <gupt21@gmail.com>
Date:   Thu, 5 Nov 2020 08:16:14 +0530
Message-ID: <CALUj-gvDurdVdH3aKeAojay3AR5RL85iHw7Gq13HdFzGrd91DQ@mail.gmail.com>
Subject: Re: [PATCH] HID: mcp2221: Fix GPIO output handling
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 5, 2020 at 3:32 AM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> The mcp2221 driver GPIO output handling has has several issues.
>
> * A wrong value is used for the GPIO direction.
>
> * Wrong offsets are calculated for some GPIO set value/set direction
>   operations, when offset is larger than 0.
>
> This has been fixed by introducing proper manifest constants for the
> direction encoding, and using 'offsetof' when calculating GPIO
> register offsets.
>
> The updated driver has been tested with the Sparx5 pcb134/pcb135
> board, which has the mcp2221 device with several (output) GPIO's.
>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  drivers/hid/hid-mcp2221.c | 48 +++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 0d27ccb55dd9..4211b9839209 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -49,6 +49,36 @@ enum {
>         MCP2221_ALT_F_NOT_GPIOD = 0xEF,
>  };
>
> +/* MCP GPIO direction encoding */
> +enum {
> +       MCP2221_DIR_OUT = 0x00,
> +       MCP2221_DIR_IN = 0x01,
> +};
> +
> +#define MCP_NGPIO      4
> +
> +/* MCP GPIO set command layout */
> +struct mcp_set_gpio {
> +       u8 cmd;
> +       u8 dummy;
> +       struct {
> +               u8 change_value;
> +               u8 value;
> +               u8 change_direction;
> +               u8 direction;
> +       } gpio[MCP_NGPIO];
> +} __packed;
> +
> +/* MCP GPIO get command layout */
> +struct mcp_get_gpio {
> +       u8 cmd;
> +       u8 dummy;
> +       struct {
> +               u8 direction;
> +               u8 value;
> +       } gpio[MCP_NGPIO];
> +} __packed;
> +
>  /*
>   * There is no way to distinguish responses. Therefore next command
>   * is sent only after response to previous has been received. Mutex
> @@ -542,7 +572,7 @@ static int mcp_gpio_get(struct gpio_chip *gc,
>
>         mcp->txbuf[0] = MCP2221_GPIO_GET;
>
> -       mcp->gp_idx = (offset + 1) * 2;
> +       mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].value);
>
>         mutex_lock(&mcp->lock);
>         ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
> @@ -559,7 +589,7 @@ static void mcp_gpio_set(struct gpio_chip *gc,
>         memset(mcp->txbuf, 0, 18);
>         mcp->txbuf[0] = MCP2221_GPIO_SET;
>
> -       mcp->gp_idx = ((offset + 1) * 4) - 1;
> +       mcp->gp_idx = offsetof(struct mcp_set_gpio, gpio[offset].value);
>
>         mcp->txbuf[mcp->gp_idx - 1] = 1;
>         mcp->txbuf[mcp->gp_idx] = !!value;
> @@ -575,7 +605,7 @@ static int mcp_gpio_dir_set(struct mcp2221 *mcp,
>         memset(mcp->txbuf, 0, 18);
>         mcp->txbuf[0] = MCP2221_GPIO_SET;
>
> -       mcp->gp_idx = (offset + 1) * 5;
> +       mcp->gp_idx = offsetof(struct mcp_set_gpio, gpio[offset].direction);
>
>         mcp->txbuf[mcp->gp_idx - 1] = 1;
>         mcp->txbuf[mcp->gp_idx] = val;
> @@ -590,7 +620,7 @@ static int mcp_gpio_direction_input(struct gpio_chip *gc,
>         struct mcp2221 *mcp = gpiochip_get_data(gc);
>
>         mutex_lock(&mcp->lock);
> -       ret = mcp_gpio_dir_set(mcp, offset, 0);
> +       ret = mcp_gpio_dir_set(mcp, offset, MCP2221_DIR_IN);
>         mutex_unlock(&mcp->lock);
>
>         return ret;
> @@ -603,7 +633,7 @@ static int mcp_gpio_direction_output(struct gpio_chip *gc,
>         struct mcp2221 *mcp = gpiochip_get_data(gc);
>
>         mutex_lock(&mcp->lock);
> -       ret = mcp_gpio_dir_set(mcp, offset, 1);
> +       ret = mcp_gpio_dir_set(mcp, offset, MCP2221_DIR_OUT);
>         mutex_unlock(&mcp->lock);
>
>         /* Can't configure as output, bailout early */
> @@ -623,7 +653,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
>
>         mcp->txbuf[0] = MCP2221_GPIO_GET;
>
> -       mcp->gp_idx = (offset + 1) * 2;
> +       mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].direction);
>
>         mutex_lock(&mcp->lock);
>         ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
> @@ -632,7 +662,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
>         if (ret)
>                 return ret;
>
> -       if (mcp->gpio_dir)
> +       if (mcp->gpio_dir == MCP2221_DIR_IN)
>                 return GPIO_LINE_DIRECTION_IN;
>
>         return GPIO_LINE_DIRECTION_OUT;
> @@ -758,7 +788,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
>                                 mcp->status = -ENOENT;
>                         } else {
>                                 mcp->status = !!data[mcp->gp_idx];
> -                               mcp->gpio_dir = !!data[mcp->gp_idx + 1];
> +                               mcp->gpio_dir = data[mcp->gp_idx + 1];
>                         }
>                         break;
>                 default:
> @@ -860,7 +890,7 @@ static int mcp2221_probe(struct hid_device *hdev,
>         mcp->gc->get_direction = mcp_gpio_get_direction;
>         mcp->gc->set = mcp_gpio_set;
>         mcp->gc->get = mcp_gpio_get;
> -       mcp->gc->ngpio = 4;
> +       mcp->gc->ngpio = MCP_NGPIO;
>         mcp->gc->base = -1;
>         mcp->gc->can_sleep = 1;
>         mcp->gc->parent = &hdev->dev;
> --
> 2.25.1
>

Reviewed-by: Rishi Gupta <gupt21@gmail.com>

Regards,
Rishi
