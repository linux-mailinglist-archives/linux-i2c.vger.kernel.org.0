Return-Path: <linux-i2c+bounces-11364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D4AD61F1
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 23:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA573A473D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 21:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BAF24468A;
	Wed, 11 Jun 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoEZHYgW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF671E376C;
	Wed, 11 Jun 2025 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749678841; cv=none; b=lyGEIJMhFTjbHCylvqP2aNTA5U2QP3/cUR15i9eNKZECKaF0GynRS1/GtRsHmgAoF35OxGAhqDsjZq8Esx3oml4W3PLVCJjC6kjbhUKwtgMz3pOFeZPwE1QuiggiG0JkMNXgPU3yqeakC3O9IxdmYTwS5fI2zapqO+px3FD6vOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749678841; c=relaxed/simple;
	bh=tKK5yfPg7D5z3FMs/xanZOrdx6IhPpba6UXPZN6y4u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1MO9m/cWXJWXOFn94Yp3ezHhzujUZxEnBpNWkC/wyiBRwsYB71P8W+S51e/0srUH76fw7pfsm52Cql2t7EMEU+61Wh8r0fT8kkOBdJ6XHeS0QrnYc5b4mvG+NHXsmh9lJ+LwMDaJ+OO+z1WrlttEKLNcQK/f5qXZYqjGngz+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoEZHYgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49722C4CEE3;
	Wed, 11 Jun 2025 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749678840;
	bh=tKK5yfPg7D5z3FMs/xanZOrdx6IhPpba6UXPZN6y4u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoEZHYgW/9gR8xZrH14yAM40F2Jf+X2PgQprkhtx1uSAKFELopVc6F04OGFEovh/n
	 9YIvFd6zpV3eD7vNkozPq6E4wb5L3h8YmiEArpNetPyFNH8AkNm4jdfKaeEwBZsm+V
	 WaAuMpFxacitW/xQmlq1TD5B8aUIYLE8areKB9hutGJXFr89g2QUEsIYaAw5KXXiSZ
	 RP+PUh72z31aPFKp40zQvy/HLnHxKYso+yh8Cb8FMKtlIfQspoH71PYGgx9bSkkI9a
	 l8NyF8Kc0TN7+Xk5R/0bS4dETes/1G25w1zPDQmhW0pd8tPUzwPAadeBxgH2CUUBCD
	 EIM5RuL4j17Ew==
Date: Wed, 11 Jun 2025 23:53:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Jean Delvare <jdelvare@suse.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] i2c: Re-enable piix4 driver on non-x86
Message-ID: <5zw232i4edbbmnm752cenjca4quesl253riv2wkibfqttks5zx@edpkmzqgchal>
References: <20250610205817.3912944-1-superm1@kernel.org>
 <20250610205817.3912944-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610205817.3912944-2-superm1@kernel.org>

Hi Mario,

On Tue, Jun 10, 2025 at 03:58:17PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> loongarch and mips both support hardware that uses the i2c-piix4 driver.
> It should not be restricted to x86, so drop the x86 dependency.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com/
> Fixes: 7e173eb82ae97175 ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
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

mmmhhh... OK.

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Andi

>  	select I2C_SMBUS
>  	help
>  	  If you say yes to this option, support will be included for the Intel
> -- 
> 2.43.0
> 

