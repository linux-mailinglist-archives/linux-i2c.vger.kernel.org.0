Return-Path: <linux-i2c+bounces-14400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4CACA38B5
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 13:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8DB73089008
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 12:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BE933E348;
	Thu,  4 Dec 2025 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myUB8jID"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B69D338F2F;
	Thu,  4 Dec 2025 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850022; cv=none; b=o/sAasjcvCExFeQadeFdNwz44n/BG6yMXAsI9zgmEAqCh4dSAvvantBWA+DTuBzKqFtbcs2OZobkuQSCXLPjfvvy0en7asNdX9JYsyeYjyaFX784IcftcjNWuefDPBkv3GwHOR/txd6db0YnDgHZ1/NffOA9emvu6Ooq7xmFnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850022; c=relaxed/simple;
	bh=AACMBGkOYNpC0wc7dBl/A97+VH5lB0jqIQofcJw+rV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRrOG2nNswGJOJaEYohaRkU+zDkHPl9BOQ1/VisnELKKRMp3NjphZzB8NkZ08m/SxWf2jFI6L2jFmxYI6QxCbw54oxy8FkBiArE0UN6QTOqEcAl3YzI3UsMgr795fAtk4XrbZ/FL9z7P9Y2ZfgNyUbTCUVm1VF+8kdGzbqYH4f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myUB8jID; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764850022; x=1796386022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AACMBGkOYNpC0wc7dBl/A97+VH5lB0jqIQofcJw+rV4=;
  b=myUB8jIDTuWr5LLPyVT9Xwr5rRaMwCi+AafuBgaztdtGXHEqoi1+2Ist
   yuTNIp/kCZ/XQEUMRyMzeY0MeSs5gxW7dtA1uk7Pi70oCfiHZ5zAN+3px
   s6KA14IS3y+o/Xcprve+uB2glMPp3WmrnJHCGav3gPgqqFfPgLfcRKQoT
   aBZmGb1tH5ehp52ROwUPBJUNhSZImWwCOLZS++uXI55HLz0TjE9fhKjb8
   je3Sug5yNMWdOG4ciHJGhQSikqGjNak9U9DFUXDux3R11Fgvz3yg9Qzn7
   vf9dHTqeMIFTwuZViFuqUcIumG3hLiRisIp7RuxLkAlTXQLq0qxAxeGwl
   w==;
X-CSE-ConnectionGUID: ujoGBIBbTQa4rMxZLNs3Xw==
X-CSE-MsgGUID: z6PPv4ESQiKHyZ6rE1lvGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66753252"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66753252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:06:58 -0800
X-CSE-ConnectionGUID: cFBEIPl6S9m77mLooVMGkg==
X-CSE-MsgGUID: zwed11zQRAih9YysX+gTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="225924104"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:06:46 -0800
Date: Thu, 4 Dec 2025 14:06:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <aTF5VN2YSpj5uJsr@smile.fi.intel.com>
References: <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
 <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
 <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
 <20251204083839.4fb8a4b1@bootlin.com>
 <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 11:49:13AM +0100, Geert Uytterhoeven wrote:
> On Thu, 4 Dec 2025 at 08:39, Herve Codina <herve.codina@bootlin.com> wrote:

...

> > Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect.
> > Got emails delivery failure with this email address.
> 
> Yeah, he moved company.
> He is still alive, I met him in the LPC Training Session yesterday ;-)

Usually people update the MAINTAINERS and/or .mailcapain such a case.
Can you ping him about this?

-- 
With Best Regards,
Andy Shevchenko



