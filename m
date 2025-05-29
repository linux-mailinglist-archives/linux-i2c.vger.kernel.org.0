Return-Path: <linux-i2c+bounces-11154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8AAC7E96
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 15:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38C711BC2FE0
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605CE226165;
	Thu, 29 May 2025 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGpNNkhu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCFA225404;
	Thu, 29 May 2025 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748524755; cv=none; b=QbITcokUhcS+NStmNadzgiYktK1KCTqsq6mdm2BtGOhHwDu+ghDldwmll7UaY/EUOvXiVimhsAfnx7k0DGO0s1/O1rMsfsV2DJ7oYVLHprXQaX51fW7ZP1kevFSgNfd8lA6fgrGNrsxTnx+S4Z2WXBOpvGlGk1Cwqm1LxXm1iUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748524755; c=relaxed/simple;
	bh=0FPlq097Hcbp5iDFnnpPEASquDvr0YwVHBR1ZnHEybM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4g2iG+mYGYySi+Vc4ndUJ+AIwFkgGas8acigmEncOq3Qp1P1MPOc216D6axVSIzKawZZn0oeZhCGGBGHYagQx5j4iRDr64wCCE/wkEEqcLCPGSfOwDTWl9otIkBXcmaPmUhVUGN2aUdzLAh6Ykq9ijsUjJo+YfWOKzeNHbRRMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGpNNkhu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FFAC4CEE7;
	Thu, 29 May 2025 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748524754;
	bh=0FPlq097Hcbp5iDFnnpPEASquDvr0YwVHBR1ZnHEybM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGpNNkhuC+2wzq01z4Hg6fg9gFT4OCGfEH33UX/SRQFSxkuIstRSlH8RLLfCGnjJP
	 uLFY9f0FoIssiPqFtK9kkSboA5flQ+CQUdZkyEvUwI67Iiz3100skqqJj3zl5NaBIC
	 Vp4raynx46b7liwMGM5/alirwYlvjt0bi622Gh8UzySB9RP2UZTKFwyuOOACBZsj5A
	 pSpwn6kw8oVm/aNX63avKm3Mz/WoaVdPCbAW/fWLnWIr9O0l/EKUmgRgHLwFGzWJCx
	 /PUGfC1aBQdwZF90uxJqFFjJOuTfvP2Yg5RcNQ/yU4N0Y5PYuqmpr1pgm64RrXUaE4
	 IXj77ReiEv96Q==
Date: Thu, 29 May 2025 08:19:12 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Herve Codina <herve.codina@bootlin.com>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
Message-ID: <20250529131912.GA2798026-robh@kernel.org>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
 <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
 <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>

On Thu, May 08, 2025 at 09:13:33AM +0200, Geert Uytterhoeven wrote:
> On Thu, 8 May 2025 at 00:24, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > > and this overlay is directly referenced in lan966x_pci_load_overlay().
> > >
> > > This avoid to use the code for an other board.
> > >
> > > In order to be more generic and to allow support for other boards (PCI
> > > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > > it to PCI Vendor/Device IDs handled by the driver.
> > >
> > > This structure contains information related to the PCI board such as
> > > information related to the dtbo describing the board we have to load.
> > >
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >
> > How big is the dtbo ?
> >
> > This is going in the right direction. I'm just wondering if each dtbo
> > should be wrapped in its own very slim PCI driver, which simply
> > registers its lan966x_pci_info structure to a core driver. Only the
> > needed dtbo will then be loaded into memory as a module, not them all.
> 
> Alternatively, the dtbo could be loaded through request_firmware().
> That could lead to a generic support option in the PCI core, which would
> fallback to loading pci-<vid>-<pid>.dtbo when no driver is available.

Yes!

Rob

