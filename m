Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84C14642B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 18:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfFNQbn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 12:31:43 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35562 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbfFNQbm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 12:31:42 -0400
Received: by mail-lf1-f68.google.com with SMTP id a25so2162804lfg.2;
        Fri, 14 Jun 2019 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rtBAaBljYZ2C8gHpY2BsX7cutCnNCe9geyY7VReytvI=;
        b=oK/jXp/Actot4iAGsPhXHB/Oredg3KqHFHQUSHo3HRJRa+kSTwzxR2CQlIcs3fMZJE
         YRSDagxGlCN8yU3PXswUHmorBrRQ5ef8txoc85OqBl+qkssHJ4T4t/BghETNfpWHhKBS
         btHGsNpTALy3H+O3GYjVtgulDcRlYEoHy8/fclODAN/BQz/B74SnnmzPH47Zdjox8m8U
         XBk5qY98yLon2+6qeUt7oCcTfNAKcVSqVDGuV9VDt2wzm5gw54AqpwWe0rtmrGtUyTCv
         teSYOJolfcohzK9npbhgeJ2cnPJEe777urTKFBIiPhntzdA8FIJmLpHXH5VfnEEcZjCZ
         Tv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rtBAaBljYZ2C8gHpY2BsX7cutCnNCe9geyY7VReytvI=;
        b=Fy3eeJUW0SjiFjGAKxGUofKEarLHndorlNvVnPmQv7Wq5qiwp7W089vFtptuK5Qaqw
         VdBt+CUbQFuwNeppdij3imec/XxAYNdRiacFf5N+TAhvye7mZ1N6KygiXR2dHqkB0wjn
         r0D/+IivrCIreJsphq2zuj3bql54PudFrsNaAlNgm0sm3GRiejVE2NxQzkGXOerkecAt
         Z5On6Lb6YFFIdqKDiXFCq2LunBwV82ZLHHU91oKB+YGW1CNDSHod1wEI9Xs8UeEOdmcp
         aBIx9mnbfMDmclBARRjnueuDMXqgNg6l8+SGPZ1JQRtkcIcweXF1UAFQpIPr4EEUR2TH
         I9cw==
X-Gm-Message-State: APjAAAWVKyV/kxSCntiCaw634knqCbq5KAY+QKhZPDwhyEFZA4EkQbjZ
        6el0dW8jPAV40KQnkGDeipY=
X-Google-Smtp-Source: APXvYqyGtzZ1tg7kbAHwZjk69KnBs/OFZzyuDaCDv1d3kh3qola7N8yIO6XWiCmOyqXBgDjatx2M4w==
X-Received: by 2002:ac2:4209:: with SMTP id y9mr7673780lfh.83.1560529899569;
        Fri, 14 Jun 2019 09:31:39 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id r84sm741613lja.54.2019.06.14.09.31.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 09:31:38 -0700 (PDT)
Date:   Fri, 14 Jun 2019 19:31:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] i2c-mux-gpio: Unpin the platform-specific GPIOs
 request code
Message-ID: <20190614163134.zs5xyuqvp25ahbng@mobilestation>
References: <20190425232028.9333-1-fancer.lancer@gmail.com>
 <20190425232028.9333-3-fancer.lancer@gmail.com>
 <783250dd-87c0-b3cc-0e90-7978605a9b07@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="js3647rh2qcjoysr"
Content-Disposition: inline
In-Reply-To: <783250dd-87c0-b3cc-0e90-7978605a9b07@axentia.se>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--js3647rh2qcjoysr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Peter,

