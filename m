Return-Path: <linux-i2c+bounces-6753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D7979658
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Sep 2024 12:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 156BCB221B6
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Sep 2024 10:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1022E40E;
	Sun, 15 Sep 2024 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/C3wCtJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A91C3F19
	for <linux-i2c@vger.kernel.org>; Sun, 15 Sep 2024 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726397069; cv=none; b=MpjJZ1dV8shS4gtKi3vP5Pxuwh4FdVqD4G/XNypK8y8m0358Tv022YBsM6JDuozk+yGS4th6GaOiUW0jD9lI3TVaYMbOTrfRmngYQ/4R5GR/xd/YRkZ+Pov7M3lrdqQMgCRNp2XIzHN9HCyilJyoeYwljBAAj9GcD6d55DAeIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726397069; c=relaxed/simple;
	bh=0G+q0savsd9CgjN1TA4CDbl18pXbiLhoyFmeO5zGzvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkCX2+i2O2nVCoGDfVpaKm+uOlfV3Z4IADhJ3HxI709tk/7d1x3MyQkT48x9YvohHHlgCr2idTUWssvQtgBUH+zQDtgrq0VanqVMLiZ/jb00BYu6Y7dYPZtQOZ0aJfn+VbKVok90vwvzJatZTUPOWkwMcaQbJ8M/P9WJj3VwpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J/C3wCtJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-536748c7e9aso4201952e87.0
        for <linux-i2c@vger.kernel.org>; Sun, 15 Sep 2024 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726397065; x=1727001865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqEt4ObuvSIR2+6CpLer5riNkJPNA32ELfGwazBXidc=;
        b=J/C3wCtJcbjmx85GySbmNGFpvTuYWMFu9Ac4ez4uLi+QCAds0PtAZ0I6VNO+yboqpB
         vOi2OVOj/wTqweMiAdA+7URQ5fdTHeM8C8pVFNMtnIAyJlSIuY4MYC7o2u0w9ew7/6pX
         n2wSlEgXge71x2Uy327hkudbjvijSS8oEX260=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726397065; x=1727001865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqEt4ObuvSIR2+6CpLer5riNkJPNA32ELfGwazBXidc=;
        b=u6h8sIZCQ0L8l+OqUhvOCXr3n+GLke+B6c8vOfidza/uia1zyd+tu0T/p0xQtaAnsX
         nWy/jU7c7ZhCv3j/geEakThu/9XuNZuTVLA+GAJyaHzJS/arsHCBD2XPsJLCDeDCHGHY
         yk6AUDyiPYUCIsbhjHgJnVgGdrHmlnZwfc8WDiSyTUqmFMFCEa5iwnhZz61C93u2JIco
         K1lOt5vntgwvue7ucwnRGSWH5NSjcJMV66iZDQNsfcJ5JLyjKbv9CUjIDw66rujXW/DF
         QD9DcH846KEwP+8zWevol894lBKh0XcT7cosoasug1VoU087ovs0CkNwAAN3+19gBL4o
         ljsw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Z3oKl8ADu42JbA2sUFiaF/OWAefC4PiWOARJ/YYBsRpECnHkPmntmLwIdIcsut2cB7bSaeA7CxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YydI6ZSoAIqDI4JbTvIc8z/xDcKl3csYswpYmg+xulvM8K56YeN
	pQ1eOSCnkjKklYEFKYQBDQ65GVDn0OigIYvrib3aZIa+zHyvrLOTHVm29jVYj9scNFCnu3z+SAz
	TgZNnByBoeHQ/eLeL0oZA5vnLlNd2OSR7JGiO
X-Google-Smtp-Source: AGHT+IFr4/sXzAGOOmgijyxrqonSXBFjq5blTMpRSCdxxETTOmw4Qq5yYRYsOEcGin1sOIvXRlqhOBJGRRV9Uex1j+8=
X-Received: by 2002:a05:6512:1581:b0:533:4327:b4cc with SMTP id
 2adb3069b0e04-53678ff3092mr7398960e87.52.1726397064422; Sun, 15 Sep 2024
 03:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com>
