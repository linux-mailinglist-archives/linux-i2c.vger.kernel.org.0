Return-Path: <linux-i2c+bounces-178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BC57EC427
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 14:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03CBC1C20997
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 13:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AD21EB4A;
	Wed, 15 Nov 2023 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwMkXKVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB911EB42
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 13:54:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F387188;
	Wed, 15 Nov 2023 05:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700056497; x=1731592497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ohgO+ECJ696My33rCFnHkhZ3Hw1Qg8m9gAw1iQ1RADw=;
  b=nwMkXKVqDP+thMcoyheBssDuwnuvHCBjWu3AmI1uLIw4o12umKxAoNOm
   B/Stg2OhsesIxtCBE+Oqip7V7VYH1Uu/mj7l0CxcCp4rcmluBN6TprgPI
   9n9hu1kt7x+tWzYHyLIaaqFZ4+KK9nytylet1DgXwxrBVvCcECCYHztGa
   bktOixLo6E1E/gxrihFW2n0T7/gxZR4SGGotNX85mrgzXjk3COWDjOgqO
   TgU/BeDE/5oDtT+jjqZqOO56CfAX1HfIdohx3b83SMqp6yvvMNvHJixO6
   Qe5B8oKy8oDpbZyKVPwZt8ZOVtLrH0ygXh3seo1E/U/MvgyxZh4o6d7OD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375917967"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375917967"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758501857"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="758501857"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:54:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r3GLx-0000000EKTS-447E;
	Wed, 15 Nov 2023 15:54:49 +0200
Date: Wed, 15 Nov 2023 15:54:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 04/25] i2c: designware: Let PCI core to take care
 about interrupt vectors
Message-ID: <ZVTNqdnupatREyif@smile.fi.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-5-andriy.shevchenko@linux.intel.com>
 <8869c8e7-9b20-4a4c-83dc-65ce48bbe9c8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8869c8e7-9b20-4a4c-83dc-65ce48bbe9c8@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 15, 2023 at 02:08:10PM +0200, Jarkko Nikula wrote:
> On 11/10/23 20:11, Andy Shevchenko wrote:

...

> > @@ -360,9 +354,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
> >   	pm_runtime_forbid(&pdev->dev);
> >   	pm_runtime_get_noresume(&pdev->dev);
> > -
> > -	devm_free_irq(&pdev->dev, dev->irq, dev);
> > -	pci_free_irq_vectors(pdev);
> 
> Instead of commit 21aa3983d619 I guess this patch is more around my commit
> 9be8bc4dd617 ("i2c: designware-pci: Fix BUG_ON during device removal")?

No, this one exactly what it says. Your patch is the side effect of the above
mentioned change.

> But
> still I don't think it qualifies Fixes tag?

Up to you, I can remove the fixes tag altogether, but it has the correct
commit ID there.

> I was curious to see would this patch bring back above BUG_ON and
> fortunately not (rmmod/modprobe i2c_designware_pci on MSI enabled
> instance):-)

How? PCI clean up will happen on the level of pcim_enable_device(),
i.e. quite after the IRQ will be freed.

-- 
With Best Regards,
Andy Shevchenko



