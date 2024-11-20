Return-Path: <linux-i2c+bounces-8073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6929D330C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 06:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CEDBB22D84
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 05:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4010F15746E;
	Wed, 20 Nov 2024 05:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tXWLlk/Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB65FEED;
	Wed, 20 Nov 2024 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732078842; cv=none; b=BazphJ4pk19HW91lrHVIy5b1ZA81uKm58LMi8ZQD5OdLBAVKIrVpxf800VZjg3g6+4ebZh8Zw8/tzae1tQJqgHVawXAdfurT0pqsydDo4OTUaJKDBbyvG0B5t+HvD5HOpegZt9dheqK+WBenpnEqomq5yN0ZI0mw1NVlz4ouBos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732078842; c=relaxed/simple;
	bh=cpB/HiPM61bYoDnwrQFvb5I0hNgSN7kTddtVTfqJjFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJKCQ8attUQM2w8cAqWl78N4tA/lI5Crw5UCIM5ZhHbxSdE6ulZS+e8CczdSm3NY1bPo7eeOKd565xA6jjrmLoUHDRQGpX+/s6d9Ba14DtG9NqTxAbelR749JswujTQp12i2C89vIZVODYs475lWI+vmk5nlBijDW7VkkxkRY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tXWLlk/Y; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0oKKLy8kcx0TjraGVG5CIBrJeagZ8oxgqvK4ygkW7fQ=; b=tXWLlk/Y8qBI6tq7hVro9DwHC4
	We33B1zjto9P7bAJ6UU62fKaC5gXElieYUMt+lUX1DzO5X1VFTHQeyjdVINo91ZGZFq5raEh8f5YG
	dMbgK5wm1wQT00Shkw9AH4m0a7wyDg2lAG7b/fgiGK4EOmS0P+qBzCz5CCsGjaG6ceoGFkIBTb33f
	nFKLOlAzg9wTDVwTEGVn4PG4c+9P1ivvaCiA8zrXt8a9o4H10GRCU18rdf8MHBnA+0MTXETQLKWEE
	tREZGqzbMTHnkzPzjEPexzTQQU68UIokA6dyvtoai9FN4V/HXImuUzupVT/YfpxtQirfitKmPUPhs
	pEhPc6xQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcpP-00000004rvn-1JXv;
	Wed, 20 Nov 2024 05:00:36 +0000
Message-ID: <4c13b4dc-da2c-4548-910a-cf4138d8422a@infradead.org>
Date: Tue, 19 Nov 2024 21:00:28 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Radu Sabau <radu.sabau@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/19/24 7:58 PM, Cedric Encarnacion wrote:
>     ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>     ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>     LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
> 
> The LTP8800 is a family of step-down μModule regulators that provides
> microprocessor core voltage from 54V power distribution architecture.
> LTP8800 features telemetry monitoring of input/output voltage, input
> current, output power, and temperature over PMBus.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>  Documentation/hwmon/adp1050.rst | 63 +++++++++++++++++++++++++++--
>  drivers/hwmon/pmbus/Kconfig     |  9 +++++
>  drivers/hwmon/pmbus/adp1050.c   | 72 +++++++++++++++++++++++++++++++--
>  3 files changed, 137 insertions(+), 7 deletions(-)
> 

> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f6d352841953..5d03a307824e 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -67,6 +67,15 @@ config SENSORS_ADP1050
>  	  This driver can also be built as a module. If so, the module will
>  	  be called adp1050.
>  
> +config SENSORS_ADP1050_REGULATOR
> +	bool "Regulator support for ADP1050 and compatibles"
> +	depends on SENSORS_ADP1050 && REGULATOR
> +	help
> +	  If you say yes here you get regulator support for Analog Devices
> +	  LTP8800-1A, LTP8800-4A, and LTP8800-2. LTP8800 is a family of DC/DC
> +	  µModule regulators that can provide microprocessor power from 54V
> +	  power distribution architecture.
> +
>  config SENSORS_BEL_PFE
>  	tristate "Bel PFE Compatible Power Supplies"
>  	help

FYI:

The 'micro' symbol displays as a blank space in 'menuconfig' or 'nconfig'.
(It shows up correctly in gconfig and xconfig.)

This problem is not unique to this driver entry.
See https://lore.kernel.org/all/20231006202942.GA865945@bhelgaas/ from 2023.

AFAIK no one is working on this issue.
Feel free to change the help text or leave it...

-- 
~Randy