In-Reply-To: <ZuQTFTNTBLCziD05@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 15 Sep 2024 12:44:13 +0200
Message-ID: <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 12:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component probe. function For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +static int i2c_of_probe_enable_node(struct device *dev, struct device_=
node *node)
> > +{
> > +     int ret;
>
> > +     dev_info(dev, "Enabling %pOF\n", node);
>
> Is it important to be on INFO level?

Not really.

> > +     struct of_changeset *ocs __free(kfree) =3D kzalloc(sizeof(*ocs), =
GFP_KERNEL);
> > +     if (!ocs)
> > +             return -ENOMEM;
> > +
> > +     of_changeset_init(ocs);
> > +     ret =3D of_changeset_update_prop_string(ocs, node, "status", "oka=
y");
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D of_changeset_apply(ocs);
> > +     if (ret) {
> > +             /* ocs needs to be explicitly cleaned up before being fre=
ed. */
> > +             of_changeset_destroy(ocs);
> > +     } else {
> > +             /*
> > +              * ocs is intentionally kept around as it needs to
> > +              * exist as long as the change is applied.
> > +              */
> > +             void *ptr __always_unused =3D no_free_ptr(ocs);
> > +     }
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_pro=
be_cfg *cfg, void *ctx)
> > +{
> > +     const struct i2c_of_probe_ops *ops;
> > +     const char *type;
> > +     struct device_node *i2c_node;
> > +     struct i2c_adapter *i2c;
> > +     int ret;
> > +
> > +     if (!cfg)
> > +             return -EINVAL;
> > +
> > +     ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > +     type =3D cfg->type;
> > +
> > +     i2c_node =3D i2c_of_probe_get_i2c_node(dev, type);
>
>
>         struct device_node *i2c_node __free(of_node_put) =3D
>                 i2c_...;

cleanup.h says to not mix the two styles (scoped vs goto). I was trying
to follow that, though I realize now that with the scoped loops it
probably doesn't help.

I'll revert back to having __free().

> > +     if (IS_ERR(i2c_node))
> > +             return PTR_ERR(i2c_node);
> > +
> > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > +             if (!of_device_is_available(node))
> > +                     continue;
> > +
> > +             /*
> > +              * Device tree has component already enabled. Either the
> > +              * device tree isn't supported or we already probed once.
> > +              */
> > +             ret =3D 0;
>
> Shouldn't you drop reference count for "node"? (See also below)

This for-each loop the "scoped". It just doesn't have the prefix anymore.
I believe you asked if the prefix could be dropped and then Rob agreed.

> > +             goto out_put_i2c_node;
> > +     }
> > +
> > +     i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > +     if (!i2c) {
> > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I=
2C adapter\n");
> > +             goto out_put_i2c_node;
> > +     }
> > +
> > +     /* Grab resources */
> > +     ret =3D 0;
> > +     if (ops->get_resources)
> > +             ret =3D ops->get_resources(dev, i2c_node, ctx);
> > +     if (ret)
> > +             goto out_put_i2c_adapter;
> > +
> > +     /* Enable resources */
> > +     if (ops->enable)
> > +             ret =3D ops->enable(dev, ctx);
> > +     if (ret)
> > +             goto out_release_resources;
> > +
> > +     ret =3D 0;
> > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > +             union i2c_smbus_data data;
> > +             u32 addr;
> > +
> > +             if (of_property_read_u32(node, "reg", &addr))
> > +                     continue;
> > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_S=
MBUS_BYTE, &data) < 0)
> > +                     continue;
> > +
> > +             /* Found a device that is responding */
> > +             if (ops->free_resources_early)
> > +                     ops->free_resources_early(ctx);
> > +             ret =3D i2c_of_probe_enable_node(dev, node);
>
> Hmm... Is "node" reference count left bumped up for a reason?

Same as above.

> > +             break;
> > +     }
> > +
> > +     if (ops->cleanup)
> > +             ops->cleanup(dev, ctx);
> > +out_release_resources:
> > +     if (ops->free_resources_late)
> > +             ops->free_resources_late(ctx);
> > +out_put_i2c_adapter:
> > +     i2c_put_adapter(i2c);
> > +out_put_i2c_node:
> > +     of_node_put(i2c_node);
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +/*
> > + * i2c-of-prober.h - definitions for the Linux I2C OF component prober
>
> Please avoid putting filenames inside files. In the possible future event=
 of
> file renaming this may become a burden and sometimes even forgotten.

Ack.

> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#ifndef _LINUX_I2C_OF_PROBER_H
> > +#define _LINUX_I2C_OF_PROBER_H
>
> > +#if IS_ENABLED(CONFIG_OF_DYNAMIC)
>
> Do you really need to hide data types with this? Wouldn't be enough to hi=
de
> APIs only?

Ack. Will move the data types outside.


Thanks
ChenYu


> > +struct device;
> > +struct device_node;
> > +
> > +/**
> > + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> > + *
> > + * A set of callbacks to be used by i2c_of_probe_component().
> > + *
> > + * All callbacks are optional. Callbacks are called only once per run,=
 and are
> > + * used in the order they are defined in this structure.
> > + *
> > + * All callbacks that have return values shall return %0 on success,
> > + * or a negative error number on failure.
> > + *
> > + * The @dev parameter passed to the callbacks is the same as @dev pass=
ed to
> > + * i2c_of_probe_component(). It should only be used for dev_printk() c=
alls
> > + * and nothing else, especially not managed device resource (devres) A=
PIs.
> > + */
> > +struct i2c_of_probe_ops {
> > +     /** @get_resources: Retrieve resources for components. */
> > +     int (*get_resources)(struct device *dev, struct device_node *bus_=
node, void *data);
> > +
> > +     /** @free_resources_early: Release exclusive resources prior to e=
nabling component. */
> > +     void (*free_resources_early)(void *data);
> > +
> > +     /**
> > +      * @enable: Enable resources so that the components respond to pr=
obes.
> > +      *
> > +      * Resources should be reverted to their initial state before ret=
urning if this fails.
> > +      */
> > +     int (*enable)(struct device *dev, void *data);
> > +
> > +     /**
> > +      * @cleanup: Opposite of @enable to balance refcounts after probi=
ng.
> > +      *
> > +      * Can not operate on resources already freed in @free_resources_=
early.
> > +      */
> > +     int (*cleanup)(struct device *dev, void *data);
> > +
> > +     /**
> > +      * @free_resources_late: Release all resources, including those t=
hat would have
> > +      *                       been released by @free_resources_early.
> > +      */
> > +     void (*free_resources_late)(void *data);
> > +};
> > +
> > +/**
> > + * struct i2c_of_probe_cfg - I2C OF component prober configuration
> > + * @ops: Callbacks for the prober to use.
> > + * @type: A string to match the device node name prefix to probe for.
> > + */
> > +struct i2c_of_probe_cfg {
> > +     const struct i2c_of_probe_ops *ops;
> > +     const char *type;
> > +};
> > +
> > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_pro=
be_cfg *cfg, void *ctx);
> > +
> > +#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
> > +
> > +#endif /* _LINUX_I2C_OF_PROBER_H */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

