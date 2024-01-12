Return-Path: <linux-i2c+bounces-1276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8F82C3A8
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 17:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6B2F2839E7
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 16:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7952077F0A;
	Fri, 12 Jan 2024 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WFMKF70M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2076917
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3367a304091so5596966f8f.3
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 08:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077384; x=1705682184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyDDK8wz61UD70/QcPoYFZCJBphOvhD/N3TrrEWzs04=;
        b=WFMKF70MQdvbpCQNxtFCRG4HC2JPJ+F8sKSGod/UI3nSLF7tQW4qLRgcGPw7x/OVeX
         0+/dwlkJCWSqGKbC55TcQ6iwJM+FTAb4o4Eh9X8cxkwHKZtxuf7HfgqdB5YPf9zfBKQN
         pIjguKLVEo5ypA8hu1TXFkU2ZhkQG5YPf48z4/gWoyYz7YT10TGAalMwKwPuiAsND4gr
         jT5+cwydZzGqe/MeqZc8mjcmWAK0U5Dpk9ll/GEaQSgYGgsFnEZYhzekOdBPghHJVT4V
         yYhsLQWplnKHJ+Eooz/b0emwV/lVJ5LrXVry1BdgPICbjL8K39Nq6WF+0r0CR06OeapX
         ZVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077384; x=1705682184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyDDK8wz61UD70/QcPoYFZCJBphOvhD/N3TrrEWzs04=;
        b=uu0gh4nETymQ9uo8731MM9yLaPWksdtwNSPiW0B5gljQyT8Xadzvin78VPFz/oEfLX
         Gn1pZRA/1wzrGv0ci/7u5XB9cOpX1FodzV5iBRNNo25hORUPROJD22nEWAgqZbiODgDW
         0eNKuPKIlP/w+iOkQz3pH1seEsoMO+Jp72c/UpjyHVGmq2b7p55NQbTj3breqAGUzeUJ
         q+u9fP/LIFCX3DiH+nMoa+ZjNRsNh8sl3XoFe+1N6DoO1QHUSUDM0b0Te2PFUzYB7C/l
         iQPWjGGV0ZU7kPquFTz392JqZo6bc7Q0jCTfATQsBRaONkPFRDzsflYRXklLDXWQ6MYS
         jRag==
X-Gm-Message-State: AOJu0YwttXBvS7jnrG6GRoXrsuCDo///Jbd4bimvweCUcG1kUz/apfO9
	oJnSDmD94h+U6+qTY+57ZDJyrqbSLCDLdA==
X-Google-Smtp-Source: AGHT+IGEtagzyP6drrDLBlZnlLyowYqGdeb19qv3F3VvjNm8psBxiXd75pZIKMI2UaFmdHtv32z/4Q==
X-Received: by 2002:a7b:c5cb:0:b0:40e:4921:5038 with SMTP id n11-20020a7bc5cb000000b0040e49215038mr648930wmk.91.1705077384525;
        Fri, 12 Jan 2024 08:36:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for shared reset-gpios
Date: Fri, 12 Jan 2024 17:36:05 +0100
Message-Id: <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devices sharing a reset GPIO could use the reset framework for
coordinated handling of that shared GPIO line.  We have several cases of
such needs, at least for Devicetree-based platforms.

If Devicetree-based device requests a reset line, while "resets"
Devicetree property is missing but there is a "reset-gpios" one,
instantiate a new "reset-gpio" platform device which will handle such
reset line.  This allows seamless handling of such shared reset-gpios
without need of changing Devicetree binding [1].

To avoid creating multiple "reset-gpio" platform devices, store the
Devicetree "reset-gpios" GPIO specifiers used for new devices on a
linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
controller, GPIO number and GPIO flags) is used to check if reset
controller for given GPIO was already registered.

If two devices have conflicting "reset-gpios" property, e.g. with
different ACTIVE_xxx flags, this would allow to spawn two separate
"reset-gpio" devices, where the second would fail probing on busy GPIO
request.

Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/core.c             | 227 +++++++++++++++++++++++++++++--
 include/linux/reset-controller.h |   4 +
 2 files changed, 217 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 4d5a78d3c085..86e33a703ad2 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -10,9 +10,13 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -23,6 +27,11 @@ static LIST_HEAD(reset_controller_list);
 static DEFINE_MUTEX(reset_lookup_mutex);
 static LIST_HEAD(reset_lookup_list);
 
