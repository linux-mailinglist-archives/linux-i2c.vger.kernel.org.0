Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD4B49CC7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 11:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbfFRJNh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 05:13:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33981 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729322AbfFRJNh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 05:13:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id y198so8694769lfa.1;
        Tue, 18 Jun 2019 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XlWLojqSGe/pSOjeqcp6I8DwUWmXX5KBFCZNI0FhiQw=;
        b=OROrmqjhEitBM3j0KwwuZTcjdT27wJU6hczocKzWhaSTJgBmML9ALRuligaGA6rTBM
         4w1aLmm5HACYxGR2zK4Wwws0ekOnaEvfvQLm2EvMXHIhtkRmhaA9MYlsWBVdBmzr9GSk
         jEZNOBA6dV63svH1/O9GVV/LNjI9SBS/SIgLl/223PI+0T/wLIApvx99g1WRhTf4XbMq
         leYcBhTGhQ9M9yumyQBLGHw5ivPUNbZSWZC8kZLc0OwHzW7C9DJqlZw09SPkKBZGFNnI
         UyPH2Ix26LboE8qIIInXAt1cWjMc+f3r4wFffryn/J5VOr3XhTo+VSnJYrdRESkko+Uc
         jZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XlWLojqSGe/pSOjeqcp6I8DwUWmXX5KBFCZNI0FhiQw=;
        b=o+7QUw5B0NtmyIEAUlnkADC2jdUQ1F79npJ1tTUJAa0w+LLtTHHwTh1nLYllB1We9J
         VSZwx4cMuS+paSF8mFNTpjd2oKtcl7cjxmRRkDVZqf3OJJtKyQfXSh2+HO1dJrTMA2YN
         zP5flBg7/oQaK0+StqSF82lCPWMP3WgrVAx2jGpIU1Bzi8FxmSMCRuDNB8ZgoECAujYN
         bWn0y/KWnzuZTdDehOb2jrP/HEn0DvsE120BHg2zHkI6R55dwW3D3yngCbCOw7Y74vSa
         DW8Kz3K37gK4RLnjvl6WG5kyO3/MV7NcSs/X2yrCl2HXwXed9TiEMHzGoLCW5clabNGV
         WBPw==
X-Gm-Message-State: APjAAAV6hWsn83c4Jej+dLzV1nA3uxl0hSyCwn6ZAHumpV3d+b1uKuac
        ucuYo4PQMOEYw+KNsKNWAIS9jOWU
X-Google-Smtp-Source: APXvYqwxHbLgazxFR+P7GMNMbnhHiu7jGqTN2G9p4UZSlQ8NgLsIi5lVGFHaaP7c/2lNoq3XmQnKBA==
X-Received: by 2002:a19:2247:: with SMTP id i68mr56701380lfi.174.1560849214532;
        Tue, 18 Jun 2019 02:13:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id g14sm2373284lja.23.2019.06.18.02.13.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 02:13:33 -0700 (PDT)
Subject: Re: [PATCH V8] i2c: tegra: remove BUG() macro
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
References: <1560832186-17001-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a438eb6c-4f27-a667-b1bb-a789b3a8c1fc@gmail.com>
Date:   Tue, 18 Jun 2019 12:13:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560832186-17001-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

18.06.2019 7:29, Bitan Biswas пишет:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 49 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..6fb545e 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>  #define I2C_ERR_NO_ACK				BIT(0)
>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -489,6 +490,13 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	size_t buf_remaining = i2c_dev->msg_buf_remaining;
>  	int words_to_transfer;
>  
> +	/*
> +	 * Catch overflow due to message fully sent before
> +	 * check for RX FIFO availability.
> +	 */
> +	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
> +		return -EINVAL;
> +
>  	if (i2c_dev->hw->has_mst_fifo) {
>  		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
>  		rx_fifo_avail = (val & I2C_MST_FIFO_STATUS_RX_MASK) >>
> @@ -515,7 +523,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/*
> +		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
> +		 * in this function.
> +		 */
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
> @@ -523,7 +535,12 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		rx_fifo_avail--;
>  	}
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> +	/*
> +	 * RX FIFO must be drained in Overflow case.
> +	 */
> +	if (WARN_ON_ONCE(rx_fifo_avail))
> +		return -EINVAL;
> +

The comment is incorrect because RX FIFO is *not* drained in a case of overflow. Also,
please use a single-line comment style if multi-line is
not needed.

Let's change it to:

	/* RX FIFO must be drained, otherwise it's an Overflow case */
	if (WARN_ON_ONCE(rx_fifo_avail))
		return -EINVAL;

Otherwise looking good to me. Please address this minor comment and it should be done.
Looking forward to v9!
