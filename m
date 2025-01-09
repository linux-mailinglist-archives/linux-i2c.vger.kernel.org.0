Return-Path: <linux-i2c+bounces-9012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDEDA07C6D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 16:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F37188AF9F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A81421D5A3;
	Thu,  9 Jan 2025 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0tOpW51"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645021D018;
	Thu,  9 Jan 2025 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437890; cv=none; b=nltqB91I49CfgXZehWVPOzEDw9ICbsEKGdRdbJZuPIHn+ohfVj96+u/cLEd5pk3zblHHJPssxjpCcUJ8Y/4i+sdJh5i4m1nCSfz0ej414S3DjkuCs3BkfJfz4fE+/2Ed56dQs8gzx1b5ehJ/bRG2cEnb58cqE1XRxUX1OfidJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437890; c=relaxed/simple;
	bh=eS9DcNn4lIepBXG5TETO9c8mhATbLJjUZY4YR4VqFRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9q4Pb/8sP8eVIMkldZ54lFhjv6z2/ibfGH7ZhmkfONDxrXYE5rTDMoatNKcSD6XonT6ONLs35VXNtZsAW2nRabQqUHBt0ilH5FJH0TqQIIC5tKIUA4OL+9afYGVbder2rf2Z84G9BZhO1Q6qpwT8iuf0mQii+QfUEmkHKgJ3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0tOpW51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B47FC4CED2;
	Thu,  9 Jan 2025 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736437889;
	bh=eS9DcNn4lIepBXG5TETO9c8mhATbLJjUZY4YR4VqFRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0tOpW51ykQa/7ywNPVTPz6SU8N5tNwc8PPchi/sIuIZh3eIB2IfZb0ZPBN3cxdrI
	 O1U5bOLnweVDeF4DN9i2pAsXO31geDw0fK2iDmnaRur5Kwc01i8I0mrIJSO37Inyye
	 gR266ZvOnLuCJyFuYNsmjS2bjeWT0O7Lbgj9bJ4e4Be4GytKL/ZwCeGdt9gwmCfAzA
	 B6bcteq1nfhjiEInZIxhon9DvvmqTQ2iMV5CXiRbbOtjjCxA86U0gIh0+5qr+oNHxT
	 jJqoZEzKOI/fu1lPhsBmhVU8JQ2j8U86Ef9v5HRy+fwEeyI54bCamc4MpVh2FiQsP/
	 rX/7sYsujlI6w==
Date: Thu, 9 Jan 2025 16:51:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Patrick =?utf-8?B?SMO2aG4=?= <hoehnp@gmx.de>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: i801: Add lis3lv02d for Dell Precision M6800
Message-ID: <mds2lqdejuqgmhnt6mr3auhjjhgr2shym6byi3rl7psaxpn24x@cvvs7t2tethb>
References: <20240312193132.26518-1-hoehnp@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312193132.26518-1-hoehnp@gmx.de>

Hi Patrick,

On Tue, Mar 12, 2024 at 08:31:31PM +0100, Patrick Höhn wrote:
> On the Dell Precision M6800/OXD1M5, BIOS A26 06/13/2029, Linux prints the
> warning below.
> 
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
> 
> Following the same suggestions by Wolfram Sang as for the Dell Precision
> 3540 [1], the accelerometer can be successfully found on I2C bus 0 at
> address 0x29.
> 
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-0/new_device
>     lis3lv02d 0x29
>     $ dmesg | tail -5
>     [1185.385204] lis3lv02d_i2c 0-0029: supply Vdd not found, using dummy regulator
>     [1185.385235] lis3lv02d_i2c 0-0029: supply Vdd_IO not found, using dummy regulator
>     [1185.399689] lis3lv02d: 8 bits 3DC sensor found
>     [1185.449391] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input371
>     [1185.449577] i2c i2c-0: new_device: Instantiated device lis3lv02d at 0x29
> 
> So, the device has that accelerometer. Add the I2C address to the
> mapping list, and test it successfully on the device.
> 
> [1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/
> Signed-off-by: Patrick Höhn <hoehnp@gmx.de>

I'm really sorry, this patch was completely out of my radar. I
now merged it to i2c/i2c-host.

Thanks for your patience.
Andi

