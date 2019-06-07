Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C525F3899F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfFGMDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:03:21 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:54705 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbfFGMDU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:03:20 -0400
Received: by mail-it1-f195.google.com with SMTP id m138so644430ita.4;
        Fri, 07 Jun 2019 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vK0DKcqym3vzBSu4KJC1xZCerlj844qmC8dWdm0jSRw=;
        b=F6pwUVZW5eYgStsWlpFWxgewfcBvQ6XVieJGuDpSAk8ZGggR0ByYg+0K95B1l7u8GX
         REvsXDU7+HISt/WpVh3/NfPIm5RzMdWI8+0Vv9GHjv4cU9YkbWOUruQIWiWXwRVbAZBu
         ptaYBZKe8TQC9nqNlwDlQpRctsVv8rXmIMAwaXXc3IMBLvJSgyExcdrXmGexDmpG+bs1
         b0v2Dlwf27ErfNkJ60CwjYVO6XvuICaR5iYo2CWWziBXSIXoIZfbzRohzKV6nrzwfrlm
         fk58Ps3urLqew6q+/Ml3YWj/7Ij+1PwcDyCi05s+I7eauZ3w4RQsgpQHvgsGs6q1Bl2r
         a3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vK0DKcqym3vzBSu4KJC1xZCerlj844qmC8dWdm0jSRw=;
        b=bpt1OZPXiOtm3Xamz8RDRZ3NYsIOzySDD9iQtDetpPWv4CAvY9e8hqi+Qv3nwahZeQ
         rz9LctWWTbPVCpu9epye/HNrHiUpqmmA3whXJpYCBKTo2ayY/YyH4MqfjJm2bBgek6oi
         q9jvKnQE+u5upji1p0EBR6NGrV0dU80K+zBHOU4QxSOtMZpfeQNF9Ore5Qq6H0KufWTL
         R5cPp6yiREO8YfNXLnUqS1aULB0P1VSlKQbaEmZL733JUanOSixgwHdI1KyGg9SmjzlX
         FoH08MoPrPMkERbHWRLTQ5Z2tUw9n6SOckEYKrV0V/5gZdATDc/HLhxRny+BDBDWt2rq
         Jd0w==
X-Gm-Message-State: APjAAAVvmHNdjYYnXXTx5rsNtsogl7VemEXiO2F5dhvrPWUEk52KR5DR
        9Mhy4E9D+nX8W/X4HD5N2Eq7Cxxy
X-Google-Smtp-Source: APXvYqzMj4O9PZeRoSLKXszNnLe8sd6qjK2upCU3s1sE0Ec0Uc/8vLASXAYRk9UQHXD/ZbiKzYGUIA==
X-Received: by 2002:a24:5004:: with SMTP id m4mr3731371itb.19.1559908999714;
        Fri, 07 Jun 2019 05:03:19 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id n21sm564386ioh.30.2019.06.07.05.03.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:03:18 -0700 (PDT)
Subject: Re: [PATCH V1 1/6] i2c: tegra: clean up macros
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8c862349-186e-e7a3-f79c-ee6a6915d01f@gmail.com>
Date:   Fri, 7 Jun 2019 15:03:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Clean up macros by:
> 1) removing unused macros
> 2) replace constants by macro BIT()
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 1dbba39..00692d8 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -54,20 +54,15 @@
>  #define I2C_INT_STATUS				0x068
>  #define I2C_INT_BUS_CLR_DONE			BIT(11)
>  #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
> -#define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
> -#define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
> -#define I2C_INT_RX_FIFO_UNDERFLOW		BIT(4)
>  #define I2C_INT_NO_ACK				BIT(3)
>  #define I2C_INT_ARBITRATION_LOST		BIT(2)
>  #define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
>  #define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
>  #define I2C_CLK_DIVISOR				0x06c
>  #define I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT	16
> -#define I2C_CLK_MULTIPLIER_STD_FAST_MODE	8
>  
>  #define DVC_CTRL_REG1				0x000
>  #define DVC_CTRL_REG1_INTR_EN			BIT(10)
> -#define DVC_CTRL_REG2				0x004
>  #define DVC_CTRL_REG3				0x008
>  #define DVC_CTRL_REG3_SW_PROG			BIT(26)
>  #define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
> @@ -75,24 +70,21 @@
>  #define DVC_STATUS_I2C_DONE_INTR		BIT(30)
>  
>  #define I2C_ERR_NONE				0x00
> -#define I2C_ERR_NO_ACK				0x01
> -#define I2C_ERR_ARBITRATION_LOST		0x02
> -#define I2C_ERR_UNKNOWN_INTERRUPT		0x04
> +#define I2C_ERR_NO_ACK				BIT(0)
> +#define I2C_ERR_ARBITRATION_LOST		BIT(1)
> +#define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>  #define PACKET_HEADER0_CONT_ID_SHIFT		12
>  #define PACKET_HEADER0_PROTOCOL_I2C		BIT(4)
>  
> -#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
>  #define I2C_HEADER_CONT_ON_NAK			BIT(21)
> -#define I2C_HEADER_SEND_START_BYTE		BIT(20)
>  #define I2C_HEADER_READ				BIT(19)
>  #define I2C_HEADER_10BIT_ADDR			BIT(18)
>  #define I2C_HEADER_IE_ENABLE			BIT(17)
>  #define I2C_HEADER_REPEAT_START			BIT(16)
>  #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> -#define I2C_HEADER_MASTER_ADDR_SHIFT		12
>  #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>  
>  #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -106,8 +98,6 @@
>  
>  #define I2C_CONFIG_LOAD				0x08C
>  #define I2C_MSTR_CONFIG_LOAD			BIT(0)
> -#define I2C_SLV_CONFIG_LOAD			BIT(1)
> -#define I2C_TIMEOUT_CONFIG_LOAD			BIT(2)
>  
>  #define I2C_CLKEN_OVERRIDE			0x090
>  #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
> @@ -133,7 +123,6 @@
>  #define I2C_STANDARD_MODE			100000
>  #define I2C_FAST_MODE				400000
>  #define I2C_FAST_PLUS_MODE			1000000
> -#define I2C_HS_MODE				3500000
>  
>  /* Packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
> 

Looks good!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
