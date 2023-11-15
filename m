Return-Path: <linux-i2c+bounces-167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88A7EBFAC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 10:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 714411C20944
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 09:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B58B944D;
	Wed, 15 Nov 2023 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCygigVH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D65247
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 09:45:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269FBFE;
	Wed, 15 Nov 2023 01:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700041515; x=1731577515;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m+REZMfV8NBc0OwB7BM3EqOBjYYqn157eFskIvIQg/A=;
  b=BCygigVHIqyeS+01mJBkuVSO5rRassPzb9aYv6UWD9ivFNwBrbliY8sF
   xQD0PKULtS8jwVFsihsDBUNt2WLzyD9C0uu0lBgFiQhuZf95eTptdlGil
   Qv5UTSQDMC9vGj/4eAU326i+dtC5zrUFMOcIOGS7VidJ4nrDX1fSM85Zh
   M9+hrvAnx1BwR+BorZdADurae8DHQ10ZC/joYHoD7atrt+zC8iVaVFbxr
   sSBzdofG0QfeD6loqjJ3keH6KbRrbjteXFnEZhW1kOJTy9M1CUxafqVsM
   6UaNOAlNktgP+f2UWf7AGyupJAmbQt+5CBo2L2HKLxB9ztPGVyB1GTruB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381242572"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="381242572"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 01:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="908721404"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="908721404"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 01:45:11 -0800
Message-ID: <fa91c90d-c0d6-49d1-a7e5-732aac0c7ed5@linux.intel.com>
Date: Wed, 15 Nov 2023 11:45:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/25] i2c: designware: Delete adapter before disabling
 in i2c_dw_pci_remove()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-2-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> Make i2c_dw_pci_remove() to be aligned with dw_i2c_plat_remove() on
> the sequence of the ceasing I²C operations.
> 
> Fixes: 18dbdda89f5c ("i2c-designware: Add runtime power management support")

I think this is wrong. Commit 18dbdda89f5c is 12 years ago so is this 
patch really fixing a real bug that was hiding all these years?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 61d7a27aa070..35d35d7c8e23 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -354,11 +354,13 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
>   {
>   	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
>   
> +	i2c_del_adapter(&dev->adapter);
> +
>   	dev->disable(dev);
> +
>   	pm_runtime_forbid(&pdev->dev);
>   	pm_runtime_get_noresume(&pdev->dev);
>   
> -	i2c_del_adapter(&dev->adapter);
>   	devm_free_irq(&pdev->dev, dev->irq, dev);
>   	pci_free_irq_vectors(pdev);
>   }

Then I believe this patch may potentially introduce a bug. As far as I 
can see nothing wrong regarding adapter deletion after the commit 
18dbdda89f5c:

i2c_dw_pci_probe()
{
	...
	i2c_add_numbered_adapter()
	pm_runtime_enable_stuff()
	...
}

i2c_dw_pci_remove()
{
	...
	pm_runtime_disable_stuff()
	i2c_del_adapter()
	...
}

Order is still practically the same in current i2c-designware-pcidrv.c 
code but after this patch disabling/deletion is not done in reverse order.

