Return-Path: <linux-i2c+bounces-10286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FCA86F48
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 22:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA39C17CDC2
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 20:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E219004A;
	Sat, 12 Apr 2025 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S46yvMNp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97991862;
	Sat, 12 Apr 2025 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744488935; cv=none; b=QUK43IBoWHHuTId+KXAz4g5vzxb8vEkjjjtzG2O0YQiGCWHp7dGZ9V2pH5iT/zgBfEgnDxgPBBAn5Ous7tRH4kXtrUXonXfazxu/O0eCTy86MsaUqmSmfTak88jc2IM6fbOeFdS9JtfnqzfNhIBaIuC42CnRq+NHLno8dpCbcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744488935; c=relaxed/simple;
	bh=Or+NMXs931Ofg2S4YMkEwk6tZqDrWdMNxO/CVa+/9io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciHTnfa9ptU/M4ibTknjfKRqWMqPB8dbk+D4SvBGQupuN8TRyxDzoqs7aIHg9vjPUcPamZWgVuRCAAcz/YBvE8TbsWhtiU/4sDgYmVICUjMMUzLTahWq5c2sfC6QHqL5igEpyFSB1LgEgFhCeepYq2jlJNR3Sy2O9nRsLWzIgMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S46yvMNp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C558C4CEE3;
	Sat, 12 Apr 2025 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744488934;
	bh=Or+NMXs931Ofg2S4YMkEwk6tZqDrWdMNxO/CVa+/9io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S46yvMNpNSZtoKiOx3ftM4XHA2KLk6F5MMFnq9Vt+7EdFb8G3rMB1f2hm3G/rOR7n
	 UdR3QfnAHEZYRbbWkBO2WIXbkCh7UM+jSO+z96xQ/rswcRROu6LisQCk6Yu1f1B4Ds
	 NEoLWrRGIQ7+sZk98IAFpoiTNsKFmkFur0rnAElaaMp4J3U8DHAHLdzQzPoQ4cpkjx
	 yxkcFhtxKWqFvMrkCres7h1+mHCNDX0aCPu5TgS9XgHdYrgzWr7bXMt9pylnOCFFZL
	 5M4yZFDfg/Jvsg2nppqPTmF82joadaRv2KDPKNW07JRddypUqi+gRWZ6iSoxNZzkAt
	 nOXWKFznvGV2A==
Date: Sat, 12 Apr 2025 22:15:27 +0200
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
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
Message-ID: <Z_rJ37er9Dc25ne-@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> SB800 is pre-Zen stuff.  It's "before my time" - I guess that's the 
> precursor to FCH being in the SoC but has the same functionality.
> 
> So I'm thinking <asm/amd_fch.h>.

I went by the SB800_PIIX4_FCH_PM_ADDR name, which is a misnomer these 
days?

But yeah, <asm/amd_fch.h> sounds good to me too. Boris?

and ... I'm sure you knew this was coming, but we should probably move 
*all* basic FCH_PM definitions into that header, such as 
SB800_PIIX4_FCH_PM_SIZE, and rename it to FCH_PM_SIZE or so?

Thanks,

	Ingo

