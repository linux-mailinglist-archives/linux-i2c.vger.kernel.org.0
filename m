Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA9358874B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 08:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbiHCGWW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 02:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiHCGWV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 02:22:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A56D15FC4;
        Tue,  2 Aug 2022 23:22:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5D8A614A2;
        Wed,  3 Aug 2022 06:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA919C433D6;
        Wed,  3 Aug 2022 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1659507739;
        bh=+ZiwWuN0U2VP+pdzZJNajUI/n/HEZe+8Pu+OK7hTSPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=izoecnW7/8y3YJ/6QhSU4Ke1tz0d/UKIZaOVg+WwVMLM147HA4mZd2aoz4HbhIgQe
         xT+ZFeFFBQFOYsmCvDO6gKss09kIBzp2L00hQF/i+Pt1k3AF+4WdvZGhqMtzK/z1th
         9lBh67Kaj4+NENkc4HfZvu/8JmmUTwO2nXwduoPY=
Date:   Wed, 3 Aug 2022 08:22:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     cgel.zte@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] eeprom: at24:using the
 pm_runtime_resume_and_get to  simplify the code
Message-ID: <YuoUGD2M0sDV2KCy@kroah.com>
References: <20220803061618.1650538-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803061618.1650538-1-ye.xingchen@zte.com.cn>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 03, 2022 at 06:16:18AM +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
> and pm_runtime_put_noidle.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/misc/eeprom/at24.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 633e1cf08d6e..f354b79619d8 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -431,9 +431,8 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
>  	if (off + count > at24->byte_len)
>  		return -EINVAL;
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
> -		pm_runtime_put_noidle(dev);
>  		return ret;
>  	}
>  
> @@ -478,9 +477,8 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
>  	if (off + count > at24->byte_len)
>  		return -EINVAL;
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
> -		pm_runtime_put_noidle(dev);
>  		return ret;
>  	}
>  
> -- 
> 2.25.1

Again, please read:
	https://lore.kernel.org/r/YujeLEMsIrVD2tGn@kroah.com
