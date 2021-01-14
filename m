Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2ED02F5650
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 02:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbhANBp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jan 2021 20:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbhANA75 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jan 2021 19:59:57 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4727DC061575;
        Wed, 13 Jan 2021 16:48:26 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id q25so4204969oij.10;
        Wed, 13 Jan 2021 16:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=wJkqnPxU1YkrbN+UDOc3D0LJgluiUI3291TLWT8POgk=;
        b=NYFh9Lb78j4D8zgZZ0tAZ2OiqXhnnLUk5JmnqnDUVTFbLftRqSeP2FocvG/t6xEv8g
         M6k+gPmAjrBViPin8szBXaIkx2phSMgb7zm+jfelAphDs/e6PzrhwPSCfj96G+GvejkI
         RhoCQG1UctFkVmduviHaYiTiLZg4ecbVgRTFxu3qoV+6TDI65APzBjAIFNZp53SwYfO3
         A3K6+g/6xx2pBKpgFJ9/+frnRIC9lGhk4oT8thnsSsHJyM4F6IAn4zorxkg5AMvGxN8F
         Gg5nUajbi9187WuGwGsujldpvRZqnf/A4nODxYuIlmKLs7TX51PiBHbxnC7lxchEwyyY
         8IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=wJkqnPxU1YkrbN+UDOc3D0LJgluiUI3291TLWT8POgk=;
        b=MEYN30SXqTbosd3MHKQDfwNoTtO0McKK15wOZ737cqvDaIa85bfOIbEDyht5r6oSvx
         PE2iBKyina8YE0BWrO+S6pAFIJ9co73yeQ19BV2bNQsyJan0Z4oEmL3VAVmJ9N6T+3dP
         V1OgaArplfiVt+jaKwEcVGtaPR7xZTyN35hGd4nJq9bgZiBGCY4oCyvsUSql/zyqc/E3
         DxNazp+BKOGnhcfbqAi4QM0m5QaXZZtaFtlMIdBWscQRDcWfv32oGQ6ahecSQocvvmXT
         aOWhCn2rOGgR86E4hVqLR9d4taodkU8PDsCXzI/iM6DK78xbEcMDlXDfNSq9S2gvdWUX
         juSw==
X-Gm-Message-State: AOAM5300+o7zHYoFBI5EEqJrclDx+ujnzY95fD0PY5ipiwI/DFI1FIPO
        BtZYosWSzxqmdfCfRceqxw==
X-Google-Smtp-Source: ABdhPJyYWs3Edb8Tbme/fK5nTTSKL6NfemIK2Bx/YwIlkjyylw+A+Hy9AjLGM1C5h//PfZ/Z39wuSw==
X-Received: by 2002:a54:4583:: with SMTP id z3mr1167805oib.19.1610585305630;
        Wed, 13 Jan 2021 16:48:25 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
        by smtp.gmail.com with ESMTPSA id w9sm769826otq.44.2021.01.13.16.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 16:48:24 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:7896:6f6f:4943:c2d6])
        by serve.minyard.net (Postfix) with ESMTPSA id A73BE182235;
        Thu, 14 Jan 2021 00:48:23 +0000 (UTC)
Date:   Wed, 13 Jan 2021 18:48:22 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        Vijay Khemka <vijaykhemka@fb.com>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
Subject: Re: [PATCH RFC 3/3] ipmi: remove open coded version of SMBus block
 write
Message-ID: <20210114004822.GY3348@minyard.net>
Reply-To: minyard@acm.org
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112164130.47895-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 12, 2021 at 05:41:29PM +0100, Wolfram Sang wrote:
> The block-write function of the core was not used because there was no
> client-struct to use. However, in this case it seems apropriate to use a
> temporary client struct. Because we are answering a request we recieved
> when being a client ourselves. So, convert the code to use a temporary
> client and use the block-write function of the I2C core.

I asked the original authors of this about the change, and apparently is
results in a stack size warning.  Arnd Bergmann ask for it to be changed
from what you are suggesting to what it currently is.  See:

https://www.lkml.org/lkml/2019/6/19/440

So apparently this change will cause compile warnings due to the size of
struct i2c_client.

-corey

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 382b28f1cf2f..10d89886e5f3 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -137,7 +137,7 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  {
>  	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
>  	u8 rq_sa, netf_rq_lun, msg_len;
> -	union i2c_smbus_data data;
> +	struct i2c_client temp_client;
>  	u8 msg[MAX_MSG_LEN];
>  	ssize_t ret;
>  
> @@ -160,21 +160,16 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
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
> +	memcpy(&temp_client, ipmb_dev->client, sizeof(temp_client));
> +	temp_client.addr = rq_sa;
>  
> -	data.block[0] = msg_len;
> -	memcpy(&data.block[1], msg + SMBUS_MSG_IDX_OFFSET, msg_len);
> -	ret = i2c_smbus_xfer(ipmb_dev->client->adapter, rq_sa,
> -			     ipmb_dev->client->flags,
> -			     I2C_SMBUS_WRITE, netf_rq_lun,
> -			     I2C_SMBUS_BLOCK_DATA, &data);
> -
> -	return ret ? : count;
> +	ret = i2c_smbus_write_block_data(&temp_client, netf_rq_lun, msg_len,
> +					 msg + SMBUS_MSG_IDX_OFFSET);
> +	return ret < 0 ? ret : count;
>  }
>  
>  static __poll_t ipmb_poll(struct file *file, poll_table *wait)
> -- 
> 2.29.2
> 
