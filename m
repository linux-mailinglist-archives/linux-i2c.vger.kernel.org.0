Return-Path: <linux-i2c+bounces-11463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B59ABAD9254
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 18:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7087A3B9816
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33151202C21;
	Fri, 13 Jun 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pjqt138l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9CA1FCCEB;
	Fri, 13 Jun 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830308; cv=none; b=Tafyq3OuMN1u604hZJeoqtU52fr4HMnD8vfb/bIxp3S+DwTxJFZTWFROuA1iBktev4jjIK1JxDH5DYz0hEWop+jN7jnowJFZZy9xqz99KrUfOrueoEvkERF/jyjpHmcj1D7AyenlaL7yK0Y36+Y+RYQjvROC21mLQ88lLRksauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830308; c=relaxed/simple;
	bh=cGUKaP6dgfpeo+RKTZCV94jyFa+uREbM3iubZvhap0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nndWGyE91EYoCbI9ATMVhf8246wSYZHHELB0Yaw+a9n2IQq5Sk3fo3ZTcyA326Vh0nWHOtrNObLiSBLwriP6xusn81K64A53psiyaWXg+eZc8u1BoIEot+mCCMJIeo1NhJI37tBlfRm+BSdf4objNvxWxtHqsSlOmmz/TqiUbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pjqt138l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749830307; x=1781366307;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cGUKaP6dgfpeo+RKTZCV94jyFa+uREbM3iubZvhap0M=;
  b=Pjqt138lW+iEvt7Srov9kVIQRHYRKcxlw10kLXShQrH1LXNYZSgaJy0O
   zq1G5w0Rhow9Nw6JcuX658RGeDvhGwQ2LLUjwfNzbc+fTBNSialJeWsVX
   3DlwofaQ0l3MKdE4WNVhkXcBv3hEZlD+wQ0nGpDwg5/NqPaC1TUgthSzd
   QwbcURku9tQOfZOKW/tF+NGDLAzGADKHvOo5zJrWTBazXV6Vbms8qtUC3
   Z1V/ynBhOHgPcn5R1dlj9G+8XQpgFgq5laswbniDntMCPo1muSBwM2vh7
   /bACBQ15E6GmcLXhG3p0h1LLS88Erq/OpLB2ArH+IjlAVvovx+BJVt9+a
   g==;
X-CSE-ConnectionGUID: 7ZWwf9qzRzCXfKLnJd/DNw==
X-CSE-MsgGUID: w7bB8LruQm+s6wQLf2wvog==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63403165"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="63403165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:58:25 -0700
X-CSE-ConnectionGUID: ZNpjhcVcQvCbGVVMZUTnnQ==
X-CSE-MsgGUID: Q3OrfPCuRPKKipwCiTZe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="147743732"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.111.232]) ([10.125.111.232])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:58:19 -0700
Message-ID: <4fed7722-d0f7-4bde-a06b-a003718651ea@intel.com>
Date: Fri, 13 Jun 2025 08:58:17 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/28] cxl/test: Use fw_devlink_set_device()
To: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-11-herve.codina@bootlin.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250613134817.681832-11-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/13/25 6:47 AM, Herve Codina wrote:
> The code set directly fwnode.dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  tools/testing/cxl/test/cxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
> index 1db7732a70df..80e6fb3c9a43 100644
> --- a/tools/testing/cxl/test/cxl.c
> +++ b/tools/testing/cxl/test/cxl.c
> @@ -1047,7 +1047,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
>  	device_initialize(&adev->dev);
>  	fwnode_init(&adev->fwnode, NULL);
>  	device_set_node(dev, &adev->fwnode);
> -	adev->fwnode.dev = dev;
> +	fw_devlink_set_device(&adev->fwnode, dev);
>  }
>  
>  #ifndef SZ_64G


