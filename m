Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361894AD622
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 12:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355416AbiBHLWv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 06:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiBHLR2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 06:17:28 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F19C03FEC0;
        Tue,  8 Feb 2022 03:17:26 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id da4so14714826edb.4;
        Tue, 08 Feb 2022 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qU/gxXFDBOnfNb6XyNCa1Tw43X3fBveqLBLgVRXwtYU=;
        b=oIonbYBid+EPC+yWy7whfTIjL8NOR5Le6OTFLa3slf+E7XoOpw3pHMlhgYdqd66kbn
         JIo8yKjkjXYINcowMHaSoGTZYCEshR6qSO6eGyVNSzQWym+tPXXz458R4LGtWLkC9/mU
         0SdyfrspGKKckdh75eCdlvGsTCXrkk21VmQyeFm0qPexYEqPQBsxFL0Y5t0oO2XPy5Q1
         qnjzTEMVNrfC5WibO2tlv9ZW/xmbQZjFk4Tl2gYTCUKjD63p+hq6opX4Jejxadg3Aotz
         MNvpeNYOlSEsfHMpqMkZDMFf0vQ58Bl7woEOOdGi++JkEtLj/7hAUkml8FOw3gaN5x32
         sf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qU/gxXFDBOnfNb6XyNCa1Tw43X3fBveqLBLgVRXwtYU=;
        b=EuMW2OEx5eU+5gpi6wQGsEJvMfxrzFH3psqj0666Oc28TyvyAFMm4fWM3IwDc6Cp7D
         /k/9mAtzxIgcGzEctwTaPSgGejx9R/FVKWfFWD8tELCXBNAzg5bkRSQZP/5yRJwxd+EU
         QoPi5BHSKzDTlnQC/ygvzdk1hcGmYAKaXR0+HQd9V2RnhRlj1R6nACKg/u912nuvCNd3
         3BHlFllUxZ6kCMme6E73v5likZ5HUFiA4kh25wQWAD/7CGUzA0TiW74Mt7xceWlQEjRf
         oARq2NOdnGmlGWXQfi7cTQa0dS24fFVDaIflTbUAyKvzkGD+pIX3HVycMKdDstAcWhaT
         XTTQ==
X-Gm-Message-State: AOAM530H+F21rnCTHCJqpxT2WXe1ey6no9NlNCCqOqo27DSEUvRLKLhm
        v5rVBHqlZvxyyJQvLU/yiFTPBbokab2NWk3MGJs=
X-Google-Smtp-Source: ABdhPJxM9F5UV+586OyEXtKhoWo6F2G10uINRvy19IvkFbkB9o5fjhdSjODnpzXPTDtZN9AD6vm6n7+c32YyexCbCHE=
X-Received: by 2002:a05:6402:2284:: with SMTP id cw4mr3258644edb.436.1644319045281;
 Tue, 08 Feb 2022 03:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20220206115939.3091265-1-luca@lucaceresoli.net> <20220206115939.3091265-3-luca@lucaceresoli.net>
In-Reply-To: <20220206115939.3091265-3-luca@lucaceresoli.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Feb 2022 13:16:48 +0200
Message-ID: <CAHp75Vejw86kLUJfwXR_kUn+=UCaixbcy=epO8Foe=9S2LqXTQ@mail.gmail.com>
Subject: Re: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 7, 2022 at 7:55 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> slave "upstream" port and N master "downstream" ports, and forwards
> transactions from upstream to the appropriate downstream port. But is
> is different in that the forwarded transaction has a different slave
> address. The address used on the upstream bus is called the "alias"
> and is (potentially) different from the physical slave address of the
> downstream chip.
>
> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> implementing ATR features in a device driver. The helper takes care or
> adapter creation/destruction and translates addresses at each transaction.

Why I2C mux driver can't be updated to support this feature?

...

>  RFCv1 was implemented inside i2c-mux.c and added yet more complexity
>  there. RFCv2 creates a new file on its own, i2c-atr.c. Since many ATR
>  features are not in a MUX and vice versa, the overlapping is low. This was
>  almost a complete rewrite, but for the records here are the main
>  differences from the old implementation:

While this is from a code perspective, maybe i2c mux and this one can
still share some parts?

...

> +config I2C_ATR
> +       tristate "I2C Address Translator (ATR) support"
> +       help
> +         Enable support for I2C Address Translator (ATR) chips.
> +
> +         An ATR allows accessing multiple I2C busses from a single
> +         physical bus via address translation instead of bus selection as
> +         i2c-muxes do.

