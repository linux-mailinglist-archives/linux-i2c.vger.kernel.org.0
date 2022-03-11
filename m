Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9239C4D5742
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 02:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345296AbiCKBUu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 20:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239939AbiCKBUu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 20:20:50 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EA3E2364;
        Thu, 10 Mar 2022 17:19:46 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id j5so5905659qvs.13;
        Thu, 10 Mar 2022 17:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BWLuHkhuLRrMWa8N+fItg7v8ydmq3TO/fXGntCYkO6Y=;
        b=SuZFZlMlkQQ4S0kNlTh30UByunM4Zhvp+V3yvzH/qoDsqzjS5ejE4svpd4iljAoCpe
         05CWTKkCU4/1y1Oer0zWzRR+rzc9qsKnfi/+O+5APKfE5w4C6685gA6L5M+eQr8VcMRU
         WoxEtvQGfQVnstvr0PVvn/XMJfnxpvQ7ppOqx/ijctdDbEWfeeu8sLFlCWe8zd8SiiR8
         bcyxFgqVt448XrBh1iTQACZZIpaZ+TQLBirITlFNPLl+RpX+lct2fy7UvwuNop1xCfvd
         IbXt454ECUwlSL6Hm9jm0BUcxvNpK46BayRtG2HvJGrt98Qjx/K64P+ZwN3DovFmbFzR
         labg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=BWLuHkhuLRrMWa8N+fItg7v8ydmq3TO/fXGntCYkO6Y=;
        b=4/w/4uCysV38TTs39LVwssYnRCgl7dgiU/TZBQXZ9VcyzL0cOLtTWq5SZhCjf6JQ7v
         dVZf1vdsDu2w7B5guucJRLruAp2K1U+JcLL4VcGqjdmURQWnfjLwikPzje+gJWXNE0aY
         OQ8OF8u0H28hOyRFmq8CNxNGIaJTPCe/GuXbfq5dKMsqVFGMr4ZdJtFLqg2oBNXzHwaR
         vNCPu5AVrYOHgGqJH8gc2mcTyIBMou8w8iBS0lFQQKCj/tJ4EsTmzq2Q3RfjipPa9JPB
         7emr8DLcaZPKIgHxz6q+3ifaAyQdab+Pcsnh7OZuyRnn4HD5vF19YOn3nLA4++BzK+lb
         DcIg==
X-Gm-Message-State: AOAM532dCwvBHHQeBCd+bxlXeF7zsRf0i7XaotVbhB4AUmH0idXMgQwr
        rnHAryXoKzup3xPBAt6vfQ==
X-Google-Smtp-Source: ABdhPJwL3ZWJehYxMf6yO6S5Io+T49q/ukI/FjtuleC1YSlSekImxG5KL9P6qWMS6cqySdCIpaq6Ig==
X-Received: by 2002:a05:6214:76b:b0:435:d12f:628f with SMTP id f11-20020a056214076b00b00435d12f628fmr5403209qvz.53.1646961585262;
        Thu, 10 Mar 2022 17:19:45 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id z6-20020ae9c106000000b0067d3b9ef387sm2727890qki.28.2022.03.10.17.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 17:19:44 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:dc9d:d155:a010:ac11])
        by serve.minyard.net (Postfix) with ESMTPSA id 2CC7E1800BC;
        Fri, 11 Mar 2022 01:19:43 +0000 (UTC)
Date:   Thu, 10 Mar 2022 19:19:42 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <20220311011942.GX3457@minyard.net>
Reply-To: minyard@acm.org
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220310114119.13736-2-quan@os.amperecomputing.com>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 10, 2022 at 06:41:16PM +0700, Quan Nguyen wrote:
> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
> in-band IPMI communication with their host in management (BMC) side.

Thanks for the update, and removing slave_enable().

I spent some quality time with this, and it looks like there are places
where you don't check lengths before indexing arrays.  I've marked
several of these, but you need to check it all through this.

I have a few other comments, too.

-corey

> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v6:
>   + Drop the use of slave_enable()                             [Wolfram]
>   + Make i2c-aspeed to issue RxCmdLast command on all
>   I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>   + Make i2c slave to return -EBUSY when it's busy                [Quan]
>   + Drop the aborting feature as return Completion Code 0xFF may stop
>   host to retry and make ipmi_ssif.so fails to load               [Quan]
>   + Add timer to recover slave from busy state when no response   [Quan]
>   + Clean request/response buffer appropriately                   [Quan]
>   + Add some minor change on error and warning messages           [Quan]
> 
> v5:
>   + None
> 
> v4:
>   + Send response with Completion code 0xFF when aborting         [Quan]
>   + Added bounding check on SMBus writes and the whole request     [Dan]
>   + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>     corruption if somehow buffer is written past the end           [Dan]
>   + Return -EINVAL if userspace buffer too small, dont
>     silence truncate                                       [Corey, Joel]
>   + Not necessary to check NONBLOCK in lock                      [Corey]
>   + Enforce one user at a time                                    [Joel]
>   + Reject write with invalid response length from userspace     [Corey]
>   + Add state machines for better ssif bmc state handling         [Quan]
>   + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>     SSIF BMC driver                                               [Quan]
>   + Change compatible string "aspeed,ast2500-ssif-bmc" to
>     "ampere,ssif-bmc"                                             [Quan]
>   + Abort current request with invalid SMBus write or
>     invalid command                                               [Quan]
>   + Abort all request if there is pending response                [Quan]
>   + Changed validate_pec() to validate_request()                  [Quan]
>   + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>   + Print internal state string for ease investigating issue      [Quan]
>   + Move to READY state on SLAVE_STOP event                       [Quan]
>   + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>   + Introduce functions for each slave event                      [Quan]
> 
> v3:
>   + Removed redundant license info                                [Joel]
>   + Switched to use traditional if-else                           [Joel]
>   + Removed unused ssif_bmc_ioctl()                               [Joel]
>   + Made handle_request()/complete_response() to return void      [Joel]
>   + Refactored send_ssif_bmc_response() and
>   receive_ssif_bmc_request()                                     [Corey]
>   + Removed mutex                                                [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>   + Removed the unnecessary memset                               [Corey]
>   + Switch to use dev_err()                                      [Corey]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
>  drivers/char/ipmi/Kconfig    |  11 +
>  drivers/char/ipmi/Makefile   |   1 +
>  drivers/char/ipmi/ssif_bmc.c | 791 +++++++++++++++++++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h | 102 +++++
>  4 files changed, 905 insertions(+)
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index b061e6b513ed..18a89093d64e 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
>  	  found on Aspeed SOCs (AST2400 and AST2500). The driver
>  	  implements the BMC side of the BT interface.
>  
> +config SSIF_IPMI_BMC
> +	tristate "SSIF IPMI BMC driver"
> +	select I2C
> +	select I2C_SLAVE
> +	help
> +	  This enables the IPMI SMBus system interface (SSIF) at the
> +	  management (BMC) side.
> +
> +	  The driver implements the BMC side of the SMBus system
> +	  interface (SSIF).
> +
>  config IPMB_DEVICE_INTERFACE
>  	tristate 'IPMB Interface handler'
>  	depends on I2C
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 7ce790efad92..cb6138b8ded9 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -30,3 +30,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>  obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> new file mode 100644
> index 000000000000..62db97773654
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -0,0 +1,791 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2022, Ampere Computing LLC
> + *
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +
> +#include "ssif_bmc.h"
> +
> +static const char *state_to_string(enum ssif_state state)
> +{
> +	switch (state) {
> +	case SSIF_READY:
> +		return "SSIF_READY";
> +	case SSIF_START:
> +		return "SSIF_START";
> +	case SSIF_SMBUS_CMD:
> +		return "SSIF_SMBUS_CMD";
> +	case SSIF_REQ_RECVING:
> +		return "SSIF_REQ_RECVING";
> +	case SSIF_RES_SENDING:
> +		return "SSIF_RES_SENDING";
> +	case SSIF_BAD_SMBUS:
> +		return "SSIF_BAD_SMBUS";
> +	default:
> +		return "SSIF_STATE_UNKNOWN";
> +	}
> +}
> +
> +/* Handle SSIF message that will be sent to user */
> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	struct ssif_msg msg;
> +	unsigned long flags;
> +	ssize_t ret;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	while (!ssif_bmc->request_available) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       ssif_bmc->request_available);
> +		if (ret)
> +			return ret;
> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	}
> +
> +	if (count < min_t(ssize_t, ssif_msg_len(&ssif_bmc->request), sizeof(struct ssif_msg))) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		ret = -EINVAL;
> +	} else {
> +		count = min_t(ssize_t, ssif_msg_len(&ssif_bmc->request), sizeof(struct ssif_msg));
> +		memcpy(&msg, &ssif_bmc->request, count);
> +		ssif_bmc->request_available = false;
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +		ret = copy_to_user(buf, &msg, count);
> +	}
> +
> +	return (ret < 0) ? ret : count;
> +}
> +
> +/* Handle SSIF message that is written by user */
> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
> +			      loff_t *ppos)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	struct ssif_msg msg;
> +	unsigned long flags;
> +	ssize_t ret;
> +
> +	if (count > sizeof(struct ssif_msg))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(&msg, buf, count);
> +	if (ret)
> +		return ret;
> +
> +	if (!msg.len || count < ssif_msg_len(&msg))
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	while (ssif_bmc->response_in_progress) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       !ssif_bmc->response_in_progress);
> +		if (ret)
> +			return ret;
> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	}
> +
> +	memcpy(&ssif_bmc->response, &msg, count);
> +	ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= MAX_PAYLOAD_PER_TRANSACTION + 1);
> +
> +	ssif_bmc->response_in_progress = true;
> +
> +	/* ssif_bmc not busy */
> +	ssif_bmc->busy = false;
> +
> +	if (ssif_bmc->response_timer_inited) {
> +		del_timer(&ssif_bmc->response_timer);
> +		ssif_bmc->response_timer_inited = false;
> +	}
> +	/* Clean old request buffer */
> +	memset(&ssif_bmc->request, 0, sizeof(struct ssif_msg));
> +
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	return count;
> +}
> +
> +static int ssif_bmc_open(struct inode *inode, struct file *file)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	int ret = 0;
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	if (!ssif_bmc->running)
> +		ssif_bmc->running = 1;
> +	else
> +		ret = -EBUSY;
> +	spin_unlock_irq(&ssif_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	unsigned int mask = 0;
> +
> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	/* The request is available, userspace application can get the request */
> +	if (ssif_bmc->request_available)
> +		mask |= POLLIN;
> +
> +	spin_unlock_irq(&ssif_bmc->lock);
> +
> +	return mask;
> +}
> +
> +static int ssif_bmc_release(struct inode *inode, struct file *file)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	ssif_bmc->running = 0;
> +	spin_unlock_irq(&ssif_bmc->lock);
> +
> +	return 0;
> +}
> +
> +/*
> + * System calls to device interface for user apps
> + */
> +static const struct file_operations ssif_bmc_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= ssif_bmc_open,
> +	.read		= ssif_bmc_read,
> +	.write		= ssif_bmc_write,
> +	.release	= ssif_bmc_release,
> +	.poll		= ssif_bmc_poll,
> +};
> +
> +/* Called with ssif_bmc->lock held. */
> +static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	/* Invalidate response in buffer to denote it having been sent. */
> +	ssif_bmc->response.len = 0;
> +	ssif_bmc->response_in_progress = false;
> +	ssif_bmc->nbytes_processed = 0;
> +	ssif_bmc->remain_len = 0;
> +	ssif_bmc->busy = false;
> +	memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);
> +	wake_up_all(&ssif_bmc->wait_queue);
> +}
> +
> +static void response_timeout(struct timer_list *t)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
> +	unsigned long flags;
> +

