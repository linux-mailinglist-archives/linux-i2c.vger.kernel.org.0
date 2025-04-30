Return-Path: <linux-i2c+bounces-10705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BDAA5475
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 015494E669C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A95268C73;
	Wed, 30 Apr 2025 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avlo+vkD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D163218EB1;
	Wed, 30 Apr 2025 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039947; cv=none; b=NbNsXmMLd/SyUUIpLCqIwllK8l7hrzbla2F2pcmm0ENx8GRs04Ih7/hDg3yJ0fdtGWF7HZOerjIaHc7tG/0MUicDYJGt3fayF6LEv9RpFLxj9Bzlz7siGrOfcJuyOiFwKSSJ4NiCk3wl4bGGztGSuqU7ZKuPI9oCdFf62MiPYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039947; c=relaxed/simple;
	bh=2BdOQ8pQ6t7gLyIXQd5kf0ne6BczcueN50D5MyIeqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bydUhIOEF3k9JUw6DiLS4W5dMiqa5sDAZAmEUtzYOVKiPyCaW4B3zwwIS0DFIlaZB1467uomLUYINYaz8dRFFyRqCIj6siRLZcFm5eKp0suUhpeZJiEfdVdRr1AqzKoPCvM4+Jftq4Diagt72NET6EqSqc92sRCNPSyEpmfBWuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avlo+vkD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1514C4CEE7;
	Wed, 30 Apr 2025 19:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746039947;
	bh=2BdOQ8pQ6t7gLyIXQd5kf0ne6BczcueN50D5MyIeqbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=avlo+vkDZMsnRA8eAO8BQb6qqHvjDyaAo7BRStAj+jISXqrBotPojeHI2wm+QFK0e
	 RVoTpUl5wCYDOWk6outxeSEKnHF9tv9GvdVb5J2bTU1OqonNv9YtlZVMwVb/IJanxH
	 yogonY6MrIYTk82H2Sl7iKrgLAlDeMQS8NiMFo35+GnbI6povyk/T474g963CVFZue
	 6rgryJty8hbRFNQiCTC0UqlNpGCeFEvXQgyAJHWahdGDyp4MOs8Xje6Xc59ruqUT92
	 AxCsKVGkPZsqlKKcaGCaA7djHpbJKHREmPfyjuIPbHGdk59hf2UpzybBfSKHIBx8xv
	 SOKaZyHZlxeDQ==
Message-ID: <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
Date: Wed, 30 Apr 2025 14:05:44 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] x86/CPU/AMD: Print the reason for the last reset
To: Borislav Petkov <bp@alien8.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
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
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/2025 2:03 PM, Borislav Petkov wrote:
> On Tue, Apr 22, 2025 at 06:48:30PM -0500, Mario Limonciello wrote:
>> +	/* Iterate on each bit in the 'value' mask: */
>> +	while (true) {
>> +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
>> +
>> +		/* Reached the end of the word, no more bits: */
>> +		if (bit >= BITS_PER_LONG) {
>> +			if (!nr_reasons)
>> +				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
>> +			break;
>> +		}
>> +
>> +		if (!s5_reset_reason_txt[bit])
>> +			continue;
>> +
>> +		nr_reasons++;
>> +		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
>> +			value, s5_reset_reason_txt[bit]);
>> +	}
> 
> What happened to that simpler idea:
> 
> https://lore.kernel.org/r/20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local
> 

This one was more advantageous in that if multiple bits were set for any 
reason we could get messages for all of them printed.

