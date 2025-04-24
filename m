Return-Path: <linux-i2c+bounces-10617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE47A9B32D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 17:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E7D1188CDF1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 15:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA17627F4CA;
	Thu, 24 Apr 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paqWNiCU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0A1805B;
	Thu, 24 Apr 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510335; cv=none; b=fpegwjEk4S/QdObmfAcAXIVztP6rajaZ6U7rzwMxnayB+N3kPJOhnIXRe9rwm9V48c/H7iOKGMiUwFpAUQ8mGuajCQGyR0uKJTkutXvbzcXUlfmpLZZ4iKvgYWAke8VNENKHByDnHkfS4YyaqeRYtgXgj584n8l35lmBpIBF160=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510335; c=relaxed/simple;
	bh=eJFkFffhcbeDBBA0kOMtPz5wF3uo+4JXiBmQfdEyYGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB2iR2XG3CfISUTDafkFz1hReLdrqOaZTstT7hEACLS+O7xENN/dadJXl9g9q0myWVODHFVCArpNih/sBxnROJnbS9vbXagG3raFCq7LmRlLuY1xhstWHzs0iCMrgLF3YXiYVwfGCsnEfAlxmLlVlXIy5FzHnYWhTb2gZS/PPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paqWNiCU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E3FC4CEE3;
	Thu, 24 Apr 2025 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745510334;
	bh=eJFkFffhcbeDBBA0kOMtPz5wF3uo+4JXiBmQfdEyYGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=paqWNiCUlCeU+xEIkBRi1KMIGIo72dekIVNFBglJCFGgzzyWGt/D69BmDf1YcCQ3O
	 LTqE1CkooTA86vT3BIi8uE8d6JU+yd1AXlNbrSMPkXjq8EZyJA07CgtH/v6rvmNi1P
	 R+caiUO8PJPrGv5Aem1J8yYl1MiVdII5fxTUBnkPwD6LKx/uhS/7FF4vmeVWSrK/5R
	 HnROmeIqIEk76g20Qh5JTzC4w7D47LJovXW/nualNxpZpF/ah6BUFylXU4eE5g55UK
	 P9gq1wgbiE+JE3o3v+e7ZZHLasnsUgB1BuOBB8MPbJuf79t2SAn9h94e/6R7kOpqfB
	 xKlWbToSmkmgg==
Date: Thu, 24 Apr 2025 17:58:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
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
Subject: Re: [PATCH v5 0/5] AMD Zen debugging documentation
Message-ID: <aApfuIX5T5brIdsL@gmail.com>
References: <20250422234830.2840784-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422234830.2840784-1-superm1@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Introduce documentation for debugging some issues on AMD zen hardware.
> As one of the debugging techniques read and add information for
> S5_RESET_STATUS register.
> 
> Mario Limonciello (4):
>   Documentation: Add AMD Zen debugging document
>   i2c: piix4: Depends on X86
>   i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd/fch.h
>   platform/x86/amd: pmc: use FCH_PM_BASE definition
> 
> Yazen Ghannam (1):
>   x86/CPU/AMD: Print the reason for the last reset

So it looks like there's no new objections/feedback, and to
get the ball rolling, I've applied these 3 preparatory patches
to tip:x86/platform, to get them tested more widely:

   i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86
   i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>
   platform/x86/amd/pmc: Use FCH_PM_BASE definition

Thanks,

	Ingo

