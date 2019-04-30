Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1516EFE3
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 07:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfD3FXJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 01:23:09 -0400
Received: from mail-eopbgr50083.outbound.protection.outlook.com ([40.107.5.83]:7061
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725446AbfD3FXJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 01:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Pp/0bHply5ak5xFzpBI8XRdZfCJQUonfsXFOUmmIkI=;
 b=bWVhh/CJXC+avzai9YAybtsW7zB3FoEVrI0okbOq4JAf54T9T31WHLJ+x+hlJF0E2vwmk+IGAgM5gz49WFoQs29uS3MFDZ55iJCWHfFebijIG7OY5jFvaRtWBNHa6umTKSs39WlkoM/dG6l0c8QkH7P567Pbj+8x8aqLbkcWZlE=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5239.eurprd05.prod.outlook.com (20.177.196.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 05:23:02 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::a51e:351a:a52c:4d13]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::a51e:351a:a52c:4d13%4]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 05:23:02 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "minyard@acm.org" <minyard@acm.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>
CC:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v3 1/1] Add support for IPMB driver
Thread-Index: AQHU/taGzPeXPe0ABEatIFNlmuyPU6ZUHmXw
Date:   Tue, 30 Apr 2019 05:23:01 +0000
Message-ID: <AM6PR05MB522484C929804C3A6A1466D7A23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <cover.1556573807.git.Asmaa@mellanox.com>
 <a3c732c3b3a75e8d6e8f3c7de18615c71d222cb8.1556573807.git.Asmaa@mellanox.com>
