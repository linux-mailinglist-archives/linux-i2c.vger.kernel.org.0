Return-Path: <linux-i2c+bounces-7468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E79A33D6
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 06:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1631F23073
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 04:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8623F1684A5;
	Fri, 18 Oct 2024 04:30:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m1283.netease.com (mail-m1283.netease.com [103.209.128.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366491531E8;
	Fri, 18 Oct 2024 04:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729225827; cv=none; b=Wx3GYwVQfytARvdqDiJpfZVgRnIK5qRFw/fqdBws5ben0a15Jg1O4fXr2d0lGw8mMYz8ZWPDYHC2gToAmuEh/JfGZwWH5a8PoNgVltzhN/tbs7CQ1aXC1tc+YwfUJ2f6LsrXgr0YRyzcon6olcJcfTfUqcNJXsCbh7sDScwdfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729225827; c=relaxed/simple;
	bh=l6+DtmoWBDLOiaH0b/mM2Ktmqtu5Gx08SSASOq5wA2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lu9s9Cnqx5aQmJFYyLTZwEgjY+UDD0120wOEd9+6URDy/0UCVoLif8ddrjH2HSVxsVX1qDXv0NDdoJUW73oOjulw/hYcdzh6FNK+c+A3b43RjYs/PJo72zOCbl1GTqdZc/UX3b/phVfa4tVXL82iCllpvt/DS7NRFL9JKgt+lSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=103.209.128.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 8F899380262;
	Fri, 18 Oct 2024 10:02:51 +0800 (CST)
Message-ID: <c72ef492-c3ce-4811-8315-165d07415761@hj-micro.com>
Date: Fri, 18 Oct 2024 10:02:49 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C
 controller
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 lenb@kernel.org, jsd@semihalf.com, linux-acpi@vger.kernel.org,
 linux-i2c@vger.kernel.org, andy.xu@hj-micro.com, peter.du@hj-micro.com
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
 <20240926024026.2539-2-hunter.yu@hj-micro.com>
 <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
 <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
From: Hunter Yu <hunter.yu@hj-micro.com>
In-Reply-To: <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU9JVk5NQ0JIQx0aQ0lIHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-HM-Tid: 0a929d5d04aa09cdkunm8f899380262
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRg6Lxw4CDIoFzctGA8yPE8e
	Cw4KCRJVSlVKTElCSUpNQkxJTkNKVTMWGhIXVRMOFQ8eCVUCDjsTEVYWEhgJFFUYFBZFWVdZEgtZ
	QVlKSUlVSUlPVUlPSlVIT1lXWQgBWUFJTE1MNwY+

On 2024/10/17 4:45, Rafael J. Wysocki wrote:
> On Thu, Oct 3, 2024 at 12:13 AM Andi Shyti <andi.shyti@kernel.org> wrote:
>>
>> On Thu, Sep 26, 2024 at 10:40:05AM GMT, hunter.yu wrote:
>>> I2C clock frequency for HJMC01 is 200M, define a new ACPI
>>> HID for it.
>>>
>>> Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
>>
>> Do you want your name to be hunter.yu or Hunter Yu? I prefer the
>> second and if you browse the git log, you can see that everyone
>> uses Name Surname.
> 
> It must be a real name as per submitting-patches.rst
> 
> The S-o-b is meaningless otherwise.
> 

Thanks for your help and advice. In our team, everyone have an alias 
name, which is the same as email address. I feel sorry for not noticing 
kernel community's requirement for real name.
My real name is Xiangyang Yu, I will use the following format to send v3 
patch later.

Signed-off-by: Xiangyang Yu <hunter.yu@hj-micro.com>

