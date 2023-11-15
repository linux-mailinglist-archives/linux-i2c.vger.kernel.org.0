Return-Path: <linux-i2c+bounces-173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E468A7EC1DA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 13:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D64C1F25BDD
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 12:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51241799C;
	Wed, 15 Nov 2023 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fK1gbki5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E01798F
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 12:08:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D74C7;
	Wed, 15 Nov 2023 04:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700050095; x=1731586095;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xwwq4t0T6lId3dg1dplZOe6kLqqStVxL8rC0FJ/6b0c=;
  b=fK1gbki50LEPuXehjCCTEJ/qShUbYnBRHRLJ4vdPZyFGXLojqVh5c0Dk
   uWSRlujFgtgNzIzN9gPeqesa0SzVC6UVH3hlgh0rECKdpFFzZ5rA7qC3n
   xbzmwV3wC8i2YbHwWhWZSDYGB7ZYM9HGQhUx7egjoInn/qTqWY2Vx8RhA
   TVrYPCIfv//w6EAYhgN+YAaZO4+1ex8IzO4D8INQJh9qkwjjzq70/kJn3
   ihDRXuKh99ju/36gkE4sVVhxN4JQV6R2Va6WuroTTA/CeHrlzhVbZggpn
   MSqOh9q5yDyrf/fRxqyecTmMOh297zWZcBAQRuyaASHwyKcep8YM5wyMF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="477084742"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="477084742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758479124"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="758479124"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 04:08:11 -0800
Message-ID: <8869c8e7-9b20-4a4c-83dc-65ce48bbe9c8@linux.intel.com>
Date: Wed, 15 Nov 2023 14:08:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/25] i2c: designware: Let PCI core to take care about
 interrupt vectors
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-5-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> PCI core, after pcim_enable_device(), takes care about the allocated
> IRQ vectors, no need to do it explicitly and break the cleaning up
> order.
> 
> Fixes: 21aa3983d619 ("i2c: designware-pci: Switch over to MSI interrupts")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)

...

> @@ -360,9 +354,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
>   
>   	pm_runtime_forbid(&pdev->dev);
>   	pm_runtime_get_noresume(&pdev->dev);
> -
> -	devm_free_irq(&pdev->dev, dev->irq, dev);
> -	pci_free_irq_vectors(pdev);

Instead of commit 21aa3983d619 I guess this patch is more around my 
commit 9be8bc4dd617 ("i2c: designware-pci: Fix BUG_ON during device 
removal")? But still I don't think it qualifies Fixes tag?

I was curious to see would this patch bring back above BUG_ON and 
fortunately not (rmmod/modprobe i2c_designware_pci on MSI enabled 
instance):-)

Jarkko Nikula <jarkko.nikula@linux.intel.com>

