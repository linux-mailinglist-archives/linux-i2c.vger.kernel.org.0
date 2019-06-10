Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 099813BD43
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 22:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389201AbfFJUAT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 16:00:19 -0400
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:50595
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389170AbfFJUAS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 16:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeANjkGcR6KCp+rNZWMWS+J6OIfV0SPnyfyr3rUFpi8=;
 b=nDMMd82ye1JzzcawSlzKRbQgdkH9fh6m5orgwVocIRz4zav5H3XY42Fd67pIBDRvQRgLl6/HdOY33X3f6HHa3rXOtmkPoeBNKmKPYfqVyWCF1lOBTz95ajdkG1KnLeK/jRdxMZYtKoj1aaplfrBP9ZG/hXv/NObuJ0wCpcc0LKE=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB4397.eurprd05.prod.outlook.com (52.133.13.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 20:00:10 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2%7]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 20:00:10 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     "minyard@acm.org" <minyard@acm.org>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v12 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v12 1/1] Add support for IPMB driver
Thread-Index: AQHVH75wU/UOB8lBXUaBS/Idjd9IQKaVTEaAgAACRPA=
Date:   Mon, 10 Jun 2019 20:00:10 +0000
Message-ID: <VI1PR05MB62390C821001352084F1EAE6DA130@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1560192707.git.Asmaa@mellanox.com>
 <319690553a0da2a1e80b400941341081b383e5f1.1560192707.git.Asmaa@mellanox.com>
 <20190610195123.GB5545@minyard.net>
In-Reply-To: <20190610195123.GB5545@minyard.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec9b8cda-f258-4085-b020-08d6edde3e89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB4397;
x-ms-traffictypediagnostic: VI1PR05MB4397:
x-microsoft-antispam-prvs: <VI1PR05MB439709A6ADA25BB07DDB63D7DA130@VI1PR05MB4397.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(366004)(13464003)(189003)(199004)(30864003)(81156014)(66066001)(86362001)(99286004)(81166006)(476003)(8936002)(66556008)(1730700003)(8676002)(486006)(305945005)(80792005)(68736007)(66476007)(53936002)(2501003)(52536014)(2906002)(14444005)(6916009)(256004)(6246003)(76116006)(2351001)(5660300002)(6506007)(64756008)(53546011)(71190400001)(102836004)(6436002)(14454004)(71200400001)(25786009)(229853002)(76176011)(446003)(9686003)(72206003)(53946003)(5640700003)(33656002)(55016002)(11346002)(7696005)(478600001)(186003)(26005)(316002)(73956011)(7736002)(3846002)(74316002)(66946007)(4326008)(54906003)(66446008)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4397;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KOCkD1PIwANrCk5NvodRLYnompEQSyZ7KDKAAGZIIhXdj0hEpALZsNJ6Vcd4RCIXflLKDH/o2TjjYRgFf1NBq9GG2tJ7592ajW6zqNW5aAsTc4mNXAIG7Mn6FW5RazhWT/QtWPegf4UoEJUwag2PW+oNGenWpD7PyyTUVYlcA0I5FBMGX9KlUdHlbFoVBSEXTxiQ5COpINBAzqD6R99VXCZXfDx3HBFgyBYK3D1Ub+Ncu/KgXj3i1dgjwMu63JqH8N6IyHUitfOH8BdSuJZ0atp8n1trABIziAM/1Ut38G0/D7zLKNDB9hz5FMM7bTqORJUBYNca4VrhVYmtgCKwzqJig5p2JMzxf6ib87xxgoO2A2ui6r5Bgh/2RNiM1if0+ZgtaPwM35R5hCBQ+cOr/vahV/LbomGb78PdYrCHVWg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9b8cda-f258-4085-b020-08d6edde3e89
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 20:00:10.5358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Asmaa@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4397
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you Corey!

-----Original Message-----
From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey Minyard
Sent: Monday, June 10, 2019 3:51 PM
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Cc: wsa@the-dreams.de; Vadim Pasternak <vadimp@mellanox.com>; Michael Shych=
 <michaelsh@mellanox.com>; rdunlap@infradead.org; linux-kernel@vger.kernel.=
org; linux-i2c@vger.kernel.org
Subject: Re: [PATCH v12 1/1] Add support for IPMB driver

On Mon, Jun 10, 2019 at 02:57:02PM -0400, Asmaa Mnebhi wrote:
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response to the=20
> BMC via the IPMB channel.

Ok, you have been patient enough on this, and I think it's good now :).  I'=
ve added it to the IPMI for-next tree.

