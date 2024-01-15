Return-Path: <linux-i2c+bounces-1300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD8F82DCF9
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0571B1F21E19
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D38817BAA;
	Mon, 15 Jan 2024 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hxU0zzYP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BF71803D
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6dc8b280155so3367228a34.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 08:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705334801; x=1705939601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn+1e/OzTz/hbLFYJ8GtJcSKI9NgZJACZLMKDxTIsf0=;
        b=hxU0zzYPy+B8vxZLq4GLWqBEVn1tlWrZ4G8Z1VwF1+CAQqEXQSAw5QT3tT8di6d5a8
         +X+fyUOPu8w0TsHEGB4Mer5IpypKAvmj+JRkdqlU4chjcagJLW+/gjEmeaWdbZXrzv/J
         lknNVknvcR1mdyfZvAWyHKg/8OZE89r5nK2qj+jud524OBqTcSv48MNFudFkVidXSWCs
         ttLJQ7Mxd8KsCD+SLT0kjlwMEItspKxi4LA7s4w/RKKIEu+NlmwlbWlOfSmpi9KS2JUD
         1i6Fvd+qH6BL6VfGCJACL2/ZPpSGCQ+hsC9m/yxOvfXQowkCAs5oR8q9+Ve0wu7Hrw3R
         2jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334801; x=1705939601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn+1e/OzTz/hbLFYJ8GtJcSKI9NgZJACZLMKDxTIsf0=;
        b=AUj/gm6Evpen23Av8sgv8t8RNXszhDqPHiY08Tqs6qAY3unsf6XwEgW3xAxMnaRx5U
         DWsFRGiZc8rWaFStm0a7sdO8V2QklQy0SjVg+jraGhg8K30Vj9ikHwX+AZuVUIqccn06
         eHQzEWPU1IPYP7GuSt8D2nfwV1sq+O9nhtVsKjwxI0KxH+EKCfqZJTqgjp5DPukB8AXK
         vt8w7ghFin6ScS2pdHu2Isj+AwY6p3a0HsnmGputR55BGIxoaWmmWZPQBQB+mBkfdaW6
         9iEOK3+KmtXgXc6E63UkGMZTjyQqvLlBPn+ukYjbHKekPRqMxgLpEPi+ByBBzA9wM/IR
         JRpQ==
X-Gm-Message-State: AOJu0YxuHD/tktXSkBZhXuBjS4uCpxLJee+ydXlxv0IyEzePDms2TZ3M
	1PuU8gXOM/JX6hZZEDzWDcW1jongKJwThO1KcCfHmO0cdGeKjw==
X-Google-Smtp-Source: AGHT+IHEcfJFAmuje7OgZUgxOXcY1Caf4X30rrKq/sFIMdn0BQ0zgmZIDD+ZRKPIMSDfKFVI2f+w1X4CKdh7lo3T8LA=
X-Received: by 2002:a05:6870:9707:b0:206:de00:b86a with SMTP id
 n7-20020a056870970700b00206de00b86amr1350537oaq.38.1705334801632; Mon, 15 Jan
 2024 08:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org> <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 17:06:30 +0100
