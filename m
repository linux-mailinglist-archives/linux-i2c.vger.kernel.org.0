Return-Path: <linux-i2c+bounces-10946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D4AB47E6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 01:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556D3461CA5
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 23:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDB326868C;
	Mon, 12 May 2025 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l19nNr6w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39323C4FF;
	Mon, 12 May 2025 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092575; cv=none; b=YujJimo9eZqCAXtX8kNCmM/oDS8J+we+XR1Zge/8x3RlaYuMO5IsTVOxWRttT4d2qDoZyeMRnBy93a9vqE7fsjOp0g+48ExwpzRUNHFwhw26+awXHRH4nW97QsSZKjR4bHIUdLlGtbLbZej4LCpGtEyO82q6fNtt0OvoFIQ9RsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092575; c=relaxed/simple;
	bh=ctNf1TQ6KR0VwdOFZNNeClTlyGYY5GQ2nAjG+j78JXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdDcFmNPK3/ufdAoqlBF06qoYIhEszmkiNz1yXNt2cYaka2IbAz2ykbueUpmPcYRxqgvOPCASOiy08n0aeo2a+vZCu5rZMYfXicwHCs99N/y2/9ufck/mGTo8Cr3/nO/6bBaleviH4Gn94kEL8xVLwNrHddzDPoi4xaPgQ51+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l19nNr6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707EDC4CEE7;
	Mon, 12 May 2025 23:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747092575;
	bh=ctNf1TQ6KR0VwdOFZNNeClTlyGYY5GQ2nAjG+j78JXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l19nNr6wQCZK5zgN7Bl46W65PNzxkf9fhuQdxCIaolEip2xrI8YtcuF4Gq9D5cpF+
	 O+QoGFl5kujv/HkQRAaiZ5PShJuAhFFtc0oSGD6M+DkthaFx06WHgSZ9twdSZUz7QL
	 I7iHnSp/k7QffNeO5Bopx6vZHZFrRk4AReLdhzhkCJNelOt/w1u9Xmuqnv7sBiNiQE
	 8r8IccrsKXDSqu6UIoG+D1VYqIdvS1eRCbTqrCMtJ3QmF2lreFxsrTt3ern/2gGYaR
	 1odXzcOF//BZBXac8pEHM9Ib0yH8HTiU81ldM1oaUeYeFbPli8nlmWEemvzBuE7MSW
	 oV6AbnfKjsQmA==
Date: Tue, 13 May 2025 01:29:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: EnDe Tan <ende.tan@starfivetech.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "jsd@semihalf.com" <jsd@semihalf.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"endeneer@gmail.com" <endeneer@gmail.com>
Subject: Re: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
Message-ID: <j3tuira2tzqhymeufcagfk7lqhbick4iax7riiamgwkl7kueeh@atehawq2y6gb>
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
 <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
 <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
 <6a3b756f-6fbd-4ee5-b511-c5a32e4a6a34@linux.intel.com>
 <2l2tpeictfp3o2kcq5fquqkm3nyjijq65ejanafrshh7icc5c4@guynosug2ve7>
 <NTZPR01MB1018FD0E9913437D4B34E751F88B2@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1018FD0E9913437D4B34E751F88B2@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>

Hi EnDe,

On Thu, May 08, 2025 at 08:30:27AM +0000, EnDe Tan wrote:
> Hi Andi and Jarkko, thank you for the feedback.
> 
> > -----Original Message-----
> > From: Andi Shyti <andi.shyti@kernel.org>
> > Sent: Tuesday, 6 May, 2025 5:49 AM
> > To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Cc: EnDe Tan <ende.tan@starfivetech.com>; linux-i2c@vger.kernel.org;
> ...
> > > Good explanation and could you add it the commit log together with the
> > > example?
> > 
> > If you want you can paste the new commit log as reply to this e-mail.
> 
> Here is the new commit log, feel free to let me know if further changes are required:
> 
> Replaced pm_runtime_put() with pm_runtime_put_sync_suspend() to ensure
> the runtime suspend is invoked immediately when unregistering a slave.
> This prevents a race condition where suspend was skipped when
> unregistering and registering slave in quick succession.
> 
> For example, consider the rapid sequence of
> `delete_device -> new_device -> delete_device -> new_device`.
> In this sequence, it is observed that the dw_i2c_plat_runtime_suspend() might
> not be invoked after `delete_device` operation.
> 
> This is because after `delete_device` operation, when the
> pm_runtime_put() is about to trigger suspend, the following `new_device`
> operation might race and cancel the suspend.
> 
> If that happens, during the `new_device` operation,
> dw_i2c_plat_runtime_resume() is skipped (since there was no suspend), which
> means `i_dev->init()`, i.e. i2c_dw_init_slave(), is skipped.
> Since i2c_dw_init_slave() is skipped, i2c_dw_configure_fifo_slave() is
> skipped too, which leaves `DW_IC_INTR_MASK` unconfigured. If we inspect
> the interrupt mask register using devmem, it will show as zero.
> 
> Example shell script to reproduce the issue:
> ```
>   #!/bin/sh
> 
>   SLAVE_LADDR=0x1010
>   SLAVE_BUS=13
>   NEW_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
>   DELETE_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device
> 
>   # Create initial device
>   echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
>   sleep 2
> 
>   # Rapid sequence of
>   # delete_device -> new_device -> delete_device -> new_device
>   echo $SLAVE_LADDR > $DELETE_DEVICE
>   echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
>   echo $SLAVE_LADDR > $DELETE_DEVICE
>   echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> 
>   # Using devmem to inspect IC_INTR_MASK will show as zero
> ```

Thanks, merged to i2c/i2c-host.

I just reworded the title to:

i2c: designware: Invoke runtime suspend on quick slave re-registration

to keep it under 75 characters.

Thanks,
Andi