In-Reply-To: <a3c732c3b3a75e8d6e8f3c7de18615c71d222cb8.1556573807.git.Asmaa@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f4bbba7-2de7-46dc-6026-08d6cd2bea7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB5239;
x-ms-traffictypediagnostic: AM6PR05MB5239:
x-microsoft-antispam-prvs: <AM6PR05MB52396489C740D9159AD1F407A23A0@AM6PR05MB5239.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(366004)(346002)(136003)(376002)(396003)(39860400002)(199004)(189003)(13464003)(73956011)(52536014)(4326008)(8676002)(81166006)(81156014)(97736004)(68736007)(8936002)(2501003)(478600001)(11346002)(66556008)(71190400001)(2201001)(74316002)(305945005)(7736002)(446003)(64756008)(5660300002)(66446008)(66946007)(66476007)(71200400001)(76116006)(86362001)(476003)(30864003)(25786009)(486006)(54906003)(2906002)(316002)(66066001)(53546011)(6436002)(99286004)(26005)(102836004)(6506007)(7696005)(110136005)(33656002)(6246003)(6116002)(3846002)(76176011)(14444005)(229853002)(6636002)(14454004)(55016002)(9686003)(53936002)(186003)(256004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5239;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tn9XhugJRBqGK1zdkDSl8gFowqUTioqV6sHClMzcSO137jbErEqX3Swutf1gLBtzm6mkX4twJZeM0w3onon8+usAwxfFjt/QrMf2PqM40A3cIWb5MLkGSmDBfpsQxXgPYLFEmiRCCDDj/3HZZFqB0hFr2jvJbqRBs1vcMgHGU/QqXmXrn20c1M0c7HqKthBYwFHwAZBEZWuiZTR12th6T6HjPR4LZJbXQy1xoAV7LPayMipwuxNaDS0joECL2Cb4fvm+6LYUsdiKMNbq2Z1q7dq1OFoIH5LgHt6CKxGub2HpKgbRWvPS0O7zJkzrwqqDFg/aJUFSydkRE9SIunQGymN/yU4KvUcwQWK258KBNDeAiOaD1J5n062baWVTR5vUSSdp9B+QKSo3r1C4e62XAnwh1LVCK80SQAt9d/mqE9w=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4bbba7-2de7-46dc-6026-08d6cd2bea7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 05:23:02.0127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5239
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Asmaa Mnebhi <Asmaa@mellanox.com>
> Sent: Tuesday, April 30, 2019 12:57 AM
> To: minyard@acm.org; wsa@the-dreams.de; Vadim Pasternak
> <vadimp@mellanox.com>; Michael Shych <michaelsh@mellanox.com>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;
> linux-i2c@vger.kernel.org
> Subject: [PATCH v3 1/1] Add support for IPMB driver
>=20
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response to the BM=
C via
> the IPMB channel.

Hi Asmaa,

Few common questions.

You define this driver as "Mellanox  BlueField IPMB driver".
What makes it Mellanox  BlueField specific?

Which HW configuration you used for testing? Could
you please explain connectivity schema between main BMC and
satellite BMCs?

How this module is supposed to be activated?
Don't you need to add DTS/ACPI records?

Also few comments below.

>=20
> Signed-off-by: Asmaa Mnebhi <Asmaa@mellanox.com>
> ---
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 386
> +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 395 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmb_dev_int.c
>=20
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
> index 0000000..63122c3
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Mellanox IPMB driver to receive a request and send a response
> + *
> + * Copyright (C) 2018 Mellanox Techologies, Ltd.
> + *
> + * This was inspired by Brendan Higgins' ipmi-bmc-bt-i2c driver.
> + */
> +
> +#define	pr_fmt(fmt) "ipmb_dev_int: " fmt
> +
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
> +static u32 ipmb_msg_len(struct ipmb_msg *ipmb_msg) {
> +	return ipmb_msg->len + 1;
> +}

Do you really need it as function?

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
> +	struct ipmb_msg response;

Where you are using 'response' field?

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
> +		pr_err("request_queue is empty\n");

Why pr_err and not dev_err?

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
> +	count =3D min_t(size_t, count, ipmb_msg_len(&msg));
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
> +	rq_sa =3D (u16)(msg[RQ_SA_8BIT_IDX] >> 1);

Why do you need this cast?

> +	netf_rq_lun =3D msg[NETFN_LUN_IDX];
> +	/*
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> +	 * i2c_smbus_write_block_data_local
> +	 */
> +	msg_len =3D msg[IPMB_MSG_LEN_IDX] - 2;
> +
> +	mutex_lock(&ipmb_dev_p->file_mutex);
> +	ret =3D i2c_smbus_write_block_data_local(ipmb_dev_p->client,
> +					netf_rq_lun, msg_len, rq_sa, msg + 3);
> +	mutex_unlock(&ipmb_dev_p->file_mutex);
> +
> +	return ret ?: count;
> +}
> +
> +static unsigned int ipmb_poll(struct file *file, poll_table *wait) {
> +	struct ipmb_dev *ipmb_dev_p =3D to_ipmb_dev(file);
> +	unsigned int mask =3D 0;
> +
> +	mutex_lock(&ipmb_dev_p->file_mutex);
> +	poll_wait(file, &ipmb_dev_p->wait_queue, wait);
> +
> +	if (atomic_read(&ipmb_dev_p->request_queue_len))
> +		mask |=3D POLLIN;
> +	mask |=3D POLLOUT;

You can initialized as
unsigned int mask =3D POLLOUT;
and remove the above line.

> +	mutex_unlock(&ipmb_dev_p->file_mutex);
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
> +	return (rs_sa + ipmb_dev_p->request.netfn_rs_lun +
> +		ipmb_dev_p->request.checksum1);

Is it expected to be zero in valid case?

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

Why do you need this cast?

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

And this one?

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
> +	ipmb_dev_p->miscdev.name =3D "ipmb-dev";

It could be only single "ipmb-dev" within the system?
Couldn't it be few, like master/slave for example?

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
> +	{"ipmb-dev", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ipmb_id);
> +
> +static struct i2c_driver ipmb_driver =3D {
> +	.driver =3D {
> +		.name =3D "ipmb-dev",
> +	},
> +	.probe =3D ipmb_probe,
> +	.remove =3D ipmb_remove,
> +	.id_table =3D ipmb_id,
> +};
> +module_i2c_driver(ipmb_driver);
> +
> +MODULE_AUTHOR("Mellanox Technologies");
> MODULE_DESCRIPTION("Mellanox
> +BlueField IPMB driver"); MODULE_LICENSE("GPL v2");
> --
> 2.1.2

