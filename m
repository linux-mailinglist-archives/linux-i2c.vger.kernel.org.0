Return-Path: <linux-i2c+bounces-1882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30BB85CA7C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 23:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CEEE283829
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 22:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576401534EB;
	Tue, 20 Feb 2024 22:12:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663BA152E07
	for <linux-i2c@vger.kernel.org>; Tue, 20 Feb 2024 22:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708467144; cv=none; b=MEAErkVRGBr+fHKm5LSOHI38PG27cr4IWs18tu4YFe6DIc6uOcr78clG0gL9V6utbeQQ9Fuj8hX4xJ8/y/7GXlE/tBOqp4f5DAPX/9b68JA9SThKx0ZVCK30yer4RIo3aRVWGCvALKzAzh2x3HEh7D8SW+zRVr5sJcT80g0UO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708467144; c=relaxed/simple;
	bh=jhOQFc9APgBspPIxG9I1BX/ftsAh5rGUbYwZn98o1VQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAFv0jQ0MP+QZoA970szKapddU/AvtyfVr/jwRxr4kaMsPP+R4xVCPAFO/9hC7K+WTqcSpJkTqgkFcSkuoH5/RxN9rmgiNiTqTIttX2KK9gM1ivT22m7rDi9qtdzxsElZLBYJ4RkE107dOHYMX24MXjg78q4mCSKtsoFTBPf0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 19a140a6-d03d-11ee-b3cf-005056bd6ce9;
	Wed, 21 Feb 2024 00:12:14 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Wed, 21 Feb 2024 00:12:13 +0200
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
	Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
Message-ID: <ZdUjvUG3aUgGCwBs@surfacebook.localdomain>
References: <20231226124254.66102-1-mat.jonczyk@o2.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231226124254.66102-1-mat.jonczyk@o2.pl>

Tue, Dec 26, 2023 at 01:42:54PM +0100, Mateusz Jończyk kirjoitti:
> On some platforms, the ACPI _PRT function returns duplicate interrupt
> routing entries. Linux uses the first matching entry, but sometimes the
> second matching entry contains the correct interrupt vector.
> 
> As a debugging aid, print a warning to dmesg if duplicate interrupt
> routing entries are present. This way, we could check how many models
> are affected.
> 
> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
> SMBus controller. This controller is nonfunctional unless its interrupt
> usage is disabled (using the "disable_features=0x10" module parameter).
> 
> After investigation, it turned out that the driver was using an
> incorrect interrupt vector: in lspci output for this device there was:
>         Interrupt: pin B routed to IRQ 19
> but after running i2cdetect (without using any i2c-i801 module
> parameters) the following was logged to dmesg:
> 
>         [...]
>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         i801_smbus 0000:00:1f.3: Transaction timeout
>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         i801_smbus 0000:00:1f.3: Transaction timeout
>         irq 17: nobody cared (try booting with the "irqpoll" option)
> 
> Existence of duplicate entries in a table returned by the _PRT method
> was confirmed by disassembling the ACPI DSDT table.
> 
> Windows XP is using IRQ3 (as reported by HWiNFO32 and in the Device
> Manager), which is neither of the two vectors returned by _PRT.
> As HWiNFO32 decoded contents of the SPD EEPROMs, the i2c-i801 device is
> working under Windows. It appears that Windows has reconfigured the
> chipset independently to use another interrupt vector for the device.
> This is possible, according to the chipset datasheet [1], page 436 for
> example (PIRQ[n]_ROUT—PIRQ[A,B,C,D] Routing Control Register).

> [1] https://www.intel.com/content/dam/doc/datasheet/io-controller-hub-9-datasheet.pdf
> 

Can you convert this to be a Link tag?

Link: ...URL... # [1]
Signed-off-by: ...

> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Jean Delvare <jdelvare@suse.de>

Please, move these (Cc lines) down after --- cutter line.

> Previously-reviewed-by: Jean Delvare <jdelvare@suse.de>
> Previously-tested-by: Jean Delvare <jdelvare@suse.de>

This shouldn't be in the commit message, just use the comment block
(after --- line) for this.

...

>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct acpi_pci_routing_table *entry;
>  	acpi_handle handle = NULL;
> +	struct acpi_prt_entry *match = NULL;
> +	const char *match_int_source = NULL;

Can you preserve reversed xmas tree ordering?

...

>  	while (entry && (entry->length > 0)) {
> -		if (!acpi_pci_irq_check_entry(handle, dev, pin,
> -						 entry, entry_ptr))
> -			break;
> +		struct acpi_prt_entry *curr;
> +
> +		if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {

> +			if (!match) {

Why not positive condition?

> +				match = curr;
> +				match_int_source = entry->source;
> +			} else {
> +				dev_warn(&dev->dev, FW_BUG
> +				       "ACPI _PRT returned duplicate IRQ routing entries for INT%c: %s[%d] and %s[%d]\n",
> +				       pin_name(curr->pin),
> +				       match_int_source, match->index,
> +				       entry->source, curr->index);
> +				/* We use the first matching entry nonetheless,
> +				 * for compatibility with older kernels.
> +				 */
> +			}
> +		}

-- 
With Best Regards,
Andy Shevchenko



