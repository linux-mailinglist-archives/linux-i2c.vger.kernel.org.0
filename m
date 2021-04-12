Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9828535C823
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 16:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242099AbhDLOEe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 10:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242098AbhDLOEd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 10:04:33 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFAAC061574;
        Mon, 12 Apr 2021 07:04:15 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id q189so3196744qka.8;
        Mon, 12 Apr 2021 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YGcJ8Y6LOarDep/sndJhluxp2qrMHexKKa0qdJeyBMw=;
        b=gSBE5nNF97S4kcrTMwf5oNwGE5yMv94C9sUWOCHK9Zdt0ykAKhhxHrBgrXmEFDpzGE
         O+WP9Zt76cuQ02+dlrgWbytcgDgAPvv3M8uN357N19L2GAHwXoyjMjZ3Ay25uetPdGUO
         hMZVQTidoUja8UqEXKZPe3DlicHLNopDH3disJBVRVZUsXNmjAya17xhtwQo6LogHZfh
         2Azefjm3xUMLATNVzvs15olASJ3P3Hivf9AjPdaIrAr2ZGyJt2/0dALJHdd51jrT1Box
         swMb+0plrsrFEa092JTDbArn7tsLvI47wMTz7ERPpPip9m8v48pwrvjEkfD7vmYfSMQq
         rh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YGcJ8Y6LOarDep/sndJhluxp2qrMHexKKa0qdJeyBMw=;
        b=Gnx78zMkNk4FE9PS/WCpDHXinMRzYHUJfoPBTtmlReBfAd+3jjTdMpIgQmSsN6IcwO
         ADq6AJ3zEFXuhVw0OkYmEg85jSAE7ABmVijbPo1Umzl43BizoYvyKaaWUkNmf3mHwgEQ
         CQ0tAK2R02eV+97QL5f6WILIoeQp+WnphUODKO7criCFVaYwXCSlCHLAOfl2R7a8MMtJ
         lpl3Dy9boVHmkWaBWDH0uQpOo8SuLorrSs+oG4/6w0Gzcw1SijRO1e9qmPoRzOZ8qpun
         Lx2MoSVU/tVtrE1Ro8R0toQJzkNgA5DgYswX+TxypXRN8KV71v2BEyE9/NdEydU6RQ5x
         zJGQ==
X-Gm-Message-State: AOAM530+EN6jeLt4Btje/hBtgPLwOG4IXN+nBNXnsJjK1HbyFFlDdG/d
        FOTk4wyupf95Ym3BgxKzRFh2YvGRyJAxaC7cAck=
X-Google-Smtp-Source: ABdhPJwOcjL+ZbvY9JaLzWokJnJejixRhklO5V59RasqLwsA7xOOR6LsErgQP8O/+6Ke2btIN380LSo5Nal/BtnzSEw=
X-Received: by 2002:a05:620a:798:: with SMTP id 24mr27556352qka.493.1618236254537;
 Mon, 12 Apr 2021 07:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210410035044.11418-1-cuibixuan@huawei.com>
In-Reply-To: <20210410035044.11418-1-cuibixuan@huawei.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Mon, 12 Apr 2021 22:04:16 +0800
Message-ID: <CADBw62pnn9R=4DhPuZm9z3O20Mbirr6zJn0d4Di9Jq0F9gxYTg@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: sprd: Add missing MODULE_DEVICE_TABLE
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Linhua Xu <linhua.xu@unisoc.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 10, 2021 at 11:51 AM Bixuan Cui <cuibixuan@huawei.com> wrote:
>
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/i2c/busses/i2c-sprd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 2917fecf6c80..9f77d1ddbaf8 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -640,6 +640,7 @@ static const struct of_device_id sprd_i2c_of_match[] = {
>         { .compatible = "sprd,sc9860-i2c", },
>         {},
>  };
> +MODULE_DEVICE_TABLE(of, sprd_i2c_of_match);
>
>  static struct platform_driver sprd_i2c_driver = {
>         .probe = sprd_i2c_probe,
>


-- 
Baolin Wang
