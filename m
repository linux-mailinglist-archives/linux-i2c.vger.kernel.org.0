Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248D52A2F7
	for <lists+linux-i2c@lfdr.de>; Sat, 25 May 2019 07:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfEYFKv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 May 2019 01:10:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:26584 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbfEYFKv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 May 2019 01:10:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2019 22:10:50 -0700
X-ExtLoop1: 1
Received: from haiyuewa-mobl.ccr.corp.intel.com (HELO [10.249.169.157]) ([10.249.169.157])
  by orsmga005.jf.intel.com with ESMTP; 24 May 2019 22:10:47 -0700
Subject: Re: [PATCH i2c/slave-mqueue v5] i2c: slave-mqueue: add a slave
 backend to receive and queue messages
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     wsa@the-dreams.de, brendanhiggins@google.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@intel.com, jae.hyun.yoo@linux.intel.com
References: <1524503192-4176-1-git-send-email-haiyue.wang@linux.intel.com>
 <20190523220345.GA3417@u40b0340c692b58f6553c.ant.amazon.com>
 <35a9d066-c732-cb00-04a5-438c948915ae@linux.intel.com>
 <20190524173353.GA6428@u40b0340c692b58f6553c.ant.amazon.com>
From:   "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <bf1e8f0b-5bd0-fb43-c19b-9487603b9ee3@linux.intel.com>
Date:   Sat, 25 May 2019 13:10:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524173353.GA6428@u40b0340c692b58f6553c.ant.amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2019-05-25 01:33, Eduardo Valentin 写道:
> Hey,
>
> On Fri, May 24, 2019 at 10:43:16AM +0800, Wang, Haiyue wrote:
>> Thanks for interest, the design idea is from:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-slave-eeprom.c?h=v5.2-rc1
>>
>> and
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/i2c/slave-interface
>>
>> Then you will get the answer. ;-)
> Well, maybe :-) see further comments inline..
Please see in line. And how about the test result in your real system ? 
It works as expected ?
>> BR,
>>
>> Haiyue
>>
>>
>> 在 2019-05-24 06:03, Eduardo Valentin 写道:
>>> Hey Wang,
>>>
>>> On Tue, Apr 24, 2018 at 01:06:32AM +0800, Haiyue Wang wrote:
>>>> Some protocols over I2C are designed for bi-directional transferring
>>>> messages by using I2C Master Write protocol. Like the MCTP (Management
>>>> Component Transport Protocol) and IPMB (Intelligent Platform Management
>>>> Bus), they both require that the userspace can receive messages from
>>>> I2C dirvers under slave mode.
>>>>
>>>> This new slave mqueue backend is used to receive and queue messages, it
>>>> will exposes these messages to userspace by sysfs bin file.
>>>>
>>>> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>>>> ---
>>>> v4 -> v5:
>>>>   - Typo: bellowing -> the below
>>>>
>>>> v3 -> v4:
>>>>   - Drop the small message after receiving I2C STOP.
>>>>
>>>> v2 -> v3:
>>>>   - Just remove the ';' after the end '}' of i2c_slave_mqueue_probe().
>>>>
>>>> v1 -> v2:
>>>>   - Change MQ_MSGBUF_SIZE and MQ_QUEUE_SIZE to be configurable by Kconfig.
>>>> ---
>>>>   Documentation/i2c/slave-mqueue-backend.rst | 125 ++++++++++++++++++
>>>>   drivers/i2c/Kconfig                        |  25 ++++
>>>>   drivers/i2c/Makefile                       |   1 +
>>>>   drivers/i2c/i2c-slave-mqueue.c             | 203 +++++++++++++++++++++++++++++
>>>>   4 files changed, 354 insertions(+)
>>>>   create mode 100644 Documentation/i2c/slave-mqueue-backend.rst
>>>>   create mode 100644 drivers/i2c/i2c-slave-mqueue.c
>>>>
>>>> diff --git a/Documentation/i2c/slave-mqueue-backend.rst b/Documentation/i2c/slave-mqueue-backend.rst
>>>> new file mode 100644
>>>> index 0000000..3966cf0
>>>> --- /dev/null
>>>> +++ b/Documentation/i2c/slave-mqueue-backend.rst
>>>> @@ -0,0 +1,125 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +=====================================
>>>> +Linux I2C slave message queue backend
>>>> +=====================================
>>>> +
>>>> +:Author: Haiyue Wang <haiyue.wang@linux.intel.com>
>>>> +
>>>> +Some protocols over I2C/SMBus are designed for bi-directional transferring
>>>> +messages by using I2C Master Write protocol. This requires that both sides
>>>> +of the communication have slave addresses.
>>>> +
>>>> +Like MCTP (Management Component Transport Protocol) and IPMB (Intelligent
>>>> +Platform Management Bus), they both require that the userspace can receive
>>>> +messages from i2c dirvers under slave mode.
>>>> +
>>>> +This I2C slave mqueue (message queue) backend is used to receive and queue
>>>> +messages from the remote i2c intelligent device; and it will add the target
>>>> +slave address (with R/W# bit is always 0) into the message at the first byte,
>>>> +so that userspace can use this byte to dispatch the messages into different
>>>> +handling modules. Also, like IPMB, the address byte is in its message format,
>>>> +it needs it to do checksum.
>>>> +
>>>> +For messages are time related, so this backend will flush the oldest message
>>>> +to queue the newest one.
>>>> +
>>>> +Link
>>>> +----
>>>> +`Intelligent Platform Management Bus
>>>> +Communications Protocol Specification
>>>> +<https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf>`_
>>>> +
>>>> +`Management Component Transport Protocol (MCTP)
>>>> +SMBus/I2C Transport Binding Specification
>>>> +<https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.1.0.pdf>`_
>>>> +
>>>> +How to use
>>>> +----------
>>>> +For example, the I2C5 bus has slave address 0x10, the below command will create
>>>> +the related message queue interface:
>>>> +
>>>> +    echo slave-mqueue 0x1010 > /sys/bus/i2c/devices/i2c-5/new_device
>>>> +
>>>> +Then you can dump the messages like this:
>>>> +
>>>> +    hexdump -C /sys/bus/i2c/devices/5-1010/slave-mqueue
>>>> +
>>>> +Code Example
>>>> +------------
>>>> +*Note: call 'lseek' before 'read', this is a requirement from kernfs' design.*
>>>> +
>>>> +::
>>>> +
>>>> +  #include <sys/types.h>
>>>> +  #include <sys/stat.h>
>>>> +  #include <unistd.h>
>>>> +  #include <poll.h>
>>>> +  #include <time.h>
>>>> +  #include <fcntl.h>
>>>> +  #include <stdio.h>
>>>> +
>>>> +  int main(int argc, char *argv[])
>>>> +  {
>>>> +          int i, r;
>>>> +          struct pollfd pfd;
>>>> +          struct timespec ts;
>>>> +          unsigned char data[256];
>>>> +
>>>> +          pfd.fd = open(argv[1], O_RDONLY | O_NONBLOCK);
>>>> +          if (pfd.fd < 0)
>>>> +                  return -1;
>>>> +
>>>> +          pfd.events = POLLPRI;
>>>> +
>>>> +          while (1) {
>>>> +                  r = poll(&pfd, 1, 5000);
>>>> +
>>>> +                  if (r < 0)
>>>> +                          break;
>>>> +
>>>> +                  if (r == 0 || !(pfd.revents & POLLPRI))
>>>> +                          continue;
>>>> +
>>>> +                  lseek(pfd.fd, 0, SEEK_SET);
>>>> +                  r = read(pfd.fd, data, sizeof(data));
>>>> +                  if (r <= 0)
>>>> +                          continue;
>>>> +
>>>> +                  clock_gettime(CLOCK_MONOTONIC, &ts);
>>>> +                  printf("[%ld.%.9ld] :", ts.tv_sec, ts.tv_nsec);
>>>> +                  for (i = 0; i < r; i++)
>>>> +                          printf(" %02x", data[i]);
>>>> +                  printf("\n");
>>>> +          }
>>>> +
>>>> +          close(pfd.fd);
>>>> +
>>>> +          return 0;
>>>> +  }
>>>> +
>>>> +Result
>>>> +------
>>>> +*./a.out "/sys/bus/i2c/devices/5-1010/slave-mqueue"*
>>>> +
>>>> +::
>>>> +
>>>> +  [10183.232500449] : 20 18 c8 2c 78 01 5b
>>>> +  [10183.479358348] : 20 18 c8 2c 78 01 5b
>>>> +  [10183.726556812] : 20 18 c8 2c 78 01 5b
>>>> +  [10183.972605863] : 20 18 c8 2c 78 01 5b
>>>> +  [10184.220124772] : 20 18 c8 2c 78 01 5b
>>>> +  [10184.467764166] : 20 18 c8 2c 78 01 5b
>>>> +  [10193.233421784] : 20 18 c8 2c 7c 01 57
>>>> +  [10193.480273460] : 20 18 c8 2c 7c 01 57
>>>> +  [10193.726788733] : 20 18 c8 2c 7c 01 57
>>>> +  [10193.972781945] : 20 18 c8 2c 7c 01 57
>>>> +  [10194.220487360] : 20 18 c8 2c 7c 01 57
>>>> +  [10194.468089259] : 20 18 c8 2c 7c 01 57
>>>> +  [10203.233433099] : 20 18 c8 2c 80 01 53
>>>> +  [10203.481058715] : 20 18 c8 2c 80 01 53
>>>> +  [10203.727610472] : 20 18 c8 2c 80 01 53
>>>> +  [10203.974044856] : 20 18 c8 2c 80 01 53
>>>> +  [10204.220734634] : 20 18 c8 2c 80 01 53
>>>> +  [10204.468461664] : 20 18 c8 2c 80 01 53
>>>> +
>>>> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
>>>> index efc3354..31e57d2 100644
>>>> --- a/drivers/i2c/Kconfig
>>>> +++ b/drivers/i2c/Kconfig
>>>> @@ -118,6 +118,31 @@ if I2C_SLAVE
>>>>   config I2C_SLAVE_EEPROM
>>>>   	tristate "I2C eeprom slave driver"
>>>> +config I2C_SLAVE_MQUEUE_MESSAGE_SIZE
>>>> +	int "The message size of I2C mqueue slave"
>>>> +	default 120
>>>> +
>>>> +config I2C_SLAVE_MQUEUE_QUEUE_SIZE
>>>> +	int "The queue size of I2C mqueue slave"
>>>> +	default 32
>>>> +	help
>>>> +	  This number MUST be power of 2.
>>>> +
>>>> +config I2C_SLAVE_MQUEUE
>>>> +	tristate "I2C mqueue (message queue) slave driver"
>>>> +	select I2C_SLAVE_MQUEUE_MESSAGE_SIZE
>>>> +	select I2C_SLAVE_MQUEUE_QUEUE_SIZE
>>>> +	help
>>>> +	  Some protocols over I2C are designed for bi-directional transferring
>>>> +	  messages by using I2C Master Write protocol. This driver is used to
>>>> +	  receive and queue messages from the remote I2C device.
>>>> +
>>>> +	  Userspace can get the messages by reading sysfs file that this driver
>>>> +	  exposes.
>>>> +
>>>> +	  This support is also available as a module. If so, the module will be
>>>> +	  called i2c-slave-mqueue.
>>>> +
>>>>   endif
>>>>   config I2C_DEBUG_CORE
>>>> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
>>>> index 72c94c6..7ec287b 100644
>>>> --- a/drivers/i2c/Makefile
>>>> +++ b/drivers/i2c/Makefile
>>>> @@ -16,6 +16,7 @@ obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
>>>>   obj-y				+= algos/ busses/ muxes/
>>>>   obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
>>>>   obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
>>>> +obj-$(CONFIG_I2C_SLAVE_MQUEUE)	+= i2c-slave-mqueue.o
>>>>   ccflags-$(CONFIG_I2C_DEBUG_CORE) := -DDEBUG
>>>>   CFLAGS_i2c-core-base.o := -Wno-deprecated-declarations
>>>> diff --git a/drivers/i2c/i2c-slave-mqueue.c b/drivers/i2c/i2c-slave-mqueue.c
>>>> new file mode 100644
>>>> index 0000000..424f435
>>>> --- /dev/null
>>>> +++ b/drivers/i2c/i2c-slave-mqueue.c
>>>> @@ -0,0 +1,203 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +// Copyright (c) 2017 - 2018, Intel Corporation.
>>>> +
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/spinlock.h>
>>>> +#include <linux/sysfs.h>
>>>> +
>>>> +#define MQ_MSGBUF_SIZE		CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE
>>>> +#define MQ_QUEUE_SIZE		CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE
>>>> +#define MQ_QUEUE_NEXT(x)	(((x) + 1) & (MQ_QUEUE_SIZE - 1))
>>>> +
>>>> +struct mq_msg {
>>>> +	int	len;
>>>> +	u8	*buf;
>>>> +};
>>>> +
>>>> +struct mq_queue {
>>>> +	struct bin_attribute	bin;
>>>> +	struct kernfs_node	*kn;
>>>> +
>>>> +	spinlock_t		lock; /* spinlock for queue index handling */
>>> I wonder why you decided to lock only in/out accesses and not the mq_queue struct.
>>>
>>>> +	int			in;
>>>> +	int			out;
>>>> +
>>>> +	struct mq_msg		*curr;
>>>> +	int			truncated; /* drop current if truncated */
>>>> +	struct mq_msg		queue[MQ_QUEUE_SIZE];
>>>> +};
>>>> +
>>>> +static int i2c_slave_mqueue_callback(struct i2c_client *client,
>>>> +				     enum i2c_slave_event event, u8 *val)
>>>> +{
>>>> +	struct mq_queue *mq = i2c_get_clientdata(client);
>>>> +	struct mq_msg *msg = mq->curr;
>>>> +	int ret = 0;
>>>> +
>>>> +	switch (event) {
>>>> +	case I2C_SLAVE_WRITE_REQUESTED:
>>>> +		mq->truncated = 0;
>>>> +
>>>> +		msg->len = 1;
>>>> +		msg->buf[0] = client->addr << 1;
>>>> +		break;
>>>> +
>>>> +	case I2C_SLAVE_WRITE_RECEIVED:
>>>> +		if (msg->len < MQ_MSGBUF_SIZE) {
>>>> +			msg->buf[msg->len++] = *val;
>>> Do we need to lock the accesses to msg->buf? how about to msg->len?
>
> this code goes access and modify data here, e.g. msg->len and msg->buf.
>
> On this case (I2C_SLAVE_WRITE_RECEIVED), this code wont protect access.
>
> This can cause concurrence issues if you receive an IRQ when the user
> is on your bin_read().

User will not touch 'msg = mq->curr;', just touch 'msg = 
&mq->queue[mq->out];'

>>>> +		} else {
>>>> +			dev_err(&client->dev, "message is truncated!\n");
>>>> +			mq->truncated = 1;
>>>> +			ret = -EINVAL;
>>>> +		}
>>>> +		break;
>>>> +
>>>> +	case I2C_SLAVE_STOP:
>>>> +		if (unlikely(mq->truncated || msg->len < 2))
>>>> +			break;
>>>> +
>>>> +		spin_lock(&mq->lock);
>>>> +		mq->in = MQ_QUEUE_NEXT(mq->in);
>>>> +		mq->curr = &mq->queue[mq->in];
>>>> +		mq->curr->len = 0;
>>>> +
>>>> +		/* Flush the oldest message */
>>>> +		if (mq->out == mq->in)
>>>> +			mq->out = MQ_QUEUE_NEXT(mq->out);
>>>> +		spin_unlock(&mq->lock);
>>>> +
> Here you protect most of it, but you still access msg->len for read.. with no protection.
>
>>>> +		kernfs_notify(mq->kn);
>>>> +		break;
>>>> +
>>>> +	default:
>>>> +		*val = 0xFF;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static ssize_t i2c_slave_mqueue_bin_read(struct file *filp,
>>>> +					 struct kobject *kobj,
>>>> +					 struct bin_attribute *attr,
>>>> +					 char *buf, loff_t pos, size_t count)
>>>> +{
>>>> +	struct mq_queue *mq;
>>>> +	struct mq_msg *msg;
>>>> +	unsigned long flags;
>>>> +	bool more = false;
>>>> +	ssize_t ret = 0;
>>>> +
>>>> +	mq = dev_get_drvdata(container_of(kobj, struct device, kobj));
>>>> +
>>>> +	spin_lock_irqsave(&mq->lock, flags);
>>>> +	if (mq->out != mq->in) {
>>>> +		msg = &mq->queue[mq->out];
>>>> +
>>>> +		if (msg->len <= count) {
>>>> +			ret = msg->len;
>>>> +			memcpy(buf, msg->buf, ret);
>>> Is buf a userspace pointer? should it be a copy_to_user() here?
The buf is the memory in kernel sysfs module.
>>>> +		} else {
>>>> +			ret = -EOVERFLOW; /* Drop this HUGE one. */
>>>> +		}
>>>> +
>>>> +		mq->out = MQ_QUEUE_NEXT(mq->out);
>>>> +		if (mq->out != mq->in)
>>>> +			more = true;
>>>> +	}
>>>> +	spin_unlock_irqrestore(&mq->lock, flags);
>>>> +
>>>> +	if (more)
>>>> +		kernfs_notify(mq->kn);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int i2c_slave_mqueue_probe(struct i2c_client *client,
>>>> +				  const struct i2c_device_id *id)
>>>> +{
>>>> +	struct device *dev = &client->dev;
>>>> +	struct mq_queue *mq;
>>>> +	int ret, i;
>>>> +	void *buf;
>>>> +
>>>> +	mq = devm_kzalloc(dev, sizeof(*mq), GFP_KERNEL);
>>>> +	if (!mq)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	BUILD_BUG_ON(!is_power_of_2(MQ_QUEUE_SIZE));
>>>> +
>>>> +	buf = devm_kmalloc_array(dev, MQ_QUEUE_SIZE, MQ_MSGBUF_SIZE,
>>>> +				 GFP_KERNEL);
>>>> +	if (!buf)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	for (i = 0; i < MQ_QUEUE_SIZE; i++)
>>>> +		mq->queue[i].buf = buf + i * MQ_MSGBUF_SIZE;
>>>> +
>>>> +	i2c_set_clientdata(client, mq);
>>>> +
>>>> +	spin_lock_init(&mq->lock);
>>>> +	mq->curr = &mq->queue[0];
>>>> +
>>>> +	sysfs_bin_attr_init(&mq->bin);
>>>> +	mq->bin.attr.name = "slave-mqueue";
>>>> +	mq->bin.attr.mode = 0400;
>>>> +	mq->bin.read = i2c_slave_mqueue_bin_read;
>>>> +	mq->bin.size = MQ_MSGBUF_SIZE * MQ_QUEUE_SIZE;
>>>> +
>>>> +	ret = sysfs_create_bin_file(&dev->kobj, &mq->bin);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	mq->kn = kernfs_find_and_get(dev->kobj.sd, mq->bin.attr.name);
>>>> +	if (!mq->kn) {
>>>> +		sysfs_remove_bin_file(&dev->kobj, &mq->bin);
>>>> +		return -EFAULT;
>>>> +	}
>>>> +
>>>> +	ret = i2c_slave_register(client, i2c_slave_mqueue_callback);
>>>> +	if (ret) {
>>>> +		kernfs_put(mq->kn);
>>>> +		sysfs_remove_bin_file(&dev->kobj, &mq->bin);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int i2c_slave_mqueue_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct mq_queue *mq = i2c_get_clientdata(client);
>>>> +
>>>> +	i2c_slave_unregister(client);
>>>> +
>>>> +	kernfs_put(mq->kn);
>>>> +	sysfs_remove_bin_file(&client->dev.kobj, &mq->bin);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct i2c_device_id i2c_slave_mqueue_id[] = {
>>>> +	{ "slave-mqueue", 0 },
>>>> +	{ }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(i2c, i2c_slave_mqueue_id);
>>>> +
>>>> +static struct i2c_driver i2c_slave_mqueue_driver = {
>>>> +	.driver = {
>>>> +		.name	= "i2c-slave-mqueue",
>>>> +	},
>>>> +	.probe		= i2c_slave_mqueue_probe,
>>>> +	.remove		= i2c_slave_mqueue_remove,
>>>> +	.id_table	= i2c_slave_mqueue_id,
>>>> +};
>>>> +module_i2c_driver(i2c_slave_mqueue_driver);
>>>> +
>>>> +MODULE_LICENSE("GPL v2");
>>>> +MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>>>> +MODULE_DESCRIPTION("I2C slave mode for receiving and queuing messages");
>>>> -- 
>>>> 2.7.4
>>>>
