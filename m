Return-Path: <linux-i2c+bounces-10776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D134AA9CEA
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9557C17E3A0
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 19:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1568E2701CD;
	Mon,  5 May 2025 19:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYcuYJtG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E81D959B;
	Mon,  5 May 2025 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475109; cv=none; b=K/CoTpQ86DitaDWYh3Pi7Db5J546s2PSDV6W+UgzfIrrzqJiAmbcwgqr9bW5Rk2ADxPPAxKaGhi+SCyJlQCk34LRn0QlKYwr0vViEH6+yplQU4Y4umJf3WBDJYgUD+aCdELlL6i4ogx+IQ+AMYjusfEJDg7O8B3WJv7FLm9ewlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475109; c=relaxed/simple;
	bh=xjHOhcYzMXv+FCgJe3jivwsMVlYgbcm0qjJEQ0SFgXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzWkbL3VdcDInldywQiqw4P+FpMxj4Ww4FCUKzlwYM//TsqQzZUsDyxoqThf3yIM7LPxiU4JsLB1r+jo2225qY5/sq2cG1MEjRl79j8y0JIPEhsqUNJ/q0TRlXoGed2mtol87tVk6vPKV54XllOmtquF/4ta7bfuxMSSYH5f07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYcuYJtG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24CEC4CEEE;
	Mon,  5 May 2025 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746475109;
	bh=xjHOhcYzMXv+FCgJe3jivwsMVlYgbcm0qjJEQ0SFgXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYcuYJtGVB+MFnvtpOFUuijOxfhyhAS1jhzd9tT+eszXUncGC51kkkJZhJwTFrY3n
	 IqMMMrr0z7Xgm31Ivp6JkV1DyKzLLGbCLmtdANgDtw166FQ6jH4Wex6SUAsrGHQv5r
	 ZPn+pe1K0GPLLASX8VU/WEGzyTT2wOve7YjM4g4UZ8iViw7GIR9Rh2wqBOg5nSIndn
	 gNQamE8Lggb6NRLB35cvhBmpt9ojf/veJ28UVI7xCzCbRWWf70/OezI79ud34b28My
	 9hC6MO9ztkm4JzwoA91I1iElup1N087fI1klfZkmrih7CpBGPOm/4xCjCxNYKfVKS7
	 ovhHb95DdNPAA==
Date: Mon, 5 May 2025 21:58:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Guenter Roeck <linux@roeck-us.net>, 
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] i2c: i801: don't instantiate spd5118 under SPD
 Write Disable
Message-ID: <zsont6dpoaovu66tcgnd2lalllrzh4hz46fac5bto2ui5nyp7e@nhde2pkrjr4m>
References: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>

Hi Yo-Jung,

On Wed, Apr 30, 2025 at 07:26:15PM +0800, Yo-Jung (Leo) Lin wrote:
> On some PC platforms, the BIOS may enable i801's SPD Write Disable bit and
> forbid writes to certain SMBus addresses. For the i801 family those addresses
> are 0x50 to 0x57[1], where the spd5118 sensors are usually probed.
> 
> The write-disabling bit will make sensor functions related to writes and
> nvmem access unusable.
> 
> Also, the driver is unable to sync back values from regcache to the sensors
> during resume, leading to resume failure. This has been observed on multiple
> existing PC platforms from Dell and HP.
> 
> Furthermore, BIOS can be implemented in a way that, after a reset, the sensor
> page value must be selected to 0 first before its values can be read.
> Not being able to write to the registers renders the temperature reading
> unusable. See discussion in [2].
> 
> To address these issues, do not instantiate spd5118 if the SPD Write Disable
> bit is set.
> 
> [1] 18.1.16 HOSTC—Host Configuration Register (SMBus—D31:F3),
>     Intel 8 Series/C220 Series Chipset Family Platform Controller Hub(PCH)
> 
> [2] https://lore.kernel.org/all/acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net/
> 
> Signed-off-by: Yo-Jung Lin (Leo) <leo.lin@canonical.com>

You forgot to add the r-b from Guenter. I added it and pushed to
i2c/i2c-host.

Thanks,
Andi

