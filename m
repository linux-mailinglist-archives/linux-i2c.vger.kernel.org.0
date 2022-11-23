Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C31635D09
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 13:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237540AbiKWMie (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 07:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237163AbiKWMiZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 07:38:25 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251196586F;
        Wed, 23 Nov 2022 04:38:17 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id e15so12024040qvo.4;
        Wed, 23 Nov 2022 04:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NkUKCNmCWXBNvukMIfZGAknzbWVh0TXCQdqjxDeaN4=;
        b=prqMtrIwLOBGqBv943u9aOZWR82NYdjQQpNnh15MtOcu8NWSBQzrTUZuSN2vtBV+4a
         p5r2kBzUr9OrlmhKlTJxhN+1WNsGJpWOyRKzKOVuyyKAWcQ7Jqrpd8xRM5Tbls/ktw0t
         Ke2AN73+r21EpjgjoSdKkhhjARanDSyzy9TDN6lDkSHjJFrsqAay0o0OT9AbXnjuLomz
         6rc3t+DdRwl2pUF2CxIDrSSuez/LJrqSU+IG8rg7oA3Kz3RGWkM9oSdDcDRBuNga9U33
         Yo3mTAYX11TSBceterjFH8PdY4s8lcAqPlrMCxvIKAE0djryhFnhtFvM/T1IytxjuDu6
         5VBw==
X-Gm-Message-State: ANoB5pmIhnMRAzlVTjer23XmEkLjb00wt/Hn27qpEZRbF6Z20284htFT
        GMsEVamvRnwtgzdbv3OQIkdpo4r+D3imBDfO6k4=
X-Google-Smtp-Source: AA0mqf6UCSCQQ7JObQehXZXhHjuD6y8mdmSKy1E2q4G6RlAyS87PHHdi8k5SiBpy46XVKXMVVouGYdRwh8HVfNaVaqA=
X-Received: by 2002:ad4:534b:0:b0:4b1:8429:a8a7 with SMTP id
 v11-20020ad4534b000000b004b18429a8a7mr7947668qvs.52.1669207096142; Wed, 23
 Nov 2022 04:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org> <20221123122523.1332370-3-gregkh@linuxfoundation.org>
In-Reply-To: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 23 Nov 2022 13:38:05 +0100
Message-ID: <CAJZ5v0gqD_TW3iGLAiH=us1B0-JLGtv2VGTJjQwiWxCmris9ag@mail.gmail.com>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
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
        Mika Westerberg <mika.westerberg@linux.intel.com>,
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
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 1:25 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Sean Young <sean@mess.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
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
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
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
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

(which my ACPI maintainer hat on).

Thanks!

> ---
>  block/partitions/core.c                   |  4 ++--
>  drivers/acpi/device_sysfs.c               |  8 ++++----
>  drivers/acpi/internal.h                   |  2 +-
>  drivers/firewire/core-device.c            |  8 ++++----
>  drivers/i2c/i2c-core-base.c               |  4 ++--
>  drivers/i3c/device.c                      |  4 ++--
>  drivers/i3c/master.c                      |  4 ++--
>  drivers/input/input.c                     | 16 ++++++++--------
>  drivers/media/rc/rc-main.c                |  2 +-
>  drivers/of/device.c                       |  4 ++--
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
>  include/linux/firewire.h                  |  6 +++---
>  include/linux/i3c/device.h                |  4 ++--
>  include/linux/of_device.h                 |  4 ++--
>  include/linux/soundwire/sdw_type.h        |  2 +-
>  include/linux/surface_aggregator/device.h |  2 +-
>  28 files changed, 62 insertions(+), 63 deletions(-)
>
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index b8112f52d388..7b8ef6296abd 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -254,9 +254,9 @@ static void part_release(struct device *dev)
>         iput(dev_to_bdev(dev)->bd_inode);
>  }
>
> -static int part_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int part_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct block_device *part = dev_to_bdev(dev);
> +       const struct block_device *part = dev_to_bdev(dev);
>
>         add_uevent_var(env, "PARTN=%u", part->bd_partno);
>         if (part->bd_meta_info && part->bd_meta_info->volname[0])
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
>                                int size)
>  {
>         int len;
> @@ -191,7 +191,7 @@ static int create_pnp_modalias(struct acpi_device *acpi_dev, char *modalias,
>   * only be called for devices having ACPI_DT_NAMESPACE_HID in their list of
>   * ACPI/PNP IDs.
>   */
> -static int create_of_modalias(struct acpi_device *acpi_dev, char *modalias,
> +static int create_of_modalias(const struct acpi_device *acpi_dev, char *modalias,
>                               int size)
>  {
>         struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER };
> @@ -239,7 +239,7 @@ static int create_of_modalias(struct acpi_device *acpi_dev, char *modalias,
>         return len;
>  }
>
> -int __acpi_device_uevent_modalias(struct acpi_device *adev,
> +int __acpi_device_uevent_modalias(const struct acpi_device *adev,
>                                   struct kobj_uevent_env *env)
>  {
>         int len;
> @@ -277,7 +277,7 @@ int __acpi_device_uevent_modalias(struct acpi_device *adev,
>   * Because other buses do not support ACPI HIDs & CIDs, e.g. for a device with
>   * hid:IBM0001 and cid:ACPI0001 you get: "acpi:IBM0001:ACPI0001".
>   */
> -int acpi_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
> +int acpi_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
>         return __acpi_device_uevent_modalias(acpi_companion_match(dev), env);
>  }
> diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
> index 219c02df9a08..d422884eb3d0 100644
> --- a/drivers/acpi/internal.h
> +++ b/drivers/acpi/internal.h
> @@ -120,7 +120,7 @@ int acpi_bus_register_early_device(int type);
>                       Device Matching and Notification
>     -------------------------------------------------------------------------- */
>  struct acpi_device *acpi_companion_match(const struct device *dev);
> -int __acpi_device_uevent_modalias(struct acpi_device *adev,
> +int __acpi_device_uevent_modalias(const struct acpi_device *adev,
>                                   struct kobj_uevent_env *env);
>
>  /* --------------------------------------------------------------------------
> diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
> index adddd8c45d0c..aa597cda0d88 100644
> --- a/drivers/firewire/core-device.c
> +++ b/drivers/firewire/core-device.c
> @@ -133,7 +133,7 @@ static void get_ids(const u32 *directory, int *id)
>         }
>  }
>
> -static void get_modalias_ids(struct fw_unit *unit, int *id)
> +static void get_modalias_ids(const struct fw_unit *unit, int *id)
>  {
>         get_ids(&fw_parent_device(unit)->config_rom[5], id);
>         get_ids(unit->directory, id);
> @@ -195,7 +195,7 @@ static void fw_unit_remove(struct device *dev)
>         driver->remove(fw_unit(dev));
>  }
>
> -static int get_modalias(struct fw_unit *unit, char *buffer, size_t buffer_size)
> +static int get_modalias(const struct fw_unit *unit, char *buffer, size_t buffer_size)
>  {
>         int id[] = {0, 0, 0, 0};
>
> @@ -206,9 +206,9 @@ static int get_modalias(struct fw_unit *unit, char *buffer, size_t buffer_size)
>                         id[0], id[1], id[2], id[3]);
>  }
>
> -static int fw_unit_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int fw_unit_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct fw_unit *unit = fw_unit(dev);
> +       const struct fw_unit *unit = fw_unit(dev);
>         char modalias[64];
>
>         get_modalias(unit, modalias, sizeof(modalias));
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b4edf10e8fd0..fb16e33e52c6 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -136,9 +136,9 @@ static int i2c_device_match(struct device *dev, struct device_driver *drv)
>         return 0;
>  }
>
> -static int i2c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int i2c_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct i2c_client *client = to_i2c_client(dev);
> +       const struct i2c_client *client = to_i2c_client(dev);
>         int rc;
>
>         rc = of_device_uevent_modalias(dev, env);
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index e92d3e9a52bd..05f8ab762e34 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>   *
>   * Retrieve I3C dev info.
>   */
> -void i3c_device_get_info(struct i3c_device *dev,
> +void i3c_device_get_info(const struct i3c_device *dev,
>                          struct i3c_device_info *info)
>  {
>         if (!info)
> @@ -194,7 +194,7 @@ EXPORT_SYMBOL_GPL(i3cdev_to_dev);
>   *
>   * Return: a pointer to an I3C device object.
>   */
> -struct i3c_device *dev_to_i3cdev(struct device *dev)
> +struct i3c_device *dev_to_i3cdev(const struct device *dev)
>  {
>         return container_of(dev, struct i3c_device, dev);
>  }
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 351c81a929a6..bf1a2b2f34c4 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -273,9 +273,9 @@ static struct attribute *i3c_device_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(i3c_device);
>
> -static int i3c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> +       const struct i3c_device *i3cdev = dev_to_i3cdev(dev);
>         struct i3c_device_info devinfo;
>         u16 manuf, part, ext;
>
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 50597165dc54..a612afffa196 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -1371,7 +1371,7 @@ INPUT_DEV_STRING_ATTR_SHOW(phys);
>  INPUT_DEV_STRING_ATTR_SHOW(uniq);
>
>  static int input_print_modalias_bits(char *buf, int size,
> -                                    char name, unsigned long *bm,
> +                                    char name, const unsigned long *bm,
>                                      unsigned int min_bit, unsigned int max_bit)
>  {
>         int len = 0, i;
> @@ -1383,7 +1383,7 @@ static int input_print_modalias_bits(char *buf, int size,
>         return len;
>  }
>
> -static int input_print_modalias(char *buf, int size, struct input_dev *id,
> +static int input_print_modalias(char *buf, int size, const struct input_dev *id,
>                                 int add_cr)
>  {
>         int len;
> @@ -1431,7 +1431,7 @@ static ssize_t input_dev_show_modalias(struct device *dev,
>  }
>  static DEVICE_ATTR(modalias, S_IRUGO, input_dev_show_modalias, NULL);
>
> -static int input_print_bitmap(char *buf, int buf_size, unsigned long *bitmap,
> +static int input_print_bitmap(char *buf, int buf_size, const unsigned long *bitmap,
>                               int max, int add_cr);
>
>  static ssize_t input_dev_show_properties(struct device *dev,
> @@ -1523,7 +1523,7 @@ static const struct attribute_group input_dev_id_attr_group = {
>         .attrs  = input_dev_id_attrs,
>  };
>
> -static int input_print_bitmap(char *buf, int buf_size, unsigned long *bitmap,
> +static int input_print_bitmap(char *buf, int buf_size, const unsigned long *bitmap,
>                               int max, int add_cr)
>  {
>         int i;
> @@ -1620,7 +1620,7 @@ static void input_dev_release(struct device *device)
>   * device bitfields.
>   */
>  static int input_add_uevent_bm_var(struct kobj_uevent_env *env,
> -                                  const char *name, unsigned long *bitmap, int max)
> +                                  const char *name, const unsigned long *bitmap, int max)
>  {
>         int len;
>
> @@ -1638,7 +1638,7 @@ static int input_add_uevent_bm_var(struct kobj_uevent_env *env,
>  }
>
>  static int input_add_uevent_modalias_var(struct kobj_uevent_env *env,
> -                                        struct input_dev *dev)
> +                                        const struct input_dev *dev)
>  {
>         int len;
>
> @@ -1676,9 +1676,9 @@ static int input_add_uevent_modalias_var(struct kobj_uevent_env *env,
>                         return err;                                     \
>         } while (0)
>
> -static int input_dev_uevent(struct device *device, struct kobj_uevent_env *env)
> +static int input_dev_uevent(const struct device *device, struct kobj_uevent_env *env)
>  {
> -       struct input_dev *dev = to_input_dev(device);
> +       const struct input_dev *dev = to_input_dev(device);
>
>         INPUT_ADD_HOTPLUG_VAR("PRODUCT=%x/%x/%x/%x",
>                                 dev->id.bustype, dev->id.vendor,
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 527d9324742b..6bdad6341844 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -1614,7 +1614,7 @@ static void rc_dev_release(struct device *device)
>         kfree(dev);
>  }
>
> -static int rc_dev_uevent(struct device *device, struct kobj_uevent_env *env)
> +static int rc_dev_uevent(const struct device *device, struct kobj_uevent_env *env)
>  {
>         struct rc_dev *dev = to_rc_dev(device);
>         int ret = 0;
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c674a13c3055..dda51b7ce597 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -248,7 +248,7 @@ const void *of_device_get_match_data(const struct device *dev)
>  }
>  EXPORT_SYMBOL(of_device_get_match_data);
>
> -static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
> +static ssize_t of_device_get_modalias(const struct device *dev, char *str, ssize_t len)
>  {
>         const char *compat;
>         char *c;
> @@ -372,7 +372,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>         mutex_unlock(&of_mutex);
>  }
>
> -int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
> +int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
>         int sl;
>
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
> -       struct ssam_device *sdev = to_ssam_device(dev);
> +       const struct ssam_device *sdev = to_ssam_device(dev);
>
>         return add_uevent_var(env, "MODALIAS=ssam:d%02Xc%02Xt%02Xi%02Xf%02X",
>                               sdev->uid.domain, sdev->uid.category,
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 04b3529f8929..26c9a0a85d49 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -58,9 +58,9 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>                         slave->id.sdw_version, slave->id.class_id);
>  }
>
> -int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env)
> +int sdw_slave_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +       const struct sdw_slave *slave = dev_to_sdw_dev(dev);
>         char modalias[32];
>
>         sdw_slave_modalias(slave, modalias, sizeof(modalias));
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 60da5c23ccaf..2f4ef156b210 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -2175,9 +2175,9 @@ static void tb_switch_release(struct device *dev)
>         kfree(sw);
>  }
>
> -static int tb_switch_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int tb_switch_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct tb_switch *sw = tb_to_switch(dev);
> +       const struct tb_switch *sw = tb_to_switch(dev);
>         const char *type;
>
>         if (sw->config.thunderbolt_version == USB4_VERSION_1_0) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index f9786976f5ec..909da0a98134 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -815,7 +815,7 @@ static inline bool tb_is_switch(const struct device *dev)
>         return dev->type == &tb_switch_type;
>  }
>
> -static inline struct tb_switch *tb_to_switch(struct device *dev)
> +static inline struct tb_switch *tb_to_switch(const struct device *dev)
>  {
>         if (tb_is_switch(dev))
>                 return container_of(dev, struct tb_switch, dev);
> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index f00b2f62d8e3..aeb40a384bea 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -881,7 +881,7 @@ static ssize_t key_show(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RO(key);
>
> -static int get_modalias(struct tb_service *svc, char *buf, size_t size)
> +static int get_modalias(const struct tb_service *svc, char *buf, size_t size)
>  {
>         return snprintf(buf, size, "tbsvc:k%sp%08Xv%08Xr%08X", svc->key,
>                         svc->prtcid, svc->prtcvers, svc->prtcrevs);
> @@ -953,9 +953,9 @@ static const struct attribute_group *tb_service_attr_groups[] = {
>         NULL,
>  };
>
> -static int tb_service_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int tb_service_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct tb_service *svc = container_of(dev, struct tb_service, dev);
> +       const struct tb_service *svc = container_of(dev, struct tb_service, dev);
>         char modalias[64];
>
>         get_modalias(svc, modalias, sizeof(modalias));
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
>         int rc;
>
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 4d59d927ae3e..c397574a6570 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1818,11 +1818,11 @@ void usb_authorize_interface(struct usb_interface *intf)
>         }
>  }
>
> -static int usb_if_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_if_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct usb_device *usb_dev;
> -       struct usb_interface *intf;
> -       struct usb_host_interface *alt;
> +       const struct usb_device *usb_dev;
> +       const struct usb_interface *intf;
> +       const struct usb_host_interface *alt;
>
>         intf = to_usb_interface(dev);
>         usb_dev = interface_to_usbdev(intf);
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 11b15d7b357a..8527c06b65e6 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -423,9 +423,9 @@ static void usb_release_dev(struct device *dev)
>         kfree(udev);
>  }
>
> -static int usb_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_dev_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct usb_device *usb_dev;
> +       const struct usb_device *usb_dev;
>
>         usb_dev = to_usb_device(dev);
>
> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 1b24492bb4e5..4b468bde19cf 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -80,7 +80,7 @@ static struct usb_phy *__of_usb_find_phy(struct device_node *node)
>         return ERR_PTR(-EPROBE_DEFER);
>  }
>
> -static struct usb_phy *__device_to_usb_phy(struct device *dev)
> +static struct usb_phy *__device_to_usb_phy(const struct device *dev)
>  {
>         struct usb_phy *usb_phy;
>
> @@ -145,9 +145,9 @@ static void usb_phy_notify_charger_work(struct work_struct *work)
>         kobject_uevent(&usb_phy->dev->kobj, KOBJ_CHANGE);
>  }
>
> -static int usb_phy_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_phy_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -       struct usb_phy *usb_phy;
> +       const struct usb_phy *usb_phy;
>         char uchger_state[50] = { 0 };
>         char uchger_type[50] = { 0 };
>         unsigned long flags;
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index a3575a5a18ce..3708fb70b693 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -271,8 +271,7 @@ static const struct attribute_group *usb_role_switch_groups[] = {
>         NULL,
>  };
>
> -static int
> -usb_role_switch_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int usb_role_switch_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
>         int ret;
>
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index bd5e5dd70431..8e2b2077f262 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1718,7 +1718,7 @@ static const struct attribute_group *typec_groups[] = {
>         NULL
>  };
>
> -static int typec_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  {
>         int ret;
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 3015235d65e3..fc956c3f8324 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -722,7 +722,7 @@ const struct acpi_device_id *acpi_match_device(const struct acpi_device_id *ids,
>  const void *acpi_device_get_match_data(const struct device *dev);
>  extern bool acpi_driver_match_device(struct device *dev,
>                                      const struct device_driver *drv);
> -int acpi_device_uevent_modalias(struct device *, struct kobj_uevent_env *);
> +int acpi_device_uevent_modalias(const struct device *, struct kobj_uevent_env *);
>  int acpi_device_modalias(struct device *, char *, int);
>
>  struct platform_device *acpi_create_platform_device(struct acpi_device *,
> @@ -957,7 +957,7 @@ static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
>         return NULL;
>  }
>
> -static inline int acpi_device_uevent_modalias(struct device *dev,
> +static inline int acpi_device_uevent_modalias(const struct device *dev,
>                                 struct kobj_uevent_env *env)
>  {
>         return -ENODEV;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 84ae52de6746..46093bae6905 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -88,7 +88,7 @@ int subsys_virtual_register(struct bus_type *subsys,
>  struct device_type {
>         const char *name;
>         const struct attribute_group **groups;
> -       int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
> +       int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
>         char *(*devnode)(struct device *dev, umode_t *mode,
>                          kuid_t *uid, kgid_t *gid);
>         void (*release)(struct device *dev);
> diff --git a/include/linux/firewire.h b/include/linux/firewire.h
> index 980019053e54..4c882d57df02 100644
> --- a/include/linux/firewire.h
> +++ b/include/linux/firewire.h
> @@ -208,7 +208,7 @@ struct fw_device {
>         struct fw_attribute_group attribute_group;
>  };
>
> -static inline struct fw_device *fw_device(struct device *dev)
> +static inline struct fw_device *fw_device(const struct device *dev)
>  {
>         return container_of(dev, struct fw_device, device);
>  }
> @@ -229,7 +229,7 @@ struct fw_unit {
>         struct fw_attribute_group attribute_group;
>  };
>
> -static inline struct fw_unit *fw_unit(struct device *dev)
> +static inline struct fw_unit *fw_unit(const struct device *dev)
>  {
>         return container_of(dev, struct fw_unit, device);
>  }
> @@ -246,7 +246,7 @@ static inline void fw_unit_put(struct fw_unit *unit)
>         put_device(&unit->device);
>  }
>
> -static inline struct fw_device *fw_parent_device(struct fw_unit *unit)
> +static inline struct fw_device *fw_parent_device(const struct fw_unit *unit)
>  {
>         return fw_device(unit->device.parent);
>  }
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 8242e13e7b0b..cda61c1d6d60 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -186,7 +186,7 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
>  }
>
>  struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
> -struct i3c_device *dev_to_i3cdev(struct device *dev);
> +struct i3c_device *dev_to_i3cdev(const struct device *dev);
>
>  const struct i3c_device_id *
>  i3c_device_match_id(struct i3c_device *i3cdev,
> @@ -293,7 +293,7 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>                              struct i3c_priv_xfer *xfers,
>                              int nxfers);
>
> -void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
> +void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>
>  struct i3c_ibi_payload {
>         unsigned int len;
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index ab7d557d541d..f4b57614979d 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -36,7 +36,7 @@ extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
>  extern int of_device_request_module(struct device *dev);
>
>  extern void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env);
> -extern int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env);
> +extern int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env);
>
>  static inline struct device_node *of_cpu_device_node_get(int cpu)
>  {
> @@ -83,7 +83,7 @@ static inline int of_device_request_module(struct device *dev)
>         return -ENODEV;
>  }
>
> -static inline int of_device_uevent_modalias(struct device *dev,
> +static inline int of_device_uevent_modalias(const struct device *dev,
>                                    struct kobj_uevent_env *env)
>  {
>         return -ENODEV;
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
> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> index 46c45d1b6368..a5dff729edb7 100644
> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -229,7 +229,7 @@ static inline bool is_ssam_device(struct device *d)
>   * Return: Returns a pointer to the &struct ssam_device wrapping the given
>   * device @d.
>   */
> -static inline struct ssam_device *to_ssam_device(struct device *d)
> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>  {
>         return container_of(d, struct ssam_device, dev);
>  }
> --
> 2.38.1
>
