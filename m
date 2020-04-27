Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CB61BAC24
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgD0SQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726228AbgD0SQH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:16:07 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC49C0610D5;
        Mon, 27 Apr 2020 11:16:07 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id x2so17647679ilp.13;
        Mon, 27 Apr 2020 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmLQU8rm1MaDWTn/mChW2COr9I5pa8fmPALHO00ydSY=;
        b=OS71vo6P5vRGR7AIQ9CH2o0GTvUWbKTixJVTcs8LBpJy78MN68wS+w1L/NE2W7QQ0A
         aT7sxCcpIFOPqcZDHmn7H+jdLo9NrBNf7E8pdvxvhTEORZeDHUbNdFnjyXc/NckLS8U0
         Fcyz8/Jm9yBAsfkM0QSWqYbYadsnwxVb9kzDFpCuUg1pOYe7FDMmxxwNJPsMOlPpYllr
         4KBARKthF33uAlP1AcLoagxMY1RvIEdLoTW7UUzvR7F1yVQJqv1GEn+6aDTNmjYcwxn0
         76w/tx7QqpRKlJ7VFipVo9CMKljrrDXIoVcx/+OqNjWFl9LWUWII2yr06aDbQ5Pu6L/U
         uPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmLQU8rm1MaDWTn/mChW2COr9I5pa8fmPALHO00ydSY=;
        b=egZ6Lw6YujGwfgdau/RnCrP0WjwoNGDmrtbmAUOO4wwctpIJY49wRkc/rg6zraEGpU
         1lgJDHFCT/kzLyM/LjLWqCslMPT78XNv0s9Fmv4mPVeEuUJfTLys+tJFkXHvzlu6GAhF
         HZ6gRNhWq/qhs4/CZOat6DSBfypHrxy5JgsPgv9GEXNfadzNs6HnQlOygF3HAMGI15op
         m8C3bSdpv5HUQlX2SsSp1iwuZGMxX8OX/SF5l88hKDaoSaSzN4be7b3V0opI5Br5khYX
         uzH9u+Elda8lQvOYofeNk2Gpr7hiCBuPgHJHbSNjFvHhw+/V32sC4SjVEElQScyR05Qw
         t6ww==
X-Gm-Message-State: AGi0Pua8zxMyUKCNeA9mE9IgCGtzZKj72QCyW/SvOUXVa3lxSs2/8ggy
        t94814Zan1YFriPLDZQXVIcPMd487ygs3Fboc/J9p1fK
X-Google-Smtp-Source: APiQypLEFdWzJWGk/lNHboue27tEM3hzSIhfOKIUkk9TPbjUAgDLUVW2lGpgBWDg32c6b08IKL9eiTEpm2bkOIzlDUo=
X-Received: by 2002:a92:d846:: with SMTP id h6mr19975276ilq.248.1588011366489;
 Mon, 27 Apr 2020 11:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200426081211.10876-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200426081211.10876-1-wsa+renesas@sang-engineering.com>
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Mon, 27 Apr 2020 14:15:54 -0400
Message-ID: <CAC=U0a2p+vGfzTJOBaAuFUWh1azJC49cundYAOG0C5JjMgQtzA@mail.gmail.com>
Subject: Re: [PATCH RFT] i2c: brcmstb: properly check NACK condition
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 26, 2020 at 4:12 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Wolfram Sang <wsa@the-dreams.de>
>
> cppcheck rightfully complains about:
>
> drivers/i2c/busses/i2c-brcmstb.c:319:7: warning: Condition 'CMD_RD' is always true [knownConditionTrueFalse]
> drivers/i2c/busses/i2c-brcmstb.c:319:17: warning: Condition 'CMD_WR' is always false [knownConditionTrueFalse]
>  if ((CMD_RD || CMD_WR) &&
>
> Compare the values to the 'cmd' variable.
>
> Fixes: dd1aa2524bc5 ("i2c: brcmstb: Add Broadcom settop SoC i2c controller driver")
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

 ---
>
> Not tested on HW.
>
>  drivers/i2c/busses/i2c-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
> index d4e0a0f6732a..ba766d24219e 100644
> --- a/drivers/i2c/busses/i2c-brcmstb.c
> +++ b/drivers/i2c/busses/i2c-brcmstb.c
> @@ -316,7 +316,7 @@ static int brcmstb_send_i2c_cmd(struct brcmstb_i2c_dev *dev,
>                 goto cmd_out;
>         }
>
> -       if ((CMD_RD || CMD_WR) &&
> +       if ((cmd == CMD_RD || cmd == CMD_WR) &&
>             bsc_readl(dev, iic_enable) & BSC_IIC_EN_NOACK_MASK) {
>                 rc = -EREMOTEIO;
>                 dev_dbg(dev->device, "controller received NOACK intr for %s\n",
> --
> 2.20.1
>
