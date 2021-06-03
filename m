Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CE239A6A7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 19:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhFCRH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 13:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFCRH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 13:07:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5616C06174A
        for <linux-i2c@vger.kernel.org>; Thu,  3 Jun 2021 10:06:13 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso5876251pjb.0
        for <linux-i2c@vger.kernel.org>; Thu, 03 Jun 2021 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=SB5KnleGYa2szN2sVSmIUicTpW9G5r+WU9AEPk5VWeM=;
        b=KgR2n6OMGW29XhnTZL58LKXZL9cK1+6TzcO0s4oFfrnM9+/UXDkU7wAVH4Md5UDoOg
         TBSsKlPlh/fTNxyVCs7ddMSELvSCLlrDj/AFsl8tB5AzHgCLKjEnWBojwv64NTgM+iDL
         kwBsccyXFDZZIL/wiZX0sV5LNC3wBNuW2PJuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=SB5KnleGYa2szN2sVSmIUicTpW9G5r+WU9AEPk5VWeM=;
        b=BFh6eFJF+MLDXkbAmSRmQejHSsgN8uEF6IWPT6KFia8KqhjZS4kqWyLK2vBqZhV9pZ
         u71rR7YZa98a43gSpiWfaIylPQ8Elo3YtmyS+fvolXOCaLMEXMqFznB7PnMAMt1iGmU0
         YLAJTD7WDI/VGvzfwk+eP/MER5aG0u0fULwsvZ/Bo8UVQaLhqhGg8goEaja82eTKUe89
         yUHnom45WWowL6MPICncGpXsQUfUWVmQoaau4fIqgwzEkhxCVqT76KO7onGPtpkDVOmt
         3AMwvdwjxRV2tL7g/tuw9ZjCAYgDUFVTJM615UITEW0YIH6l2OXa4Mpt+wU4Y4VsXh8W
         ekAg==
X-Gm-Message-State: AOAM533ABk9mjbtce1sctiS6U5y1W6fsUsB6I2IBE7+klwFvOuy9WoMd
        jDp6FbOXuPJJpIWkh7JCOJ6N2Q==
X-Google-Smtp-Source: ABdhPJw+PTFMaRfQUuIsq0/FKIyj9hzB1+T86pSVGL1Z3n/usVITs6TKz4MPH1Hzw6YwsfdaXz+oZQ==
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id d15-20020a170902b70fb02900f45445cd9fmr169920pls.32.1622739973010;
        Thu, 03 Jun 2021 10:06:13 -0700 (PDT)
