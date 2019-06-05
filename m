Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 981D5355A2
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 05:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfFED1P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 23:27:15 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:35598 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfFED1O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 23:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1559705233; x=1591241233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VXjX19MVgR+03nnn2b8Q+rJ+rQtez95FczrcM8VTBYg=;
  b=FU5fDu6MCrgqbu/UZlG6Gpkg+MC8M6QEzGOA3TXG7CV0h9Apk6CDx35o
   CSuTcM3v2vSo62WvH6/tVFIA+/RJ5wlwBlgnNf3pwbB4hvnLqwaoNmJH1
   0w/V8rvxXGlVpoV96NzlMFfQkTchaJMUPvrlfTtwYcBcat9dL6mvxbZkR
   c=;
X-IronPort-AV: E=Sophos;i="5.60,550,1549929600"; 
   d="scan'208";a="769017448"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 05 Jun 2019 03:27:11 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS id 96D3CA230D;
        Wed,  5 Jun 2019 03:27:10 +0000 (UTC)
Received: from EX13D05UWB003.ant.amazon.com (10.43.161.26) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 03:27:10 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05UWB003.ant.amazon.com (10.43.161.26) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Jun 2019 03:27:09 +0000
Received: from localhost (10.85.18.74) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Wed, 5 Jun 2019 03:27:09 +0000
Date:   Tue, 4 Jun 2019 20:27:09 -0700
From:   Eduardo Valentin <eduval@amazon.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Eduardo Valentin <eduval@amazon.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <brendanhiggins@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] i2c: slave-mqueue: add a slave backend to receive
 and queue messages
Message-ID: <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
References: <20190531043347.4196-1-eduval@amazon.com>
 <20190531043347.4196-3-eduval@amazon.com>
 <20190604171611.GS9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190604171611.GS9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hey Andry,

Long time no seeing :-)

On Tue, Jun 04, 2019 at 08:16:11PM +0300, Andy Shevchenko wrote:
> On Thu, May 30, 2019 at 09:33:46PM -0700, Eduardo Valentin wrote:
> > From: Haiyue Wang <haiyue.wang@linux.intel.com>
> > 
> > Some protocols over I2C are designed for bi-directional transferring
> > messages by using I2C Master Write protocol. Like the MCTP (Management
> > Component Transport Protocol) and IPMB (Intelligent Platform Management
> > Bus), they both require that the userspace can receive messages from
> > I2C dirvers under slave mode.
> > 
> > This new slave mqueue backend is used to receive and queue messages, it
> > will exposes these messages to userspace by sysfs bin file.
> > 
> > Note: DT interface and a couple of minor fixes here and there
> > by Eduardo, so I kept the original authorship here.
> 
> > +#define MQ_MSGBUF_SIZE		CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE
> > +#define MQ_QUEUE_SIZE		CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE
> 
> > +#define MQ_QUEUE_NEXT(x)	(((x) + 1) & (MQ_QUEUE_SIZE - 1))
> 
> Also possible ((x + 1) % ..._SIZE)

Right.. but I suppose the original idea is to avoid divisions on the hotpath.

So, I am actually fine with the limitation of only using power of 2.

> 
> > +	mq = dev_get_drvdata(container_of(kobj, struct device, kobj));
> 
> kobj_to_dev()

Well, yeah, I guess this is a nit, but I can add that in case of a real need for a v7.

> 
> > +static int i2c_slave_mqueue_probe(struct i2c_client *client,
> > +				  const struct i2c_device_id *id)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct mq_queue *mq;
> > +	int ret, i;
> > +	void *buf;
> > +
> > +	mq = devm_kzalloc(dev, sizeof(*mq), GFP_KERNEL);
> > +	if (!mq)
> > +		return -ENOMEM;
> > +
> 
> > +	BUILD_BUG_ON(!is_power_of_2(MQ_QUEUE_SIZE));
> 
> Perhaps start function with this kind of assertions?
> 


same here, in case I see a huge ask for a v7, I can move this up.

> > +
> > +	buf = devm_kmalloc_array(dev, MQ_QUEUE_SIZE, MQ_MSGBUF_SIZE,
> > +				 GFP_KERNEL);
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < MQ_QUEUE_SIZE; i++)
> > +		mq->queue[i].buf = buf + i * MQ_MSGBUF_SIZE;
> 
> 
> Just wondering if kfifo API can bring an advantage here?
> 

Well, then again, I suppose the idea is simplify here, not if we need to go
kfifo as the Protocol on top of this is perfectly fine with the current
discipline of just having a simple drop of older messages.


> > +	return 0;
> > +}
> 
> > +static const struct of_device_id i2c_slave_mqueue_of_match[] = {
> > +	{
> > +		.compatible = "i2c-slave-mqueue",
> > +	},
> 
> > +	{ },
> 
> No need for comma here.

It does not hurt to have it either :-)

> 
> > +};
> 
> > +
> > +static struct i2c_driver i2c_slave_mqueue_driver = {
> > +	.driver = {
> > +		.name	= "i2c-slave-mqueue",
> 
> > +		.of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> 
> Wouldn't compiler warn you due to unused data?
> Perhaps drop of_match_ptr() for good...


Not sure what you meant here. I dont see any compiler warning.
Also, of_match_ptr seams to be well spread in the kernel.
> 
> > +	},
> > +	.probe		= i2c_slave_mqueue_probe,
> > +	.remove		= i2c_slave_mqueue_remove,
> > +	.id_table	= i2c_slave_mqueue_id,
> > +};
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
All the best,
Eduardo Valentin
