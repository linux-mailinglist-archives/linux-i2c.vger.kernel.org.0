Return-Path: <linux-i2c+bounces-3733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BE8D6AF8
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 22:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D7B1F24966
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 20:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2B917D8B3;
	Fri, 31 May 2024 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9Bfzypu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75B1CA80;
	Fri, 31 May 2024 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717188170; cv=none; b=UKE4/3YB19u5DuPqO1RYpV2dUZp2ApkJgz2RXFH3uvcfaRezn9S8U6IipyVBXVTHV4sRkqqtldBMIvIZR+4QuaHifT1XJGSwKAlcRNwc7kj52Fe9hCHzpXSyuACEh0IxcTm5mNEcbTHDFCwEmDEGlU+tKk4XwLyYcY6vXrYiaK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717188170; c=relaxed/simple;
	bh=PmQQOgLJnwokEGexRwTsR1exmf+oVHAZYP4+TByy+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ThirfbKV41cv5xowaDxNuAwV0CCsSk+hR4/XDwdL4eNQzCBhpVFesj17t34WOjCoNkXWDGC4Hs42hWlts8i1B/HR9NSbyOgX1/tIootVAxHPl6bE6H6WRhX6LOUb0M1HJpan2Afpof9Hri/PJpGbH+1zGwvDCoUbY3HoxL2T1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9Bfzypu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DB6C116B1;
	Fri, 31 May 2024 20:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717188170;
	bh=PmQQOgLJnwokEGexRwTsR1exmf+oVHAZYP4+TByy+p8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=a9BfzypuYtA3cKVYacZV5EUUB7zGI9r1QtwtHcPQPd15rb31JAV1xxx7E5Gq4ftuj
	 bI6pfP+Vik12+WsTDbeQxN4ADrMwuI7cGxEAO/g/uSerH5E7laglQFEw0d9w0YUJpt
	 9A5hc7zZzStxGpSkE9uO0V/EJuxWd6zAWAiZtAMgwTr47CL3aRyq0DK3AfajXuhALo
	 VKxJCrbYbt35VIxzBCOGTAvFHnZZCty/BfrICg3pBK+P77HcNwCiuuDK9WtBHCoyOW
	 vNLGOaqefSmGk/nd2R9v+OVsxtk5II400eLyc415oNxmudPCFzDXNvsbh6yTbsZfKX
	 js0gePmdrrcyg==
Date: Fri, 31 May 2024 15:42:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, linux@roeck-us.net,
	conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
	luca.ceresoli@bootlin.com, chou.cosmo@gmail.com,
	bhelgaas@google.com, lukas@wunner.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [v3,1/2] hwmon: add MP2891 driver
Message-ID: <20240531204247.GA608272@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB648253BF01D42B24A72B0027FAFC2@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Fri, May 31, 2024 at 03:26:01PM +0800, Noah Wang wrote:
> Add support for MPS VR controller mp2891. This driver exposes
> telemetry and limit value readings and writings.

> +++ b/Documentation/hwmon/index.rst
> @@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
>     mp2975
>     mp5023
>     mp5990
> +   mp2891

Add in alpha order.

>     mpq8785
>     nct6683
>     nct6775

> +++ b/Documentation/hwmon/mp2891.rst

> +Device supports direct and linear format for reading input voltage,
> +output voltage, input currect, output current, input power, output

s/currect/current/

> +++ b/MAINTAINERS
> @@ -22683,6 +22683,13 @@ S:	Maintained
>  F:	Documentation/hwmon/tps546d24.rst
>  F:	drivers/hwmon/pmbus/tps546d24.c
>  
> ++MPS MP2891 DRIVER

Should be added in alpha order.

> ++M:	Noah Wang <noahwang.wang@outlook.com>
> ++L:	linux-hwmon@vger.kernel.org
> ++S:	Maintained
> ++F:	Documentation/hwmon/mp2891.rst
> ++F:	drivers/hwmon/pmbus/mp2891.c
> +
>  TQ SYSTEMS BOARD & DRIVER SUPPORT

> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>  obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
> +obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o

This list as a whole isn't sorted, but I would move this so the MPxxxx
entries remain sorted.

> +++ b/drivers/hwmon/pmbus/mp2891.c

> + * Vender specific registers, the register MFR_SVI3_IOUT_PRT(0x65),
> + * MFR_VOUT_LOOP_CTRL(0xBD), READ_PIN_EST(0x94)and READ_IIN_EST(0x95)
> + * redefine the standard PMBUS register. The MFR_SVI3_IOUT_PRT(0x65)
> + * is used to identify the iout scale and the MFR_VOUT_LOOP_CTRL(0xBD)
> + * is used to identify the vout scale. The READ_PIN_EST(0x94) is used
> + * to read input power of per rail. The MP2891 does not have standard

s/of per rail/per rail/ ?

> +	 * The output voltage is equal to the READ_VOUT(0x8B) register value multiply
> +	 * by vout_scale.

s/multiply by/multiplied by/

> +	 * The output current is equal to the READ_IOUT(0x8C) register value
> +	 * multiply by iout_scale.

s/multiply by/multiplied by/

> +		 * The MP2891 does not follow standard PMBus protocol completely, the
> +		 * PMBUS_VOUT_MODE(0x20) in MP2891 is reserved and 0x00 is always be
> +		 * returned when the register is read. But the calculation of vout in

s/always be/always/

> +		 * The MP2891 has standard PMBUS_READ_PIN register(0x97), but this
> +		 * is not used to read the input power of per rail. The input power

s/of per rail/per rail/ ?

> +		 * of per rail is read through the vender redefined register

s/of per rail/per rail/ ?

> +		 * The MP2891 PMBUS_VIN_OV_FAULT_LIMIT scale is 125mV/Lsb.
> +		 * but the vin scale is set to 31.25mV/Lsb(using r/m/b scale).
> +		 * As a result, the limit value should multiply by 4.

s/multiply by/be multiplied by/

> +		 * The scale of PMBUS_IIN_OC_WARN_LIMIT is 0.5A/Lsb, but the iin scale
> +		 * is set to 1A/Lsb(using r/m/b scale), so the word data should divide
> +		 * by 2.

s/divide by/be divided by/

> +		 * The scale of PMBUS_PIN_OP_WARN_LIMIT is 2W/Lsb, but the pin scale
> +		 * is set to 1W/Lsb(using r/m/b scale), so the word data should multiply
> +		 * by 2.

s/multiply by/be multiplied by/

> +		 * The PMBUS_VIN_OV_FAULT_LIMIT[7:0] is the limit value, and bit8-bit15
> +		 * should not be changed. The scale of PMBUS_VIN_OV_FAULT_LIMIT is 125mV/Lsb,
> +		 * but the vin scale is set to 31.25mV/Lsb(using r/m/b scale), so the word data
> +		 * should divide by 4.

s/divide by/be divided by/

> +		 * The scale of PMBUS_IIN_OC_WARN_LIMIT is 0.5A/Lsb, but the iin scale
> +		 * is set to 1A/Lsb(using r/m/b scale), so the word data should multiply
> +		 * by 2.

s/multiply by/be multiplied by/

> +		 * The scale of PMBUS_PIN_OP_WARN_LIMIT is 2W/Lsb, but the pin scale
> +		 * is set to 1W/Lsb(using r/m/b scale), so the word data should divide
> +		 * by 2.

s/divide by/be divided by/