What would be the module name?

...

> +/**

Is this a kernel doc formatted documentation?
Haven't you got a warning?

> + * I2C Address Translator
> + *
> + * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>

2019,2022?

> + *
> + * An I2C Address Translator (ATR) is a device with an I2C slave parent
> + * ("upstream") port and N I2C master child ("downstream") ports, and
> + * forwards transactions from upstream to the appropriate downstream port
> + * with a modified slave address. The address used on the parent bus is
> + * called the "alias" and is (potentially) different from the physical
> + * slave address of the child bus. Address translation is done by the
> + * hardware.
> + *
> + * An ATR looks similar to an i2c-mux except:
> + * - the address on the parent and child busses can be different
> + * - there is normally no need to select the child port; the alias used on
> + *   the parent bus implies it
> + *
> + * The ATR functionality can be provided by a chip with many other
> + * features. This file provides a helper to implement an ATR within your
> + * driver.
> + *
> + * The ATR creates a new I2C "child" adapter on each child bus. Adding
> + * devices on the child bus ends up in invoking the driver code to select
> + * an available alias. Maintaining an appropriate pool of available aliases
> + * and picking one for each new device is up to the driver implementer. The
> + * ATR maintains an table of currently assigned alias and uses it to modify
> + * all I2C transactions directed to devices on the child buses.
> + *
> + * A typical example follows.
> + *
> + * Topology:
> + *
> + *                       Slave X @ 0x10
> + *               .-----.   |
> + *   .-----.     |     |---+---- B
> + *   | CPU |--A--| ATR |
> + *   `-----'     |     |---+---- C
> + *               `-----'   |
> + *                       Slave Y @ 0x10
> + *
> + * Alias table:
> + *
> + *   Client  Alias
> + *   -------------
> + *      X    0x20
> + *      Y    0x30
> + *
> + * Transaction:
> + *
> + *  - Slave X driver sends a transaction (on adapter B), slave address 0x10
> + *  - ATR driver rewrites messages with address 0x20, forwards to adapter A
> + *  - Physical I2C transaction on bus A, slave address 0x20
> + *  - ATR chip propagates transaction on bus B with address translated to 0x10
> + *  - Slave X chip replies on bus B
> + *  - ATR chip forwards reply on bus A
> + *  - ATR driver rewrites messages with address 0x10
> + *  - Slave X driver gets back the msgs[], with reply and address 0x10
> + *
> + * Usage:
> + *
> + *  1. In your driver (typically in the probe function) add an ATR by
> + *     calling i2c_atr_new() passing your attach/detach callbacks
> + *  2. When the attach callback is called pick an appropriate alias,
> + *     configure it in your chip and return the chosen alias in the
> + *     alias_id parameter
> + *  3. When the detach callback is called, deconfigure the alias from
> + *     your chip and put it back in the pool for later usage
> + *
> + * Originally based on i2c-mux.c
> + */

Shouldn't this comment be somewhere under Documentation/ ?

...

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>


> +static int i2c_atr_map_msgs(struct i2c_atr_chan *chan,
> +                           struct i2c_msg msgs[], int num)

foo[] makes not much sense in the function parameter. *foo is what
will be used and it's explicit.

Can this be located on one line (similar question to make compact the
rest of the function declarations)?

> +

Redundant blank line.

...

> +       /* Ensure we have enough room to save the original addresses */
> +       if (unlikely(chan->orig_addrs_size < num)) {

> +               void *new_buf = kmalloc(num * sizeof(chan->orig_addrs[0]),
> +                                       GFP_KERNEL);

Use kmalloc_array()

> +               if (new_buf == NULL)
> +                       return -ENOMEM;
> +
> +               kfree(chan->orig_addrs);

Hmm... is it a reimplementation of krealloc_array()?

> +               chan->orig_addrs = new_buf;
> +               chan->orig_addrs_size = num;
> +       }

...

> +               if (c2a) {
> +                       msgs[i].addr = c2a->alias;
> +               } else {
> +                       dev_err(atr->dev, "client 0x%02x not mapped!\n",
> +                               msgs[i].addr);
> +                       return -ENXIO;
> +               }

'else' would be redundant if you switch to the traditional pattern,
i.e. check for errors first.

...

> +/*
> + * Restore all message address aliases with the original addresses.
> + *
> + * This function is internal for use in i2c_atr_master_xfer().
> + *
> + * @see i2c_atr_map_msgs()
> + */

