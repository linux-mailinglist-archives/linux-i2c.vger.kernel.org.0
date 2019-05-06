Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2E991536D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 20:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfEFSLw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 14:11:52 -0400
Received: from sauhun.de ([88.99.104.3]:36670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbfEFSLw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 14:11:52 -0400
Received: from localhost (p54B3305A.dip0.t-ipconnect.de [84.179.48.90])
        by pokefinder.org (Postfix) with ESMTPSA id E83DE2C0963;
        Mon,  6 May 2019 20:11:48 +0200 (CEST)
Date:   Mon, 6 May 2019 20:11:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     minyard@acm.org, vadimp@mellanox.com, michaelsh@mellanox.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 1/1] Add support for IPMB driver
Message-ID: <20190506181148.GA20968@kunai>
References: <cover.1557156354.git.Asmaa@mellanox.com>
 <9856500095266840f5cf111d6b296c4689414b2d.1557156354.git.Asmaa@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <9856500095266840f5cf111d6b296c4689414b2d.1557156354.git.Asmaa@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some more words from the I2C world.

> +For instance, you can instantiate the ipmb-dev-int device from
> +user space at the 7 bit address 0x10 on bus 2:
> +
> +  # echo ipmb-dev 0x10 > /sys/bus/i2c/devices/i2c-2/new_device

"0x1010" as described in Documentation/i2c/slave-interface

> +config IPMB_DEVICE_INTERFACE
> +       tristate 'IPMB Interface handler'
> +       depends on I2C && I2C_SLAVE

Minor nit: I2C could be dropped because I2C_SLAVE depends on it.

> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o
> +obj-$(CONFIG_IPMB_DEVICE_INTERFACE) +=3D ipmb_dev_int.o

Dunno if IPMI maintainers care about sorting here?

> +#define	dev_fmt(fmt) "ipmb_dev_int: " fmt

I think this can go now. dev_* with miscchar device (as it is done now)
should be all good.

> +#define	MAX_MSG_LEN		128
> +#define	IPMB_REQUEST_LEN_MIN	7
> +#define	NETFN_RSP_BIT_MASK	0x4
> +#define	REQUEST_QUEUE_MAX_LEN	256
> +
> +#define	IPMB_MSG_LEN_IDX	0
> +#define	RQ_SA_8BIT_IDX		1
> +#define	NETFN_LUN_IDX		2
> +
> +#define	IPMB_MSG_PAYLOAD_LEN_MAX (MAX_MSG_LEN - IPMB_REQUEST_LEN_MIN - 1)
> +
> +#define	SMBUS_MSG_HEADER_LENGTH	2
> +#define	SMBUS_MSG_IDX_OFFSET	(SMBUS_MSG_HEADER_LENGTH + 1)
> +
> +#define	GET_8BIT_ADDR(addr_7bit) ((addr_7bit << 1) && 0xff)

Still wondering about the tabs after define.

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
> +				atomic_read(&ipmb_dev_p->request_queue_len));
> +		if (res)
> +			return res;
> +
> +		spin_lock_irqsave(&ipmb_dev_p->lock, flags);
> +	}
> +
> +	if (list_empty(&ipmb_dev_p->request_queue)) {
> +		dev_err(&ipmb_dev_p->client->dev, "request_queue is empty\n");

Spinlock still held?? Kinda proves that the flow of code is still hard
to read. (I mean it is way better without the goto, but still...)

> +		return -EIO;
> +	}
> +
> +	queue_elem =3D list_first_entry(&ipmb_dev_p->request_queue,
> +					struct ipmb_request_elem, list);
> +	memcpy(ipmb_request, &queue_elem->request, sizeof(*ipmb_request));
> +	list_del(&queue_elem->list);
> +	kfree(queue_elem);
> +	atomic_dec(&ipmb_dev_p->request_queue_len);
> +
> +	spin_unlock_irqrestore(&ipmb_dev_p->lock, flags);
> +
> +	return 0;
> +}
> +

=2E..

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

This function must go. You need it solely to pass 'requester_i2c_addr'
along, but this shows that you are using the wrong i2c_client struct.
And, in deed, you don't want your own here because you don't want to
send to yourself here. Usually, you'd register a new i2c_client with the
address you want to talk to using 'i2c_new_device'. However, since this
is a userspace interface, I guess we can do something similar as in
i2c-dev.c, namely an anonymous i2c_client. Read on.

> +
> +static ssize_t ipmb_write(struct file *file, const char __user *buf,
> +			size_t count, loff_t *ppos)
> +{
> +	struct ipmb_dev *ipmb_dev_p =3D to_ipmb_dev(file);
> +	u8 msg[MAX_MSG_LEN];
> +	ssize_t ret;
> +	u8 rq_sa, netf_rq_lun, msg_len;

=46rom the top of my head, not sure if I got all details right:

+	struct i2c_client rq_client =3D { };

> +	if (count > sizeof(msg))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&msg, buf, count) || count < msg[0])
> +		return -EFAULT;
> +
> +	rq_sa =3D msg[RQ_SA_8BIT_IDX] >> 1;
> +	netf_rq_lun =3D msg[NETFN_LUN_IDX];

+	rq_client.name =3D "IPMB anonymous"
+	rq_client.adapter =3D ipmb_dev_p->client->adapter;
+	rq_client.addr =3D rq_sa;

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

and then replace the call above with

	ret =3D i2c_smbus_write_block_data(&rq_client, ...)

> +	mutex_unlock(&ipmb_dev_p->file_mutex);
> +
> +	return ret ? : count;
> +}
> +

=2E..

> +static int ipmb_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct ipmb_dev *ipmb_dev_p;

And I still dislike the _p suffix. It is not common Kernel coding style
and unless it is common in this subsystem, I'd suggest to drop it for
consistency reasons.

Thanks for keeping at this driver,

   Wolfram


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzQeN8ACgkQFA3kzBSg
Kbaj/hAApiDVxD7pkgluceLpkK21ZpmmDagflamm30SJz06UItvtO2ky+/69MD33
gdOvQOkwmvlPKA5xNkNxPKxKeY7BOiRDIlxAB03+ji2E6b8Xlsqc2yVoULtoDA6V
2D18AvoY6SbDXMcDQLiclF5e42X8mEqkhfrOqVndvSZ3hgf1Rd66bMJ//hiH3Jjk
SnEMS62fKuziVk5ylaGZs4/MFuC5PAyGagK8TehXD8Jryc9rUtZrvx4X1EfQfQss
iVJoQONl23OenWdGO2ruBb+S+uIOl7bM7TZdapSsILO+CBpONJxb9O01hcKD9edt
rlvSX9BMF773RPnGH4zQ5+Oi6Y2uK/oi+e8qFkwNgPpdbZGW7iPjoBQIP+iK1X4Y
xN9jxX0MNBz9CwgYjmh8ddWYoNAP3qqoiqz9+Pt5dtBMtbDSZ3HKFLIfmbWcxwD9
SEVgHIgMrsmyWp5kbVGvOnRirGQ9tQUSu3k1BJeR/YBPWMVMqF9DWcRGyQ01CZE0
w5TmGyUClqK5gwBnfUpAFoa9SQpF/Pg3R13QW4GhTAAZ40NFI9J6cbPLveKccuuh
B3f1ot2jYhY/1s9iJK7QWmFO/Q54+ppyv3nuo4ZfEGkDOvig2PO/17gJDMbklRQu
5khg61orMc6XKDGlji8zcLnJWsnk87EV6jKPDH9VYeY09wdguzs=
=h9g0
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
