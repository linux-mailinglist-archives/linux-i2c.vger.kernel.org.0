Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E71366DB96
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236214AbjAQKzH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236144AbjAQKzG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:55:06 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB1F2FCE5
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:55:03 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o17-20020a05600c511100b003db021ef437so2728253wms.4
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=805bb8hOTOUGDY2jBWH3jM4R20f89Bw3rxZcKT89IjQ=;
        b=UmfcgKxQpQLZ8xmSjscySBy23ShOchY1+nvfFc238yYfloWjBiLHB3uz1fKM0PmNwK
         mxJrl/y2gMc/K97sYB4vrxi9JDE+J6dxa6KhRmMKoOEn9bYicis8Nyj4QQmkfQHGoNGM
         zORwowuN2THhwL0gZKXdEdy1LnGxmObwGiDbFQIgdkRXNPNv4hQ87o1+e4xbRE11ICDr
         WgbPfgRsXon+vi6FqvnVHY1iWGHLV+fzvtAnlgNkZd9TIO857qLv1ycwg0CF4nTR297S
         QGbWV1tY7eS67K87hE2n8bpmf4TPhDCA8C/wSgRVasdyBl7W3yhiZi922EhMou+SIwia
         8cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=805bb8hOTOUGDY2jBWH3jM4R20f89Bw3rxZcKT89IjQ=;
        b=mTGoQpGsKYEY3mDSV7VFXh9gWFpBCEfU89AxBkKqdUK5GelvlbHg/Sfc/M3W2eD/9T
         GhZuKovKC0eegx7QNV4kZ0o6niWafsC1h90iMCKFY2o+Lgdeomrv1mpBafN0G5wwfJ3A
         gNwXOjLSobKUTiMki+fSCHDCwL4svYgf8g9vKHLioHCdVZPgaGtOnUr6apn8urlvuV6P
         ljElSngSlLPMVFL14KEuewzl7NyrxtCnH18C3zigdRD0UTC+r9h38pOIvGtx0RdfRpic
         eON6UXvIdZ93f4JgusW4N1fxE58SjolPF8NfigvuNz6yUz8FlhfXiloOs0/tazKppyJU
         qv7A==
X-Gm-Message-State: AFqh2krD+aE/7U1Co8ee++KYbQpYtJnHG0UPvYXLN6btiugiICPSIdQP
        /4TurUPgh3OEXEg1pvKmpOKHMg==
X-Google-Smtp-Source: AMrXdXtBRbJfEKhA/D2t7RGHePA77tEuy4vmS7a1l0h/U97lUeFiH+0tExt8RhO9BU4MZrmGKJCPvQ==
X-Received: by 2002:a05:600c:31a3:b0:3d6:8570:1239 with SMTP id s35-20020a05600c31a300b003d685701239mr2606267wmp.16.1673952902350;
        Tue, 17 Jan 2023 02:55:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003db03725e86sm3310197wmq.8.2023.01.17.02.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:55:01 -0800 (PST)
Message-ID: <1e1a23e0-5aa7-9f8d-cb67-e2a847d0b6d5@linaro.org>
Date:   Tue, 17 Jan 2023 11:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/3] misc: Add meta cld driver
Content-Language: en-US
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     garnermic@fb.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/01/2023 10:44, Delphine CC Chiu wrote:
> Add support for meta control-logic-device driver. The CLD manages the
> server system power squence and other state such as host-power-state,
> uart-selection and presense-slots. The baseboard management controller
> (BMC) can access the CLD through I2C.
> 
> The version 1 of CLD driver is supported. The registers number, name
> and mode of CLD can be defined in dts file for version 1. The driver
> exports the filesystem following the dts setting.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> Tested-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
> ---
>  MAINTAINERS                         |   6 +
>  drivers/misc/Kconfig                |   9 +
>  drivers/misc/Makefile               |   1 +
>  drivers/misc/control-logic-device.c | 443 ++++++++++++++++++++++++++++
>  4 files changed, 459 insertions(+)
>  create mode 100644 drivers/misc/control-logic-device.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7483853880b6..46e250a2c334 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13388,6 +13388,12 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
>  F:	drivers/staging/media/meson/vdec/
>  
> +META CPLD DRIVER
> +M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/meta,control-logic-device.txt

