Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8C6137B0
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2019 08:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfEDGCC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 May 2019 02:02:02 -0400
Received: from mail-eopbgr140070.outbound.protection.outlook.com ([40.107.14.70]:46217
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725801AbfEDGCC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 May 2019 02:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpwV8txc/3OTu4gK997uGlD1SyrtmMpK9qET+IMiXZs=;
 b=E1Aa1BU1p2i5wTo/HgxIfDQZXrJ8Wlb3OxoRA5/zJXxggXSPy6xf7VMRf4Na/qMKqgAB5MFDmLc079AnZZ0rEs5yEeSdbk5jKSDeOleQv7ioR1MIhott7s02odRrr6lwjVmzL/ZhWGll7yC12yGaJkwt+HTl2qFCmZ7ceuTBZ58=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5077.eurprd05.prod.outlook.com (20.177.36.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sat, 4 May 2019 06:01:53 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56%2]) with mapi id 15.20.1856.008; Sat, 4 May 2019
 06:01:53 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "minyard@acm.org" <minyard@acm.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>
CC:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v6 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v6 1/1] Add support for IPMB driver
Thread-Index: AQHVAgCBBdX25kHfRUeFiaRv6wijA6ZadFXw
Date:   Sat, 4 May 2019 06:01:53 +0000
Message-ID: <AM6PR05MB5224CB49A0F25638AD172A64A2360@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <cover.1556921955.git.Asmaa@mellanox.com>
 <46284799c58151d7fddfcd18b5fc3e5350fbe0a1.1556921955.git.Asmaa@mellanox.com>
