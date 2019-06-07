Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0079B389A7
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfFGMEF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:04:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44243 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfFGMEF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:04:05 -0400
Received: by mail-io1-f67.google.com with SMTP id s7so1179660iob.11;
        Fri, 07 Jun 2019 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P04I2xCwuF5E99E7jtuBah/fpprx9JlOXUiB4dx+kwU=;
        b=FM93wd7Jfz9NzXHjCCDySeU9YOiGvNofd9XmBuyjPycuC0Q/d0kL60phEKdb8RFu80
         0j8T/cYE9OwAzwjX4fzeZVxHQXy6TaLsoyYiHOelj5vAztUe1rKLUTaB1stKnvQsyAw6
         AS4gI6KO5v9HzsqoqB1ddwbADr4dUh4/qw0lyAJAvdYM6YUxhE7L6t6txdsQmo3qhW2j
         600mMCvy8DYjs+LCe8twNTUiWRcftwh2ti7anoIFFiNDAv9dBg3GYFkQOr/rLSLIRsJC
         3YGmo7Lj87K9aGlq8Dh15EsjlEF3R9E1tygTjYE9/fBZvPGmfA3pXOuTIeMHOTdIhCes
         USvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P04I2xCwuF5E99E7jtuBah/fpprx9JlOXUiB4dx+kwU=;
        b=A+YX/Z9Z8szd4rJX64b/4V8d+k1zUHhK3Z0gz2meyLYR1lDFvlZk32wjNwkROXCTOW
         MyaiSjVThqgcQ41QEN/3UAQQMnObWgDA16Jpao4SlsvoZezev4NCcFZPc8XWlk1H3j8+
         7pNBGNASuw7IQxOt4xMp83oHT/wrCRiJp2jleOQj6oxFAUpKvQJow7m6JLPflzV0ErEg
         7x/ZdXp8uO2pi6QMrJ+P4sO0St/n2XXeBGgoL6VdTPyvlz7i1SFvJFjoXjVTYKHiBdFi
         y9ThOj3OUD95aH8oK8UpUdMvZu96WEjTTAeruhtE8wIc8xX66Cf/+xfPRQtT+FE/wqkv
         95nQ==
X-Gm-Message-State: APjAAAVY1J0j41ez3h9eXS/uuaIPGorbZNl6VzzZ/REXoDvRfJqxHa4j
        5G0lZElyZQ+RL8K3Gsim8HeSbz1m
X-Google-Smtp-Source: APXvYqxGHoc8mTNqWACl5n4g+McLRsiO7mq3KLQ5nLr/z/bNWY+xW7l3vu90fgjvI6yktf1P/msiww==
X-Received: by 2002:a6b:cd86:: with SMTP id d128mr12895346iog.234.1559909044633;
        Fri, 07 Jun 2019 05:04:04 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id f206sm760276itd.17.2019.06.07.05.04.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:04:04 -0700 (PDT)
Subject: Re: [PATCH V1 3/6] i2c: tegra: fix alignment and spacing violations
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-3-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fbaf13e3-604a-7df1-6b96-2b7d9dabfa4f@gmail.com>
Date:   Fri, 7 Jun 2019 15:04:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559908507-31192-3-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Fix checkpatch.pl alignment and blank line check(s) in i2c-tegra.c
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index f7116b7..2d381de 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -295,7 +295,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
>   * to the I2C block inside the DVC block
>   */
>  static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
> -	unsigned long reg)
> +					unsigned long reg)
>  {
>  	if (i2c_dev->is_dvc)
>  		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
> @@ -303,7 +303,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
>  }
>  
>  static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> -	unsigned long reg)
> +		       unsigned long reg)
>  {
>  	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>  
> @@ -318,13 +318,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
>  }
>  
>  static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
> -	unsigned long reg, int len)
> +			unsigned long reg, int len)
>  {
>  	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
>  
>  static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
> -	unsigned long reg, int len)
> +		       unsigned long reg, int len)
>  {
>  	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
> @@ -669,10 +669,11 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>  		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
>  		if (in_interrupt())
>  			err = readl_poll_timeout_atomic(addr, val, val == 0,
> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
> +							1000,
> +							I2C_CONFIG_LOAD_TIMEOUT);
>  		else
> -			err = readl_poll_timeout(addr, val, val == 0,
> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
> +			err = readl_poll_timeout(addr, val, val == 0, 1000,
> +						 I2C_CONFIG_LOAD_TIMEOUT);
>  
>  		if (err) {
>  			dev_warn(i2c_dev->dev,
> @@ -1013,7 +1014,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>  }
>  
>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> -	struct i2c_msg *msg, enum msg_end_type end_state)
> +			      struct i2c_msg *msg,
> +			      enum msg_end_type end_state)
>  {
>  	u32 packet_header;
>  	u32 int_mask;
> @@ -1150,9 +1152,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		if (err)
>  			return err;
>  
> -		time_left = wait_for_completion_timeout(
> -						&i2c_dev->dma_complete,
> -						msecs_to_jiffies(xfer_time));
> +		time_left = wait_for_completion_timeout(&i2c_dev->dma_complete,
> +							msecs_to_jiffies(xfer_time));
>  		if (time_left == 0) {
>  			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
>  			dmaengine_terminate_sync(i2c_dev->msg_read ?
> @@ -1214,7 +1215,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  }
>  
>  static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
> -	int num)
> +			  int num)
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	int i;
> @@ -1260,14 +1261,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>  {
>  	struct device_node *np = i2c_dev->dev->of_node;
>  	int ret;
> +	bool multi_mode;
>  
>  	ret = of_property_read_u32(np, "clock-frequency",
> -			&i2c_dev->bus_clk_rate);
> +				   &i2c_dev->bus_clk_rate);
>  	if (ret)
>  		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
>  
> -	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
> -			"multi-master");
> +	multi_mode = of_property_read_bool(np, "multi-master");
> +	i2c_dev->is_multimaster_mode = multi_mode;
>  }
>  
>  static const struct i2c_algorithm tegra_i2c_algo = {
> @@ -1611,7 +1613,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
> -			tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
> +			       tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
>  		goto release_dma;
> @@ -1704,6 +1706,7 @@ static const struct dev_pm_ops tegra_i2c_pm = {
>  	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
>  			   NULL)
>  };
> +
>  #define TEGRA_I2C_PM	(&tegra_i2c_pm)
>  #else
>  #define TEGRA_I2C_PM	NULL
> 
Very nice!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
