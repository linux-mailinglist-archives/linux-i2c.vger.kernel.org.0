Return-Path: <linux-i2c+bounces-1317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A61482DE05
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEBFB2822A8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247FB17C7C;
	Mon, 15 Jan 2024 16:56:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472E017C62
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQFY-00024V-3M; Mon, 15 Jan 2024 17:55:48 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQFU-0003aU-Od; Mon, 15 Jan 2024 17:55:44 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQFU-0008va-2C;
	Mon, 15 Jan 2024 17:55:44 +0100
Message-ID: <568dc713f0c2fa29e5ba7b25c2d1d0e2be96fa95.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>,  Takashi
 Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Sean Anderson <sean.anderson@seco.com>
Date: Mon, 15 Jan 2024 17:55:44 +0100
In-Reply-To: <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
[...]
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 4d5a78d3c085..86e33a703ad2 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
[...]
> @@ -813,13 +832,183 @@ static void __reset_control_put_internal(struct re=
set_control *rstc)
>  	kref_put(&rstc->refcnt, __reset_control_release);
>  }
> =20
> +static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
> +				     const struct of_phandle_args *a2)
> +{
> +	unsigned int i;
> +
> +	if (!a2)
> +		return false;
> +
> +	if (a1->args_count !=3D a2->args_count)
> +		return false;
> +
> +	for (i =3D 0; i < a1->args_count; i++)
> +		if (a1->args[i] !=3D a2->args[i])
> +			return false;
> +
> +	return true;
> +}

How about making this

	return a2 &&
	       a1->np =3D=3D a2->np &&
	       a1->args_count =3D=3D a2->args_count &&
	       !memcmp(a1->args, a2->args, sizeof(a1->args[0]) * a1->args_count);

?

There's similar code in include/linux/cpufreq.h, maybe this could later
be lifted into a common of_phandle_args_equal().

> +
> +static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
> +					 unsigned int gpio,
> +					 unsigned int of_flags)
> +{
> +	struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
> +	struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> +	char *label __free(kfree) =3D NULL;
> +	unsigned int lookup_flags;
> +
> +	/*
> +	 * Later we map GPIO flags between OF and Linux, however not all
> +	 * constants from include/dt-bindings/gpio/gpio.h and
> +	 * include/linux/gpio/machine.h match each other.
> +	 */
> +	if (of_flags > GPIO_ACTIVE_LOW) {
> +		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
> +			of_flags, gpio);
> +		return -EINVAL;
> +	}
> +
> +	gdev =3D gpio_device_find_by_fwnode(of_fwnode_handle(np));
> +	if (!gdev)
> +		return -EPROBE_DEFER;
> +
> +	label =3D kstrdup(gpio_device_get_label(gdev), GFP_KERNEL);
> +	if (!label)
> +		return -EINVAL;

The kstrdup() failure looks like it should be -ENOMEM to me.
I'd check the gpio_device_get_label(gdev) return value separately.

Is this going to be in v6.8-rc1, or does using gpio_device_get_label()
introduce a dependency?

