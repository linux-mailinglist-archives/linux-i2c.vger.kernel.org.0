Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB286E9692
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Apr 2023 16:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjDTOES (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 10:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjDTOES (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 10:04:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B478E211C;
        Thu, 20 Apr 2023 07:04:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F181618A0;
        Thu, 20 Apr 2023 14:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E96C433D2;
        Thu, 20 Apr 2023 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681999451;
        bh=DKXKKNzEalaFBkkihjSMZq+RvsASzGcDEcH47uE9AYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oBmM9k13zDUPAdsg//VtLRSGpfj0tQr2v3AlXFCbQGggXl/DkSOT6J7rVERFRk/Tm
         FAZm65zkPjhESgz9Wt0sYCVmyi+CHn90SLjbmFX6hRWvFryL5Vum6ak2piaYIsPECT
         9gOBstmPrUZxPTeP5vSrtmdNadUXhEvuQQiDDu5zZubUAMzC5jHNUMp2QuOw/3FT1Q
         Uscg8X7RCiT6FaijaLTqLy+JMAXmvCHMnZ9wmw8pfaNCn8FwcnvLepr4ndPlci74Co
         tN85M0v7ldp2EZ+sPI5yVo7zwD0w+4fqBCHWEeeZj9rGJkmHmNfUN9ImTeFRTexU1Z
         7IIigbC+cdBMA==
Date:   Thu, 20 Apr 2023 15:04:06 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v5 6/6] mfd: tps6586x: register restart handler
Message-ID: <20230420140406.GH996918@google.com>
References: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
 <20230327-tegra-pmic-reboot-v5-6-ab090e03284d@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327-tegra-pmic-reboot-v5-6-ab090e03284d@skidata.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Apr 2023, Benjamin Bara wrote:

> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> There are a couple of boards which use a tps6586x as
> "ti,system-power-controller", e.g. the tegra20-tamonten.dtsi.
> For these, the only registered restart handler is the warm reboot via
> tegra's PMC. As the bootloader of the tegra20 requires the VDE, it must
> be ensured that VDE is enabled (which is the case after a cold reboot).
> For the "normal reboot", this is basically the case since 8f0c714ad9be.
> However, this workaround is not executed in case of an emergency restart.
> In case of an emergency restart, the system now simply hangs in the
> bootloader, as VDE is not enabled (because it is not used).
> 
> The TPS658629-Q1 (unfortunately the only TPS6586x with public data sheet)
> provides a SOFT RST bit in the SUPPLYENE reg to request a (cold) reboot,
> which takes at least 10ms (as the data sheet states).
> This avoids the hang-up.
> 
> Tested on a TPS658640.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index 226e856e34e0..f7665b368071 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -30,6 +30,7 @@
>  #include <linux/mfd/tps6586x.h>
>  
>  #define TPS6586X_SUPPLYENE	0x14
> +#define SOFT_RST_BIT		BIT(0)
>  #define EXITSLREQ_BIT		BIT(1)
>  #define SLEEP_MODE_BIT		BIT(3)
>  
> @@ -475,6 +476,24 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
>  	return notifier_from_errno(-ETIME);
>  }
>  
> +static int tps6586x_restart_handler(struct sys_off_data *data)
> +{
> +	int ret;
> +
> +	/* tps6586x only provides a hard/cold reboot, skip others. */

TPS6586x

> +	if (data->mode != REBOOT_UNDEFINED && data->mode != REBOOT_COLD &&
> +	    data->mode != REBOOT_HARD)
> +		return NOTIFY_DONE;
> +
> +	/* bring pmic into HARD REBOOT state. this takes at least 10ms. */

Same as the other patch.

> +	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
> +	if (ret)
> +		return notifier_from_errno(ret);
> +
> +	mdelay(20);

Why 20 here and 50 in the other patch?

> +	return notifier_from_errno(-ETIME);
> +}
> +
>  static void tps6586x_print_version(struct i2c_client *client, int version)
>  {
>  	const char *name;
> @@ -575,6 +594,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
>  			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
>  			goto err_add_devs;
>  		}
> +
> +		ret = devm_register_restart_handler(&client->dev, &tps6586x_restart_handler,
> +						    NULL);
> +		if (ret) {
> +			dev_err(&client->dev, "register restart handler failed: %d\n", ret);
> +			goto err_add_devs;
> +		}
>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]
