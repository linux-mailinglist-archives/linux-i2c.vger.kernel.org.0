Return-Path: <linux-i2c+bounces-10474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA10A92D3D
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 00:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2071B6296C
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 22:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B44216605;
	Thu, 17 Apr 2025 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPSYlW6W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062771FBEA2;
	Thu, 17 Apr 2025 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928485; cv=none; b=dW2X4MpE4n1eA2pIFnrHlA1Imr8sgtdineSDQDL4lOrDx5a5LUdSSR6nb2UhM80MtCHNXix9PUTMSu1glBJkAa4KDB7VJeJZ588p2Ify7YP5kkDTvXV+p4DWPicLFWLqoxd5363YXK7UbxCy7sMYSGyEBBSP4HJYOB4Urc7M6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928485; c=relaxed/simple;
	bh=rifZs371J9y3PzHkAueCCLOOVhwOjcVeezNKgfb6d+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsZCbnfB4tpR34sUOp1R+KPDgy0U7KWffypnWJTf/njciY6EI1nxdtbdPImLbb6Sfl/UJvxdg4clUiCwlqkJeH0cO+4pgg/C5bw1+h0ieyz27BNZCcy0HBTB7QtrR8z0yZuyS0xuFdzS12W323gsYOsV42MmOB8MZRTYOYo8hB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPSYlW6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757B6C4CEE4;
	Thu, 17 Apr 2025 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744928484;
	bh=rifZs371J9y3PzHkAueCCLOOVhwOjcVeezNKgfb6d+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iPSYlW6WkzOffe5pK81qoPx1OGu4qem2WanAYmCUY4OiDkgdjE5R/R/FZib4L1GiX
	 jMStGSxs2IPB72Gr08fQ7lffbnIiAJQ3+HjB2G6qeJ17eAfrmG7/S/iaYHOC0QWTg1
	 tLpEM6IQcYwxr1GRZxhKtz3aubCNl+tFIBfUXL1xfEXlZgFp7q98l1OTsOnkY85vAP
	 TdJYlvCKL4mh/uHEUfHVTKAaJCA38KQYX57ua3YfYIbf2h99omr573Evv7dwb77crK
	 UsspGp5utK8I00vW/noz+prYtCF196ufrt/EDLXeApC0WSJ9ddwZO1CNIYpdCfUffU
	 DhJnhq1EZ3/fw==
Message-ID: <8562d6b5-3b81-40e2-9cda-f202ab85d5a9@kernel.org>
Date: Thu, 17 Apr 2025 17:21:22 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] i2c: piix4: Depends on X86
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>
References: <20250415002658.1320419-1-superm1@kernel.org>
 <20250415002658.1320419-3-superm1@kernel.org>
 <p25szqqrnvvcut7bbmbhjhxjpqj4wgzvxfqigiopwnv4sspid3@caru7peqpvwz>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <p25szqqrnvvcut7bbmbhjhxjpqj4wgzvxfqigiopwnv4sspid3@caru7peqpvwz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/2025 5:16 PM, Andi Shyti wrote:
> Hi Mario,
> 
> On Mon, Apr 14, 2025 at 07:26:55PM -0500, Mario Limonciello wrote:
>> PIIX4 and compatible controllers are only for X86. As some headers are
>> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202504120558.sq3IpWdH-lkp@intel.com/
>> Closes: https://lore.kernel.org/oe-kbuild-all/202504120432.0F8lOF3k-lkp@intel.com/
> 
> givent that the next patch is not merged anywhere yet, the above
> three tags are not needed.

Ah, thanks for clarifying this.  I'll strip them for the next version.

> 
> BTW, can I already take the two i2c patches?

If you don't mind I think it would be better to leave Acked-by tags for 
them and let these go through tip.

A few reasons:
1) The header rename this fits into happened on tip already.
2) Patch 5 which would go through tip depends on these two patches, so 
it would mean you need to provide an immutable branch for tip to merge.

But if you would rather do the immutable branch dance and take them now 
that's of course possible too.

> 
> Thanks,
> Andi
> 
>> Suggested-by: Ingo Molnar <mingo@kernel.org>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>


