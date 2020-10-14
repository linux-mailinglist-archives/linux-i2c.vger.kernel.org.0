Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3385228DC6F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgJNJJh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgJNJJh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 05:09:37 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304A6C04585E;
        Tue, 13 Oct 2020 22:30:54 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id m65so1494768qte.11;
        Tue, 13 Oct 2020 22:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74gtbcSoQxBU/Zm+4MVD4nGSWX1uGiDbcEQFSH2Vxhw=;
        b=W1bbLqtMmSL+ANSOQe8P5DwLGGiKKtcj7T8ijYHZ+Cjn35VQJt1HwpuWShCRVQQHDr
         IZc1oYF2nVGSp8zrVWaPHXXaqWNiWZROH7EvKmO4qSK7YfIWL8MGSNpN86/pjw/F1+Sx
         Pbt1X2n0rA5hwuFs4X3TC/ar8/JQa4xo5EWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74gtbcSoQxBU/Zm+4MVD4nGSWX1uGiDbcEQFSH2Vxhw=;
        b=rKlQPEZBzdovP6Cpv6L+ZyTbYWjvhTpfSWVNhKWuYPxnYby0kZBPm2Rqhbht7/zgt2
         Ie2AgbrkLGnphq0zoHYOBJN4pW6LQo3SMZLWuE0D1rkHKsS2asoDmel5qZB2VM1iXRvz
         XOt7guPi49wPkoyumYjtDgJtlPqkcyLUpGl1+kv8+qDbyv9w2KXoRCsHZeMGzJt8E6vr
         t2F620jOVl8y0iM3YxQVMcwAFMrbOmv0tpXavSXqdMEST1eO5ngfJ4dC+OzKzUItDdaL
         huokNguTW1bA0XaDlpsCQbxPLYSdIY2PZmZiYSY8B60jRn5waCo0uqlrTPlxm26WW+w8
         0f4Q==
X-Gm-Message-State: AOAM533YwofzzJ7L3ZfSrLaLHeFIQrviiZ1Udg96zHu14VCzxDw9RfR1
        JpIyM08siwsHZhspNxFSAO7k3EzlWeGFQhOe7DM=
X-Google-Smtp-Source: ABdhPJwFSofO1DnV5P1Q+GhVV9xWH5KVbG2AZVq2YXBrwkOok/555qf+pK9DhGN6Re52aadNtaTeBFn/Zu46YqnpXHg=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr3268208qta.176.1602653453244;
 Tue, 13 Oct 2020 22:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201013100314.216154-1-tali.perry1@gmail.com>
In-Reply-To: <20201013100314.216154-1-tali.perry1@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 14 Oct 2020 05:30:41 +0000
Message-ID: <CACPK8XfoBcQpxaMHWcMrcwU3KtKi8KLNXDP5Nu-5Feo8V+7VFw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: Support changing bus speed using debugfs.
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     wsa@kernel.org, andriy.shevchenko@linux.intel.com, xqiu@google.com,
        Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 13 Oct 2020 at 10:03, Tali Perry <tali.perry1@gmail.com> wrote:
>
> Systems that can dynamically add and remove slave devices
> often need to change the bus speed in runtime.
> This patch expose the bus frequency to the user.
> This feature can also be used for test automation.
>
> --
> v2 -> v1:
>         - Fix typos.
>         - Remove casting to u64.
>
> v1: initial version
>
> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'm not sure that the Fixes tag is quite correct, but it's no biggie.


> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9..633ac67153e2 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
>  /* i2c debugfs directory: used to keep health monitor of i2c devices */
>  static struct dentry *npcm_i2c_debugfs_dir;
>
> +static int i2c_speed_get(void *data, u64 *val)
> +{
> +       struct npcm_i2c *bus = data;
> +
> +       *val = bus->bus_freq;
> +       return 0;
> +}
> +
> +static int i2c_speed_set(void *data, u64 val)
> +{
> +       struct npcm_i2c *bus = data;
> +       int ret;
> +
> +       if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
> +               return -EINVAL;
> +
> +       if (val == bus->bus_freq)
> +               return 0;
> +
> +       i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +       npcm_i2c_int_enable(bus, false);
> +
> +       ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> +
> +       i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +       if (ret)
> +               return -EAGAIN;
> +
> +       return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
> +
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>                                   struct npcm_i2c *bus)
>  {
> @@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>         debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
>         debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>         debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +       debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
>
>         bus->debugfs = d;
>  }
>
> base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
> --
> 2.22.0
>