+/* Protects reset_gpio_lookup_list */
+static DEFINE_MUTEX(reset_gpio_lookup_mutex);
+static LIST_HEAD(reset_gpio_lookup_list);
+static DEFINE_IDA(reset_gpio_ida);
+
 /**
  * struct reset_control - a reset control
  * @rcdev: a pointer to the reset controller device
@@ -63,6 +72,16 @@ struct reset_control_array {
 	struct reset_control *rstc[] __counted_by(num_rstcs);
 };
 
+/**
+ * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio devices
+ * @of_args: phandle to the reset controller with all the args like GPIO number
+ * @list: list entry for the reset_gpio_lookup_list
+ */
+struct reset_gpio_lookup {
+	struct of_phandle_args of_args;
+	struct list_head list;
+};
+
 static const char *rcdev_name(struct reset_controller_dev *rcdev)
 {
 	if (rcdev->dev)
@@ -813,13 +832,183 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
+static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
+				     const struct of_phandle_args *a2)
+{
+	unsigned int i;
+
+	if (!a2)
+		return false;
+
+	if (a1->args_count != a2->args_count)
+		return false;
+
+	for (i = 0; i < a1->args_count; i++)
+		if (a1->args[i] != a2->args[i])
+			return false;
+
+	return true;
+}
+
+static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
+					 unsigned int gpio,
+					 unsigned int of_flags)
+{
+	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
+	char *label __free(kfree) = NULL;
+	unsigned int lookup_flags;
+
+	/*
+	 * Later we map GPIO flags between OF and Linux, however not all
+	 * constants from include/dt-bindings/gpio/gpio.h and
+	 * include/linux/gpio/machine.h match each other.
+	 */
+	if (of_flags > GPIO_ACTIVE_LOW) {
+		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
+			of_flags, gpio);
+		return -EINVAL;
+	}
+
+	gdev = gpio_device_find_by_fwnode(of_fwnode_handle(np));
+	if (!gdev)
+		return -EPROBE_DEFER;
+
+	label = kstrdup(gpio_device_get_label(gdev), GFP_KERNEL);
+	if (!label)
+		return -EINVAL;
+
+	/* Size: one lookup entry plus sentinel */
+	lookup = kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+
+	lookup->dev_id = kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
+	if (!lookup->dev_id)
+		return -ENOMEM;
+
+	lookup_flags = GPIO_PERSISTENT;
+	lookup_flags |= of_flags & GPIO_ACTIVE_LOW;
+	lookup->table[0] = GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
+				       lookup_flags);
+
+	gpiod_add_lookup_table(no_free_ptr(lookup));
+
+	return 0;
+}
+
+/*
+ * @reset_args:	phandle to the GPIO provider with all the args like GPIO number
+ */
+static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
+{
+	struct reset_gpio_lookup *rgpio_dev;
+	struct platform_device *pdev;
+	int id, ret;
+
+	/*
+	 * Registering reset-gpio device might cause immediate
+	 * bind, resulting in its probe() registering new reset controller thus
+	 * taking reset_list_mutex lock via reset_controller_register().
+	 */
+	lockdep_assert_not_held(&reset_list_mutex);
+
+	mutex_lock(&reset_gpio_lookup_mutex);
+
+	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
+		if (args->np == rgpio_dev->of_args.np) {
+			if (__reset_gpios_args_match(args, &rgpio_dev->of_args))
+				goto out; /* Already on the list, done */
+		}
+	}
+
+	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
+	if (id < 0) {
+		ret = id;
+		goto err_unlock;
+	}
+
+	/*
+	 * Not freed in normal path, persisent subsystem data (which is assumed
+	 * also in the reset-gpio driver).
+	 */
+	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
+	if (!rgpio_dev) {
+		ret = -ENOMEM;
+		goto err_ida_free;
+	}
+
+	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
+					    args->args[1]);
+	if (ret < 0)
+		goto err_kfree;
+
+	rgpio_dev->of_args = *args;
+	/*
+	 * We keep the device_node reference, but of_args.np is put at the end
+	 * of __of_reset_control_get(), so get it one more time.
+	 * Hold reference as long as rgpio_dev memory is valid.
+	 */
+	of_node_get(rgpio_dev->of_args.np);
+	pdev = platform_device_register_data(NULL, "reset-gpio", id,
+					     &rgpio_dev->of_args,
+					     sizeof(rgpio_dev->of_args));
+	ret = PTR_ERR_OR_ZERO(pdev);
+	if (ret)
+		goto err_put;
+
+	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
+
+out:
+	mutex_unlock(&reset_gpio_lookup_mutex);
+
+	return 0;
+
+err_put:
+	of_node_put(rgpio_dev->of_args.np);
+err_kfree:
+	kfree(rgpio_dev);
+err_ida_free:
+	ida_free(&reset_gpio_ida, id);
+err_unlock:
+	mutex_unlock(&reset_gpio_lookup_mutex);
+
+	return ret;
+}
+
+static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
+						       bool gpio_fallback)
+{
+	struct reset_controller_dev *r, *rcdev;
+
+	lockdep_assert_held(&reset_list_mutex);
+
+	rcdev = NULL;
+	list_for_each_entry(r, &reset_controller_list, list) {
+		if (args->np == r->of_node) {
+			if (gpio_fallback) {
+				if (__reset_gpios_args_match(args, r->of_args)) {
+					rcdev = r;
+					break;
+				}
+			} else {
+				rcdev = r;
+				break;
+			}
+		}
+	}
+
+	return rcdev;
+}
+
 struct reset_control *
 __of_reset_control_get(struct device_node *node, const char *id, int index,
 		       bool shared, bool optional, bool acquired)
 {
+	struct of_phandle_args args = {0};
+	bool gpio_fallback = false;
 	struct reset_control *rstc;
-	struct reset_controller_dev *r, *rcdev;
-	struct of_phandle_args args;
+	struct reset_controller_dev *rcdev;
 	int rstc_id;
 	int ret;
 
@@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 					 index, &args);
 	if (ret == -EINVAL)
 		return ERR_PTR(ret);
