Return-Path: <linux-i2c+bounces-205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C47EF3DF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C377928149E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 13:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D0E3455D;
	Fri, 17 Nov 2023 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9XhiRqu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DB1D75;
	Fri, 17 Nov 2023 05:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700229123; x=1731765123;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Dfa8gzBvOzlR13XN2Fl4EAdYuEsb+lLYsEEOw6cTeDA=;
  b=b9XhiRquqioKkvF21LOxRsVgLoOo1IQ2qL8PruSekHvow1BDmBacXWRQ
   wNdW2jEf018mKwneyEs0LAcvUS8dv4zHDxXtowwtWg0Ee0hDmOs7NCcp0
   yNRSUyCrj00z37EqDr0MJx/emMVga9gKjFSBf/jNJYU/Y859uj42kwJFu
   cPqtewOX3Ietofo/MsBx9+m41wQoD5LjRx0ryVOEg8+r7CYXXyc/3NItx
   /ylnNnDWaHKgjwabizwbB9w9pDRjW5RcB/t7tZuLUCuOX+bTHWOdkZNwt
   D9mhYKDzbGpLMH1IUH8fyf+vM6r4jwMsD3euuybksjcGIjuMQB7ZQQAUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12849797"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="12849797"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="769226534"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="769226534"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by fmsmga007.fm.intel.com with ESMTP; 17 Nov 2023 05:51:59 -0800
Message-ID: <1951ca56-9535-49cb-97ab-53b540dc7d51@linux.intel.com>
Date: Fri, 17 Nov 2023 15:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/25] i2c: designware: Add missing 'c' into PCI IDs
 variable name
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-9-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-9-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> Add missing 'c' into i2c_designware_pci_ids variable name.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