Received: from [10.136.8.240] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id u5sm2807648pfi.179.2021.06.03.10.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 10:06:12 -0700 (PDT)
Subject: Re: [PATCH v3] i2c: bcm-iproc: Add i2c recovery support
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Richard Laing <richard.laing@alliedtelesis.co.nz>
References: <20210603052515.11178-1-chris.packham@alliedtelesis.co.nz>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <758551c7-7fb3-4e10-32a7-7dd48a93b064@broadcom.com>
Date:   Thu, 3 Jun 2021 10:06:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603052515.11178-1-chris.packham@alliedtelesis.co.nz>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000b20bcf05c3df9701"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000b20bcf05c3df9701
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/2/2021 10:25 PM, Chris Packham wrote:
> From: Richard Laing <richard.laing@alliedtelesis.co.nz>
> 
> The bcm-iproc controller can put the SDA/SCL lines into bit-bang mode,
> make use of this to support i2c bus recovery.
> 
> Signed-off-by: Richard Laing <richard.laing@alliedtelesis.co.nz>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Richard did most of the work on this. I'm just cleaning it up to get it
> upstream.
> 
> Changes in v3:
> - drop const from bcm_iproc_recovery_info due to build error from the
>   kernel test bot
> 
> Changes in v2:
> - Incorporate feedback from Ray Jui
> - Move bcm_iproc_i2c_resume so it can be re-used to return the i2c bus
>   to normal operation at the correct speed after a recovery.
> - Add iproc_i2c_lockup_recover() helper to only trigger recovery if sda
>   is actually stuck
> - Use usleep_range() instead of udelay()
> - Cosmetic changes to register bit definitions
> 
>  drivers/i2c/busses/i2c-bcm-iproc.c | 176 +++++++++++++++++++++++++----
>  1 file changed, 151 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index cceaf69279a9..fdbb98a848e3 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -25,6 +25,7 @@
>  #define CFG_OFFSET                   0x00
>  #define CFG_RESET_SHIFT              31
>  #define CFG_EN_SHIFT                 30
> +#define CFG_BIT_BANG_SHIFT           29
>  #define CFG_SLAVE_ADDR_0_SHIFT       28
>  #define CFG_M_RETRY_CNT_SHIFT        16
>  #define CFG_M_RETRY_CNT_MASK         0x0f
> @@ -66,6 +67,12 @@
>  #define S_FIFO_RX_THLD_SHIFT         8
>  #define S_FIFO_RX_THLD_MASK          0x3f
>  
> +#define M_BB_CTRL_OFFSET             0x14
> +#define M_BB_SMBCLK_IN_SHIFT         31
> +#define M_BB_SMBCLK_OUT_EN_SHIFT     30
> +#define M_BB_SMBDAT_IN_SHIFT         29
> +#define M_BB_SMBDAT_OUT_EN_SHIFT     28
> +
>  #define M_CMD_OFFSET                 0x30
>  #define M_CMD_START_BUSY_SHIFT       31
>  #define M_CMD_STATUS_SHIFT           25
> @@ -713,6 +720,147 @@ static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
>  	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
>  }
>  
> +static int bcm_iproc_i2c_resume(struct device *dev)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = dev_get_drvdata(dev);
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * Power domain could have been shut off completely in system deep
> +	 * sleep, so re-initialize the block here
> +	 */
> +	ret = bcm_iproc_i2c_init(iproc_i2c);
> +	if (ret)
> +		return ret;
> +
> +	/* configure to the desired bus speed */
> +	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
> +	val &= ~BIT(TIM_CFG_MODE_400_SHIFT);
> +	val |= (iproc_i2c->bus_speed == I2C_MAX_FAST_MODE_FREQ) << TIM_CFG_MODE_400_SHIFT;
> +	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
> +
> +	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> +
> +	return 0;
> +}
> +
> +static void bcm_iproc_i2c_prepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
> +	u32 tmp;
> +
> +	dev_dbg(iproc_i2c->device, "Prepare recovery\n");
> +
> +	/* Disable interrupts */
> +	writel(0, iproc_i2c->base + IE_OFFSET);
> +	readl(iproc_i2c->base + IE_OFFSET);
> +	synchronize_irq(iproc_i2c->irq);
> +
> +	/* Place controller in reset */
> +	tmp = readl(iproc_i2c->base + CFG_OFFSET);
> +	tmp |= BIT(CFG_RESET_SHIFT);
> +	writel(tmp, iproc_i2c->base + CFG_OFFSET);
> +	usleep_range(100, 200);
> +
> +	/* Switch to bit-bang mode */
> +	tmp = readl(iproc_i2c->base + CFG_OFFSET);
> +	tmp |= BIT(CFG_BIT_BANG_SHIFT);
> +	writel(tmp, iproc_i2c->base + CFG_OFFSET);
> +	usleep_range(100, 200);
> +}
> +
> +static void bcm_iproc_i2c_unprepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
> +	u32 tmp;
> +
> +	/* Switch to normal mode */
> +	tmp = readl(iproc_i2c->base + CFG_OFFSET);
> +	tmp &= ~BIT(CFG_BIT_BANG_SHIFT);
> +	writel(tmp, iproc_i2c->base + CFG_OFFSET);
> +	usleep_range(100, 200);
> +
> +	bcm_iproc_i2c_resume(iproc_i2c->device);
> +
> +	dev_dbg(iproc_i2c->device, "Recovery complete\n");
> +}
> +
> +static int bcm_iproc_i2c_get_scl(struct i2c_adapter *adap)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
> +	u32 tmp;
> +
> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
> +
> +	return !!(tmp & BIT(M_BB_SMBCLK_IN_SHIFT));
> +}
> +
> +static void bcm_iproc_i2c_set_scl(struct i2c_adapter *adap, int val)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
> +	u32 tmp;
> +
> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
> +	if (val)
> +		tmp |= BIT(M_BB_SMBCLK_OUT_EN_SHIFT);
> +	else
> +		tmp &= ~BIT(M_BB_SMBCLK_OUT_EN_SHIFT);
> +
> +	writel(tmp, iproc_i2c->base + M_BB_CTRL_OFFSET);
> +}
> +
> +static void bcm_iproc_i2c_set_sda(struct i2c_adapter *adap, int val)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
> +	u32 tmp;
> +
> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
> +	if (val)
> +		tmp |= BIT(M_BB_SMBDAT_OUT_EN_SHIFT);
> +	else
> +		tmp &= ~BIT(M_BB_SMBDAT_OUT_EN_SHIFT);
> +
> +	writel(tmp, iproc_i2c->base + M_BB_CTRL_OFFSET);
> +}
> +
> +static int bcm_iproc_i2c_get_sda(struct i2c_adapter *adap)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
> +	u32 tmp;
> +
> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
> +
> +	return !!(tmp & BIT(M_BB_SMBDAT_IN_SHIFT));
> +}
> +
> +/* Check if bus lockup occurred, and invoke recovery if so. */
> +static void iproc_i2c_lockup_recover(struct bcm_iproc_i2c_dev *iproc_i2c)
> +{
> +	/*
> +	 * assume bus lockup if SDA line is low;
> +	 * note that there is no need to switch to
> +	 * bit-bang mode for this check.
> +	 */
> +	if (!bcm_iproc_i2c_get_sda(&iproc_i2c->adapter)) {
> +		/* locked up - invoke i2c bus recovery. */
> +		int ret = i2c_recover_bus(&iproc_i2c->adapter);
> +
> +		if (ret)
> +			dev_err(iproc_i2c->device, "bus recovery: error %d\n", ret);
> +	}
> +}
> +
> +static struct i2c_bus_recovery_info bcm_iproc_recovery_info = {
> +	.recover_bus = i2c_generic_scl_recovery,
> +	.prepare_recovery = bcm_iproc_i2c_prepare_recovery,
> +	.unprepare_recovery = bcm_iproc_i2c_unprepare_recovery,
> +	.set_scl = bcm_iproc_i2c_set_scl,
> +	.get_scl = bcm_iproc_i2c_get_scl,
> +	.set_sda = bcm_iproc_i2c_set_sda,
> +	.get_sda = bcm_iproc_i2c_get_sda,
> +};
> +
>  static int bcm_iproc_i2c_check_status(struct bcm_iproc_i2c_dev *iproc_i2c,
>  				      struct i2c_msg *msg)
>  {
> @@ -806,6 +954,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
>  		/* flush both TX/RX FIFOs */
>  		val = BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>  		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
> +		iproc_i2c_lockup_recover(iproc_i2c);
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -814,6 +963,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
>  		/* flush both TX/RX FIFOs */
>  		val = BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>  		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
> +		iproc_i2c_lockup_recover(iproc_i2c);
>  		return ret;
>  	}
>  
> @@ -1111,6 +1261,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>  		of_node_full_name(iproc_i2c->device->of_node));
>  	adap->algo = &bcm_iproc_algo;
>  	adap->quirks = &bcm_iproc_i2c_quirks;
> +	adap->bus_recovery_info = &bcm_iproc_recovery_info;
>  	adap->dev.parent = &pdev->dev;
>  	adap->dev.of_node = pdev->dev.of_node;
>  
> @@ -1159,31 +1310,6 @@ static int bcm_iproc_i2c_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int bcm_iproc_i2c_resume(struct device *dev)
> -{
> -	struct bcm_iproc_i2c_dev *iproc_i2c = dev_get_drvdata(dev);
> -	int ret;
> -	u32 val;
> -
> -	/*
> -	 * Power domain could have been shut off completely in system deep
> -	 * sleep, so re-initialize the block here
> -	 */
> -	ret = bcm_iproc_i2c_init(iproc_i2c);
> -	if (ret)
> -		return ret;
> -
> -	/* configure to the desired bus speed */
> -	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
> -	val &= ~BIT(TIM_CFG_MODE_400_SHIFT);
> -	val |= (iproc_i2c->bus_speed == I2C_MAX_FAST_MODE_FREQ) << TIM_CFG_MODE_400_SHIFT;
> -	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
> -
> -	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> -
> -	return 0;
> -}
> -
>  static const struct dev_pm_ops bcm_iproc_i2c_pm_ops = {
>  	.suspend_late = &bcm_iproc_i2c_suspend,
>  	.resume_early = &bcm_iproc_i2c_resume
> 

This latest change looks good to me. Thanks a lot!

Acked-by: Ray Jui <ray.jui@broadcom.com>

--000000000000b20bcf05c3df9701
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Pi3DQoJNNR5cV1dw3cNMKQyHRziEjFTVmILshClu9AljdXzCUoHXDUbge8TIJ/fK36qTGCYWwA01
rTB3drVX3FZq/Uqo0JnVcyP1dtYVzQIDAQABo4IB1TCCAdEwDgYDVR0PAQH/BAQDAgWgMIGjBggr
BgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9j
YWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8v
b2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBE
MEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20v
cmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2Jh
bHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAfBgNVHREEGDAWgRRyYXku
anVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdb
NHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU5E1VdIocTRYIpXh6e6OnGvwfrEgwDQYJKoZIhvcNAQEL
BQADggEBADcZteuA4mZVmXNzp/tJky+9TS87L/xAogg4z+0bFDomA2JdNGKjraV7jE3LKHUyCQzU
Bvp8xXjxCndLBgltr+2Fn/Dna/f29iAs4mPBxgPKhqnqpQuTo2DLID2LWU1SLI9ewIlROY57UCvO
B6ni+9NcOot0MbKF2A1TnzJjWyd127CVyU5vL3un1/tbtmjiT4Ku8ZDoBEViuuWyhdB6TTEQiwDo
2NxZdezRkkkq+RoNek6gmtl8IKmXsmr1dKIsRBtLQ0xu+kdX+zYJbAQymI1mkq8qCmFAe5aJkrNM
NbsYBZGZlcox4dHWayCpn4sK+41xyJsmGrygY3zghqBuHPUxggJtMIICaQIBATBrMFsxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdD
QyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxnTAexrtwIst251kUwDQYJYIZIAWUDBAIBBQCg
gdQwLwYJKoZIhvcNAQkEMSIEIOs22/vBWthPEMDA6RZXZW9jLUH+kRlIuBk33JUk/L0bMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDYwMzE3MDYxM1owaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQBbSAQuIEu0XRYGAcRSkVgB9TtOoLN5MGcAduhsii0ITtnGqIcb2dqVMoAl9v4rF4e79Ujh
w+Em1WMJrpNaKpe2BPx4nA9ecPvmxCrU+I+NU+Bol2PgsXucuw0ZLfcRHoUqUUHKOTcBg5SaUe1Y
+6VVJmnApSbA1fwy2yMMw+r6ZZNm++T2VXQLOdsDxJlq4HsW8gP37LIYmr+cuqyITJNtFOncDqPG
G7HTBjMGxazgu2fV05Ko9PGkrSQQlbbSbiOuwVWEBQ8V01sIjIdgjD+komEPdqqrr2QAO0n6q2Pe
71VieyBR+/X9w5bxyuB2kqXNfCI2JfzwVHqnB4mvKhWk
--000000000000b20bcf05c3df9701--
