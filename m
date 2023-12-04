Return-Path: <linux-i2c+bounces-605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D0803615
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 15:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1DFB20B14
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 14:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F64286AE;
	Mon,  4 Dec 2023 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ft7nuWwT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AECAA
	for <linux-i2c@vger.kernel.org>; Mon,  4 Dec 2023 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701699013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAk5ft1JJ/w/1XXKa1ncobxnCZpF8QFfcV5KnWCuC9c=;
	b=Ft7nuWwT47+rZ+UhcCKTkARcaluKMjIQANPLWWWqL9WPWZflEDllpn8eA7u8TCM3cXkMLZ
	RD0Xt2P7BsCPuHIOLsxP3KvuEbMDqx4Egkgb14hTbiTWeaTBldW8txA05Mdn8QYO8l1a77
	wsHNrrINfa7uq6NfIYDOftZrcaOzkIw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-VCx_bEdhOu21wZYmTbZqXA-1; Mon, 04 Dec 2023 09:10:12 -0500
X-MC-Unique: VCx_bEdhOu21wZYmTbZqXA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1b466b0d24so81992366b.2
        for <linux-i2c@vger.kernel.org>; Mon, 04 Dec 2023 06:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699011; x=1702303811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAk5ft1JJ/w/1XXKa1ncobxnCZpF8QFfcV5KnWCuC9c=;
        b=K1mfufRG/FMhmrG1/A980fQvlphMc/qMtAzXcSEWfW4IdCqA4yDa97cpWNIMO2ZcM6
         T/nyYrLt2xXU1+4AlwuBArzrD6y5yFZgEwNcpACtAu/vbbrTIUUnA08/2MdLqjVlP3uk
         Lx4S4bzAeown2pYkhrEGYspiKsFZmugm6CyoAmY/tlhEp1OJhgspLpAf7P1yK/CUk5X7
         PyN4el2of5jlybQLfGvKuXvMUqk40lPgQQNIq85qC60j1rMdnD1byVvn8+zTFAGi2nOn
         bb322z0hkF8g2v5tXY/25KX72jrVekSX/jddZQF33qJAaryKDc08cE6h57YUE/gF1Gu3
         sODg==
X-Gm-Message-State: AOJu0YzYUmIWBc898wOB8RU4mmoCo7pOM65PRvQne7e6R4j5wQlo6eO8
	vq/bIVlMB2YYXzxhJQL+IUplFDQ5VZ8S3JviyzdHxpy0fYug+7oPZGLynOa4kKftoIPaUSmgc1G
	eBbQkxlcuAdrfwTYuAMxK
X-Received: by 2002:a17:906:8a42:b0:a19:a1ba:bae5 with SMTP id gx2-20020a1709068a4200b00a19a1babae5mr1540356ejc.139.1701699010985;
        Mon, 04 Dec 2023 06:10:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAIe9I+YICP2AFMqhZIsxCBMb1ktF5roM76t28tXbR4yVzB3bGdBWWH2YKGVbXO9CxV96/Jg==
X-Received: by 2002:a17:906:8a42:b0:a19:a1ba:bae5 with SMTP id gx2-20020a1709068a4200b00a19a1babae5mr1540349ejc.139.1701699010604;
        Mon, 04 Dec 2023 06:10:10 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b009fd50aa6984sm5285299ejs.83.2023.12.04.06.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:10:10 -0800 (PST)
Message-ID: <16b251b9-2dbb-419d-bde6-7d5972120587@redhat.com>
Date: Mon, 4 Dec 2023 15:10:09 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Content-Language: en-US
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
 linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20231201104759.949340-1-shinichiro.kawasaki@wdc.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231201104759.949340-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/1/23 11:47, Shin'ichiro Kawasaki wrote:
> p2sb_bar() unhides P2SB device to get resources from the device. It
> guards the operation by locking pci_rescan_remove_lock so that parallel
> rescans do not find the P2SB device. However, this lock causes deadlock
> when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> Hence the deadlock.
> 
> To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
> Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
> refer the cache and return to the caller.
> 
> Link: https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
> This patch reflects discussions held at the Link tag. I confirmed this patch
> fixes the problem using a system with i2c_i801 device, building i2c_i801
> module as both built-in and loadable. Reviews will be appreicated.

Andy, you know this code best, can you review this patch please?

Regards,

Hans



