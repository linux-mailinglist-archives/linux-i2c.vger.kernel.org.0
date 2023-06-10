Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85B072AC06
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjFJOB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 10:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjFJOB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 10:01:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB331984;
        Sat, 10 Jun 2023 07:01:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C75DA6179D;
        Sat, 10 Jun 2023 14:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2277C4339B;
        Sat, 10 Jun 2023 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686405715;
        bh=BLioT/yyyP2CevlFsAiLKf/2/ifbiaMMGEQlmTzRUNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hj8F+cvUN1KkzcV1U0dzWWI5tMErfMkGN3KrqQj+0xX3ZCzLvaP/Cw77t+LGzYnfL
         jFVZ898FOBs7yg6HZAwBzFbbyggKYXg3RikaNhFBHRWVy5FXw9fKHeQATETBLjS0nu
         fYoY8qznPgZDSxiqer/MixhzJ3tAoJVnJedSX6vABsebdS8SF0FGckDydgh38VfbND
         jxOQ90e6XUM04SeRw60OrdG8D5+9u1PtCAu/KR8W3Vdo2dfUVLxBTJokZiXRRD3Lif
         8TW3UGhNpi5EZEgd7XDWOGpxU/QXAOsl1PmXUgo7Fw/wkX8ONNvRlKkDeQkG5HyFeO
         mzDWkk8CZV5Ng==
Date:   Sat, 10 Jun 2023 16:01:51 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Tao Lan <taolan@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c-hix5hd2: Add more debug info when transfer fail.
Message-ID: <20230610140151.dghq3g2xw5wx6g67@intel.intel>
References: <20220930014405.5469-1-taolan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930014405.5469-1-taolan@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Taolan,

On Fri, Sep 30, 2022 at 01:44:05AM +0000, Tao Lan wrote:
> From: taolan <taolan@huawei.com>
> 
> The transfer result is checked, classified, and printed, which
> facilitates debugging.

you are missing your Signed-off-by here.

> ---
>  drivers/i2c/busses/i2c-hix5hd2.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
> index 61ae58f57047..e6ab8b20cd01 100644
> --- a/drivers/i2c/busses/i2c-hix5hd2.c
> +++ b/drivers/i2c/busses/i2c-hix5hd2.c
> @@ -366,8 +366,17 @@ static int hix5hd2_i2c_xfer(struct i2c_adapter *adap,
>  			goto out;
>  	}
>  
> -	ret = num;
> +	if (i == num) {
> +		ret = num;
> +	} else {

it can't be, because if you are exiting normally from the for
loop, then i is equal to num.

You might want to put this inside the out label, or, even better:

                    stop = (i == num - 1);
                    ret = hix5hd2_i2c_xfer_msg(priv, msgs, stop);
                    if (ret < 0)
    -                       goto out;
    +                       break;
            }
     
    -       ret = num;
    +       if (i == num) {
    +               ret = num;
    +       } else {
    +               /* Only one message, cannot access the device */
                    ...
    +       }
     
    -out:

What do you think?

> +		/* Only one message, cannot access the device */
> +		if (i == 1)
> +			ret = -EREMOTEIO;
> +		else
> +			ret = i;
>  
> +		pr_warning("xfer message failed\n");

please use dev_warn here.

BTW, is it warning or error?

Andi

> +	}
>  out:
>  	pm_runtime_mark_last_busy(priv->dev);
>  	pm_runtime_put_autosuspend(priv->dev);
> -- 
> 2.22.0
> 
