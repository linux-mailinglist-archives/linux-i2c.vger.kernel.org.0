Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306BC665D05
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jan 2023 14:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbjAKNut (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Jan 2023 08:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239134AbjAKNdg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Jan 2023 08:33:36 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BA01B9F3;
        Wed, 11 Jan 2023 05:32:42 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 740041BF20D;
        Wed, 11 Jan 2023 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1673443961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fhJfy58Wim3I6Uy+3tQwAhlF/9yDhsCxzNqEc6EuAvA=;
        b=jG7wlacqv9Y4oZQ7Dgp/NGAz9LLTYwSrgd8SsHXtcdljEJlU4npZXLFXbmV+i6GLjVTgzz
        9dfk2zKK+XffX4XxYwrQI2zzDS+r8tgzF3HnGjyKO0sYe5NYR7URxyujI3YWeXo1po/2kf
        e4RM4uDN8loTbKTsdVZ2kOp++9X1WSHir11VDASqZlzecnczCP3IBfbdNLcLkIZ4YgObpz
        BHRcd8ji7zuNG/47lbkulphOSIE7DMqWSpWQbI5d+xZJlu5hKHsRH3TapnepGofg8mGHxs
        NeEd6je9erlp8UL67B1ZZdlsNedS0Lms6h83S3Bu+feUWSCBAzGQda5Wza2/nA==
Date:   Wed, 11 Jan 2023 14:32:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 05/16] driver core: make struct device_type.uevent()
 take a const *