Is there a possible race here?  The timeout can happen at the same time
as a received message, will something bad happen if that's the case?

> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +
> +	/* Recover ssif_bmc from busy */
> +	ssif_bmc->busy = false;
> +	del_timer(&ssif_bmc->response_timer);

You don't need to delete the timer, it's in the timeout.

> +	ssif_bmc->response_timer_inited = false;
> +
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +}
> +
> +/* Called with ssif_bmc->lock held. */
> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	/* set ssif_bmc to busy waiting for response */
> +	ssif_bmc->busy = true;
> +
> +	/* Request message is available to process */
> +	ssif_bmc->request_available = true;
> +
> +	/* Clean old response buffer */
> +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
> +
> +	/* This is the new READ request.*/
> +	wake_up_all(&ssif_bmc->wait_queue);
> +
> +	/* Armed timer to recover slave from busy state in case of no response */
> +	if (!ssif_bmc->response_timer_inited) {
> +		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
> +		ssif_bmc->response_timer_inited = true;
> +	}
> +	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
> +}
> +
> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 response_len = 0;
> +	int idx = 0;
> +	u8 data_len;
> +
> +	data_len = ssif_bmc->response.len;
> +	switch (ssif_bmc->smbus_cmd) {
> +	case SSIF_IPMI_MULTIPART_READ_START:
> +		/*
> +		 * Read Start length is 32 bytes.
> +		 * Read Start transfer first 30 bytes of IPMI response
> +		 * and 2 special code 0x00, 0x01.
> +		 */
> +		*val = MAX_PAYLOAD_PER_TRANSACTION;
> +		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
> +		ssif_bmc->block_num = 0;

Do you need to validate the data length before using this?
This applies for lots of places through here.

> +
> +		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
> +		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
> +
> +		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
> +
> +		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
> +		       response_len);
> +		break;
> +
> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> +		/*
> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
> +		 * IPMI data plus block number byte.
> +		 */
> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
> +			/*
> +			 * This is READ End message
> +			 *  Return length is the remaining response data length
> +			 *  plus block number
> +			 *  Block number 0xFF is to indicate this is last message
> +			 *
> +			 */
> +			*val = ssif_bmc->remain_len + 1;
> +			ssif_bmc->block_num = 0xFF;
> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> +			response_len = ssif_bmc->remain_len;
> +			/* Clean the buffer */
> +			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
> +		} else {
> +			/*
> +			 * This is READ Middle message
> +			 *  Response length is the maximum SMBUS transfer length
> +			 *  Block number byte is incremented
> +			 * Return length is maximum SMBUS transfer length
> +			 */
> +			*val = MAX_PAYLOAD_PER_TRANSACTION;
> +			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> +			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> +			ssif_bmc->block_num++;
> +		}
> +
> +		memcpy(&ssif_bmc->response_buf[idx],
> +		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
> +		       response_len);
> +		break;
> +
> +	default:
> +		/* Do not expect to go to this case */
> +		dev_err(&ssif_bmc->client->dev,
> +			"%s: Unexpected SMBus command 0x%x\n",
> +			__func__, ssif_bmc->smbus_cmd);
> +		break;
> +	}
> +
> +	ssif_bmc->nbytes_processed += response_len;
> +}
> +
> +/* Process the IPMI response that will be read by master */
> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 *buf;
> +	u8 pec_len, addr, len;
> +	u8 pec = 0;
> +
> +	pec_len = ssif_bmc->pec_support ? 1 : 0;
> +	/* PEC - Start Read Address */
> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +	pec = i2c_smbus_pec(pec, &addr, 1);
> +	/* PEC - SSIF Command */
> +	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
> +	/* PEC - Restart Write Address */
> +	addr = addr | 0x01;
> +	pec = i2c_smbus_pec(pec, &addr, 1);
> +
> +	if (ssif_bmc->is_singlepart_read) {
> +		/* Single-part Read processing */
> +		buf = (u8 *)&ssif_bmc->response;
> +
> +		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
> +			ssif_bmc->msg_idx++;
> +			*val = buf[ssif_bmc->msg_idx];
> +		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
> +			ssif_bmc->msg_idx++;
> +			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
> +		} else {

I thought for a second that this was wrong, but I think it's correct.
Supply zero if you don't have data.

> +			*val = 0;
> +		}
> +		/* Invalidate response buffer to denote it is sent */
> +		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
> +			complete_response(ssif_bmc);
> +	} else {
> +		/* Multi-part Read processing */

You don't check the length here like you did above.  I think that's
required.

> +		switch (ssif_bmc->smbus_cmd) {
> +		case SSIF_IPMI_MULTIPART_READ_START:
> +		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> +			buf = (u8 *)&ssif_bmc->response_buf;
> +			*val = buf[ssif_bmc->msg_idx];
> +			ssif_bmc->msg_idx++;
> +			break;
> +		default:
> +			/* Do not expect to go to this case */
> +			dev_err(&ssif_bmc->client->dev,
> +				"%s: Unexpected SMBus command 0x%x\n",
> +				__func__, ssif_bmc->smbus_cmd);
> +			break;
> +		}
> +
> +		len = (ssif_bmc->block_num == 0xFF) ?
> +		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
> +		if (ssif_bmc->msg_idx == (len + 1)) {
> +			pec = i2c_smbus_pec(pec, &len, 1);
> +			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
> +		}
> +		/* Invalidate response buffer to denote last response is sent */
> +		if (ssif_bmc->block_num == 0xFF &&
> +		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
> +			complete_response(ssif_bmc);
> +		}
> +	}
> +}
> +
> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 *buf = (u8 *)&ssif_bmc->request;
> +
> +	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
> +		return;
> +
> +	switch (ssif_bmc->smbus_cmd) {
> +	case SSIF_IPMI_SINGLEPART_WRITE:
> +		buf[ssif_bmc->msg_idx - 1] = *val;
> +		ssif_bmc->msg_idx++;
> +
> +		break;
> +	case SSIF_IPMI_MULTIPART_WRITE_START:
> +		if (ssif_bmc->msg_idx == 1)
> +			ssif_bmc->request.len = 0;
> +
> +		fallthrough;
> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> +		/* The len should always be 32 */
> +		if (ssif_bmc->msg_idx == 1 && *val != MAX_PAYLOAD_PER_TRANSACTION)
> +			dev_warn(&ssif_bmc->client->dev,
> +				 "Warn: Invalid Multipart Write len");
> +
> +		fallthrough;
> +	case SSIF_IPMI_MULTIPART_WRITE_END:
> +		/* Multi-part write, 2nd byte received is length */
> +		if (ssif_bmc->msg_idx == 1) {
> +			if (*val > MAX_PAYLOAD_PER_TRANSACTION)
> +				dev_warn(&ssif_bmc->client->dev,
> +					 "Warn: Invalid Multipart Write End len");
> +
> +			ssif_bmc->request.len += *val;
> +			ssif_bmc->recv_len = *val;
> +
> +			/* request len should never exceeded 255 bytes */
> +			if (ssif_bmc->request.len > 255)
> +				dev_warn(&ssif_bmc->client->dev,
> +					 "Warn: Invalid request len");
> +
> +		} else {

You check msg_idx above, but I'm not sure that check will cover this
operation.

> +			buf[ssif_bmc->msg_idx - 1 +
> +			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
> +		}
> +
> +		ssif_bmc->msg_idx++;
> +
> +		break;
> +	default:
> +		/* Do not expect to go to this case */
> +		dev_err(&ssif_bmc->client->dev,
> +			"%s: Unexpected SMBus command 0x%x\n",
> +			__func__, ssif_bmc->smbus_cmd);
> +		break;
> +	}
> +}
> +
> +static bool validate_request(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	u8 rpec = 0, cpec = 0;
> +	bool ret = true;
> +	u8 addr, index;
> +	u8 *buf;
> +

Is there any length validation for using buf below?  It looks like you
are accessing without checking length, but maybe I missed something.

> +	buf = (u8 *)&ssif_bmc->request;
> +	switch (ssif_bmc->smbus_cmd) {
> +	case SSIF_IPMI_SINGLEPART_WRITE:
> +		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
> +			/* PEC is not included */
> +			ssif_bmc->pec_support = false;
> +			ret = true;
> +			goto exit;
> +		}
> +
> +		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
> +			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
> +				ssif_msg_len(&ssif_bmc->request));
> +			ret = false;
> +			goto exit;
> +		}
> +
> +		/* PEC is included */
> +		ssif_bmc->pec_support = true;
> +		rpec = buf[ssif_bmc->msg_idx - 2];
> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
> +		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
> +		if (rpec != cpec) {
> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
> +			ret = false;
> +		}
> +
> +		break;
> +	case SSIF_IPMI_MULTIPART_WRITE_START:
> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> +	case SSIF_IPMI_MULTIPART_WRITE_END:
> +		index = ssif_bmc->request.len - ssif_bmc->recv_len;
> +		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
> +			/* PEC is not included */
> +			ssif_bmc->pec_support = false;
> +			ret = true;
> +			goto exit;
> +		}
> +
> +		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
> +			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
> +				ssif_msg_len(&ssif_bmc->request));
> +			ret = false;
> +			goto exit;
> +		}
> +
> +		/* PEC is included */
> +		ssif_bmc->pec_support = true;
> +		rpec = buf[ssif_bmc->msg_idx - 2 + index];
> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);

