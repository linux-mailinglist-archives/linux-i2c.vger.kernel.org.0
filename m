Return-Path: <linux-i2c+bounces-938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5C81C248
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 01:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1ABB1C2323C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 00:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC08BA41;
	Fri, 22 Dec 2023 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVYpMSbh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C9818;
	Fri, 22 Dec 2023 00:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2CAC433C8;
	Fri, 22 Dec 2023 00:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703204749;
	bh=YGIUwq5l/QgyebCqiGhCanW/36JLd2RytD7jeuRYRgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVYpMSbhzhSpCp4AsHkduQEbhqHno3ZUWmfeHfSyr8d2F0tTsXGt7H6lkRaTsXKER
	 l7PhltGJ4ZiG3fSW5RnA3ihOhkcblsVAAKS5S/K3XYSgYmHceTsDfjktETYLM+BMBU
	 MGa9x4rOTmpsb6EY2VyMXVcuy2EJs9HNQrF5rOJnfJ2BHP11P5kiNlu2hTHuGDUbI2
	 VgpVw/jdzZLVmXv5UwvZa/TUYzP9Uk1O2WJFevcRvA8x9GaKEHS8JZJJ3xosfOufUc
	 7XI7ajUvIYk9C8VnJf/wbglHK6wnFuRkvel8fmldzGQsWEtsV9Nke0A6B5xM9dFv4e
	 6mXvEs8ImIHFA==
Date: Fri, 22 Dec 2023 01:25:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i801: Add 0x29 as =?utf-8?B?ScKy?=
 =?utf-8?Q?C?= address for lis3lv02d in Dell Precision 3540
Message-ID: <20231222002546.j32rqtjsw4riqibj@zenone.zhora.eu>
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220161003.68310-1-pmenzel@molgen.mpg.de>

Hi Paul,

On Wed, Dec 20, 2023 at 05:10:01PM +0100, Paul Menzel wrote:
> On the Dell Precision 3540/0M14W7, BIOS 1.7.4 05/12/2020, Linux prints
> the warning below.
> 
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
> 
> With the help of Wolfram Sang, the test to probe it on I²C bus 6 at address

please, next time /I²C/I2C/

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

