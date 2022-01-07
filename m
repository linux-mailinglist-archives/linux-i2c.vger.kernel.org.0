Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65570487C12
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 19:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiAGSUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 13:20:06 -0500
Received: from forward107p.mail.yandex.net ([77.88.28.115]:52960 "EHLO
        forward107p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230446AbiAGSUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jan 2022 13:20:05 -0500
X-Greylist: delayed 161625 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jan 2022 13:20:05 EST
Received: from iva8-6b29e352664c.qloud-c.yandex.net (iva8-6b29e352664c.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:5b2e:0:640:6b29:e352])
        by forward107p.mail.yandex.net (Yandex) with ESMTP id A0BF5556C6B9;
        Fri,  7 Jan 2022 21:20:03 +0300 (MSK)
Received: from iva1-dcde80888020.qloud-c.yandex.net (iva1-dcde80888020.qloud-c.yandex.net [2a02:6b8:c0c:7695:0:640:dcde:8088])
        by iva8-6b29e352664c.qloud-c.yandex.net (mxback/Yandex) with ESMTP id euR5bt0U3x-K3fOpt58;
        Fri, 07 Jan 2022 21:20:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1641579603;
        bh=OrWPYp0vmxROxPJySTPjYtjZfWYS3Oa7auboC1JAC48=;
        h=In-Reply-To:References:Date:To:From:Subject:Message-ID;
        b=W64bN0WTTVFJoVj7rHUT2ldQMbxKMbJ4uFZBA0mVOVb50YdbPw5uDPvc4kdql1yEO
         p/Wk3Vv0Y1JRNtJ2SRQq8I3tiocatscvK6u5BxwiZHB99ieZ5CVaCj5SfreCEfu8YM
         rR5JNTC8a7DZVhbr/Ymfe+ovlI3HCg+Q0160UzW8=
Authentication-Results: iva8-6b29e352664c.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva1-dcde80888020.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id VkaxZNamsB-K2PaYHfr;
        Fri, 07 Jan 2022 21:20:02 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <5849ab287df1b06e141d87bbffdbcd627e999578.camel@yandex.ru>
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in
 adapter"
From:   Konstantin Kharlamov <hi-angel@yandex.ru>
To:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        bibby.hsieh@mediatek.com, amd-gfx@lists.freedesktop.org
Date:   Fri, 07 Jan 2022 21:20:02 +0300
In-Reply-To: <20220106122452.18719-1-wsa () kernel ! org>
References: <20220106122452.18719-1-wsa () kernel ! org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you! I tested it (had to resolve a small conflict), works for me. So, in
case you need it, the patch is

	Tested-by: Konstantin Kharlamov <hi-angel@yandex.ru>

By the way, shouldn't the patch include a field 

	Cc: <stable@vger.kernel.org> # 5.14+

?

P.S.: sorry, for all mangled up CC fields. For some reason I didn't get your
email, I found this patch in the archive. And the mbox that archive provides
breaks all TO and CC fields, so I manually restored addresses that I have.

