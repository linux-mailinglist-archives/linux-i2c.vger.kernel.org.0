Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0B24B16E4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 21:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242466AbiBJUZ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 15:25:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237230AbiBJUZ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 15:25:27 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C63D25C3;
        Thu, 10 Feb 2022 12:25:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z19so12540648lfq.13;
        Thu, 10 Feb 2022 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=f1G4gksxXpNjz4gxDIptW0tz9op3JLIzv2B4M3aYoC8=;
        b=fDaNfccz4/U8vvmfyT72lsLZ8bGv90E5iUaNjwemr+1HjZFrH2l5jTsbUoI/jXsc+k
         unlx4kTzlY31uGgzB9UxYWkTu9Ws7rqumEOEaJCxf+yiF+FOG7lbXVCn7Wf4ksypSDlt
         KQVn/y6DjFMfyZWZMjxjSaWOOkVXrIF3SKpTrXGOe01TLwmdaQAgD+BY1fj+77xt6cKx
         ihDmBzw33NMaT/ljlBjv1bnvL4sByp50yVKGpV0BRPUViu+s7hi2fiCwzYPLr/FhLRoJ
         2muIs5zQ8iraKrDpDWw9TzowGHDO2tEwoqLT6wWAyhdhEeGgjhtjZ5FsjrqMTfFvjuh3
         duiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f1G4gksxXpNjz4gxDIptW0tz9op3JLIzv2B4M3aYoC8=;
        b=hw/wXjcaa4MqE88wRLwA3HLrJzfXwVI3Nq9gLWrMGmZXI3MkVYFrOBM7GhIehhKwpp
         +WtbKEzmrEb7voI1upzgR7ICny4ARFBEOQooPZ29jZWRYsAEErdNnS63uh7pNXt5iXhc
         Ic2A9d7//bmcbhrt5OYUwlb0xMcuEUZLZwkMo8dKWKYcvhILzoIz0JiC5400YhIYDXVf
         fb2AtSEFT6CCqMIVomwFb7V7pST401NJYQoGsPa1L16RudAIxHCkqW6ydxlxCRnPgjaC
         l92gfhKiHGwch1pQHENNvdTaraYr3TLNQ9MLRD7y28BmSIR1mEshNKJw79g/hIiOHwpp
         GShA==
X-Gm-Message-State: AOAM531WuIu4W94Yxv9mzElvwYMFgS6Xx4aT52KKpYpEYm2IXx7Fh7ym
        ln7b4Nh658IJyZfYOu555+A=
X-Google-Smtp-Source: ABdhPJzXAlURqHV2rGsbHfgV+dz7QWQPzBmB9gODNT0gzDy7t2VB3tLep6lnW6D2SxZv43+FhL3fUw==
X-Received: by 2002:a19:610e:: with SMTP id v14mr6260883lfb.348.1644524725848;
        Thu, 10 Feb 2022 12:25:25 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id z22sm2902744lji.63.2022.02.10.12.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 12:25:24 -0800 (PST)
Message-ID: <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
Date:   Thu, 10 Feb 2022 23:25:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220210153603.61894-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.02.2022 18:36, Akhil R пишет:
> Emulate SMBus block read using ContinueXfer to read the length byte
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 03cea102ab76..2941e42aa6a0 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1233,6 +1233,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		return err;
>  
>  	i2c_dev->msg_buf = msg->buf;
> +
> +	/* The condition true implies smbus block read and len is already read */
> +	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
> +		i2c_dev->msg_buf = msg->buf + 1;
> +
>  	i2c_dev->msg_buf_remaining = msg->len;
>  	i2c_dev->msg_err = I2C_ERR_NONE;
>  	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
> @@ -1389,6 +1394,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			else
>  				end_type = MSG_END_REPEAT_START;
>  		}
> +		/* If M_RECV_LEN use ContinueXfer to read the first byte */
> +		if (msgs[i].flags & I2C_M_RECV_LEN) {
> +			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
> +			if (ret)
> +				break;
> +			/* Set the read byte as msg len */
> +			msgs[i].len = msgs[i].buf[0];
> +			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
> +		}
>  		ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
>  		if (ret)
>  			break;
> @@ -1416,10 +1430,10 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	u32 ret = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
> -		  I2C_FUNC_10BIT_ADDR |	I2C_FUNC_PROTOCOL_MANGLING;
> +		  I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
>  
>  	if (i2c_dev->hw->has_continue_xfer_support)
> -		ret |= I2C_FUNC_NOSTART;
> +		ret |= I2C_FUNC_NOSTART | I2C_FUNC_SMBUS_READ_BLOCK_DATA;
>  
>  	return ret;
>  }

Please describe how this was tested.
