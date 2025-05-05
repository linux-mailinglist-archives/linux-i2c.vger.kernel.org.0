Return-Path: <linux-i2c+bounces-10786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C721FAA9E5F
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72291A802A4
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F541259493;
	Mon,  5 May 2025 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9klhOfj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEF1C6FF5;
	Mon,  5 May 2025 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481719; cv=none; b=XSv850sVd1wKiZ7NXQZE/W6Pkq+Wy1Z/eLeW0tTyiokN0lg+dVSEkSuvZmwlFvsGoJ28I1KjIgh5cKVwozPmHqfrMNcBKL0Y4k5o2Iyyv8HFA6ISPArsUGwWrwQnbarlXGv/7sp93/QgkD1pxIDabBXNCOScG0XmjNY2E8egvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481719; c=relaxed/simple;
	bh=SROOiakuclIYPxvkMWA0nKr4EXNUpsU6f6JjzTlZu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO2CJDU5Q0mkkBY5jx/Aoso/Bh0PmOWv8u2f9XqFdBEqhw59yqhBJhRyQ1pUB5wEf/etWGPAmnr4NW/SK6dn6CjxsYuivJhf1BD9OsXW1N45sGbY6Ckhj4cp9f/py8po67DUNU2QZX7Ci2lVM1WZv+9BhrTCtipLvx6jN9U0wlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9klhOfj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552D6C4CEE4;
	Mon,  5 May 2025 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746481718;
	bh=SROOiakuclIYPxvkMWA0nKr4EXNUpsU6f6JjzTlZu2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9klhOfj09VJhXC+4pfeLg05amT1S0SHkgEC+Kc07HmQ5o3Hxayyk7A3p3ASiDMle
	 HP/pPnxebSd8/VsrJqo1Z9RcOsidG9PYEWsgpMkdQ9F5d8L91DrZ6J/mWBkXq03wg1
	 7rLDmAkeLNyi87BCqyMoLKRq+LlY9f726zw7G1l1XwUoFA51D3O9aE0nQHrIlMQ/rZ
	 7onQDqs0vV1X4m9vpxEaVjNtb1R9DB3djCQo3x1w7aeNrdR54eGM8sVjeLxPSlGyAG
	 XTn5+fXhsOhNm7rmb25C/BAhgMNA51c8MrASKuOmPICHSmi73NULAGT6bX8Hdt8uV3
	 btkRaQFj2D2zA==
Date: Mon, 5 May 2025 23:48:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: EnDe Tan <ende.tan@starfivetech.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "jsd@semihalf.com" <jsd@semihalf.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"endeneer@gmail.com" <endeneer@gmail.com>
Subject: Re: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
Message-ID: <2l2tpeictfp3o2kcq5fquqkm3nyjijq65ejanafrshh7icc5c4@guynosug2ve7>
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
 <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
 <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
 <6a3b756f-6fbd-4ee5-b511-c5a32e4a6a34@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3b756f-6fbd-4ee5-b511-c5a32e4a6a34@linux.intel.com>

Hi EnDe,

On Fri, May 02, 2025 at 02:03:25PM +0300, Jarkko Nikula wrote:
> On 4/20/25 6:31 AM, EnDe Tan wrote:
> > It appears that when performing a rapid sequence of `delete_device -> new_device -> delete_device -> new_device`, the `dw_i2c_plat_runtime_suspend` is not invoked for the second `delete_device`.
> > 
> > This seems to happen because when `i2c_dw_unreg_slave` is about to trigger suspend during the second `delete_device`, the second `new_device` operation cancels the suspend. As a result, `dw_i2c_plat_runtime_resume` is not called (since there was no suspend), which means `i_dev->init` (i.e., `i2c_dw_init_slave`) is skipped.
> > 
> > Because `i2c_dw_init_slave` is skipped, `i2c_dw_configure_fifo_slave` is not invoked, which leaves `DW_IC_INTR_MASK` unconfigured.
> > If we inspect the interrupt mask register using devmem, it will show as zero.
> > 
> > Here's an example shell script to reproduce the issue:
> > ```
> > #!/bin/sh
> > 
> > SLAVE_LADDR=0x1010
> > SLAVE_BUS=13
> > NEW_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
> > DELETE_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device
> > 
> > # Create initial device
> > echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> > sleep 2
> > 
> > # Rapid sequence of delete_device -> new_device -> delete_device -> new_device
> > echo $SLAVE_LADDR > $DELETE_DEVICE
> > echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> > echo $SLAVE_LADDR > $DELETE_DEVICE
> > echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> > 
> > # If we use devmem to inspect IC_INTR_MASK, it will show as zero
> > ```

Please, don't remove the interesting parts of the original email
from your reply, otherwise it wouldn't be easy to follow the
discussion. Please refer to the email netiquette[*].

> Good explanation and could you add it the commit log together with the
> example?

If you want you can paste the new commit log as reply to this
e-mail.

Thanks,
Andi

[*] https://www.ietf.org/rfc/rfc1855.txt

