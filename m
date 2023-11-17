Return-Path: <linux-i2c+bounces-203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E075C7EF3DC
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38062B20C61
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 13:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD8832C7F;
	Fri, 17 Nov 2023 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLqcGZ+a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A728D5C;
	Fri, 17 Nov 2023 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700229114; x=1731765114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pEsKlmnkqCWZpqFrSXX4D1/w32UW8X9e4STEAxDy0aE=;
  b=jLqcGZ+aYkel1ue9rrosOwZewUvZ/InwohZQTMF73NryTYBtj2bkF/vT
   X+G0xQc9hcAAqP9s8FgfwJ4QVv+sbWY8Exd3ZBuxlHPWpUtrL80NR82wy
   9LNPrMNcm9QIY1wmbrp3VNcEVnDrpROsyQhlWmmCYoH8PmBg8C8DOotYH
   H63s1JyEtWE5Q3ZTBBWhpohjzBK4RjArAVfoXCvw9FSQ6GvQjbRO41j57
   xpyX1R97tW8XnZ1j9BIEbSmzI7e4A0Huf2kTsb9xwoM30IlkjFWey1DCk
   eGHCcC/hNZeePNTxwtzzxjFPcqlWbZ6YMjNrerkKur9huNygcxcUe0NjY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12849772"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="12849772"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:51:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="769226515"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="769226515"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by fmsmga007.fm.intel.com with ESMTP; 17 Nov 2023 05:51:50 -0800
Message-ID: <37222b67-ae8e-4b97-aa5e-5783c30dbf95@linux.intel.com>
Date: Fri, 17 Nov 2023 15:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/25] i2c: designware: Replace a while-loop by
 for-loop
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-7-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> Replace a while-loop by for-loop in i2c_dw_probe_lock_support() to
> save a few lines of code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

