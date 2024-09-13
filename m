Return-Path: <linux-i2c+bounces-6718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C2978097
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4390D28683D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A411DA61C;
	Fri, 13 Sep 2024 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="WcRju9fg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F91D86DC
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726232158; cv=none; b=U2oFcsAp6lrsQBSCJnUBs6waYWwwbXEZgZtX5+wL1mL0BFFh2zm9jwhLi7yWPUo/FrSW40286eP1TsCZHaE8Ye8iwCei1KziaodUAeGUHlnJSKsakxNgK4PUvLC3SbxDa74+utiWPxtHk39TeNZs60hMyC5x6+M4lWsk8jFccIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726232158; c=relaxed/simple;
	bh=mKedwJ5oP7yFDuKWpKi1YPa1JvtHWGhR1CPpaNpORiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDJ4JWWHD6ZCSOd8+o3aIJ2HdN29VpRXkTZt6YRezcqtiSSM9QVSBq9HvNiHFPiHC8kPrgB+llX6YynVfq5e62DRYmLe4t2Me2+oAx2YY1B1eGxMk6GshFAr6kvW6r5Phu2mnCwTiMFbx87vvsSnhDM5X/Fr6J6fYvB3vBOmrnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=WcRju9fg; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sIA0NeSP2GywsDGn1N9lvoJ8ApToYyWp8L5D5dBYlCs=; b=WcRju9fgH+detn4RWVU7Od5FgF
	YVCQmhisFdix7HAe6iO38IDFtGJbKP4SO/2gTvLfbapZfXheXbbIAU9XjxUnPNHA+4FiRD6dPeutR
	8hLGoogBjekQi1Z9eGzxyop/GEK+k5HfkomLah3UAWzodEZY+vHE2KwKpBnaH+4nNuP4=;
Received: from [88.117.52.244] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sp5AX-0004of-1V;
	Fri, 13 Sep 2024 14:12:57 +0200
Message-ID: <2541cf3b-8831-41b7-8030-1dcca6ebeb76@engleder-embedded.com>
Date: Fri, 13 Sep 2024 14:12:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] I2C controller support for KEBA PLCs
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org
References: <20240809052303.4933-1-gerhard@engleder-embedded.com>
 <d2fa7404-1269-4281-9e78-f8b780f0129f@engleder-embedded.com>
 <grxj3pxc7wgi2ar5ot6c24wwyskad7pt6l4wt7y5kwrqfirwo3@bc2mag5ju4eu>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <grxj3pxc7wgi2ar5ot6c24wwyskad7pt6l4wt7y5kwrqfirwo3@bc2mag5ju4eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 10.09.24 11:05, Andi Shyti wrote:
> Hi Gerhard,
> 
> On Tue, Aug 27, 2024 at 08:15:04PM GMT, Gerhard Engleder wrote:
>> On 09.08.24 07:23, Gerhard Engleder wrote:
> 
> ...
> 
>>> Gerhard Engleder (1):
>>>     i2c: keba: Add KEBA I2C controller support
>>>
>>>    drivers/i2c/busses/Kconfig    |  11 +
>>>    drivers/i2c/busses/Makefile   |   1 +
>>>    drivers/i2c/busses/i2c-keba.c | 598 ++++++++++++++++++++++++++++++++++
>>>    3 files changed, 610 insertions(+)
>>>    create mode 100644 drivers/i2c/busses/i2c-keba.c
>>>
>>
>> Hello Andi,
>>
>> are there any reasons why this patch does not make any progress?
>> Did I miss something? Or is it hanging just because of holiday season?
> 
> Sorry for having taken so long, now it's merged to i2c/i2c-host.
> 
> I took the liberty of changing only 'slave' to 'target' in one
> comment to align with the new inclusive I2C naming convention.

Thank you!

