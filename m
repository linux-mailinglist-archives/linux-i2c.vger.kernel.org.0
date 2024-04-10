Return-Path: <linux-i2c+bounces-2872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6F89F25B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 14:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC75284145
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 12:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AD7158D75;
	Wed, 10 Apr 2024 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BKigrls3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312C13D2BC;
	Wed, 10 Apr 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752512; cv=none; b=TF9EMFOCSy5L6Cp3RusV4MCbyfU91MuJHyg+o92FsGJ/dyp/cjrsZkPibKEqtyBsfxs7aSp9a0xfetFoWMupXlOcgtYDgMpjvUxpP3phAIp8MKCAg3ctkjJ+tVKAv3xWzx/Jqhh8lI7BLt2IwXPxkaaJyiuDWiXE2IgwhtfepjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752512; c=relaxed/simple;
	bh=zIUfJWhof1UMg6uEwOAu/mj91VoIle+JxLjGJ7YPwWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzA/Ez6vbIqJMMTiD9ym2otB4SH4MoHjcjKFqduo4w/WKtfBluwvd1F9g/nm1Gad9R8ItqL1tpv8jwEUwjrbj6Pj/gNRo1GMpyp3eR6WssfQO3mou8TOaQWFTo0rxmOJTG0gdmPCgWRNAhKqvkgcE3OSecRpmrAVqhIj/yaSkyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BKigrls3; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 224176000A;
	Wed, 10 Apr 2024 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712752502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zshKLDyDonwwJOFV5yyCRSdib7yb+zjws8DcpnfUXkI=;
	b=BKigrls3jfxPWZ3a/Ku6NujZQUUa940viUX2NvVyuSDflgyRf7cQ5v5lr0GGQfVfLK7QRx
	eXs2SeYrU6zP0Upj2/zxGa2SOc5f+QVX83hbvX04odQHq0SPzeHMG53BZ1kDQcykmZPHBJ
	+gOszkziMDuE1eXeuCi3TW9H83/13Bvp44oym3Bf8rnRHvoMw29KCMk1VhpE8KFP+6KxI8
	RwwI7+yF2GmBAwhcUpAGCLek7KB8naJjR8gBP2FdRLvNL+DdIjAodEccQUo6w6yZjGVhXT
	A96Qx4Q9SulLQG9OIRkLr0xHTKqdwRX1WQgEEByHDvBN6IqBWwBGL1O8BQ2HoA==
Date: Wed, 10 Apr 2024 14:35:00 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
 <robh@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
Message-ID: <20240410143500.783d7eba@bootlin.com>
In-Reply-To: <CAGETcx-Yxtkdfytsota3AciS6M9UeOaKSRtaHfH5pm60KWVmJA@mail.gmail.com>
References: <20240409053704.428336-1-saravanak@google.com>
	<20240409150247.61e30a86@bootlin.com>
	<CAGETcx-Yxtkdfytsota3AciS6M9UeOaKSRtaHfH5pm60KWVmJA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

On Tue, 9 Apr 2024 18:06:33 -0700
Saravana Kannan <saravanak@google.com> wrote:

