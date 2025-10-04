Return-Path: <linux-i2c+bounces-13387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF08BB8E76
	for <lists+linux-i2c@lfdr.de>; Sat, 04 Oct 2025 16:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3FD6347167
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Oct 2025 14:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFFF15ECCC;
	Sat,  4 Oct 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGimkHqa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A5CA4E
	for <linux-i2c@vger.kernel.org>; Sat,  4 Oct 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759586635; cv=none; b=U2LHERoKYMvTAqn5rltMM157Gk7CGodubtxAEJWCMIqb+/2xohMDWnMqwmGGED1Ar7tyqltS0T8zvc0Ym29+JujngSEh/mwgxHuimiBYK1xtymKdmv4h8Rj+FoN4T9oLcqJbwAvO3Kzo8MPT7dT1taiQ0EPQbdGaGCwuhdeYZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759586635; c=relaxed/simple;
	bh=LUw94sGWyT8bVLP80ddZatm+w60220GPZPD7hIcTYL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpH9U9qc61Lep339cKlFV54kHq3sTdYoN3dzNpKmZLECr33u5MrDL0W1bNmmF+KFpOSCqWxLJvk2TVTNvIge4tGPcnQavUWGIDi7jBXsDG0RZ+vV2ETkQ9XKDauLvRxd8sncm9y0DGLJX5wpfyEUSAAjITx54zqxngUcuErx9Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGimkHqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D17C4CEF1;
	Sat,  4 Oct 2025 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759586634;
	bh=LUw94sGWyT8bVLP80ddZatm+w60220GPZPD7hIcTYL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FGimkHqamd/MOfvQHeTcCXolPfgKpMh7jdFkmrbcg4UJiiHR6KbLG99uPeCAMilMK
	 UpwevdWL3b0T2Fa/GHxxdvxjh7bX3Tc2a2JKdzyMOkay78uOXIVvSppGM1pKaOGvip
	 pm6BEy1DWdNTUJwEKLyj4ShC3h6ipcesWwIhGdKeSef4mtRRerc/HlEAdVpDsBLPRn
	 xX8jooxnDMSLQe22HWjFreQPa6Rb9ONO9Wh5Uu4jJpcJRyzx6kJZt5Xhu8HRXUizCN
	 L6BLECnKz4XD+SixVHqarkziN4bgEfcRMidOGktYHMk4EYSi0hgjfeU69Q3CBvbPmW
	 RtT2e/l6NFszA==
Message-ID: <1e1b4323-2eb8-4c02-a47b-8e951606cffd@kernel.org>
Date: Sat, 4 Oct 2025 16:03:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF
 devices
To: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
 <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
 <DS4PPF11A2D567239809FF8803DAC6E7704FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
 <056ae17a-5351-4be7-a14e-9becf8ec404c@kernel.org>
 <DS4PPF11A2D5672F6724542FB9C1E9AEF60FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <DS4PPF11A2D5672F6724542FB9C1E9AEF60FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Israel,

On 2-Oct-25 8:05 PM, Cepeda Lopez, Israel A wrote:
> Thank you Hans,
> 
>> -----Original Message-----
>> From: Hans de Goede <hansg@kernel.org>
>> Sent: Thursday, October 2, 2025 10:49 AM
>> To: Cepeda Lopez, Israel A <israel.a.cepeda.lopez@intel.com>; Sakari Ailus
>> <sakari.ailus@linux.intel.com>
>> Cc: Andi Shyti <andi.shyti@kernel.org>; Wolfram Sang <wsa+renesas@sang-
>> engineering.com>; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
>>
>> Hi Israel,
>>
>> On 2-Oct-25 5:52 PM, Cepeda Lopez, Israel A wrote:
>>> Hi Hans,
>>>
>>> LJCA and USBIO shouldn't be sharing HIDs.
>>
>> Yes in practice we have shipping hardware that is sharing HIDs
>> and since this is hardware out there in the field there is
>> nothing we can do about this.
> 
> There is. DELL has to provide a new FW/BIOS update to fix the HID
> of the system on fault. That is the correct solution to the issue.

Even if Dell is willing to do this (which I find unlikely)
it will still likely take at least 6 months for a BIOS update
to show up with these changes (BIOS QA takes a lot of time in
my experience).

And even then we cannot count on users to actually install BIOS
updates. So we will still need the INTC10D1, INTC10D2 and
INTC10D3 HIDs in both the ljca and usbio drivers to support
people who are still at the older BIOS.

And if I've understood Sakari correct then the INTC10D1, INTC10D2
HIDs are indeed intended for use with the USBIO driver and
the problem is that ideally they should not also be used by
the LJCA driver.

Since this patch adds the HIDs to the USBIO drivers, where they
belong the whole discussion of them not supposed to be in the LJCA
driver is sort of offtopic and this patch is correct regardless.

As such can you please give your Acked-by or Reviewed-by
for this patch and for the matching GPIO patch:

https://lore.kernel.org/linux-gpio/20251001212416.4871-1-hansg@kernel.org/

Regards,

Hans


