Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD6B2F2813
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 06:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731872AbhALF5X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 00:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbhALF5W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 00:57:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274A3C061786;
        Mon, 11 Jan 2021 21:56:42 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so1555965lff.9;
        Mon, 11 Jan 2021 21:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kewR8jh2A3TkX/7UyrwcvwLVAx/fKlrhrCa3SYpMsFU=;
        b=HBlvFR1Lg+zU434x4t3ydB6f2XtfmEbF9ANLVINbsRn8w7f4yECb5S9wlR8Z10aXAp
         WqHerHXKQ/5vzY5IG9cYFTKBwOf0b981DBsk5fs7wa06abOcY5Sm0HFxAdGrHG8qgvdR
         Ft/bUwkj3qM5+9cg5t+6mmyllSsju2gsBtoNjqQijvufHwrCvMAsFUqiiHQPyD61cKcE
         cq9zi82eqTPgT03fmu7CsLKtJ79uSmxM1pMGbmF6BUUuPnl+eW+jorH/sgrtxjsdNQ58
         YvyBDjI/1P+5rtX3ZTorTvaE1Yo7jPfatID2jyeYs4q3alktFk4TfIaz/m2r4xmkVmGw
         Uwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kewR8jh2A3TkX/7UyrwcvwLVAx/fKlrhrCa3SYpMsFU=;
        b=Srm79PH7YlAUWQGckxb8u2JidacL0XO4bZ/Y/2Ya+gtFiMoHweTFK6VnV9YbHPSovt
         +xX7o6Vq8bAxDfETRATezR8aWqU4d1sGa36UgNROWnfshjS7vwZnHxsH/8I2B7NCnwod
         HDlAtANih3M3Yc2pBE5KPV7xj25WR5WSvYlfD9LUJ0m3oqBpCp2zCGLwXCczXm7PdRaM
         Z9LAEMF5V8n6alo64h1/vjn6qbzIxFTHAuoRyFiWJICznARYH1SHJBkPVCG8B0TsqGn2
         a9fxPjss3k8xhMCcofzrhnoArRtC4eZM4oOd0zuIXwCtF1pUmrY00wo69iC99OsCIAaq
         kGrg==
X-Gm-Message-State: AOAM531/mL09151fADQ23j4HL3sJ0n+4ZqF4Ke4gHW8nHrxcu8ecRhUM
        ubH0MbeIFchYFFw7Wjj9Ihu0oFvLL6Y=
X-Google-Smtp-Source: ABdhPJwzjIlrdYRaNiiZ0u6c/Lh/dlac7DMazQ1f/haWrpPnfFWGabWbcH2aJegE0gZyZ+tEGUj/OA==
X-Received: by 2002:ac2:5faf:: with SMTP id s15mr1439773lfe.20.1610431000016;
        Mon, 11 Jan 2021 21:56:40 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y23sm221359ljc.119.2021.01.11.21.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 21:56:39 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: Create i2c_writesl_vi() to use with VI I2C
 for filling TX FIFO
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, wsa@the-dreams.de
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1610424379-23653-1-git-send-email-skomatineni@nvidia.com>
 <1610424379-23653-2-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae886d28-ef6c-63d3-2cc7-90752ddb8b21@gmail.com>
Date:   Tue, 12 Jan 2021 08:56:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1610424379-23653-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

12.01.2021 07:06, Sowjanya Komatineni пишет:
> VI I2C don't have DMA support and uses PIO mode all the time.
> 
> Current driver uses writesl() to fill TX FIFO based on available
> empty slots and with this seeing strange silent hang during any I2C
> register access after filling TX FIFO with 8 words.
> 
> Using writel() followed by i2c_readl() in a loop to write all words
> to TX FIFO instead of using writesl() helps for large transfers in
> PIO mode.
> 
> So, this patch creates i2c_writesl_vi() API to use with VI I2C for
> filling TX FIFO.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 6f08c0c..e2b7503 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -339,6 +339,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>  	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
>  
> +static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, u32 *data,
> +			   unsigned int reg, unsigned int len)
> +{
> +	/*
> +	 * Using writesl() to fill VI I2C TX FIFO for transfers more than
> +	 * 6 words is causing a silent hang on any VI I2C register access
> +	 * after TX FIFO writes.
> +	 * So using writel() followed by i2c_readl().
> +	 */
> +	while (len--) {
> +		writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +		i2c_readl(i2c_dev, I2C_INT_STATUS);
> +	}
> +}
> +
>  static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>  		       unsigned int reg, unsigned int len)
>  {
> @@ -811,7 +826,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		i2c_dev->msg_buf_remaining = buf_remaining;
>  		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
>  
> -		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> +		if (i2c_dev->is_vi)
> +			i2c_writesl_vi(i2c_dev, (u32 *)buf, I2C_TX_FIFO, words_to_transfer);
> +		else
> +			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>  
>  		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
>  	}
> 

Looks almost good, could we please use a relaxed writel and avoid the casting in the code?

Like this:

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f08c0c3238d..4f843b423d83 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -326,6 +326,8 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
 	/* read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	else
+		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
@@ -339,6 +341,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
+			   unsigned int reg, unsigned int len)
+{
+	u32 *data32 = data;
+
+	/*
+	 * Using writesl() to fill VI I2C TX FIFO for transfers more than
+	 * 6 words is causing a silent hang on any VI I2C register access
+	 * after TX FIFO writes. Each write to FIFO should follow by a read
+	 * of any I2C register in order to work around the problem.
+	 */
+	while (len--)
+		i2c_writel(i2c_dev, *data32++, reg);
+}
+
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 		       unsigned int reg, unsigned int len)
 {
@@ -811,7 +828,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
-		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+		if (i2c_dev->is_vi)
+			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+		else
+			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