On Thu, 2022-01-06 at 12:24 +0000, Wolfram Sang wrote:
> This largely reverts commit 5a7b95fb993ec399c8a685552aa6a8fc995c40bd. It
> breaks suspend with AMD GPUs, and we couldn't incrementally fix it. So,
> let's remove the code and go back to the drawing board. We keep the
> header extension to not break drivers already populating the regulator.
> We expect to re-add the code handling it soon.
> 
> Reported-by: "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
> Link: https://lore.kernel.org/r/1295184560.182511.1639075777725@mail.yahoo.com
> Reported-by: Konstantin Kharlamov <hi-angel@yandex.ru>
> Link:
> https://lore.kernel.org/r/7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru
> BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1850
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
> 
> So far, I tested it on a Renesas R-Car M3-N board verifying that I2C
> still works. I'll apply it to my for-next branch right away to get the
> buildbots involved as well. But I am still open for comments until I
> apply it to my for-current branch, probably tomorrow.
> 
>  drivers/i2c/i2c-core-base.c | 95 -------------------------------------
>  1 file changed, 95 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index f193f9058584..73253e667de1 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -466,14 +466,12 @@ static int i2c_smbus_host_notify_to_irq(const struct
> i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> -       struct i2c_adapter      *adap;
>         struct i2c_driver       *driver;
>         int status;
>  
>         if (!client)
>                 return 0;
>  
> -       adap = client->adapter;
>         client->irq = client->init_irq;
>  
>         if (!client->irq) {
> @@ -539,14 +537,6 @@ static int i2c_device_probe(struct device *dev)
>  
>         dev_dbg(dev, "probe\n");
>  
> -       if (adap->bus_regulator) {
> -               status = regulator_enable(adap->bus_regulator);
> -               if (status < 0) {
> -                       dev_err(&adap->dev, "Failed to enable bus
> regulator\n");
> -                       goto err_clear_wakeup_irq;
> -               }
> -       }
> -
>         status = of_clk_set_defaults(dev->of_node, false);
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
> @@ -605,10 +595,8 @@ static int i2c_device_probe(struct device *dev)
>  static void i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = to_i2c_client(dev);
> -       struct i2c_adapter      *adap;
>         struct i2c_driver       *driver;
>  
> -       adap = client->adapter;
>         driver = to_i2c_driver(dev->driver);
>         if (driver->remove) {
>                 int status;
> @@ -623,8 +611,6 @@ static void i2c_device_remove(struct device *dev)
>         devres_release_group(&client->dev, client->devres_group_id);
>  
>         dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> -       if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
> -               regulator_disable(adap->bus_regulator);
>  
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -634,86 +620,6 @@ static void i2c_device_remove(struct device *dev)
>                 pm_runtime_put(&client->adapter->dev);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int i2c_resume_early(struct device *dev)
> -{
> -       struct i2c_client *client = i2c_verify_client(dev);
> -       int err;
> -
> -       if (!client)
> -               return 0;
> -
> -       if (pm_runtime_status_suspended(&client->dev) &&
> -               client->adapter->bus_regulator) {
> -               err = regulator_enable(client->adapter->bus_regulator);
> -               if (err)
> -                       return err;
> -       }
> -
> -       return pm_generic_resume_early(&client->dev);
> -}
> -
> -static int i2c_suspend_late(struct device *dev)
> -{
> -       struct i2c_client *client = i2c_verify_client(dev);
> -       int err;
> -
> -       if (!client)
> -               return 0;
> -
> -       err = pm_generic_suspend_late(&client->dev);
> -       if (err)
> -               return err;
> -
> -       if (!pm_runtime_status_suspended(&client->dev) &&
> -               client->adapter->bus_regulator)
> -               return regulator_disable(client->adapter->bus_regulator);
> -
> -       return 0;
> -}
> -#endif
> -
> -#ifdef CONFIG_PM
> -static int i2c_runtime_resume(struct device *dev)
> -{
> -       struct i2c_client *client = i2c_verify_client(dev);
> -       int err;
> -
> -       if (!client)
> -               return 0;
> -
> -       if (client->adapter->bus_regulator) {
> -               err = regulator_enable(client->adapter->bus_regulator);
> -               if (err)
> -                       return err;
> -       }
> -
> -       return pm_generic_runtime_resume(&client->dev);
> -}
> -
> -static int i2c_runtime_suspend(struct device *dev)
> -{
> -       struct i2c_client *client = i2c_verify_client(dev);
> -       int err;
> -
> -       if (!client)
> -               return 0;
> -
> -       err = pm_generic_runtime_suspend(&client->dev);
> -       if (err)
> -               return err;
> -
> -       if (client->adapter->bus_regulator)
> -               return regulator_disable(client->adapter->bus_regulator);
> -       return 0;
> -}
> -#endif
> -
> -static const struct dev_pm_ops i2c_device_pm = {
> -       SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> -       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> -};
> -
>  static void i2c_device_shutdown(struct device *dev)
>  {
>         struct i2c_client *client = i2c_verify_client(dev);
> @@ -773,7 +679,6 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> -       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>  

