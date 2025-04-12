Return-Path: <linux-i2c+bounces-10287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B50A86F57
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 22:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A66B19E1806
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 20:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD2E203716;
	Sat, 12 Apr 2025 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1gnKgvG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989814F117;
	Sat, 12 Apr 2025 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489408; cv=none; b=Mp6h/zg0dE6LsaB/DgjiqPw7m5zMF0+QDsiN0izxJWIYXZ4j1QSP7i3ptGsajFe93x7xMhAmwR8jZPcIopObfyYwmcRnbtPOCcoF4oVfydgKjLebDcidJn5rk4nIQbOzSqGSTJyP9ttQjruYK0gwzHzz+P0x61pjoSqdC/1GGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489408; c=relaxed/simple;
	bh=mW/CWdaIF1Slb0K2tzffQJDp66vjjCTF75jZxI7kRaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrrYKkK/w+PuMbpwo668i5n9tOiQ7Egd2DvaIBwVxN7wYMljwisnZMUdgXdoU1Lx6TQxQxYNYaBD5C7hLroC2kOkS6WqWBzcLCK7CVBRRdADYJzlPvuRctvgLMdZAsXQ9wpZgSaalvrrcTS/8vP8eUXIvDbsY6L+viVWUHNMaLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1gnKgvG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F68EC4CEE3;
	Sat, 12 Apr 2025 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744489407;
	bh=mW/CWdaIF1Slb0K2tzffQJDp66vjjCTF75jZxI7kRaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F1gnKgvGjTW0BUeUTfwEEDZJoBpY9TY1S5Oi0Pv+u+/0TitSJMz+vKihermbRfeOI
	 uIoTaJdBY5NIrcD7Bd/BwNNvA5M1M7BIq8WdUMj60G++7Fl3BiI+VlHudULaWZVsT+
	 2uM/ULMDixJpXp/OoMD90YJE8kELOwHHh9wl1ljnlopor6ZNPgcTgjwAOeVCjCIiE5
	 wLH6iIw7GIPRp7JwwhApf3gmeClsfD6Ite/V0s55ztFGiBw7GWlXBRkYCIEF0TZA5H
	 mzZANvqd4GrS3zvKiy+V0HxRqFvimaF56m7AqgHvjw12ZwQE3hX4c4HsYHzKrjRku+
	 wa9iWr5l0Izrg==
Message-ID: <0cb8bbf3-3f63-486a-97a0-9e1c162cef06@kernel.org>
Date: Sat, 12 Apr 2025 15:23:24 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
To: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>,
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
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
 <Z_rJ37er9Dc25ne-@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <Z_rJ37er9Dc25ne-@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/12/25 15:15, Ingo Molnar wrote:
> 
> * Mario Limonciello <superm1@kernel.org> wrote:
> 
>> SB800 is pre-Zen stuff.  It's "before my time" - I guess that's the
>> precursor to FCH being in the SoC but has the same functionality.
>>
>> So I'm thinking <asm/amd_fch.h>.
> 
> I went by the SB800_PIIX4_FCH_PM_ADDR name, which is a misnomer these
> days?
> 
> But yeah, <asm/amd_fch.h> sounds good to me too. 

OK.

> Boris?
> 
> and ... I'm sure you knew this was coming, but we should probably move
> *all* basic FCH_PM definitions into that header, such as
> SB800_PIIX4_FCH_PM_SIZE, and rename it to FCH_PM_SIZE or so?

I'll double check how it's actually used against the documentation to 
see if this makes sense.

If it's only mapping a subset of registers for the PIIX4 driver use 
bringing the definition out to a header used by other drivers that might 
need a larger or smaller subset to be mapped might not make sense.

