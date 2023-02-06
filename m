Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C51F68C14D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 16:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjBFP2z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 10:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBFP2z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 10:28:55 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE2F72AB
        for <linux-i2c@vger.kernel.org>; Mon,  6 Feb 2023 07:28:53 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP3QJ-0005SU-7Y; Mon, 06 Feb 2023 16:28:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP3QG-0035j6-Uw; Mon, 06 Feb 2023 16:28:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP3QH-001K07-G3; Mon, 06 Feb 2023 16:28:49 +0100
Date:   Mon, 6 Feb 2023 16:28:49 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <20230206152849.aygz4hlnpo5azx75@pengutronix.de>
References: <20230118134940.240102-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fblnzjrat7iu4t6c"
Content-Disposition: inline
In-Reply-To: <20230118134940.240102-1-brgl@bgdev.pl>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fblnzjrat7iu4t6c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jan 18, 2023 at 02:49:40PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> If we open an i2c character device and then unbind the underlying i2c
> adapter (either by unbinding it manually via sysfs or - for a real-life
> example - when unplugging a USB device with an i2c adaper), the kernel
> thread calling i2c_del_adapter() will become blocked waiting for the
> completion that only completes once all references to the character
> device get dropped.

Is this bad?

> In order to fix that, we introduce a couple changes. They need to be
> part of a single commit in order to preserve bisectability. First, drop
> the dev_release completion. That removes the risk of a deadlock but
> we now need to protect the character device structures against NULL
> pointer dereferences. To that end introduce an rw semaphore. It will
> protect the dummy i2c_client structure against dropping the adapter from
> under it. It will be taken for reading by all file_operations callbacks
> and for writing by the notifier's unbind handler. This way we don't
> prohibit the syscalls that don't get in each other's way from running
> concurrently but the adapter will not be unbound before all syscalls
> return.
>=20
> Finally: upon being notified about an unbind event for the i2c adapter,
> we take the lock for writing and set the adapter pointer in the character
> device's structure to NULL. This "numbs down" the device - it still exists
> but is no longer functional. Meanwhile every syscall callback checks that
> pointer after taking the lock but before executing any code that requires
> it. If it's NULL, we return an error to user-space.
>=20
> This way we can safely open an i2c device from user-space, unbind the
> device without triggering a deadlock and any subsequent system-call for
> the file descriptor associated with the removed adapter will gracefully
> fail.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

@Bartosz, is that the patch you talked about on FOSDEM? I thought
Wolfram had some concerns but I thought they were unaddressed still.
What am I missing?

