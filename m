Return-Path: <linux-i2c+bounces-6739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894F978BEC
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 01:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 918A0B2262B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 23:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94EB191F83;
	Fri, 13 Sep 2024 23:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ayTd/7fV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC84178362
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271001; cv=none; b=l6yi/EmuOv5QyfqFkLbecEp8OcYCip0RdZZktm4Ffwkxn/EXfonlGUoUt790UnMRKT+200u8W4pUga033RuZkaKhk2sxd689KI/a95qmOIecHynnRoXQIKY1ecIQyYz7Ww34FMme/oie5CLWc2uM6zDjb/9xKhR/tZ8N0Su4cVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271001; c=relaxed/simple;
	bh=p2By7YmnTSdxT4QuH8w6lXtDAJVp0dBpTIiwFRZ7eb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4h2Qqtsx6nJ4/+ELLEnl4S4+5Q4ZxvOhL2V9fBJS0h3kWlzpBvbGoSRjSNibG7gro1Jw1OTMX08boGz5Zp4e3KiHLDYThoI2sPtcAN5S8Z90SzkLwD07XWjqEzHFtxCIGsyWzYaxmtmhEefZ8xMVlQl5gaweSK42nzH4wYpOoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ayTd/7fV; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4581f44b9b4so18464261cf.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726270997; x=1726875797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sb9UtIlLwG79dUWEaupctUHL7lQqw6cZ7frxycygKw=;
        b=ayTd/7fV8Sl+ixtJw6GODWunXJMp0eAsV8LtWDIgZuDU3lteKPTWHs+Yw96WclyS5q
         XfexBvAHfkBJaBxGdaAWvhxQYoObuf6CtyN9ZMASV7l7ifUjswTWExZycEbps2sGzQY8
         3K0zR6Moz5rS0V49j0UetlF6zjyDKpDiOCjNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726270997; x=1726875797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sb9UtIlLwG79dUWEaupctUHL7lQqw6cZ7frxycygKw=;
        b=UQnYI74gIMR8NezfE4DjP0dlv1bju15Yv6G4FQsZc4leSmJ33nQmd9ovqNDnXt98tO
         ACkqmKeLou/LJiSiO5Ssg6qLpnPYFHDnxyMf7jwHM2DGFLYY0Pvwk7+9plFj2hiRA0bj
         8nYSvlrS+AmmTxfPkB0d/kKZKh9C3SkeYQrGLQoGpdycPcEnCgXfi3BzDxQnZxD6KGHi
         p31iKLKUJyaPcAZtNKR9Jh70nGQ9GkzuooIpZax4AowuC2yjxAETOFjjnZvMbCInurF2
         jyoKBrv27lalwhpI+7sTxG3t3dS8mOfGx336PtANO1X1inWlZ0h6Tk085+kNmS/7ILQb
         xnDg==
X-Forwarded-Encrypted: i=1; AJvYcCUGr0Cj/v+yM+SP7h2iLhJEJ/EpHC/wcMDo8etpV2pt/H5nclhjq+RI/n26xVzQqN7f8N7ymj7KQkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0prQ7cWHfI/u8p90TB9F2aOIMBAGIyosZ06E+NNTGlXeQ+5K
	AQIOahel03QM8nQLdbnbTcXO9gEaeQdAOfx36CuqaxOu5lRabKX461JiU8LBGI6ko0O5oM0LyB0
	=
X-Google-Smtp-Source: AGHT+IGd3hjCwqhT8O0d3AMBoiqlBhjbY+qtnhNlrJ1YE3MpkYIQCQEoOyRB4WkHl0OWbkPPQb0Hzw==
X-Received: by 2002:a05:622a:1898:b0:446:4c0f:ef03 with SMTP id d75a77b69052e-458602bf78fmr147054331cf.10.1726270997158;
        Fri, 13 Sep 2024 16:43:17 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-459aad0293asm1334691cf.74.2024.09.13.16.43.16
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:43:16 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c34dd6c21aso20127786d6.2
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVx3p6aqAh+YGht4HkAfvhzvtXc1yfczkoCuobhDc+g0o9L97Hun8eTf2fMrGFYVtoSYxBof8AwXQU=@vger.kernel.org
X-Received: by 2002:a05:6214:4489:b0:6c5:1121:ab9d with SMTP id
 6a1803df08f44-6c573590a56mr132730356d6.49.1726270995740; Fri, 13 Sep 2024
 16:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-7-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
Message-ID: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a

s/probe. function/probe function./


