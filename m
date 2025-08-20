Return-Path: <linux-i2c+bounces-12348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA2B2D9D4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 12:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D911B5E62ED
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 10:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F862D9795;
	Wed, 20 Aug 2025 10:09:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C232D3A6C;
	Wed, 20 Aug 2025 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755684540; cv=none; b=fPLOlp0L6mt3mkFO0MLKy8jKo+Ntvq23LW/dgU6bGCjwvYKYSAiLybeximnlft9nuvtrBQOPL7uL2J1KUBjcqG8gN3JZ4XeMt2E8q7KfyJ1chfjUsiFCCP8iVJCZ69Rk7+0yaN9/4g070e7m1UG8LBRJNs1fz1UKI52u21Z+8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755684540; c=relaxed/simple;
	bh=o8NWUJZ+hrkCB63F5Md5d9S5crljdWtUTKQFkgVZAjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7NswZdnQ16hEmAp+xTw0vCYZ+okMXPSPNvoojVEvA2baZMfWwU1u9j3BGnjlykomPgQyURu9XZEdD/A0ET9IcRArhD5woRpnVj4iJenRhT5SqsjV8lqnLnyAQ8LuaXGWYKCTWdOe5Sf9Ice9fy0PgCGzrRtjyLGrB7HIyAgjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 20 Aug 2025 19:07:46 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 887EC2069E70;
	Wed, 20 Aug 2025 19:07:46 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Wed, 20 Aug 2025 19:07:46 +0900
Received: from [192.168.1.135] (css-vcsa.css.socionext.com [10.213.44.70])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id DD9E710A014;
	Wed, 20 Aug 2025 19:07:45 +0900 (JST)
Message-ID: <f659afe0-6506-470b-be7e-99bd5ab03299@socionext.com>
Date: Wed, 20 Aug 2025 19:07:44 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: designware: Fix clock issue when PM is
 disabled
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, ito.kohei@socionext.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724042211.2160339-1-hayashi.kunihiko@socionext.com>
 <20250724042211.2160339-2-hayashi.kunihiko@socionext.com>
 <wnoawxh7umtbq2b73f4qpbbbe76b5eluz62g3csmq7k4uw2hnm@exggtdzkeyur>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <wnoawxh7umtbq2b73f4qpbbbe76b5eluz62g3csmq7k4uw2hnm@exggtdzkeyur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andi,

Thank you for your comment.

On 2025/08/20 7:06, Andi Shyti wrote:
> Hi Kunihiko,
> 
> On Thu, Jul 24, 2025 at 01:22:10PM +0900, Kunihiko Hayashi wrote:
>> When removing the driver, enable the clocks once by calling
>> pm_runtime_get_sync(), and call pm_runtime_put_sync() to disable
>> the clocks.
> 
> can we rephrase this to something like:
> 
>    When the driver is removed, the clocks are first enabled by
>    calling pm_runtime_get_sync(), and then disabled with
>    pm_runtime_put_sync().
> 
> Does it work?

Yes, your description is better.

> 
>> If CONFIG_PM=y, clocks for this controller are disabled when it's in
>> the idle state. So the clocks are properly disabled when the driver
>> exits.
>>
>> Othewise, the clocks are always enabled and the PM functions have
>> no effect. Therefore, the driver exits without disabling the clocks.
>>
>>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>>      18
>>      # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/bind
>>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>>      20
>>      # echo 1214a000.i2c >
> /sys/bus/platform/drivers/i2c_designware/unbind
>>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>>      20
>>
>> To ensure that the clocks can be disabled correctly even without
>> CONFIG_PM=y, should add the following fixes:
>>
>> - Replace with pm_runtime_put_noidle(), which only decrements the
> runtime
>>    PM usage count.
>> - Call i2c_dw_prepare_clk(false) to explicitly disable the clocks.
>>
>> Fixes: 7272194ed391f ("i2c-designware: add minimal support for runtime
> PM")
> 
> This commit doesn't look quite right to me, although it's quite
> difficult to find the culprit, as the clk api's have changed a
> lot over time.
> 
> Do you think this is better:
> 
> Fixes: b33af11de236 ("i2c: designware: Do not require clock when SSCN and
> FFCN are provided")

Surely, the code that handles PM and clocks has changed some time,
so it's difficult to identify the commit with "Fixes" tag.
I think the first commit that called pm_runtime_put_sync() was the cause.

> It doesn't matter much as it won't apply in any of the two
> versions> 
> The Fixes tag should be added in both the patches, but there is
> no need to resend, I will apply them once we agree on the commit
> message.

Okay, I agree with you.

Thank you,

---
Best Regards
Kunihiko Hayashi

