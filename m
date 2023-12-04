Return-Path: <linux-i2c+bounces-602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664C802F54
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 10:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04801F21209
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 09:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158E01EB2B;
	Mon,  4 Dec 2023 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lyXC+0OW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26BDB6
	for <linux-i2c@vger.kernel.org>; Mon,  4 Dec 2023 01:53:09 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso1225937e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 04 Dec 2023 01:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701683588; x=1702288388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Sw2wDAzOyTaV2v/SIIuLpKBDgRQLTXxAh503/koeao=;
        b=lyXC+0OWwSrlAmVxlSwArqBL0StmlM39vOQFjnFsNxpL/2JVthEIVFx5RgMFL07Jrh
         sh6dlvZJdWkJCzPJfEPVMcVZAyv+i37X4+Yl+ZbLvaGQt56qfS7wmExZnpM2NVMthh/O
         VBt8kfRBsbcY0u1N3AzwL9rIfeClY4Q7tQlBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683588; x=1702288388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Sw2wDAzOyTaV2v/SIIuLpKBDgRQLTXxAh503/koeao=;
        b=Yr8xpZWEXVmVjEX5GyyL9fENjEiWUK19WoBMGD+qtXCGChQnHzo9aBsX5XzFN/Ftt6
         SPy+H+f6evyFQ4SLtdWkJsnljlQlN7GvrPHnYgUrlXPfcymJM8Xochl5wvDour1TttDI
         vNjBuGobGB1t9tPhCgjGpJjZnPk+MHLDlmGq3Da1HvjeeWp95ftuwlcc3nu09ihQ+mh1
         GWoEglT72pom+AUqtIyl56AvQqqVqtpuRVv6wyZudAhl5GBFH1DVpU4Nw+dkDlAKNNZy
         zeTyf5vD8zmXEWsvb789OwIHtm8fJcxfraKr/RRF55gTIhpSc4Oxp0xpevAl0E6CLh+B
         /mRQ==
X-Gm-Message-State: AOJu0YyjdyDxKtjdDBD74NqVFPAG55FZuANrqZcHrU0VKOh/jxUyUbEk
	3hLHsbYJHBTrMapaqzfbRSb9Wui8zsKdktU3rHhuTA==
X-Google-Smtp-Source: AGHT+IEvL8RaTWa1ZFgUIvfsRdBV2cbFeK4sFsWu03VMIj2v3E7mis/tTb/dszn6AyZzTF3YGJB7TmnmaHtaiyGOTzA=
X-Received: by 2002:a19:5f1c:0:b0:50b:f012:fd18 with SMTP id
 t28-20020a195f1c000000b0050bf012fd18mr1102680lfb.12.1701683587802; Mon, 04
 Dec 2023 01:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-3-wenst@chromium.org>
 <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
In-Reply-To: <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 17:52:36 +0800
Message-ID: <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
To: Doug Anderson <dianders@chromium.org>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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

