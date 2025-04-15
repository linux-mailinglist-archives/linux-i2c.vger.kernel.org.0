Return-Path: <linux-i2c+bounces-10347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FEA89E7E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671633B4093
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 12:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E9296D26;
	Tue, 15 Apr 2025 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBPZ//rr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27CB293B62;
	Tue, 15 Apr 2025 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721161; cv=none; b=EJ1pml5Gr1okk4hy09IRYTxuWN0Ef9bhZOrS7/0/kmaPqhB4cx+C3vNgvUQK2S8vglklfU89t6pO2zgxWQ9S99czU5t9l5bUWRgJZ25cJv7EbY8kFC8tpLrLpnefs6Oh+lPZmi/7CZ5OHUXLzwILCbUNMwQ70RnMk3cG8byFehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721161; c=relaxed/simple;
	bh=ek+Tpc14e/doNmpLlpka8XJmXm9f6H6t6AJorGwuoYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkJcXh2McpwrBCLVYs3uGPyNfnXX+Wjc8Gkh9jtKJGsXPTNa5v7LDxTozMLQ9Rp9KpeDREJd0/ve4n0ktUR7CnTWcQ63rVFmNPKBNf6GADTpxOaW76KBQ4tOnoy6+kPfhlAg1YNuzKJ1EzRRCNSeRIr1pSn/53VOOJ8ROG8IkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBPZ//rr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D24C4CEDD;
	Tue, 15 Apr 2025 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744721161;
	bh=ek+Tpc14e/doNmpLlpka8XJmXm9f6H6t6AJorGwuoYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aBPZ//rrXCmUwRtvbmUfo/qWNHN/Z+Tevk8llMjTQR2d+z4R7RFhNuo6XHyY3Qbng
	 zbgnXDw2Qvktx3Bl74E6uqocClku9RQyckQ0kn8Q5+bRznZohd/lyCaqPc+XwYAROc
	 O+q8j6x2LUmrC7yZRwoZ8g7fqr6dEN+I+qDf5SnoxaQhVM3dc9dXIoPuyxAHUdKLLQ
	 PtNW/AKKRK4a0O/OHBnXQOM0XDolPbQlSj2CKBftIDIFQDLjXPVuAltxAdw+EihT6U
	 ZMze82kX2xqRI+fPN8k1C+StuQUj9B+YDavUZV6GC9VHYDllLneKAhF82DIg7HeZ7i
	 eSOOZdKw6i5mQ==
Message-ID: <4493e1f6-eb08-4384-9257-575491a57c40@kernel.org>
Date: Tue, 15 Apr 2025 14:45:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hitting WARN_ON_ONCE in i2c-designware-common.c
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 kernel-team <kernel-team@cloudflare.com>
References: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
 <715d883f-184f-474a-a222-208d3aa03d2c@linux.intel.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <715d883f-184f-474a-a222-208d3aa03d2c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




On 15/04/2025 14.28, Jarkko Nikula wrote:
> Hi
> 
> On 4/15/25 3:03 PM, Jesper Dangaard Brouer wrote:
>> Hi Maintainers,
>>
>> I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
>> when booting the kernel on our Gen12 hardware.
>>
>> I'm using devel kernel net-next at commit 1a9239bb425 (merge tag 'net- 
>> next-6.15').
>>
> Is this a regression so was this working before?
> 

I'm seeing this when doing kernel development and booting net-next on
our Gen12 servers[1].  [1] https://blog.cloudflare.com/gen-12-servers/

I've not seen this WARN on our production kernels (stable 6.6 and 6.12).
This is likely due to different kernel configs.

> Support for this platform was added back in 2016 by the commit 
> e4e666ba74d4 ("i2c: designware: Add device HID for future AMD I2C 
> controller").
> 

Maybe we have just not enabled the module on our prod kernels.

>> [   10.062651] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
>> [   10.073312] pps_core: LinuxPPS API ver. 1 registered
>> [   10.073372] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
>> [   10.075433] i2c_designware AMDI0010:01: Unknown Synopsys component type: 0xffffffff
> 
> These "Unknown Synopsys component type: 0xffffffff" errors indicate IP 
> is not alive. Perhaps linked to the missing clock or not powered.

It is possible that this hardware is special as I believe it is 
customized for us.

The dmesg output also contained:
  Hardware name: Lenovo HR355M-V3-G12/HR355M_V3_HPM
(see the extra -G12 to the SKU.)

--Jesper

