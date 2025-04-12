Return-Path: <linux-i2c+bounces-10277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA63A86A63
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 04:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457C5902133
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 02:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A10E13CF9C;
	Sat, 12 Apr 2025 02:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAwBXfS+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5732367B7;
	Sat, 12 Apr 2025 02:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744424353; cv=none; b=adKNlJj3II23H1WxWTxz45RC+haxX/pThuQ3bEXMBei6xXgGPJk8PWbNAeAZ3usi8xieOUWp5BeXsj3CI2WHciLV1QDJkwr3A4aDy7pk9jLHJu/GNWjnVvngCB5VAgRDwrq0iZ8puIXq4gzAjNC8u3vbasYIGFE7+qsS1pZV7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744424353; c=relaxed/simple;
	bh=IVKZw+QqIoACmrPOCPCuoZhoH4T3ODyqjm3Izdf3r5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+9FBMFqFx21Es73FSlw8X0yu2z+52oQ0uKKv3k4l7wT4LZ1yMSTNEgWOMiuc2jpNYigglC4IwBq+ioeAFAuRqU/1Kk1/QRIADUEQUJtJ483i9X5xuWcNsKA0htQx2UXENkYa9KxRSGVn9ubnDJfc9lU3wxRG5hwOud8BA8pItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAwBXfS+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD21C4CEE2;
	Sat, 12 Apr 2025 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744424352;
	bh=IVKZw+QqIoACmrPOCPCuoZhoH4T3ODyqjm3Izdf3r5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SAwBXfS+eZJrpCgF4U7KXJyyGTQG/ttHu5IDTRMx6ehf/5Up3t9ofS0g5fqUhk0sQ
	 z1ianszXbuwFpZAti/J36pd0cUgRsPmjxD5lNx7dUEwCe0IjTTMUmAFnmNNlbNac6T
	 JHsPlNvQntM0WwrWt1DdtJuOB8ftruHw90Nf2bz/9aQdGzELqKFp0mVFA42Mb4p06/
	 gIbxgi4mhNyIHVQOaOevKaPOhIdF1SpLzuyiOJ/lXLnWaNrMACPaDPDsTN4+s3CU2Q
	 skEEx497nbuwLdlNSO0ZUKudhA4OjQIZmLZJyXuc6oiSEq8UUHMVBft1tqDSCeRAP/
	 ia+sRSSRIfShA==
Message-ID: <8497954e-38de-43f5-b3e9-f354c308289e@kernel.org>
Date: Fri, 11 Apr 2025 21:19:09 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] Documentation: Add AMD Zen debugging document
To: Bagas Sanjaya <bagasdotme@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
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
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-2-superm1@kernel.org> <Z_nMEwobMzGbG74L@archie.me>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <Z_nMEwobMzGbG74L@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/11/25 21:12, Bagas Sanjaya wrote:
> On Thu, Apr 10, 2025 at 03:01:59PM -0500, Mario Limonciello wrote:
>> v3:
>>   * Move debugging.rst to index.rst
> 
> Do you plan to add more AMD-specific admin docs in the future?

I don't have any others planned right now.  That move was because I 
noticed a toc warning with how I had it structured before.

> (BTW, I don't
> follow v2 discussions.)

Don't worry; documentation hasn't been talked about in v2, it's all been 
discussion on the S5_RESET_STATUS.

> 
>> +As there are a lot of places that problems can occur, a debugging script has
>> +been created that can help test for common problems and offer suggestions.
>> +
>> +https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/tree/amd_s2idle.py
>> +
>> +If you have an s2idle issue, it's best to start with this and follow instructions
>> +from its findings.  If you continue to have an issue, raise a bug with the
>> +report generated from this script.
> 
> To mailing list following Documentation/admin-guide/reporting-issues.rst?

Actually I prefer them to drm/amd with the s2idle bug template.  I'll 
add this detail.

> 
>> +First convert the GPIO number into hex. ::
>> +
>> +  $ python3 -c "print(hex(59))"
>> +  0x3b
>> +
>> +Next determine which ACPI table has the ``_EVT`` entry. For example: ::
>> +
>> +  $ sudo grep EVT /sys/firmware/acpi/tables/SSDT*
>> +  grep: /sys/firmware/acpi/tables/SSDT27: binary file matches
>> +
>> +Decode this table:::
>> +
>> +  $ sudo cp /sys/firmware/acpi/tables/SSDT27 .
>> +  $ sudo iasl -d SSDT27
> 
> Nit: two colons are sufficient for literal code-block.

Thanks.

> 
>> +To activate PM debugging, use the kernel command line option: ``pm_debug_messages``.
>> +
>> +Or enable the feature using the sysfs file: ``/sys/power/pm_debug_messages``
>> +Constraints that are not met will be displayed in the kernel log and can be
>> +viewed using anything that processes the kernel ring buffer such as ``dmesg``` or
>> +``journalctl``.
> 
> "To activate PM debugging, either specify ``pm_debug_messagess`` kernel
> command-line option at boot or write to ``/sys/power/pm_debug_messages``.
> Unmet constraints will be displayed in the kernel log and can be
> viewed by logging tools that process kernel ring buffer like dmesg or
> journalctl."
> 
>> +`patch <https://lore.kernel.org/amd-gfx/20250305051402.1550046-3-chiahsuan.chung@amd.com/T/#u>`_
> 
> What about that patchset status? It was not reviewed by upstream maintainers,
> right?
> 

At the time I wrote this document it wasn't yet merged.  It's been since 
merged, I will update to the commit details.


