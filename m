Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5782473849
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 00:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240247AbhLMXNW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 18:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbhLMXNW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Dec 2021 18:13:22 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DA2C061574
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 15:13:22 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id l8so16877301qtk.6
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 15:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rm6fU+94SIYDw6kiSkSUR3+pZk6SD9v2+b8qifrz4VY=;
        b=HChXMZ7fDgzOvcMZE9CYbc9QGKjbFcI+EQSDArbVK8+F4AdqrFnu5T/2Td3irKLYpY
         rAsAstLj9kfKNTMZOii3HWVsAq59dV+2FRoGt4HMuhuL9SKgYxPfCPebSVztZrb49LYF
         MI+JFcm+rpVyPejGnw3GDhXW4cMAWjRHKDLFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rm6fU+94SIYDw6kiSkSUR3+pZk6SD9v2+b8qifrz4VY=;
        b=m5m2B+93k0FK6Fzy3MRAQNqjsHC0xRkX4kVGxMkfcYIC/xxuPmKBXjz0B5VB3Cflea
         9JixpF177HPJlrIotXNGjhSHkSaUcrUXmJzIU/vxpVls1mmLKkTY84u56nW+4QhLvPhq
         RbAQ/0XqF8oivLH1RsPDJj3CBmwb9Pj/SzdhaYCVziVhOgEhgwr4xYagnancerxwBSKh
         5O3cuIF57ptsL5fzuLKSfm6aaCS3zT3TOW/N1k44CSA4USaKcVZuBPl1xMS25/lw783n
         AgKpxxGYdmI6EY6HRuXHv52JnyD1q4S9DdYFw98o7fhVTD/Vkune1AiRQydsjyAjr8/7
         Iwlw==
X-Gm-Message-State: AOAM5322UgOB1n/yatu2v2X5pe/2juJ8RBzErH31M+qu2B6Ml1bjycdT
        zacGcSf347glqIyFTWINeBNLpjO1v7kpg11lg5wIRNTG
X-Google-Smtp-Source: ABdhPJzKq8yZS7tDH5YvbyxM31CVgZLw5a1+CNXadyx+L9RU8i15HPjQY7CXAf1XHc0iz5gm4/AlyAAf7d28lnLxqm8=
X-Received: by 2002:a05:622a:588:: with SMTP id c8mr1786532qtb.108.1639437201372;
 Mon, 13 Dec 2021 15:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20211207141722.440213-1-thierry.reding@gmail.com>
In-Reply-To: <20211207141722.440213-1-thierry.reding@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 13 Dec 2021 23:12:55 +0000
Message-ID: <CACPK8XfKp1fDLjVPHb0bO-fi2JryOP5H6Jh1bmovt68Qne+D9Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Remove unused includes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 13 Dec 2021 at 22:22, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> No symbols from the linux/irqchip/chained_irq.h and linux/irqdomain.h
> headers are used in the driver, so they can be removed.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Agreed, it looks like these were added in the initial commit and never used.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 67e8b97c0c95..771e53d3d197 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -16,8 +16,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> -#include <linux/irqchip/chained_irq.h>
> -#include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> --
> 2.33.1
>
