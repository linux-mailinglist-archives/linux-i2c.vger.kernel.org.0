Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A1E30763C
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 13:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhA1Mis (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 07:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhA1Mim (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 07:38:42 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A19C061574
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 04:38:02 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id n42so4975443ota.12
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 04:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ic6h2SFkOzRN97sGVwqYqqaNZ1eJrrc6kgyyHGlVERY=;
        b=jMY/1HY3b9d5bJhF0yal4luLKK9YeW4Mp6JZH0NAUva1nb7zw8WTEonAlTxUcxkiaX
         91XgOvr8lRVV1WhBIn/cDVCOAHDc3947Vn2+48e4papRappbIv9ldMaqo0UofrBBD28l
         +1QMUhfHUwYsOb0I7YzrHzGRVZo9UL2j922LnlveSZJKmrTj3pUwsm3iLjEM16J4Dqk/
         ZprUtRFLiAHcgdG2FJGcE2gwbZPn3ncrSKHviGRRz0ad5vOzaynVCMwUdGITYUQssR9V
         lOawc006uc/F3tP4btcgZdApNHTFmhj7giU1s0gi/SSSnEjG/gFKso+NMOlGmy+CkIIn
         k17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=Ic6h2SFkOzRN97sGVwqYqqaNZ1eJrrc6kgyyHGlVERY=;
        b=D3TlaM7BBcsjj8L7V0oy8qslo1Wnh3zd//I68iHQcVOPui/+6DQi0uTu4/Bx+u5g6c
         CeAXuwA/86+LkwSV3rPQdHcL1YPyQUjQllR4Vo6rmy7sWLAHa0z+Pj/U5aE78ivCYIR/
         FzevgXP20ER/MNfv/+cKY45iEqySC2lktNpP32Mm9nZ7v0f7ucJrdCZ7fs0clCcRAU7r
         xLBDId4j2K+9AaAaLJa67tJYAYA/ca3eUmus6Ib5VphR6/CRCoWGuO81LlmsdR7UFAQG
         CaYsPfrNZyLnH+QcopqQ4AD5kkXwKWEHb8oc8lvxKbEx022Ffa73JfVRTcT9S0AhVnYV
         7fZg==
X-Gm-Message-State: AOAM533ff5Tp3yNub38cfEtvTKq8nkRFjW2+gZ4PgPPc/Jy121fercDZ
        R8H0s2rGL1cWGp711iMWJA5N7w==
X-Google-Smtp-Source: ABdhPJx2++uXhA/l2NGSQmog9eANjfBpbJ1mv58ElnQuc1TYJ8799n/KJXkZNKK5bHF7SeOtz7Fh6g==
X-Received: by 2002:a9d:66c1:: with SMTP id t1mr11251422otm.106.1611837481916;
        Thu, 28 Jan 2021 04:38:01 -0800 (PST)
Received: from minyard.net ([2001:470:b8f6:1b:d0e0:7e1d:debb:57fe])
        by smtp.gmail.com with ESMTPSA id o16sm936217ote.79.2021.01.28.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 04:37:58 -0800 (PST)
Date:   Thu, 28 Jan 2021 06:37:57 -0600
From:   Corey Minyard <cminyard@mvista.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Asmaa Mnebhi <asmaa@nvidia.com>,
        Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ipmi: remove open coded version of SMBus block
 write
Message-ID: <20210128123757.GW21462@minyard.net>
Reply-To: cminyard@mvista.com
References: <20210128085544.7609-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128085544.7609-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Looks good, do you want this in the IPMI tree or are you handling this
another way?

Thanks,

-corey

On Thu, Jan 28, 2021 at 09:55:43AM +0100, Wolfram Sang wrote:
> The block-write function of the core was not used because there was no
> client-struct to use. However, in this case it seems apropriate to use a
> temporary client struct. Because we are answering a request we recieved
> when being a client ourselves. So, convert the code to use a temporary
> client and use the block-write function of the I2C core.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> ---
> 
> No change since V1, Only added tags given in private communication.
> 
>  drivers/char/ipmi/ipmb_dev_int.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 382b28f1cf2f..49b8f22fdcf0 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -137,7 +137,7 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  {
>  	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
>  	u8 rq_sa, netf_rq_lun, msg_len;
> -	union i2c_smbus_data data;
> +	struct i2c_client *temp_client;
>  	u8 msg[MAX_MSG_LEN];
>  	ssize_t ret;
>  
> @@ -160,21 +160,21 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  	}
>  
>  	/*
> -	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> -	 * i2c_smbus_xfer
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg. Fill the
> +	 * temporary client. Note that its use is an exception for IPMI.
>  	 */
>  	msg_len = msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> -	if (msg_len > I2C_SMBUS_BLOCK_MAX)
> -		msg_len = I2C_SMBUS_BLOCK_MAX;
> +	temp_client = kmemdup(ipmb_dev->client, sizeof(*temp_client), GFP_KERNEL);
> +	if (!temp_client)
> +		return -ENOMEM;
> +
> +	temp_client->addr = rq_sa;
>  
> -	data.block[0] = msg_len;
> -	memcpy(&data.block[1], msg + SMBUS_MSG_IDX_OFFSET, msg_len);
> -	ret = i2c_smbus_xfer(ipmb_dev->client->adapter, rq_sa,
> -			     ipmb_dev->client->flags,
> -			     I2C_SMBUS_WRITE, netf_rq_lun,
> -			     I2C_SMBUS_BLOCK_DATA, &data);
> +	ret = i2c_smbus_write_block_data(temp_client, netf_rq_lun, msg_len,
> +					 msg + SMBUS_MSG_IDX_OFFSET);
> +	kfree(temp_client);
>  
> -	return ret ? : count;
> +	return ret < 0 ? ret : count;
>  }
>  
>  static __poll_t ipmb_poll(struct file *file, poll_table *wait)
> -- 
> 2.28.0
> 
