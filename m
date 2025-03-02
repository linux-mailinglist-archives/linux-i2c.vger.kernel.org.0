Return-Path: <linux-i2c+bounces-9673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C9A4B0B3
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Mar 2025 09:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A97C16F9C7
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Mar 2025 08:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966D11D5CD9;
	Sun,  2 Mar 2025 08:34:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B6192D96;
	Sun,  2 Mar 2025 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740904463; cv=none; b=p+ESFzbktlJvWUXeyhjl0StJx3EFHzi8QboDOq69ciySwf5GZ1I7KpgmOeHKiWN731oQ2sFqrP37YDWhqbNYe9Co8eQOd8DUCcC7EYgJEg21bNB8BXkqH14Turfchv13DBZBSphM/7WZMjKrPQGUWHaKHGMsPCp6H2FcH+VtlI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740904463; c=relaxed/simple;
	bh=5JJ8bWxyJ41/8t713l8MUHmkyDaXWeaPKkyDIdKnQCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qczLvtYglpaiXNmzupqDTM1RlrexvcQvVQZQPxbME3XCMieHX2IObT+1GDOz5yIa6nbFZzgeBazrsFgk09tLRe4t7VatlmQf9ggAIq9YUUN2YCBmhid5gcfDYkMVwwtYhGb6FiAhRNmiaN8UzOAq21bgnkH7xWj9ih9jkTf0hw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A56EC343175;
	Sun, 02 Mar 2025 08:34:20 +0000 (UTC)
Date: Sun, 2 Mar 2025 08:34:16 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Message-ID: <20250302083416-GYA56903@gentoo>
References: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>

Hi Troy:

I'd like to have all spacemit patches Cc to its mailinglist[1]
Can you do a resend version with "RESEND" prefix? no need to increase
the version number, but should state the reason, thanks

Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]

On 12:51 Sun 02 Mar     , Troy Mitchell wrote:
> Hi all,
> 
> This patch implements I2C driver for the SpacemiT K1 SoC,
> providing basic support for I2C read/write communication which
> compatible with standard I2C bus specifications.
> 
> In this version, the driver defaults to use fast-speed-mode and
> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
> 
> The docs of I2C can be found here, in chapter 16.1 I2C [1]
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
> ---
> Change in v5:
> - Path #1:
>         - Add `clock-names` property
>         - Modify the clock property into two
> - Path #2:
>         - Enable the APB clock
>         - Fix comment and code styles
>         - Fix typo and drop unnecessary description in Kconfig
>         - Prefix all macro definitions with SPACEMIT_
>         - Rename `spacemit_i2c_bus_reset` to `spacemit_i2c_conditionally_reset_bus`
>         - Remove all `unlikely` and `likely`
>         - Remove unused register and bit macros
>         - Remove the "err" field, as it only contains a subset of the status field
>         - Retrieve `clock-frequency` from the device tree instead of using a macro
>         - Use a local variable to track the current message
>         - Use `i2c->read` to represent read and write statuses instead of `i2c->dir`
> 
> Link to v4:
> https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com/
> 
> Change in v4:
> - Patch #1:
> 	- Change the default value of clock-frequency from 100000 to
> 	  400000. This is to correspond to the driver's default value.
> 	- Drop the minimum of clock-frequency
> 	- Modify the description of clock-frequency
> - Patch #2:
> 	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
> 	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
> 	- Drop useless wrap
> Link to v3:
> https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/
> 
> Change in v3:
> - Patch #1:
> 	- Change the maxItems of reg from 2 to 1 in properties
> 	- Modify reg in dts example
> 	- Changed the enum selection for clock-frequency to a range,
> 	  setting a minimum value of 1 and a maximum value of 3,300,000.
> - Patch #2:
> 	- Drop unused judgement in `spacemit_i2c_xfer_msg`
> 	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
> 	- Fix the error check for `i2c->base`
> 	- Modify Kconfig dependencies
> Link to v2:
> https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/
> 
> Change in v2:
> - Patch #1:
> 	- Change the maxItems of reg from 1 to 2 in properties
> 	- Change 'i2c' to 'I2C' in the commit message.
> 	- Drop fifo-disable property
> 	- Drop alias in dts example
> 	- Move `unevaluatedProperties` after `required:` block
> - Patch #2:
> 	- Alphabetize Makefile and Kconfig
> 	- Change `.remove_new` to `.remove` in `struct platform_driver`
> 	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
> 	- Change `spacemit_i2c_read/write_reg` to `read/writel`
> 	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
> 	- Clean up code flow
> 	- Fix unnecessary line wraps
> 	- Move `spacemit_i2c_handle_err` to a suitable location
> 	- Modify Kconfig dependencies
> 	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
> 	  the intermediate variable
> Link to v1:
> https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/
> 
> ---
> Troy Mitchell (2):
>       dt-bindings: i2c: spacemit: add support for K1 SoC
>       i2c: spacemit: add support for SpacemiT K1 SoC
> 
>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  59 ++
>  drivers/i2c/busses/Kconfig                         |  19 +
>  drivers/i2c/busses/Makefile                        |   1 +
>  drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
>  4 files changed, 696 insertions(+)
> ---
> base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
> change-id: 20241031-k1-i2c-master-fe7f7b0dce93
> prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
> prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
> prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
> prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
> prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
> prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
> prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
> prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
> prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
> prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
> prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
> 
> Best regards,
> -- 
> Troy Mitchell <TroyMitchell988@gmail.com>
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

