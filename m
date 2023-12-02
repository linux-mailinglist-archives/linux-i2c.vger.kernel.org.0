Return-Path: <linux-i2c+bounces-580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9A801933
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 01:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47FF1C20ADF
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 00:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E8415A6;
	Sat,  2 Dec 2023 00:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KZoHgnbA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C792B6
	for <linux-i2c@vger.kernel.org>; Fri,  1 Dec 2023 16:58:27 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so3562234a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 16:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478703; x=1702083503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKk2QY55EMuNywXUGLdjHFZJLlzFp5Dzqbm5yWnIGpQ=;
        b=KZoHgnbAYrmfGylTXdetO4r6HtTVSbnw+M3qMFWd14D2XkbnOU9RCngnahTk41vsPI
         fQAde/HZrXItEdX+7u6zIbkqI1Ti7GlBIwfzkEQ+Ckym+UlrlDBUfWcBANJPQoIgSH0V
         56M3u4Ejm+EPBvTGLc6Jikpr1lItlntNcBzBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478703; x=1702083503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKk2QY55EMuNywXUGLdjHFZJLlzFp5Dzqbm5yWnIGpQ=;
        b=l64Lmf0Y6a3Nr7csayQCpBLyslCIVqCjO5LxRypLczAp3bU6LMkHTnzazwsydtw2J5
         oVFdNwPZBlM2Psywxm55c7pYeP61ASAsFdOTgLzx3e7v8PrepQNU54NylOR33M905qzD
         ZcRDa+U3sBKQdV2oU3y2YWVPzLfeN0oIrhE/qAATu/9cfm0Y+JstFnB3bMxZ702TQLrU
         JHUEhiTVetwGwtWdeQz/h3U0pmDDEBy2wzpOIjaymdduGYhqAMA6kK0T37aJxaUIkTBo
         H3/+yzXKW+/LsDuzMt88ScLg77LXwLAjdAejZzKGYnSGJi0R0gHp1EfT0+Zw2bLqCIeK
         uAcA==
X-Gm-Message-State: AOJu0YwlqxBtkZ6EJFzQgpBYrAxtGJSqn503LCHLEyDnnXX+USuqpgr8
	o3UHdbLCuFhlHT+jYHsCZpFftqUEqqLclq5wqITurhnj
X-Google-Smtp-Source: AGHT+IEVnsnJMG0OL/AhuVoRCGO5waqg9J+4xJssc2A6IevR+C5JfE5FEblNXRn6Gj7Vf8SkaugIWw==
X-Received: by 2002:aa7:cd69:0:b0:54c:4837:9aa6 with SMTP id ca9-20020aa7cd69000000b0054c48379aa6mr1134959edb.77.1701478703694;
        Fri, 01 Dec 2023 16:58:23 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id eg54-20020a05640228b600b0054c65a154d5sm801940edb.90.2023.12.01.16.58.23
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:58:23 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40b35199f94so27445e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 16:58:23 -0800 (PST)
X-Received: by 2002:a7b:c4c6:0:b0:40b:3d89:ba70 with SMTP id
 g6-20020a7bc4c6000000b0040b3d89ba70mr237078wmk.7.1701478681940; Fri, 01 Dec
 2023 16:58:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-3-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-3-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:57:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