Message-ID: <Y766c6QyOaG8oQlu@mail.local>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111113018.459199-6-gregkh@linuxfoundation.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/01/2023 12:30:07+0100, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Sean Young <sean@mess.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Michael Jamet <michael.jamet@intel.com>
> Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Chaitanya Kulkarni <kch@nvidia.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Won Chung <wonchung@google.com>
> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-block@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-i3c@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux1394-devel@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com> # for Thunderbolt
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  block/partitions/core.c                   |  4 ++--
>  drivers/acpi/device_sysfs.c               |  8 ++++----
>  drivers/acpi/internal.h                   |  2 +-
>  drivers/firewire/core-device.c            |  8 ++++----
>  drivers/gpu/drm/display/drm_dp_aux_bus.c  |  2 +-
>  drivers/i2c/i2c-core-base.c               |  4 ++--
>  drivers/i3c/device.c                      |  2 +-
>  drivers/i3c/master.c                      |  4 ++--
>  drivers/input/input.c                     | 16 ++++++++--------
>  drivers/media/rc/rc-main.c                |  2 +-
>  drivers/platform/surface/aggregator/bus.c |  4 ++--
>  drivers/soundwire/bus_type.c              |  4 ++--
>  drivers/thunderbolt/switch.c              |  4 ++--
>  drivers/thunderbolt/tb.h                  |  2 +-
>  drivers/thunderbolt/xdomain.c             |  6 +++---
>  drivers/tty/serdev/core.c                 |  2 +-
>  drivers/usb/core/message.c                |  8 ++++----
>  drivers/usb/core/usb.c                    |  4 ++--
>  drivers/usb/phy/phy.c                     |  6 +++---
>  drivers/usb/roles/class.c                 |  3 +--
>  drivers/usb/typec/class.c                 |  2 +-
>  include/linux/acpi.h                      |  4 ++--
>  include/linux/device.h                    |  2 +-
>  include/linux/i3c/device.h                |  2 +-
>  include/linux/soundwire/sdw_type.h        |  2 +-
>  25 files changed, 53 insertions(+), 54 deletions(-)
> 
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index b8112f52d388..7b8ef6296abd 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -254,9 +254,9 @@ static void part_release(struct device *dev)
>  	iput(dev_to_bdev(dev)->bd_inode);
>  }
>  
> -static int part_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int part_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct block_device *part = dev_to_bdev(dev);
> +	const struct block_device *part = dev_to_bdev(dev);
>  
>  	add_uevent_var(env, "PARTN=%u", part->bd_partno);
>  	if (part->bd_meta_info && part->bd_meta_info->volname[0])
> diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
> index 120873dad2cc..daff2c0c5c52 100644
> --- a/drivers/acpi/device_sysfs.c
> +++ b/drivers/acpi/device_sysfs.c
> @@ -133,7 +133,7 @@ static void acpi_hide_nondev_subnodes(struct acpi_device_data *data)
>   *         -EINVAL: output error
>   *         -ENOMEM: output is truncated
>   */
> -static int create_pnp_modalias(struct acpi_device *acpi_dev, char *modalias,
> +static int create_pnp_modalias(const struct acpi_device *acpi_dev, char *modalias,
>  			       int size)
>  {
>  	int len;
> @@ -191,7 +191,7 @@ static int create_pnp_modalias(struct acpi_device *acpi_dev, char *modalias,
>   * only be called for devices having ACPI_DT_NAMESPACE_HID in their list of
>   * ACPI/PNP IDs.
>   */
> -static int create_of_modalias(struct acpi_device *acpi_dev, char *modalias,
> +static int create_of_modalias(const struct acpi_device *acpi_dev, char *modalias,
>  			      int size)
>  {
>  	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER };
> @@ -239,7 +239,7 @@ static int create_of_modalias(struct acpi_device *acpi_dev, char *modalias,
>  	return len;
>  }
>  
> -int __acpi_device_uevent_modalias(struct acpi_device *adev,
> +int __acpi_device_uevent_modalias(const struct acpi_device *adev,
>  				  struct kobj_uevent_env *env)
>  {
>  	int len;
> @@ -277,7 +277,7 @@ int __acpi_device_uevent_modalias(struct acpi_device *adev,
>   * Because other buses do not support ACPI HIDs & CIDs, e.g. for a device with
>   * hid:IBM0001 and cid:ACPI0001 you get: "acpi:IBM0001:ACPI0001".
>   */
> -int acpi_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
> +int acpi_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
>  	return __acpi_device_uevent_modalias(acpi_companion_match(dev), env);
>  }
> diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
> index ec584442fb29..06ad497067ac 100644
> --- a/drivers/acpi/internal.h
> +++ b/drivers/acpi/internal.h
> @@ -120,7 +120,7 @@ int acpi_bus_register_early_device(int type);
>                       Device Matching and Notification
>     -------------------------------------------------------------------------- */
>  struct acpi_device *acpi_companion_match(const struct device *dev);
> -int __acpi_device_uevent_modalias(struct acpi_device *adev,
> +int __acpi_device_uevent_modalias(const struct acpi_device *adev,
>  				  struct kobj_uevent_env *env);
>  
>  /* --------------------------------------------------------------------------
> diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
> index adddd8c45d0c..aa597cda0d88 100644
> --- a/drivers/firewire/core-device.c
> +++ b/drivers/firewire/core-device.c
> @@ -133,7 +133,7 @@ static void get_ids(const u32 *directory, int *id)
>  	}
>  }
>  
> -static void get_modalias_ids(struct fw_unit *unit, int *id)
> +static void get_modalias_ids(const struct fw_unit *unit, int *id)
>  {
>  	get_ids(&fw_parent_device(unit)->config_rom[5], id);
>  	get_ids(unit->directory, id);
> @@ -195,7 +195,7 @@ static void fw_unit_remove(struct device *dev)
>  	driver->remove(fw_unit(dev));
>  }
>  
> -static int get_modalias(struct fw_unit *unit, char *buffer, size_t buffer_size)
> +static int get_modalias(const struct fw_unit *unit, char *buffer, size_t buffer_size)
>  {
>  	int id[] = {0, 0, 0, 0};
>  
> @@ -206,9 +206,9 @@ static int get_modalias(struct fw_unit *unit, char *buffer, size_t buffer_size)
>  			id[0], id[1], id[2], id[3]);
>  }
>  
> -static int fw_unit_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int fw_unit_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct fw_unit *unit = fw_unit(dev);
> +	const struct fw_unit *unit = fw_unit(dev);
>  	char modalias[64];
>  
>  	get_modalias(unit, modalias, sizeof(modalias));
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index e31a0261c53e..8a165be1a821 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -161,7 +161,7 @@ static void dp_aux_ep_dev_release(struct device *dev)
>  	kfree(aux_ep_with_data);
>  }
>  
> -static int dp_aux_ep_dev_modalias(struct device *dev, struct kobj_uevent_env *env)
> +static int dp_aux_ep_dev_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
>  	return of_device_uevent_modalias(dev, env);
>  }
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 087e480b624c..51b78a52ab7f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -136,9 +136,9 @@ static int i2c_device_match(struct device *dev, struct device_driver *drv)
>  	return 0;
>  }
>  
> -static int i2c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int i2c_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct i2c_client *client = to_i2c_client(dev);
> +	const struct i2c_client *client = to_i2c_client(dev);
>  	int rc;
>  
>  	rc = of_device_uevent_modalias(dev, env);
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index d111499061b2..1a6a8703dbc3 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -78,7 +78,7 @@ EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
>   *
>   * Retrieve I3C dev info.
>   */
> -void i3c_device_get_info(struct i3c_device *dev,
> +void i3c_device_get_info(const struct i3c_device *dev,
>  			 struct i3c_device_info *info)
>  {
>  	if (!info)
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d7e6f6c99aea..7a60e1c5e587 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -273,9 +273,9 @@ static struct attribute *i3c_device_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(i3c_device);
>  
> -static int i3c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> +	const struct i3c_device *i3cdev = dev_to_i3cdev(dev);
>  	struct i3c_device_info devinfo;
>  	u16 manuf, part, ext;
>  
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ca2e3dd7188b..0336e799d713 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -1372,7 +1372,7 @@ INPUT_DEV_STRING_ATTR_SHOW(phys);
>  INPUT_DEV_STRING_ATTR_SHOW(uniq);
>  
>  static int input_print_modalias_bits(char *buf, int size,
> -				     char name, unsigned long *bm,
> +				     char name, const unsigned long *bm,
>  				     unsigned int min_bit, unsigned int max_bit)
>  {
>  	int len = 0, i;
> @@ -1384,7 +1384,7 @@ static int input_print_modalias_bits(char *buf, int size,
>  	return len;
>  }
>  
> -static int input_print_modalias(char *buf, int size, struct input_dev *id,
> +static int input_print_modalias(char *buf, int size, const struct input_dev *id,
>  				int add_cr)
>  {
>  	int len;
> @@ -1432,7 +1432,7 @@ static ssize_t input_dev_show_modalias(struct device *dev,
>  }
>  static DEVICE_ATTR(modalias, S_IRUGO, input_dev_show_modalias, NULL);
>  
> -static int input_print_bitmap(char *buf, int buf_size, unsigned long *bitmap,
> +static int input_print_bitmap(char *buf, int buf_size, const unsigned long *bitmap,
>  			      int max, int add_cr);
>  
>  static ssize_t input_dev_show_properties(struct device *dev,
> @@ -1524,7 +1524,7 @@ static const struct attribute_group input_dev_id_attr_group = {
>  	.attrs	= input_dev_id_attrs,
>  };
>  
> -static int input_print_bitmap(char *buf, int buf_size, unsigned long *bitmap,
> +static int input_print_bitmap(char *buf, int buf_size, const unsigned long *bitmap,
>  			      int max, int add_cr)
>  {
>  	int i;
> @@ -1621,7 +1621,7 @@ static void input_dev_release(struct device *device)
>   * device bitfields.
>   */
>  static int input_add_uevent_bm_var(struct kobj_uevent_env *env,
> -				   const char *name, unsigned long *bitmap, int max)
> +				   const char *name, const unsigned long *bitmap, int max)
>  {
>  	int len;
>  
> @@ -1639,7 +1639,7 @@ static int input_add_uevent_bm_var(struct kobj_uevent_env *env,
>  }
>  
>  static int input_add_uevent_modalias_var(struct kobj_uevent_env *env,
> -					 struct input_dev *dev)
> +					 const struct input_dev *dev)
>  {
>  	int len;
>  
> @@ -1677,9 +1677,9 @@ static int input_add_uevent_modalias_var(struct kobj_uevent_env *env,
>  			return err;					\
>  	} while (0)
>  
> -static int input_dev_uevent(struct device *device, struct kobj_uevent_env *env)
> +static int input_dev_uevent(const struct device *device, struct kobj_uevent_env *env)
>  {
> -	struct input_dev *dev = to_input_dev(device);
> +	const struct input_dev *dev = to_input_dev(device);
>  
>  	INPUT_ADD_HOTPLUG_VAR("PRODUCT=%x/%x/%x/%x",
>  				dev->id.bustype, dev->id.vendor,
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 527d9324742b..6bdad6341844 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -1614,7 +1614,7 @@ static void rc_dev_release(struct device *device)
>  	kfree(dev);
>  }
>  
> -static int rc_dev_uevent(struct device *device, struct kobj_uevent_env *env)
> +static int rc_dev_uevent(const struct device *device, struct kobj_uevent_env *env)
>  {
>  	struct rc_dev *dev = to_rc_dev(device);
>  	int ret = 0;
> diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
> index de539938896e..407eb55050a6 100644
> --- a/drivers/platform/surface/aggregator/bus.c
> +++ b/drivers/platform/surface/aggregator/bus.c
> @@ -35,9 +35,9 @@ static struct attribute *ssam_device_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(ssam_device);
>  
> -static int ssam_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int ssam_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct ssam_device *sdev = to_ssam_device(dev);
> +	const struct ssam_device *sdev = to_ssam_device(dev);
>  
>  	return add_uevent_var(env, "MODALIAS=ssam:d%02Xc%02Xt%02Xi%02Xf%02X",
>  			      sdev->uid.domain, sdev->uid.category,
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 04b3529f8929..26c9a0a85d49 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -58,9 +58,9 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  			slave->id.sdw_version, slave->id.class_id);
>  }
>  
> -int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env)
> +int sdw_slave_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	const struct sdw_slave *slave = dev_to_sdw_dev(dev);
>  	char modalias[32];
>  
>  	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 363d712aa364..cb6c304c445e 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -2176,9 +2176,9 @@ static void tb_switch_release(struct device *dev)
>  	kfree(sw);
>  }
>  
> -static int tb_switch_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int tb_switch_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct tb_switch *sw = tb_to_switch(dev);
> +	const struct tb_switch *sw = tb_to_switch(dev);
>  	const char *type;
>  
>  	if (sw->config.thunderbolt_version == USB4_VERSION_1_0) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index f9786976f5ec..909da0a98134 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -815,7 +815,7 @@ static inline bool tb_is_switch(const struct device *dev)
>  	return dev->type == &tb_switch_type;
>  }
>  
> -static inline struct tb_switch *tb_to_switch(struct device *dev)
> +static inline struct tb_switch *tb_to_switch(const struct device *dev)
>  {
>  	if (tb_is_switch(dev))
>  		return container_of(dev, struct tb_switch, dev);
> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index cfa83486c9da..7bf1e360b04c 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -881,7 +881,7 @@ static ssize_t key_show(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RO(key);
>  
> -static int get_modalias(struct tb_service *svc, char *buf, size_t size)
> +static int get_modalias(const struct tb_service *svc, char *buf, size_t size)
>  {
>  	return snprintf(buf, size, "tbsvc:k%sp%08Xv%08Xr%08X", svc->key,
>  			svc->prtcid, svc->prtcvers, svc->prtcrevs);
> @@ -953,9 +953,9 @@ static const struct attribute_group *tb_service_attr_groups[] = {
>  	NULL,
>  };
>  
> -static int tb_service_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int tb_service_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct tb_service *svc = container_of(dev, struct tb_service, dev);
> +	const struct tb_service *svc = container_of_const(dev, struct tb_service, dev);
>  	char modalias[64];
>  
>  	get_modalias(svc, modalias, sizeof(modalias));
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 0180e1e4e75d..aa80de3a8194 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -42,7 +42,7 @@ static struct attribute *serdev_device_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(serdev_device);
>  
> -static int serdev_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int serdev_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
>  	int rc;
>  
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 127fac1af676..cc404bb7e8f7 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1819,11 +1819,11 @@ void usb_authorize_interface(struct usb_interface *intf)
>  	}
>  }
>  
> -static int usb_if_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_if_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct usb_device *usb_dev;
> -	struct usb_interface *intf;
> -	struct usb_host_interface *alt;
> +	const struct usb_device *usb_dev;
> +	const struct usb_interface *intf;
> +	const struct usb_host_interface *alt;
>  
>  	intf = to_usb_interface(dev);
>  	usb_dev = interface_to_usbdev(intf);
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 11b15d7b357a..8527c06b65e6 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -423,9 +423,9 @@ static void usb_release_dev(struct device *dev)
>  	kfree(udev);
>  }
>  
> -static int usb_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_dev_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct usb_device *usb_dev;
> +	const struct usb_device *usb_dev;
>  
>  	usb_dev = to_usb_device(dev);
>  
> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 1b24492bb4e5..4b468bde19cf 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -80,7 +80,7 @@ static struct usb_phy *__of_usb_find_phy(struct device_node *node)
>  	return ERR_PTR(-EPROBE_DEFER);
>  }
>  
> -static struct usb_phy *__device_to_usb_phy(struct device *dev)
> +static struct usb_phy *__device_to_usb_phy(const struct device *dev)
>  {
>  	struct usb_phy *usb_phy;
>  
> @@ -145,9 +145,9 @@ static void usb_phy_notify_charger_work(struct work_struct *work)
>  	kobject_uevent(&usb_phy->dev->kobj, KOBJ_CHANGE);
>  }
>  
> -static int usb_phy_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_phy_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct usb_phy *usb_phy;
> +	const struct usb_phy *usb_phy;
>  	char uchger_state[50] = { 0 };
>  	char uchger_type[50] = { 0 };
>  	unsigned long flags;
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index eacb46ec2ab3..56814ef80c24 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -274,8 +274,7 @@ static const struct attribute_group *usb_role_switch_groups[] = {
>  	NULL,
>  };
>  
> -static int
> -usb_role_switch_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_role_switch_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
>  	int ret;
>  
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 5897905cb4f0..a89d8fd3f46c 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1737,7 +1737,7 @@ static const struct attribute_group *typec_groups[] = {
>  	NULL
>  };
>  
> -static int typec_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
>  	int ret;
>  
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 5e6a876e17ba..564b62f13bd0 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -723,7 +723,7 @@ const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
>  const void *acpi_device_get_match_data(const struct device *dev);
>  extern bool acpi_driver_match_device(struct device *dev,
>  				     const struct device_driver *drv);
> -int acpi_device_uevent_modalias(struct device *, struct kobj_uevent_env *);
> +int acpi_device_uevent_modalias(const struct device *, struct kobj_uevent_env *);
>  int acpi_device_modalias(struct device *, char *, int);
>  
>  struct platform_device *acpi_create_platform_device(struct acpi_device *,
> @@ -958,7 +958,7 @@ static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
>  	return NULL;
>  }
>  
> -static inline int acpi_device_uevent_modalias(struct device *dev,
> +static inline int acpi_device_uevent_modalias(const struct device *dev,
>  				struct kobj_uevent_env *env)
>  {
>  	return -ENODEV;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 44e3acae7b36..dad0614aad96 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -88,7 +88,7 @@ int subsys_virtual_register(struct bus_type *subsys,
>  struct device_type {
>  	const char *name;
>  	const struct attribute_group **groups;
> -	int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
> +	int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
>  	char *(*devnode)(struct device *dev, umode_t *mode,
>  			 kuid_t *uid, kgid_t *gid);
>  	void (*release)(struct device *dev);
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 68b558929aec..ce115ef08fec 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -303,7 +303,7 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  
>  int i3c_device_do_setdasa(struct i3c_device *dev);
>  
> -void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
> +void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>  
>  struct i3c_ibi_payload {
>  	unsigned int len;
> diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
> index 52eb66cd11bc..d8c27f1e5559 100644
> --- a/include/linux/soundwire/sdw_type.h
> +++ b/include/linux/soundwire/sdw_type.h
> @@ -21,7 +21,7 @@ static inline int is_sdw_slave(const struct device *dev)
>  int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
>  void sdw_unregister_driver(struct sdw_driver *drv);
>  
> -int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env);
> +int sdw_slave_uevent(const struct device *dev, struct kobj_uevent_env *env);
>  
>  /**
>   * module_sdw_driver() - Helper macro for registering a Soundwire driver
> -- 
> 2.39.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
