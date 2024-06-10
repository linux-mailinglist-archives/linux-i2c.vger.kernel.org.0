Return-Path: <linux-i2c+bounces-3954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5A9025A1
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 17:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE3471F22DFA
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 15:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536AB1420DD;
	Mon, 10 Jun 2024 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KymDzr1k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951214D8A0;
	Mon, 10 Jun 2024 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718033267; cv=none; b=na3zEOXrEypGlzvnqTRzBwu6PDBOkEroxpOy2N4YwJMsPeMgXUc1q8uUUrLmyZLu4NxoyONgVdfOONif+a918HmLPm+KPAkWjHH1ciiT+fdPCRTefe9L1ZqjDBOQ1uw7lDXX+WmKfCFZDkMw9zO37zYxaypXYC82179vMojIL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718033267; c=relaxed/simple;
	bh=UtTPpDqVMWYeL4JSg0XAjH/IxWdPTSAlXcPH9xMs0EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmPFRVp0gdFayCAtAx8VteWW0VZ1NFtmJCOS0aulYL7hHou83UQdfCiP7tgmXHgY2KV8s/MFRdDoFKCelovbNmm1r7ipthm8TCEDISmfUUcTetS5r4v7z1L3BtRNQDu/krxQcbVwHaXZIL2AIe2HCQNTMOvvALZ8MOJWHznhMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KymDzr1k; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718033254;
	bh=UtTPpDqVMWYeL4JSg0XAjH/IxWdPTSAlXcPH9xMs0EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KymDzr1kSmWo/H+8aO5XZeAo8+ApERRUiyZMWfleW903o1iQJDAU8QYAvcxn2sJSq
	 HsEj94P96CqJBTSkOkEufCSkw6M4AQ0gzEey4ZfvKVNn0kYshetb6CTxN8x6Qoi12V
	 J9yJQQurMqVAm9+Fl1rHJkZZQsE5gkeS5HHbhznI=
Date: Mon, 10 Jun 2024 17:27:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>, Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v5 0/6] hwmon: Add support for SPD5118 compliant chips
Message-ID: <12f2b0e5-5130-4e07-be1f-38402f677f0c@t-8ch.de>
References: <20240610144103.1970359-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610144103.1970359-1-linux@roeck-us.net>

On 2024-06-10 07:40:57+0000, Guenter Roeck wrote:
> Add support for SPD5118 (Jedec JESD300) compliant chips supporting
> a temperature sensor and SPD NVRAM. Such devices are typically found on
> DDR5 memory modules.

<snip>

> ----------------------------------------------------------------
> Guenter Roeck (6):
>       dt-bindings: trivial-devices: Add jedec,spd5118
>       hwmon: Add support for SPD5118 compliant temperature sensors
>       hwmon: (spd5118) Add suspend/resume support
>       hwmon: (spd5118) Add support for reading SPD data
>       i2c: smbus: Support DDR5 and LPDDR5 SPD EEPROMs
>       hwmon: (spd5118) Add configuration option for auto-detection
> 
>  .../devicetree/bindings/trivial-devices.yaml       |   2 +
>  Documentation/hwmon/index.rst                      |   1 +
>  Documentation/hwmon/spd5118.rst                    |  63 ++
>  drivers/hwmon/Kconfig                              |  31 +
>  drivers/hwmon/Makefile                             |   1 +
>  drivers/hwmon/spd5118.c                            | 658 +++++++++++++++++++++
>  drivers/i2c/i2c-smbus.c                            |   6 +-
>  7 files changed, 761 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/hwmon/spd5118.rst
>  create mode 100644 drivers/hwmon/spd5118.c

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