Message-ID: <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -217,4 +217,114 @@ static int of_i2c_notify(struct notifier_block *nb,=
 unsigned long action,
>  struct notifier_block i2c_of_notifier =3D {
>         .notifier_call =3D of_i2c_notify,
>  };
> +
> +/*
> + * Some devices, such as Google Hana Chromebooks, are produced by multip=
le
> + * vendors each using their preferred components. Such components are al=
l
> + * in the device tree. Instead of having all of them enabled and having =
each
> + * driver separately try and probe its device while fighting over shared
> + * resources, they can be marked as "fail-needs-probe" and have a prober
> + * figure out which one is actually used beforehand.
> + *
> + * This prober assumes such drop-in parts are on the same I2C bus, have
> + * non-conflicting addresses, and can be directly probed by seeing which
> + * address responds.
> + *
> + * TODO:
> + * - Support handling common regulators and GPIOs.

IMO you should prototype how you're going to handle regulators and
GPIOs before finalizing the design. I was going to write that you
should just document that it was up to the caller to power things up
before calling this function, but then I realized that the caller
would have to duplicate much of this function in order to do so. In
the very least they'd have to find the nodes of the relevant devices
so that they could grab regulators and/or GPIOs. In order to avoid
this duplication, would the design need to change? Perhaps this would
be as simple as adding a callback function here that's called with all
of the nodes before probing? If that's right, it would be nice to have
that callback from the beginning so we don't need two variants of the
function...

> + * - Support I2C muxes
> + */
> +
> +/**
> + * i2c_of_probe_component() - probe for devices of "type" on the same i2=
c bus
> + * @dev: &struct device of the caller, only used for dev_* printk messag=
es
> + * @type: a string to match the device node name prefix to probe for
> + *
> + * Probe for possible I2C components of the same "type" on the same I2C =
bus
> + * that have their status marked as "fail".

Should document these current limitations with the code:

* Assumes that across the entire device tree the only instances of
nodes named "type" are ones we're trying to handle second sourcing
for. In other words if we're searching for "touchscreen" then all
nodes named "touchscreen" are ones that need to be probed.

* Assumes that there is exactly one group of each "type". In other
words, if we're searching for "touchscreen" then exactly one
touchscreen will be enabled across the whole tree.

Obviously those could be relaxed with more code, but that's the
current limitation and it makes the code easier to understand with
that context.


> + */
> +int i2c_of_probe_component(struct device *dev, const char *type)
> +{
> +       struct device_node *node, *i2c_node;
> +       struct i2c_adapter *i2c;
> +       struct of_changeset *ocs =3D NULL;
> +       int ret;
> +
> +       node =3D of_find_node_by_name(NULL, type);
> +       if (!node)
> +               return dev_err_probe(dev, -ENODEV, "Could not find %s dev=
ice node\n", type);
> +
> +       i2c_node =3D of_get_next_parent(node);
> +       if (!of_node_name_eq(i2c_node, "i2c")) {
> +               of_node_put(i2c_node);
> +               return dev_err_probe(dev, -EINVAL, "%s device isn't on I2=
C bus\n", type);
> +       }

Personally I'd skip checking for the "i2c" node name. Just rely on
of_get_i2c_adapter_by_node() returning an error.

Oh, I guess you have this because you need to tell the difference
between -EINVAL and -EPROBE_DEFER? It feels like instead you could use
the firmware node to lookup a device more generically. If a device
isn't associated with the node at all then you return -EPROBE_DEFER.
Otherwise if it's associated but not an i2c device then you return
-EINVAL. I guess maybe it doesn't make a huge difference, but it
somehow feels less fragile than relying on the node name being "i2c".
Maybe I just haven't had enough DT Kool-Aid.

One thing this made me wonder is if of_get_i2c_adapter_by_node() is
race free anyway. Can't that return you a device that hasn't finished
probing yet? I see:

- i2c_register_adapter()
-- device_register()
--- device_add()
---- bus_add_device()
---- bus_probe_device()

As soon as bus_add_device() is called then it will be in
"klist_devices" and I believe i2c_find_device_by_fwnode() will be able
to find it. However, it hasn't necessarily been probed yet. I think
that means calling i2c_smbus_xfer() on it might not work yet...


One last thing is that you should check to make sure that the i2c
adapter is not marked "disabled". ...otherwise I think you'd end up
constantly trying again and again...


> +       for_each_child_of_node(i2c_node, node) {
> +               if (!of_node_name_prefix(node, type))
> +                       continue;
> +               if (of_device_is_available(node)) {
> +                       /*
> +                        * Device tree has component already enabled. Eit=
her the
> +                        * device tree isn't supported or we already prob=
ed once.

I guess the "already probed once" is somewhat expected if more than
one type of second source component is defined and we end up deferring
the second one? We don't undo the resolution of the first one and
probably don't keep track of the fact that it succeeded?

Probably should be added to the function comments that this is an
expected/normal case?


> +                        */
> +                       of_node_put(node);
> +                       of_node_put(i2c_node);
> +                       return 0;
> +               }
> +       }
> +
> +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> +       if (!i2c) {
> +               of_node_put(i2c_node);
> +               return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2=
C adapter\n");
> +       }
> +
> +       ret =3D 0;

Why init ret to 0?


> +       for_each_child_of_node(i2c_node, node) {
> +               union i2c_smbus_data data;
> +               u32 addr;
> +
> +               if (!of_node_name_prefix(node, type))
> +                       continue;
> +               if (of_property_read_u32(node, "reg", &addr))
> +                       continue;
> +               if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_S=
MBUS_BYTE, &data) < 0)

I'd be tempted to say that the caller should be able to pass in a
function pointer here so they could use an alternative method to probe
instead of i2c_smbus_xfer(), though you'd want to make it easy to
default to i2c_smbus_xfer(). I could imagine someone might need a
different way to probe. For instance if you had two touchscreens both
at the same "reg" but that had different "hid-descr-addr" then this
could be important.


> +                       continue;
> +

Put the "break" right here. You've found the device and that was the
point of the loop.

Once you do that then the error handling makes a little more sense. It
was weird that the error handling was jumped through from inside the
loop...


> +               dev_info(dev, "Enabling %pOF\n", node);
> +
> +               ocs =3D kzalloc(sizeof(*ocs), GFP_KERNEL);
> +               if (!ocs) {
> +                       ret =3D -ENOMEM;
> +                       goto err_put_node;

I think this error path (and some others) miss "i2c_put_adapter()" and
"of_node_put(i2c_node)"