> +
> +	/* Size: one lookup entry plus sentinel */
> +	lookup =3D kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
> +	if (!lookup)
> +		return -ENOMEM;
> +
> +	lookup->dev_id =3D kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
> +	if (!lookup->dev_id)
> +		return -ENOMEM;
> +
> +	lookup_flags =3D GPIO_PERSISTENT;
> +	lookup_flags |=3D of_flags & GPIO_ACTIVE_LOW;
> +	lookup->table[0] =3D GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
> +				       lookup_flags);
> +
> +	gpiod_add_lookup_table(no_free_ptr(lookup));
> +
> +	return 0;
> +}
> +
> +/*
> + * @reset_args:	phandle to the GPIO provider with all the args like GPIO=
 number

s/reset_//

> + */
> +static int __reset_add_reset_gpio_device(const struct of_phandle_args *a=
rgs)
> +{
> +	struct reset_gpio_lookup *rgpio_dev;
> +	struct platform_device *pdev;
> +	int id, ret;
> +
> +	/*
> +	 * Registering reset-gpio device might cause immediate
> +	 * bind, resulting in its probe() registering new reset controller thus
> +	 * taking reset_list_mutex lock via reset_controller_register().
> +	 */
> +	lockdep_assert_not_held(&reset_list_mutex);
> +
> +	mutex_lock(&reset_gpio_lookup_mutex);
> +
> +	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
> +		if (args->np =3D=3D rgpio_dev->of_args.np) {
> +			if (__reset_gpios_args_match(args, &rgpio_dev->of_args))
> +				goto out; /* Already on the list, done */
> +		}
> +	}
> +
> +	id =3D ida_alloc(&reset_gpio_ida, GFP_KERNEL);
> +	if (id < 0) {
> +		ret =3D id;
> +		goto err_unlock;
> +	}
> +
> +	/*
> +	 * Not freed in normal path, persisent subsystem data (which is assumed
> +	 * also in the reset-gpio driver).
> +	 */
> +	rgpio_dev =3D kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
> +	if (!rgpio_dev) {
> +		ret =3D -ENOMEM;
> +		goto err_ida_free;
> +	}
> +
> +	ret =3D __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
> +					    args->args[1]);
> +	if (ret < 0)
> +		goto err_kfree;
> +
> +	rgpio_dev->of_args =3D *args;
> +	/*
> +	 * We keep the device_node reference, but of_args.np is put at the end
> +	 * of __of_reset_control_get(), so get it one more time.
> +	 * Hold reference as long as rgpio_dev memory is valid.
> +	 */
> +	of_node_get(rgpio_dev->of_args.np);
> +	pdev =3D platform_device_register_data(NULL, "reset-gpio", id,
> +					     &rgpio_dev->of_args,
> +					     sizeof(rgpio_dev->of_args));
> +	ret =3D PTR_ERR_OR_ZERO(pdev);
> +	if (ret)
> +		goto err_put;
> +
> +	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
> +
> +out:
> +	mutex_unlock(&reset_gpio_lookup_mutex);
> +
> +	return 0;
> +
> +err_put:
> +	of_node_put(rgpio_dev->of_args.np);
> +err_kfree:
> +	kfree(rgpio_dev);
> +err_ida_free:
> +	ida_free(&reset_gpio_ida, id);
> +err_unlock:
> +	mutex_unlock(&reset_gpio_lookup_mutex);
> +
> +	return ret;
> +}
> +
> +static struct reset_controller_dev *__reset_find_rcdev(const struct of_p=
handle_args *args,
> +						       bool gpio_fallback)
> +{
> +	struct reset_controller_dev *r, *rcdev;

Now that this is moved into a function, there's no need for the r,
rcdev split anymore. Just return a match when found, and NULL at the
end:

	struct reset_controller_dev *rcdev;

> +
> +	lockdep_assert_held(&reset_list_mutex);
> +
> +	rcdev =3D NULL;
> +	list_for_each_entry(r, &reset_controller_list, list) {

	list_for_each_entry(rcdev, &reset_controller_list, list) {

> +		if (args->np =3D=3D r->of_node) {
> +			if (gpio_fallback) {
> +				if (__reset_gpios_args_match(args, r->of_args)) {
> +					rcdev =3D r;
> +					break;

					return rcdev;

> +				}
> +			} else {
> +				rcdev =3D r;
> +				break;
> +			}
> +		}

With the np check moved into __reset_gpios_args_match() above, the
whole loop could be turned into:

		if (gpio_fallback) {
			if (__reset_gpios_args_match(args, rcdev->of_args))
				return rcdev;
		} else {
			if (args->np =3D=3D rcdev->of_node)
				return rcdev;
		}

Explicitly checking against rcdev->of_args->np instead of rcdev-
>of_node in gpio_fallback mode could avoid false positives in case
anybody ever creates a combined GPIO and reset controller device and
then uses its GPIOs to drive a shared reset line..

> +	}
> +
> +	return rcdev;

	return NULL;

> +}
>=20
>  struct reset_control *
>  __of_reset_control_get(struct device_node *node, const char *id, int ind=
ex,
>  		       bool shared, bool optional, bool acquired)
>  {
> +	struct of_phandle_args args =3D {0};

Is this still needed?

> +	bool gpio_fallback =3D false;
>  	struct reset_control *rstc;
> -	struct reset_controller_dev *r, *rcdev;
> -	struct of_phandle_args args;
> +	struct reset_controller_dev *rcdev;
>  	int rstc_id;
>  	int ret;
> =20
> @@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, c=
onst char *id, int index,
>  					 index, &args);
>  	if (ret =3D=3D -EINVAL)
>  		return ERR_PTR(ret);
> -	if (ret)
> -		return optional ? NULL : ERR_PTR(ret);
> +	if (ret) {
> +		/*
> +		 * There can be only one reset-gpio for regular devices, so
> +		 * don't bother with GPIO index.
> +		 */
> +		ret =3D of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
> +						 0, &args);
> +		if (ret)
> +			return optional ? NULL : ERR_PTR(ret);
> =20
> -	mutex_lock(&reset_list_mutex);
> -	rcdev =3D NULL;
> -	list_for_each_entry(r, &reset_controller_list, list) {
> -		if (args.np =3D=3D r->of_node) {
> -			rcdev =3D r;
> -			break;
> +		gpio_fallback =3D true;
> +
> +		ret =3D __reset_add_reset_gpio_device(&args);
> +		if (ret) {
> +			rstc =3D ERR_PTR(ret);
> +			goto out_put;
>  		}
>  	}
> =20
> +	mutex_lock(&reset_list_mutex);
> +	rcdev =3D __reset_find_rcdev(&args, gpio_fallback);
>  	if (!rcdev) {
>  		rstc =3D ERR_PTR(-EPROBE_DEFER);
> -		goto out;
> +		goto out_unlock;
>  	}
> =20
>  	if (WARN_ON(args.args_count !=3D rcdev->of_reset_n_cells)) {

Nice. I like that the __of_reset_control_get() changes are much less
invasive now.

>  		rstc =3D ERR_PTR(-EINVAL);
> -		goto out;
> +		goto out_unlock;
>  	}
> =20
>  	rstc_id =3D rcdev->of_xlate(rcdev, &args);
>  	if (rstc_id < 0) {
>  		rstc =3D ERR_PTR(rstc_id);
> -		goto out;
> +		goto out_unlock;
>  	}
> =20
>  	/* reset_list_mutex also protects the rcdev's reset_control list */
>  	rstc =3D __reset_control_get_internal(rcdev, rstc_id, shared, acquired)=
;
> =20
> -out:
> +out_unlock:
>  	mutex_unlock(&reset_list_mutex);
> +out_put:
>  	of_node_put(args.np);
> =20
>  	return rstc;
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

Any plans what to do about this? With the above changes we could
mandate that either of_node or of_args should be set, never both.

> + * @of_args: for reset-gpios controllers: corresponding phandle args wit=
h GPIO
> + *           number complementing of_node

regards
Philipp

