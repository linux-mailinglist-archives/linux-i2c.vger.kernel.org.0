Return-Path: <linux-i2c+bounces-10626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2848A9C73F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 13:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D3C67B8268
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 11:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603C6257429;
	Fri, 25 Apr 2025 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U70uki6V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC372571B0;
	Fri, 25 Apr 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579927; cv=none; b=HwX9dCZzDveItjd9xtxuoKHNhA2DTKGpCVNxtRzaNYNzQSuMcmhBLGYDmDOvJV+uJBb/l8NDzBbpmJvTWcv3HE2HBXqxrXwMrettf0r8RyQ55NlfkJVOmggo3QKzQ4/zRlBL/QjN9MMgm8zgbqwI2Ra+DEnwpIZvI6A3wr3jI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579927; c=relaxed/simple;
	bh=NqgGdkd8g5cQ3OKGc4RKIxtEOuoRmO3gUTre8U3aPfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGeC12N3u972t7Q9qvmL5QVuVIVqyNWox1cWLZ0ACUqwqCGv5lDw72dGjzC9wZ6BMJSBL9mduPYkR/YRcmAsFDTuM32O7DOn59AJhdMEMXuoI/J39Bvky4oW/VEPo4PB5+Uq4y5V9wO2gll5Jfcnl4ND+GHUXNyc4Wr5ZWOTq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U70uki6V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04964C4CEE9;
	Fri, 25 Apr 2025 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745579925;
	bh=NqgGdkd8g5cQ3OKGc4RKIxtEOuoRmO3gUTre8U3aPfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U70uki6V7H3WduGjz/GRRmi5rOak9aAX2Q6yKONn7YHn3T1PVH3Gitavn4j97BhEg
	 sRAcrTy3Zot/eYQao2xeNQVA8zvzWzP6tjAxlbZaSPz8G7vfSFIwzCBBJI206avGgT
	 U5v1qHodWaPdRiLfndj0KJYmmVF/GXuOk/0XhKLQbnQYuA1LzUeKynbUbqXW7t4pnk
	 HdECg/sk8b0FMS1ecwnh3s6pVaEHor9ewIu8gxStZ/sBsyaFiPeqwBpXjeGRNCOwD7
	 Zh9uL2CVzBUG+A4o4xEkVnF1cZqZhu2W4xh2BRzDN+na1zqpAT69q/3FRD/DjP40ps
	 eqGV8N/FOVTmg==
Date: Fri, 25 Apr 2025 13:18:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 3/5] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd/fch.h
Message-ID: <iuq72okvc4nhy2ddgkkyb43mhm55ujxru3duqi3whnmgt4zrp3@i5nxnsl2nyc5>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-4-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422234830.2840784-4-superm1@kernel.org>

Hi,

On Tue, Apr 22, 2025 at 06:48:28PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> SB800_PIIX4_FCH_PM_ADDR is used to indicate the base address for the
> FCH PM registers.  Multiple drivers may need this base address, so
> move it to a common header location and rename accordingly.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