Missing entries for driver code.

> +
>  METHODE UDPU SUPPORT
>  M:	Vladimir Vid <vladimir.vid@sartura.hr>
>  S:	Maintained
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 358ad56f6524..21d3bf820438 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -496,6 +496,15 @@ config VCPU_STALL_DETECTOR
>  
>  	  If you do not intend to run this kernel as a guest, say N.
>  
> +config CONTROL_LOGIC_DEVICE
> +        bool "Meta Control Logic Device Driver"

Too generic...

> +        depends on I2C && REGMAP
> +        help
> +          Say yes here to add support for the Meta CLD device driver. The dirver
> +          is used to monitor CLD register value and notify the application if
> +          value is changed. Application also can access the CLD register value
> +          through this driver.
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index ac9b3e757ba1..6fcdd575a143 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -62,3 +62,4 @@ obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
>  obj-$(CONFIG_OPEN_DICE)		+= open-dice.o
>  obj-$(CONFIG_GP_PCI1XXXX)	+= mchp_pci1xxxx/
>  obj-$(CONFIG_VCPU_STALL_DETECTOR)	+= vcpu_stall_detector.o
> +obj-$(CONFIG_CONTROL_LOGIC_DEVICE) += control-logic-device.o

Does not look like ordered by name.

> diff --git a/drivers/misc/control-logic-device.c b/drivers/misc/control-logic-device.c
> new file mode 100644
> index 000000000000..07113dcb0836
> --- /dev/null
> +++ b/drivers/misc/control-logic-device.c
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Meta Inc.
> + */
> +
> + #include <linux/module.h>

Don't prepend with spaces. Check the code for such trivial style issues
first.

> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/sysfs.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/stddef.h>
> +#include <linux/kthread.h>
> +
> +#define CLD_LABEL_LEN  64 /* label = "name:mode:offset" */
> +#define to_cld_reg(x) container_of(x, struct cld_data, bin)
> +
> +struct cld_register_info {
> +	const char *name;
> +	umode_t mode;
> +	u8 reg;
> +	u8 value;
> +};
> +
> +struct cld_data {
> +	struct list_head list;
> +	struct bin_attribute bin;
> +	struct kernfs_node *kn;
> +	struct cld_register_info info;
> +};
> +
> +struct cld_client {
> +	struct bin_attribute new_register_bin;
> +	struct bin_attribute delet_register_bin;
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct cld_data *data;
> +	struct task_struct *task;
> +	size_t num_attributes;
> +};
> +
> +struct meta_cld_of_ops {
> +	int (*load_registers)(struct cld_client *cld);
> +};
> +
> +static struct regmap_config cld_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static ssize_t cld_register_read(struct file *flip, struct kobject *kobj,
> +				 struct bin_attribute *attr, char *buf,
> +				 loff_t pos, size_t count)
> +{
> +	int ret;
> +	unsigned int value;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct cld_client *cld = dev_get_drvdata(dev);
> +	struct cld_data *data = to_cld_reg(attr);
> +
> +	ret = regmap_read(cld->regmap, data->info.reg, &value);
> +	if (ret != 0)
> +		return ret;
> +
> +	if ((data->info.mode & 0400) == 0400)
> +		data->info.value = value;
> +
> +	snprintf(buf, sizeof(value), "%d\n", value);
> +
> +	return strlen(buf);
> +}
> +
> +static ssize_t cld_register_write(struct file *flip, struct kobject *kobj,
> +				  struct bin_attribute *attr, char *buf,
> +				  loff_t pos, size_t count)
> +{
> +	int ret;
> +	unsigned long val;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct cld_client *cld = dev_get_drvdata(dev);
> +	struct cld_data *data = to_cld_reg(attr);
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		goto out;
> +
> +	if (val >= BIT(8)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = regmap_write(cld->regmap, data->info.reg, val);
> +	if (ret)
> +		goto out;
> +
> +out:
> +	return ret ? ret : strlen(buf);
> +}
> +
> +static int cld_bin_register(struct cld_register_info info,
> +			    struct cld_client *cld)
> +{
> +	int ret;
> +	struct cld_data *data, *pos;
> +	struct bin_attribute *bin;
> +	size_t length;
> +
> +	list_for_each_entry(pos, &cld->data->list, list) {
> +		length = (strlen(info.name) > strlen(pos->info.name)) ?
> +			 strlen(info.name):strlen(pos->info.name);
> +		if (!strncasecmp(info.name, pos->info.name, length))
> +			return -EEXIST;
> +	}
> +
> +	data = devm_kzalloc(cld->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	bin = &data->bin;
> +	data->info = info;
> +
> +	sysfs_bin_attr_init(bin);
> +	bin->attr.name = kstrdup(info.name, GFP_KERNEL);
> +	if (!bin->attr.name)
> +		return -EINVAL;
> +	bin->attr.mode = info.mode;
> +	bin->read = cld_register_read;
> +	bin->write = cld_register_write;
> +	bin->size = 1;
> +	ret = sysfs_create_bin_file(&cld->dev->kobj, bin);
> +	if (ret) {
> +		dev_err(cld->dev, "%s: failed to create file: %d\n",
> +			info.name, ret);
> +		goto out;
> +	}
> +
> +	data->kn = kernfs_find_and_get(cld->dev->kobj.sd, bin->attr.name);
> +	if (!data->kn) {
> +		sysfs_remove_bin_file(&cld->dev->kobj, bin);
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	list_add_tail(&data->list, &cld->data->list);
> +	++cld->num_attributes;
> +out:
> +	return ret;
> +}
> +
> +static int cld_bin_unregister(struct cld_register_info info,
> +			      struct cld_client *cld)
> +{
> +	size_t length;
> +	struct cld_data *pos;
> +
> +	list_for_each_entry(pos, &cld->data->list, list) {
> +		length = (strlen(info.name) > strlen(pos->info.name)) ?
> +			 strlen(info.name):strlen(pos->info.name);
> +		if ((!strncasecmp(info.name, pos->info.name, length)) &&
> +		    (info.mode == pos->info.mode) &&
> +		    (info.reg == pos->info.reg)) {
> +			kernfs_put(pos->kn);
> +			sysfs_remove_bin_file(&cld->dev->kobj,
> +					      &pos->bin);
> +			list_del(&pos->list);
> +			devm_kfree(cld->dev, pos);
> +			--cld->num_attributes;
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(cld->dev, "%s: cannot match cld data\n", info.name);
> +	return -EINVAL;
> +}
> +
> +static int cld_parse_label(char *label, struct cld_register_info *info)
> +{
> +	char name[CLD_LABEL_LEN] = { 0 };
> +	char *mode_str, *reg_str;
> +	int rc, i;
> +	unsigned long reg;
> +	umode_t mode;
> +	size_t length;
> +	struct {
> +		char *mode;
> +		int value;
> +	} options[] = {
> +		{"rw", 0600},
> +		{"r", 0400},
> +		{"w", 0200},
> +	};
> +
> +	strncpy(name, label, CLD_LABEL_LEN);
> +
> +	mode_str = strchr(name, ':');
> +	if (!mode_str)
> +		return -EINVAL;
> +	*mode_str++ = '\0';
> +
> +	reg_str = strchr(mode_str, ':');
> +	if (!reg_str)
> +		return -EINVAL;
> +	*reg_str++ = '\0';
> +
> +	if ((*name == '\0') || (*mode_str == '\0') || (*reg_str == '\0'))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(options); i++) {
> +		length = (strlen(options[i].mode) > strlen(mode_str)) ?
> +			 strlen(options[i].mode):strlen(mode_str);
> +		if (strncasecmp(mode_str, options[i].mode, length) == 0) {
> +			rc = kstrtoul(reg_str, 0, &reg);
> +			if (rc)
> +				return -EINVAL;
> +			mode = options[i].value;
> +			break;
> +		}
> +	}
> +	if ((i >= ARRAY_SIZE(options)) || (reg >= BIT(8)))
> +		return -EINVAL;
> +
> +	info->name = kstrdup(name, GFP_KERNEL);
> +	if (!info->name)
> +		return -EINVAL;
> +	info->reg = reg;
> +	info->mode = mode;
> +	return 0;
> +}
> +
> +static int cld_load_registers(struct cld_client *cld, const char *property)
> +{
> +	const char *label;
> +	int count, ret, i;
> +	struct cld_register_info info;
> +	struct device *dev = cld->dev;
> +
> +	count = of_property_count_strings(dev->of_node, property);
> +	if (count <= 0)
> +		return -EINVAL;
> +
> +	for (i = 0; i < count; i++) {
> +		ret = of_property_read_string_index(dev->of_node, property, i,
> +						    &label);
> +		if (ret) {
> +			dev_err(dev, ": failed to get label for index %d\n",
> +				i);
> +			continue;
> +		}
> +
> +		ret = cld_parse_label((char *)label, &info);
> +		if (ret) {
> +			dev_err(cld->dev, "%s: failed to parse label\n",
> +				label);
> +			continue;
> +		}
> +		cld_bin_register(info, cld);
> +	}
> +	return (count == cld->num_attributes) ? 0 : (-EINVAL);
> +}
> +
> +static int meta_cld_of_v1_load_registers(struct cld_client *cld)
> +{
> +	int ret;
> +
> +	ret = cld_load_registers(cld, "registers-map");
> +	if (ret)
> +		dev_dbg(cld->dev, "failed to load registers\n");
> +
> +	return 0;
> +}
> +
> +static ssize_t cld_sysfs_new_register(struct file *filp, struct kobject *kobj,
> +				      struct bin_attribute *attr,
> +				      char *buf, loff_t pos, size_t count)
> +{
> +	int ret;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct cld_client *cld = dev_get_drvdata(dev);
> +	struct cld_register_info info;
> +
> +	ret = cld_parse_label(buf, &info);
> +	if (ret) {
> +		dev_err(cld->dev, "failed to parse label\n");
> +		goto out;
> +	}
> +	ret = cld_bin_register(info, cld);
> +
> +out:
> +	return (!ret) ? count : ret;
> +}
> +
> +static ssize_t cld_sysfs_delete_register(struct file *filp,
> +					 struct kobject *kobj,
> +					 struct bin_attribute *attr,
> +					 char *buf, loff_t pos, size_t count)
> +{
> +	int ret;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct cld_client *cld = dev_get_drvdata(dev);
> +	struct cld_register_info info;
> +
> +	ret = cld_parse_label(buf, &info);
> +	if (ret) {
> +		dev_err(cld->dev, "failed to parse label\n");
> +		goto out;
> +	}
> +
> +	ret = cld_bin_unregister(info, cld);
> +
> +out:
> +	return (!ret) ? count : ret;
> +}
> +
> +static int cld_monitor_thread(void *client)
> +{
> +	struct cld_client *cld = client;
> +	unsigned int value;
> +	int ret;
> +	struct cld_data *pos;
> +
> +	while (!kthread_should_stop()) {
> +		list_for_each_entry(pos, &cld->data->list, list) {
> +			if ((pos->info.mode & 0400) == 0400) {
> +				ret = regmap_read(cld->regmap, pos->info.reg,
> +						  &value);
> +				if (ret)
> +					continue;
> +				if (pos->info.value != value) {
> +					pos->info.value = value;
> +					kernfs_notify(pos->kn);
> +				}
> +			}
> +		}
> +		msleep(50);
> +	}
> +	return 0;
> +}
> +
> +static int cld_probe(struct i2c_client *client,
> +		     const struct i2c_device_id *id)
> +{
> +	int ret = 0;
> +	const struct meta_cld_of_ops *ops;
> +	struct device *dev = &client->dev;
> +	struct cld_client *cld;
> +
> +	cld = devm_kzalloc(dev, sizeof(*cld), GFP_KERNEL);
> +	if (!cld) {
> +		ret = -ENOMEM;

return

> +		goto out;
> +	}
> +
> +	cld->dev = dev;
> +	cld->num_attributes = 0;
> +	cld->regmap = devm_regmap_init_i2c(client, &cld_regmap_config);
> +	cld->data = devm_kzalloc(cld->dev, sizeof(struct cld_data),

sizeof(*)

> +				 GFP_KERNEL);
> +	if (!cld->data) {
> +		ret = -ENOMEM;

return


> +		goto out;
> +	}
> +
> +	INIT_LIST_HEAD(&cld->data->list);
> +
> +	sysfs_bin_attr_init(&cld->new_register_bin);
> +	cld->new_register_bin.attr.name = "new_register";
> +	cld->new_register_bin.attr.mode = 0200;
> +	cld->new_register_bin.write = cld_sysfs_new_register;
> +	ret = sysfs_create_bin_file(&dev->kobj, &cld->new_register_bin);
> +	if (ret)
> +		goto out;
> +
> +	sysfs_bin_attr_init(&cld->delet_register_bin);
> +	cld->delet_register_bin.attr.name = "delete_register";
> +	cld->delet_register_bin.attr.mode = 0200;
> +	cld->delet_register_bin.write = cld_sysfs_delete_register;
> +	ret = sysfs_create_bin_file(&dev->kobj, &cld->delet_register_bin);
> +	if (ret)
> +		goto out;

return

> +
> +	ops = of_device_get_match_data(cld->dev);
> +	if (!ops) {
> +		ret = -EINVAL;

return

> +		goto out;
> +	}
> +
> +	ret = ops->load_registers(cld);
> +
> +	cld->task = kthread_run(cld_monitor_thread, (void *)cld,
> +				"register_monitor");

Why do you need the thread? What do you monitor? All this should be
explained and documented.

> +	if (IS_ERR(cld->task)) {
> +		ret = PTR_ERR(cld->task);

return

> +		cld->task = NULL;

Drop

> +		goto out;
> +	}
> +
> +	dev_set_drvdata(dev, cld);

This should happen before starting thread.

> +
> +out:
> +	return ret;
> +}
> +
> +static int cld_remove(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct cld_client *cld = dev_get_drvdata(dev);
> +
> +	if (cld->task) {
> +		kthread_stop(cld->task);
> +		cld->task = NULL;
> +	}
> +
> +	devm_kfree(dev, cld);
> +	return 0;
> +}
> +
> +static const struct meta_cld_of_ops of_v1_ops = {
> +	.load_registers = meta_cld_of_v1_load_registers,
> +};
> +
> +static const struct of_device_id cld_of_match[] = {

This would warn now. Drop of_match_ptr.

> +	{
> +		.compatible = "meta,control-logic-device-v1",
> +		.data = &of_v1_ops,
> +	},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, cld_of_match)
> +
> +static struct i2c_driver cld = {
> +	.driver = { .name = "cld-driver",
> +		    .of_match_table = of_match_ptr(cld_of_match) },

Blank line before }

> +	.probe = cld_probe,
> +	.remove = cld_remove,
> +};
> +
> +module_i2c_driver(cld);
> +
> +MODULE_AUTHOR("Ren Chen <ren_chen@wiwynn.com>");
> +MODULE_DESCRIPTION("Meta control logic device driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

