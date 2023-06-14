Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD82F730A8C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 00:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbjFNWYo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 18:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjFNWYo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 18:24:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBBB2119
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 15:24:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E830F60B07
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 22:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DFFC433C0;
        Wed, 14 Jun 2023 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686781482;
        bh=qoa+VJi801V2D+8foVYekXDC3VkXd0IGRfPw1DddNTE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kj+kMqI7WC+anIi+xtPWMScaRAf+Jc9bp+RBbzCLQPOcbl7Lw94cxPDbY7pxXtKjD
         FUzekyAebHJHJumXR6sLMvI0y/NMN408GjbiByHVkZqpZhRcCGuBW3YTOYC24Klw+0
         FW3g5GiSxYsmj7Hq1lQJY2eUxni7SvatTpb8qXk2RIb1dGfSw5NuMTnbyOqDRseECb
         5UO55cbSWpEMtFmjg7y6QYiduQg/kWSmxmf3g1X/Vcy9xARxJHbqCIAvQVbOaeLcpe
         apRQcvnoVKodjVtsgzmpBf9W1DcWGsfAF8etV0RqjBqxiJoBKYaqfP76U5IHixLxzN
         kBYgrTlWv6iPQ==
Date:   Thu, 15 Jun 2023 00:24:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/4] i2c: i801: Use i2c_mark_adapter_suspended/resumed
Message-ID: <20230614222439.i7uw3dai3why7bk2@intel.intel>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
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

On Sat, Mar 04, 2023 at 10:31:23PM +0100, Heiner Kallweit wrote:
> When entering the shutdown/remove/suspend callbacks, at first we should
> ensure that transfers are finished and I2C core can't start further
> transfers. Use i2c_mark_adapter_suspended() for this purpose.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ac5326747..d6a0c3b53 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1773,6 +1773,8 @@ static void i801_remove(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> +	i2c_mark_adapter_suspended(&priv->adapter);
> +
>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	i801_disable_host_notify(priv);
>  	i801_del_mux(priv);
> @@ -1796,6 +1798,8 @@ static void i801_shutdown(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> +	i2c_mark_adapter_suspended(&priv->adapter);
> +

is this really needed in the shutdown and remove function?

I'm OK with it, though.

>  	/* Restore config registers to avoid hard hang on some systems */
>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	i801_disable_host_notify(priv);
> @@ -1807,6 +1811,7 @@ static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
>  
> +	i2c_mark_adapter_suspended(&priv->adapter);
>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
>  	return 0;
> @@ -1818,6 +1823,7 @@ static int i801_resume(struct device *dev)
>  
>  	i801_setup_hstcfg(priv);
>  	i801_enable_host_notify(&priv->adapter);
> +	i2c_mark_adapter_resumed(&priv->adapter);

BTW, I see that very few drivers are using suspended and resumed
and I wonder why. Should these perhaps be added in the basic pm
functions?

I'm OK to r-b this, but i want first Jean to give it an ack.

Andi
