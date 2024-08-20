Return-Path: <linux-i2c+bounces-5572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884E958120
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3A901F23BFD
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 08:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38F518A6CA;
	Tue, 20 Aug 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c5HQjpd+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7818E342;
	Tue, 20 Aug 2024 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143194; cv=none; b=SpJQbVFfhCzWZZPG4p7qakCxdI5+YowRUJE1cXqtF6hjdlog22+iY4q4kOzlg8fuxxDq1k/HP+ex/jPCxF/lEjEBk/T8fZk7ne96EeteKrHc1jUFdnDRBKzHxgZCbiHrAyY1GPP16lPrnG/ihqMBzXzgY1Ks/U+nmui8yW2Nx/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143194; c=relaxed/simple;
	bh=Y67lKScO+XHSKkPWwEJi0w1LvhlMtu8n19Sm6FXBPfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCVhC9FrTDUFuWa5mKM2ff0LHg6uGkTr62c40zx8tfSwTUB3x2wEP2zN00MOdi8WTjC4lFKz5YhTmO9RMAjPlLhM4z+zkVEcVi6KT4hRqTLtsgYpYMwu4y0ssQne0YqYQ+osde69LNQ3t6bcsB6xstI4K97tgS7zGNF4t3XD32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c5HQjpd+; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30B65240002;
	Tue, 20 Aug 2024 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724143183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjbZOxwR9PVGgaPf4uUaZd0JrjKtSGINO0OZPhHVGyE=;
	b=c5HQjpd+Or9Pj+ejVrX1nGX4PvgGzQJftCNT2NtxvISrNrqvjgYe2dOBghNRWvDSJqIxZf
	wCVNrnJZ2LeXP5uE9pswbO2yYpZMffoMrmuFoJ5V24+8DitD4lVy5/WE3TqQ3LVQl5npu4
	mjn02iEzlkBSMj4TZy/Vk5RbEwFewbSlZ0LAVW2iKrqDDgEGsw1U++4G+Xf/fdwOtHRMHu
	/1ck3f1fMrbVe1L33TqrUXttiGDqCnTX6JuC7eI2As+OtWdqpAtx7WEPMsfawOcybtjaeJ
	WrpzC2hU3IOztDocVmDxBmPys0xLN710+YRTbYIpPWLbDrgOZ5xk1N9vbslUXA==
Message-ID: <8d8b1967-1d41-44d9-9791-d7809bed269c@bootlin.com>
Date: Tue, 20 Aug 2024 10:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for Congatec CGEB BIOS interface
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, s.hauer@pengutronix.de,
 christian.gmeiner@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240814184731.1310988-1-mstrodl@csh.rit.edu>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240814184731.1310988-1-mstrodl@csh.rit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 8/14/24 20:47, Mary Strodl wrote:
> The following series adds support for the Congatec CGEB interface
> found on some Congatec x86 boards. The CGEB interface is a BIOS
> interface which provides access to onboard peripherals like I2C
> busses and watchdogs. It works by mapping BIOS code and searching
> for magic values which specify the entry points to the CGEB call.
> The CGEB call is an API provided by the BIOS which provides access
> to the functions in an ioctl like fashion.
> 
> At the request of some folks the first time I sent this series out,
> CGEB has a userspace component which runs the x86 blob (rather than
> running it directly in the kernel), which sends requests back and
> forth using the cn_netlink API.
> 
> You can find a reference implementation of the userspace helper here:
> https://github.com/Mstrodl/cgeb-helper
> 
> I didn't get an answer when I asked where the userspace component
> should live, so I didn't put a ton of work into getting the helper
> up to snuff since similar userspace helpers (like v86d) are not
> in-tree. If folks would like the helper in-tree, that's fine too.

Hello Mary !!

It was by pure luck that I found your series.

It seems we are working on the same thing, the Congatec Board Controller.

I sent a first version of my series few weeks ago [1].
My implementation is very different.
There is an MFD which maps the needed IO regions and declares cells
(gpio, watchdog, i2c). It also contains all the code to communicate with
the Board Controller (using ioread and iowrite).
The DMI table is used to detect if the board is supported, so the driver
can be probed (or not).
Other drivers (gpio, i2c and watchdog for now) use the API provided by
the MFD to communicate with the Board Controller.
With this approach, I don't need a userspace component.

For this work I used the Congatec driver (that Thomas Gleixner pointed
you) as reference. But as mentioned by Thomas the driver is not well
written at all.
By the way their latest version is available in their yocto metalayer
(please find the link in my series).

For now I did the job for the conga-SA7 board (which has a 5th
generation Board Controller).
So if you have hardware which has the same generation of the Board
Controller, you can easily test the series. You only need to add the DMI
entry of your board in the MFD driver.

For other generations, I had a quick look. The sequences seem very
similar, with minor differences. It could be easily implemented in the
future, and only the MFD will be modified.

Please feel free to test/comment my series [1].

[1]
https://lore.kernel.org/all/20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com/

Best Regards,

Thomas

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


