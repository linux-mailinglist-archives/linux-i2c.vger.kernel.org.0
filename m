Return-Path: <linux-i2c+bounces-12017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51503B0FF66
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 06:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAC25432A1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 04:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB571DED7B;
	Thu, 24 Jul 2025 04:05:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F85C10E0;
	Thu, 24 Jul 2025 04:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753329953; cv=none; b=CGkyHFXBpxUePHM5PbZmT+43vX9Ss2n6BkyDc8YCZDxVTksSBVov5MQjOuZZHT60V3f3FCmm2FjBe7Sq8xX3awtzrQC4cts2907hkxe7g7SWpVzGl42MCphP7VJJpTwHGvvuyqxUyfAYnXzZH+SfEz+BurqJ/KY90eOLG1Q8Tno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753329953; c=relaxed/simple;
	bh=PjC0BovuGjzZhyhgBKhpq9oPTWYLbz/8Llr3tOMBOqM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=u1/o9gWOKAPQaTDZxJlT4/p53NVhkWjsOC2pvwf50FzEoa5IrahCWOU4fLWs5/1PBFFNN/PlibvT5DZfkG85gtgXthHuzyuwUU7+aujTdSRftT+YvkLWc8UkccPNa8MkD5ZC0j00DaSnhDAMmjbfo7xwIE5OM5obv2kq3b7Yjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 24 Jul 2025 13:05:49 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 309302091485;
	Thu, 24 Jul 2025 13:05:49 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 24 Jul 2025 13:05:49 +0900
Received: from [10.212.247.235] (unknown [10.212.247.235])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 7EB7910D847;
	Thu, 24 Jul 2025 13:05:48 +0900 (JST)
Message-ID: <e884f5c2-0bb3-42a2-9d96-d199e60f1dec@socionext.com>
Date: Thu, 24 Jul 2025 13:05:48 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: designware: Fix clock issue when PM is disabled
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 ito.kohei@socionext.com
References: <20250724021317.2116943-1-hayashi.kunihiko@socionext.com>
 <20250724021317.2116943-2-hayashi.kunihiko@socionext.com>
Content-Language: en-US
In-Reply-To: <20250724021317.2116943-2-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/07/24 11:13, Kunihiko Hayashi wrote:
> When removing the driver, enable the clocks once by calling
> pm_runtime_get_sync(), and call pm_runtime_put_sync() to disable
> the clocks.
> 
> If CONFIG_PM=y, clocks for this controller are disabled when it's in
> the idle state. So the clocks are properly disabled when the driver
> exits.
> 
> Othewise, the clocks are always enabled and the PM functions have
> no effect. Therefore, the driver exits without disabling the clocks.
> 
>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>      18
>      # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/bind
>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>      20
>      # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/unbind
>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>      20
> 
> To ensure that the clocks can be disabled correctly even without
> CONFIG_PM=y, should add the following fixes:
> 
> - Replace with pm_runtime_put_noidle(), which only decrements the clock
>    count.

This description is wrong.
The pm_runtime_put_noidle() decrements the runtime PM usage count.

> - Call i2c_dw_prepare_clk(false) to explicitly disable the clocks.

This decrements the clock count.

I'll fix it and resend as v2.

Thanks,

---
Best Regards
Kunihiko Hayashi