Message-ID: <CAMRc=MdcCZP5kgv7JBdy2m_naNbTSeq4MDE_3mk+1-5UD4ntwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 5:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Devices sharing a reset GPIO could use the reset framework for
> coordinated handling of that shared GPIO line.  We have several cases of
> such needs, at least for Devicetree-based platforms.
>
> If Devicetree-based device requests a reset line, while "resets"
> Devicetree property is missing but there is a "reset-gpios" one,
> instantiate a new "reset-gpio" platform device which will handle such
> reset line.  This allows seamless handling of such shared reset-gpios
> without need of changing Devicetree binding [1].
>
> To avoid creating multiple "reset-gpio" platform devices, store the
> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
> controller, GPIO number and GPIO flags) is used to check if reset
> controller for given GPIO was already registered.
>
> If two devices have conflicting "reset-gpios" property, e.g. with
> different ACTIVE_xxx flags, this would allow to spawn two separate
> "reset-gpio" devices, where the second would fail probing on busy GPIO
> request.
>
> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1=
]
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/reset/core.c             | 227 +++++++++++++++++++++++++++++--
>  include/linux/reset-controller.h |   4 +
>  2 files changed, 217 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 4d5a78d3c085..86e33a703ad2 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -10,9 +10,13 @@
>  #include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/kref.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/idr.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/acpi.h>
> +#include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
> @@ -23,6 +27,11 @@ static LIST_HEAD(reset_controller_list);
>  static DEFINE_MUTEX(reset_lookup_mutex);
>  static LIST_HEAD(reset_lookup_list);
>
> +/* Protects reset_gpio_lookup_list */
> +static DEFINE_MUTEX(reset_gpio_lookup_mutex);
> +static LIST_HEAD(reset_gpio_lookup_list);
> +static DEFINE_IDA(reset_gpio_ida);
> +
>  /**
>   * struct reset_control - a reset control
>   * @rcdev: a pointer to the reset controller device
> @@ -63,6 +72,16 @@ struct reset_control_array {
>         struct reset_control *rstc[] __counted_by(num_rstcs);
>  };
>
> +/**
> + * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio d=
evices
> + * @of_args: phandle to the reset controller with all the args like GPIO=
 number
> + * @list: list entry for the reset_gpio_lookup_list
> + */
> +struct reset_gpio_lookup {
> +       struct of_phandle_args of_args;
> +       struct list_head list;
> +};
> +
>  static const char *rcdev_name(struct reset_controller_dev *rcdev)
>  {
>         if (rcdev->dev)
> @@ -813,13 +832,183 @@ static void __reset_control_put_internal(struct re=
set_control *rstc)
>         kref_put(&rstc->refcnt, __reset_control_release);
>  }
>
> +static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
> +                                    const struct of_phandle_args *a2)
> +{
> +       unsigned int i;
> +
> +       if (!a2)
> +               return false;
> +
> +       if (a1->args_count !=3D a2->args_count)
> +               return false;
> +
> +       for (i =3D 0; i < a1->args_count; i++)
> +               if (a1->args[i] !=3D a2->args[i])
> +                       return false;
> +
> +       return true;
> +}
> +
> +static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
> +                                        unsigned int gpio,
> +                                        unsigned int of_flags)
> +{
> +       struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
> +       struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> +       char *label __free(kfree) =3D NULL;

I got yelled at by Linus Torvalds personally for doing it like this. I
know this is a common pattern in code using GLib but Linus wants auto
variables to be initialized where they're declared...

> +       unsigned int lookup_flags;
> +
> +       /*
> +        * Later we map GPIO flags between OF and Linux, however not all
> +        * constants from include/dt-bindings/gpio/gpio.h and
> +        * include/linux/gpio/machine.h match each other.
> +        */
> +       if (of_flags > GPIO_ACTIVE_LOW) {
> +               pr_err("reset-gpio code does not support GPIO flags %u fo=
r GPIO %u\n",
> +                       of_flags, gpio);
> +               return -EINVAL;
> +       }
> +
> +       gdev =3D gpio_device_find_by_fwnode(of_fwnode_handle(np));

... so this should become:

  struct gpio_device *gdev __free(gpio_device_put) =3D gpio_device_find(...=
)

and same for the rest.

Don't get me wrong, I love cleanup.h but there's a (unofficial for
now) coding style.

> +       if (!gdev)
> +               return -EPROBE_DEFER;
> +
> +       label =3D kstrdup(gpio_device_get_label(gdev), GFP_KERNEL);
> +       if (!label)
> +               return -EINVAL;
> +
> +       /* Size: one lookup entry plus sentinel */
> +       lookup =3D kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
> +       if (!lookup)
> +               return -ENOMEM;
> +
> +       lookup->dev_id =3D kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
> +       if (!lookup->dev_id)
> +               return -ENOMEM;
> +
> +       lookup_flags =3D GPIO_PERSISTENT;
> +       lookup_flags |=3D of_flags & GPIO_ACTIVE_LOW;
> +       lookup->table[0] =3D GPIO_LOOKUP(no_free_ptr(label), gpio, "reset=
",
> +                                      lookup_flags);
> +
> +       gpiod_add_lookup_table(no_free_ptr(lookup));

You told me that this doesn't need to be removed or ever freed but a
comment on that would be in order.

> +
> +       return 0;
> +}
> +
> +/*
> + * @reset_args:        phandle to the GPIO provider with all the args li=
ke GPIO number
> + */
> +static int __reset_add_reset_gpio_device(const struct of_phandle_args *a=
rgs)
> +{
> +       struct reset_gpio_lookup *rgpio_dev;
> +       struct platform_device *pdev;
> +       int id, ret;
> +
> +       /*
> +        * Registering reset-gpio device might cause immediate
> +        * bind, resulting in its probe() registering new reset controlle=
r thus
> +        * taking reset_list_mutex lock via reset_controller_register().
> +        */
> +       lockdep_assert_not_held(&reset_list_mutex);

So how does dumping the stack help here exactly?

> +
> +       mutex_lock(&reset_gpio_lookup_mutex);
> +
> +       list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
> +               if (args->np =3D=3D rgpio_dev->of_args.np) {
> +                       if (__reset_gpios_args_match(args, &rgpio_dev->of=
_args))
> +                               goto out; /* Already on the list, done */
> +               }
> +       }
> +
> +       id =3D ida_alloc(&reset_gpio_ida, GFP_KERNEL);
> +       if (id < 0) {
> +               ret =3D id;
> +               goto err_unlock;
> +       }
> +
> +       /*
> +        * Not freed in normal path, persisent subsystem data (which is a=
ssumed
> +        * also in the reset-gpio driver).
> +        */
> +       rgpio_dev =3D kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
> +       if (!rgpio_dev) {
> +               ret =3D -ENOMEM;
> +               goto err_ida_free;
> +       }
> +
> +       ret =3D __reset_add_reset_gpio_lookup(id, args->np, args->args[0]=
,
> +                                           args->args[1]);
> +       if (ret < 0)
> +               goto err_kfree;
> +
> +       rgpio_dev->of_args =3D *args;
> +       /*
> +        * We keep the device_node reference, but of_args.np is put at th=
e end
> +        * of __of_reset_control_get(), so get it one more time.
> +        * Hold reference as long as rgpio_dev memory is valid.
> +        */
> +       of_node_get(rgpio_dev->of_args.np);
> +       pdev =3D platform_device_register_data(NULL, "reset-gpio", id,
> +                                            &rgpio_dev->of_args,
> +                                            sizeof(rgpio_dev->of_args));
> +       ret =3D PTR_ERR_OR_ZERO(pdev);
> +       if (ret)
> +               goto err_put;
> +
> +       list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
> +
> +out:
> +       mutex_unlock(&reset_gpio_lookup_mutex);
> +
> +       return 0;
> +
> +err_put:
> +       of_node_put(rgpio_dev->of_args.np);
> +err_kfree:
> +       kfree(rgpio_dev);
> +err_ida_free:
> +       ida_free(&reset_gpio_ida, id);
> +err_unlock:
> +       mutex_unlock(&reset_gpio_lookup_mutex);
> +

