Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BFE2666C8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 19:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgIKRcq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 13:32:46 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46132 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725968AbgIKMyh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Sep 2020 08:54:37 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08BCfbnK015873;
        Fri, 11 Sep 2020 14:54:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=x5Q6h9ZwRvAHU7lHMpAaa2BGorzKOAXdfSnwZHGDXj0=;
 b=H9+U6/Xw3qPajeoZVAzL+jLf0dZ/ZueQFfnysXG4GQPta2nQM97/dObLUSBpuyHp2cB9
 uaG2c1sj1JhBMS7bEVdr2yAEiNnbgYazegOTe61cG8ytRhQc1I3wNSRJqblNOLXYdf70
 xA64gRpzNbHGykx32Tf8RfiGk3df366pL7ejnGdCaYypd1fU4fwinh0qY9brgsDL/MRq
 NCM5PSQaBecUk2OQTIlr7rNRPoNwJ6wSE5xxvaaGydDX9ti4XSFdV7EfpQ3Wv0WPYvmx
 A1wlmKUpYvichvNqe87Z9YIdNGVNKGaMpmn+I/qtczL6lptlmMNpIXJFoHI/HSuv65A3 lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33c1jfhprp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Sep 2020 14:54:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 374FD10002A;
        Fri, 11 Sep 2020 14:54:21 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 193682AC054;
        Fri, 11 Sep 2020 14:54:21 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Sep
 2020 14:54:20 +0200
Date:   Fri, 11 Sep 2020 14:54:19 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/1] i2c: add slave testunit driver
Message-ID: <20200911125419.GE23480@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>
References: <20200911071658.13966-1-wsa+renesas@sang-engineering.com>
 <20200911071658.13966-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200911071658.13966-2-wsa+renesas@sang-engineering.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-11_04:2020-09-10,2020-09-11 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

great that you published your slave-unittest driver.
I gave it a try rapidly and can confirm it works as expected on the stm32
platform. I tested with a loopback between 2 i2c controllers.

Both READ_BYTES and HOST_NOTIFY work like fine. For Host-Notify I just
rapidly added a print within the i2c_slave_host_notify_cb callback to
verify that it is received as expected.

I only have 2 small comments below.

Alain

