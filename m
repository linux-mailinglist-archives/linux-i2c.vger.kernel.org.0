Return-Path: <linux-i2c+bounces-1840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5A858515
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 19:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF24A284DF3
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 18:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BCB1350EA;
	Fri, 16 Feb 2024 18:26:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2811350C8;
	Fri, 16 Feb 2024 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708107981; cv=none; b=uVG2wpS5YlUOdTLRAD97M30NgyCR2H97o7LM0JqE0WuEil+bBGSBfo7te1YXBIpy0N7DGcu1wH8iGO5LLBcauA1GbaOX61uHYXfjo5taH1XJeXvaa1tUKEGipp6KHekkK2TMKUinfzLrK42bhr2G73gknWoEIJWPDnKsIeD8UEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708107981; c=relaxed/simple;
	bh=ENNPYomZv2DOwlCWBS7j/IZHANnF9ek4BFQ20oT9Q/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWpO4ISeRGNSsjLbN5g62q/qNYLLpPZExC7EnU7RnvNiTLTCucdrnDCE+jk6sRdZYTE+vI46zXZ4Ra07dorbsrZOG65/b1eJLPXhptcXTyWGfA7n/URyYvbVURng0zY/cxecCqYCFZEjXxr/zfvvwN+aZR+KjuOzJrMheX2REVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e43ba6d74fso107769a34.1;
        Fri, 16 Feb 2024 10:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708107978; x=1708712778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnCQSP7Q2DGhdaW7uq0lpYyGZnAXczAPeeTaQs//qA0=;
        b=W5Ex81H8ECPQ/0rJdCwshMtB2uUY05917Dnnc1sAenEw+x1/dkp4/Eedeag9RJqZI9
         dJBk6NN1lLgRNRfVi6A2z0dyINm3X+Q4A0dEGDVDzogTRPcnEtaPI6eQoyam/OGOm/nF
         2uCwmrc63Dw5Cn3kQAvPO8tuODL+yhYypDDtK42fxnGDMbPVKHzEl1+W8ozv1i0sdxjI
         UdyhwceQcNGCjdaJP1C9dBdaMDXgEH5Dkc88oXCOHXa55a/0J3kva5aoKbuO/FoZ1xlO
         fVAkzTj0oAntII1IJvSZLPfXXNUPlS9PsdmHffnfpCDIyL9T6c7FKnjV3itU6knLgyv7
         zaHg==
X-Forwarded-Encrypted: i=1; AJvYcCXftsUBlCYlNF2ye7lfeThpd5ILDEk5ZAOnoJzAA6hCqCVmGdazRNFxdpxHmeefN7oiNPLzboIoSrSKnYhiv7mzcrSi1MYlktxOQUSwh6QmCZOTU84+hI2n/UduV9w5/YYbVA7go974DGlaFXLc9vceJykko4e1L2MeH8Lz4Xay39NwKg==
X-Gm-Message-State: AOJu0YzNjIdW36r8rNpLnNzxLPxsXV+MudA+4TY9MvRoIQwJ9J2uRATI
	R1Re2tlOoMqUM1Tg2sZEcdumkOHNUuM6mo5LkFRMwgrFFbYDP926rLnugmIOW7jhYroo7giVkfl
	v6yA7eYWBMajjvUNvbDnNytXngec=
X-Google-Smtp-Source: AGHT+IHGoPIufXGdjFuT1fdRsqTEs50AnbfO3rPOiWmKC5D/S2cG2DrVUguekw8ejy/zwhugqqv4i8cPs5Qkd/Dydko=
X-Received: by 2002:a05:6820:312:b0:59f:8105:3085 with SMTP id
 l18-20020a056820031200b0059f81053085mr5739812ooe.0.1708107978403; Fri, 16 Feb
 2024 10:26:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231226124254.66102-1-mat.jonczyk@o2.pl>
