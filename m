Return-Path: <linux-i2c+bounces-915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE281A4E1
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 17:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6CBC289CFA
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 16:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C44741C96;
	Wed, 20 Dec 2023 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAIaChAc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C83F8E1;
	Wed, 20 Dec 2023 16:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250A6C433C8;
	Wed, 20 Dec 2023 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703089285;
	bh=1kQMmHkd1Er03MtdXnS45qhF/JNgU19Bb0Ki9TnP0F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAIaChAcojsA67I7y9UJxw8gI5noRw8mh8p2/t3B5WuNJHbIlYIVA5isXs+0Ad+W2
	 vBDLtQHRNJhMIxnDPQmlrEo5wwIp8Rb+5noC3QOKGWMcx11trDY7cW1NaQUDv7NQ7r
	 CtpifB1P0Q4oPH4uCwSDUKlhWUrzGabRS6/WR8oQMgCIX4YtyF2lht+gINaLLxfDmm
	 MBrtZejJ4X3pw5RqQu4fp7z97uQYZNH9reniS8m8LZeTcB+99liVRq25HcG/DRKPOT
	 v5kwdJaBW4ijruZEe2lgSJ06jBYgYlClZmxhv0m2FCoHHNu3K1lL2uw6hVIdgsL34F
	 t9TA7/31uOe0g==
Received: by pali.im (Postfix)
	id 3D8047E1; Wed, 20 Dec 2023 17:21:22 +0100 (CET)
Date: Wed, 20 Dec 2023 17:21:22 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i801: Add 0x29 as =?utf-8?B?ScKy?=
 =?utf-8?Q?C?= address for lis3lv02d in Dell Precision 3540
Message-ID: <20231220162122.y57rudx6qhxc6eku@pali>
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
User-Agent: NeoMutt/20180716

On Wednesday 20 December 2023 17:10:01 Paul Menzel wrote:
> On the Dell Precision 3540/0M14W7, BIOS 1.7.4 05/12/2020, Linux prints
> the warning below.
> 
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
> 
> With the help of Wolfram Sang, the test to probe it on I²C bus 6 at address
> 0x29 was successful.
> 
>     $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
>     $ ls -d i2c-?
>     i2c-6
>     $ sudo i2cdetect 6
>     WARNING! This program can confuse your I2C bus, cause data loss and worse!
>     I will probe file /dev/i2c-6.
>     I will probe address range 0x08-0x77.
>     Continue? [Y/n] Y
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         08 -- -- -- -- -- -- --
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
>     30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
>     40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
>     50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     70: -- -- -- -- -- -- -- --
> 
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-6/new_device
>     $ sudo dmesg
>     […]
>     [ 2110.787000] i2c i2c-6: new_device: Instantiated device lis3lv02d at 0x29
>     [ 2110.791932] lis3lv02d_i2c 6-0029: supply Vdd not found, using dummy regulator
>     [ 2110.791981] lis3lv02d_i2c 6-0029: supply Vdd_IO not found, using dummy regulator
>     [ 2110.809233] lis3lv02d: 8 bits 3DC sensor found
>     [ 2110.900668] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input23
> 
> So, the device has that accelerometer. Add the I2C address to the
> mapping list.
> 
> Link: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

If the accelerometer is working fine then I have no objections.

Acked-by: Pali Rohár <pali@kernel.org>

Anyway, if you have a time then try to look into decompiled ACPI DSDT
table if Dell had not put somewhere this SMBus/I²C address of the
accelerometer. I remember that for older Latitude E6440 I looked into
every DSDT method related with accelerometer if there is not some
information but I have not find anything and also Dell confirmed that
this address information is not there present. I'm still hoping that
Dell put autodiscovery address for new machines somewhere...

And if you are more curious you can start investigation what are other
devices which i2cdetect showed (only those with UU are bound to some
kernel/userspace driver).

> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 070999139c6d..cb9660f84117 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1230,6 +1230,7 @@ static const struct {
>  	 * Additional individual entries were added after verification.
>  	 */
>  	{ "Latitude 5480",      0x29 },
> +	{ "Precision 3540",     0x29 },
>  	{ "Vostro V131",        0x1d },
>  	{ "Vostro 5568",        0x29 },
>  };
> -- 
> 2.43.0
> 

