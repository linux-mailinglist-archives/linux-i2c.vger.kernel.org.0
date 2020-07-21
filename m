Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD538227DED
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 12:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgGUK6g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 06:58:36 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:47848 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726611AbgGUK6e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 06:58:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595329113; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VU4DqtwT3aYjFZK+vCZ6Mf063e7LJok4TZ4IWKWCI9E=; b=Rvr46IoERBoazNH2oAMmetJDZ3UttwXGdtuP8MuPSycUyyWMpqtZaIl/qOBR1KF3TVMeifRQ
 vZcFZ6O0uLmv0qy3Os8zejcoMBCgTc5e99F7+V2YJyERMz7fRVeihyC7L231aiTA7oqlQaFn
 WzaVkgT3G3BVPfgXijdK0RFUc4c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f16ca501e603dbb4472bad1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 10:58:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E22AC43395; Tue, 21 Jul 2020 10:58:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.8] (unknown [106.213.150.157])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: msavaliy)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7271BC433C6;
        Tue, 21 Jul 2020 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7271BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=msavaliy@codeaurora.org
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com>
 <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
From:   "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Message-ID: <6d90f383-54d7-cee1-d064-dca51ce39e14@codeaurora.org>
Date:   Tue, 21 Jul 2020 16:28:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/21/2020 12:37 PM, Stephen Boyd wrote:
> Quoting Stephen Boyd (2020-07-20 22:59:14)
>> I worry that we also need a dmb() here to make sure the dma buffer is
>> properly mapped before this write to the device is attempted. But it may
>> only matter to be before the I2C_READ.
>>
> I'm suggesting this patch instead where we make geni_se_setup_m_cmd()
> use a writel() so that it has the proper barrier semantics to wait for
> the other memory writes that happened in program order before this point
> to complete before the device is kicked to do a read or a write.

Not sure if the issue was because of the barrier, but fundamentally for 
read operation, before FIFO data gets written by the DMA to memory,

buffer should be present. Hence the previous change from Doug seem to be 
fine as well.

> ----8<----
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 18d1e4fd4cf3..7f130829bf01 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -367,7 +367,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		geni_se_select_mode(se, GENI_SE_FIFO);
>   
>   	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> -	geni_se_setup_m_cmd(se, I2C_READ, m_param);
>   
>   	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
>   		geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -375,6 +374,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		dma_buf = NULL;
>   	}
>   
> +	geni_se_setup_m_cmd(se, I2C_READ, m_param);
> +
>   	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
> @@ -408,7 +409,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		geni_se_select_mode(se, GENI_SE_FIFO);
>   
>   	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
> -	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
>   
>   	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
>   		geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -416,6 +416,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		dma_buf = NULL;
>   	}
>   
> +	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
> +
>   	if (!dma_buf) /* Get FIFO IRQ */
>   		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>   
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd464943f717..1dc134e9eb36 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -262,7 +262,7 @@ static inline void geni_se_setup_m_cmd(struct geni_se *se, u32 cmd, u32 params)
>   	u32 m_cmd;
>   
>   	m_cmd = (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
> -	writel_relaxed(m_cmd, se->base + SE_GENI_M_CMD0);
> +	writel(m_cmd, se->base + SE_GENI_M_CMD0);
>   }
>   
>   /**