> +static int i2c_of_probe_enable_node(struct device *dev, struct device_no=
de *node)
> +{
> +       int ret;
> +
> +       dev_info(dev, "Enabling %pOF\n", node);
> +
> +       struct of_changeset *ocs __free(kfree) =3D kzalloc(sizeof(*ocs), =
GFP_KERNEL);
> +       if (!ocs)
> +               return -ENOMEM;

I guess the kernel lets you mix code and declarations now? I'm still
used to all declarations being together but maybe I'm old school... I
would have put the "dev_info" below the allocation...


> +/**
> + * i2c_of_probe_component() - probe for devices of "type" on the same i2=
c bus
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages.
> + * @cfg: Pointer to the &struct i2c_of_probe_cfg containing callbacks an=
d other options
> + *       for the prober.
> + * @ctx: Context data for callbacks.
> + *
> + * Probe for possible I2C components of the same "type" (&i2c_of_probe_c=
fg->type)
> + * on the same I2C bus that have their status marked as "fail".

I may have missed it, but originally this was ones marked
"fail-needs-probe", right? Now it tries all types of fail?


> + * Assumes that across the entire device tree the only instances of node=
s
> + * prefixed with "type" are the ones that need handling for second sourc=
e
> + * components. In other words, if "type" is "touchscreen", then all devi=
ce
> + * nodes named "touchscreen*" are the ones that need probing. There cann=
ot

"touchscreen*" implies that it can have an arbitrary suffix. Can it?
...or can it just have a unit address?


> + * be another "touchscreen" node that is already enabled.
> + *
> + * Assumes that for each "type" of component, only one actually exists. =
In
> + * other words, only one matching and existing device will be enabled.
> + *
> + * Context: Process context only. Does non-atomic I2C transfers.
> + *          Should only be used from a driver probe function, as the fun=
ction
> + *          can return -EPROBE_DEFER if the I2C adapter or other resourc=
es
> + *          are unavailable.
> + * Return: 0 on success or no-op, error code otherwise.
> + *         A no-op can happen when it seems like the device tree already
> + *         has components of the type to be probed already enabled. This
> + *         can happen when the device tree had not been updated to mark
> + *         the status of the to-be-probed components as "fail". Or this
> + *         function was already run with the same parameters and succeed=
ed
> + *         in enabling a component. The latter could happen if the user

s/latter/later

> + *         had multiple types of components to probe, and one of them do=
wn
> + *         the list caused a deferred probe. This is expected behavior.
> + */
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe=
_cfg *cfg, void *ctx)
> +{
> +       const struct i2c_of_probe_ops *ops;
> +       const char *type;
> +       struct device_node *i2c_node;
> +       struct i2c_adapter *i2c;
> +       int ret;
> +
> +       if (!cfg)
> +               return -EINVAL;

Drop extra check of "!cfg". In general kernel conventions don't check
for NULL pointers passed by caller unless it's an expected case. You
don't check for a NULL "dev" and you shouldn't need to check for a
NULL "cfg". They are both simply required parameters.

There are a few other places in the patch series where it feels like
there are extra arg checks that aren't really needed...


> +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> +       type =3D cfg->type;
> +
> +       i2c_node =3D i2c_of_probe_get_i2c_node(dev, type);
> +       if (IS_ERR(i2c_node))
> +               return PTR_ERR(i2c_node);
> +
> +       for_each_child_of_node_with_prefix(i2c_node, node, type) {

I wouldn't object to a comment before this for loop:

/* If any devices of this type are already enabled then the function
is a noop */

...or it could be a helper function.


> +               if (!of_device_is_available(node))
> +                       continue;
> +
> +               /*
> +                * Device tree has component already enabled. Either the
> +                * device tree isn't supported or we already probed once.
> +                */
> +               ret =3D 0;
> +               goto out_put_i2c_node;
> +       }
> +
> +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> +       if (!i2c) {
> +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I=
2C adapter\n");
> +               goto out_put_i2c_node;
> +       }
> +
> +       /* Grab resources */
> +       ret =3D 0;
> +       if (ops->get_resources)
> +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> +       if (ret)
> +               goto out_put_i2c_adapter;
> +
> +       /* Enable resources */
> +       if (ops->enable)
> +               ret =3D ops->enable(dev, ctx);
> +       if (ret)
> +               goto out_release_resources;

I won't insist, but a part of me wonders whether we should just
combine "get_resources" and "enable" and then combine "cleanup" and
"free_resources_late". They are always paired one after another and
I'm having a hard time seeing why they need to be separate. It's not
like you'll ever get the resources and then enable/disable multiple
times.


> +/**
> + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> + *
> + * A set of callbacks to be used by i2c_of_probe_component().
> + *
> + * All callbacks are optional. Callbacks are called only once per run, a=
nd are
> + * used in the order they are defined in this structure.
> + *
> + * All callbacks that have return values shall return %0 on success,
> + * or a negative error number on failure.
> + *
> + * The @dev parameter passed to the callbacks is the same as @dev passed=
 to
> + * i2c_of_probe_component(). It should only be used for dev_printk() cal=
ls
> + * and nothing else, especially not managed device resource (devres) API=
s.
> + */
> +struct i2c_of_probe_ops {
> +       /** @get_resources: Retrieve resources for components. */
> +       int (*get_resources)(struct device *dev, struct device_node *bus_=
node, void *data);
> +
> +       /** @free_resources_early: Release exclusive resources prior to e=
nabling component. */
> +       void (*free_resources_early)(void *data);

It would be good if the doc here mentioned what happened if no
components were found and thus nothing was enabled. Is the function
still called? It looks like "no" and "cleanup" is in charge of
cleaning in this case. Feels like the docs need to be more explicit.

