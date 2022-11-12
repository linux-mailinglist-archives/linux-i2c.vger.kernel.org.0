Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE146265EF
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Nov 2022 01:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiKLAU2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 19:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbiKLAU1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 19:20:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3A0BC2D;
        Fri, 11 Nov 2022 16:20:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5563E6207F;
        Sat, 12 Nov 2022 00:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF2AC433D6;
        Sat, 12 Nov 2022 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668212425;
        bh=oNKpFMiVqEx9a2F+79u5/Oy5/BPF4GsQuOKfE3HpXVE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=p+C0GKSj/10Lqgl8cQs/vR0+CdDE2spABxEGWKemi4ZuNMn4lcnB3K7DI5R6F5ffy
         Hdtjg/Hp67Z5l198dLWLgfdr23NB3VlxIfl/7RvgctbE7est6vY3djKhybfg4rdt9u
         wm2zqBDORVjQqB+0DoP4W/t5IL+vlS1cK3o7LHKJezE3/Rsf5JW036ckrS+qSakkVN
         Rvvq79j2K5IrPWzRcXGF5qyEd3aj8ZgbIbrkqZlNWXv0muHhdC0fLzkLx6p1sF2zL9
         axRdzQwbGF6VMrkRzeZ6EtNINpvh4MQDR6e8fNbf/KC3gupmXsDLkfs0glEQsEU8lG
         R62qRA2t8nWrA==
Date:   Fri, 11 Nov 2022 18:20:23 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] acpi,pci: handle duplicate IRQ routing entries
 returned from _PRT
Message-ID: <20221112002023.GA764787@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220917090944.110885-1-mat.jonczyk@o2.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+cc Jean, linux-i2c]

On Sat, Sep 17, 2022 at 11:09:44AM +0200, Mateusz Jończyk wrote:
> On some platforms, the ACPI _PRT function returns duplicate interrupt
> routing entries. Linux uses the first matching entry, but sometimes the
> second matching entry contains the correct interrupt vector.

Rafael, Jean, what do you think about this?  It seems like kind of a
lot of infrastructure to deal with this oddness, but I'm not really
opposed to it.

This is in i2c-i801.c, which seems to have some support for polling;
maybe it could make smart enough to complain and automatically switch
to polling if a timeout occurs.

Or maybe we scan the entire _PRT and let the match win (instead of the
first as we do today).

Or ...?

Google finds a lot of hits for "i801_smbus" "timeout waiting for
interrupt", but I can't tell whether they're a similar _PRT issue or
something else.

> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
> SMBus controller. This controller was nonfunctional unless its interrupt
> usage was disabled (using the "disable_features=0x10" module parameter).
> 
> After investigation, it turned out that the driver was using an
> incorrect interrupt vector: in lspci output for this device there was:
>         Interrupt: pin B routed to IRQ 19
> but after running i2cdetect (without using any i2c-i801 module
> parameters) the following was logged to dmesg:
> 
>         [...]
>         [  132.248657] i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         [  132.248669] i801_smbus 0000:00:1f.3: Transaction timeout
>         [  132.452649] i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         [  132.452662] i801_smbus 0000:00:1f.3: Transaction timeout
>         [  132.467682] irq 17: nobody cared (try booting with the "irqpoll" option)
> 
> Existence of duplicate entries in a table returned by the _PRT method
> was confirmed by disassembling the ACPI DSTD table.
> 
> Linux used the first matching entry, which was incorrect. In order not
> to disrupt existing systems, use the first matching entry unless the
> pci=prtlast kernel parameter is used or a Dell Latitude E6500 laptop is
> detected.
> 
> Disclaimer: there is nothing really interesting connected to the SMBus
> controller on this laptop, but this change may help other systems.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Borislav Petkov <bp@suse.de>
> 
> ---
> v2: do not quote the disassembled ACPI DSDT table - for copyright reasons.
> ---
>  .../admin-guide/kernel-parameters.txt         |  8 ++
>  drivers/acpi/pci_irq.c                        | 89 ++++++++++++++++++-
>  drivers/pci/pci.c                             |  9 ++
>  3 files changed, 102 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 426fa892d311..2ff351db10b8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4190,6 +4190,14 @@
>  				bridge windows. This is the default on modern
>  				hardware. If you need to use this, please report
>  				a bug to <linux-pci@vger.kernel.org>.
> +		prtlast		If the _PRT ACPI method returns duplicate
> +				IRQ routing entries, use the last matching entry
> +				for a given device. If the platform may be
> +				affected by this problem, an error message is
> +				printed to dmesg - this parameter is
> +				ineffective otherwise. If you need to use this,
> +				please report a bug to
> +				<linux-pci@vger.kernel.org>.
>  		routeirq	Do IRQ routing for all PCI devices.
>  				This is normally done in pci_enable_device(),
>  				so this option is a temporary workaround
> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> index 08e15774fb9f..5cead840de0b 100644
> --- a/drivers/acpi/pci_irq.c
> +++ b/drivers/acpi/pci_irq.c
> @@ -196,12 +196,73 @@ static int acpi_pci_irq_check_entry(acpi_handle handle, struct pci_dev *dev,
>  	return 0;
>  }
>  
> +extern bool pci_prtlast;
> +
> +static const struct dmi_system_id pci_prtlast_dmi[] = {
> +	{
> +		.ident = "Dell Latitude E6500",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6500"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static bool acpi_pci_prt_use_last(struct acpi_prt_entry *curr,
> +				  const char *current_source,
> +				  const char *previous_match_source,
> +				  int previous_match_index)
> +{
> +	bool ret;
> +	const struct dmi_system_id *id;
> +	const int msg_bufsize = 512;
> +	char *msg = kmalloc(msg_bufsize, GFP_KERNEL);
> +
> +	if (!msg)
> +		return false;
> +
> +	snprintf(msg, msg_bufsize,
> +		 FW_BUG
> +		 "ACPI _PRT returned duplicate IRQ routing entries for PCI device "
> +		 "%04x:%02x:%02x[INT%c]: %s[%d] and %s[%d]. ",
> +		 curr->id.segment, curr->id.bus, curr->id.device,
> +		 pin_name(curr->pin),
> +		 previous_match_source, previous_match_index,
> +		 current_source, curr->index);
> +
> +	id = dmi_first_match(pci_prtlast_dmi);
> +
> +	if (id) {
> +		pr_warn("%s%s detected, using last entry.\n",
> +			msg, id->ident);
> +
> +		ret = true;
> +	} else if (pci_prtlast) {
> +		pr_err(
> +"%sUsing last entry, as directed on the command line. If this helps, report a bug.\n",
> +		       msg);
> +
> +		ret = true;
> +	} else {
> +		pr_err("%sIf necessary, use \"pci=prtlast\" and report a bug.\n",
> +		       msg);
> +
> +		ret = false;
> +	}
> +
> +	kfree(msg);
> +	return ret;
> +}
> +
>  static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
> -			  int pin, struct acpi_prt_entry **entry_ptr)
> +			  int pin, struct acpi_prt_entry **entry_ptr_out)
>  {
>  	acpi_status status;
>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct acpi_pci_routing_table *entry;
> +	struct acpi_prt_entry *match = NULL;
> +	const char *match_source = NULL;
>  	acpi_handle handle = NULL;
>  
>  	if (dev->bus->bridge)
> @@ -219,13 +280,33 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
>  
>  	entry = buffer.pointer;
>  	while (entry && (entry->length > 0)) {
> -		if (!acpi_pci_irq_check_entry(handle, dev, pin,
> -						 entry, entry_ptr))
> -			break;
> +		struct acpi_prt_entry *curr;
> +
> +		if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {
> +			if (!match) {
> +				// first match
> +				match = curr;
> +				match_source = entry->source;
> +			} else if (!acpi_pci_prt_use_last(curr,
> +							  entry->source,
> +							  match_source,
> +							  match->index)) {
> +				// duplicates found, use first entry
> +				kfree(curr);
> +			} else {
> +				// duplicates found, use last entry
> +				kfree(match);
> +				match = curr;
> +				match_source = entry->source;
> +			}
> +		}
> +
>  		entry = (struct acpi_pci_routing_table *)
>  		    ((unsigned long)entry + entry->length);
>  	}
>  
> +	*entry_ptr_out = match;
> +
>  	kfree(buffer.pointer);
>  	return 0;
>  }
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 95bc329e74c0..a14a2e4e4197 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -155,6 +155,11 @@ static bool pci_bridge_d3_disable;
>  /* Force bridge_d3 for all PCIe ports */
>  static bool pci_bridge_d3_force;
>  
> +#ifdef CONFIG_ACPI
> +/* Use the last matching entry from the table returned by the _PRT ACPI method. */
> +bool pci_prtlast;
> +#endif
> +
>  static int __init pcie_port_pm_setup(char *str)
>  {
>  	if (!strcmp(str, "off"))
> @@ -6896,6 +6901,10 @@ static int __init pci_setup(char *str)
>  				pci_add_flags(PCI_SCAN_ALL_PCIE_DEVS);
>  			} else if (!strncmp(str, "disable_acs_redir=", 18)) {
>  				disable_acs_redir_param = str + 18;
> +#ifdef CONFIG_ACPI
> +			} else if (!strncmp(str, "prtlast", 7)) {
> +				pci_prtlast = true;
> +#endif
>  			} else {
>  				pr_err("PCI: Unknown option `%s'\n", str);
>  			}
> 
> base-commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
> -- 
> 2.25.1
> 