> ---
> v1 -> v2:
> - keep the device release callback and use it to free the IDR number
> - rebase on top of v6.2-rc1
>=20
> v2 -> v3:
> - make symbol names more descriptive
> - protect the name_show() sysfs callback too
> - zero the adapter's struct device on device release
> - make sure the code works nicely with CONFIG_DEBUG_KOBJECT_RELEASE enabl=
ed
>=20
>  drivers/i2c/i2c-core-base.c |  32 ++++-------
>  drivers/i2c/i2c-dev.c       | 109 +++++++++++++++++++++++++++++++-----
>  include/linux/i2c.h         |   2 -
>  3 files changed, 106 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 087e480b624c..ec8140d907c2 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1139,7 +1139,17 @@ EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
>  static void i2c_adapter_dev_release(struct device *dev)
>  {
>  	struct i2c_adapter *adap =3D to_i2c_adapter(dev);
> -	complete(&adap->dev_released);
> +
> +	/* free bus id */
> +	mutex_lock(&core_lock);
> +	idr_remove(&i2c_adapter_idr, adap->nr);
> +	mutex_unlock(&core_lock);
> +
> +	/*
> +	 * Clear the device structure in case this adapter is ever going to be
> +	 * added again.
> +	 */
> +	memset(&adap->dev, 0, sizeof(adap->dev));
>  }
> =20
>  unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
> @@ -1512,9 +1522,7 @@ static int i2c_register_adapter(struct i2c_adapter =
*adap)
>  	return 0;
> =20
>  out_reg:
> -	init_completion(&adap->dev_released);
>  	device_unregister(&adap->dev);
> -	wait_for_completion(&adap->dev_released);
>  out_list:
>  	mutex_lock(&core_lock);
>  	idr_remove(&i2c_adapter_idr, adap->nr);
> @@ -1713,25 +1721,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
> =20
>  	i2c_host_notify_irq_teardown(adap);
> =20
> -	/* wait until all references to the device are gone
> -	 *
> -	 * FIXME: This is old code and should ideally be replaced by an
> -	 * alternative which results in decoupling the lifetime of the struct
> -	 * device from the i2c_adapter, like spi or netdev do. Any solution
> -	 * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
> -	 */
> -	init_completion(&adap->dev_released);
>  	device_unregister(&adap->dev);
> -	wait_for_completion(&adap->dev_released);
> -
> -	/* free bus id */
> -	mutex_lock(&core_lock);
> -	idr_remove(&i2c_adapter_idr, adap->nr);
> -	mutex_unlock(&core_lock);
> -
> -	/* Clear the device structure in case this adapter is ever going to be
> -	   added again */
> -	memset(&adap->dev, 0, sizeof(adap->dev));
>  }
>  EXPORT_SYMBOL(i2c_del_adapter);
> =20
> diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> index 107623c4cc14..38c83ee408be 100644
> --- a/drivers/i2c/i2c-dev.c
> +++ b/drivers/i2c/i2c-dev.c
> @@ -28,6 +28,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
> +#include <linux/rwsem.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> =20
> @@ -44,8 +45,14 @@ struct i2c_dev {
>  	struct i2c_adapter *adap;
>  	struct device dev;
>  	struct cdev cdev;
> +	struct rw_semaphore rwsem;

I'd add a comment here that the semaphone protects access to adap.

>  };
> =20
> +static inline struct i2c_dev *inode_to_i2c_dev(struct inode *ino)
> +{
> +	return container_of(ino->i_cdev, struct i2c_dev, cdev);
> +}
> +
>  #define I2C_MINORS	(MINORMASK + 1)
>  static LIST_HEAD(i2c_dev_list);
>  static DEFINE_SPINLOCK(i2c_dev_list_lock);
> @@ -99,10 +106,21 @@ static ssize_t name_show(struct device *dev,
>  			 struct device_attribute *attr, char *buf)
>  {
>  	struct i2c_dev *i2c_dev =3D i2c_dev_get_by_minor(MINOR(dev->devt));
> +	const char *name;
> =20
>  	if (!i2c_dev)
>  		return -ENODEV;
> -	return sysfs_emit(buf, "%s\n", i2c_dev->adap->name);
> +
> +	down_read(&i2c_dev->rwsem);
> +	if (!i2c_dev->adap) {
> +		up_read(&i2c_dev->rwsem);
> +		return -ENODEV;
> +	}
> +
> +	name =3D i2c_dev->adap->name;
> +	up_read(&i2c_dev->rwsem);
> +

It might happen that if the adapter disappears here, name might point to
an invalid location, too, doesn't it? I think you have to do the
sysfs_emit under the lock.

Would it defeat the patch's sense to keep a reference on the adapter? I
would consider it natural to hold such a reference, but I admit I didn't
claim to fully understand the device core and this patch's effects. Does
it defeat the patch's purpose to hold a reference? I think it would
simplify some things, e.g. name wouldn't disappear here.

> +	return sysfs_emit(buf, "%s\n", name);
>  }
>  static DEVICE_ATTR_RO(name);
> =20
> @@ -136,15 +154,23 @@ static ssize_t i2cdev_read(struct file *file, char =
__user *buf, size_t count,
>  {
>  	char *tmp;
>  	int ret;
> -
> +	struct i2c_dev *i2c_dev =3D inode_to_i2c_dev(file_inode(file));
>  	struct i2c_client *client =3D file->private_data;
> =20
>  	if (count > 8192)
>  		count =3D 8192;
> =20
> +	down_read(&i2c_dev->rwsem);
> +	if (!i2c_dev->adap) {
> +		up_read(&i2c_dev->rwsem);
> +		return -ENODEV;
> +	}
> +
>  	tmp =3D kzalloc(count, GFP_KERNEL);
> -	if (tmp =3D=3D NULL)
> +	if (tmp =3D=3D NULL) {
> +		up_read(&i2c_dev->rwsem);
>  		return -ENOMEM;
> +	}
> =20
>  	pr_debug("i2c-%d reading %zu bytes.\n", iminor(file_inode(file)), count=
);
> =20
> @@ -152,6 +178,7 @@ static ssize_t i2cdev_read(struct file *file, char __=
user *buf, size_t count,
>  	if (ret >=3D 0)
>  		if (copy_to_user(buf, tmp, ret))
>  			ret =3D -EFAULT;
> +	up_read(&i2c_dev->rwsem);
>  	kfree(tmp);
>  	return ret;
>  }
> @@ -161,18 +188,28 @@ static ssize_t i2cdev_write(struct file *file, cons=
t char __user *buf,
>  {
>  	int ret;
>  	char *tmp;
> +	struct i2c_dev *i2c_dev =3D inode_to_i2c_dev(file_inode(file));
>  	struct i2c_client *client =3D file->private_data;
> =20
>  	if (count > 8192)
>  		count =3D 8192;
> =20
> +	down_read(&i2c_dev->rwsem);
> +	if (!i2c_dev->adap) {
> +		up_read(&i2c_dev->rwsem);
> +		return -ENODEV;
> +	}
> +
>  	tmp =3D memdup_user(buf, count);
> -	if (IS_ERR(tmp))
> +	if (IS_ERR(tmp)) {
> +		up_read(&i2c_dev->rwsem);
>  		return PTR_ERR(tmp);
> +	}
> =20
>  	pr_debug("i2c-%d writing %zu bytes.\n", iminor(file_inode(file)), count=
);
> =20
>  	ret =3D i2c_master_send(client, tmp, count);
> +	up_read(&i2c_dev->rwsem);
>  	kfree(tmp);
>  	return ret;
>  }
> @@ -389,7 +426,8 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_cli=
ent *client,
>  	return res;
>  }
> =20
> -static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned l=
ong arg)
> +static long i2cdev_ioctl_unlocked(struct file *file, unsigned int cmd,
> +				  unsigned long arg)

IMHO this name is a bit unfortunate because of
file_operations::unlocked_ioctl. The unlocked in the callback name is
something different to the meaning of unlocked here.

>  {
>  	struct i2c_client *client =3D file->private_data;
>  	unsigned long funcs;
> @@ -495,6 +533,20 @@ static long i2cdev_ioctl(struct file *file, unsigned=
 int cmd, unsigned long arg)
>  	return 0;
>  }
> =20
> +static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned l=
ong arg)
> +{
> +	struct i2c_dev *i2c_dev =3D inode_to_i2c_dev(file_inode(file));
> +	long ret;
> +
> +	down_read(&i2c_dev->rwsem);
> +	if (!i2c_dev->adap)
> +		ret =3D -ENODEV;
> +	else
> +		ret =3D i2cdev_ioctl_unlocked(file, cmd, arg);
> +	up_read(&i2c_dev->rwsem);
> +
> +	return ret;
> +}
>  #ifdef CONFIG_COMPAT
> =20
>  struct i2c_smbus_ioctl_data32 {
> @@ -516,10 +568,12 @@ struct i2c_rdwr_ioctl_data32 {
>  	u32 nmsgs;
>  };
> =20
> -static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, uns=
igned long arg)
> +static long compat_i2cdev_ioctl_unlocked(struct file *file, unsigned int=
 cmd,
> +					 unsigned long arg)
>  {
>  	struct i2c_client *client =3D file->private_data;
>  	unsigned long funcs;
> +
>  	switch (cmd) {
>  	case I2C_FUNCS:
>  		funcs =3D i2c_get_functionality(client->adapter);
> @@ -578,19 +632,39 @@ static long compat_i2cdev_ioctl(struct file *file, =
unsigned int cmd, unsigned lo
>  		return i2cdev_ioctl(file, cmd, arg);
>  	}
>  }
> +
> +static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd,
> +				unsigned long arg)
> +{
> +	struct i2c_dev *i2c_dev =3D inode_to_i2c_dev(file_inode(file));
> +	long ret;
> +
> +	down_read(&i2c_dev->rwsem);
> +	if (!i2c_dev->adap)
> +		ret =3D -ENODEV;
> +	else
> +		ret =3D compat_i2cdev_ioctl_unlocked(file, cmd, arg);
> +	up_read(&i2c_dev->rwsem);
> +
> +	return ret;
> +}
>  #else
>  #define compat_i2cdev_ioctl NULL
>  #endif
> =20
>  static int i2cdev_open(struct inode *inode, struct file *file)
>  {
> -	unsigned int minor =3D iminor(inode);
> +	struct i2c_dev *i2c_dev =3D inode_to_i2c_dev(inode);
>  	struct i2c_client *client;
>  	struct i2c_adapter *adap;
> +	int ret =3D 0;
> =20
> -	adap =3D i2c_get_adapter(minor);
> -	if (!adap)
> -		return -ENODEV;
> +	down_read(&i2c_dev->rwsem);
> +	adap =3D i2c_dev->adap;
> +	if (!adap) {
> +		ret =3D -ENODEV;
> +		goto out_unlock;
> +	}
> =20
>  	/* This creates an anonymous i2c_client, which may later be
>  	 * pointed to some address using I2C_SLAVE or I2C_SLAVE_FORCE.
> @@ -601,22 +675,23 @@ static int i2cdev_open(struct inode *inode, struct =
file *file)
>  	 */
>  	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
>  	if (!client) {
> -		i2c_put_adapter(adap);
> -		return -ENOMEM;
> +		ret =3D -ENOMEM;
> +		goto out_unlock;
>  	}
>  	snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
> =20
>  	client->adapter =3D adap;
>  	file->private_data =3D client;
> =20
> -	return 0;
> +out_unlock:
> +	up_read(&i2c_dev->rwsem);
> +	return ret;
>  }
> =20
>  static int i2cdev_release(struct inode *inode, struct file *file)
>  {
>  	struct i2c_client *client =3D file->private_data;
> =20
> -	i2c_put_adapter(client->adapter);
>  	kfree(client);
>  	file->private_data =3D NULL;
> =20
> @@ -669,6 +744,8 @@ static int i2cdev_attach_adapter(struct device *dev, =
void *dummy)
>  	i2c_dev->dev.parent =3D &adap->dev;
>  	i2c_dev->dev.release =3D i2cdev_dev_release;
> =20
> +	init_rwsem(&i2c_dev->rwsem);
> +
>  	res =3D dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
>  	if (res)
>  		goto err_put_i2c_dev;
> @@ -698,6 +775,10 @@ static int i2cdev_detach_adapter(struct device *dev,=
 void *dummy)
>  	if (!i2c_dev) /* attach_adapter must have failed */
>  		return NOTIFY_DONE;
> =20
> +	down_write(&i2c_dev->rwsem);
> +	i2c_dev->adap =3D NULL;
> +	up_write(&i2c_dev->rwsem);
> +
>  	put_i2c_dev(i2c_dev, true);
> =20
>  	pr_debug("adapter [%s] unregistered\n", adap->name);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d84e0e99f084..3f31e4032044 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -14,7 +14,6 @@
>  #include <linux/bits.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/device.h>	/* for struct device */
> -#include <linux/sched.h>	/* for completion */
>  #include <linux/mutex.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
> @@ -739,7 +738,6 @@ struct i2c_adapter {
> =20
>  	int nr;
>  	char name[48];
> -	struct completion dev_released;
> =20
>  	struct mutex userspace_clients_lock;
>  	struct list_head userspace_clients;
> --=20
> 2.37.2
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fblnzjrat7iu4t6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPhHK4ACgkQwfwUeK3K
7Am5gAf/RiF9emuabYwtZE/LqdRqJNMVOvNtHOXWwSBSWNY+yhK1aKKOu0RHSrRC
ISF9JI7bxV5r7GXhcQ/J0IwRj3rgbRvoa36cbz4ijMPBN5ELcmx2Wx9PHniNYY7x
QMMP2kw8KtDPq3VBm+p1iIFKCqjTt4R5vbpCUMFbegBzcYSWdzw8jQrVo03mpNIh
kJkyNgu6+EJO5lLSTLg0s0g+cFWLofOlHMmF9ytTB4wpqYwdm4HA+9P5f01iaYo1
LcypoIItmpGQ/622z9wU4ssVdwVbdGJowH5ZHodvG2TgWn23/ppYz9vHxhHFkgok
TVRRBlaWHF7nfRW87SXnyuDUNYq3og==
=wyO/
-----END PGP SIGNATURE-----

--fblnzjrat7iu4t6c--