> 
>  drivers/platform/x86/p2sb.c | 125 +++++++++++++++++++++++++-----------
>  1 file changed, 87 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> index 1cf2471d54dd..97e9b44f5f1a 100644
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -26,6 +26,16 @@ static const struct x86_cpu_id p2sb_cpu_ids[] = {
>  	{}
>  };
>  
> +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> +#define NR_P2SB_RES_CACHE 8
> +
> +struct p2sb_res_cache {
> +	u32 bus_dev_id;
> +	struct resource res;
> +};
> +
> +static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
> +
>  static int p2sb_get_devfn(unsigned int *devfn)
>  {
>  	unsigned int fn = P2SB_DEVFN_DEFAULT;
> @@ -39,8 +49,13 @@ static int p2sb_get_devfn(unsigned int *devfn)
>  	return 0;
>  }
>  
> +static bool p2sb_invalid_resource(struct resource *res)
> +{
> +	return res->flags == 0;
> +}
> +
>  /* Copy resource from the first BAR of the device in question */
> -static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
> +static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
>  {
>  	struct resource *bar0 = &pdev->resource[0];
>  
> @@ -56,48 +71,29 @@ static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
>  	mem->end = bar0->end;
>  	mem->flags = bar0->flags;
>  	mem->desc = bar0->desc;
> -
> -	return 0;
>  }
>  
> -static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
>  {
>  	struct pci_dev *pdev;
>  	int ret;
> +	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
>  
>  	pdev = pci_scan_single_device(bus, devfn);
> -	if (!pdev)
> +	if (!pdev || p2sb_invalid_resource(&pdev->resource[0]))
>  		return -ENODEV;
>  
> -	ret = p2sb_read_bar0(pdev, mem);
> +	p2sb_read_bar0(pdev, &cache->res);
> +	cache->bus_dev_id = bus->dev.id;
>  
>  	pci_stop_and_remove_bus_device(pdev);
>  	return ret;
>  }
>  
> -/**
> - * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> - * @bus: PCI bus to communicate with
> - * @devfn: PCI slot and function to communicate with
> - * @mem: memory resource to be filled in
> - *
> - * The BIOS prevents the P2SB device from being enumerated by the PCI
> - * subsystem, so we need to unhide and hide it back to lookup the BAR.
> - *
> - * if @bus is NULL, the bus 0 in domain 0 will be used.
> - * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> - *
> - * Caller must provide a valid pointer to @mem.
> - *
> - * Locking is handled by pci_rescan_remove_lock mutex.
> - *
> - * Return:
> - * 0 on success or appropriate errno value on error.
> - */
> -int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> +static int p2sb_cache_resources(void)
>  {
> -	struct pci_dev *pdev_p2sb;
> -	unsigned int devfn_p2sb;
> +	struct pci_bus *bus;
> +	unsigned int devfn_p2sb, slot_p2sb, fn;
>  	u32 value = P2SBC_HIDE;
>  	int ret;
>  
> @@ -106,8 +102,8 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
>  	if (ret)
>  		return ret;
>  
> -	/* if @bus is NULL, use bus 0 in domain 0 */
> -	bus = bus ?: pci_find_bus(0, 0);
> +	/* Assume P2SB is on the bus 0 in domain 0 */
> +	bus = pci_find_bus(0, 0);
>  
>  	/*
>  	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
> @@ -115,18 +111,31 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
>  	 */
>  	pci_lock_rescan_remove();
>  
> -	/* Unhide the P2SB device, if needed */
> +	/*
> +	 * The BIOS prevents the P2SB device from being enumerated by the PCI
> +	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
> +	 * Unhide the P2SB device here, if needed.
> +	 */
>  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
>  	if (value & P2SBC_HIDE)
>  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
>  
> -	pdev_p2sb = pci_scan_single_device(bus, devfn_p2sb);
> -	if (devfn)
> -		ret = p2sb_scan_and_read(bus, devfn, mem);
> -	else
> -		ret = p2sb_read_bar0(pdev_p2sb, mem);
> -	pci_stop_and_remove_bus_device(pdev_p2sb);
> +	/* Scan the P2SB device and cache its BAR0 */
> +	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
> +	if (ret)
> +		goto out;
>  
> +	/*
> +	 * When function number of the P2SB device is zero, scan other function
> +	 * numbers. If devices are available, cache their BAR0.
> +	 */
> +	if (!PCI_FUNC(devfn_p2sb)) {
> +		slot_p2sb = PCI_SLOT(devfn_p2sb);
> +		for (fn = 1; fn < 8; fn++)
> +			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
> +	}
> +
> +out:
>  	/* Hide the P2SB device, if it was hidden */
>  	if (value & P2SBC_HIDE)
>  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
> @@ -136,9 +145,49 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
>  	if (ret)
>  		return ret;
>  
> -	if (mem->flags == 0)
> +	return 0;
> +}
> +
> +/**
> + * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> + * @bus: PCI bus to communicate with
> + * @devfn: PCI slot and function to communicate with
> + * @mem: memory resource to be filled in
> + *
> + * if @bus is NULL, the bus 0 in domain 0 will be used.
> + * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> + *
> + * Caller must provide a valid pointer to @mem.
> + *
> + * Return:
> + * 0 on success or appropriate errno value on error.
> + */
> +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> +{
> +	int ret;
> +	struct p2sb_res_cache *cache;
> +
> +	bus = bus ? bus : pci_find_bus(0, 0);
> +
> +	if (!devfn) {
> +		ret = p2sb_get_devfn(&devfn);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	cache = &p2sb_resources[PCI_FUNC(devfn)];
> +	if (p2sb_invalid_resource(&cache->res) ||
> +	    cache->bus_dev_id != bus->dev.id)
>  		return -ENODEV;
>  
> +	memcpy(mem, &cache->res, sizeof(*mem));
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(p2sb_bar);
> +
> +static int __init p2sb_fs_init(void)
> +{
> +	p2sb_cache_resources();
> +	return 0;
> +}
> +fs_initcall(p2sb_fs_init);