On Sun, Jun 09, 2019 at 09:34:54PM +0000, Peter Rosin wrote:
> On 2019-04-26 01:20, Serge Semin wrote:
> > The GPIOs request loop can be safely moved to a separate function.
> > First of all it shall improve the code readability. Secondly the
> > initialization loop at this point is used for both of- and
> > platform_data-based initialization paths, but it will be changed in
> > the next patch, so by isolating the code we'll simplify the future
> > work.
> 
> This patch is just preparatory for patch 3/3, as I see it. And since
> I'm not really fond of the end result after patch 3/3, I'm going to
> sum up my issues here, instead of trying do it piecemeal in the two
> patches.
> 
> Linus and Jean, for your convenience, link to this patch series [1].
> 
> While I agree with the goal (to use the more flexible gpiod functions
> to get at the gpio descriptors), the cost is too high when the init
> code for platform and OF is basically completely separated. I much
> prefer the approach taken by Linus [2], which instead converts the
> platform interface and its single user to use gpio descriptors instead
> of the legacy gpio interface. The i2c-mux-gpio code then has the
> potential to take a unified approach to the given gpio descriptors,
> wherever they are originating from, which is much nicer than the
> code-fork in this series.
> 
> I also think it is pretty pointless to first split the code into
> platform and OF paths, just so that the next patch (from Linus) can
> unify the two paths again. I'd like to skip the intermediate step.
> 
> So, I'm hoping for the following to happen.
> 1. Sergey sends a revised patch for patch 1/3.
> 2. I put the patch on the for-next branch.
> 3. Linus rebases his patch on top of that (while thinking about
>    the questions raised by Sergey).
> 4. Sergey tests the result, I and Jean review it, then possibly
>    go back to 3.
> 5. I put the patch on the for-next branch.
> 
> Is that ok? Or is someone insisting that we take a detour?
> 

The series was intended to add the gpiod support to the i2c-mux-gpio driver
(see the cover letter of the series). So the last patch is the most valuable
one. Without it the whole series is nothing but a small readability improvement.
So it is pointless to merge the first patch only.

Anyway since you refuse to add the last patch and the first patch is actually
pointless without the rest of the series, and I would have to spend my time to
resubmit the v3 of the first patch anyway, it was much easier to test the
current version of the Linus' patch and make it working for OF-based platforms.
Additionally the Linus' patch also reaches the main goal of this patchset.

I don't know what would be the appropriate way to send the updated version of
the Linus' patch. So I just attached the v4 of it to this email. Shall I better
send it in reply to the Linus' patch series?

Regards,
-Sergey


