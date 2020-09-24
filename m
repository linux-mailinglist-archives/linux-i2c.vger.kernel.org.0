Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029B32771FA
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Sep 2020 15:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgIXNOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Sep 2020 09:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgIXNOg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Sep 2020 09:14:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AABBC0613CE
        for <linux-i2c@vger.kernel.org>; Thu, 24 Sep 2020 06:14:36 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gr14so4467966ejb.1
        for <linux-i2c@vger.kernel.org>; Thu, 24 Sep 2020 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UU72OT9OFCD0Y/H1L5O+aGgSW5bbzFg3S9odsIbwqqM=;
        b=1OQz49BpCenPTtKOldIlFvRPP+uwzrrdtxJGswtEnPWchuvG1wP6tQWLvvBSlY2A/q
         NCsIbbgcsXJ4CnB7z8u95zEfYLqKp61lh7ibLJeT2XLrZts4Ep3wutzKrgcqXjeqcQs6
         Iu9GEdeycNbVMHsJHPPUW3pldSZpyeOexHrpqaXT6FHt4JgHoWW4uSeZbMf9yMN343LJ
         gnC+twR1R8aKMWvV49x7Cf5H1w3hI6Ald4c/EIATYQjO+YLCUMQRcxr+UC6uU9mPWVsy
         xdg2qnElSCykWcbN0Y8TCR2+rXiIR1987qYVXC9aDiKBdeyk8YhytP4U7XMjVRgEre8p
         vLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UU72OT9OFCD0Y/H1L5O+aGgSW5bbzFg3S9odsIbwqqM=;
        b=OvwhYLZCNpcCoOIHwpFYu9cs9SpZaocRt36eSBPCPICvKVB0PjbTkCmHQ5NRIwRM/G
         NTNNXmpVXM42YuuHsIq76b0xREH20Es2EC+KHsvPn7L1u5t8q7+0nFWeXjv9IcUd+g0p
         048yFXFJOrCgy2YTUFRIegNTweqDfwtLMBIr9U9yNcK7P0g6Q2vLH6Ygwh4xzYk8vpg4
         l/ewwzeT/+dYOxz4qrVSzFNlG9KpGwotXAxDAANuYmx6CnF5XW5vRcR8z0duQjYbCpDW
         pqDXJW/WeVMQZLE+DqYMT2GG33LMdZjsjKvo/+u/884p//NwqD+edejV1wgtZ/fBwoLQ
         UOXQ==
X-Gm-Message-State: AOAM530Tb48D8BU1w+0EnD8isNXpDxLcIG9f3F995Bdl68mYkTNlchaw
        SUCs8evDSAaZ3JbyJ24DWfYxokmWTMh8ZaeDBeDKUw==
X-Google-Smtp-Source: ABdhPJwUeknclBKofdrwxIvLcDNe8UHbmiYtxvbDvluJx+iGumhwROyvfKEW+m068hhZ+G49PWsc7kedy8OeYFj02dM=
X-Received: by 2002:a17:907:20d9:: with SMTP id qq25mr946839ejb.382.1600953275023;
 Thu, 24 Sep 2020 06:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094952.458003-1-jonathanh@nvidia.com> <20200916094952.458003-2-jonathanh@nvidia.com>
In-Reply-To: <20200916094952.458003-2-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:14:24 +0200
Message-ID: <CAMpxmJVqEHBZRTxwK1Dviz2MH=MUpNbUdtkVLjn0E2BM_HiCbQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] misc: eeprom: at24: Initialise AT24 NVMEM ID field
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> The AT24 EEPROM driver does not initialise the 'id' field of the
> nvmem_config structure and because the entire structure is not
> initialised, it ends up with a random value. This causes the NVMEM
> driver to append the device 'devid' value to name of the NVMEM
> device. Ideally for I2C devices such as the AT24 that already have a
> unique name, we would not bother to append the 'devid'. However, given
> that this has always been done for AT24 devices, we cannot remove the
> 'devid' as this will change the name of the userspace sysfs node for
> the NVMEM device. Nonetheless we should ensure that the 'id' field of
> the nvmem_config structure is initialised so that there is no chance of
> a random value causes problems in the future. Therefore, set the NVMEM
> config.id to NVMEM_DEVID_AUTO for AT24 EEPROMs so that the 'devid' is
> always appended.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/misc/eeprom/at24.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index e9df1ca251df..f76624b5c033 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -715,6 +715,7 @@ static int at24_probe(struct i2c_client *client)
>
>         nvmem_config.name = dev_name(dev);
>         nvmem_config.dev = dev;
> +       nvmem_config.id = NVMEM_DEVID_AUTO;
>         nvmem_config.read_only = !writable;
>         nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
>         nvmem_config.owner = THIS_MODULE;
> --
> 2.25.1
>

Ha! I only now noticed I already have a patch for this in my tree from
Vadym Kochan for this cycle. I'll drop this one.

Bartosz
