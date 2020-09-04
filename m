Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E466F25D6F9
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 13:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgIDLEg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 07:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730092AbgIDLDB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Sep 2020 07:03:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3805C061244
        for <linux-i2c@vger.kernel.org>; Fri,  4 Sep 2020 04:02:48 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so6349049wrn.0
        for <linux-i2c@vger.kernel.org>; Fri, 04 Sep 2020 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=0UDGJrKEEMRct4izkIDPvi2dv+dhojogXFf/CukREHY=;
        b=nBrsuXu3TlREU+UkdWov0/MWQiKr1ppVGUIYSI8UJ35ZgBYV63+AwtbMz2oSsx18eW
         swklEouKf1ZQeze7VJdC0dRC76CxSog5iM0xNP+pQAM3canVrBPUWWfeMefHVe3Cgyeg
         yqbEBR87ekOfVkmkmVbmso7yeV2YP+OtRd5rb47gHMwUSO9OtavxoQyWgBLv6iIpnCOd
         Woj0aRxiLBCg7cAboXvKjuPKkNN5443t7NlB35/28YuwSo3QaGw1+tdqI6qn7zwyrG74
         jtgGxxHsZHAM7Jgu1xoT49nHzQhcoxUePiuJM007QnWi41G/Y2wmq7tfsKr45uZtrH6p
         F3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0UDGJrKEEMRct4izkIDPvi2dv+dhojogXFf/CukREHY=;
        b=t2hItxgPRxJ7ulreAKExlb5gRHyF3cptJStwIkp918t2MkhPn4KOBsJiZJ4ZCxgF31
         ui60ymddQ2NpyBs7L50GJcrHQjv9yKK+lZfSwy/qU2MPB6wtcSdtvrqyCx59/Oy5d8Dk
         1NJyLTNl5GzqxinCWqhlcmNv7JkqbqdQc4p4uRuvaHOLMOjgnYL61/bcAIyMmtW2PG09
         2tHSEzuUDIDG9DHFLAJKaoUln5GGHs0amWoXhHMef/KFkavgB0OpTxKPT4Kl0el7yOch
         7VGrVnc2mMDK/nO6QkugjXnDDrOQCB3fWYiyHP2kl0OhZcnyqvEOIq4z6bouz9P9tqDe
         kPyQ==
X-Gm-Message-State: AOAM531Dg9FYghRVA0y2vP5FwvavI8q8IbGQd0oUBVQUrkvG8TIqEYqV
        iPV/5chxN4sMOM1RArVogB8lpg==
X-Google-Smtp-Source: ABdhPJxb7ZJsbFQGtuY6eJJzmlIdvnB+T4SPxrTXcX7q27fwOgGPts6JmNsveK4Z66ZuJn2+zCKZUw==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr7064739wra.344.1599217367377;
        Fri, 04 Sep 2020 04:02:47 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id t4sm10334818wre.30.2020.09.04.04.02.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2020 04:02:46 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] nvmem: add ONIE NVMEM cells support
To:     Vadym Kochan <vadym.kochan@plvision.eu>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
 <20200831015539.26811-3-vadym.kochan@plvision.eu>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c829c654-b83d-c37c-f065-3211e6b4ce64@linaro.org>
Date:   Fri, 4 Sep 2020 12:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200831015539.26811-3-vadym.kochan@plvision.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 31/08/2020 02:55, Vadym Kochan wrote:
> ONIE is a small operating system, pre-installed on bare metal network
> switches, that provides an environment for automated provisioning.
> 
> This system requires that NVMEM (EEPROM) device holds various system
> information (mac address, platform name, etc) in a special TLV layout.
> 
> The driver registers ONIE TLV attributes as NVMEM cells which can be
> accessed by other platform driver. Also it allows to use
> of_get_mac_address() to retrieve mac address for the netdev.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> v3:
>      1) Update onie-cells.c by using nvmem notification to parse and
>         register cells before device and cells are finally registered.
> 
>      2) Use subsys_init() macro which allows to probe before nvmem drivers.
> 
>   drivers/nvmem/Kconfig      |   9 +
>   drivers/nvmem/Makefile     |   3 +
>   drivers/nvmem/onie-cells.c | 410 +++++++++++++++++++++++++++++++++++++

where is the device tree bindings for this driver?

And the nvmem provider driver for this?

--srini


