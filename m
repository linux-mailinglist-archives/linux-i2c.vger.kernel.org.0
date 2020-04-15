Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01E01A99ED
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896162AbgDOKHg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:07:36 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:33840 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2896154AbgDOKHc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 06:07:32 -0400
Received: from [88.147.20.223] (port=52218 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jOex2-009Eu1-UU; Wed, 15 Apr 2020 12:07:24 +0200
Subject: Re: [RFC PATCH v2 6/6] i2c: core: hand over reserved devices when
 requesting ancillary addresses
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-7-wsa+renesas@sang-engineering.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <610bbd01-e245-3320-c315-7a5c945a700d@lucaceresoli.net>
Date:   Wed, 15 Apr 2020 12:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 18/03/20 16:00, Wolfram Sang wrote:
> With i2c_new_ancillary_address, we can check if the intended driver is
> requesting a reserved address. Update the function to do these checks.
> If the check passes, the "reserved" device will become a regular "dummy"
> device.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 84464e439df5..81fb320de28d 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -974,7 +974,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>  						const char *name,
>  						u16 default_addr)
>  {
> -	struct device_node *np = client->dev.of_node;
> +	struct device_node *reserved_np, *np = client->dev.of_node;
> +	struct device *reserved_dev, *adapter_dev = &client->adapter->dev;
> +	struct i2c_client *reserved_client = NULL;
>  	u32 addr = default_addr;
>  	int i;
>  
> @@ -984,7 +986,25 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>  			of_property_read_u32_index(np, "reg", i, &addr);
>  	}
>  
> -	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> +	dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);

Here if we have two identical chips on the same bus, they probably will
both add an ancillary device with the same name. Then a message like:

  i2c i2c-0: ds90ub954-q1: Address for rxport0: 0x40

won't tell which ds90ub954-q1 device is using that address. I'd rather
disambiguate using something like:

  dev_info(adapter_dev, "%s: Address for %s: 0x%x\n",
           dev_name(&client->dev), name, addr);

Sure, this issue did exist before this patch, but since the line is
being promoted from dbg to info (which is OK), it's probably a good idea
to improve the content, perhaps in a separate patch.

Except for that, I tested the patch and it's working fine.

-- 
Luca