Just curious, I'm not sure the client side PEC in the Linux driver has
ever been validated.  Have you tested both sides?

> +		/* As SMBus specification does not allow the length
> +		 * (byte count) in the Write-Block protocol to be zero.
> +		 * Therefore, it is illegal to have the last Middle
> +		 * transaction in the sequence carry 32-byte and have
> +		 * a length of ‘0’ in the End transaction.
> +		 * But some users may try to use this way and we should
> +		 * prevent ssif_bmc driver broken in this case.
> +		 */
> +		if (ssif_bmc->recv_len != 0)
> +			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
> +
> +		if (rpec != cpec) {
> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
> +			ret = false;
> +		}
> +
> +		break;
> +	default:
> +		/* Do not expect to go to this case */
> +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
> +			__func__, ssif_bmc->smbus_cmd);
> +		ret = false;
> +		break;
> +	}
> +
> +exit:
> +	return ret;
> +}
> +

Just a nit, more a general coding style comment.  It's almost always a
bad idea to put a negative (unsupported) into a check function.  You
often end up with something like:

	if (!unsupported_smbus_cmd(c))....

which looks a little strange.  Double negatives can make it hard to
follow and lead to mistakes.  This one isn't too bad, but sometimes it
can be.  It's better to do:

	if (supported_smbus_cmd(c))....
