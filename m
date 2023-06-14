Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56E2730AD2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 00:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbjFNWhR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 18:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjFNWhQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 18:37:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8971A2695
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 15:37:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DAC3640D0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 22:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02962C433C8;
        Wed, 14 Jun 2023 22:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686782234;
        bh=tDLQzqjNkzIjU6E5pRGpFT/ZHAhWOJkfrFQPDVXR+iA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFplnqasLLA2JaHiH5YyCcAm8Xz/XCDEbXKNQHRM0EtA3SZ+90nM3p3Vc+vt9213+
         N4abn4UyDL9gGT+prH6DimZl30HlK+aXy20d8f5DabdCVR0nYo7lRWt9uc7G3Virf1
         Zd0FlGqQIgsEDsKtKnc1PKqHVNNw8xBwBMQDBvlKWjkmZPIMX/iAFrISuDZuJLUocQ
         kgeRpdwpWb2f7sS1M6vmqankSMrWQ4GqRMc3i2XV80sJYc/vLuiLdLC9O/nmGYx2EH
         u5twi6qM1ihmRWKl+vWwn60Nh0vkRbY/qQ1aoLLMhdVzE0G+BPSrX3bUHT0n+sVSDL
         tj64c+bpPp9pA==
Date:   Thu, 15 Jun 2023 00:37:11 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 4/4] i2c: i801: Switch to new macro
 DEFINE_SIMPLE_DEV_PM_OPS
Message-ID: <20230614223711.mh26wohdivz6rll5@intel.intel>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sat, Mar 04, 2023 at 10:37:34PM +0100, Heiner Kallweit wrote:
> By using the newer macro DEFINE_SIMPLE_DEV_PM_OPS we can get rid
> of the conditional compiling.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index e1350a8cc..bd2349768 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1800,7 +1800,6 @@ static void i801_shutdown(struct pci_dev *dev)
>  	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
> @@ -1821,9 +1820,8 @@ static int i801_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
> -static SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
>  
>  static struct pci_driver i801_driver = {
>  	.name		= DRV_NAME,
> @@ -1832,7 +1830,7 @@ static struct pci_driver i801_driver = {
>  	.remove		= i801_remove,
>  	.shutdown	= i801_shutdown,
>  	.driver		= {
> -		.pm	= &i801_pm_ops,
> +		.pm	= pm_sleep_ptr(&i801_pm_ops),

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