On Fri, Sep 11, 2020 at 09:16:58AM +0200, Wolfram Sang wrote:
> Here is an I2C slave backend driver which allows to test some uncommon
> functionalities of the I2C and SMBus world. Usually, you need specific
> devices to test e.g. SMBus Host Notify and such. With this driver you
> just need the slave interface of another I2C controller.
> 
> This initial version has testcases for multi-master and SMBus Host
> Notify. Already planned but not yet implemented are SMBus Alert and
> messages with I2C_M_RECV_LEN.
> 
> Please read the documentation for further details.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since RFC:
> 
> * CMDs start at 0x01, we reserve 0x00 for RESET or something alike
> * invalid command numbers are now NACKed
> * byte_read returns a version number, not 0xff
> * reduced delay granularity from 100ms to 10ms
> * add locking between ISR and worker
> * i2c_msg and buffer are now local variables
> * more robust state machine initialization
> * made error reporting more generic
> * more documentation
> 
>  Documentation/i2c/slave-testunit-backend.rst |  66 +++++++
>  drivers/i2c/Kconfig                          |   8 +
>  drivers/i2c/Makefile                         |   1 +
>  drivers/i2c/i2c-slave-testunit.c             | 175 +++++++++++++++++++
>  4 files changed, 250 insertions(+)
>  create mode 100644 Documentation/i2c/slave-testunit-backend.rst
>  create mode 100644 drivers/i2c/i2c-slave-testunit.c
> 
> diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
> new file mode 100644
> index 000000000000..dce2878959cb
> --- /dev/null
> +++ b/Documentation/i2c/slave-testunit-backend.rst
> @@ -0,0 +1,66 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +================================
> +Linux I2C slave testunit backend
> +================================
> +
> +by Wolfram Sang <wsa@sang-engineering.com> in 2020
> +
> +This backend can be used to trigger test cases for I2C bus masters which
> +require a remote device with certain capabilities (and which are usually not so
> +easy to obtain). Examples include multi-master testing, and SMBus Host Notify
> +testing. For some tests, the I2C slave controller must be able to switch
> +between master and slave mode because it needs to send data, too.
> +
> +Note that this is a device for testing and debugging. It should not be enabled
> +in a production build. And while there is some versioning and we try hard to
> +keep backward compatibility, there is no stable ABI guaranteed!
> +
> +Instantiating the device is regular. Example for bus 0, address 0x30:
> +
> +# echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
> +
> +After that, you will have a write-only device listening. Reads will return an
> +8-bit version number. The device consists of 4 8-bit registers and all must be
> +written to start a testcase, i.e. you must always write 4 bytes to the device.
> +The registers are:
> +
> +0x00 CMD   - which test to trigger
> +0x01 DATAL - configuration byte 1 for the test
> +0x02 DATAH - configuration byte 2 for the test
> +0x03 DELAY - delay in n * 10ms until test is started
> +
> +Using 'i2cset' from the i2c-tools package, the generic command looks like:
> +
> +# i2cset -y <bus_num> <testunit_address> <CMD> <DATAL> <DATAH> <DELAY> i
> +
> +DELAY is a generic parameter which will delay the execution of the test in CMD.
> +The commands are described in the following section. An invalid command will
> +result in the transfer not being acknowledged.
> +
> +Commands
> +--------
> +
> +0x00 NOOP (reserved for future use)
> +
> +0x01 READ_BYTES (also needs master mode)
> +   DATAL - address to read data from
> +   DATAH - number of bytes to read
> +
> +This is useful to test if your bus master driver is handling multi-master
> +correctly. You can trigger the testunit to read bytes from another device on
> +the bus. If the bus master under test also wants to access the bus at the same
> +time, the bus will be busy. Example to read 128 bytes from device 0x50 after
> +50ms of delay:
> +
> +# i2cset -y 0 0x30 0x01 0x50 0x80 0x05 i
> +
> +0x02 SMBUS_HOST_NOTIFY (also needs master mode)
> +   DATAL - low byte of the status word to send
> +   DATAH - high byte of the status word to send
> +
> +This test will send an SMBUS_HOST_NOTIFY message to the host. Note that the
> +status word is currently ignored in the Linux Kernel. Example to send a
> +notification after 10ms:
> +
> +# i2cset -y 0 0x30 0x02 0x42 0x64 0x01 i
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index 5449729cdb87..438905e2a1d0 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -125,6 +125,14 @@ config I2C_SLAVE_EEPROM
>  	  This backend makes Linux behave like an I2C EEPROM. Please read
>  	  Documentation/i2c/slave-eeprom-backend.rst for further details.
>  
> +config I2C_SLAVE_TESTUNIT
> +	tristate "I2C eeprom testunit driver"

Should be tristate "I2C testunit driver" I believe (no eeprom)

