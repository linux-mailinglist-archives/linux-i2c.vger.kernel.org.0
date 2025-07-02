Return-Path: <linux-i2c+bounces-11790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD96AF61D4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AD684E7564
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11640224AF3;
	Wed,  2 Jul 2025 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+yHVcuv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC02F7CE1;
	Wed,  2 Jul 2025 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482304; cv=none; b=SUJXwvf/pg5B0/fqdBJtthLhBHmepFudPYW14J1q0a7M12oxdjKJvB1RIajyGISRRsWGuiY3q41vlWFCcnoc0+dFaVlRTJds2bJ5b/P2YnfpzAk3Q60MAkL98ax+hqKlpI2SFRlZTnwJrHt1gzcsTRURvX4konuLyr1dftnPaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482304; c=relaxed/simple;
	bh=sqoKSQgNKzhlKYTNHTQq13ghy76tijVc8KUVW4KAgik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kesletTTzEbpWD4w+pscI9gjA4reIOo4PRp1baNOP6oiCt5+czKKgN6bxKiE+LgVusPSxFIhznQV3e2iyhhWmHI5CasjhFqlrQVsamEz2eHgfYAaLJjLwMdmqB2NRMc0dmBvF6wvHkC/P+UeG6/IytneFS9/SuwrQXwtAvV/hIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+yHVcuv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6149EC4CEE7;
	Wed,  2 Jul 2025 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482304;
	bh=sqoKSQgNKzhlKYTNHTQq13ghy76tijVc8KUVW4KAgik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+yHVcuvWoA3Y5hiMksVslUu/0J6tIA/5AyUFptJNDG+NcBxNkBhYk7fPUgaQ7hbO
	 vrGzcDVWzQQGwIrTuzsI+veg4AcUP5Nlhf0xZZvMFwsUuslWodtewAuZWY4bAe0k4G
	 bk3OjcQ/SlzLgRABRG6slWx7F7N37jHWmC1hTMmgCYIrPV6uskA5QfhFzaem4HnMOj
	 lFyo+X3puFm5TBem9Ms8LAoCT+P3Lt45UART7hLjbcBKGgoQXIMnBiYqeoeFCnOoZA
	 w84MqFP9RmNXa8HNiArAWSbGM7MjhGSLho9w1oELVQ7lTlDKINLjO4FbKo50USWx8Y
	 +KYGOOHefl8Fw==
Message-ID: <da8ada90-499f-41dc-808b-260d7a9229d3@kernel.org>
Date: Wed, 2 Jul 2025 20:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
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
 <20250613134817.681832-3-herve.codina@bootlin.com>
 <20250627141846.GA3234475-robh@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250627141846.GA3234475-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/25 4:18 PM, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 03:47:42PM +0200, Herve Codina wrote:
>> get_dev_from_fwnode() calls get_device() and so it acquires a reference
>> on the device returned.
>>
>> In order to be more obvious that this wrapper is a get_device() variant,
>> rename it to get_device_from_fwnode().
>>
>> Suggested-by: Mark Brown <broonie@kernel.org>
>> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Saravana Kannan <saravanak@google.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>   drivers/base/core.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index cbc0099d8ef2..36ccee91ba9a 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
>>   	device_links_write_unlock();
>>   }
>>   
>> -#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
>> +#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
> 
> In patch 3, you add the same define. Is there some reason to not move it
> to a header?

AFAIK, the struct device pointer in struct fwnode_handle is not backed by a
reference count, which means that it's the callers responsibility to ensure that
it's guaranteed that the pointer in struct fwnode_handle is still valid.

Besides some driver-core internals the pointer shouldn't be used, and hence this
helper shouldn't be available through a public header.

