Return-Path: <linux-i2c+bounces-939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8E81C24F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 01:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1981F213B3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 00:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCE3396;
	Fri, 22 Dec 2023 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hi4Mu4cZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0438B;
	Fri, 22 Dec 2023 00:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1F9C433C8;
	Fri, 22 Dec 2023 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703204907;
	bh=SqKDW5o4SkZ1lpgESCyFwZdgpuX2II7+pO/GgJAr1ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hi4Mu4cZF1U8ScsKkTJo11CBOrljdjdk0crjTwNk8cZeuX92OfovmKMxzHELCLiYN
	 6QCpQegBdyFh4rlIq3VnSUIhZ68GsZZGZOLFxsVogH0WF1yaXABXSyJG4Ubata4ehV
	 Kw/cKfQQBXPuJnWp01c9So1KoOc+ga/5oZeJfB0//FHSUNB017inOIWy5BJ9WWSTdT
	 zniEPG78ILDfKYMbFgImctOu2rFkYCtZ6EtpIx2C6ve5SNtCVujGD2rDewqaAuTQBR
	 kZ8OJpfWGSmRC7wZ6pgOHFug3FvAhkdQv11YXU3tDORtXuyoukn0BppFreL1xIkr08
	 QMD/LnPHKQkLQ==
Date: Fri, 22 Dec 2023 01:28:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Add 0x29 as =?utf-8?B?ScKy?=
 =?utf-8?Q?C?= address for lis3lv02d in Dell XPS 15 7590
Message-ID: <20231222002824.ka2ahpeov5qwi7sr@zenone.zhora.eu>
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
 <20231220161003.68310-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220161003.68310-2-pmenzel@molgen.mpg.de>

Hi Paul,

On Wed, Dec 20, 2023 at 05:10:02PM +0100, Paul Menzel wrote:
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

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

