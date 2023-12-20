Return-Path: <linux-i2c+bounces-916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4D81A4E5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 17:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBDA3B281B6
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 16:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D29C47794;
	Wed, 20 Dec 2023 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3/ErV9T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EA40BF5;
	Wed, 20 Dec 2023 16:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B256C433C8;
	Wed, 20 Dec 2023 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703089329;
	bh=cjrdPMNNIzhaLFPRBLRQV3hP1gjDcvza35vAIrrWecQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3/ErV9TwEfshoXEnqbo/1pdyEqpHLPNtiIpCHj65LF8TR2/S9H5GYEgaeJAzl8xR
	 LCi54X+fDcCJGrb6cOtppWDaOPYX6zn1Age1iYRFWUH7KfJ7FxgYZLNDgcNSSLWjBJ
	 AMgO5RbjA/BJw0lWJzHzrQMsGQUxIFlY7xrVIVxPvbRUkA8AzPS+2ii0d7kbj/G/fm
	 +GVhhOde0fCP9obVuRxQkO+vc9I1zPJxA9C8LbZW8/os9RB9x6UnxM9xCQ45011GoL
	 XI4KfiqzfYWBJ44eNcsnTzunEO0wvObM2lRGWNFxiS2odhmBhstbnWSxYgwGI9byEK
	 QXVJUq4w+jzuw==
Received: by pali.im (Postfix)
	id BF7C47E1; Wed, 20 Dec 2023 17:22:06 +0100 (CET)
Date: Wed, 20 Dec 2023 17:22:06 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Add 0x29 as =?utf-8?B?ScKy?=
 =?utf-8?Q?C?= address for lis3lv02d in Dell XPS 15 7590
Message-ID: <20231220162206.h6rlpvusgnoe7exq@pali>
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
 <20231220161003.68310-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220161003.68310-2-pmenzel@molgen.mpg.de>
User-Agent: NeoMutt/20180716

On Wednesday 20 December 2023 17:10:02 Paul Menzel wrote:
> On the Dell XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023, Linux prints the
> warning below.
> 
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
> 
> Following the same suggestions by Wolfram Sang as for the Dell Precision
> 3540 [1], the accelerometer can be successfully found on I²C bus 2 at
> address 0x29.
> 
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-2/new_device
>     lis3lv02d 0x29
>     $ dmesg | tail -5
>     [  549.522876] lis3lv02d_i2c 2-0029: supply Vdd not found, using dummy regulator
>     [  549.522904] lis3lv02d_i2c 2-0029: supply Vdd_IO not found, using dummy regulator
>     [  549.542486] lis3lv02d: 8 bits 3DC sensor found
>     [  549.630022] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input35
>     [  549.630586] i2c i2c-2: new_device: Instantiated device lis3lv02d at 0x29
> 
> So, the device has that accelerometer. Add the I²C address to the
> mapping list, and test it successfully on the device.
> 
> [1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/
> 
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

If the accelerometer is working fine then I have no objections.

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index cb9660f84117..3932e8d96a17 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1233,6 +1233,7 @@ static const struct {
>  	{ "Precision 3540",     0x29 },
>  	{ "Vostro V131",        0x1d },
>  	{ "Vostro 5568",        0x29 },
> +	{ "XPS 15 7590",        0x29 },
>  };
>  
>  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> -- 
> 2.43.0
> 

