Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6862329F83
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2019 22:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391755AbfEXUBi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 May 2019 16:01:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41687 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391669AbfEXUBi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 May 2019 16:01:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id l25so9764229otp.8;
        Fri, 24 May 2019 13:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHojS6CxTbfNN1lxBjQLh832vFhB7+3k4jCcVBGUCwo=;
        b=ejkNcbw1bQFBLEnFnDkIxXEI0u0HP7oz5bcc1EnQ+n94Z72O6xJzE8EuzHq+JdeSMk
         p19cyfGthHzSF4yHlB8Ele/gjquVnEk/9YTyp8PVGMegFHF90VbRGOLjSxHxF1vOCrDp
         jjWgh8B+aE26+SyApL7pIGvJYt42K89NqUr5gsBDiq9XjNY2zwBdWJRfaT1FCMAMMW8h
         obgMmSr7UbIVkQurVpvrvdfX1JTTBc0whdnKpgfnKAjC5XDCVy5Unke95FJ/SnlpCJ6D
         Hg+WoYVvllJbpiGZ4UWGAHKr6tC7t/Bdt/pRpGrrAp1eZgYcXZaDSY3W/PTTwzpzItbm
         LZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHojS6CxTbfNN1lxBjQLh832vFhB7+3k4jCcVBGUCwo=;
        b=DnUMhbTt5VOV6kuHIBMKWSmiQ9kFLskQUOY5jayl85X5E11L19doUkjmW+sEyi61GJ
         RRe/TBD6s+BbK5B8iAeX1GE6XadpPqUW4g6yHC8Ey9gSS3+Z4etqR8hNfh3OUoAbtFyb
         GO9VDeCg+UQXRCog3Va0wlTFWS2YVuDaF+wT4NSHx7x1k62+nnn1jAVkNB5BIQD6vo3j
         292SS+jH8zinv11tFdZH2a8p0zl1r2tdfigWdAdXocTGhfxiEJUw82bKQzPxn5w5DNkJ
         aLIPofCqYGxBdN3oDUXNs4N5gVKe4Ie/U2Gu6VUvil5juQKklN+RnWMK3qcNHSpufdbb
         vWmQ==
X-Gm-Message-State: APjAAAXnGrO/9rJ+B5/DtYDiWVMTgSRnPGG5hEcNfi15c0CeJ8V627c9
        aRlvPQnwk+NI14CWKjAkEQ9frvfN0uQFdONKYyzOIOoz
X-Google-Smtp-Source: APXvYqzSMTnEHaKwB73h2CFY4FSicOsI1MybuGKVOLrzVAipkF3fG84GytPKtPzLmZN/FtCKvVZXpyhhocFTfUBiZlE=
X-Received: by 2002:a9d:7f8b:: with SMTP id t11mr107728otp.110.1558728097573;
 Fri, 24 May 2019 13:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190524030514.14082-1-qiang.zhao@nxp.com>
In-Reply-To: <20190524030514.14082-1-qiang.zhao@nxp.com>
From:   Yang Li <pku.leo@gmail.com>
Date:   Fri, 24 May 2019 15:01:26 -0500
Message-ID: <CADRPPNQjgDRPDzA31c6qQ=ZynYQjHTHNOJQ+_bFGr37SPuYApw@mail.gmail.com>
Subject: Re: [PATCH] i2c: layerscape: use PIO when fail to request dma channel
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 23, 2019 at 10:08 PM Qiang Zhao <qiang.zhao@nxp.com> wrote:
>
> When fail to request DMA TX/RX channel, use PIO instead for layerscape.

I know that there is a problem that the i2c will fail to probe when
edma driver is not configured.  But this shouldn't be a Layerscape
specific issue.  We don't have proper fix yet, but we have a
workaround which is enable the EDMA driver in the defconfig.
Disabling deferred probe just for Layerscape is not a proper fix
either as this is not specific to Layerscape.

>
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 98b278613cf2..39a5ab4cf332 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -347,9 +347,13 @@ static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>
>         dma->chan_tx = dma_request_chan(dev, "tx");
>         if (IS_ERR(dma->chan_tx)) {
> +#ifdef CONFIG_ARCH_LAYERSCAPE
> +               dev_dbg(dev, "can't request DMA tx channel\n");
> +#else
>                 ret = PTR_ERR(dma->chan_tx);
>                 if (ret != -ENODEV && ret != -EPROBE_DEFER)
>                         dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
> +#endif
>                 goto fail_al;
>         }
>
> @@ -366,9 +370,13 @@ static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>
>         dma->chan_rx = dma_request_chan(dev, "rx");
>         if (IS_ERR(dma->chan_rx)) {
> +#ifdef CONFIG_ARCH_LAYERSCAPE
> +               dev_dbg(dev, "can't request DMA rx channel\n");
> +#else
>                 ret = PTR_ERR(dma->chan_rx);
>                 if (ret != -ENODEV && ret != -EPROBE_DEFER)
>                         dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
> +#endif
>                 goto fail_tx;
>         }
>
> @@ -396,6 +404,9 @@ static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>         dma_release_channel(dma->chan_tx);
>  fail_al:
>         devm_kfree(dev, dma);
> +#ifdef CONFIG_ARCH_LAYERSCAPE
> +       dev_info(dev, "can't use DMA, using PIO instead.\n");
> +#endif
>         /* return successfully if there is no dma support */
>         return ret == -ENODEV ? 0 : ret;
>  }
> --
> 2.17.1
>


-- 
- Leo