or
	if (!supported_smbus_cmd(c))....


> +static bool unsupported_smbus_cmd(u8 cmd)
> +{
> +	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
> +	    cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_END ||
> +	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
> +	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	/* SMBUS command can vary (single or multi-part) */
> +	ssif_bmc->smbus_cmd = *val;
> +	ssif_bmc->msg_idx++;
> +
> +	if (unsupported_smbus_cmd(*val))
> +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus command");
> +
> +	if (*val == SSIF_IPMI_SINGLEPART_WRITE ||
> +	    *val == SSIF_IPMI_MULTIPART_WRITE_START) {
> +		/*
> +		 * The response maybe not come in-time, causing host SSIF driver
> +		 * to timeout and resend a new request. In such case check for
> +		 * pending response and clear it
> +		 */
> +		if (ssif_bmc->response_in_progress)
> +			complete_response(ssif_bmc);
> +	}
> +}
> +
> +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> +	    ssif_bmc->state == SSIF_RES_SENDING) {
> +		ssif_bmc->state = SSIF_BAD_SMBUS;
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +
> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		ssif_bmc->state = SSIF_RES_SENDING;
> +	}
> +
> +	ssif_bmc->msg_idx = 0;
> +	if (ssif_bmc->is_singlepart_read)
> +		*val = ssif_bmc->response.len;
> +	else
> +		set_multipart_response_buffer(ssif_bmc, val);
> +}
> +
> +static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_BAD_SMBUS;
> +	}
> +
> +	handle_read_processed(ssif_bmc, val);
> +}
> +
> +static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	ssif_bmc->msg_idx = 0;
> +
> +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		ssif_bmc->state = SSIF_START;
> +
> +	} else if (ssif_bmc->state == SSIF_START ||
> +		   ssif_bmc->state == SSIF_REQ_RECVING ||
> +		   ssif_bmc->state == SSIF_RES_SENDING) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_BAD_SMBUS;
> +	}
> +}
> +
> +static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_RES_SENDING) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_BAD_SMBUS;
> +	} else if (ssif_bmc->state == SSIF_START) {
> +		ssif_bmc->state = SSIF_SMBUS_CMD;
> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		ssif_bmc->state = SSIF_REQ_RECVING;
> +	}
> +
> +	/* This is response sending state */
> +	if (ssif_bmc->state == SSIF_REQ_RECVING)
> +		handle_write_received(ssif_bmc, val);
> +	else if (ssif_bmc->state == SSIF_SMBUS_CMD)
> +		process_smbus_cmd(ssif_bmc, val);
> +}
> +
> +static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +
> +	} else if (ssif_bmc->state == SSIF_BAD_SMBUS) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s received SLAVE STOP from bad state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +
> +	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
> +		/* A BMC that receives an invalid request drop the data for the write
> +		 * transaction and any further transactions (read or write) until
> +		 * the next valid read or write Start transaction is received
> +		 */
> +		if (!validate_request(ssif_bmc))
> +			dev_err(&ssif_bmc->client->dev, "Error: invalid pec\n");
> +		else if (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> +			 ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END)
> +			handle_request(ssif_bmc);
> +	}
> +
> +	ssif_bmc->state = SSIF_READY;
> +	/* Reset message index */
> +	ssif_bmc->msg_idx = 0;
> +}
> +
> +/*
> + * Callback function to handle I2C slave events
> + */
> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
> +{
> +	unsigned long flags;
> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +
> +	switch (event) {
> +	case I2C_SLAVE_READ_REQUESTED:
> +		on_read_requested_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		on_write_requested_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_READ_PROCESSED:
> +		on_read_processed_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		on_write_received_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		on_stop_event(ssif_bmc, val);
> +		break;
> +
> +	default:
> +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event\n");
> +		break;
> +	}
> +
> +	if (ssif_bmc->busy)
> +		ret = -EBUSY;
> +
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc;
> +	int ret;
> +
> +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
> +	if (!ssif_bmc)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ssif_bmc->lock);
> +
> +	init_waitqueue_head(&ssif_bmc->wait_queue);
> +	ssif_bmc->request_available = false;
> +	ssif_bmc->response_in_progress = false;
> +	ssif_bmc->busy = false;
> +	ssif_bmc->response_timer_inited = false;
> +
> +	/* Register misc device interface */
> +	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	ssif_bmc->miscdev.name = DEVICE_NAME;
> +	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
> +	ssif_bmc->miscdev.parent = &client->dev;
> +	ret = misc_register(&ssif_bmc->miscdev);
> +	if (ret)
> +		goto out;
> +
> +	ssif_bmc->client = client;
> +	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
> +
> +	/* Register I2C slave */
> +	i2c_set_clientdata(client, ssif_bmc);
> +	ret = i2c_slave_register(client, ssif_bmc_cb);
> +	if (ret) {
> +		misc_deregister(&ssif_bmc->miscdev);
> +		goto out;
> +	}
> +
> +	return 0;
> +out:
> +	devm_kfree(&client->dev, ssif_bmc);
> +	return ret;
> +}
> +
> +static int ssif_bmc_remove(struct i2c_client *client)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> +
> +	i2c_slave_unregister(client);
> +	misc_deregister(&ssif_bmc->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ssif_bmc_match[] = {
> +	{ .compatible = "ampere,ssif-bmc" },
> +	{ },
> +};
> +
> +static const struct i2c_device_id ssif_bmc_id[] = {
> +	{ DEVICE_NAME, 0 },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
> +
> +static struct i2c_driver ssif_bmc_driver = {
> +	.driver         = {
> +		.name           = DEVICE_NAME,
> +		.of_match_table = ssif_bmc_match,
> +	},
> +	.probe          = ssif_bmc_probe,
> +	.remove         = ssif_bmc_remove,
> +	.id_table       = ssif_bmc_id,
> +};
> +
> +module_i2c_driver(ssif_bmc_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
> new file mode 100644
> index 000000000000..9a26f3c252cc
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2022, Ampere Computing LLC
> + *
> + */
> +#ifndef __SSIF_BMC_H__
> +#define __SSIF_BMC_H__
> +
> +#define DEVICE_NAME				"ipmi-ssif-host"
> +
> +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
> +
> +/* A standard SMBus Transaction is limited to 32 data bytes */
> +#define MAX_PAYLOAD_PER_TRANSACTION		32
> +
> +#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
> +
> +#define SSIF_IPMI_SINGLEPART_WRITE		0x2
> +#define SSIF_IPMI_SINGLEPART_READ		0x3
> +#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
> +#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
> +#define SSIF_IPMI_MULTIPART_READ_START		0x3
> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
> +
> +#define MSG_PAYLOAD_LEN_MAX			252
> +/*
> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
> + * Recover ssif_bmc from busy state if it takes upto 500ms
> + */
> +#define RESPONSE_TIMEOUT			500 /* ms */
> +
> +struct ssif_msg {
> +	u8 len;
> +	u8 netfn_lun;
> +	u8 cmd;
> +	u8 payload[MSG_PAYLOAD_LEN_MAX];
> +} __packed;
> +
> +static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
> +{
> +	return ssif_msg->len + 1;
> +}
> +
> +/*
> + * SSIF internal states:
> + *   SSIF_READY         0x00 : Ready state
> + *   SSIF_START         0x01 : Start smbus transaction
> + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
> + *   SSIF_REQ_RECVING   0x03 : Receiving request
> + *   SSIF_RES_SENDING   0x04 : Sending response
> + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
> + */
> +enum ssif_state {
> +	SSIF_READY,
> +	SSIF_START,
> +	SSIF_SMBUS_CMD,
> +	SSIF_REQ_RECVING,
> +	SSIF_RES_SENDING,
> +	SSIF_BAD_SMBUS,
> +	SSIF_STATE_MAX
> +};
> +
> +struct ssif_bmc_ctx {
> +	struct i2c_client	*client;
> +	struct miscdevice	miscdev;
> +	size_t			msg_idx;
> +	bool			pec_support;
> +	/* ssif bmc spinlock */
> +	spinlock_t		lock;
> +	wait_queue_head_t	wait_queue;
> +	u8			running;
> +	enum ssif_state		state;
> +	u8			smbus_cmd;
> +	/* Timeout waiting for response */
> +	struct timer_list	response_timer;
> +	bool                    response_timer_inited;
> +	/* Flag to identify a Multi-part Read Transaction */
> +	bool			is_singlepart_read;
> +	u8			nbytes_processed;
> +	u8			remain_len;
> +	u8			recv_len;
> +	/* Block Number of a Multi-part Read Transaction */
> +	u8			block_num;
> +	bool			request_available;
> +	bool			response_in_progress;
> +	bool			busy;
> +	/* Response buffer for Multi-part Read Transaction */
> +	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
> +	struct ssif_msg		response;
> +	struct ssif_msg		request;
> +};
> +
> +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
> +{
> +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
> +}
> +#endif /* __SSIF_BMC_H__ */
> -- 
> 2.35.1
> 
> 