> +	help
> +	  This backend can be used to trigger test cases for I2C bus masters
> +	  which require a remote device with certain capabilities, e.g.
> +	  multi-master, SMBus Host Notify, etc. Please read
> +	  Documentation/i2c/slave-testunit-backend.rst for further details.
> +
>  endif
>  
>  config I2C_DEBUG_CORE
> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
> index bed6ba63c983..c1d493dc9bac 100644
> --- a/drivers/i2c/Makefile
> +++ b/drivers/i2c/Makefile
> @@ -16,5 +16,6 @@ obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
>  obj-y				+= algos/ busses/ muxes/
>  obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
>  obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
> +obj-$(CONFIG_I2C_SLAVE_TESTUNIT)	+= i2c-slave-testunit.o
>  
>  ccflags-$(CONFIG_I2C_DEBUG_CORE) := -DDEBUG
> diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
> new file mode 100644
> index 000000000000..c288102de324
> --- /dev/null
> +++ b/drivers/i2c/i2c-slave-testunit.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * I2C slave mode testunit
> + *
> + * Copyright (C) 2020 by Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
> + * Copyright (C) 2020 by Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h> /* FIXME: is system_long_wq the best choice? */
> +
> +#define TU_CUR_VERSION 0x01
> +
> +enum testunit_cmds {
> +	TU_CMD_READ_BYTES = 1,	/* save 0 for ABORT, RESET or similar */
> +	TU_CMD_HOST_NOTIFY,
> +	TU_NUM_CMDS
> +};
> +
> +enum testunit_regs {
> +	TU_REG_CMD,
> +	TU_REG_DATAL,
> +	TU_REG_DATAH,
> +	TU_REG_DELAY,
> +	TU_NUM_REGS
> +};
> +
> +enum testunit_flags {
> +	TU_FLAG_IN_PROCESS,
> +};
> +
> +struct testunit_data {
> +	unsigned long flags;
> +	u8 regs[TU_NUM_REGS];
> +	u8 reg_idx;
> +	struct i2c_client *client;
> +	struct delayed_work worker;
> +};
> +
> +static void i2c_slave_testunit_work(struct work_struct *work)
> +{
> +	struct testunit_data *tu = container_of(work, struct testunit_data, worker.work);
> +	struct i2c_msg msg;
> +	u8 msgbuf[256];
> +	int ret = 0;
> +
> +	msg.addr = I2C_CLIENT_END;
> +	msg.buf = msgbuf;
> +
> +	switch (tu->regs[TU_REG_CMD]) {
> +	case TU_CMD_READ_BYTES:
> +		msg.addr = tu->regs[TU_REG_DATAL];
> +		msg.flags = I2C_M_RD;
> +		msg.len = tu->regs[TU_REG_DATAH];

Some protection might be needed here since the size is coming straight from
the i2cset command while the buffer is limited to 256 bytes.

> +		break;
> +
> +	case TU_CMD_HOST_NOTIFY:
> +		msg.addr = 0x08;
> +		msg.flags = 0;
> +		msg.len = 3;
> +		msgbuf[0] = tu->client->addr;
> +		msgbuf[1] = tu->regs[TU_REG_DATAL];
> +		msgbuf[2] = tu->regs[TU_REG_DATAH];
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	if (msg.addr != I2C_CLIENT_END) {
> +		ret = i2c_transfer(tu->client->adapter, &msg, 1);
> +		/* convert '0 msgs transferred' to errno */
> +		ret = (ret == 0) ? -EIO : ret;
> +	}
> +
> +	if (ret < 0)
> +		dev_err(&tu->client->dev, "CMD%02X failed (%d)\n", tu->regs[TU_REG_CMD], ret);
> +
> +	clear_bit(TU_FLAG_IN_PROCESS, &tu->flags);
> +}
> +
> +static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
> +				     enum i2c_slave_event event, u8 *val)
> +{
> +	struct testunit_data *tu = i2c_get_clientdata(client);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
> +			return -EBUSY;
> +
> +		if (tu->reg_idx < TU_NUM_REGS)
> +			tu->regs[tu->reg_idx] = *val;
> +		else
> +			ret = -EMSGSIZE;
> +
> +		if (tu->reg_idx <= TU_NUM_REGS)
> +			tu->reg_idx++;
> +
> +		/* TU_REG_CMD always written at this point */
> +		if (tu->regs[TU_REG_CMD] >= TU_NUM_CMDS)
> +			ret = -EINVAL;
> +
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		if (tu->reg_idx == TU_NUM_REGS) {
> +			set_bit(TU_FLAG_IN_PROCESS, &tu->flags);
> +			queue_delayed_work(system_long_wq, &tu->worker,
> +					   msecs_to_jiffies(10 * tu->regs[TU_REG_DELAY]));
> +		}
> +		fallthrough;
> +
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		tu->reg_idx = 0;
> +		break;
> +
> +	case I2C_SLAVE_READ_REQUESTED:
> +	case I2C_SLAVE_READ_PROCESSED:
> +		*val = TU_CUR_VERSION;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int i2c_slave_testunit_probe(struct i2c_client *client)
> +{
> +	struct testunit_data *tu;
> +
> +	tu = devm_kzalloc(&client->dev, sizeof(struct testunit_data), GFP_KERNEL);
> +	if (!tu)
> +		return -ENOMEM;
> +
> +	tu->client = client;
> +	i2c_set_clientdata(client, tu);
> +	INIT_DELAYED_WORK(&tu->worker, i2c_slave_testunit_work);
> +
> +	return i2c_slave_register(client, i2c_slave_testunit_slave_cb);
> +};
> +
> +static int i2c_slave_testunit_remove(struct i2c_client *client)
> +{
> +	struct testunit_data *tu = i2c_get_clientdata(client);
> +
> +	cancel_delayed_work_sync(&tu->worker);
> +	i2c_slave_unregister(client);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id i2c_slave_testunit_id[] = {
> +	{ "slave-testunit", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, i2c_slave_testunit_id);
> +
> +static struct i2c_driver i2c_slave_testunit_driver = {
> +	.driver = {
> +		.name = "i2c-slave-testunit",
> +	},
> +	.probe_new = i2c_slave_testunit_probe,
> +	.remove = i2c_slave_testunit_remove,
> +	.id_table = i2c_slave_testunit_id,
> +};
> +module_i2c_driver(i2c_slave_testunit_driver);
> +
> +MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
> +MODULE_DESCRIPTION("I2C slave mode test unit");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.20.1
> 
