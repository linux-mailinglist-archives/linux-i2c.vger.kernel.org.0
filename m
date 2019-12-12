Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01A611D1F7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2019 17:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbfLLQLX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 11:11:23 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39027 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729675AbfLLQLW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 11:11:22 -0500
Received: from [109.168.11.45] (port=43476 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ifR3e-007CSs-Hw; Thu, 12 Dec 2019 17:11:18 +0100
Subject: Re: [PATCH 07/10] i2c: Add driver for AD242x bus controller
To:     Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-9-daniel@zonque.org>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
Date:   Thu, 12 Dec 2019 17:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-9-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On 09/12/19 19:35, Daniel Mack wrote:
> This device must be instantiated as a sub-device of the AD242x MFD
> device.
> 
> In order to access remote I2C peripherals, the master node is configured
> to the slave node number and the remote I2C client address on the remote
> side, and then the payload is sent to the BUS client of the master node,
> which transparently proxies the traffic through.

This remote I2C feature in these chips is interesting. It looks somewhat
similar to remote I2C in the video serdes chip by TI and Maxim, but it's
different from both of them. So now we have 3 vendors implementing the
same feature in 3 different ways.

Cool.

> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  drivers/i2c/busses/Kconfig      |  10 ++
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-ad242x.c | 178 ++++++++++++++++++++++++++++++++
>  3 files changed, 189 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ad242x.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6a0aa76859f3..b9cf049bedb0 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -365,6 +365,16 @@ config I2C_POWERMAC
>  
>  comment "I2C system bus drivers (mostly embedded / system-on-chip)"
>  
> +config I2C_AD242X
> +	tristate "Analog Devices AD242x"
> +	depends on MFD_AD242X
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C bus controller function of AD242x slave nodes.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-ad242x.
> +
>  config I2C_ALTERA
>  	tristate "Altera Soft IP I2C"
>  	depends on (ARCH_SOCFPGA || NIOS2) && OF
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3ab8aebc39c9..57c31ea8a477 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
>  obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
>  
>  # Embedded system I2C/SMBus host controller drivers
> +obj-$(CONFIG_I2C_AD242X)	+= i2c-ad242x.o
>  obj-$(CONFIG_I2C_ALTERA)	+= i2c-altera.o
>  obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
>  obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
> diff --git a/drivers/i2c/busses/i2c-ad242x.c b/drivers/i2c/busses/i2c-ad242x.c
> new file mode 100644
> index 000000000000..b94056653898
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ad242x.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mfd/ad242x.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct ad242x_i2c {
> +	struct device		*dev;
> +	struct ad242x_node	*node;
> +	struct i2c_adapter	adap;
> +	u32			node_index;
> +};
> +
> +static int ad242x_set_addr(struct ad242x_node *mnode,
> +			   struct ad242x_i2c_bus *bus,
> +			   uint8_t node_id, uint8_t addr)
> +{
> +	int ret;
> +	uint8_t buf[2] = { AD242X_CHIP, addr };
> +
> +	ret = regmap_update_bits(mnode->regmap, AD242X_NODEADR,
> +				 AD242X_NODEADR_PERI | AD242X_NODEADR_MASK,
> +				 node_id);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We can't use the slave's regmap here as it holds the same
> +	 * lock we also need to guard this context.
> +	 */
> +	ret = i2c_transfer_buffer_flags(bus->client,
> +					buf, sizeof(buf), 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_update_bits(mnode->regmap, AD242X_NODEADR,
> +				  AD242X_NODEADR_PERI, AD242X_NODEADR_PERI);
> +}
> +
> +static int ad242x_i2c_xfer(struct i2c_adapter *adap,
> +			   struct i2c_msg msgs[], int num)
> +{
> +	struct ad242x_i2c *i2c = adap->algo_data;
> +	struct ad242x_i2c_bus *bus = ad242x_master_get_bus(i2c->node->master);
> +	struct ad242x_node *mnode = ad242x_master_get_node(i2c->node->master);
> +	int ret, i, current_addr = -1;
> +
> +	mutex_lock(&bus->mutex);
> +
> +	for (i = 0; i < num; i++) {
> +		struct i2c_msg *msg = msgs + i;
> +
> +		if (msg->addr != current_addr) {
> +			ret = ad242x_set_addr(mnode, bus,
> +					      i2c->node->id, msg->addr);
> +			if (ret < 0) {
> +				dev_err(i2c->node->dev,
> +					"Cannot set address: %d\n", ret);
> +				break;
> +			}
> +
> +			current_addr = msg->addr;
> +		}
> +
> +		ret = i2c_transfer_buffer_flags(bus->client,
> +						msg->buf, msg->len, msg->flags);
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	mutex_unlock(&bus->mutex);
> +
> +	return ret < 0 ? ret : num;
> +}

Your implementation here looks quite clean and simple, and simple is
good, but I think there's a problem in this function. A "normal"
master_xfer function issues a repeated start between one msg and the
next one, at least in the typical case where all msgs have the same
slave address. Your implementation breaks repeated start. At first sight
we might need more complex code here to coalesce all consecutive msgs
with the same address into a single i2c_transfer() call.

-- 
Luca
