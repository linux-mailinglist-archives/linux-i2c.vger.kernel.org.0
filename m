Return-Path: <linux-i2c+bounces-10288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C345A86FAC
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 22:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 070443BD776
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 20:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B1F202F70;
	Sat, 12 Apr 2025 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjNgpy3S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D8318A6A8;
	Sat, 12 Apr 2025 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744490867; cv=none; b=Xe9+Pc0OZfa3yb0lZTMAm6Wwdfqe+MyYj4SutJXIxWsXzBlCJ2TJOTM9gbpuBBJTmFY7YuIu0W2VeQUbWGikwazByFzhX+WEg4gsQElErOU2CZz1s3kdH4UEzJqD26ycKZm+5F1uMk92WxoGhCfAlBaDW6X1eoqeVoSfkULZuwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744490867; c=relaxed/simple;
	bh=BKr6ISOl9OSEH/bMGDK7wGmxzy0J0b7LJFUrBtTRNpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix3hpQgMzsVl6SQ0lGg1Kas1hiuURDif5bJbYCwNwasL22xOPGeUb3V65esQwyG9Q/PsOzh0y71/qo6XOClQdy9PLmVMDl/P7BhkFUGmybX98kpnKIRqSRdt1uuyfN/yhsD5ES2bYs4aJmwuKutNgGNGiFSZI1k6SAxs18a+68c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjNgpy3S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE50C4CEE3;
	Sat, 12 Apr 2025 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744490866;
	bh=BKr6ISOl9OSEH/bMGDK7wGmxzy0J0b7LJFUrBtTRNpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjNgpy3SLsyY0fYYKbvHPENlXbpYS6b6Lt2Kg8dan1bZoDLiONxq+Xpk2OUTQ6K6Y
	 3f4LFvBcBNy8ljbIU0+cBgVFUwVleKwMDIAHdKHxezS21b7McBeEjVmbAOSc0u3EH1
	 Qk85r+6oBbgq6ldbUdF6FM+vtpSr3FRU4Mr0a5ROjLkbtec6oX8l15KLt8ret/CEGe
	 LCuG9UFCZmpMvQmb/Gt3W2cWJgpvRq9PS+UllB9DtBRR7DMctZ1vJCQ95Mb5Yn7Sas
	 M8STcQrWW2XQUYGGjUDBynK4FmuqqIlewH3p6bKlzihSQED4efKUlLFdSbbuzHyilw
	 3r0e/0Y35OWAA==
Date: Sat, 12 Apr 2025 22:47:40 +0200
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
Message-ID: <Z_rRbNu9v2qIBDVJ@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
 <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
 <Z_rJ37er9Dc25ne-@gmail.com>
 <0cb8bbf3-3f63-486a-97a0-9e1c162cef06@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cb8bbf3-3f63-486a-97a0-9e1c162cef06@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> > and ... I'm sure you knew this was coming, but we should probably 
> > move *all* basic FCH_PM definitions into that header, such as 
> > SB800_PIIX4_FCH_PM_SIZE, and rename it to FCH_PM_SIZE or so?
> 
> I'll double check how it's actually used against the documentation to 
> see if this makes sense.
> 
> If it's only mapping a subset of registers for the PIIX4 driver use 
> bringing the definition out to a header used by other drivers that 
> might need a larger or smaller subset to be mapped might not make 
> sense.

Sounds good to me!

	Ingo

