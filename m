Return-Path: <linux-i2c+bounces-11467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A9AD9755
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 23:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49FA17AA770
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 21:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D0528D8CF;
	Fri, 13 Jun 2025 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZbpXBjn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A72397A4;
	Fri, 13 Jun 2025 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749850031; cv=none; b=HQDm+WTZ0apLTCuy4mTNHR1wZbmOC1mjjVWrrtTOSGayzMNk5o/gi3ezkrwpgOxtAisdrosb/O0NHMswqSC8p8kQledHjOYllY2F5mRWoIX0oioj1zQGF8XtNmoqA8UgkdFKchP93Gumsb2WoWaDi9wUNDfUG0nFOK2UFFb+S2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749850031; c=relaxed/simple;
	bh=uao9vXicfmNGv7hAWWVlUXBcpeUEFrEd/9ktZYSF5ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dilfbHh4ddjSDIa8/lp8fKlVdZIezejxeMDxe8Tr9xUG195kgAjoDmbIO7onYUXKV+f7nRdqry/KPOASd07SvIWsLvGAqIFceaVUDDEUPBFgCERaGMOB2U9k/TmWG2ZrqzQuSMsJpMf8CyRlvx+gk43XFa50ueSKfj133mg2wNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZbpXBjn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62DCC4CEE3;
	Fri, 13 Jun 2025 21:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749850030;
	bh=uao9vXicfmNGv7hAWWVlUXBcpeUEFrEd/9ktZYSF5ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nZbpXBjnZAtM27vBM686WDSlmCevbldUDcv0haHfTvmlSbLoJxSVxv9p7sUN/igzZ
	 DQK/ujQyUDtDXKo2+9/B+og9k8xaILfs7yj0Ci3wDQTJoB15fvuJM/ChAGShZ3sJS/
	 bufKhI9YRG+YCjlQBcTTG/xsYrSg2fEsxsIA3vHaqMgwXY8cAwIwDfocOYkk4kfsyJ
	 P4ztXwL4ANgDMym+oXwaG7Bg27bJtH+40UVzknDgw/qfvepHaMcja5TXadWM+ftgzY
	 JKVnZ/05xPQ/3S7h35bYqr18+mF84NOxMFMKg9d3gusw5T0wrId6QwXlt1I1+pXePB
	 G+ukl5JR60TBg==
Date: Fri, 13 Jun 2025 16:27:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 24/28] PCI: Add Microchip LAN9662 PCI Device ID
Message-ID: <20250613212709.GA979346@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-25-herve.codina@bootlin.com>

On Fri, Jun 13, 2025 at 03:48:04PM +0200, Herve Codina wrote:
> Existing code uses the 0x9660 value (LAN9662 PCI Device ID) in several
> places.
> 
> Avoid this direct use of the 0x9660 value replacing it by defined PCI
> Device ID.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/misc/lan966x_pci.c | 2 +-
>  drivers/pci/quirks.c       | 2 +-
>  include/linux/pci_ids.h    | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
> index b28066c96534..e60ab662b8f3 100644
> --- a/drivers/misc/lan966x_pci.c
> +++ b/drivers/misc/lan966x_pci.c
> @@ -197,7 +197,7 @@ static void lan966x_pci_remove(struct pci_dev *pdev)
>  }
>  
>  static struct pci_device_id lan966x_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662) },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, lan966x_pci_ids);
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d7f4ee634263..bde077ce663a 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -6302,7 +6302,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xa76e, dpc_log_size);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
> -DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662, of_pci_make_dev_node);
>  
>  /*
>   * Devices known to require a longer delay before first config space access
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index e2d71b6fdd84..5d69fde7dd97 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -934,6 +934,7 @@
>  #define PCI_VENDOR_ID_EFAR		0x1055
>  #define PCI_DEVICE_ID_EFAR_SLC90E66_1	0x9130
>  #define PCI_DEVICE_ID_EFAR_SLC90E66_3	0x9463
> +#define PCI_DEVICE_ID_EFAR_LAN9662	0x9660
>  
>  #define PCI_VENDOR_ID_MOTOROLA		0x1057
>  #define PCI_DEVICE_ID_MOTOROLA_MPC105	0x0001
> -- 
> 2.49.0
> 

