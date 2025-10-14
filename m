Return-Path: <linux-i2c+bounces-13486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D6BDB833
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 23:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EA033A64B7
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 21:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E392E8B69;
	Tue, 14 Oct 2025 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axdHhikl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD5DDAB;
	Tue, 14 Oct 2025 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479139; cv=none; b=lFNRQCZCWN3JyQLh3aR+YQOrQ62wWDoVXTc64bKARHOVInQjY3ZGTvUcX/lC4lQG7k1XHwiIA4QVe7Gjl1ARvSKCkl+xQLmoWQdlG5pZuIabS620iaskBBUMn9fYhs3TJ4FQGLHxpSh/CmeaOPcfijq8MdFGcbcEXWgggj5fM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479139; c=relaxed/simple;
	bh=DoMilDLBZqkhZMH+XUxJ7RZCRLJMja44X/cITu+hjr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9zFBa86SgYzgZHMhcpMMqIxI0AN+NXVTV4zhMZ7xjjwZJHrPTl1FJgsO0hLdC+iTO5XiuY48tmyAxg1k9KwPvuueP7m43mqX6ALHlQfIyqTBk5+QUULRqLdgdEh6QqtghVUiRP0/PIggpNTwnXfVh6lTcwsIvV7JFx01neSHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axdHhikl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48A5C4CEE7;
	Tue, 14 Oct 2025 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760479139;
	bh=DoMilDLBZqkhZMH+XUxJ7RZCRLJMja44X/cITu+hjr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=axdHhiklobT1p6TLa9YC2mu5ZSxUEzA2GI06cVtkaJPdN9d39sIp9cbsfYUEJFlYG
	 DM9+RUxasTM5eW9nT2rUP/OYkFg/Dx5TiDdBYRyNcGlVWbPgApO9SZjsbY/oHMGswA
	 F7yPvRiTu8TAM4CMnhYBskepmSr1SFLRYDygiwljmBYNA0ylmcnVt2eobQ8IV3x7GL
	 5FC3XPR56WxSZ1STNUzABc8Xjt1ILtX0BUKQcsypow5aKZoxTxArsNDQ8LNEj76wo1
	 b9ORkctq4xjD4zTfVQDYp6NV1UkY7x/4oVp2p2+8dtvmkb/lfKekkHfZSYVPXsHpbO
	 d66qPHY5mNiyQ==
Message-ID: <3f4ee683-4fdb-4183-8f99-f931f853d9ae@kernel.org>
Date: Tue, 14 Oct 2025 16:58:56 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
To: Bjorn Helgaas <helgaas@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251014203305.GA904692@bhelgaas>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251014203305.GA904692@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/14/2025 3:33 PM, Bjorn Helgaas wrote:
> [+cc Mario, author of 440da737cf8d ("i2c: designware: Use PCI PSP
> driver for communication")]
> 
> On Mon, Oct 13, 2025 at 06:05:03PM -0700, Nathan Chancellor wrote:
>> When building certain configurations with CONFIG_FINEIBT=y after
>> commit 894af4a1cde6 ("objtool: Validate kCFI calls"), there is a
>> warning due to an indirect call in dw_i2c_plat_remove():
>>
>>    $ cat allno.config
>>    CONFIG_ACPI=y
>>    CONFIG_CFI=y
>>    CONFIG_COMMON_CLK=y
>>    CONFIG_CPU_MITIGATIONS=y
>>    CONFIG_I2C=y
>>    CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
>>    CONFIG_I2C_DESIGNWARE_CORE=y
>>    CONFIG_I2C_DESIGNWARE_PLATFORM=y
>>    CONFIG_IOSF_MBI=y
>>    CONFIG_MITIGATION_RETPOLINE=y
>>    CONFIG_MODULES=y
>>    CONFIG_PCI=y
>>    CONFIG_X86_KERNEL_IBT=y
>>
>>    $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allnoconfig vmlinux
>>    vmlinux.o: warning: objtool: dw_i2c_plat_remove+0x3c: no-cfi indirect call!
>>
>> With this configuration, i2c_dw_semaphore_cb_table has the BAYTRAIL
>> member and the sentinel (i.e., 2 members), both of which have an
>> implicit
>>
>>    .remove = NULL,
>>
>> so Clang effectively turns i2c_dw_remove_lock_support(), which is later
>> inlined into dw_i2c_plat_remove(), into:
>>
>>    static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
>>    {
>>        if (dev->semaphore_idx > 2)
>>            (*NULL)(dev):
>>    }
>>
>> which is not necessarily problematic from a logic perspective (as the
>> code was not bounds checking semaphore_idx so an out of bounds index
>> could already crash) but objtool's new __nocfi indirect call checking
>> trips over Clang dropping the kCFI setup from a known NULL indirect
>> call.
>>
>> While it would be possible to fix this by transforming the initial check
>> into
>>
>>    if (dev->semaphore_idx < 0 || dev->semaphore_idx >= ARRAY_SIZE(i2c_dw_semaphore_cb_table))
>>
>> the remove member is unused after commit 440da737cf8d ("i2c: designware:
>> Use PCI PSP driver for communication"), so i2c_dw_remove_lock_support()
>> can be removed altogether, as it will never actually do anything.
>>
>> Closes: https://github.com/ClangBuiltLinux/linux/issues/2133
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> I'm totally fine with the patch itself, but I think the commit log
> could be trimmed to something like the following with no loss:
> 
>    Remove struct i2c_dw_semaphore_callbacks.remove() and
>    i2c_dw_remove_lock_support().
> 
>    440da737cf8d ("i2c: designware: Use PCI PSP driver for
>    communication") removed the last place that set
>    i2c_dw_semaphore_callbacks.remove(), which made
>    i2c_dw_remove_lock_support() a no-op.
> 
>    This has the side effect of avoiding this kCFI warning (see Link):
> 
>      dw_i2c_plat_remove+0x3c: no-cfi indirect call!
> 
>    Link: https://lore.kernel.org/r/20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org
> 
> FWIW,
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

I echo Bjorn's comments on the lengthy commit message.
Code change looks fine.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> 
>> ---
>>   drivers/i2c/busses/i2c-designware-core.h    |  1 -
>>   drivers/i2c/busses/i2c-designware-platdrv.c | 11 -----------
>>   2 files changed, 12 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
>> index 347843b4f5dd..d50664377c6b 100644
>> --- a/drivers/i2c/busses/i2c-designware-core.h
>> +++ b/drivers/i2c/busses/i2c-designware-core.h
>> @@ -330,7 +330,6 @@ struct dw_i2c_dev {
>>   
>>   struct i2c_dw_semaphore_callbacks {
>>   	int	(*probe)(struct dw_i2c_dev *dev);
>> -	void	(*remove)(struct dw_i2c_dev *dev);
>>   };
>>   
>>   int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
>> index 34d881572351..cff7e03dea7b 100644
>> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
>> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
>> @@ -197,15 +197,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>>   	return 0;
>>   }
>>   
>> -static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
>> -{
>> -	if (dev->semaphore_idx < 0)
>> -		return;
>> -
>> -	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
>> -		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
>> -}
>> -
>>   static int dw_i2c_plat_probe(struct platform_device *pdev)
>>   {
>>   	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
>> @@ -339,8 +330,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
>>   
>>   	i2c_dw_prepare_clk(dev, false);
>>   
>> -	i2c_dw_remove_lock_support(dev);
>> -
>>   	reset_control_assert(dev->rst);
>>   }
>>   
>>
>> ---
>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>> change-id: 20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-5f2040eaadc2
>>
>> Best regards,
>> --
>> Nathan Chancellor <nathan@kernel.org>
>>


