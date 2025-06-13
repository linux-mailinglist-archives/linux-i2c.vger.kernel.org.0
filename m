Return-Path: <linux-i2c+bounces-11462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C720AD9234
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 17:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6C6189DC57
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9F9202C4E;
	Fri, 13 Jun 2025 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp7oVDfN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614EC1FCFF0;
	Fri, 13 Jun 2025 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830294; cv=none; b=Ha+a4j3MBBpqyC/LBC+al7XIIAHGX3ZE58z44s98kqjCQkyYwMkcyLWsIn9JjctIRfd/YYQVf+YvDTT9GwacBnvCOeidGqe+tw/Ljrf8cqPsi/RNiw8An5oHyZWw7dp2N+Tdc3uvIJlXwZdefT3ntXRlhnKMP0VAR5O2RSu3l+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830294; c=relaxed/simple;
	bh=V9FMKPIwnq1H9P0zOSWLaguOqdABhVFp/9v1hViBzRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CubihK4fjee5B2IuUdAglyVi61uEBy/bZVfWEJO7gkX7KUwYrw431GhJbOHyd9Uc9UaoZQQoOpTJeNBLOLz6NLGl4tvpzMLVTkFr7lb5i4i2PWABfqzgPVP7RRjq1DwUs7TGEE+0+G60ktEzEgWPByQxDqrc50sKUWnO56/U2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jp7oVDfN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749830292; x=1781366292;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V9FMKPIwnq1H9P0zOSWLaguOqdABhVFp/9v1hViBzRA=;
  b=Jp7oVDfNEy3d4G4pfI1R7iyCS7QJO1QsDLVR3BCjCFfPx/TkOompHJqf
   kpKjForpN517uaV/HwV56eoWXQenafURwRfGO6KkgS3w2EyZYH0q3Zig4
   JRoj/Xy1D0sqNseTKBjNELfwmfjt+Hd9SOpy1vu8g4TeyVA+P1+ErLguo
   TrU4TN0/KF1MDASxNkjGc6L8dh/9zYn4y/owGcKvdWjJsBU0Mg9m2JS2i
   kcORaEjA+vlspD5kekcg6qD5JwIzI/qdK5JDkK4FyhVPooPFP2d60vume
   VkTYEaW+uxdqN996mJx5HpTXStu6Zdeo5z9VAlSuUm5cD1vAhBupu9sK0
   A==;
X-CSE-ConnectionGUID: y6c4nfIITZeN5keSjHN58Q==
X-CSE-MsgGUID: nj0bEC3YT7CbbQk8d878xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="39661068"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="39661068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:58:11 -0700
X-CSE-ConnectionGUID: VA2G6141T8+w5h4vLYaebA==
X-CSE-MsgGUID: ASlK1NJbQtSiVGGS5YDhrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="178842660"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.111.232]) ([10.125.111.232])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:58:06 -0700
Message-ID: <f9ca87ab-e565-431a-9866-d56278cf465f@intel.com>
Date: Fri, 13 Jun 2025 08:58:03 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/28] cxl/test: Use device_set_node()
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
 <20250613134817.681832-10-herve.codina@bootlin.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250613134817.681832-10-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/13/25 6:47 AM, Herve Codina wrote:
> The code set directly dev->fwnode.
> 
> Use the dedicated helper to perform this operation.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  tools/testing/cxl/test/cxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
> index 8a5815ca870d..1db7732a70df 100644
> --- a/tools/testing/cxl/test/cxl.c
> +++ b/tools/testing/cxl/test/cxl.c
> @@ -1046,7 +1046,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
>  {
>  	device_initialize(&adev->dev);
>  	fwnode_init(&adev->fwnode, NULL);
> -	dev->fwnode = &adev->fwnode;
> +	device_set_node(dev, &adev->fwnode);
>  	adev->fwnode.dev = dev;
>  }
>  