In-Reply-To: <46284799c58151d7fddfcd18b5fc3e5350fbe0a1.1556921955.git.Asmaa@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [84.108.218.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a061b04a-6eda-4cf1-fa7e-08d6d05601a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB5077;
x-ms-traffictypediagnostic: AM6PR05MB5077:
x-microsoft-antispam-prvs: <AM6PR05MB5077FDCE3424634B2B3CF464A2360@AM6PR05MB5077.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0027ED21E7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(13464003)(256004)(53946003)(14444005)(52536014)(30864003)(7696005)(6246003)(6636002)(71200400001)(71190400001)(8676002)(76176011)(486006)(476003)(76116006)(66946007)(73956011)(4326008)(2501003)(102836004)(186003)(11346002)(8936002)(66066001)(2201001)(446003)(64756008)(26005)(66476007)(66556008)(6506007)(86362001)(25786009)(66446008)(53546011)(68736007)(81166006)(55016002)(33656002)(9686003)(305945005)(81156014)(7736002)(74316002)(99286004)(54906003)(53936002)(6436002)(316002)(110136005)(3846002)(229853002)(14454004)(5660300002)(6116002)(2906002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5077;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q4iCfYQwkzmhV6r73ogAOWsw4x8LO93YjrWwudX7J1F9dUPU23ETRbqA7EY1kj1nHxDKSy5fB3zgFqvzoeU3FjHKAdVwEgrG63tf4gu4FvC02KPiM1XnoE0jKIqs3rF0nE8sDzbLRoJ3IK3l8PsbZ1Wiuq2Vjun34wqEv3pBpwoHtMq2YjvTmoW0yDEHcQWXF2SycOKi9ZG2+mOa1Od14w4zxNX5xhlPc9mNCd5K5z7Ir9nzGY7nQlknPLtt9veO60Rz9astf2m9YDCK/y7PuCWLNs5Jk43nVHua0bhJSf9wr/qday22VZku6p95Db1eEbqCv3JHs/+TAFeSpKKMEhqKV71Go+BWT17w24/g3+0N/KGajscsB9j7/VvIIYxkn1drH9jvLU/41WEkghFyvGJwBC2rX9LMqzzrrpqwYwM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a061b04a-6eda-4cf1-fa7e-08d6d05601a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2019 06:01:53.1094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5077
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Asmaa Mnebhi <Asmaa@mellanox.com>
> Sent: Saturday, May 04, 2019 1:35 AM
> To: minyard@acm.org; wsa@the-dreams.de; Vadim Pasternak
> <vadimp@mellanox.com>; Michael Shych <michaelsh@mellanox.com>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;
> linux-i2c@vger.kernel.org
> Subject: [PATCH v6 1/1] Add support for IPMB driver
>=20
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response to the BM=
C via
> the IPMB channel.
>=20
> Signed-off-by: Asmaa Mnebhi <Asmaa@mellanox.com>

Hi Asmaa,

Please, see small comment below (missed space).

I suggest to always have at the development stage
KASAN and UBSAN options available in kernel config
(in case you don't use them).
It can point out on some issues which easily can be
during code review.
For example, I used to have:
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
CONFIG_UBSAN=3Dy
CONFIG_UBSAN_SANITIZE_ALL=3Dy
CONFIG_UBSAN_NO_ALIGNMENT=3Dy
CONFIG_HAVE_ARCH_KASAN=3Dy
CONFIG_CC_HAS_KASAN_GENERIC=3Dy
CONFIG_KASAN=3Dy
CONFIG_KASAN_GENERIC=3Dy
CONFIG_KASAN_OUTLINE=3Dy
CONFIG_KASAN_STACK=3D1
CONFIG_TEST_KASAN=3Dm

Looks fine for me otherwise.
Acked-by: Vadim Pasternak <vadimp@mellanox.com>

> ---
>  Documentation/IPMB.txt           | 103 ++++++++++
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 397
> +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 509 insertions(+)
>  create mode 100644 Documentation/IPMB.txt  create mode 100644
> drivers/char/ipmi/ipmb_dev_int.c
>=20
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt new file mod=
e
> 100644 index 0000000..cfd7494
> --- /dev/null
> +++ b/Documentation/IPMB.txt
> @@ -0,0 +1,103 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +IPMB Driver fro Satellite MC
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +The Intelligent Platform Management Bus, or IPMB is an I2C bus that
> +provides a standardized interconnection between different boards within
> +a chassis. This interconnection is between the baseboard management
> +(BMC) and chassis electronics.
> +IPMB is also associated with the messaging protocol through the IPMB
> +bus.
> +
> +The devices using the IPMB are usually management controllers that
> +perform management functions such as servicing the front panel
> +interface, monitoring the baseboard, hot-swapping disk drivers in the
> +system chassis, etc...
> +
> +When an IPMB is implemented in the system, the BMC serves as a
> +controller to give system software access to the IPMB. The BMC sends
> +IPMI requests to a device (usually a Satellite Management Controller or
> +Satellite MC) via IPMB and the device sends a response back to the BMC.
> +
> +For more information on IPMB and the format of an IPMB message, refer
> +to the IPMB and IPMI specifications.
> +
> +IPMB driver for Satellite MC
> +----------------------------
> +
> +ipmb-dev-int - This is the driver needed on a Satellite MC to receive
> +IPMB messages from a BMC and send a response back.
> +This driver works hand with the i2c driver and a userspace program such
> +as OpenIPMI:
> +
> +1) It is an I2C slave backend driver. So, it defines a callback
> +function to set the Satellite MC as an I2C slave.
> +This callback function handles the received IPMI requests.
> +
> +2) It defines the read and write functions to enable a user space
> +program (such as OpenIPMI) to communicate with the kernel.
> +
> +
> +Load the IPMB driver
> +--------------------
> +
> +The driver needs to be loaded at boot time or manually first.
> +First, make sure you have the following in your config file:
> +CONFIG_IPMB_DEVICE_INTERFACE=3Dy
> +
> +1) If you want the driver to be loaded at boot time:
> +
> +a) Add this entry to your ACPI table, under the appropriate SMBus:
> +
> +Device (SMB0) // Example SMBus host controller {
> +  Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> +  Name (_UID, 0) // Unique ID of particular host controller
> +  :
> +  :
> +    Device (IPMB)
> +    {
> +      Name (_HID, "IPMB0001") // IPMB device interface
> +      Name (_UID, 0) // Unique device identifier
> +    }
> +}
> +
> +b) Example for device tree:
> +
> +&i2c2 {
> +         status =3D "okay";
> +
> +         ipmb@10 {
> +                 compatible =3D "ipmb-dev";
> +                 reg =3D <0x10>;
> +         };
> +};
> +
> +2) Manually from linux:
> +modprobe ipmb-dev-int
> +
> +
> +Instantiate the device
> +----------------------
> +
> +After loading the driver, you can instantiate the device as described
> +in the document 'instantiating-devices'.
> +If you have multiple BMCs, each connected to your Satellite MC via a
> +different I2C bus, you can instantiate a device for each of those BMCs.
> +The name of the instantiated device contains the I2C bus number
> +associated with it as follows:
> +
> +BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
> +				Satellite MC
> +BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
> +
> +For instance, you can instantiate the ipmb-dev-int device from user
> +space at the 7 bit address 0x10 on bus 2:
> +
> +  # echo ipmb-dev 0x10 > /sys/bus/i2c/devices/i2c-2/new_device
> +
> +This will create device file /dev/ipmb-2, which can be accessed by the
> +user space program. The device needs to be instantiated before running
> +the user space program.
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig index
> 94719fc..12fe8f2 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -74,6 +74,14 @@ config IPMI_SSIF
>  	 have a driver that must be accessed over an I2C bus instead of a
>  	 standard interface.  This module requires I2C support.
>=20
> +config IPMB_DEVICE_INTERFACE
> +       tristate 'IPMB Interface handler'
> +       depends on I2C && I2C_SLAVE
> +       help
> +         Provides a driver for a device (Satellite MC) to
> +         receive requests and send responses back to the BMC via
> +         the IPMB interface. This module requires I2C support.
> +
>  config IPMI_POWERNV
>         depends on PPC_POWERNV
>         tristate 'POWERNV (OPAL firmware) IPMI interface'
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile inde=
x
> 3f06b20..0822adc 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o
> +obj-$(CONFIG_IPMB_DEVICE_INTERFACE) +=3D ipmb_dev_int.o
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c
> b/drivers/char/ipmi/ipmb_dev_int.c
> new file mode 100644
> index 0000000..90845ba
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -0,0 +1,397 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * IPMB driver to receive a request and send a response
> + *
> + * Copyright (C) 2018 Mellanox Techologies, Ltd.
> + *
> + * This was inspired by Brendan Higgins' ipmi-bmc-bt-i2c driver.
> + */
> +
> +#define	dev_fmt(fmt) "ipmb_dev_int: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/poll.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +
> +#define	MAX_MSG_LEN		128
> +#define	IPMB_REQUEST_LEN_MIN	7
> +#define	NETFN_RSP_BIT_MASK	0x4
> +#define	REQUEST_QUEUE_MAX_LEN	256
> +
> +#define	IPMB_MSG_LEN_IDX	0
> +#define	RQ_SA_8BIT_IDX		1
> +#define	NETFN_LUN_IDX		2
> +
> +#define	IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN -
> IPMB_REQUEST_LEN_MIN - 1)
> +
> +#define	SMBUS_MSG_HEADER_LENGTH	2
> +#define	SMBUS_MSG_IDX_OFFSET
> 	(SMBUS_MSG_HEADER_LENGTH + 1)
> +
> +struct ipmb_msg {
> +	u8 len;
> +	u8 rs_sa;
> +	u8 netfn_rs_lun;
> +	u8 checksum1;
> +	u8 rq_sa;
> +	u8 rq_seq_rq_lun;
> +	u8 cmd;
> +	u8 payload[IPMB_MSG_PAYLOAD_LEN_MAX];
> +	/* checksum2 is included in payload */ } __packed;
> +
> +struct ipmb_request_elem {
> +	struct list_head list;
> +	struct ipmb_msg request;
> +};
> +
> +struct ipmb_dev {
> +	struct i2c_client *client;
> +	struct miscdevice miscdev;
> +	struct ipmb_msg request;
> +	struct list_head request_queue;
> +	atomic_t request_queue_len;
> +	size_t msg_idx;
> +	spinlock_t lock;
> +	wait_queue_head_t wait_queue;
> +	struct mutex file_mutex;
> +};
> +
> +static int receive_ipmb_request(struct ipmb_dev *ipmb_dev_p,
> +				bool non_blocking,
> +				struct ipmb_msg *ipmb_request)
> +{
> +	struct ipmb_request_elem *queue_elem;
> +	unsigned long flags;
> +	int res;
> +
> +	spin_lock_irqsave(&ipmb_dev_p->lock, flags);
> +
> +	while (!atomic_read(&ipmb_dev_p->request_queue_len)) {
> +		spin_unlock_irqrestore(&ipmb_dev_p->lock, flags);
> +		if (non_blocking)
> +			return -EAGAIN;
> +
> +		res =3D wait_event_interruptible(ipmb_dev_p->wait_queue,
> +				atomic_read(&ipmb_dev_p-
> >request_queue_len));
> +		if (res)
> +			return res;
> +
> +		spin_lock_irqsave(&ipmb_dev_p->lock, flags);
> +	}
> +
> +	if (list_empty(&ipmb_dev_p->request_queue)) {
> +		dev_err(&ipmb_dev_p->client->dev, "request_queue is
> empty\n");
> +		return -EIO;
> +	}
> +
> +	queue_elem =3D list_first_entry(&ipmb_dev_p->request_queue,
> +					struct ipmb_request_elem, list);
> +	memcpy(ipmb_request, &queue_elem->request,
> sizeof(*ipmb_request));
> +	list_del(&queue_elem->list);
> +	kfree(queue_elem);
> +	atomic_dec(&ipmb_dev_p->request_queue_len);
> +
> +	spin_unlock_irqrestore(&ipmb_dev_p->lock, flags);
> +
> +	return 0;
> +}
> +
> +static inline struct ipmb_dev *to_ipmb_dev(struct file *file) {
> +	return container_of(file->private_data, struct ipmb_dev, miscdev); }
> +
> +static ssize_t ipmb_read(struct file *file, char __user *buf, size_t cou=
nt,
> +			loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev_p =3D to_ipmb_dev(file);
> +	struct ipmb_msg msg;
> +	ssize_t ret;
> +
> +	memset(&msg, 0, sizeof(msg));
> +
> +	mutex_lock(&ipmb_dev_p->file_mutex);
> +	ret =3D receive_ipmb_request(ipmb_dev_p, file->f_flags & O_NONBLOCK,
> +				&msg);
> +	if (ret < 0)
> +		goto out;
> +	count =3D min_t(size_t, count, msg.len + 1);
> +	if (copy_to_user(buf, &msg, count)) {
> +		ret =3D -EFAULT;
> +		goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&ipmb_dev_p->file_mutex);
> +	return ret < 0 ? ret : count;
> +}
> +
> +static s32 i2c_smbus_write_block_data_local(struct i2c_client *client,
> +					u8 command, u8 length,
> +					u16 requester_i2c_addr,
> +					const char *msg)
> +{
> +	union i2c_smbus_data data;
> +	int ret;
> +
> +	if (length > I2C_SMBUS_BLOCK_MAX)
> +		length =3D I2C_SMBUS_BLOCK_MAX;
> +
> +	data.block[0] =3D length;
> +	memcpy(&data.block[1], msg, length);
> +
> +	ret =3D i2c_smbus_xfer(client->adapter, requester_i2c_addr,
> +				client->flags,
> +				I2C_SMBUS_WRITE, command,
> +				I2C_SMBUS_BLOCK_DATA, &data);
> +
> +	return ret;
> +}
> +
> +static ssize_t ipmb_write(struct file *file, const char __user *buf,
> +			size_t count, loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev_p =3D to_ipmb_dev(file);
> +	u8 msg[MAX_MSG_LEN];
> +	ssize_t ret;
> +	u8 rq_sa, netf_rq_lun, msg_len;
> +
> +	if (count > sizeof(msg))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&msg, buf, count) || count < msg[0])
> +		return -EFAULT;
> +
> +	rq_sa =3D msg[RQ_SA_8BIT_IDX] >> 1;
> +	netf_rq_lun =3D msg[NETFN_LUN_IDX];
> +	/*
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> +	 * i2c_smbus_write_block_data_local
> +	 */
> +	msg_len =3D msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> +
> +	mutex_lock(&ipmb_dev_p->file_mutex);
> +	ret =3D i2c_smbus_write_block_data_local(ipmb_dev_p->client,
> +					netf_rq_lun, msg_len, rq_sa, msg +
> +					SMBUS_MSG_IDX_OFFSET);
> +	mutex_unlock(&ipmb_dev_p->file_mutex);
> +
> +	return ret ?: count;