You're already using cleanup helpers above, why not here too? Would
make this function much more readable and allow you to drop all but
the ida_free() here. Possibly you'd need to define the __free()
callback for of_node_put() though.

> +       return ret;
> +}
> +
> +static struct reset_controller_dev *__reset_find_rcdev(const struct of_p=
handle_args *args,
> +                                                      bool gpio_fallback=
)
> +{
> +       struct reset_controller_dev *r, *rcdev;
> +
> +       lockdep_assert_held(&reset_list_mutex);
> +
> +       rcdev =3D NULL;
> +       list_for_each_entry(r, &reset_controller_list, list) {
> +               if (args->np =3D=3D r->of_node) {
> +                       if (gpio_fallback) {
> +                               if (__reset_gpios_args_match(args, r->of_=
args)) {
> +                                       rcdev =3D r;
> +                                       break;
> +                               }
> +                       } else {
> +                               rcdev =3D r;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       return rcdev;
> +}
> +
>  struct reset_control *
>  __of_reset_control_get(struct device_node *node, const char *id, int ind=
ex,
>                        bool shared, bool optional, bool acquired)
>  {
> +       struct of_phandle_args args =3D {0};
> +       bool gpio_fallback =3D false;
>         struct reset_control *rstc;
> -       struct reset_controller_dev *r, *rcdev;
> -       struct of_phandle_args args;
> +       struct reset_controller_dev *rcdev;
>         int rstc_id;
>         int ret;
>
> @@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, c=
onst char *id, int index,
>                                          index, &args);
>         if (ret =3D=3D -EINVAL)
>                 return ERR_PTR(ret);
> -       if (ret)
> -               return optional ? NULL : ERR_PTR(ret);
> +       if (ret) {
> +               /*
> +                * There can be only one reset-gpio for regular devices, =
so
> +                * don't bother with GPIO index.
> +                */
> +               ret =3D of_parse_phandle_with_args(node, "reset-gpios", "=
#gpio-cells",
> +                                                0, &args);
> +               if (ret)
> +                       return optional ? NULL : ERR_PTR(ret);
>
> -       mutex_lock(&reset_list_mutex);
> -       rcdev =3D NULL;
> -       list_for_each_entry(r, &reset_controller_list, list) {
> -               if (args.np =3D=3D r->of_node) {
> -                       rcdev =3D r;
> -                       break;
> +               gpio_fallback =3D true;
> +
> +               ret =3D __reset_add_reset_gpio_device(&args);
> +               if (ret) {
> +                       rstc =3D ERR_PTR(ret);
> +                       goto out_put;
>                 }
>         }
>
> +       mutex_lock(&reset_list_mutex);
> +       rcdev =3D __reset_find_rcdev(&args, gpio_fallback);
>         if (!rcdev) {
>                 rstc =3D ERR_PTR(-EPROBE_DEFER);
> -               goto out;
> +               goto out_unlock;
>         }
>
>         if (WARN_ON(args.args_count !=3D rcdev->of_reset_n_cells)) {
>                 rstc =3D ERR_PTR(-EINVAL);
> -               goto out;
> +               goto out_unlock;
>         }
>
>         rstc_id =3D rcdev->of_xlate(rcdev, &args);
>         if (rstc_id < 0) {
>                 rstc =3D ERR_PTR(rstc_id);
> -               goto out;
> +               goto out_unlock;
>         }
>
>         /* reset_list_mutex also protects the rcdev's reset_control list =
*/
>         rstc =3D __reset_control_get_internal(rcdev, rstc_id, shared, acq=
uired);
>
> -out:
> +out_unlock:
>         mutex_unlock(&reset_list_mutex);
> +out_put:
>         of_node_put(args.np);

I suggest reworking this to use cleanup.h as well.

Bartosz

>
>         return rstc;
> diff --git a/include/linux/reset-controller.h b/include/linux/reset-contr=
oller.h
> index 0fa4f60e1186..e064473215de 100644
> --- a/include/linux/reset-controller.h
> +++ b/include/linux/reset-controller.h
> @@ -61,6 +61,9 @@ struct reset_control_lookup {
>   * @dev: corresponding driver model device struct
>   * @of_node: corresponding device tree node as phandle target
>   * @of_reset_n_cells: number of cells in reset line specifiers
> + * TODO: of_args have of_node, so we have here duplication
> + * @of_args: for reset-gpios controllers: corresponding phandle args wit=
h GPIO
> + *           number complementing of_node
>   * @of_xlate: translation function to translate from specifier as found =
in the
>   *            device tree to id as given to the reset control ops, defau=
lts
>   *            to :c:func:`of_reset_simple_xlate`.
> @@ -74,6 +77,7 @@ struct reset_controller_dev {
>         struct device *dev;
>         struct device_node *of_node;
>         int of_reset_n_cells;
> +       const struct of_phandle_args *of_args;
>         int (*of_xlate)(struct reset_controller_dev *rcdev,
>                         const struct of_phandle_args *reset_spec);
>         unsigned int nr_resets;
> --
> 2.34.1
>

