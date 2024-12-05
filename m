Return-Path: <linux-i2c+bounces-8354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC959E5F24
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 20:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2150616C713
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 19:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E70B22D4F2;
	Thu,  5 Dec 2024 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="RVUI6abm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CB419ABC6;
	Thu,  5 Dec 2024 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733428225; cv=none; b=R4FbGDm5PhLihNG9vycO7OpjQmVtScdJsjZp3clOo5ckkes8vjiwJJd1w/9lsGDEazWdpSyENb+Yd18L5C+qvd+LgU0zNNH52oM/ixJJyFC7caL2UAN69HKQjmULIz2t7naYlWezQMo3TI31QMbmlH4yV4JTA8gxt/A4ADw8s+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733428225; c=relaxed/simple;
	bh=YbwFw+E4aKyUl5eKWEN/nZ+GKgdxjpTjfO7xGnRiWeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2v/yhxyBxdzEhscCedxRVDRnhFigKn+L68FI86j7l+L7zFa6UxviXUOGK2aEPHLOhdo1iXoGPvWXbMfVp6xTOOvSfu7KDz3Xu3P6zfJZYUPV4KTtzdcbCGauK3ND7tqSMfVt6lB8ay5UDzASXXM54rzcFS6C83N/acxz8T8+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=RVUI6abm; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1733428216; bh=YbwFw+E4aKyUl5eKWEN/nZ+GKgdxjpTjfO7xGnRiWeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RVUI6abmPvpgaoy/W3tb0CwqY54O4+5aY/ttRx+nHWmCvj2EUZ/bPdLahbEroCFI3
	 /FrPcuH4qT5lj4kxdAqf5AGFoCwtPvoHWc8JrRHQsBfeiKE50GZ6dMsml4U70E0cKt
	 xAVJpVOc0483J39EuHkD/Q5Ebb6mDnxMT3r+kvgqy641ojYDccta4TqzK+H463raHs
	 NLEdIK+xXoh+VW2CO/vDszgegLcVXjx2LvX7qj74A2D6d7lTmri6bAbCPQZdAWr0CB
	 D6Y+yJjDWHLTKWxw3qWihyAsosZ2ZQAhxkLvjp4hPbQym5j/hxFC3WR+FlyvE8lz4U
	 EwZfQ2H/ZwC1CE/gcY0onWVlvLcEOQBWDB7P+MN1/f5faRMJtV4jiI/ajhh/wAcL+C
	 IO42a9OZjWHzbNPNZmFg7kODV1d288Sq1kUBY02oc2RRrI8gsqre41u3+Q3sQ+Tp/L
	 p/1rWrGTKrEq9yPWYGN8rlQKj3GColHN2s3Kbq+ojrsi7kvgmz36MP3ztsOsxZKkoV
	 ymWWHStb6uMMI9CCzzA+o4ndZhjbykcgU9GQ7Z5qtfNbFPGJAqv8IUKWlTRQhnf06x
	 wYW09FUbm+xOzIxSslFcPuml/rJDcKs4Kl8gXAMId/G328Z2A/RQSe4N653nXxSogD
	 o5S5dOysCbCmGCbmtnZrz8HI=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 3832018BC4C;
	Thu,  5 Dec 2024 20:50:16 +0100 (CET)
Message-ID: <72486280-1852-41a2-ae17-2288d7fedd54@ijzerbout.nl>
Date: Thu, 5 Dec 2024 20:50:14 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hwmon: (pmbus/tps25990): add initial support
To: Jerome Brunet <jbrunet@baylibre.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Vaishnav Achath <vaishnav.a@ti.com>
References: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
 <20241202-tps25990-v4-3-bb50a99e0a03@baylibre.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241202-tps25990-v4-3-bb50a99e0a03@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 02-12-2024 om 11:28 schreef Jerome Brunet:
> Add initial support for the Texas Instruments TPS25990 eFuse.
> This adds the basic PMBUS telemetry support for the device.
>
> Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   Documentation/hwmon/index.rst    |   1 +
>   Documentation/hwmon/tps25990.rst | 148 +++++++++++++
>   MAINTAINERS                      |   2 +
>   drivers/hwmon/pmbus/Kconfig      |  17 ++
>   drivers/hwmon/pmbus/Makefile     |   1 +
>   drivers/hwmon/pmbus/tps25990.c   | 437 +++++++++++++++++++++++++++++++++++++++
>   6 files changed, 606 insertions(+)
>
> [...]
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a267014c88997fca5e83b2ec974a0d521808512
> [...]
> +	case PMBUS_VIRT_READ_IIN_MAX:
> +		return TPS25990_READ_IIN_PEAK;
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   TPS25990_READ_IIN_PEAK);
> +		break;
> [...]
Is the return intended? Or some left-over debug code?
-- 
Kees