Missed space '? :'

> +}
> +
> +static unsigned int ipmb_poll(struct file *file, poll_table *wait) {
> +	struct ipmb_dev *ipmb_dev_p =3D to_ipmb_dev(file);
> +	unsigned int mask =3D POLLOUT;
> +
> +	mutex_lock(&ipmb_dev_p->file_mutex);
> +	poll_wait(file, &ipmb_dev_p->wait_queue, wait);
> +
> +	if (atomic_read(&ipmb_dev_p->request_queue_len))
> +		mask |=3D POLLIN;
> +	mutex_unlock(&ipmb_dev_p->file_mutex);
> +
> +	return mask;
> +}
> +
> +static const struct file_operations ipmb_fops =3D {
> +	.owner	=3D THIS_MODULE,
> +	.read	=3D ipmb_read,
> +	.write	=3D ipmb_write,
> +	.poll	=3D ipmb_poll,
> +};
> +
> +/* Called with ipmb_dev->lock held. */
> +static void ipmb_handle_request(struct ipmb_dev *ipmb_dev_p) {
> +	struct ipmb_request_elem *queue_elem;
> +
> +	if (atomic_read(&ipmb_dev_p->request_queue_len) >=3D
> +			REQUEST_QUEUE_MAX_LEN)
> +		return;
> +
> +	queue_elem =3D kmalloc(sizeof(*queue_elem), GFP_KERNEL);
> +	if (!queue_elem)
> +		return;
> +
> +	memcpy(&queue_elem->request, &ipmb_dev_p->request,
> +		sizeof(struct ipmb_msg));
> +	list_add(&queue_elem->list, &ipmb_dev_p->request_queue);
> +	atomic_inc(&ipmb_dev_p->request_queue_len);
> +	wake_up_all(&ipmb_dev_p->wait_queue);
> +}
> +
> +static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev_p, u8 rs_sa)
> +{
> +	/* The 8 lsb of the sum is 0 when the checksum is valid */
> +	return (rs_sa + ipmb_dev_p->request.netfn_rs_lun +
> +		ipmb_dev_p->request.checksum1);
> +}
> +
> +static bool is_ipmb_request(struct ipmb_dev *ipmb_dev_p, u8 rs_sa) {
> +	if (ipmb_dev_p->msg_idx >=3D IPMB_REQUEST_LEN_MIN) {
> +		if (ipmb_verify_checksum1(ipmb_dev_p, rs_sa))
> +			return false;
> +
> +		/*
> +		 * Check whether this is an IPMB request or
> +		 * response.
> +		 * The 6 MSB of netfn_rs_lun are dedicated to the netfn
> +		 * while the remaining bits are dedicated to the lun.
> +		 * If the LSB of the netfn is cleared, it is associated
> +		 * with an IPMB request.
> +		 * If the LSB of the netfn is set, it is associated with
> +		 * an IPMB response.
> +		 */
> +		if (!(ipmb_dev_p->request.netfn_rs_lun &
> NETFN_RSP_BIT_MASK))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/*
> + * The IPMB protocol only supports I2C Writes so there is no need
> + * to support I2C_SLAVE_READ* events.
> + * This i2c callback function only monitors IPMB request messages
> + * and adds them in a queue, so that they can be handled by
> + * receive_ipmb_request.
> + */
> +static int ipmb_slave_cb(struct i2c_client *client,
> +			enum i2c_slave_event event, u8 *val) {
> +	struct ipmb_dev *ipmb_dev_p =3D i2c_get_clientdata(client);
> +	u8 *buf =3D (u8 *)&ipmb_dev_p->request;
> +
> +	spin_lock(&ipmb_dev_p->lock);
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		memset(&ipmb_dev_p->request, 0, sizeof(ipmb_dev_p-
> >request));
> +		ipmb_dev_p->msg_idx =3D 0;
> +
> +		/*
> +		 * At index 0, ipmb_msg stores the length of msg,
> +		 * skip it for now.
> +		 * The len will be populated once the whole
> +		 * buf is populated.
> +		 *
> +		 * The I2C bus driver's responsibility is to pass the
> +		 * data bytes to the backend driver; it does not
> +		 * forward the i2c slave address.
> +		 * Since the first byte in the IPMB message is the
> +		 * address of the responder, it is the responsibility
> +		 * of the IPMB driver to format the message properly.
> +		 * So this driver prepends the address of the responder
> +		 * to the received i2c data before the request message
> +		 * is handled in userland.
> +		 */
> +		buf[++ipmb_dev_p->msg_idx] =3D (u8)(client->addr << 1);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (ipmb_dev_p->msg_idx >=3D sizeof(struct ipmb_msg))
> +			break;
> +
> +		buf[++ipmb_dev_p->msg_idx] =3D *val;
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		ipmb_dev_p->request.len =3D ipmb_dev_p->msg_idx;
> +
> +		if (is_ipmb_request(ipmb_dev_p, (u8)(client->addr << 1)))
> +			ipmb_handle_request(ipmb_dev_p);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +	spin_unlock(&ipmb_dev_p->lock);
> +
> +	return 0;
> +}
> +
> +static int ipmb_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct ipmb_dev *ipmb_dev_p;
> +	int ret;
> +
> +	ipmb_dev_p =3D devm_kzalloc(&client->dev, sizeof(*ipmb_dev_p),
> +					GFP_KERNEL);
> +	if (!ipmb_dev_p)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ipmb_dev_p->lock);
> +	init_waitqueue_head(&ipmb_dev_p->wait_queue);
> +	atomic_set(&ipmb_dev_p->request_queue_len, 0);
> +	INIT_LIST_HEAD(&ipmb_dev_p->request_queue);
> +
> +	mutex_init(&ipmb_dev_p->file_mutex);
> +
> +	ipmb_dev_p->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> +
> +	ipmb_dev_p->miscdev.name =3D devm_kasprintf(&client->dev,
> GFP_KERNEL,
> +						"%s%d", "ipmb-",
> +						client->adapter->nr);
> +	ipmb_dev_p->miscdev.fops =3D &ipmb_fops;
> +	ipmb_dev_p->miscdev.parent =3D &client->dev;
> +	ret =3D misc_register(&ipmb_dev_p->miscdev);
> +	if (ret)
> +		return ret;
> +
> +	ipmb_dev_p->client =3D client;
> +	i2c_set_clientdata(client, ipmb_dev_p);
> +	ret =3D i2c_slave_register(client, ipmb_slave_cb);
> +	if (ret) {
> +		misc_deregister(&ipmb_dev_p->miscdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipmb_remove(struct i2c_client *client) {
> +	struct ipmb_dev *ipmb_dev_p =3D i2c_get_clientdata(client);
> +
> +	i2c_slave_unregister(client);
> +	misc_deregister(&ipmb_dev_p->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ipmb_id[] =3D {
> +	{ "ipmb-dev", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ipmb_id);
> +
> +static const struct acpi_device_id acpi_ipmb_id[] =3D {
> +	{ "IPMB0001", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
> +
> +static struct i2c_driver ipmb_driver =3D {
> +	.driver =3D {
> +		.owner =3D THIS_MODULE,
> +		.name =3D "ipmb-dev",
> +		.acpi_match_table =3D ACPI_PTR(acpi_ipmb_id),
> +	},
> +	.probe =3D ipmb_probe,
> +	.remove =3D ipmb_remove,
> +	.id_table =3D ipmb_id,
> +};
> +module_i2c_driver(ipmb_driver);
> +
> +MODULE_AUTHOR("Mellanox Technologies"); MODULE_DESCRIPTION("IPMB
> +driver"); MODULE_LICENSE("GPL v2");
> --
> 2.1.2

