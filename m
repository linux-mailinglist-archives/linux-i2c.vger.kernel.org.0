Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A14AB34E88
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 19:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbfFDRQS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 13:16:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:2047 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfFDRQS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 13:16:18 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 10:16:17 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga006.jf.intel.com with ESMTP; 04 Jun 2019 10:16:11 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1hYD2h-0001Jc-6c; Tue, 04 Jun 2019 20:16:11 +0300
Date:   Tue, 4 Jun 2019 20:16:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        jarkko.nikula@linux.intel.com, brendanhiggins@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: slave-mqueue: add a slave backend to receive
 and queue messages
Message-ID: <20190604171611.GS9224@smile.fi.intel.com>
References: <20190531043347.4196-1-eduval@amazon.com>
 <20190531043347.4196-3-eduval@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531043347.4196-3-eduval@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 30, 2019 at 09:33:46PM -0700, Eduardo Valentin wrote:
> From: Haiyue Wang <haiyue.wang@linux.intel.com>
> 
> Some protocols over I2C are designed for bi-directional transferring
> messages by using I2C Master Write protocol. Like the MCTP (Management
> Component Transport Protocol) and IPMB (Intelligent Platform Management
> Bus), they both require that the userspace can receive messages from
> I2C dirvers under slave mode.
> 
> This new slave mqueue backend is used to receive and queue messages, it
> will exposes these messages to userspace by sysfs bin file.
> 
> Note: DT interface and a couple of minor fixes here and there
> by Eduardo, so I kept the original authorship here.

> +#define MQ_MSGBUF_SIZE		CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE
> +#define MQ_QUEUE_SIZE		CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE

> +#define MQ_QUEUE_NEXT(x)	(((x) + 1) & (MQ_QUEUE_SIZE - 1))

Also possible ((x + 1) % ..._SIZE)

> +	mq = dev_get_drvdata(container_of(kobj, struct device, kobj));

kobj_to_dev()

> +static int i2c_slave_mqueue_probe(struct i2c_client *client,
> +				  const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct mq_queue *mq;
> +	int ret, i;
> +	void *buf;
> +
> +	mq = devm_kzalloc(dev, sizeof(*mq), GFP_KERNEL);
> +	if (!mq)
> +		return -ENOMEM;
> +

> +	BUILD_BUG_ON(!is_power_of_2(MQ_QUEUE_SIZE));

Perhaps start function with this kind of assertions?

> +
> +	buf = devm_kmalloc_array(dev, MQ_QUEUE_SIZE, MQ_MSGBUF_SIZE,
> +				 GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < MQ_QUEUE_SIZE; i++)
> +		mq->queue[i].buf = buf + i * MQ_MSGBUF_SIZE;


Just wondering if kfifo API can bring an advantage here?

> +	return 0;
> +}

> +static const struct of_device_id i2c_slave_mqueue_of_match[] = {
> +	{
> +		.compatible = "i2c-slave-mqueue",
> +	},

> +	{ },

No need for comma here.

> +};

> +
> +static struct i2c_driver i2c_slave_mqueue_driver = {
> +	.driver = {
> +		.name	= "i2c-slave-mqueue",

> +		.of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),

Wouldn't compiler warn you due to unused data?
Perhaps drop of_match_ptr() for good...

> +	},
> +	.probe		= i2c_slave_mqueue_probe,
> +	.remove		= i2c_slave_mqueue_remove,
> +	.id_table	= i2c_slave_mqueue_id,
> +};

-- 
With Best Regards,
Andy Shevchenko


