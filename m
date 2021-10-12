Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969BA429E90
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 09:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhJLH1R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 03:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233995AbhJLH1K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Oct 2021 03:27:10 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9AABC061570
        for <linux-i2c@vger.kernel.org>; Tue, 12 Oct 2021 00:25:08 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id az39so4967262qkb.5
        for <linux-i2c@vger.kernel.org>; Tue, 12 Oct 2021 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=wZpT6T+fhSX11iKtQ6864FN/R474hCm4mU8x3lz89UA=;
        b=oFhnvjwDeanXbc/YvUaxkh5cpD6Nc+WJZpOJr/+UFPmf7g0K4rjornx3Y0GHqjGbkB
         +NuhyFr5SN1kgspcb2C4R4OyHBn/0coV6r0PPWt8cXRYF0GGzyb6hci2YqhU3WoduOMH
         3yIM0pp5FMHglXKw6DN4EAD2rQjXo9QM9ULi2jhqtmB5gMPY7EOkyeOet+k3NLHjzva9
         5W5YX+kSww0ob7N9L0ruT9IdBnegHYzXiaH3tCNrtf3zyWKYGuT7QsIbm2GBmx4IxFvW
         /c3FRgCjVuWinxpRIZO3wchRd/zqO85UvR8o9TLJSmldHzqIGpqe8Z0S4eeyfrBI4mAH
         I8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=wZpT6T+fhSX11iKtQ6864FN/R474hCm4mU8x3lz89UA=;
        b=BlbP3JjQc4Wu9Mlcnnxb4WgzmL8isr6OqWFSHyeMM9knsZO4uoD/7mKor2hD3UdV8C
         yD7wEITwU8QHW1qIu3Y3RYpbqzlG2TIodPkzv7RoHuGwGuJs3hDc6XXRZ66owecCCoZC
         V+DeLwiF3zqoTTHBPf+gf8GqH2nq4EA1tBTD4Kb5A6d31cFXG4OZQCIGTDQtZCsxxgmy
         Q5RGKOQwZ+vyzo53lQRSejqraCx26sttVTDoRb+cBpd6NJ1t8u3qGklBQHVPpTyuuAon
         22nOIvSa98Er9PE0z3vtE77PoLTn5B26fiE/xIJmWQTHeaBP9qPVMAP7iM8zPvMZNFa8
         ujJg==
X-Gm-Message-State: AOAM531Vk7v6Tlf3i83I2S7c8oFokPZ46PxuFbueSWH38u5apw1Ei4qy
        x3f6AO4cpFs/3mq6R2CkI8bQzijViqjexGxTvU8mYf6zbtoLJQ==
X-Google-Smtp-Source: ABdhPJxfvviHVKJ0+x34xHWr7MJgTLOzL3sxSA7TBpOeiyoRGYjt26vmGwUqQ2b1Jp+2svZC31RR5FK9f8o52c52eOg=
X-Received: by 2002:a37:a9d3:: with SMTP id s202mr7819026qke.482.1634023508037;
 Tue, 12 Oct 2021 00:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJOps0smzC980mxpwqCtxbjCwzzU0ur4tm_f=mGH8t1PLPjPNA@mail.gmail.com>
 <SI2PR03MB616766BD1A04F4D32B9A56A090B69@SI2PR03MB6167.apcprd03.prod.outlook.com>
 <CAHb3i=t6gCr8TwyZ-wPz26q1Ubz38qVuPyRDkPcVHAQFcmF_ag@mail.gmail.com>
In-Reply-To: <CAHb3i=t6gCr8TwyZ-wPz26q1Ubz38qVuPyRDkPcVHAQFcmF_ag@mail.gmail.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 12 Oct 2021 10:24:57 +0300
Message-ID: <CAHb3i=tCQorVyG0UvbnLt=CcxcUdn=-WDosaJvLracwkGEg+tA@mail.gmail.com>
Subject: Re: [RFC Patch 2/2] add npcm7xx debug counters as sysfs attributes
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 12, 2021 at 10:09 AM Tali Perry <tali.perry1@gmail.com> wrote:

> On Tuesday, October 12, 2021 4:08 AM Sui Chen <suichen@google.com> wrote:
>
> This change adds npcm7xx debug counters as sysfs attributes using the i2c_adapter_stats_register_counter function.
>
> Signed-off-by: Sui Chen <suichen@google.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9b..def044207cae2 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2224,6 +2224,14 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>   debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>   debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
>
> + /* register debug counters in sysfs */
> + i2c_adapter_stats_register_counter(&bus->adap, "ber_cnt",
> + &bus->ber_cnt); i2c_adapter_stats_register_counter(&bus->adap,
> + "nack_cnt", &bus->nack_cnt);
> + i2c_adapter_stats_register_counter(&bus->adap, "rec_succ_cnt",
> &bus->rec_succ_cnt);
> + i2c_adapter_stats_register_counter(&bus->adap, "rec_fail_cnt",
> &bus->rec_fail_cnt);
> + i2c_adapter_stats_register_counter(&bus->adap, "timeout_cnt",
> &bus->timeout_cnt);
> + i2c_adapter_stats_register_counter(&bus->adap, "i2c_speed",
> + &bus->bus_freq);
> +
>   bus->debugfs = d;
>  }
>
> --
> 2.33.0.882.g93a45727a2-goog
>

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

Thanks for this patch!

Tali Perry
Nuvoton
