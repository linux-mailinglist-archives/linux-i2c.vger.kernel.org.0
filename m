Return-Path: <linux-i2c+bounces-11370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26943AD6AF9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 10:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D650A3A5CA1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 08:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F7522126E;
	Thu, 12 Jun 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX/HPvcB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981FD20C031;
	Thu, 12 Jun 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717419; cv=none; b=fuY9v2RcIAO3b5v+lVM0YMfg9vjcGUcoUobXlKEpOAVYRdYZ6NpxMy2Esq67hUhfpE9DvgkdFAlo/CmA1vBkTqeHveyWPlHZUeqATC4wsUCXhIf+ghMhZFJdHSI1Ab7v8hhKBYOjV8yFSuabFASSS6ypJpNrwCJQnBnj460w4Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717419; c=relaxed/simple;
	bh=GoMpUpcTnkXljCONl+ZABtJcQYxcoE6CU/umwyoxxHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Do0SrM2Dptp7mb3qUbrKt2quZEBrgP3MzNYCv0XTvZDzrW+kU99RwZ7vSpgwqBtR+GM5x2Fics7SUecVh5zV0Kl+HS0ulJvzU2KN6qm7zVZdwF1KeUsWwsdRpbBsQgT1lWMo+kulPXO8tWJutI8U9envn5B2kIcF5O2yhNI7RoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX/HPvcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1BDC4CEEE;
	Thu, 12 Jun 2025 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749717419;
	bh=GoMpUpcTnkXljCONl+ZABtJcQYxcoE6CU/umwyoxxHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HX/HPvcBB2hET9v14Wx3W9Ekn2maA1dnvvyTEc0BbikSVPe3r9BR4xu8eMpNu6IQD
	 Rg1PtxQszl3B7S8mfWIwliFPYo0ArJjzSzxYHLxwccZIddTGx4OFwO2L0cjnMKT3Oo
	 b7Q4LbmrY1QGPBnOFbN8z5GWSBOTCI23lCKU3pzJWIv9Uu1p9U1P0KNSG3BNDW0k6T
	 TIjKuaKOlqgmq1oOhqXav2O4HpJEcRoJzzQmnh9bdct3zuqcsaIK6Wi4ZrDaJdLIoN
	 pkwsUATYYs8I5JBL5/28MZht1vQmTpJtq/aSF9UKz9MjmRBZq11LlwTiVXsZyvLX+9
	 chLcyJkIuYCsA==
Message-ID: <62ec9520-a796-464e-9631-c589f25821fa@kernel.org>
Date: Thu, 12 Jun 2025 10:36:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: Re-enable piix4 driver on non-x86
To: Mario Limonciello <superm1@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)"
 <linux-kernel@vger.kernel.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20250610205817.3912944-1-superm1@kernel.org>
 <20250610205817.3912944-2-superm1@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250610205817.3912944-2-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Jun-25 10:58 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> loongarch and mips both support hardware that uses the i2c-piix4 driver.
> It should not be restricted to x86, so drop the x86 dependency.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com/
> Fixes: 7e173eb82ae97175 ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 48c5ab8320090..3be623735ca8a 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -200,7 +200,7 @@ config I2C_ISMT
>  
>  config I2C_PIIX4
>  	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
> -	depends on PCI && HAS_IOPORT && X86
> +	depends on PCI && HAS_IOPORT
>  	select I2C_SMBUS
>  	help
>  	  If you say yes to this option, support will be included for the Intel


