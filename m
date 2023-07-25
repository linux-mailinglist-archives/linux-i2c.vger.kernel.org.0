Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D1A7624C1
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 23:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjGYVsm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 17:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjGYVsl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 17:48:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F5910D1;
        Tue, 25 Jul 2023 14:48:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EB8061909;
        Tue, 25 Jul 2023 21:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FD3C433C7;
        Tue, 25 Jul 2023 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690321719;
        bh=vXE3L5/wt5UMDFv+0O0NtUlZ1MnJHBYI0OwEVAwTDcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BlbENO1XJuck7sNEHXDVBl8iW+SuTSYhZWrzOiyYlBGRK5RoKbgfwb6fC8oewSa2F
         gqjJUwqpIA7UN299GQUs5YP4Bf33zD0rgOSMXFEElA5fcQHfL+odcR0tYot9Kp40J6
         fYUdgWomt4BOVHbu4Iol6Ka/33n2a005A1H0jq444zVi/8R4c9FuG6+6J4d6Vy1ucU
         637VxSK9NzndbShaQnfLQDr2sNE8QCVCbjusyOeKjRk8mmBAb0cD7Y6lHDXuMr/X7s
         c0C4GfeeOJ9e1L4MIYz3IAKBmg+07NlVD1sRiNs0nRXZH2mNL32GMtgiHkPQE/4snk
         V9AkZQDZ3XO1g==
Date:   Tue, 25 Jul 2023 23:48:36 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 3/9] i2c: designware: Align dw_i2c_of_configure() with
 i2c_dw_acpi_configure()
Message-ID: <20230725214836.dbussnrimoykudyw@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725143023.86325-4-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jul 25, 2023 at 05:30:17PM +0300, Andy Shevchenko wrote:
> For the sake of consistency align dw_i2c_of_configure() with
> i2c_dw_acpi_configure() and rename the former to i2c_dw_of_configure().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index c60e55b8398e..d35a6bbcb6fb 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -132,9 +132,9 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
>  	return 0;
>  }
>  
> -static int dw_i2c_of_configure(struct platform_device *pdev)
> +static void i2c_dw_of_do_configure(struct dw_i2c_dev *dev, struct device *device)
>  {
> -	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
> +	struct platform_device *pdev = to_platform_device(device);
>  
>  	switch (dev->flags & MODEL_MASK) {
>  	case MODEL_MSCC_OCELOT:
> @@ -145,8 +145,12 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
>  	default:
>  		break;
>  	}
> +}
>  
> -	return 0;
> +static void i2c_dw_of_configure(struct dw_i2c_dev *dev)
> +{
> +	if (dev_of_node(dev->dev))
> +		i2c_dw_of_do_configure(dev, dev->dev);

You could add this check above and avoid this micro-if-functions.

	if (!dev_of_node(dev->dev))
		return;

up to you...

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

>  }
>  
>  static const struct of_device_id dw_i2c_of_match[] = {
> @@ -162,10 +166,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
>  	return -ENODEV;
>  }
>  
> -static inline int dw_i2c_of_configure(struct platform_device *pdev)
> -{
> -	return -ENODEV;
> -}
> +static inline void i2c_dw_of_configure(struct dw_i2c_dev *dev) { }
>  #endif
>  
>  static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
> @@ -311,9 +312,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	i2c_dw_adjust_bus_speed(dev);
>  
> -	if (pdev->dev.of_node)
> -		dw_i2c_of_configure(pdev);
> -
> +	i2c_dw_of_configure(dev);
>  	i2c_dw_acpi_configure(dev);
>  
>  	ret = i2c_dw_validate_speed(dev);
> -- 
> 2.40.0.1.gaa8946217a0b
> 
