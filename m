Return-Path: <linux-i2c+bounces-12559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48690B40AA4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 18:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1704E4E385F
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 16:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0FF3128D1;
	Tue,  2 Sep 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PK+5Of+S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41E22A80D;
	Tue,  2 Sep 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756830668; cv=none; b=HE63+aMpfU5awbHX76l0Kfao44W0BaY3jzoKsrRhAFqqAPAEBaVsoxCBsSZOv3KfWYd77PSuP8/eiSg/TYldTKG4hSjchNshI/qc28h79NsIlBVBUQxRPLpkYm9JUSAkQDwwj07cBT/eR3Sr+Ck4s8IWT7hYv7mKKVI2cymr7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756830668; c=relaxed/simple;
	bh=HYlnV3erw35UK+5Aq/j9EMKiRS0nCsQKP/ItMYouIMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rH31Mz1X0DTYJVkBNW7+fkdKMfil2o7ti9kNQyjqwydGQEUeQRAAS5QqlEo4cmWwP8+u63JCKc1ftjarI5zTYd1nXlIY4EI2lUUhp2hhOKFETVMDBSdAAYEBH7zuc3IfkNEr89AJL47Mf8yl433g+rsVTB0T1pyamr3n0UnWQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PK+5Of+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BBEC4CEF7;
	Tue,  2 Sep 2025 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756830667;
	bh=HYlnV3erw35UK+5Aq/j9EMKiRS0nCsQKP/ItMYouIMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PK+5Of+SnuWBk3UQ0ushrBUCJtj7xQIjQEtqb0I6HWWipzvL3H5BDqjSQivLtrtdQ
	 Aw67y/gQ2sApItrWdo+XqJIfe3uSOOKPHeoDX0RMp3iyicnSYJ860q1LIhbKrI4IPf
	 nP7J2JPhx4utyaS11xa1xrOIV3+FeFpwH6CYAdNnR7xCNTYBZSoC+ilOLSgu1XXxU8
	 ElHEAJccR1+2O2T0X/nPnrovBzEiakXfkDQBXc3sfb27NqeG0DTHlQug55Znn3nvvB
	 CF3Eso04iu4lMKKpaEd+vqixABqxHu7DFyxt9EwJhamgMdEWDXEkPMD2EKpA4czdiF
	 SlpEXzoQWNm5w==
Date: Tue, 2 Sep 2025 18:31:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chiasheng Lee <chiasheng.lee@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Hide Intel Birch Stream SoC TCO WDT
Message-ID: <rnlxqe4nivvgziipgiekizgtog3uldun4jes5s3mooc7rjduv7@sihllwuqnn5a>
References: <20250901125943.916522-1-chiasheng.lee@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901125943.916522-1-chiasheng.lee@linux.intel.com>

Hi Chiasheng,

On Mon, Sep 01, 2025 at 08:59:43PM +0800, Chiasheng Lee wrote:
> Hide the Intel Birch Stream SoC TCO WDT feature since it was removed.
> 
> On platforms with PCH TCO WDT, this redundant device might be rendering
> errors like this:
> 
> [   28.144542] sysfs: cannot create duplicate filename '/bus/platform/devices/iTCO_wdt'
> 
> Fixes: 8c56f9ef25a3 ("i2c: i801: Add support for Intel Birch Stream SoC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chiasheng Lee <chiasheng.lee@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220320

merged to i2c/i2c-host-fixes.

Thanks,
Andi