On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -217,4 +217,114 @@ static int of_i2c_notify(struct notifier_block *n=
b, unsigned long action,
> >  struct notifier_block i2c_of_notifier =3D {
> >         .notifier_call =3D of_i2c_notify,
> >  };
> > +
> > +/*
> > + * Some devices, such as Google Hana Chromebooks, are produced by mult=
iple
> > + * vendors each using their preferred components. Such components are =
all
> > + * in the device tree. Instead of having all of them enabled and havin=
g each
> > + * driver separately try and probe its device while fighting over shar=
ed
> > + * resources, they can be marked as "fail-needs-probe" and have a prob=
er
> > + * figure out which one is actually used beforehand.
> > + *
> > + * This prober assumes such drop-in parts are on the same I2C bus, hav=
e
> > + * non-conflicting addresses, and can be directly probed by seeing whi=
ch
> > + * address responds.
> > + *
> > + * TODO:
> > + * - Support handling common regulators and GPIOs.
>
> IMO you should prototype how you're going to handle regulators and
> GPIOs before finalizing the design. I was going to write that you
> should just document that it was up to the caller to power things up
> before calling this function, but then I realized that the caller
> would have to duplicate much of this function in order to do so. In
> the very least they'd have to find the nodes of the relevant devices
> so that they could grab regulators and/or GPIOs. In order to avoid
> this duplication, would the design need to change? Perhaps this would
> be as simple as adding a callback function here that's called with all
> of the nodes before probing? If that's right, it would be nice to have
> that callback from the beginning so we don't need two variants of the
> function...

So I think I can prototype designs with one GPIO and multiple regulators,
assuming each node has the same number of both? At least they should if
they're on the same connector.

More than one GPIO probably means there are some ordering and timing
constraints, and won't be as generic.

> > + * - Support I2C muxes
> > + */
> > +
> > +/**
> > + * i2c_of_probe_component() - probe for devices of "type" on the same =
i2c bus
> > + * @dev: &struct device of the caller, only used for dev_* printk mess=
ages
> > + * @type: a string to match the device node name prefix to probe for
> > + *
> > + * Probe for possible I2C components of the same "type" on the same I2=
C bus
> > + * that have their status marked as "fail".
>
> Should document these current limitations with the code:
>
> * Assumes that across the entire device tree the only instances of
> nodes named "type" are ones we're trying to handle second sourcing
> for. In other words if we're searching for "touchscreen" then all
> nodes named "touchscreen" are ones that need to be probed.
>
> * Assumes that there is exactly one group of each "type". In other
> words, if we're searching for "touchscreen" then exactly one
> touchscreen will be enabled across the whole tree.
>
> Obviously those could be relaxed with more code, but that's the
> current limitation and it makes the code easier to understand with
> that context.

Done.

> > + */
> > +int i2c_of_probe_component(struct device *dev, const char *type)
> > +{
> > +       struct device_node *node, *i2c_node;
> > +       struct i2c_adapter *i2c;
> > +       struct of_changeset *ocs =3D NULL;
> > +       int ret;
> > +
> > +       node =3D of_find_node_by_name(NULL, type);
> > +       if (!node)
> > +               return dev_err_probe(dev, -ENODEV, "Could not find %s d=
evice node\n", type);
> > +
> > +       i2c_node =3D of_get_next_parent(node);
> > +       if (!of_node_name_eq(i2c_node, "i2c")) {
> > +               of_node_put(i2c_node);
> > +               return dev_err_probe(dev, -EINVAL, "%s device isn't on =
I2C bus\n", type);
> > +       }
>
> Personally I'd skip checking for the "i2c" node name. Just rely on
> of_get_i2c_adapter_by_node() returning an error.
>
> Oh, I guess you have this because you need to tell the difference
> between -EINVAL and -EPROBE_DEFER? It feels like instead you could use
> the firmware node to lookup a device more generically. If a device
> isn't associated with the node at all then you return -EPROBE_DEFER.
> Otherwise if it's associated but not an i2c device then you return
> -EINVAL. I guess maybe it doesn't make a huge difference, but it
> somehow feels less fragile than relying on the node name being "i2c".
> Maybe I just haven't had enough DT Kool-Aid.

The current way it's written is to do the device tree structure checks
first before doing any driver model access. Also it needs to tell
(as you mentioned later) if the i2c adapter is "disabled" or just not
probed yet.

> One thing this made me wonder is if of_get_i2c_adapter_by_node() is
> race free anyway. Can't that return you a device that hasn't finished
> probing yet? I see:
>
> - i2c_register_adapter()
> -- device_register()
> --- device_add()
> ---- bus_add_device()
> ---- bus_probe_device()
>
> As soon as bus_add_device() is called then it will be in
> "klist_devices" and I believe i2c_find_device_by_fwnode() will be able
> to find it. However, it hasn't necessarily been probed yet. I think
> that means calling i2c_smbus_xfer() on it might not work yet...

It does look like there's a small window between the device_register()
and when the i2c adapter is ready, i.e. can't bail out on an error.

I guess it needs either a flag or some reordering of the code.

It looks like Wolfram will be at OSS JP. I'll try and have a chat about
the whole thing.

> One last thing is that you should check to make sure that the i2c
> adapter is not marked "disabled". ...otherwise I think you'd end up
> constantly trying again and again...

Yeah. I added a check for that as well.

> > +       for_each_child_of_node(i2c_node, node) {
> > +               if (!of_node_name_prefix(node, type))
> > +                       continue;
> > +               if (of_device_is_available(node)) {
> > +                       /*
> > +                        * Device tree has component already enabled. E=
ither the
> > +                        * device tree isn't supported or we already pr=
obed once.
>
> I guess the "already probed once" is somewhat expected if more than
> one type of second source component is defined and we end up deferring
> the second one? We don't undo the resolution of the first one and
> probably don't keep track of the fact that it succeeded?

That's right.

> Probably should be added to the function comments that this is an
> expected/normal case?

Added to the Return: section of the kernel-doc.

> > +                        */
> > +                       of_node_put(node);
> > +                       of_node_put(i2c_node);
> > +                       return 0;
> > +               }
> > +       }
> > +
> > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > +       if (!i2c) {
> > +               of_node_put(i2c_node);
> > +               return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get =
I2C adapter\n");
> > +       }
> > +
> > +       ret =3D 0;
>
> Why init ret to 0?

It was requested by Andy. I believe the reason was having the initial
value used for bailout closer was better.

> > +       for_each_child_of_node(i2c_node, node) {
> > +               union i2c_smbus_data data;
> > +               u32 addr;
> > +
> > +               if (!of_node_name_prefix(node, type))
> > +                       continue;
> > +               if (of_property_read_u32(node, "reg", &addr))
> > +                       continue;
> > +               if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C=
_SMBUS_BYTE, &data) < 0)
>
> I'd be tempted to say that the caller should be able to pass in a
> function pointer here so they could use an alternative method to probe
> instead of i2c_smbus_xfer(), though you'd want to make it easy to
> default to i2c_smbus_xfer(). I could imagine someone might need a
> different way to probe. For instance if you had two touchscreens both
> at the same "reg" but that had different "hid-descr-addr" then this
> could be important.

I'd say the only specific probable type is hid-i2c. And that could be
generic enough that we could incorporate it here if we wanted. However
I think we want to keep the initial version a bit simpler.

> > +                       continue;
> > +
>
> Put the "break" right here. You've found the device and that was the
> point of the loop.

In its place we'd have an if (node) { <enable node> } block. I guess it
makes it easier to read still?

> Once you do that then the error handling makes a little more sense. It
> was weird that the error handling was jumped through from inside the
> loop...
>
>
> > +               dev_info(dev, "Enabling %pOF\n", node);
> > +
> > +               ocs =3D kzalloc(sizeof(*ocs), GFP_KERNEL);
> > +               if (!ocs) {
> > +                       ret =3D -ENOMEM;
> > +                       goto err_put_node;
>
> I think this error path (and some others) miss "i2c_put_adapter()" and
> "of_node_put(i2c_node)"

Right. I'll check.


Thanks
ChenYu