> Cheers,
> Peter
> 
> [1] https://patchwork.ozlabs.org/cover/1091119/ (and show related)
> [2] https://patchwork.ozlabs.org/patch/1109521/
> 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > ---
> > Changelog v2
> > - Create a dedicated initial_state field in the "gpiomux" structure to
> >   keep an initial channel selector state.
> > ---
> >  drivers/i2c/muxes/i2c-mux-gpio.c | 113 +++++++++++++++++++------------
> >  1 file changed, 68 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> > index 54158b825acd..e10f72706b99 100644
> > --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> > +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> > @@ -20,7 +20,8 @@
> >  
> >  struct gpiomux {
> >  	struct i2c_mux_gpio_platform_data data;
> > -	unsigned gpio_base;
> > +	unsigned int gpio_base;
> > +	unsigned int initial_state;
> >  	struct gpio_desc **gpios;
> >  };
> >  
> > @@ -162,13 +163,68 @@ static int i2c_mux_gpio_probe_plat(struct gpiomux *mux,
> >  	return 0;
> >  }
> >  
> > +static int i2c_mux_gpio_request_plat(struct gpiomux *mux,
> > +					struct platform_device *pdev)
> > +{
> > +	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
> > +	struct gpio_desc *gpio_desc;
> > +	struct i2c_adapter *root;
> > +	struct device *gpio_dev;
> > +	int i, ret;
> > +
> > +	root = i2c_root_adapter(&muxc->parent->dev);
> > +
> > +	for (i = 0; i < mux->data.n_gpios; i++) {
> > +		ret = gpio_request(mux->gpio_base + mux->data.gpios[i],
> > +				   "i2c-mux-gpio");
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "Failed to request GPIO %d\n",
> > +				mux->data.gpios[i]);
> > +			goto err_request_gpio;
> > +		}
> > +
> > +		ret = gpio_direction_output(mux->gpio_base + mux->data.gpios[i],
> > +					    mux->initial_state & (1 << i));
> > +		if (ret) {
> > +			dev_err(&pdev->dev,
> > +				"Failed to set direction of GPIO %d to output\n",
> > +				mux->data.gpios[i]);
> > +			i++;	/* gpio_request above succeeded, so must free */
> > +			goto err_request_gpio;
> > +		}
> > +
> > +		gpio_desc = gpio_to_desc(mux->gpio_base + mux->data.gpios[i]);
> > +		mux->gpios[i] = gpio_desc;
> > +
> > +		if (!muxc->mux_locked)
> > +			continue;
> > +
> > +		gpio_dev = &gpio_desc->gdev->dev;
> > +		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_request_gpio:
> > +	for (; i > 0; i--)
> > +		gpio_free(mux->gpio_base + mux->data.gpios[i - 1]);
> > +
> > +	return ret;
> > +}
> > +
> > +static void i2c_mux_gpio_free(struct gpiomux *mux)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < mux->data.n_gpios; i++)
> > +		gpiod_free(mux->gpios[i]);
> > +}
> > +
> >  static int i2c_mux_gpio_probe(struct platform_device *pdev)
> >  {
> >  	struct i2c_mux_core *muxc;
> >  	struct gpiomux *mux;
> >  	struct i2c_adapter *parent;
> > -	struct i2c_adapter *root;
> > -	unsigned initial_state;
> >  	int i, ret;
> >  
> >  	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
> > @@ -198,48 +254,18 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, muxc);
> >  
> > -	root = i2c_root_adapter(&parent->dev);
> > -
> >  	muxc->mux_locked = true;
> >  
> >  	if (mux->data.idle != I2C_MUX_GPIO_NO_IDLE) {
> > -		initial_state = mux->data.idle;
> > +		mux->initial_state = mux->data.idle;
> >  		muxc->deselect = i2c_mux_gpio_deselect;
> >  	} else {
> > -		initial_state = mux->data.values[0];
> > +		mux->initial_state = mux->data.values[0];
> >  	}
> >  
> > -	for (i = 0; i < mux->data.n_gpios; i++) {
> > -		struct device *gpio_dev;
> > -		struct gpio_desc *gpio_desc;
> > -
> > -		ret = gpio_request(mux->gpio_base + mux->data.gpios[i],
> > -				   "i2c-mux-gpio");
> > -		if (ret) {
> > -			dev_err(&pdev->dev, "Failed to request GPIO %d\n",
> > -				mux->data.gpios[i]);
> > -			goto err_request_gpio;
> > -		}
> > -
> > -		ret = gpio_direction_output(mux->gpio_base + mux->data.gpios[i],
> > -					    initial_state & (1 << i));
> > -		if (ret) {
> > -			dev_err(&pdev->dev,
> > -				"Failed to set direction of GPIO %d to output\n",
> > -				mux->data.gpios[i]);
> > -			i++;	/* gpio_request above succeeded, so must free */
> > -			goto err_request_gpio;
> > -		}
> > -
> > -		gpio_desc = gpio_to_desc(mux->gpio_base + mux->data.gpios[i]);
> > -		mux->gpios[i] = gpio_desc;
> > -
> > -		if (!muxc->mux_locked)
> > -			continue;
> > -
> > -		gpio_dev = &gpio_desc->gdev->dev;
> > -		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
> > -	}
> > +	ret = i2c_mux_gpio_request_plat(mux, pdev);
> > +	if (ret)
> > +		goto alloc_failed;
> >  
> >  	if (muxc->mux_locked)
> >  		dev_info(&pdev->dev, "mux-locked i2c mux\n");
> > @@ -260,10 +286,9 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
> >  
> >  add_adapter_failed:
> >  	i2c_mux_del_adapters(muxc);
> > -	i = mux->data.n_gpios;
> > -err_request_gpio:
> > -	for (; i > 0; i--)
> > -		gpio_free(mux->gpio_base + mux->data.gpios[i - 1]);
> > +
> > +	i2c_mux_gpio_free(mux);
> > +
> >  alloc_failed:
> >  	i2c_put_adapter(parent);
> >  
> > @@ -274,12 +299,10 @@ static int i2c_mux_gpio_remove(struct platform_device *pdev)
> >  {
> >  	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
> >  	struct gpiomux *mux = i2c_mux_priv(muxc);
> > -	int i;
> >  
> >  	i2c_mux_del_adapters(muxc);
> >  
> > -	for (i = 0; i < mux->data.n_gpios; i++)
> > -		gpio_free(mux->gpio_base + mux->data.gpios[i]);
> > +	i2c_mux_gpio_free(mux);
> >  
> >  	i2c_put_adapter(muxc->parent);
> >  
> > 
> 

--js3647rh2qcjoysr
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-i2c-mux-i801-Switch-to-use-descriptor-passing.patch"

From 660ff4062e4cb89601d8c27ff555f7c18ebfafcc Mon Sep 17 00:00:00 2001
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Jun 2019 00:08:19 +0200
Subject: [PATCH v4] i2c: mux/i801: Switch to use descriptor passing

This switches the i801 GPIO mux to use GPIO descriptors for
handling the GPIO lines. The previous hack which was reaching
inside the GPIO chips etc cannot live on. We pass descriptors
along with the GPIO mux device at creation instead.

The GPIO mux was only used by way of platform data with a
platform device from one place in the kernel: the i801 i2c bus
driver. Let's just associate the GPIO descriptor table with
the actual device like everyone else and dynamically create
a descriptor table passed along with the GPIO i2c mux.

This enables simplification of the GPIO i2c mux driver to
use only the descriptor API and the OF probe path gets
simplified in the process.

The i801 driver was registering the GPIO i2c mux with
PLATFORM_DEVID_AUTO which would make it hard to predict the
device name and assign the descriptor table properly, but
this seems to be a mistake to begin with: all of the
GPIO mux devices are hardcoded to look up GPIO lines from
the "gpio_ich" GPIO chip. If there are more than one mux,
there is certainly more than one gpio chip as well, and
then we have more serious problems. Switch to
PLATFORM_DEVID_NONE instead. There can be only one.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Co-Developed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

---
ChangeLog v3->v4:
- Use "mux" value as con_id of GPIOd methods.
- Check negative value of gpiod_count() method.

ChangeLog v2->v3:
- Reorder variable declarations to inverse christmas tree.
- Stash away GPIO lookup table reference and make sure to
  remove it on deletion and on error path.
- Insert some nasty FIXME comments about poking around
  in gpiolib internals.
ChangeLog v1->v2:
- Found some unused vars when compiling for DT, mea culpa.

Folks, you surely see what I am trying to do. Would
appreciate help fixing any bugs (it compiles).
---
 drivers/i2c/busses/i2c-i801.c              |  37 +++++--
 drivers/i2c/muxes/i2c-mux-gpio.c           | 115 ++++++---------------
 include/linux/platform_data/i2c-mux-gpio.h |   7 --
 3 files changed, 60 insertions(+), 99 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ac7f7817dc89..ec54b5b4f1a1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -99,7 +99,7 @@
 #include <linux/pm_runtime.h>
 
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_data/i2c-mux-gpio.h>
 #endif
 
@@ -266,6 +266,7 @@ struct i801_priv {
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
 	const struct i801_mux_config *mux_drvdata;
 	struct platform_device *mux_pdev;
+	struct gpiod_lookup_table *lookup;
 #endif
 	struct platform_device *tco_pdev;
 
@@ -1250,7 +1251,8 @@ static int i801_add_mux(struct i801_priv *priv)
 	struct device *dev = &priv->adapter.dev;
 	const struct i801_mux_config *mux_config;
 	struct i2c_mux_gpio_platform_data gpio_data;
-	int err;
+	struct gpiod_lookup_table *lookup;
+	int err, i;
 
 	if (!priv->mux_drvdata)
 		return 0;
@@ -1262,17 +1264,36 @@ static int i801_add_mux(struct i801_priv *priv)
 	gpio_data.values = mux_config->values;
 	gpio_data.n_values = mux_config->n_values;
 	gpio_data.classes = mux_config->classes;
-	gpio_data.gpio_chip = mux_config->gpio_chip;
-	gpio_data.gpios = mux_config->gpios;
-	gpio_data.n_gpios = mux_config->n_gpios;
 	gpio_data.idle = I2C_MUX_GPIO_NO_IDLE;
 
-	/* Register the mux device */
+	/* Register GPIO descriptor lookup table */
+	lookup = devm_kzalloc(dev,
+			      struct_size(lookup, table, mux_config->n_gpios),
+			      GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+	lookup->dev_id = "i2c-mux-gpio";
+	for (i = 0; i < mux_config->n_gpios; i++) {
+		lookup->table[i].chip_label = mux_config->gpio_chip;
+		lookup->table[i].chip_hwnum = mux_config->gpios[i];
+		lookup->table[i].con_id = "mux";
+	}
+	gpiod_add_lookup_table(lookup);
+	priv->lookup = lookup;
+
+	/*
+	 * Register the mux device, we use PLATFORM_DEVID_NONE here
+	 * because since we are referring to the GPIO chip by name we are
+	 * anyways in deep trouble if there is more than one of these
+	 * devices, and there should likely only be one platform controller
+	 * hub.
+	 */
 	priv->mux_pdev = platform_device_register_data(dev, "i2c-mux-gpio",
-				PLATFORM_DEVID_AUTO, &gpio_data,
+				PLATFORM_DEVID_NONE, &gpio_data,
 				sizeof(struct i2c_mux_gpio_platform_data));
 	if (IS_ERR(priv->mux_pdev)) {
 		err = PTR_ERR(priv->mux_pdev);
+		gpiod_remove_lookup_table(lookup);
 		priv->mux_pdev = NULL;
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
 		return err;
@@ -1285,6 +1306,8 @@ static void i801_del_mux(struct i801_priv *priv)
 {
 	if (priv->mux_pdev)
 		platform_device_unregister(priv->mux_pdev);
+	if (priv->lookup)
+		gpiod_remove_lookup_table(priv->lookup);
 }
 
 static unsigned int i801_get_adapter_class(struct i801_priv *priv)
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 13882a2a4f60..1ea097dc8d5d 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -14,13 +14,14 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+/* FIXME: stop poking around inside gpiolib */
 #include "../../gpio/gpiolib.h"
-#include <linux/of_gpio.h>
 
 struct gpiomux {
 	struct i2c_mux_gpio_platform_data data;
-	unsigned gpio_base;
+	int ngpios;
 	struct gpio_desc **gpios;
 };
 
@@ -30,7 +31,7 @@ static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
 
 	values[0] = val;
 
-	gpiod_set_array_value_cansleep(mux->data.n_gpios, mux->gpios, NULL,
+	gpiod_set_array_value_cansleep(mux->ngpios, mux->gpios, NULL,
 				       values);
 }
 
@@ -52,12 +53,6 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-static int match_gpio_chip_by_label(struct gpio_chip *chip,
-					      void *data)
-{
-	return !strcmp(chip->label, data);
-}
-
 #ifdef CONFIG_OF
 static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 					struct platform_device *pdev)
@@ -65,8 +60,8 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *adapter_np, *child;
 	struct i2c_adapter *adapter;
-	unsigned *values, *gpios;
-	int i = 0, ret;
+	unsigned *values;
+	int i = 0;
 
 	if (!np)
 		return -ENODEV;
@@ -103,29 +98,6 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 	if (of_property_read_u32(np, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
-	mux->data.n_gpios = of_gpio_named_count(np, "mux-gpios");
-	if (mux->data.n_gpios < 0) {
-		dev_err(&pdev->dev, "Missing mux-gpios property in the DT.\n");
-		return -EINVAL;
-	}
-
-	gpios = devm_kcalloc(&pdev->dev,
-			     mux->data.n_gpios, sizeof(*mux->data.gpios),
-			     GFP_KERNEL);
-	if (!gpios) {
-		dev_err(&pdev->dev, "Cannot allocate gpios array");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < mux->data.n_gpios; i++) {
-		ret = of_get_named_gpio(np, "mux-gpios", i);
-		if (ret < 0)
-			return ret;
-		gpios[i] = ret;
-	}
-
-	mux->data.gpios = gpios;
-
 	return 0;
 }
 #else
@@ -142,8 +114,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	struct gpiomux *mux;
 	struct i2c_adapter *parent;
 	struct i2c_adapter *root;
-	unsigned initial_state, gpio_base;
-	int i, ret;
+	unsigned initial_state;
+	int i, ngpios, ret;
 
 	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -158,29 +130,19 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 			sizeof(mux->data));
 	}
 
-	/*
-	 * If a GPIO chip name is provided, the GPIO pin numbers provided are
-	 * relative to its base GPIO number. Otherwise they are absolute.
-	 */
-	if (mux->data.gpio_chip) {
-		struct gpio_chip *gpio;
-
-		gpio = gpiochip_find(mux->data.gpio_chip,
-				     match_gpio_chip_by_label);
-		if (!gpio)
-			return -EPROBE_DEFER;
-
-		gpio_base = gpio->base;
-	} else {
-		gpio_base = 0;
+	ngpios = gpiod_count(&pdev->dev, "mux");
+	if (ngpios <= 0) {
+		dev_err(&pdev->dev, "no valid gpios provided\n");
+		return ngpios ?: -EINVAL;
 	}
+	mux->ngpios = ngpios;
 
 	parent = i2c_get_adapter(mux->data.parent);
 	if (!parent)
 		return -EPROBE_DEFER;
 
 	muxc = i2c_mux_alloc(parent, &pdev->dev, mux->data.n_values,
-			     mux->data.n_gpios * sizeof(*mux->gpios), 0,
+			     ngpios * sizeof(*mux->gpios), 0,
 			     i2c_mux_gpio_select, NULL);
 	if (!muxc) {
 		ret = -ENOMEM;
@@ -194,7 +156,6 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	root = i2c_root_adapter(&parent->dev);
 
 	muxc->mux_locked = true;
-	mux->gpio_base = gpio_base;
 
 	if (mux->data.idle != I2C_MUX_GPIO_NO_IDLE) {
 		initial_state = mux->data.idle;
@@ -203,34 +164,28 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		initial_state = mux->data.values[0];
 	}
 
-	for (i = 0; i < mux->data.n_gpios; i++) {
+	for (i = 0; i < ngpios; i++) {
 		struct device *gpio_dev;
-		struct gpio_desc *gpio_desc;
-
-		ret = gpio_request(gpio_base + mux->data.gpios[i], "i2c-mux-gpio");
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to request GPIO %d\n",
-				mux->data.gpios[i]);
-			goto err_request_gpio;
+		struct gpio_desc *gpiod;
+		enum gpiod_flags flag;
+
+		if (initial_state & BIT(i))
+			flag = GPIOD_OUT_HIGH;
+		else
+			flag = GPIOD_OUT_LOW;
+		gpiod = devm_gpiod_get_index(&pdev->dev, "mux", i, flag);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
+			goto alloc_failed;
 		}
 
-		ret = gpio_direction_output(gpio_base + mux->data.gpios[i],
-					    initial_state & (1 << i));
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to set direction of GPIO %d to output\n",
-				mux->data.gpios[i]);
-			i++;	/* gpio_request above succeeded, so must free */
-			goto err_request_gpio;
-		}
-
-		gpio_desc = gpio_to_desc(gpio_base + mux->data.gpios[i]);
-		mux->gpios[i] = gpio_desc;
+		mux->gpios[i] = gpiod;
 
 		if (!muxc->mux_locked)
 			continue;
 
-		gpio_dev = &gpio_desc->gdev->dev;
+		/* FIXME: find a proper way to access the GPIO device */
+		gpio_dev = &gpiod->gdev->dev;
 		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
 	}
 
@@ -253,10 +208,6 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 
 add_adapter_failed:
 	i2c_mux_del_adapters(muxc);
-	i = mux->data.n_gpios;
-err_request_gpio:
-	for (; i > 0; i--)
-		gpio_free(gpio_base + mux->data.gpios[i - 1]);
 alloc_failed:
 	i2c_put_adapter(parent);
 
@@ -266,14 +217,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 static int i2c_mux_gpio_remove(struct platform_device *pdev)
 {
 	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
-	struct gpiomux *mux = i2c_mux_priv(muxc);
-	int i;
 
 	i2c_mux_del_adapters(muxc);
-
-	for (i = 0; i < mux->data.n_gpios; i++)
-		gpio_free(mux->gpio_base + mux->data.gpios[i]);
-
 	i2c_put_adapter(muxc->parent);
 
 	return 0;
diff --git a/include/linux/platform_data/i2c-mux-gpio.h b/include/linux/platform_data/i2c-mux-gpio.h
index 4406108201fe..28f288eed652 100644
--- a/include/linux/platform_data/i2c-mux-gpio.h
+++ b/include/linux/platform_data/i2c-mux-gpio.h
@@ -22,10 +22,6 @@
  *	position
  * @n_values: Number of multiplexer positions (busses to instantiate)
  * @classes: Optional I2C auto-detection classes
- * @gpio_chip: Optional GPIO chip name; if set, GPIO pin numbers are given
- *	relative to the base GPIO number of that chip
- * @gpios: Array of GPIO numbers used to control MUX
- * @n_gpios: Number of GPIOs used to control MUX
  * @idle: Bitmask to write to MUX when idle or GPIO_I2CMUX_NO_IDLE if not used
  */
 struct i2c_mux_gpio_platform_data {
@@ -34,9 +30,6 @@ struct i2c_mux_gpio_platform_data {
 	const unsigned *values;
 	int n_values;
 	const unsigned *classes;
-	char *gpio_chip;
-	const unsigned *gpios;
-	int n_gpios;
 	unsigned idle;
 };
 
-- 
2.21.0


--js3647rh2qcjoysr--
