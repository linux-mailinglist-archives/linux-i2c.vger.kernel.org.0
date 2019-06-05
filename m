Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2CA536139
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 18:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbfFEQ0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 12:26:54 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57965 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfFEQ0y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 12:26:54 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 19F8C1C0004;
        Wed,  5 Jun 2019 16:26:37 +0000 (UTC)
Date:   Wed, 5 Jun 2019 18:26:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, gwendal@chromium.org,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, kernel@collabora.com,
        dtor@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        alsa-devel@alsa-project.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-iio@vger.kernel.org,
        Fabien Lahoudere <fabien.lahoudere@collabora.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        Brian Norris <briannorris@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Sebastian Reichel <sre@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        linux-input@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-pm@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Evan Green <evgreen@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 06/10] mfd / platform: cros_ec: Reorganize platform and
 mfd includes
Message-ID: <20190605162636.GE3558@piout.net>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/06/2019 17:20:15+0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or
> we have a linux/mfd/cros_ec_commands.h file that is non related to the
> multifunction device (in the sense that is not exporting any function of
> the mfd device). This causes crossed includes between mfd and
> platform/chrome subsystems and makes the code difficult to read, apart
> from creating 'curious' situations where a platform/chrome driver includes
> a linux/mfd/cros_ec.h file just to get the exported functions that are
> implemented in another platform/chrome driver.
> 
> In order to have a better separation on what the cros-ec multifunction
> driver does and what the cros-ec core provides move and rework the
> affected includes doing:
> 
>  - Move cros_ec_commands.h to include/linux/platform_data/cros_ec_commands.h
>  - Get rid of the parts that are implemented in the platform/chrome/cros_ec_proto.c
>    driver from include/linux/mfd/cros_ec.h to a new file
>    include/linux/platform_data/cros_ec_proto.h
>  - Update all the drivers with the new includes, so
>    - Drivers that only need to know about the protocol include
>      - linux/platform_data/cros_ec_proto.h
>      - linux/platform_data/cros_ec_commands.h
>    - Drivers that need to know about the cros-ec mfd device also include
>      - linux/mfd/cros_ec.h
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
>  drivers/extcon/extcon-usbc-cros-ec.c          |   3 +-
>  drivers/hid/hid-google-hammer.c               |   4 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c       |   4 +-
>  drivers/iio/accel/cros_ec_accel_legacy.c      |   3 +-
>  .../common/cros_ec_sensors/cros_ec_sensors.c  |   3 +-
>  .../cros_ec_sensors/cros_ec_sensors_core.c    |   3 +-
>  drivers/iio/light/cros_ec_light_prox.c        |   3 +-
>  drivers/iio/pressure/cros_ec_baro.c           |   3 +-
>  drivers/input/keyboard/cros_ec_keyb.c         |   4 +-
>  .../media/platform/cros-ec-cec/cros-ec-cec.c  |   4 +-
>  drivers/mfd/cros_ec_dev.c                     |   3 +-
>  drivers/platform/chrome/cros_ec.c             |   3 +-
>  drivers/platform/chrome/cros_ec_chardev.c     |   4 +-
>  drivers/platform/chrome/cros_ec_debugfs.c     |   3 +-
>  drivers/platform/chrome/cros_ec_i2c.c         |   4 +-
>  drivers/platform/chrome/cros_ec_lightbar.c    |   3 +-
>  drivers/platform/chrome/cros_ec_lpc.c         |   4 +-
>  drivers/platform/chrome/cros_ec_lpc_reg.c     |   4 +-
>  drivers/platform/chrome/cros_ec_proto.c       |   3 +-
>  drivers/platform/chrome/cros_ec_rpmsg.c       |   4 +-
>  drivers/platform/chrome/cros_ec_spi.c         |   4 +-
>  drivers/platform/chrome/cros_ec_sysfs.c       |   3 +-
>  drivers/platform/chrome/cros_ec_trace.c       |   2 +-
>  drivers/platform/chrome/cros_ec_trace.h       |   4 +-
>  drivers/platform/chrome/cros_ec_vbc.c         |   3 +-
>  drivers/platform/chrome/cros_usbpd_logger.c   |   5 +-
>  drivers/power/supply/cros_usbpd-charger.c     |   5 +-
>  drivers/pwm/pwm-cros-ec.c                     |   4 +-
>  drivers/rtc/rtc-cros-ec.c                     |   3 +-
>  .../linux/iio/common/cros_ec_sensors_core.h   |   3 +-
>  include/linux/mfd/cros_ec.h                   | 306 -----------------
>  .../{mfd => platform_data}/cros_ec_commands.h |   0
>  include/linux/platform_data/cros_ec_proto.h   | 315 ++++++++++++++++++
>  sound/soc/codecs/cros_ec_codec.c              |   4 +-
>  34 files changed, 379 insertions(+), 351 deletions(-)
>  rename include/linux/{mfd => platform_data}/cros_ec_commands.h (100%)
>  create mode 100644 include/linux/platform_data/cros_ec_proto.h
> 
> diff --git a/drivers/extcon/extcon-usbc-cros-ec.c b/drivers/extcon/extcon-usbc-cros-ec.c
> index 43c0a936ab82..5290cc2d19d9 100644
> --- a/drivers/extcon/extcon-usbc-cros-ec.c
> +++ b/drivers/extcon/extcon-usbc-cros-ec.c
> @@ -6,10 +6,11 @@
>  
>  #include <linux/extcon-provider.h>
>  #include <linux/kernel.h>
> -#include <linux/mfd/cros_ec.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index ee5e0bdcf078..84f8c127ebdc 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -16,9 +16,9 @@
>  #include <linux/acpi.h>
>  #include <linux/hid.h>
>  #include <linux/leds.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_wakeup.h>
>  #include <asm/unaligned.h>
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index 82bcd9a78759..c551aa96a2e3 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -5,8 +5,8 @@
>  
>  #include <linux/module.h>
>  #include <linux/i2c.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> diff --git a/drivers/iio/accel/cros_ec_accel_legacy.c b/drivers/iio/accel/cros_ec_accel_legacy.c
> index 46bb2e421bb9..fd9a634f741e 100644
> --- a/drivers/iio/accel/cros_ec_accel_legacy.c
> +++ b/drivers/iio/accel/cros_ec_accel_legacy.c
> @@ -18,9 +18,10 @@
>  #include <linux/iio/triggered_buffer.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  
>  #define DRV_NAME	"cros-ec-accel-legacy"
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
> index 17af4e0fd5f8..40dc24ff0ee5 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
> @@ -17,8 +17,9 @@
>  #include <linux/iio/triggered_buffer.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index 719a0df5aeeb..fd63315399ac 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -14,9 +14,10 @@
>  #include <linux/iio/trigger_consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  
>  static char *cros_ec_loc[] = {
> diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
> index 308ee6ff2e22..437e0eae9178 100644
> --- a/drivers/iio/light/cros_ec_light_prox.c
> +++ b/drivers/iio/light/cros_ec_light_prox.c
> @@ -15,8 +15,9 @@
>  #include <linux/iio/trigger_consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
> index 034ce98d6e97..956dc01f1295 100644
> --- a/drivers/iio/pressure/cros_ec_baro.c
> +++ b/drivers/iio/pressure/cros_ec_baro.c
> @@ -15,9 +15,10 @@
>  #include <linux/iio/trigger_consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  
>  /*
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index d56001181598..2b71c5a51f90 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -22,8 +22,8 @@
>  #include <linux/slab.h>
>  #include <linux/sysrq.h>
>  #include <linux/input/matrix_keypad.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  
>  #include <asm/unaligned.h>
>  
> diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> index 068df9888dbf..2e4e263a4a94 100644
> --- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> +++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> @@ -16,8 +16,8 @@
>  #include <linux/interrupt.h>
>  #include <media/cec.h>
>  #include <media/cec-notifier.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  
>  #define DRV_NAME	"cros-ec-cec"
>  
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index c7a5dfa36874..5481df4e1216 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -7,11 +7,12 @@
>  
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/slab.h>
>  
>  #define DRV_NAME "cros-ec-dev"
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 11fced7917fc..9800597ccd96 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -21,7 +21,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> -#include <linux/mfd/cros_ec.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/suspend.h>
>  #include <asm/unaligned.h>
>  
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
> index 1a0a27080026..786b941a60df 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -9,10 +9,10 @@
>  #include <linux/device.h>
>  #include <linux/fs.h>
>  #include <linux/list.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
> index 4c2a27f6a6d0..b088d91be9c9 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -8,9 +8,10 @@
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/poll.h>
>  #include <linux/sched.h>
> diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
> index 6bb82dfa7dae..9bd97bc8454b 100644
> --- a/drivers/platform/chrome/cros_ec_i2c.c
> +++ b/drivers/platform/chrome/cros_ec_i2c.c
> @@ -9,8 +9,8 @@
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
> index d30a6650b0b5..caa26da2c788 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -9,8 +9,9 @@
>  #include <linux/fs.h>
>  #include <linux/kobject.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/sched.h>
>  #include <linux/types.h>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 2c7e654cf89c..0c976e95998a 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -16,9 +16,9 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/interrupt.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
>  #include <linux/suspend.h>
> diff --git a/drivers/platform/chrome/cros_ec_lpc_reg.c b/drivers/platform/chrome/cros_ec_lpc_reg.c
> index 0f5cd0ac8b49..dec9a779e209 100644
> --- a/drivers/platform/chrome/cros_ec_lpc_reg.c
> +++ b/drivers/platform/chrome/cros_ec_lpc_reg.c
> @@ -4,8 +4,8 @@
>  // Copyright (C) 2016 Google, Inc
>  
>  #include <linux/io.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  
>  #include "cros_ec_lpc_mec.h"
>  
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 3d2325197a68..f659f96bda12 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -3,10 +3,11 @@
>  //
>  // Copyright (C) 2015 Google, Inc
>  
> -#include <linux/mfd/cros_ec.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/slab.h>
>  #include <asm/unaligned.h>
>  
> diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
> index 520e507bfa54..9633e5417686 100644
> --- a/drivers/platform/chrome/cros_ec_rpmsg.c
> +++ b/drivers/platform/chrome/cros_ec_rpmsg.c
> @@ -6,9 +6,9 @@
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/rpmsg.h>
>  #include <linux/slab.h>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 2e21f2776063..9006e1872942 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -6,9 +6,9 @@
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
> index fe0b7614ae1b..0caeb8d0989d 100644
> --- a/drivers/platform/chrome/cros_ec_sysfs.c
> +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> @@ -9,8 +9,9 @@
>  #include <linux/fs.h>
>  #include <linux/kobject.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
>  #include <linux/slab.h>
> diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
> index 0a76412095a9..6f80ff4532ae 100644
> --- a/drivers/platform/chrome/cros_ec_trace.c
> +++ b/drivers/platform/chrome/cros_ec_trace.c
> @@ -6,7 +6,7 @@
>  #define TRACE_SYMBOL(a) {a, #a}
>  
>  // Generate the list using the following script:
> -// sed -n 's/^#define \(EC_CMD_[[:alnum:]_]*\)\s.*/\tTRACE_SYMBOL(\1), \\/p' include/linux/mfd/cros_ec_commands.h
> +// sed -n 's/^#define \(EC_CMD_[[:alnum:]_]*\)\s.*/\tTRACE_SYMBOL(\1), \\/p' include/linux/platform_data/cros_ec_commands.h
>  #define EC_CMDS \
>  	TRACE_SYMBOL(EC_CMD_PROTO_VERSION), \
>  	TRACE_SYMBOL(EC_CMD_HELLO), \
> diff --git a/drivers/platform/chrome/cros_ec_trace.h b/drivers/platform/chrome/cros_ec_trace.h
> index 7ae3b89c78b9..0dd4df30fa89 100644
> --- a/drivers/platform/chrome/cros_ec_trace.h
> +++ b/drivers/platform/chrome/cros_ec_trace.h
> @@ -11,8 +11,10 @@
>  #if !defined(_CROS_EC_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
>  #define _CROS_EC_TRACE_H_
>  
> +#include <linux/bits.h>
>  #include <linux/types.h>
> -#include <linux/mfd/cros_ec.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  
>  #include <linux/tracepoint.h>
>  
> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chrome/cros_ec_vbc.c
> index 8392a1ec33a7..cffe119e7a7a 100644
> --- a/drivers/platform/chrome/cros_ec_vbc.c
> +++ b/drivers/platform/chrome/cros_ec_vbc.c
> @@ -7,8 +7,9 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/slab.h>
>  
>  #define DRV_NAME "cros-ec-vbc"
> diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
> index 7c7b267626a0..c549a9b49b56 100644
> --- a/drivers/platform/chrome/cros_usbpd_logger.c
> +++ b/drivers/platform/chrome/cros_usbpd_logger.c
> @@ -6,10 +6,11 @@
>   */
>  
>  #include <linux/ktime.h>
> -#include <linux/math64.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/rtc.h>
>  
> diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
> index 3a9ea94c3de3..6cc7c3910e09 100644
> --- a/drivers/power/supply/cros_usbpd-charger.c
> +++ b/drivers/power/supply/cros_usbpd-charger.c
> @@ -5,9 +5,10 @@
>   * Copyright (c) 2014 - 2018 Google, Inc
>   */
>  
> -#include <linux/module.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
>  #include <linux/slab.h>
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 98f6ac6cf6ab..85bea2d40b7d 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -6,8 +6,8 @@
>   */
>  
>  #include <linux/module.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwm.h>
>  #include <linux/slab.h>
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index 4d6bf9304ceb..6909e01936d9 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -6,8 +6,9 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/rtc.h>
>  #include <linux/slab.h>
> diff --git a/include/linux/iio/common/cros_ec_sensors_core.h b/include/linux/iio/common/cros_ec_sensors_core.h
> index ce16445411ac..8a91669f5bed 100644
> --- a/include/linux/iio/common/cros_ec_sensors_core.h
> +++ b/include/linux/iio/common/cros_ec_sensors_core.h
> @@ -18,7 +18,8 @@
>  
>  #include <linux/iio/iio.h>
>  #include <linux/irqreturn.h>
> -#include <linux/mfd/cros_ec.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  
>  enum {
>  	CROS_EC_SENSOR_X,
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
> index 2a1372d167b9..e0bae49535e1 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -16,184 +16,7 @@
>  #ifndef __LINUX_MFD_CROS_EC_H
>  #define __LINUX_MFD_CROS_EC_H
>  
> -#include <linux/cdev.h>
>  #include <linux/device.h>
> -#include <linux/notifier.h>
> -#include <linux/mfd/cros_ec_commands.h>
> -#include <linux/mutex.h>
> -
> -#define CROS_EC_DEV_NAME "cros_ec"
> -#define CROS_EC_DEV_FP_NAME "cros_fp"
> -#define CROS_EC_DEV_PD_NAME "cros_pd"
> -#define CROS_EC_DEV_TP_NAME "cros_tp"
> -#define CROS_EC_DEV_ISH_NAME "cros_ish"
> -
> -/*
> - * The EC is unresponsive for a time after a reboot command.  Add a
> - * simple delay to make sure that the bus stays locked.
> - */
> -#define EC_REBOOT_DELAY_MS             50
> -
> -/*
> - * Max bus-specific overhead incurred by request/responses.
> - * I2C requires 1 additional byte for requests.
> - * I2C requires 2 additional bytes for responses.
> - * SPI requires up to 32 additional bytes for responses.
> - */
> -#define EC_PROTO_VERSION_UNKNOWN	0
> -#define EC_MAX_REQUEST_OVERHEAD		1
> -#define EC_MAX_RESPONSE_OVERHEAD	32
> -
> -/*
> - * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
> - */
> -enum {
> -	EC_MSG_TX_HEADER_BYTES	= 3,
> -	EC_MSG_TX_TRAILER_BYTES	= 1,
> -	EC_MSG_TX_PROTO_BYTES	= EC_MSG_TX_HEADER_BYTES +
> -					EC_MSG_TX_TRAILER_BYTES,
> -	EC_MSG_RX_PROTO_BYTES	= 3,
> -
> -	/* Max length of messages for proto 2*/
> -	EC_PROTO2_MSG_BYTES		= EC_PROTO2_MAX_PARAM_SIZE +
> -					EC_MSG_TX_PROTO_BYTES,
> -
> -	EC_MAX_MSG_BYTES		= 64 * 1024,
> -};
> -
> -/**
> - * struct cros_ec_command - Information about a ChromeOS EC command.
> - * @version: Command version number (often 0).
> - * @command: Command to send (EC_CMD_...).
> - * @outsize: Outgoing length in bytes.
> - * @insize: Max number of bytes to accept from the EC.
> - * @result: EC's response to the command (separate from communication failure).
> - * @data: Where to put the incoming data from EC and outgoing data to EC.
> - */
> -struct cros_ec_command {
> -	uint32_t version;
> -	uint32_t command;
> -	uint32_t outsize;
> -	uint32_t insize;
> -	uint32_t result;
> -	uint8_t data[0];
> -};
> -
> -/**
> - * struct cros_ec_device - Information about a ChromeOS EC device.
> - * @phys_name: Name of physical comms layer (e.g. 'i2c-4').
> - * @dev: Device pointer for physical comms device
> - * @was_wake_device: True if this device was set to wake the system from
> - *                   sleep at the last suspend.
> - * @cros_class: The class structure for this device.
> - * @cmd_readmem: Direct read of the EC memory-mapped region, if supported.
> - *     @offset: Is within EC_LPC_ADDR_MEMMAP region.
> - *     @bytes: Number of bytes to read. zero means "read a string" (including
> - *             the trailing '\0'). At most only EC_MEMMAP_SIZE bytes can be
> - *             read. Caller must ensure that the buffer is large enough for the
> - *             result when reading a string.
> - * @max_request: Max size of message requested.
> - * @max_response: Max size of message response.
> - * @max_passthru: Max sice of passthru message.
> - * @proto_version: The protocol version used for this device.
> - * @priv: Private data.
> - * @irq: Interrupt to use.
> - * @id: Device id.
> - * @din: Input buffer (for data from EC). This buffer will always be
> - *       dword-aligned and include enough space for up to 7 word-alignment
> - *       bytes also, so we can ensure that the body of the message is always
> - *       dword-aligned (64-bit). We use this alignment to keep ARM and x86
> - *       happy. Probably word alignment would be OK, there might be a small
> - *       performance advantage to using dword.
> - * @dout: Output buffer (for data to EC). This buffer will always be
> - *        dword-aligned and include enough space for up to 7 word-alignment
> - *        bytes also, so we can ensure that the body of the message is always
> - *        dword-aligned (64-bit). We use this alignment to keep ARM and x86
> - *        happy. Probably word alignment would be OK, there might be a small
> - *        performance advantage to using dword.
> - * @din_size: Size of din buffer to allocate (zero to use static din).
> - * @dout_size: Size of dout buffer to allocate (zero to use static dout).
> - * @wake_enabled: True if this device can wake the system from sleep.
> - * @suspended: True if this device had been suspended.
> - * @cmd_xfer: Send command to EC and get response.
> - *            Returns the number of bytes received if the communication
> - *            succeeded, but that doesn't mean the EC was happy with the
> - *            command. The caller should check msg.result for the EC's result
> - *            code.
> - * @pkt_xfer: Send packet to EC and get response.
> - * @lock: One transaction at a time.
> - * @mkbp_event_supported: True if this EC supports the MKBP event protocol.
> - * @host_sleep_v1: True if this EC supports the sleep v1 command.
> - * @event_notifier: Interrupt event notifier for transport devices.
> - * @event_data: Raw payload transferred with the MKBP event.
> - * @event_size: Size in bytes of the event data.
> - * @host_event_wake_mask: Mask of host events that cause wake from suspend.
> - * @ec: The platform_device used by the mfd driver to interface with the
> - *      main EC.
> - * @pd: The platform_device used by the mfd driver to interface with the
> - *      PD behind an EC.
> - */
> -struct cros_ec_device {
> -	/* These are used by other drivers that want to talk to the EC */
> -	const char *phys_name;
> -	struct device *dev;
> -	bool was_wake_device;
> -	struct class *cros_class;
> -	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
> -			   unsigned int bytes, void *dest);
> -
> -	/* These are used to implement the platform-specific interface */
> -	u16 max_request;
> -	u16 max_response;
> -	u16 max_passthru;
> -	u16 proto_version;
> -	void *priv;
> -	int irq;
> -	u8 *din;
> -	u8 *dout;
> -	int din_size;
> -	int dout_size;
> -	bool wake_enabled;
> -	bool suspended;
> -	int (*cmd_xfer)(struct cros_ec_device *ec,
> -			struct cros_ec_command *msg);
> -	int (*pkt_xfer)(struct cros_ec_device *ec,
> -			struct cros_ec_command *msg);
> -	struct mutex lock;
> -	bool mkbp_event_supported;
> -	bool host_sleep_v1;
> -	struct blocking_notifier_head event_notifier;
> -
> -	struct ec_response_get_next_event_v1 event_data;
> -	int event_size;
> -	u32 host_event_wake_mask;
> -
> -	/* The platform devices used by the mfd driver */
> -	struct platform_device *ec;
> -	struct platform_device *pd;
> -};
> -
> -/**
> - * struct cros_ec_sensor_platform - ChromeOS EC sensor platform information.
> - * @sensor_num: Id of the sensor, as reported by the EC.
> - */
> -struct cros_ec_sensor_platform {
> -	u8 sensor_num;
> -};
> -
> -/**
> - * struct cros_ec_platform - ChromeOS EC platform information.
> - * @ec_name: Name of EC device (e.g. 'cros-ec', 'cros-pd', ...)
> - *           used in /dev/ and sysfs.
> - * @cmd_offset: Offset to apply for each command. Set when
> - *              registering a device behind another one.
> - */
> -struct cros_ec_platform {
> -	const char *ec_name;
> -	u16 cmd_offset;
> -};
> -
> -struct cros_ec_debugfs;
>  
>  /**
>   * struct cros_ec_dev - ChromeOS EC device entry point.
> @@ -217,133 +40,4 @@ struct cros_ec_dev {
>  
>  #define to_cros_ec_dev(dev)  container_of(dev, struct cros_ec_dev, class_dev)
>  
> -/**
> - * cros_ec_suspend() - Handle a suspend operation for the ChromeOS EC device.
> - * @ec_dev: Device to suspend.
> - *
> - * This can be called by drivers to handle a suspend event.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_suspend(struct cros_ec_device *ec_dev);
> -
> -/**
> - * cros_ec_resume() - Handle a resume operation for the ChromeOS EC device.
> - * @ec_dev: Device to resume.
> - *
> - * This can be called by drivers to handle a resume event.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_resume(struct cros_ec_device *ec_dev);
> -
> -/**
> - * cros_ec_prepare_tx() - Prepare an outgoing message in the output buffer.
> - * @ec_dev: Device to register.
> - * @msg: Message to write.
> - *
> - * This is intended to be used by all ChromeOS EC drivers, but at present
> - * only SPI uses it. Once LPC uses the same protocol it can start using it.
> - * I2C could use it now, with a refactor of the existing code.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
> -		       struct cros_ec_command *msg);
> -
> -/**
> - * cros_ec_check_result() - Check ec_msg->result.
> - * @ec_dev: EC device.
> - * @msg: Message to check.
> - *
> - * This is used by ChromeOS EC drivers to check the ec_msg->result for
> - * errors and to warn about them.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_check_result(struct cros_ec_device *ec_dev,
> -			 struct cros_ec_command *msg);
> -
> -/**
> - * cros_ec_cmd_xfer() - Send a command to the ChromeOS EC.
> - * @ec_dev: EC device.
> - * @msg: Message to write.
> - *
> - * Call this to send a command to the ChromeOS EC.  This should be used
> - * instead of calling the EC's cmd_xfer() callback directly.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
> -		     struct cros_ec_command *msg);
> -
> -/**
> - * cros_ec_cmd_xfer_status() - Send a command to the ChromeOS EC.
> - * @ec_dev: EC device.
> - * @msg: Message to write.
> - *
> - * This function is identical to cros_ec_cmd_xfer, except it returns success
> - * status only if both the command was transmitted successfully and the EC
> - * replied with success status. It's not necessary to check msg->result when
> - * using this function.
> - *
> - * Return: The number of bytes transferred on success or negative error code.
> - */
> -int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
> -			    struct cros_ec_command *msg);
> -
> -/**
> - * cros_ec_register() - Register a new ChromeOS EC, using the provided info.
> - * @ec_dev: Device to register.
> - *
> - * Before calling this, allocate a pointer to a new device and then fill
> - * in all the fields up to the --private-- marker.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_register(struct cros_ec_device *ec_dev);
> -
> -/**
> - * cros_ec_unregister() - Remove a ChromeOS EC.
> - * @ec_dev: Device to unregister.
> - *
> - * Call this to deregister a ChromeOS EC, then clean up any private data.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_unregister(struct cros_ec_device *ec_dev);
> -
> -/**
> - * cros_ec_query_all() -  Query the protocol version supported by the
> - *         ChromeOS EC.
> - * @ec_dev: Device to register.
> - *
> - * Return: 0 on success or negative error code.
> - */
> -int cros_ec_query_all(struct cros_ec_device *ec_dev);
> -
> -/**
> - * cros_ec_get_next_event() - Fetch next event from the ChromeOS EC.
> - * @ec_dev: Device to fetch event from.
> - * @wake_event: Pointer to a bool set to true upon return if the event might be
> - *              treated as a wake event. Ignored if null.
> - *
> - * Return: negative error code on errors; 0 for no data; or else number of
> - * bytes received (i.e., an event was retrieved successfully). Event types are
> - * written out to @ec_dev->event_data.event_type on success.
> - */
> -int cros_ec_get_next_event(struct cros_ec_device *ec_dev, bool *wake_event);
> -
> -/**
> - * cros_ec_get_host_event() - Return a mask of event set by the ChromeOS EC.
> - * @ec_dev: Device to fetch event from.
> - *
> - * When MKBP is supported, when the EC raises an interrupt, we collect the
> - * events raised and call the functions in the ec notifier. This function
> - * is a helper to know which events are raised.
> - *
> - * Return: 0 on error or non-zero bitmask of one or more EC_HOST_EVENT_*.
> - */
> -u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev);
> -
>  #endif /* __LINUX_MFD_CROS_EC_H */
> diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> similarity index 100%
> rename from include/linux/mfd/cros_ec_commands.h
> rename to include/linux/platform_data/cros_ec_commands.h
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> new file mode 100644
> index 000000000000..34dd9e5c1779
> --- /dev/null
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -0,0 +1,315 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ChromeOS Embedded Controller protocol interface.
> + *
> + * Copyright (C) 2012 Google, Inc
> + */
> +
> +#ifndef __LINUX_CROS_EC_PROTO_H
> +#define __LINUX_CROS_EC_PROTO_H
> +
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +
> +#define CROS_EC_DEV_NAME	"cros_ec"
> +#define CROS_EC_DEV_FP_NAME	"cros_fp"
> +#define CROS_EC_DEV_ISH_NAME	"cros_ish"
> +#define CROS_EC_DEV_PD_NAME	"cros_pd"
> +#define CROS_EC_DEV_TP_NAME	"cros_tp"
> +
> +/*
> + * The EC is unresponsive for a time after a reboot command.  Add a
> + * simple delay to make sure that the bus stays locked.
> + */
> +#define EC_REBOOT_DELAY_MS		50
> +
> +/*
> + * Max bus-specific overhead incurred by request/responses.
> + * I2C requires 1 additional byte for requests.
> + * I2C requires 2 additional bytes for responses.
> + * SPI requires up to 32 additional bytes for responses.
> + */
> +#define EC_PROTO_VERSION_UNKNOWN	0
> +#define EC_MAX_REQUEST_OVERHEAD		1
> +#define EC_MAX_RESPONSE_OVERHEAD	32
> +
> +/*
> + * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
> + */
> +enum {
> +	EC_MSG_TX_HEADER_BYTES	= 3,
> +	EC_MSG_TX_TRAILER_BYTES	= 1,
> +	EC_MSG_TX_PROTO_BYTES	= EC_MSG_TX_HEADER_BYTES +
> +				  EC_MSG_TX_TRAILER_BYTES,
> +	EC_MSG_RX_PROTO_BYTES	= 3,
> +
> +	/* Max length of messages for proto 2*/
> +	EC_PROTO2_MSG_BYTES	= EC_PROTO2_MAX_PARAM_SIZE +
> +				  EC_MSG_TX_PROTO_BYTES,
> +
> +	EC_MAX_MSG_BYTES	= 64 * 1024,
> +};
> +
> +/**
> + * struct cros_ec_command - Information about a ChromeOS EC command.
> + * @version: Command version number (often 0).
> + * @command: Command to send (EC_CMD_...).
> + * @outsize: Outgoing length in bytes.
> + * @insize: Max number of bytes to accept from the EC.
> + * @result: EC's response to the command (separate from communication failure).
> + * @data: Where to put the incoming data from EC and outgoing data to EC.
> + */
> +struct cros_ec_command {
> +	uint32_t version;
> +	uint32_t command;
> +	uint32_t outsize;
> +	uint32_t insize;
> +	uint32_t result;
> +	uint8_t data[0];
> +};
> +
> +/**
> + * struct cros_ec_device - Information about a ChromeOS EC device.
> + * @phys_name: Name of physical comms layer (e.g. 'i2c-4').
> + * @dev: Device pointer for physical comms device
> + * @was_wake_device: True if this device was set to wake the system from
> + *                   sleep at the last suspend.
> + * @cros_class: The class structure for this device.
> + * @cmd_readmem: Direct read of the EC memory-mapped region, if supported.
> + *     @offset: Is within EC_LPC_ADDR_MEMMAP region.
> + *     @bytes: Number of bytes to read. zero means "read a string" (including
> + *             the trailing '\0'). At most only EC_MEMMAP_SIZE bytes can be
> + *             read. Caller must ensure that the buffer is large enough for the
> + *             result when reading a string.
> + * @max_request: Max size of message requested.
> + * @max_response: Max size of message response.
> + * @max_passthru: Max sice of passthru message.
> + * @proto_version: The protocol version used for this device.
> + * @priv: Private data.
> + * @irq: Interrupt to use.
> + * @id: Device id.
> + * @din: Input buffer (for data from EC). This buffer will always be
> + *       dword-aligned and include enough space for up to 7 word-alignment
> + *       bytes also, so we can ensure that the body of the message is always
> + *       dword-aligned (64-bit). We use this alignment to keep ARM and x86
> + *       happy. Probably word alignment would be OK, there might be a small
> + *       performance advantage to using dword.
> + * @dout: Output buffer (for data to EC). This buffer will always be
> + *        dword-aligned and include enough space for up to 7 word-alignment
> + *        bytes also, so we can ensure that the body of the message is always
> + *        dword-aligned (64-bit). We use this alignment to keep ARM and x86
> + *        happy. Probably word alignment would be OK, there might be a small
> + *        performance advantage to using dword.
> + * @din_size: Size of din buffer to allocate (zero to use static din).
> + * @dout_size: Size of dout buffer to allocate (zero to use static dout).
> + * @wake_enabled: True if this device can wake the system from sleep.
> + * @suspended: True if this device had been suspended.
> + * @cmd_xfer: Send command to EC and get response.
> + *            Returns the number of bytes received if the communication
> + *            succeeded, but that doesn't mean the EC was happy with the
> + *            command. The caller should check msg.result for the EC's result
> + *            code.
> + * @pkt_xfer: Send packet to EC and get response.
> + * @lock: One transaction at a time.
> + * @mkbp_event_supported: True if this EC supports the MKBP event protocol.
> + * @host_sleep_v1: True if this EC supports the sleep v1 command.
> + * @event_notifier: Interrupt event notifier for transport devices.
> + * @event_data: Raw payload transferred with the MKBP event.
> + * @event_size: Size in bytes of the event data.
> + * @host_event_wake_mask: Mask of host events that cause wake from suspend.
> + * @ec: The platform_device used by the mfd driver to interface with the
> + *      main EC.
> + * @pd: The platform_device used by the mfd driver to interface with the
> + *      PD behind an EC.
> + */
> +struct cros_ec_device {
> +	/* These are used by other drivers that want to talk to the EC */
> +	const char *phys_name;
> +	struct device *dev;
> +	bool was_wake_device;
> +	struct class *cros_class;
> +	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
> +			   unsigned int bytes, void *dest);
> +
> +	/* These are used to implement the platform-specific interface */
> +	u16 max_request;
> +	u16 max_response;
> +	u16 max_passthru;
> +	u16 proto_version;
> +	void *priv;
> +	int irq;
> +	u8 *din;
> +	u8 *dout;
> +	int din_size;
> +	int dout_size;
> +	bool wake_enabled;
> +	bool suspended;
> +	int (*cmd_xfer)(struct cros_ec_device *ec,
> +			struct cros_ec_command *msg);
> +	int (*pkt_xfer)(struct cros_ec_device *ec,
> +			struct cros_ec_command *msg);
> +	struct mutex lock;
> +	bool mkbp_event_supported;
> +	bool host_sleep_v1;
> +	struct blocking_notifier_head event_notifier;
> +
> +	struct ec_response_get_next_event_v1 event_data;
> +	int event_size;
> +	u32 host_event_wake_mask;
> +
> +	/* The platform devices used by the mfd driver */
> +	struct platform_device *ec;
> +	struct platform_device *pd;
> +};
> +
> +/**
> + * struct cros_ec_sensor_platform - ChromeOS EC sensor platform information.
> + * @sensor_num: Id of the sensor, as reported by the EC.
> + */
> +struct cros_ec_sensor_platform {
> +	u8 sensor_num;
> +};
> +
> +/**
> + * struct cros_ec_platform - ChromeOS EC platform information.
> + * @ec_name: Name of EC device (e.g. 'cros-ec', 'cros-pd', ...)
> + *           used in /dev/ and sysfs.
> + * @cmd_offset: Offset to apply for each command. Set when
> + *              registering a device behind another one.
> + */
> +struct cros_ec_platform {
> +	const char *ec_name;
> +	u16 cmd_offset;
> +};
> +
> +/**
> + * cros_ec_suspend() - Handle a suspend operation for the ChromeOS EC device.
> + * @ec_dev: Device to suspend.
> + *
> + * This can be called by drivers to handle a suspend event.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_suspend(struct cros_ec_device *ec_dev);
> +
> +/**
> + * cros_ec_resume() - Handle a resume operation for the ChromeOS EC device.
> + * @ec_dev: Device to resume.
> + *
> + * This can be called by drivers to handle a resume event.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_resume(struct cros_ec_device *ec_dev);
> +
> +/**
> + * cros_ec_prepare_tx() - Prepare an outgoing message in the output buffer.
> + * @ec_dev: Device to register.
> + * @msg: Message to write.
> + *
> + * This is intended to be used by all ChromeOS EC drivers, but at present
> + * only SPI uses it. Once LPC uses the same protocol it can start using it.
> + * I2C could use it now, with a refactor of the existing code.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
> +		       struct cros_ec_command *msg);
> +
> +/**
> + * cros_ec_check_result() - Check ec_msg->result.
> + * @ec_dev: EC device.
> + * @msg: Message to check.
> + *
> + * This is used by ChromeOS EC drivers to check the ec_msg->result for
> + * errors and to warn about them.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_check_result(struct cros_ec_device *ec_dev,
> +			 struct cros_ec_command *msg);
> +
> +/**
> + * cros_ec_cmd_xfer() - Send a command to the ChromeOS EC.
> + * @ec_dev: EC device.
> + * @msg: Message to write.
> + *
> + * Call this to send a command to the ChromeOS EC.  This should be used
> + * instead of calling the EC's cmd_xfer() callback directly.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
> +		     struct cros_ec_command *msg);
> +
> +/**
> + * cros_ec_cmd_xfer_status() - Send a command to the ChromeOS EC.
> + * @ec_dev: EC device.
> + * @msg: Message to write.
> + *
> + * This function is identical to cros_ec_cmd_xfer, except it returns success
> + * status only if both the command was transmitted successfully and the EC
> + * replied with success status. It's not necessary to check msg->result when
> + * using this function.
> + *
> + * Return: The number of bytes transferred on success or negative error code.
> + */
> +int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
> +			    struct cros_ec_command *msg);
> +
> +/**
> + * cros_ec_register() - Register a new ChromeOS EC, using the provided info.
> + * @ec_dev: Device to register.
> + *
> + * Before calling this, allocate a pointer to a new device and then fill
> + * in all the fields up to the --private-- marker.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_register(struct cros_ec_device *ec_dev);
> +
> +/**
> + * cros_ec_unregister() - Remove a ChromeOS EC.
> + * @ec_dev: Device to unregister.
> + *
> + * Call this to deregister a ChromeOS EC, then clean up any private data.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_unregister(struct cros_ec_device *ec_dev);
> +
> +/**
> + * cros_ec_query_all() -  Query the protocol version supported by the
> + *         ChromeOS EC.
> + * @ec_dev: Device to register.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_query_all(struct cros_ec_device *ec_dev);
> +
> +/**
> + * cros_ec_get_next_event() - Fetch next event from the ChromeOS EC.
> + * @ec_dev: Device to fetch event from.
> + * @wake_event: Pointer to a bool set to true upon return if the event might be
> + *              treated as a wake event. Ignored if null.
> + *
> + * Return: negative error code on errors; 0 for no data; or else number of
> + * bytes received (i.e., an event was retrieved successfully). Event types are
> + * written out to @ec_dev->event_data.event_type on success.
> + */
> +int cros_ec_get_next_event(struct cros_ec_device *ec_dev, bool *wake_event);
> +
> +/**
> + * cros_ec_get_host_event() - Return a mask of event set by the ChromeOS EC.
> + * @ec_dev: Device to fetch event from.
> + *
> + * When MKBP is supported, when the EC raises an interrupt, we collect the
> + * events raised and call the functions in the ec notifier. This function
> + * is a helper to know which events are raised.
> + *
> + * Return: 0 on error or non-zero bitmask of one or more EC_HOST_EVENT_*.
> + */
> +u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev);
> +
> +#endif /* __LINUX_CROS_EC_PROTO_H */
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 87830ed5ebf4..79bb4081d3c2 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -9,9 +9,9 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> -#include <linux/mfd/cros_ec.h>
> -#include <linux/mfd/cros_ec_commands.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
