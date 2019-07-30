Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78747B490
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 22:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfG3Uxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 16:53:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46452 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbfG3Ux2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jul 2019 16:53:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id c3so7318003pfa.13
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jul 2019 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RGi8YSyqfGHFxZ4qxqzTrqnfCbtBm7VBWTegRdqBqJA=;
        b=M54UzvXvvuwPcYffLeUbPfMGWrV7EgGeFXXZay6Jp7eWsxe24wEwnNq3h0IqfHEPtt
         j97FjJBplbL+HW2M+qoa/c/X8iqJ15uDqlq7DKkAkn23eP257BlqCsKNGjDp2oFfYRYG
         FeERJlxkUNpwBIJarL248E21HoCUXOTs58nds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RGi8YSyqfGHFxZ4qxqzTrqnfCbtBm7VBWTegRdqBqJA=;
        b=WsM0yvFEAmA/cm20zvCOfmk0ai45AYQLqJR5xwpuXiD+V7KNTGi1SY/u7IYfK28SJa
         kzPje2HTIJDC9n0wsLaWrEaxuniCeTVRwWrpNTwptCP0GAgAho9g50qSknMC7dvuBbhp
         pZBiO6Cx2f4djxdUi/p3vDBSLa1m1uVizbwNXqRsChYDLXwTvA4kArS5g0qh2h7B988k
         MaYal+qamtxvbMEDgNRMYMceD3zqdODclX3usr1aB0iqUpuk6mKBZo2UMtiqnWE9yzM4
         nOfkrj8CWBUq7nAvQcMwLBUInE3DnGdSYprV9nrjC8YzDmyuWuLu9nuyiXCcDQha0ZAY
         abbQ==
X-Gm-Message-State: APjAAAWrkUf8vXL9AkdSmqiC3kSkFpJrx5/HAPnVB8aayOVsD/ih49/u
        cm+4gTKweoVm/DZ8aMiTpB+kkw==
X-Google-Smtp-Source: APXvYqzh+qauyPlzUnXvJLah95lGU4CLhUnpH5T201YFRASrlH3tCF34TwBU9lCOYSYPr9aw5WG+fg==
X-Received: by 2002:a17:90a:d998:: with SMTP id d24mr91210113pjv.89.1564520007294;
        Tue, 30 Jul 2019 13:53:27 -0700 (PDT)
Received: from [10.136.8.239] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id z4sm55247034pgp.80.2019.07.30.13.53.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 13:53:26 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] i2c: iproc: Fix i2c master read more than 63 bytes
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>
References: <1563956907-21255-1-git-send-email-rayagonda.kokatanur@broadcom.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <8b8d83ce-70ba-eacd-7ea3-6f8425f1e0fc@broadcom.com>
Date:   Tue, 30 Jul 2019 13:53:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563956907-21255-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rayagonda,

On 7/24/2019 1:28 AM, Rayagonda Kokatanur wrote:
> Use SMBUS_MASTER_DATA_READ.MASTER_RD_STATUS bit to check for RX
> FIFO empty condition because SMBUS_MASTER_FIFO_CONTROL.MASTER_RX_PKT_COUNT
> is not updated for read >= 64 bytes. This fixes the issue when trying to
> read from the I2C slave more than 63 bytes.
> 
> Fixes: c24b8d574b7c ("i2c: iproc: Extend I2C read up to 255 bytes")
> 
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 2c7f145..d7fd76b 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -392,16 +392,18 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
>  static void bcm_iproc_i2c_read_valid_bytes(struct bcm_iproc_i2c_dev *iproc_i2c)
>  {
>  	struct i2c_msg *msg = iproc_i2c->msg;
> +	uint32_t val;
>  
>  	/* Read valid data from RX FIFO */
>  	while (iproc_i2c->rx_bytes < msg->len) {
> -		if (!((iproc_i2c_rd_reg(iproc_i2c, M_FIFO_CTRL_OFFSET) >> M_FIFO_RX_CNT_SHIFT)
> -		      & M_FIFO_RX_CNT_MASK))
> +		val = iproc_i2c_rd_reg(iproc_i2c, M_RX_OFFSET);
> +
> +		/* rx fifo empty */
> +		if (!((val >> M_RX_STATUS_SHIFT) & M_RX_STATUS_MASK))
>  			break;
>  
>  		msg->buf[iproc_i2c->rx_bytes] =
> -			(iproc_i2c_rd_reg(iproc_i2c, M_RX_OFFSET) >>
> -			M_RX_DATA_SHIFT) & M_RX_DATA_MASK;
> +			(val >> M_RX_DATA_SHIFT) & M_RX_DATA_MASK;
>  		iproc_i2c->rx_bytes++;
>  	}
>  }
> 

Thanks for the fix. This fix looks good to me!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
