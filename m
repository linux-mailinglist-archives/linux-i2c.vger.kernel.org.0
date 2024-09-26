Return-Path: <linux-i2c+bounces-7034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B59879F7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 22:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89ED4B23F3D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 20:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AA317C203;
	Thu, 26 Sep 2024 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeakYZDm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2157156F20;
	Thu, 26 Sep 2024 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727381037; cv=none; b=kyBkAK3MvgSoic0odbkz4kbl6NZm+zDAm7LhBjcSNMCLTlSu15A59pCvvtmt8Jofa+Mh5p3hA4zoHC48PSABbN/NinmYPUO9F1JhocpKfQRet075Q4tIeHX0tpaoRWCT2UbThYOMmETwqQNYfE5E0UlnU0DvXlvN1QywYcI1xc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727381037; c=relaxed/simple;
	bh=SRbbCwWk0XCJVj+eh5xq+wMOueKNQS1EHtqrXCZWAFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lm4MR/xHPDEAS31SFfCYbVpdJXnsHETczrsDWknqFymM/30wT9q87OGNqd/Bqw1fYX+WxDqgAVMY3C3QOffg7zhUaeKSLEoWLBt45UgwI1RXk/T151w8s0lB4APTi/S4/EruTsc/a0kOJ1HS7zJU0KpjCVyXKNjBijg9OliaMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeakYZDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25652C4CEC5;
	Thu, 26 Sep 2024 20:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727381036;
	bh=SRbbCwWk0XCJVj+eh5xq+wMOueKNQS1EHtqrXCZWAFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeakYZDme5smhLbMikn3bCRxPOhIqv3qQqVu46y2BJfgIsXsCsR2WjFu6fxhuQuw8
	 rxwR9WFZXF7a6emuBRjJaqdysyh93ar1pjlO0z5oZHtRqyf6LHvMOXo4rFzR9d3a9K
	 Bavlz37xWQKbEru+bNo3TcK3BYq+UBeLlNh6Kxyt01RZMbDpdmHpPGpDuci9lLLZkb
	 LHN7qWCfhY4fzLZL2rftxR9LEsyNSiZf8Wd12fPzjO8t3iEM1Vi9nhRrCgAoOmQhup
	 +G227w06W0pEz3qBXF3p8SBfy+oyJ6oj1yFyMwry2gRhDIPLs0bTFpARoVsY3zv5v+
	 SWKlhmWgGplew==
Date: Thu, 26 Sep 2024 22:03:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Narasimhan.V@amd.com, Borislav Petkov <bp@alien8.de>, 
	Kim Phillips <kim.phillips@amd.com>
Subject: Re: [PATCH v1 0/5] i2c: designware: Cleanups (part 4)
Message-ID: <ny74rren7njqenqnbaaviknvhaw5aev4a4x3w2kwqtuxg24qul@5btnsxohtoky>
References: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (5):
>   i2c: designware: Use temporary variable for struct device
>   i2c: designware: Get rid of redundant 'else'
>   i2c: designware: Remove 'cond' from i2c_dw_scl_hcnt()
>   i2c: designware: Use sda_hold_time variable name everywhere
>   i2c: designware: Fix spelling and other issues in the comments

merged to i2c/i2c-host.

Thanks,
Andi

