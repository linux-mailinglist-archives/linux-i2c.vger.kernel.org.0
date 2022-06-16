Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC0F54EB73
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 22:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378527AbiFPUrv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 16:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378350AbiFPUrs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 16:47:48 -0400
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B180413F3E
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jun 2022 13:47:46 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 1wOxofIO0IaWO1wOxo5r6G; Thu, 16 Jun 2022 22:47:44 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 16 Jun 2022 22:47:44 +0200
X-ME-IP: 90.11.190.129
Message-ID: <7b9923c0-50f0-556a-657c-9cf0ef9af5aa@wanadoo.fr>
Date:   Thu, 16 Jun 2022 22:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: fr
To:     quan@os.amperecomputing.com
Cc:     andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, devicetree@vger.kernel.org,
        joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, minyard@acm.org,
        openbmc@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
        patches@amperecomputing.com, phong@os.amperecomputing.com,
        robh+dt@kernel.org, thang@os.amperecomputing.com, wsa@kernel.org
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-2-quan@os.amperecomputing.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220615090259.1121405-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 15/06/2022 à 11:02, Quan Nguyen a écrit :
> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
> in-band IPMI communication with their host in management (BMC) side.
> 
> Thanks Dan for the copy_from_user() fix in the link below.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan-shex6MNQR2J/SfDzf78azzKzEDxYleXD@public.gmane.org/
> Signed-off-by: Quan Nguyen <quan-shex6MNQR2J/SfDzf78azzKzEDxYleXD@public.gmane.org>
> ---

Hi,

a few nitpick below

[...]

> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> new file mode 100644
> index 000000000000..0bfd4b9bbaf1
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -0,0 +1,880 @@
> +// SPDX-License-Identifier: GPL-2.0-only
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
> +#include <linux/ipmi_ssif_bmc.h>
> +
> +#define DEVICE_NAME                             "ipmi-ssif-host"
> +
> +#define GET_8BIT_ADDR(addr_7bit)                (((addr_7bit) << 1) & 0xff)
> +
> +/* A standard SMBus Transaction is limited to 32 data bytes */
> +#define MAX_PAYLOAD_PER_TRANSACTION             32
> +/* Transaction includes the address, the command, the length and the PEC byte */
> +#define MAX_TRANSACTION                         (MAX_PAYLOAD_PER_TRANSACTION + 4)
> +
> +#define MAX_IPMI_DATA_PER_START_TRANSACTION     30
> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION    31
> +
> +#define SSIF_IPMI_SINGLEPART_WRITE              0x2
> +#define SSIF_IPMI_SINGLEPART_READ               0x3
> +#define SSIF_IPMI_MULTIPART_WRITE_START         0x6
> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE        0x7
> +#define SSIF_IPMI_MULTIPART_WRITE_END           0x8
> +#define SSIF_IPMI_MULTIPART_READ_START          0x3
> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE         0x9
> +
> +/*
> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
> + * Recover ssif_bmc from busy state if it takes up to 500ms
> + */
> +#define RESPONSE_TIMEOUT                        500 /* ms */
> +
> +struct ssif_part_buffer {
> +	u8 address;
> +	u8 smbus_cmd;
> +	u8 length;
> +	u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
> +	u8 pec;
> +	u8 index;
> +};
> +
> +/*
> + * SSIF internal states:
> + *   SSIF_READY         0x00 : Ready state
> + *   SSIF_START         0x01 : Start smbus transaction
> + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
> + *   SSIF_REQ_RECVING   0x03 : Receiving request
> + *   SSIF_RES_SENDING   0x04 : Sending response
> + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction

If these states are related to the enum just below, 
s/SSIF_BAD_SMBUS/SSIF_ABORTING/ + description update?

> + */
> +enum ssif_state {
> +	SSIF_READY,
> +	SSIF_START,
> +	SSIF_SMBUS_CMD,
> +	SSIF_REQ_RECVING,
> +	SSIF_RES_SENDING,
> +	SSIF_ABORTING,
> +	SSIF_STATE_MAX
> +};
> +

[...]

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

Could be "return ret;"
(see below)

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

This looks useless to me. The whole error handling path could be 
removed, or updated to only have the "misc_deregister()" above.

CJ

> +	return ret;
> +}


