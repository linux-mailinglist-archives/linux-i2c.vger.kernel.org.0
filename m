Return-Path: <linux-i2c+bounces-10632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804DA9D9B8
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 11:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30BC9A5C59
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 09:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB8B24EAB3;
	Sat, 26 Apr 2025 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVGFN06B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB02221FC1;
	Sat, 26 Apr 2025 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745660548; cv=none; b=GKUzfJvxjAjLuWHPb+297696R1UQcah1PZRVfYpaMXqtnCEjgrh5FmVzEEx1JC+y9osn6qEesTX4kHaFFzh4rrUvJLMyvEBMB33xn15hLc8nhR0KcmuifSE9bMKbPzFKgR2496seWnfcaW+oT2Nw3vGVmIayPmjkhx734sdGSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745660548; c=relaxed/simple;
	bh=GKYZDfmT8vrfb5LgauTuj6xSdhIuzi1Ln9+BvIpR6bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxAiduClbKrAB9HXBukOtzecW8QKb/D2k9u+9rmBQDDKZyMpVFzQ2Ish6l4S3gXIl7iC1sHu1DCMK7HA43thL6+5AnlDs4Xr2uWe5NmfcbM216qHuKs08E2n+lUkdHjn2xngKKHu2CY1KLEySp80emX3Tb6clu842Ry7T+qNs/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVGFN06B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36B7C4CEE2;
	Sat, 26 Apr 2025 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745660547;
	bh=GKYZDfmT8vrfb5LgauTuj6xSdhIuzi1Ln9+BvIpR6bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVGFN06BVpXQADF0McOYueFwHEJhzWz636+kIlsGWOMDkbla7J9iRT6MOM5btu29t
	 7hrzRp906EFlYVTlOPXUuC1W62smXtLsaIzA8HaccyZjb/y5kRttqFLrTM/DtGyroV
	 +vsQ0YDjmUTeSZOXRfRA9nNUoSfUCuBj8NtLlv6Fi79bKQmIQ/fUTbOEQohxgwWqDd
	 Tb6IGOpyh63YdXZWl0MaGfBiu1PyWpxd0x+I3NNXULnzYTUmCrJIWsf9vb9fucFp8f
	 JS4ufPR9XO2Ub+4CWmtXMWYjzLHwDnViIosaVAQ2wDJ9mj96tB9cuWRrlOnuJfN7H7
	 RIaV/e4EOKamA==
Date: Sat, 26 Apr 2025 11:42:21 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
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
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
Message-ID: <aAyqfaz4-_9qOG-x@gmail.com>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-3-superm1@kernel.org>
 <qqrff4zx6eyoyppx3bmsujl4vzhmlwi2dldhoxxikkspmlbiiz@sabqjmjekv7w>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qqrff4zx6eyoyppx3bmsujl4vzhmlwi2dldhoxxikkspmlbiiz@sabqjmjekv7w>


* Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi,
> 
> On Tue, Apr 22, 2025 at 06:48:27PM -0500, Mario Limonciello wrote:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > PIIX4 and compatible controllers are only for X86. As some headers are
> > being moved into x86 specific headers PIIX4 won't compile on non-x86.
> > 
> > Suggested-by: Ingo Molnar <mingo@kernel.org>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> OK, so these are going through x86, at the end.

Yeah, if you don't mind. There's a later x86 patch (5/5) that depends 
on the new header.

> Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks! I've added your acks to the commits.

	Ingo

