Return-Path: <linux-i2c+bounces-10757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893EAA8459
	for <lists+linux-i2c@lfdr.de>; Sun,  4 May 2025 08:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D137F3AE4DC
	for <lists+linux-i2c@lfdr.de>; Sun,  4 May 2025 06:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73EA16D9C2;
	Sun,  4 May 2025 06:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rpc6rwtB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1D4A29;
	Sun,  4 May 2025 06:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746340715; cv=none; b=JlVvUFb8DJwXuKh7FquWqyFTXCkC6J5NFdvPxglHLLfTfPFd1hqIyAKfbuJCTjFfBwi7cNdUClTzKACH5AOl33TiEOfB56UCOae16Qj3wDSYPjNIV5yGdOgDnrTR8oBCcJ7uKLc77EZ8HdM78vwwS3FW4Q6mXQmkh3Rl7dWmSzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746340715; c=relaxed/simple;
	bh=atK0fs5+tGXgtwrs9pEZbN2rzOq3j2mxg+Na1G01YHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWNE4hDpqkHZ6EVzjHuTMUA3qYwHvJPGJbSo9HwnNSyInX/vP9BKo8FTvRnE3K4HHE3tsaUs8nShYFjpm7ZbWnk38HMM7vBm1Xk+zwx7Qi8wI9lekWXoZSr2tu4Zky9gy7+Jf1ASsEuF+EP0Siy8/aIZ3NZCAg8VOVbgs9Nw3VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rpc6rwtB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D92C4CEE7;
	Sun,  4 May 2025 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746340714;
	bh=atK0fs5+tGXgtwrs9pEZbN2rzOq3j2mxg+Na1G01YHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rpc6rwtBY0Bmx3tq1lpw4ihoJRgG89DExH9nb9Sk386MtpU/GJHz2k8hX5aPrdb38
	 ahSy2+TDy/sInlLjWeBMPkGEzENh+X77H4Y2+g19DalCT+hBO+oFjl4JvbFHK47FPJ
	 O/TRcBeFTvWY3DE6dr3nZCfMaOrslQm6986kS+WvhQW+PRI6zILbIqlR1aw4uQIP9K
	 Ywjy5Zc7sK4f6N6k/zbKSPDDchl7a5HTNdtJQ7Tayn/Zx2Wmjbzh8RgQ/els+PwcUM
	 DTUFsJetY3lANrGNVIJqhF8UmnHgUoqVFhECdUkamtk52OtMrutO95Zxk6VeaPvUT8
	 4aTmMU6y/Rgog==
Date: Sun, 4 May 2025 08:38:29 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 5/5] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <aBcLZUxct4ppmWVB@gmail.com>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
 <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
 <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
 <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>
 <20250430192538.GGaBJ5MuS4CEKa4kIX@fat_crate.local>
 <4bf62335-2e67-43c5-b2dc-4b0bed0521ed@kernel.org>
 <20250501083151.GBaBMxdyrtpcVlQaei@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501083151.GBaBMxdyrtpcVlQaei@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> +	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
> +		if (!(value & BIT(i)))
>  			continue;
>  
> -		nr_reasons++;
> -		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
> -			value, s5_reset_reason_txt[bit]);
> +		if (s5_reset_reason_txt[i])
> +			pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
> +				value, s5_reset_reason_txt[i]);
>  	}

Yeah, this is much more straightforward code that gets us all the 
information - as diagnostics code should be.

Thanks,

	Ingo