-	if (ret)
-		return optional ? NULL : ERR_PTR(ret);
+	if (ret) {
+		/*
+		 * There can be only one reset-gpio for regular devices, so
+		 * don't bother with GPIO index.
+		 */
+		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
+						 0, &args);
+		if (ret)
+			return optional ? NULL : ERR_PTR(ret);
 
-	mutex_lock(&reset_list_mutex);
-	rcdev = NULL;
-	list_for_each_entry(r, &reset_controller_list, list) {
-		if (args.np == r->of_node) {
-			rcdev = r;
-			break;
+		gpio_fallback = true;
+
+		ret = __reset_add_reset_gpio_device(&args);
+		if (ret) {
+			rstc = ERR_PTR(ret);
+			goto out_put;
 		}
 	}
 
+	mutex_lock(&reset_list_mutex);
+	rcdev = __reset_find_rcdev(&args, gpio_fallback);
 	if (!rcdev) {
 		rstc = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		goto out_unlock;
 	}
 
 	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
 		rstc = ERR_PTR(-EINVAL);
-		goto out;
+		goto out_unlock;
 	}
 
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
 		rstc = ERR_PTR(rstc_id);
-		goto out;
+		goto out_unlock;
 	}
 
 	/* reset_list_mutex also protects the rcdev's reset_control list */
 	rstc = __reset_control_get_internal(rcdev, rstc_id, shared, acquired);
 
-out:
+out_unlock:
 	mutex_unlock(&reset_list_mutex);
+out_put:
 	of_node_put(args.np);
 
 	return rstc;
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 0fa4f60e1186..e064473215de 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -61,6 +61,9 @@ struct reset_control_lookup {
  * @dev: corresponding driver model device struct
  * @of_node: corresponding device tree node as phandle target
  * @of_reset_n_cells: number of cells in reset line specifiers
+ * TODO: of_args have of_node, so we have here duplication
+ * @of_args: for reset-gpios controllers: corresponding phandle args with GPIO
+ *           number complementing of_node
  * @of_xlate: translation function to translate from specifier as found in the
  *            device tree to id as given to the reset control ops, defaults
  *            to :c:func:`of_reset_simple_xlate`.
@@ -74,6 +77,7 @@ struct reset_controller_dev {
 	struct device *dev;
 	struct device_node *of_node;
 	int of_reset_n_cells;
+	const struct of_phandle_args *of_args;
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);
 	unsigned int nr_resets;
-- 
2.34.1


