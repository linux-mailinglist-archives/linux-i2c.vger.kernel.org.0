Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68769790994
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 22:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbjIBUbC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 16:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbjIBUbB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 16:31:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF631A8;
        Sat,  2 Sep 2023 13:30:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 85ADBB808C7;
        Sat,  2 Sep 2023 20:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A21C433C7;
        Sat,  2 Sep 2023 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693686656;
        bh=dAd5cx3vilEDZWPwHRmwNnTDNoPW/jZnLf8eO7cTZd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZlsMwwYXQs4byh0Ub0Vn/TqUeDXZFOuE/AvgmKSl3dGtiToSVOsg1o545S7z1AG7w
         ANFUKjK9ugjIbA683M3mfC/khIpm91WMPRqEupM7TqxouO/GC83lxj08PWQmwOjaRJ
         xMS5whdGKoqZOLb//IMSxEKRvS+SXE3XStsSVfSFVFsAQT2PGAxUW6zSkgBoUzdpla
         O/tY8T0Ei6/P7lf2XUBAX/YSw1G8jliR18i7RGKGTl9UlDZKQ2vjFtTjt7egP7JmdP
         jymiBVt9ho9jo8FC0b8iVSA3p0HEc9ZgLoOwH8vrMBcGXoC/30M649HCkpX6KsxXYj
         tXtAdscdYvXdg==
Date:   Sat, 2 Sep 2023 22:30:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 2/8] i2c: sprd: Add I2C driver to use 'reset framework'
 function
Message-ID: <20230902203052.ecoly4r67i5qbxu3@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-3-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817094520.21286-3-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

On Thu, Aug 17, 2023 at 05:45:14PM +0800, Huangzheng Lai wrote:
> This patch adds the 'reset framework' function for I2C drivers, which
> resets the I2C controller when a timeout exception occurs.

as in the earlier patch, please use the imperative form.

> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

[...]

> @@ -247,6 +249,7 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>  {
>  	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
>  	unsigned long time_left;
> +	int ret;

please move this declaration...

>  
>  	i2c_dev->msg = msg;
>  	i2c_dev->buf = msg->buf;
> @@ -278,9 +281,16 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>  
>  	time_left = wait_for_completion_timeout(&i2c_dev->complete,
>  				msecs_to_jiffies(I2C_XFER_TIMEOUT));
> -	if (!time_left)
> +	if (!time_left) {
> +		dev_err(i2c_dev->dev, "transfer timeout, I2C_STATUS = 0x%x\n",
> +			readl(i2c_dev->base + I2C_STATUS));
> +		if (i2c_dev->rst != NULL) {

... here.

> +			ret = reset_control_reset(i2c_dev->rst);
> +			if (ret < 0)
> +				dev_err(i2c_dev->dev, "i2c soft reset failed, ret = %d\n", ret);

dev_warn()

> +		}
>  		return -ETIMEDOUT;
> -
> +	}
>  	return i2c_dev->err;
>  }
>  
> @@ -535,6 +545,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	platform_set_drvdata(pdev, i2c_dev);
> +	i2c_dev->rst = devm_reset_control_get(i2c_dev->dev, "i2c_rst");
> +	if (IS_ERR(i2c_dev->rst)) {
> +		dev_err(i2c_dev->dev, "can't get i2c reset node\n");

if the i2c_rst is optional then this is not an error and it
should use dev_dbg(); right?

In that case please reword the message to "reset control not
configured".

Andi