In-Reply-To: <20231226124254.66102-1-mat.jonczyk@o2.pl>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 Feb 2024 19:26:06 +0100
Message-ID: <CAJZ5v0iHokxYJU0Nx5gT+ay=18uhmnha-bSYk=YUKPROQGZrmw@mail.gmail.com>
Subject: Re: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>, 
	Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 1:50=E2=80=AFPM Mateusz Jo=C5=84czyk <mat.jonczyk@o=
2.pl> wrote:
>
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
> usage is disabled (using the "disable_features=3D0x10" module parameter).
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
> example (PIRQ[n]_ROUT=E2=80=94PIRQ[A,B,C,D] Routing Control Register).
>
> [1] https://www.intel.com/content/dam/doc/datasheet/io-controller-hub-9-d=
atasheet.pdf
>
> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Jean Delvare <jdelvare@suse.de>
> Previously-reviewed-by: Jean Delvare <jdelvare@suse.de>
> Previously-tested-by: Jean Delvare <jdelvare@suse.de>
>
> ---
> Hello,
>
> I'm resurrecting an older patch that was discussed back in January:
>
> https://lore.kernel.org/lkml/20230121153314.6109-1-mat.jonczyk@o2.pl/T/#u
>
> To consider: should we print a warning or an error in case of duplicate
> entries? This may not be serious enough to disturb the user with an
> error message at boot.
>
> I'm also looking into modifying the i2c-i801 driver to disable its usage
> of interrupts if one did not fire.
>
> v2: - add a newline at the end of the kernel log message,
>     - replace: "if (match =3D=3D NULL)" -> "if (!match)"
>     - patch description tweaks.
> v3: - fix C style issues pointed by Jean Delvare,
>     - switch severity from warning to error.
> v3 RESEND: retested on top of v6.2-rc4
> v4: - rebase and retest on top of v6.7-rc7
>     - switch severity back to warning,
>     - change pr_err() to dev_warn() and simplify the code,
>     - modify patch description (describe Windows behaviour etc.)
> ---
>  drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> index ff30ceca2203..1fcf72e335b0 100644
> --- a/drivers/acpi/pci_irq.c
> +++ b/drivers/acpi/pci_irq.c
> @@ -203,6 +203,8 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev=
 *dev,
>         struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
>         struct acpi_pci_routing_table *entry;
>         acpi_handle handle =3D NULL;
> +       struct acpi_prt_entry *match =3D NULL;
> +       const char *match_int_source =3D NULL;
>
>         if (dev->bus->bridge)
>                 handle =3D ACPI_HANDLE(dev->bus->bridge);
> @@ -219,13 +221,30 @@ static int acpi_pci_irq_find_prt_entry(struct pci_d=
ev *dev,
>
>         entry =3D buffer.pointer;
>         while (entry && (entry->length > 0)) {
> -               if (!acpi_pci_irq_check_entry(handle, dev, pin,
> -                                                entry, entry_ptr))
> -                       break;
> +               struct acpi_prt_entry *curr;
> +
> +               if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &c=
urr)) {
> +                       if (!match) {
> +                               match =3D curr;
> +                               match_int_source =3D entry->source;
> +                       } else {
> +                               dev_warn(&dev->dev, FW_BUG

dev_info() would be sufficient here IMV.

> +                                      "ACPI _PRT returned duplicate IRQ =
routing entries for INT%c: %s[%d] and %s[%d]\n",
> +                                      pin_name(curr->pin),
> +                                      match_int_source, match->index,
> +                                      entry->source, curr->index);
> +                               /* We use the first matching entry noneth=
eless,
> +                                * for compatibility with older kernels.
> +                                */
> +                       }
> +               }
> +
>                 entry =3D (struct acpi_pci_routing_table *)
>                     ((unsigned long)entry + entry->length);
>         }
>
> +       *entry_ptr =3D match;
> +
>         kfree(buffer.pointer);
>         return 0;
>  }
>
> base-commit: 861deac3b092f37b2c5e6871732f3e11486f7082
> --

Bjorn, any concerns regarding this one?

