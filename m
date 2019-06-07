Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC717397D4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 23:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbfFGVea (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 17:34:30 -0400
Received: from mail-eopbgr150070.outbound.protection.outlook.com ([40.107.15.70]:22382
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729796AbfFGVea (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 17:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTiW9nJUmTD8H2N/bSWvdojakJ4htvo0iwOEteTz1xo=;
 b=jSaGvaJK+i0v7WvauQMrdvB315F4/TEAxkuPFNR6m1O0lHx79HR5RQ0QKTQGvPw45oB8JgPzYaQqx3gY/qD1iPc/7KvFhHVRX3SlJT8xK2oqBcAAUp6uey2r6gLBGnnfDfdhrGeHrHO04oB3cBLagCVaVtncqyQqizWJAFZ+JOc=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB3229.eurprd05.prod.outlook.com (10.170.238.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Fri, 7 Jun 2019 21:34:18 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2%7]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 21:34:18 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     "minyard@acm.org" <minyard@acm.org>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v10 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v10 1/1] Add support for IPMB driver
Thread-Index: AQHVG9JJ26zVKO1Erk+BeqL/0aA0UKaNvBQAgAKGWBA=
Date:   Fri, 7 Jun 2019 21:34:18 +0000
Message-ID: <VI1PR05MB6239E2AC40873621B4182477DA100@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1559761562.git.Asmaa@mellanox.com>
 <db9dfb91e9d28b07944a8ce7c92ced3c3c65dea4.1559761562.git.Asmaa@mellanox.com>
 <20190605235324.GD6849@minyard.net>
In-Reply-To: <20190605235324.GD6849@minyard.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f18d4db-68f6-4fee-6b0e-08d6eb8fe5b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB3229;
x-ms-traffictypediagnostic: VI1PR05MB3229:
x-microsoft-antispam-prvs: <VI1PR05MB32298CFFDABCBE44FDCCD5FEDA100@VI1PR05MB3229.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(366004)(13464003)(199004)(189003)(81166006)(6246003)(54906003)(66066001)(6116002)(30864003)(8936002)(305945005)(316002)(81156014)(80792005)(1730700003)(3846002)(8676002)(4326008)(33656002)(2906002)(478600001)(76116006)(76176011)(99286004)(66446008)(64756008)(66476007)(476003)(52536014)(9686003)(229853002)(14444005)(25786009)(7736002)(73956011)(71200400001)(6916009)(66946007)(6436002)(86362001)(6506007)(2501003)(53546011)(5660300002)(53936002)(74316002)(26005)(72206003)(71190400001)(55016002)(14454004)(68736007)(5640700003)(2351001)(186003)(102836004)(486006)(256004)(446003)(7696005)(66556008)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB3229;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yn5XCoL2N+J+TaYIpRtGNqFN5YKzpznNpWWORsqTshmoO2M3vmP4CGp18MbXDiHUkSgbkNWxvNyfFsjZ6nmxcmDfVuuc24SIL6qvbIu5x2R8AV/BqwpRRs1jTQKI8ZM2YUavUMNNWvIdkcMV+MBqqL4+Xofcp+glKXFw5LksUU8UXlAupHGNqnDvsH2/jUrOEWJjZddNznK8hT6fsxd/JmFWj3ijORVdFOxjdb+Uwow29g/TouwXiyzU5NpKH/DEyeP2GnkC+l7UwieRrOd7N/Lc7UXBLjvpbdg/lT+p2qbwIaM4AwQwYESe2uZzImyfoiZ8BUWKe+FpuKKwyoP+6bZHSeq5vYy7IfN0PUUq2LX9PZrwvgtC127zCXv3cSx18DSXmkfDYc+IG3VBFdcu43BfYSDyrlyEpuehJgMRBGs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f18d4db-68f6-4fee-6b0e-08d6eb8fe5b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 21:34:18.4176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Asmaa@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3229
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Corey,

Thank you for your comments. Please see inline response. I will be posting =
a new patch shortly.

-----Original Message-----
From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey Minyard
Sent: Wednesday, June 5, 2019 7:53 PM
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Cc: wsa@the-dreams.de; Vadim Pasternak <vadimp@mellanox.com>; Michael Shych=
 <michaelsh@mellanox.com>; rdunlap@infradead.org; linux-kernel@vger.kernel.=
org; linux-i2c@vger.kernel.org
Subject: Re: [PATCH v10 1/1] Add support for IPMB driver

On Wed, Jun 05, 2019 at 03:09:30PM -0400, Asmaa Mnebhi wrote:
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response to the=20
> BMC via the IPMB channel.

A lot of comments inline.

-corey

SNIP...
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
> +/* get 7-bit address from 8-bit address */
> +#define GET_7BIT_ADDR(addr)	(addr >> 1)
> +
> +#define IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN - IPMB_REQUEST_LEN_MIN=20
> +- 1)
> +
> +#define SMBUS_MSG_HEADER_LENGTH	2
> +#define SMBUS_MSG_IDX_OFFSET	(SMBUS_MSG_HEADER_LENGTH + 1)
> +
> +#define GET_8BIT_ADDR(addr_7bit) ((addr_7bit << 1) & 0xff)
> +
> +#define UNPOPULATED_RQ_SA	0xff
> +
> +/* Reference 7-bit rq_sa */
> +static u8 reference_rq_sa[128];
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
> +static int receive_ipmb_request(struct ipmb_dev *ipmb_dev,
> +				bool non_blocking,
> +				struct ipmb_msg *ipmb_request)
> +{
> +	struct ipmb_request_elem *queue_elem;
> +	unsigned long flags;
> +	int res;
> +
> +	while (!atomic_read(&ipmb_dev->request_queue_len)) {
> +		if (non_blocking)
> +			return -EAGAIN;
> +
> +		res =3D wait_event_interruptible(ipmb_dev->wait_queue,
> +				atomic_read(&ipmb_dev->request_queue_len));
> +		if (res)
> +			return res;
> +
> +	}
> +

This can only be called from user context with interrupts on,
spin_lock_irq() is ok here.

Done.

> +	spin_lock_irqsave(&ipmb_dev->lock, flags);
> +
> +	if (list_empty(&ipmb_dev->request_queue)) {
> +		spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +		dev_err(&ipmb_dev->client->dev, "request_queue is empty\n");
> +		return -EIO;
> +	}
> +
> +	queue_elem =3D list_first_entry(&ipmb_dev->request_queue,
> +					struct ipmb_request_elem, list);
> +	memcpy(ipmb_request, &queue_elem->request, sizeof(*ipmb_request));
> +	list_del(&queue_elem->list);
> +	kfree(queue_elem);
> +	atomic_dec(&ipmb_dev->request_queue_len);
> +
> +	spin_unlock_irqrestore(&ipmb_dev->lock, flags);
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
> +	struct ipmb_dev *ipmb_dev =3D to_ipmb_dev(file);
> +	struct ipmb_msg msg;
> +	ssize_t ret;
> +	int bus;
> +
> +	memset(&msg, 0, sizeof(msg));
> +

The mutex below is not interruptable, so if the task is interrupted, it cou=
ld be blocked here.

This function and receive_ipmb_request() seem more complicated than require=
d I don't think you need file mutex or request_queue_len.

Something like:
	spin_lock_irq();
	while (list_empty(&ipmb_dev->request_queue)) {
		spin_unlock_irq();
		if (file->f_flags & O_NONBLOCK)
			return -EAGAIN;
		res =3D wait_event_interruptible(ipmb_dev->wait_queue,
				!list_empty(&ipmb_dev->request_queue));
		if (res)
			return res;
		spin_lock_irq();
	}
	queue_elem =3D list_first_entry(&ipmb_dev->request_queue,
				      struct ipmb_request_elem, list);
	spin_unlock_irq();
	...

Done.

> +	mutex_lock(&ipmb_dev->file_mutex);
> +	ret =3D receive_ipmb_request(ipmb_dev, file->f_flags & O_NONBLOCK,
> +				&msg);
> +	if (ret < 0)
> +		goto out;
> +
> +	bus =3D ipmb_dev->client->adapter->nr;

You are using bus here without checking the range.

I still don't understandy why you are checking this, anyway.  IMHO there is=
 no value in this check, just do what userland tells you to do.  It seems r=
estrictive, you have to receive a message from the remote end to respond to=
 it.  How do you send an unsolicited event?  There are systems with multipl=
e managment controllers that can send messages to other management controll=
ers (ATCA).

I agree with you in the sense that the user program "should be" reliable si=
nce it verifies the sanity of the message via the checksum and it might be =
ok for the driver to rely on it. But I think Wolfram's concern was that the=
 linux driver is "too" reliable on the sanity of the response passed by use=
rland. It is irrelevant  to check all other IPMB message bytes passed by th=
e user program since it is the role of the BMC (requester) to do so once it=
 has received the response. However, it is relevant to verify that the rq_s=
a is correct for the one reason that we pass it to i2c_smbus_write_block_da=
ta to send the data back to the requester.
Here are 2 possible scenarios if the user program sends a corrupted rq_sa (=
i.e. a rq_sa that is different from the requester's) to this driver:
	a) If there is no slave device associated with that address, i2c_smbus_wri=
te_block_data function would just fail, which is the expected behavior. No =
issues here. It is  also fairly easy to debug.
	b) if there is a slave device associated with that address, then we might =
be sending unwanted data to that device. So this could be an issue.


> +	if (reference_rq_sa[bus] =3D=3D UNPOPULATED_RQ_SA)
> +		reference_rq_sa[bus] =3D GET_7BIT_ADDR(msg.rq_sa);
> +
> +	count =3D min_t(size_t, count, msg.len + 1);
> +	if (copy_to_user(buf, &msg, count)) {
> +		ret =3D -EFAULT;
> +		goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&ipmb_dev->file_mutex);
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
> +	int bus;
> +
> +	if (count > sizeof(msg))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&msg, buf, count) || count < msg[0])
> +		return -EFAULT;

