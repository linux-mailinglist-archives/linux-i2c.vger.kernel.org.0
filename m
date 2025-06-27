Return-Path: <linux-i2c+bounces-11668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC8AEB99F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 16:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04101565B06
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 14:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCA52E266E;
	Fri, 27 Jun 2025 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMFvBsxh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059372E2652;
	Fri, 27 Jun 2025 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033928; cv=none; b=GefjOijEj2Ek8NvH9Vpn2M+N+li3JpaCu0uDaGiQ/XXEOI71ZtithJDEUxkorb5mkUmCxPoRUhS2nTNxUgfE14QdFQfj+EO01QP+5/fKFSb/L/xUNHu9lteiPaOShq+11QTMTA0q6cnCql+zPeTE/pGO5a48jqMF5EpyDBuTHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033928; c=relaxed/simple;
	bh=TaiQW3c+noRyzXQvsLousUbpwR3hV32c+YniAy5VZUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFNbUlpVuEtVIuomElPS/dw9NID2yPJPxjq14B6Nr8hJRMbxl/RBDabziUP2hc8oZrCdB+BSaP2l5e0owXMHlQhwDkj4GrR2xF3/Ty9Upf/aS2d8pgtLA3PhF0PP5bEdItn2T5YsxaU7MEqz5+rAsL+92jBgLIt49yYMlDxOj24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMFvBsxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA384C4CEE3;
	Fri, 27 Jun 2025 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751033927;
	bh=TaiQW3c+noRyzXQvsLousUbpwR3hV32c+YniAy5VZUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMFvBsxh25QJ2POJpnOoSHcIiORn+haen7v9wCSZAqbRWEWR8rp168/xP5JajxRet
	 ABSMKTjuxgMOqYpqxHoeQAIY1ZO/1qnNPS1mZwEAmC6ZGJ+7oPy6aIr9chIwI3mMzx
	 1LwQNtcBxXDKjAqya0P7p7/blBNf1PY42VO6WrZJIuY+dkKjUMVR2n25EtXJNAYBR9
	 AXfHsrTv4FYdFOr/WwX1bKOOoWsBgt46qpWbERDFD3NLDjmQReTG1ZBzJlC2KUu2aT
	 lgwUVSvQu451wB1EMcCCl1itmRUz/iFxcC0/eMTNQtR8zSTF1A1AGP4bgUwFaT/d6Y
	 QSo2Oo2lIP7sA==
Date: Fri, 27 Jun 2025 09:18:46 -0500
From: Rob Herring <robh@kernel.org>
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
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
Message-ID: <20250627141846.GA3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-3-herve.codina@bootlin.com>

On Fri, Jun 13, 2025 at 03:47:42PM +0200, Herve Codina wrote:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
> 
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/base/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index cbc0099d8ef2..36ccee91ba9a 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
>  	device_links_write_unlock();
>  }
>  
> -#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
> +#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)

In patch 3, you add the same define. Is there some reason to not move it 
to a header?

Rob

