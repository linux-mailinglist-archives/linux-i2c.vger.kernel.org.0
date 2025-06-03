Return-Path: <linux-i2c+bounces-11213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A651CACD003
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 00:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76366175B35
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 22:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0512522BA;
	Tue,  3 Jun 2025 22:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hZ62I04W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64632C3253;
	Tue,  3 Jun 2025 22:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748990961; cv=none; b=tOJdC4E4NOye7raJvuf6D6gLWTFz4iNHQGTxyO+0jA8VjofrOJ7zuCzhTregQWEptuAaHszL2hSJPuBJYVQz9ViR3J5kM9WyYZe76wMZpWNSkcvjAlQx2NgB1SLcIkpFj/5sbjX7CtWux8IYiLbXcg870iXGbfi3eJMxgUSeBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748990961; c=relaxed/simple;
	bh=rBGAES5X+Usmxu+JGZIE2yuoh7XZdLpAas0Ycwao0bU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzS/8j4gjD+B5H9/PgnBzX0WkdumdPRGGKevHBKg3Qb6y1QYkz9aXdJz0QrvAvIdAF/0WTJc7PsNmjJ6O+buDQErD7KPEXPgPbNfIgc4qIGnlLnGd84OeTqgg3sp0xJ4s7LBYdpep8zPdNTVkrFSfqOwosueEsLp1jel/Vg+Qtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hZ62I04W; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=sqZQ+w6wvf6FbET6wgFegbwIK/1cqdiQywMzrNTEqgE=; b=hZ62I04W9KXRsBmqxu+4ZdVz5X
	PYbBt/Psvep2vHMErDKfMqhPbA8st+xT/u3qEFvkAaSiIqlzTRCIFgroBgcubNRoK2cl8sjtFiqrs
	oNrU1wsif3S1MAd704L3jDCUO7aoASG6zNufO9z4zHGxCHAz0vQnwibiPDDyNHXTWjYBqWrfTOc5l
	51K3rJB4x1HHCz6kebFd//4+NGbXB1cQyTK0ulvCGeSoOB9SWf/AezVwh50TzZNZ/GlUAnTR5RjI/
	xyHe9RdRWNyV1rVjxYOXoUoUTR2WIxEdM1cq/VbNn9F3pm82Op4yCrBz5WHlYcNObfeQ2nNqvYndg
	9pVsv5IQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMaRW-00000002VuS-1rgQ;
	Tue, 03 Jun 2025 22:49:14 +0000
Message-ID: <9e21492a-96a3-4df1-9464-f572ced312df@infradead.org>
Date: Tue, 3 Jun 2025 15:49:10 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: Use i2c adapter name to fix build
 errors
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
 <20250603214611.3039787-4-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250603214611.3039787-4-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/25 2:40 PM, Pratap Nirujogi wrote:
> Use adapater->name inplace of adapter->owner->name to fix
> build issues when CONFIG_MODULES is not defined.
> 
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.


> ---
>  drivers/platform/x86/amd/amd_isp4.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> index 0cc01441bcbb..9f291aeb35f1 100644
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -11,6 +11,7 @@
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/soc/amd/isp4_misc.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
> @@ -151,7 +152,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>  
>  static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>  {
> -	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +	return !strcmp(adap->name, AMDISP_I2C_ADAP_NAME);
>  }
>  
>  static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,

-- 
~Randy

