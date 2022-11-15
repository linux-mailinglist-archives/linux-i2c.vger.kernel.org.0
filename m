Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7206629353
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 09:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbiKOIgV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 03:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbiKOIgU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 03:36:20 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92ED6A45A;
        Tue, 15 Nov 2022 00:36:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 4F651336D7;
        Tue, 15 Nov 2022 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668501378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4tKdXBWNvg+z3airdpWFuU1qjWkHff+0GGnYxrPeMn8=;
        b=syhFFZjmY4/YWluAt369BB2obYCMnpd5bN8ibXstiNKXHoYHW35tTWjrItbDTf6yfRU+1T
        5NVCQheSB50r6YfFvJ+EhXPmq1KmDb2Tgp4N21YSRodIjCRFgoUbWh8ILMcVRpNqBtIsFP
        WU0j0z8AIh0f58h+KF2S9FUxNf7medU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668501378;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4tKdXBWNvg+z3airdpWFuU1qjWkHff+0GGnYxrPeMn8=;
        b=9pQP7jOMBkIA4ftbYQjFwibFPUz5Lm1jq5+KEzbIrvlk1dIKvMIcsGQGBPFaq7v36HH7/X
        rWyJXq+pUH1q6sDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFFF013A91;
        Tue, 15 Nov 2022 08:36:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id W6bFOIFPc2PgQgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 15 Nov 2022 08:36:17 +0000
Date:   Tue, 15 Nov 2022 09:36:17 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Mateusz =?UTF-8?B?Sm/FhGN6eWs=?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v2] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
Message-ID: <20221115093617.519f3aeb@endymion.delvare>
In-Reply-To: <20221113173442.5770-1-mat.jonczyk@o2.pl>
References: <20221112200927.7255-1-mat.jonczyk@o2.pl>
        <20221113173442.5770-1-mat.jonczyk@o2.pl>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mateusz,

On Sun, 13 Nov 2022 18:34:42 +0100, Mateusz Jo=C5=84czyk wrote:
> On some platforms, the ACPI _PRT function returns duplicate interrupt
> routing entries. Linux uses the first matching entry, but sometimes the
> second matching entry contains the correct interrupt vector.
>=20
> Print a warning to dmesg if duplicate interrupt routing entries are
> present, so that we could check how many models are affected.

Excellent idea. We want hardware manufacturers to fix such bugs in the
firmware, and the best way for this to happen is to report them
whenever they are encountered.

> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
> SMBus controller. This controller was nonfunctional unless its interrupt
> usage was disabled (using the "disable_features=3D0x10" module parameter).
>=20
> After investigation, it turned out that the driver was using an
> incorrect interrupt vector: in lspci output for this device there was:
>         Interrupt: pin B routed to IRQ 19
> but after running i2cdetect (without using any i2c-i801 module
> parameters) the following was logged to dmesg:
>=20
>         [...]
>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         i801_smbus 0000:00:1f.3: Transaction timeout
>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         i801_smbus 0000:00:1f.3: Transaction timeout
>         irq 17: nobody cared (try booting with the "irqpoll" option)
>=20
> Existence of duplicate entries in a table returned by the _PRT method
> was confirmed by disassembling the ACPI DSDT table.

Excuse a probably stupid question, but what would happen if we would
plain ignore the IRQ routing information from ACPI in this case? Would
we fallback to some pure-PCI routing logic which may have a chance to
find the right IRQ routing (matching the second ACPI routing entry in
this case)?

> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Jean Delvare <jdelvare@suse.com>
>=20
> --
> v2: - add a newline at the end of the kernel log message,
>     - replace: "if (match =3D=3D NULL)" -> "if (!match)"
>     - patch description tweaks.
>=20
> Tested on two computers, including the affected Dell Latitude E6500 lapto=
p.
>=20
>  drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> index 08e15774fb9f..a4e41b7b71ed 100644
> --- a/drivers/acpi/pci_irq.c
> +++ b/drivers/acpi/pci_irq.c
> @@ -203,6 +203,8 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev=
 *dev,
>  	struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct acpi_pci_routing_table *entry;
>  	acpi_handle handle =3D NULL;
> +	struct acpi_prt_entry *match =3D NULL;
> +	const char *match_int_source =3D NULL;
> =20
>  	if (dev->bus->bridge)
>  		handle =3D ACPI_HANDLE(dev->bus->bridge);
> @@ -219,13 +221,30 @@ static int acpi_pci_irq_find_prt_entry(struct pci_d=
ev *dev,
> =20
>  	entry =3D buffer.pointer;
>  	while (entry && (entry->length > 0)) {
> -		if (!acpi_pci_irq_check_entry(handle, dev, pin,
> -						 entry, entry_ptr))
> -			break;
> +		struct acpi_prt_entry *curr;
> +
> +		if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {
> +			if (!match) {
> +				match =3D curr;
> +				match_int_source =3D entry->source;
> +			} else {
> +				pr_warn(FW_BUG
> +				"ACPI _PRT returned duplicate IRQ routing entries for device "
> +					"%04x:%02x:%02x[INT%c]: %s[%d] and %s[%d].\n",

The beginning of the string should be aligned with the opening
parenthesis, and the string should be on a single line (this is a
encouraged exception to the 80-column rule). I would also omit the
tailing dot for consistency.

> +					curr->id.segment, curr->id.bus, curr->id.device,

Is the IRQ per PCI device, or per PCI function? If the latter, then you
should print "%02x.%x" instead of just "%02x", with the extra element
being curr->id.function.

> +					pin_name(curr->pin),
> +					match_int_source, match->index,
> +					entry->source, curr->index);
> +				// we use the first matching entry nonetheless

The rest of the file uses /* C89-style comments */ so I would stick to
that for consistency.

> +			}
> +		}
> +
>  		entry =3D (struct acpi_pci_routing_table *)
>  		    ((unsigned long)entry + entry->length);
>  	}
> =20
> +	*entry_ptr =3D match;
> +
>  	kfree(buffer.pointer);
>  	return 0;
>  }

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

(Tested on a Dell OptiPlex 9020 not affected by the problem.)

--=20
Jean Delvare
SUSE L3 Support