> On Tue, Apr 9, 2024 at 6:02 AM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Hi Saravana,
> >
> > +CC Luca and Thomas
> >
> > On Mon,  8 Apr 2024 22:37:01 -0700
> > Saravana Kannan <saravanak@google.com> wrote:
> >  
> > > Don't bother reviewing this patch. It needs to be tested and possibly
> > > refactored first.
> > >
> > > Geert and Herve,
> > >
> > > This patch serious should hopefully fix both of your use cases
> > > [1][2][3]. Can you please check to make sure the device links created
> > > to/from the overlay devices are to/from the right ones?
> > >
> > > I've only compile tested it. If I made some obvious mistake, feel free
> > > to fix it and give it a shot.
> > >
> > > Cc: Rob Herring <robh@kernel.org>
> > >
> > > [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> > > [2] - https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> > > [3] - https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> > >  
> >
> > I tested your patches.
> >
> > Concerning my use cases, they fix the issue described in
> >   https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/  
> 
> I went back and looked at the example. I'm not even sure I understand
> that example. In that example at the link above, are you saying
> without any changes to upstream reg_dock_sys_3v3 was listing it's
> supplier as i2c5 instead of tca6424_dock_1? Why wasn't Geert's
> existing changes in of_i2c_notify not sufficient? Looking at it, it
> does:
> rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
> 
> Which should clear the flag for tca6424_dock_1. Can you help me
> understand why it's not getting cleared?

I don't really know but I can mke some asumptions.

Maybe the link involved in the issue is created quite early in the overlay
applying process, before the calls to the of notifier of_i2c_notify() that
can clear the FWNODE_FLAG_NOT_DEVICE.

The link is created by of_link_to_phandle(). This functions is triggered
from of_fwnode_add_links() which is the .add_link() operation of the OF
fwnode_operations.

The operation is called by fw_devlink_parse_fwnode(), itself triggered by
fw_devlink_link_device() each time device_add() is called.

If the device_add() related to the reg_dock_sys_3v3 is called before the
of_i2c_notify() related to tca6424_dock_1, the FWNODE_FLAG_NOT_DEVICE flag
in tca6424_dock_1 is not cleared when of_link_to_phandle() is called.

Does this scenario make sense ?

> 
> > But not the one described in
> >   https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> > A link is still present between the i2c@600 and the PCI device.
> > instead of the i2c@600 and the pci-ep-bus.  
> 
> What do you mean by PCI device here? You say the same thing in the
> link, but I don't understand what you mean. Can you clarify what
> exactly gets added by the overlay? Please use the fwnode name in all
> the descriptions, even when talking about device links. That should
> help avoid the confusion.
> 
> Also, if you can show what the target node of the overlay looks like,
> that'd help too.
> 
> > Adding the patch clearing the FWNODE_FLAG_NOT_DEVICE in device_add() available
> > at [1] on top of your patches fixes the link issue.
> > With this additional patch applied, the link is present between the i2c@600
> > and the pci-ep-bus.  
> 
> I know the problem with this patch series. But to fix it properly, I
> need to understand the root of the overlay node in your examples and
> the target it's applied to.


This is the Microchip Lan966x PCI device use case.
The Lan966x is a component that can be a "standard" SoC (i.e. core CPUs
and some peripherals) or as a PCI device.
When in PCI device mode, the core CPUs are not available and are replaced
by an endpoint PCI. The PCI host in PCI device mode has to act the code CPUs
in SoC mode. In other word the PCI host has access to peripherals (PCI MMIO
accesses) and has to handle each peripherals.

Drivers for these peripherals are already available in the kernel (reset
controller, i2c controller, network switch, clock controllers, ...) and are
functional when the Lan966x is in SoC mode.

In order to re-use all of these drivers, the solution was to have a Lan966x
PCI driver that is probe() matching the Lan966x PCI Vendor/Device ID.
This driver then load a DT overlay to described the Lan966x internal components.

Basically, the base DT (the DT describing the PCI host board) has the PCI nodes
between the root PCI node and the Lan966x PCI device built at runtime during the
PCI bus scan. At the end of the scan, the Lan966x driver load the overlay and
the final DT looks like the following:
--- 8< ---
soc {
	...
	pcie@d0070000 {
		compatible = "marvell,armada-3700-pcie";
		...
		/* A bridge, created at runtime during PCI scan */
		pci@0,0 {
			compatible = "pci11ab,100\0pciclass,060400\0pciclass,0604";
			...

			/* The Lan966x PCI device, created at runtime during PCI scan */
			dev@0,0 { 
				compatible = "pci1055,9660\0pciclass,020000\0pciclass,0200";
				...

				/*
				 * This node is added by the overlay
				 * during lan966x PCI driver probe()
				 */
				pci-ep-bus@0 {
					compatible = "simple-bus";
					...

					flx0: flexcom@e0040000 {
						compatible = "atmel,sama5d2-flexcom";
						reg = <0xe0040000 0x100>;
						ranges = <0x0 0xe0040000 0x800>;
						...			

						i2c_lan966x: i2c@600 {
							compatible = "microchip,lan966x-i2c";
							reg = <0x600 0x200>;
							...
						};
					};
					...
				};
			};
		};
	};
};
--- 8< ---

Without clearing FWNODE_FLAG_NOT_DEVICE, a link is created between
i2c@600 and dev@0,0.
With the FWNODE_FLAG_NOT_DEVICE cleared in device_add(), the link is
created between i2c@600 and pci-ep-bus@0.

flexcom@e0040000 is a MFD device.

In the lan966x PCI driver, the overlay is applied using the following:
--- 8< ---

static int lan966x_pci_load_overlay(struct lan966x_pci *data)
{
	u32 dtbo_size = __dtbo_lan966x_pci_end - __dtbo_lan966x_pci_begin;
	void *dtbo_start = __dtbo_lan966x_pci_begin;
	int ret;

	ret = of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id,
				   data->dev->of_node);
	if (ret)
		return ret;

	return 0;
}

static int lan966x_pci_probe(struct pci_dev *pdev,
			     const struct pci_device_id *id)
{
	struct device *dev = &pdev->dev;
	struct lan966x_pci *data;
	...
	data->dev = dev;
	...
	ret = lan966x_pci_load_overlay(data);
	if (ret)
		return ret;

	...
	ret = of_platform_default_populate(dev->of_node, NULL, dev);
	if (ret)
		goto err_unload_overlay;

	return 0;
	...
}
--- 8< ---

Hope my explanations were clear enough and answered your question.
Feel free to ask some more details if needed.

I provided only extractions of the full dtso file. If you need some more
information (all nodes, all properties) feel free to ask.

Best regards,
Hervé

