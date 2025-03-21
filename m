Return-Path: <linux-i2c+bounces-9970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BCA6BC38
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 14:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7F607A73B9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 13:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC4D78F47;
	Fri, 21 Mar 2025 13:57:15 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890EB78F29;
	Fri, 21 Mar 2025 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565435; cv=none; b=Aqy2JtfWWNmnhHB8a1yhe28nrmsjplZfLdbDuUvhJSSIASaIved8M6xystvFhSpe/SLLCzpyfYaJb0jIabd4ByRscV1iesonvXmDA/lR63o+qpL+JLLbI64SitfukyMZwCSh1jWPrCDfn9vbqzS7+IZy60vlehZMrTOs7HZ3Z5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565435; c=relaxed/simple;
	bh=mt5VrjA3cDeDU5iaGmha+OBFVRPyZDe+YhTGWVzJhKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xe64v9jsIOIfNUNm/LIzOv+2Ouz1uKGmvAL/y7ctmitR0XGyrJZrATRTHRSAlDVM4bl4S9eDMtoknZT3Pzg3Def0XZP44tU9Uc/zQcB4rRst1JTf9igSjBEPr5fSjoiGMqDDoySUIUBi7ftPXHVq3/YKOt3g8ZMKlOwkemqZFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B44106F;
	Fri, 21 Mar 2025 06:57:20 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7343D3F673;
	Fri, 21 Mar 2025 06:57:10 -0700 (PDT)
Date: Fri, 21 Mar 2025 13:57:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Huisong Li <lihuisong@huawei.com>,
	Adam Young <admiyo@os.amperecomputing.com>,
	Robbie King <robbiek@xsightlabs.com>,
	Andi Shyti <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3 00/13] mailbox: pcc: Fixes and cleanup/refactoring
Message-ID: <20250321-elegant-ruby-bull-7d9c50@sudeepholla>
References: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>

On Thu, Mar 13, 2025 at 03:28:46PM +0000, Sudeep Holla wrote:
> Here is a summary of the changes in this patch series:
> 
> 1. Fix for race condition in updating of the chan_in_use flag
> 
>    Ensures correct updating of the chan_in_use flag to avoid potential race
>    conditions.
> 
> 2. Interrupt handling fix
> 
>    Ensures platform acknowledgment interrupts are always cleared to avoid
>    leaving the interrupt asserted forever.
> 
> 3. Endian conversion cleanup
> 
>    Removes unnecessary endianness conversion in the PCC mailbox driver.
> 
> 4. Memory mapping improvements
> 
>    Uses acpi_os_ioremap() instead of direct mapping methods for better ACPI
>    compatibility.
> 
> 5. Return early if the command complete register is absent
> 
>    Ensures that if no GAS (Generic Address Structure) register is available,
>    the function exits early.
> 
> 6. Refactor IRQ handler and move error handling to a separate function
> 
>    Improves readability of error handling in the PCC mailbox driver’s
>    interrupt handler.
> 
> 7. Shared memory mapping refactoring/enhancements
> 
>    Ensures the shared memory is always mapped and unmapped in the PCC
>    mailbox driver when the PCC channel is requested and release.
> 
> 8. Refactored check_and_ack() Function
> 
>    Simplifies and improves the logic for handling type4 platform notification
>    acknowledgments.
> 
> 09-13. Shared memory handling simplifications across multiple drivers
> 
>     Simplifies shared memory handling in:
>         Kunpeng HCCS driver (soc: hisilicon)
>         Apm X-Gene Slimpro I2C driver
>         X-Gene hardware monitoring driver (hwmon)
>         ACPI PCC driver
>         ACPI CPPC driver
> 
> The X-gene related changes now change the mapping attributes to align
> with ACPI specification. There are possibilities for more cleanups on
> top of these changes around how the shmem is accessed within these
> driver.
> 
> Also, my main aim is to get 1-8 merged first and target 9-13 for
> following merge window through respective tree.
> 
> Overall, the patch series focuses on improving correctness, efficiency, and
> maintainability of the PCC mailbox driver and related components by fixing
> race conditions, optimizing memory handling, simplifying shared memory
> interactions, and refactoring code for clarity.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
> Jassi,
> 
> Please take patch [1-8]/13 through the mailbox tree if and when you are
> happy with the changes.

Hi Jassi,

I2C change is also acked now. Let me know if you prefer pull request or
you prefer to take it via ACPI tree which may need you ACK.

-- 
Regards,
Sudeep