Minor nit - you are returning EFAULT if count < msg[0].

Done.

> +
> +	bus =3D ipmb_dev->client->adapter->nr;
> +	rq_sa =3D GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
> +	if (rq_sa !=3D reference_rq_sa[bus])
> +		return -EINVAL;
> +
> +	netf_rq_lun =3D msg[NETFN_LUN_IDX];
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

Why do you need a mutex below?

Removed.

> +	mutex_lock(&ipmb_dev->file_mutex);
> +	ret =3D i2c_smbus_write_block_data(&rq_client, netf_rq_lun, msg_len,
> +					msg + SMBUS_MSG_IDX_OFFSET);
> +	mutex_unlock(&ipmb_dev->file_mutex);
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

If this is really called from interrupt context or with preempt disabled, y=
ou can't use GFP_KERNEL.

I am changing it to GFP_ATOMIC

> +	queue_elem =3D kmalloc(sizeof(*queue_elem), GFP_KERNEL);
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
> +
> +	spin_lock(&ipmb_dev->lock);

Are you sure this is called with interrupts off?

If it's called from user context, then you can just use a mutex.  If not, I=
 think you need spin_lock_irqsave() here.

I am changing it to spin_lock_irqsave

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
> +	spin_unlock(&ipmb_dev->lock);
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
> +	reference_rq_sa[client->adapter->nr] =3D UNPOPULATED_RQ_SA;
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