Too sparse formatting of the comment. Can you make it compact?

...

> +       int ret = 0;

Unneeded assignment.

> +       /* Switch to the right atr port */
> +       if (atr->ops->select) {
> +               ret = atr->ops->select(atr, chan->chan_id);
> +               if (ret < 0)
> +                       goto out;
> +       }
> +
> +       /* Translate addresses */
> +       mutex_lock(&chan->orig_addrs_lock);
> +       ret = i2c_atr_map_msgs(chan, msgs, num);
> +       if (ret < 0) {

> +               mutex_unlock(&chan->orig_addrs_lock);
> +               goto out;

goto out_unlock_deselect;

> +       }
> +
> +       /* Perform the transfer */
> +       ret = i2c_transfer(parent, msgs, num);
> +
> +       /* Restore addresses */
> +       i2c_atr_unmap_msgs(chan, msgs, num);

out_unlock_deselct:

> +       mutex_unlock(&chan->orig_addrs_lock);

> +out:

out_deselect:

> +       if (atr->ops->deselect)
> +               atr->ops->deselect(atr, chan->chan_id);
> +
> +       return ret;
> +}

...

> +       int err = 0;

Be consistent with ret vs. err across the functions.

> +       if (atr->ops->select)
> +               err = atr->ops->select(atr, chan->chan_id);

> +       if (!err)

Perhaps

       int ret;

       ret = 0;
       if (atr->ops->select)
               ret = atr->ops->select(atr, chan->chan_id);
       if (ret)
               goto out_deselect;


> +               err = i2c_smbus_xfer(parent, c2a->alias, flags,
> +                                    read_write, command, size, data);

out_deselect:

> +       if (atr->ops->deselect)
> +               atr->ops->deselect(atr, chan->chan_id);
> +
> +       return err;
> +}

...

> +       int err = 0;

Same as above: naming, useless assignment.

...

> +       c2a = kzalloc(sizeof(struct i2c_atr_cli2alias_pair), GFP_KERNEL);

sizeof(*c2a)

> +       if (!c2a) {
> +               err = -ENOMEM;
> +               goto err_alloc;

Useless label, return directly.

> +       }

...

> +       c2a = i2c_atr_find_mapping_by_client(&chan->alias_list, client);
> +       if (c2a != NULL) {

if (c2a)

> +               list_del(&c2a->node);
> +               kfree(c2a);
> +       }

...

> +       char symlink_name[20];

Why 20? Do we have a predefined constant for that?


> +       if (dev->of_node) {

This check can be dropped, also please use device property and fwnode
APIs. No good of having OF-centric generic modules nowadays.

> +               struct device_node *atr_node;
> +               struct device_node *child;
> +               u32 reg;
> +
> +               atr_node = of_get_child_by_name(dev->of_node, "i2c-atr");

atr_node = device_get_named_child_node(...);

fwnode_for_each_child_node() {
}

> +               for_each_child_of_node(atr_node, child) {
> +                       err = of_property_read_u32(child, "reg", &reg);
> +                       if (err)
> +                               continue;
> +                       if (chan_id == reg)
> +                               break;
> +               }
> +
> +               chan->adap.dev.of_node = child;
> +               of_node_put(atr_node);
> +       }

On the second thought can you utilize the parser from I2C mux?

...

> +       WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
> +            "can't create symlink to atr device\n");
> +       snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_id);
> +       WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
> +            "can't create symlink for channel %u\n", chan_id);

Doesn't sysfs already has a warning when it's really needed?

...

> +       if (atr->adapter[chan_id] == NULL) {
> +               dev_err(dev, "Adapter %d does not exist\n", chan_id);

Noisy message. On freeing we usually don't issue such when we try to
free already freeed resource.

> +               return;
> +       }

...

> +       atr = devm_kzalloc(dev, sizeof(*atr)
> +                           + max_adapters * sizeof(atr->adapter[0]),
> +                           GFP_KERNEL);

Check overflow.h and use respective macro here.

> +       if (!atr)
> +               return ERR_PTR(-ENOMEM);

...

> +/**

It's not a kernel doc.

> + * drivers/i2c/i2c-atr.h -- I2C Address Translator

Please, no names of the files inside the files.

> + * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>

2019,2022 ?

> + * Based on i2c-mux.h
> + */

...

> +#ifdef __KERNEL__

Why?

...

> +#include <linux/i2c.h>
> +#include <linux/mutex.h>

Missed types.h

Missed struct device;

-- 
With Best Regards,
Andy Shevchenko
