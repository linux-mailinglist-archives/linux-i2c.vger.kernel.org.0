Return-Path: <linux-i2c+bounces-10472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA0A92D2D
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 00:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F34448062
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 22:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76999210198;
	Thu, 17 Apr 2025 22:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7/HSPDa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BFA927;
	Thu, 17 Apr 2025 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928197; cv=none; b=GEAxMHgcEVSwB6VKu0RsxWPxJaKrrPBqDFsvcRv3cuSvOySMg8zT0E128GEPmSSJj7FTd29vmam4WchcvR5I+i4TnFJcQZR5Fv1fzlLlV3A/JfiMb6PCYJkt7svClrNuRMGkQa0UM9oaUHi8i7rEW8M6SJrZwuAIca2cYmxO8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928197; c=relaxed/simple;
	bh=CXMpZCl5Wu/tLvmsWoMbeqnU6gAzWcoiyyA72jODzX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1gSCQLFSjxnbe72TjndDm1ASwTF6Zr2IKMonuUaFyob//u1W5PN87VPy9AMNESA8SKQPgtbPPXRV6cKD4EzbbsDYfbUELvXSkbwmwYGegGyqebgyR4ijrTkrsj3qMM4aEdb1ZwkEU2YtaSltfm6dK3csFRf+YQlDm3N9b7Ol1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7/HSPDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B88C4CEE4;
	Thu, 17 Apr 2025 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744928196;
	bh=CXMpZCl5Wu/tLvmsWoMbeqnU6gAzWcoiyyA72jODzX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7/HSPDaumbLgqxH1r9FzCH2ruApgckzrDuuqNGEgMT2Yv/tYfA3K10EUtGX8NQyZ
	 uQZMcJo3WYFCXoqkhjGIeNYY6yx03lKC9o/752srvTjg8ziOx/1/oHCDnId8YmYcpP
	 lmMhSIBVWqO5Qbos/hKzttPM5HowAqM1wsrMuzoLDigRtNrLDHIWoWAXUO0w34X4nI
	 KDpwi0b/2T9Y5xS+RnTcxQX4aT11+3/Zzz3rxuawMAD0ZTS2V2BpHqm4zcvWhUK0S6
	 pjDjqjxXVRuUPlXFZ6ALof9xoVWAqHuegT/StO6CREqi+6X6GFClgcMKxVSKuf0yIL
	 I8wNk914utzyA==
Date: Fri, 18 Apr 2025 00:16:31 +0200
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
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, 
	kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4 2/5] i2c: piix4: Depends on X86
Message-ID: <p25szqqrnvvcut7bbmbhjhxjpqj4wgzvxfqigiopwnv4sspid3@caru7peqpvwz>
References: <20250415002658.1320419-1-superm1@kernel.org>
 <20250415002658.1320419-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415002658.1320419-3-superm1@kernel.org>

Hi Mario,

On Mon, Apr 14, 2025 at 07:26:55PM -0500, Mario Limonciello wrote:
> PIIX4 and compatible controllers are only for X86. As some headers are
> being moved into x86 specific headers PIIX4 won't compile on non-x86.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504120558.sq3IpWdH-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202504120432.0F8lOF3k-lkp@intel.com/

givent that the next patch is not merged anywhere yet, the above
three tags are not needed.

BTW, can I already take the two i2c patches?

Thanks,
Andi

> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