>   3 files changed, 422 insertions(+)
>   create mode 100644 drivers/nvmem/onie-cells.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 954d3b4a52ab..922d753519f7 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -270,4 +270,13 @@ config SPRD_EFUSE
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-sprd-efuse.
>   
> +config NVMEM_ONIE_CELLS
> +	bool "ONIE TLV cells support"
> +	help
> +	  This is a driver to provide cells from ONIE TLV structure stored
> +	  on NVME device.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-onie-cells.
> +
>   endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index a7c377218341..2199784a489f 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -55,3 +55,6 @@ obj-$(CONFIG_NVMEM_ZYNQMP)	+= nvmem_zynqmp_nvmem.o
>   nvmem_zynqmp_nvmem-y		:= zynqmp_nvmem.o
>   obj-$(CONFIG_SPRD_EFUSE)	+= nvmem_sprd_efuse.o
>   nvmem_sprd_efuse-y		:= sprd-efuse.o
> +
> +obj-$(CONFIG_NVMEM_ONIE_CELLS)	+= nvmem-onie-cells.o
> +nvmem-onie-cells-y		:= onie-cells.o
> diff --git a/drivers/nvmem/onie-cells.c b/drivers/nvmem/onie-cells.c
> new file mode 100644
> index 000000000000..bbb1e421f67c
> --- /dev/null
> +++ b/drivers/nvmem/onie-cells.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * ONIE NVMEM cells provider
> + *
> + * Author: Vadym Kochan <vadym.kochan@plvision.eu>
> + */
> +
> +#define ONIE_NVMEM_DRVNAME	"onie-nvmem-cells"
> +
> +#define pr_fmt(fmt) ONIE_NVMEM_DRVNAME ": " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kref.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define ONIE_NVMEM_TLV_MAX_LEN	2048
> +
> +#define ONIE_NVMEM_HDR_ID	"TlvInfo"
> +
> +struct onie_nvmem_hdr {
> +	u8 id[8];
> +	u8 version;
> +	__be16 data_len;
> +} __packed;
> +
> +struct onie_nvmem_tlv {
> +	u8 type;
> +	u8 len;
> +	u8 val[0];
> +} __packed;
> +
> +struct onie_nvmem_attr {
> +	struct list_head head;
> +	const char *name;
> +	unsigned int offset;
> +	unsigned int len;
> +};
> +
> +struct onie_nvmem {
> +	struct platform_device *pdev;
> +	struct notifier_block nvmem_nb;
> +	unsigned int attr_count;
> +	struct list_head attrs;
> +	struct kref refcnt;
> +	const char *nvmem_match;
> +
> +	struct nvmem_cell_lookup *cell_lookup;
> +	struct nvmem_cell_table cell_tbl;
> +	struct nvmem_device *nvmem;
> +};
> +
> +static bool onie_nvmem_hdr_is_valid(struct onie_nvmem_hdr *hdr)
> +{
> +	if (memcmp(hdr->id, ONIE_NVMEM_HDR_ID, sizeof(hdr->id)) != 0)
> +		return false;
> +	if (hdr->version != 0x1)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void onie_nvmem_attrs_free(struct onie_nvmem *onie)
> +{
> +	struct onie_nvmem_attr *attr, *tmp;
> +
> +	list_for_each_entry_safe(attr, tmp, &onie->attrs, head) {
> +		list_del(&attr->head);
> +		kfree(attr);
> +	}
> +}
> +
> +static const char *onie_nvmem_attr_name(u8 type)
> +{
> +	switch (type) {
> +	case 0x21: return "product-name";
> +	case 0x22: return "part-number";
> +	case 0x23: return "serial-number";
> +	case 0x24: return "mac-address";
> +	case 0x25: return "manufacture-date";
> +	case 0x26: return "device-version";
> +	case 0x27: return "label-revision";
> +	case 0x28: return "platforn-name";
> +	case 0x29: return "onie-version";
> +	case 0x2A: return "num-macs";
> +	case 0x2B: return "manufacturer";
> +	case 0x2C: return "country-code";
> +	case 0x2D: return "vendor";
> +	case 0x2E: return "diag-version";
> +	case 0x2F: return "service-tag";
> +	case 0xFD: return "vendor-extension";
> +	case 0xFE: return "crc32";
> +
> +	default: return "unknown";
> +	}
> +}
> +
> +static int onie_nvmem_tlv_parse(struct onie_nvmem *onie, u8 *data, u16 len)
> +{
> +	unsigned int hlen = sizeof(struct onie_nvmem_hdr);
> +	unsigned int offset = 0;
> +	int err;
> +
> +	while (offset < len) {
> +		struct onie_nvmem_attr *attr;
> +		struct onie_nvmem_tlv *tlv;
> +
> +		tlv = (struct onie_nvmem_tlv *)(data + offset);
> +
> +		if (offset + tlv->len >= len) {
> +			struct nvmem_device *nvmem = onie->nvmem;
> +
> +			pr_err("%s: TLV len is too big(0x%x) at 0x%x\n",
> +			       nvmem_dev_name(nvmem), tlv->len, hlen + offset);
> +
> +			/* return success in case something was parsed */
> +			return 0;
> +		}
> +
> +		attr = kmalloc(sizeof(*attr), GFP_KERNEL);
> +		if (!attr) {
> +			err = -ENOMEM;
> +			goto err_attr_alloc;
> +		}
> +
> +		attr->name = onie_nvmem_attr_name(tlv->type);
> +		/* skip 'type' and 'len' */
> +		attr->offset = hlen + offset + 2;
> +		attr->len = tlv->len;
> +
> +		list_add(&attr->head, &onie->attrs);
> +		onie->attr_count++;
> +
> +		offset += sizeof(*tlv) + tlv->len;
> +	}
> +
> +	return 0;
> +
> +err_attr_alloc:
> +	onie_nvmem_attrs_free(onie);
> +
> +	return err;
> +}
> +
> +static int onie_nvmem_decode(struct onie_nvmem *onie)
> +{
> +	struct nvmem_device *nvmem = onie->nvmem;
> +	struct onie_nvmem_hdr hdr;
> +	u8 *data;
> +	u16 len;
> +	int ret;
> +
> +	ret = nvmem_device_read(nvmem, 0, sizeof(hdr), &hdr);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!onie_nvmem_hdr_is_valid(&hdr)) {
> +		pr_err("%s: invalid ONIE TLV header\n", nvmem_dev_name(nvmem));
> +		ret = -EINVAL;
> +		goto err_invalid;
> +	}
> +
> +	len = be16_to_cpu(hdr.data_len);
> +
> +	if (len > ONIE_NVMEM_TLV_MAX_LEN)
> +		len = ONIE_NVMEM_TLV_MAX_LEN;
> +
> +	data = kmalloc(len, GFP_KERNEL);
> +	if (!data) {
> +		ret = -ENOMEM;
> +		goto err_kmalloc;
> +	}
> +
> +	ret = nvmem_device_read(nvmem, sizeof(hdr), len, data);
> +	if (ret < 0)
> +		goto err_data_read;
> +
> +	ret = onie_nvmem_tlv_parse(onie, data, len);
> +	if (ret)
> +		goto err_info_parse;
> +
> +	kfree(data);
> +
> +	return 0;
> +
> +err_info_parse:
> +err_data_read:
> +	kfree(data);
> +err_kmalloc:
> +err_invalid:
> +	return ret;
> +}
> +
> +static int onie_nvmem_cells_parse(struct onie_nvmem *onie)
> +{
> +	struct platform_device *pdev = onie->pdev;
> +	struct nvmem_device *nvmem = onie->nvmem;
> +	struct device *dev = &pdev->dev;
> +	struct nvmem_cell_info *cells;
> +	struct onie_nvmem_attr *attr;
> +	unsigned int ncells = 0;
> +	int err;
> +
> +	INIT_LIST_HEAD(&onie->attrs);
> +	onie->attr_count = 0;
> +
> +	err = onie_nvmem_decode(onie);
> +	if (err)
> +		return err;
> +
> +	if (!onie->attr_count) {
> +		pr_err("%s: has no ONIE attributes\n", nvmem_dev_name(nvmem));
> +		return -EINVAL;
> +	}
> +
> +	cells = kmalloc_array(onie->attr_count, sizeof(*cells), GFP_KERNEL);
> +	if (!cells) {
> +		err = -ENOMEM;
> +		goto err_cells_alloc;
> +	}
> +
> +	onie->cell_lookup = kmalloc_array(onie->attr_count,
> +					  sizeof(struct nvmem_cell_lookup),
> +					  GFP_KERNEL);
> +	if (!onie->cell_lookup) {
> +		err = -ENOMEM;
> +		goto err_lookup_alloc;
> +	}
> +
> +	list_for_each_entry(attr, &onie->attrs, head) {
> +		struct nvmem_cell_lookup *lookup;
> +		struct nvmem_cell_info *cell;
> +
> +		cell = &cells[ncells];
> +
> +		lookup = &onie->cell_lookup[ncells];
> +		lookup->con_id = NULL;
> +
> +		cell->offset = attr->offset;
> +		cell->name = attr->name;
> +		cell->bytes = attr->len;
> +		cell->bit_offset = 0;
> +		cell->nbits = 0;
> +
> +		lookup->nvmem_name = nvmem_dev_name(onie->nvmem);
> +		lookup->dev_id = dev_name(dev);
> +		lookup->cell_name = cell->name;
> +		lookup->con_id = cell->name;
> +
> +		ncells++;
> +	}
> +
> +	onie->cell_tbl.nvmem_name = nvmem_dev_name(onie->nvmem);
> +	onie->cell_tbl.ncells = ncells;
> +	onie->cell_tbl.cells = cells;
> +
> +	nvmem_add_cell_table(&onie->cell_tbl);
> +	nvmem_add_cell_lookups(onie->cell_lookup, ncells);
> +
> +	onie_nvmem_attrs_free(onie);
> +
> +	return 0;
> +
> +err_lookup_alloc:
> +	kfree(onie->cell_tbl.cells);
> +err_cells_alloc:
> +	onie_nvmem_attrs_free(onie);
> +
> +	return err;
> +}
> +
> +static void onie_nvmem_release(struct kref *kref)
> +{
> +	kfree(container_of(kref, struct onie_nvmem, refcnt));
> +}
> +
> +static void onie_nvmem_get(struct onie_nvmem *onie)
> +{
> +	kref_get(&onie->refcnt);
> +}
> +
> +static void onie_nvmem_put(struct onie_nvmem *onie)
> +{
> +	kref_put(&onie->refcnt, onie_nvmem_release);
> +}
> +
> +static int onie_nvmem_notify(struct notifier_block *nb,
> +			     unsigned long val, void *data)
> +{
> +	struct nvmem_device *nvmem = data;
> +	struct onie_nvmem *onie;
> +	int err;
> +
> +	if (val != NVMEM_PRE_ADD && val != NVMEM_REMOVE)
> +		return NOTIFY_DONE;
> +
> +	onie = container_of(nb, struct onie_nvmem, nvmem_nb);
> +
> +	if (strcmp(onie->nvmem_match, nvmem_dev_name(nvmem)) != 0)
> +		return NOTIFY_DONE;
> +
> +	switch (val) {
> +	case NVMEM_PRE_ADD:
> +		onie->nvmem = nvmem;
> +
> +		err = onie_nvmem_cells_parse(onie);
> +		if (err)
> +			return NOTIFY_BAD;
> +
> +		onie_nvmem_get(onie);
> +		break;
> +
> +	case NVMEM_REMOVE:
> +		nvmem_del_cell_lookups(onie->cell_lookup, onie->attr_count);
> +		nvmem_del_cell_table(&onie->cell_tbl);
> +
> +		kfree(onie->cell_tbl.cells);
> +		kfree(onie->cell_lookup);
> +
> +		onie_nvmem_put(onie);
> +		break;
> +
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int onie_nvmem_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct onie_nvmem *onie;
> +	const char *nvmem_match;
> +	int err;
> +
> +	err = of_property_read_string(np, "nvmem-name", &nvmem_match);
> +	if (err) {
> +		dev_err(dev, "error while parsing 'nvmem-name' property\n");
> +		return err;
> +	}
> +
> +	onie = kmalloc(sizeof(*onie), GFP_KERNEL);
> +	if (!onie)
> +		return -ENOMEM;
> +
> +	kref_init(&onie->refcnt);
> +
> +	onie->nvmem_nb.notifier_call = onie_nvmem_notify;
> +	onie->nvmem_match = nvmem_match;
> +	onie->pdev = pdev;
> +
> +	dev_set_drvdata(dev, onie);
> +
> +	return nvmem_register_notifier(&onie->nvmem_nb);
> +}
> +
> +static int onie_nvmem_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct onie_nvmem *onie;
> +
> +	onie = dev_get_drvdata(dev);
> +
> +	nvmem_unregister_notifier(&onie->nvmem_nb);
> +	onie_nvmem_put(onie);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id onie_nvmem_match[] = {
> +	{
> +		.compatible = "onie,nvmem-cells",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, onie_nvmem_match);
> +
> +static struct platform_driver onie_nvmem_driver = {
> +	.probe = onie_nvmem_probe,
> +	.remove = onie_nvmem_remove,
> +	.driver = {
> +		.name = ONIE_NVMEM_DRVNAME,
> +		.of_match_table = onie_nvmem_match,
> +	},
> +};
> +
> +static int __init onie_nvmem_init(void)
> +{
> +	return platform_driver_register(&onie_nvmem_driver);
> +}
> +
> +static void __exit onie_nvmem_exit(void)
> +{
> +	platform_driver_unregister(&onie_nvmem_driver);
> +}
> +
> +subsys_initcall(onie_nvmem_init);
> +module_exit(onie_nvmem_exit);
> +
> +MODULE_AUTHOR("Vadym Kochan <vadym.kochan@plvision.eu>");
> +MODULE_DESCRIPTION("ONIE NVMEM cells driver");
> +MODULE_LICENSE("GPL");
> 
