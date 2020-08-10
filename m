Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EAD240D25
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 20:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgHJSsA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 14:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgHJSr7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Aug 2020 14:47:59 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D0BC061787
        for <linux-i2c@vger.kernel.org>; Mon, 10 Aug 2020 11:47:59 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id s16so7570314qtn.7
        for <linux-i2c@vger.kernel.org>; Mon, 10 Aug 2020 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5nwMnMw3DbCMTn2Fuh9eAKa97/L+CWpRN1IQSKfIrY8=;
        b=MH2gaLrd+ufZ8bGh/fpu4X/Fn6WrIMiNmClU1rLt2mwix16/dTxs5cvPwyjuWaZAv9
         ny8pcHOpdZmbrUMgAk2WpNSV3ClKUu280iuq0GCyH0opTG2DXOf5/MMeNM4y2zEX8MyO
         33K5A5v6VJjE3i5tb62cCOeHWnBvFtJh+eTJzeAABy9TPV5RhQSXdinWMpcE1+PgeInS
         yTpaN7g9UexxUps7yD0kDaG4wZLrVrIr/NBqPGwnV3IGaalDqL2OeKd5GHFZ9pmszeG8
         6VNyA6FQPcpGQT+eRxsYuelA2j+R6xZLBPFMcrCP6sHix4PoSt24AOWRq4KODFO2wJPL
         jcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5nwMnMw3DbCMTn2Fuh9eAKa97/L+CWpRN1IQSKfIrY8=;
        b=r9k/+jXDYkK5rL6tsfzZlKm2NHftuSg4tnsctTKDfaWc6Uc4lxzO6uNHdAAhrptbf+
         MYT6ln/LVGo334GHygM0cjn5UpAtMnzEzjMGhe9kG6mP0HmOOpfSRB9dfld5g2OVeLk6
         wmXxNS7jQGymhzdCmzuY8lBZN4bf1eugkXnzmLlu12GblUFJcChrH7VwCCI2joz4yqrt
         FTaL6+Zh0nhy+VmRPy5S4aDUtBJgoPqUk0AMBOl5Z8Edc3hOQGuqmwdocRvoVzUjDqO/
         MNR00xsCPfrP6WTO0DeaNf3efdiE+ynFeOVsN0Wa4T/ZOw661K3eBiwiVPNDiwKUDNJu
         6xoQ==
X-Gm-Message-State: AOAM533gh3HpURFc+B+P5likf4mItoDYCLC6UftGdccdgczr9362qw0T
        utJhSRPqx1Tl9kIvKaXw+Z1GlhvhQKkFO28ZfWOJXA==
X-Google-Smtp-Source: ABdhPJzUFIIB7zZacQjcyBgpXBijPyFsFhCW5bngLlBmE5TsUrCisTyt73lEUBKPvEnILxlmIjOz+SnNtKoGYxLdbac=
X-Received: by 2002:aed:21da:: with SMTP id m26mr29107739qtc.197.1597085277928;
 Mon, 10 Aug 2020 11:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200809172444.16019-1-steve@sk2.org>
In-Reply-To: <20200809172444.16019-1-steve@sk2.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 10 Aug 2020 20:47:47 +0200
Message-ID: <CAMpxmJXLELE7CmMpqvw_1jFJW80f_O2wQg08JAd0gv-XBrWq_Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: davinci: use simple i2c probe function
To:     Stephen Kitt <steve@sk2.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 9, 2020 at 7:24 PM Stephen Kitt <steve@sk2.org> wrote:
>
> The i2c probe functions here don't use the id information provided in
> their second argument, so the single-parameter i2c probe function
> ("probe_new") can be used instead.
>
> This avoids scanning the identifier tables during probes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
> Changes since v1:
>   - split into per-sub-architecture patches.
>
>  arch/arm/mach-davinci/board-dm644x-evm.c |  5 ++---
>  arch/arm/mach-davinci/board-dm646x-evm.c | 10 ++++------
>  2 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
> index a5d3708fedf6..d0dcf69cc76d 100644
> --- a/arch/arm/mach-davinci/board-dm644x-evm.c
> +++ b/arch/arm/mach-davinci/board-dm644x-evm.c
> @@ -548,8 +548,7 @@ static const struct property_entry eeprom_properties[] = {
>   */
>  static struct i2c_client *dm6446evm_msp;
>
> -static int dm6446evm_msp_probe(struct i2c_client *client,
> -               const struct i2c_device_id *id)
> +static int dm6446evm_msp_probe(struct i2c_client *client)
>  {
>         dm6446evm_msp = client;
>         return 0;
> @@ -569,7 +568,7 @@ static const struct i2c_device_id dm6446evm_msp_ids[] = {
>  static struct i2c_driver dm6446evm_msp_driver = {
>         .driver.name    = "dm6446evm_msp",
>         .id_table       = dm6446evm_msp_ids,
> -       .probe          = dm6446evm_msp_probe,
> +       .probe_new      = dm6446evm_msp_probe,
>         .remove         = dm6446evm_msp_remove,
>  };
>
> diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
> index 4600b617f9b4..2dce16fff77e 100644
> --- a/arch/arm/mach-davinci/board-dm646x-evm.c
> +++ b/arch/arm/mach-davinci/board-dm646x-evm.c
> @@ -160,8 +160,7 @@ static struct platform_device davinci_aemif_device = {
>  #define DM646X_EVM_ATA_PWD             BIT(1)
>
>  /* CPLD Register 0 Client: used for I/O Control */
> -static int cpld_reg0_probe(struct i2c_client *client,
> -                          const struct i2c_device_id *id)
> +static int cpld_reg0_probe(struct i2c_client *client)
>  {
>         if (HAS_ATA) {
>                 u8 data;
> @@ -197,7 +196,7 @@ static const struct i2c_device_id cpld_reg_ids[] = {
>  static struct i2c_driver dm6467evm_cpld_driver = {
>         .driver.name    = "cpld_reg0",
>         .id_table       = cpld_reg_ids,
> -       .probe          = cpld_reg0_probe,
> +       .probe_new      = cpld_reg0_probe,
>  };
>
>  /* LEDS */
> @@ -402,8 +401,7 @@ static struct snd_platform_data dm646x_evm_snd_data[] = {
>  #ifdef CONFIG_I2C
>  static struct i2c_client *cpld_client;
>
> -static int cpld_video_probe(struct i2c_client *client,
> -                       const struct i2c_device_id *id)
> +static int cpld_video_probe(struct i2c_client *client)
>  {
>         cpld_client = client;
>         return 0;
> @@ -424,7 +422,7 @@ static struct i2c_driver cpld_video_driver = {
>         .driver = {
>                 .name   = "cpld_video",
>         },
> -       .probe          = cpld_video_probe,
> +       .probe_new      = cpld_video_probe,
>         .remove         = cpld_video_remove,
>         .id_table       = cpld_video_id,
>  };
>
> base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
> --
> 2.20.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