I did move the config section to outside the CONFIG_IPMI_MSGHANLDER section=
, as it's not dependent on that option.

-corey

>=20
> Signed-off-by: Asmaa Mnebhi <Asmaa@mellanox.com>
> Acked-by: vadimp@mellanox.com
> ---
>  Documentation/IPMB.txt           | 103 +++++++++++
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 364=20
> +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 476 insertions(+)
>  create mode 100644 Documentation/IPMB.txt  create mode 100644=20
> drivers/char/ipmi/ipmb_dev_int.c
>=20
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt new file=20
> mode 100644 index 0000000..7160d53
> --- /dev/null
> +++ b/Documentation/IPMB.txt
> @@ -0,0 +1,103 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +IPMB Driver for a Satellite MC
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +The Intelligent Platform Management Bus or IPMB, is an I2C bus that=20
> +provides a standardized interconnection between different boards=20
> +within a chassis. This interconnection is between the baseboard=20
> +management (BMC) and chassis electronics.
> +IPMB is also associated with the messaging protocol through the IPMB=20
> +bus.
> +
> +The devices using the IPMB are usually management controllers that=20
> +perform management functions such as servicing the front panel=20
> +interface, monitoring the baseboard, hot-swapping disk drivers in the=20
> +system chassis, etc...
> +
> +When an IPMB is implemented in the system, the BMC serves as a=20
> +controller to give system software access to the IPMB. The BMC sends=20
> +IPMI requests to a device (usually a Satellite Management Controller=20
> +or Satellite MC) via IPMB and the device sends a response back to the=20
> +BMC.
> +
> +For more information on IPMB and the format of an IPMB message, refer=20
> +to the IPMB and IPMI specifications.
> +
> +IPMB driver for Satellite MC
> +----------------------------
> +
> +ipmb-dev-int - This is the driver needed on a Satellite MC to receive=20
> +IPMB messages from a BMC and send a response back.
> +This driver works with the I2C driver and a userspace program such as=20
> +OpenIPMI:
> +
> +1) It is an I2C slave backend driver. So, it defines a callback=20
> +function to set the Satellite MC as an I2C slave.
> +This callback function handles the received IPMI requests.
> +
> +2) It defines the read and write functions to enable a user space=20
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
> +=20
> +         ipmb@10 {
> +                 compatible =3D "ipmb-dev";
> +                 reg =3D <0x10>;
> +         };
> +};
> +
> +2) Manually from Linux:
> +modprobe ipmb-dev-int
> +
> +
> +Instantiate the device
> +----------------------
> +
> +After loading the driver, you can instantiate the device as described=20
> +in 'Documentation/i2c/instantiating-devices'.
> +If you have multiple BMCs, each connected to your Satellite MC via a=20
> +different I2C bus, you can instantiate a device for each of those=20
> +BMCs.
> +The name of the instantiated device contains the I2C bus number=20
> +associated with it as follows:
> +
> +BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
> +				Satellite MC
> +BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
> +
> +For instance, you can instantiate the ipmb-dev-int device from user=20
> +space at the 7 bit address 0x10 on bus 2:
> +
> +  # echo ipmb-dev 0x1010 > /sys/bus/i2c/devices/i2c-2/new_device
> +
> +This will create the device file /dev/ipmb-2, which can be accessed=20
> +by the user space program. The device needs to be instantiated before=20
> +running the user space program.
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig=20
> index caac5d2..811fccb 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -75,6 +75,14 @@ config IPMI_SSIF
>  	 have a driver that must be accessed over an I2C bus instead of a
>  	 standard interface.  This module requires I2C support.
> =20
> +config IPMB_DEVICE_INTERFACE
> +       tristate 'IPMB Interface handler'
> +       depends on I2C_SLAVE
> +       help
> +         Provides a driver for a device (Satellite MC) to
> +         receive requests and send responses back to the BMC via
> +         the IPMB interface. This module requires I2C support.
> +
>  config IPMI_POWERNV
>         depends on PPC_POWERNV
>         tristate 'POWERNV (OPAL firmware) IPMI interface'
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile=20
> index 3f06b20..0822adc 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o
> +obj-$(CONFIG_IPMB_DEVICE_INTERFACE) +=3D ipmb_dev_int.o
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c=20
> b/drivers/char/ipmi/ipmb_dev_int.c
> new file mode 100644
> index 0000000..2895abf
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * IPMB driver to receive a request and send a response
> + *
> + * Copyright (C) 2019 Mellanox Techologies, Ltd.
> + *
> + * This was inspired by Brendan Higgins' ipmi-bmc-bt-i2c driver.
> + */
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
> +#define MAX_MSG_LEN		128
> +#define IPMB_REQUEST_LEN_MIN	7
> +#define NETFN_RSP_BIT_MASK	0x4
> +#define REQUEST_QUEUE_MAX_LEN	256
> +
> +#define IPMB_MSG_LEN_IDX	0
> +#define RQ_SA_8BIT_IDX		1
> +#define NETFN_LUN_IDX		2
> +
> +#define GET_7BIT_ADDR(addr_8bit)	(addr_8bit >> 1)
> +#define GET_8BIT_ADDR(addr_7bit)	((addr_7bit << 1) & 0xff)
> +
> +#define IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN - IPMB_REQUEST_LEN_MIN=20
> +- 1)
> +
> +#define SMBUS_MSG_HEADER_LENGTH	2
> +#define SMBUS_MSG_IDX_OFFSET	(SMBUS_MSG_HEADER_LENGTH + 1)
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
> +static inline struct ipmb_dev *to_ipmb_dev(struct file *file) {
> +	return container_of(file->private_data, struct ipmb_dev, miscdev); }
> +
> +static ssize_t ipmb_read(struct file *file, char __user *buf, size_t cou=
nt,
> +			loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev =3D to_ipmb_dev(file);
> +	struct ipmb_request_elem *queue_elem;
> +	struct ipmb_msg msg;
> +	ssize_t ret;
> +
> +	memset(&msg, 0, sizeof(msg));
> +
> +	spin_lock_irq(&ipmb_dev->lock);
> +
> +	while (list_empty(&ipmb_dev->request_queue)) {
> +		spin_unlock_irq(&ipmb_dev->lock);
> +
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +
> +		ret =3D wait_event_interruptible(ipmb_dev->wait_queue,
> +				!list_empty(&ipmb_dev->request_queue));
> +		if (ret)
> +			return ret;
> +
> +		spin_lock_irq(&ipmb_dev->lock);
> +	}
> +
> +	queue_elem =3D list_first_entry(&ipmb_dev->request_queue,
> +					struct ipmb_request_elem, list);
> +	memcpy(&msg, &queue_elem->request, sizeof(msg));
> +	list_del(&queue_elem->list);
> +	kfree(queue_elem);
> +	atomic_dec(&ipmb_dev->request_queue_len);
> +
> +	spin_unlock_irq(&ipmb_dev->lock);
> +
> +	count =3D min_t(size_t, count, msg.len + 1);
> +	if (copy_to_user(buf, &msg, count))
> +		ret =3D -EFAULT;
> +
> +	return ret < 0 ? ret : count;
> +}
> +
> +static ssize_t ipmb_write(struct file *file, const char __user *buf,
> +			size_t count, loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev =3D to_ipmb_dev(file);
> +	u8 rq_sa, netf_rq_lun, msg_len;
> +	struct i2c_client rq_client;
> +	u8 msg[MAX_MSG_LEN];
> +	ssize_t ret;
> +
> +	if (count > sizeof(msg))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&msg, buf, count))
> +		return -EFAULT;
> +
> +	if (count < msg[0])
> +		return -EINVAL;
> +
> +	rq_sa =3D GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
> +	netf_rq_lun =3D msg[NETFN_LUN_IDX];
> +
> +	if (!(netf_rq_lun & NETFN_RSP_BIT_MASK))
> +		return -EINVAL;
> +
> +	/*
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> +	 * i2c_smbus_write_block_data_local
> +	 */
> +	msg_len =3D msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> +
> +	strcpy(rq_client.name, "ipmb_requester");
> +	rq_client.adapter =3D ipmb_dev->client->adapter;
> +	rq_client.flags =3D ipmb_dev->client->flags;
> +	rq_client.addr =3D rq_sa;
> +
> +	ret =3D i2c_smbus_write_block_data(&rq_client, netf_rq_lun, msg_len,
> +					msg + SMBUS_MSG_IDX_OFFSET);
> +
> +	return ret ? : count;
> +}
> +
> +static unsigned int ipmb_poll(struct file *file, poll_table *wait) {
> +	struct ipmb_dev *ipmb_dev =3D to_ipmb_dev(file);
> +	unsigned int mask =3D POLLOUT;
> +
> +	mutex_lock(&ipmb_dev->file_mutex);
> +	poll_wait(file, &ipmb_dev->wait_queue, wait);
> +
> +	if (atomic_read(&ipmb_dev->request_queue_len))
> +		mask |=3D POLLIN;
> +	mutex_unlock(&ipmb_dev->file_mutex);
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
> +/* Called with ipmb_dev->lock held. */ static void=20
> +ipmb_handle_request(struct ipmb_dev *ipmb_dev) {
> +	struct ipmb_request_elem *queue_elem;
> +
> +	if (atomic_read(&ipmb_dev->request_queue_len) >=3D
> +			REQUEST_QUEUE_MAX_LEN)
> +		return;
> +
> +	queue_elem =3D kmalloc(sizeof(*queue_elem), GFP_ATOMIC);
> +	if (!queue_elem)
> +		return;
> +
> +	memcpy(&queue_elem->request, &ipmb_dev->request,
> +		sizeof(struct ipmb_msg));
> +	list_add(&queue_elem->list, &ipmb_dev->request_queue);
> +	atomic_inc(&ipmb_dev->request_queue_len);
> +	wake_up_all(&ipmb_dev->wait_queue);
> +}
> +
> +static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev, u8 rs_sa)=20
> +{
> +	/* The 8 lsb of the sum is 0 when the checksum is valid */
> +	return (rs_sa + ipmb_dev->request.netfn_rs_lun +
> +		ipmb_dev->request.checksum1);
> +}
> +
> +static bool is_ipmb_request(struct ipmb_dev *ipmb_dev, u8 rs_sa) {
> +	if (ipmb_dev->msg_idx >=3D IPMB_REQUEST_LEN_MIN) {
> +		if (ipmb_verify_checksum1(ipmb_dev, rs_sa))
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
> +		if (!(ipmb_dev->request.netfn_rs_lun & NETFN_RSP_BIT_MASK))
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
> +	struct ipmb_dev *ipmb_dev =3D i2c_get_clientdata(client);
> +	u8 *buf =3D (u8 *)&ipmb_dev->request;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ipmb_dev->lock, flags);
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		memset(&ipmb_dev->request, 0, sizeof(ipmb_dev->request));
> +		ipmb_dev->msg_idx =3D 0;
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
> +		buf[++ipmb_dev->msg_idx] =3D GET_8BIT_ADDR(client->addr);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (ipmb_dev->msg_idx >=3D sizeof(struct ipmb_msg))
> +			break;
> +
> +		buf[++ipmb_dev->msg_idx] =3D *val;
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		ipmb_dev->request.len =3D ipmb_dev->msg_idx;
> +
> +		if (is_ipmb_request(ipmb_dev, GET_8BIT_ADDR(client->addr)))
> +			ipmb_handle_request(ipmb_dev);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +	spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ipmb_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct ipmb_dev *ipmb_dev;
> +	int ret;
> +
> +	ipmb_dev =3D devm_kzalloc(&client->dev, sizeof(*ipmb_dev),
> +					GFP_KERNEL);
> +	if (!ipmb_dev)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ipmb_dev->lock);
> +	init_waitqueue_head(&ipmb_dev->wait_queue);
> +	atomic_set(&ipmb_dev->request_queue_len, 0);
> +	INIT_LIST_HEAD(&ipmb_dev->request_queue);
> +
> +	mutex_init(&ipmb_dev->file_mutex);
> +
> +	ipmb_dev->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> +
> +	ipmb_dev->miscdev.name =3D devm_kasprintf(&client->dev, GFP_KERNEL,
> +						"%s%d", "ipmb-",
> +						client->adapter->nr);
> +	ipmb_dev->miscdev.fops =3D &ipmb_fops;
> +	ipmb_dev->miscdev.parent =3D &client->dev;
> +	ret =3D misc_register(&ipmb_dev->miscdev);
> +	if (ret)
> +		return ret;
> +
> +	ipmb_dev->client =3D client;
> +	i2c_set_clientdata(client, ipmb_dev);
> +	ret =3D i2c_slave_register(client, ipmb_slave_cb);
> +	if (ret) {
> +		misc_deregister(&ipmb_dev->miscdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipmb_remove(struct i2c_client *client) {
> +	struct ipmb_dev *ipmb_dev =3D i2c_get_clientdata(client);
> +
> +	i2c_slave_unregister(client);
> +	misc_deregister(&ipmb_dev->miscdev);
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
> +MODULE_AUTHOR("Mellanox Technologies"); MODULE_DESCRIPTION("IPMB=20
> +driver"); MODULE_LICENSE("GPL v2");
> --
> 2.1.2
>=20
