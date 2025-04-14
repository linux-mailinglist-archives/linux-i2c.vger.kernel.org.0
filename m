Return-Path: <linux-i2c+bounces-10320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C1A87B27
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6463A989F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 08:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A7B25A631;
	Mon, 14 Apr 2025 08:58:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C27829D19;
	Mon, 14 Apr 2025 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621109; cv=none; b=P2rX0I6EnLl+XI+H0vnoBUlnHsQXQMaGtc/2gu1OSm9ICMFDSnRCpxmCmBGCU9SU1pQMIWlxrvjZaxyytsSeS3/lHNkGZ82RnNLoNnomUmMyQb8gvQwXdDGntv9iJ5btbkHo2Mj0QvNhPKVDr38dxydzqWRB4n+aPrZ9PPCYSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621109; c=relaxed/simple;
	bh=grRsD4AqWQZwWRE302flYIYsAr6VbhlpxUCLGMKdQgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4WPYX/FA2j+GUyJ7+ZW0he04bffAN5inOxdGDLE/1ODIwZPF4Li4lS2zE2DrN+k0y+MxQjCDJCzrfXq1sGZeaXPX7U1L1P4vsjRxS4vq2Gwpm8qn7DVQeC7iCc0L7H5CslvbXwYIRHyFVJ1E+FyEXFFCW2Pu8ipTOraWQIc4qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2019D1007;
	Mon, 14 Apr 2025 01:58:24 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 442FD3F66E;
	Mon, 14 Apr 2025 01:58:24 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:58:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] i2c: xgene-slimpro: Simplify PCC shared memory region
 handling
Message-ID: <20250414-visionary-magnetic-ferret-ea0def@sudeepholla>
References: <20250411112303.1149086-1-sudeep.holla@arm.com>
 <gzrqpn7a5g5bqvlc6ryw64iux3w5v3a4iqxu2i4qkivn7l2nf7@4drkvcwi6pyw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gzrqpn7a5g5bqvlc6ryw64iux3w5v3a4iqxu2i4qkivn7l2nf7@4drkvcwi6pyw>

On Mon, Apr 14, 2025 at 12:30:38AM +0200, Andi Shyti wrote:
> Hi Sudeep,
> 
> On Fri, Apr 11, 2025 at 12:23:03PM +0100, Sudeep Holla wrote:
> > The PCC driver now handles mapping and unmapping of shared memory
> > areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> > this xgene-slimpro I2C driver did handling of those mappings like several
> > other PCC mailbox client drivers.
> > 
> > There were redundant operations, leading to unnecessary code. Maintaining
> > the consistency across these driver was harder due to scattered handling
> > of shmem.
> > 
> > Just use the mapped shmem and remove all redundant operations from this
> > driver.
> > 
> > Cc: Andi Shyti <andi.shyti@kernel.org>
> > Cc: linux-i2c@vger.kernel.org
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> I thought this patch was going to take other paths. Anyway, I
> merged it to i2c/i2c-host.
> 

Thanks, I too had assumed so, but the mailbox maintainer applied only PCC
mailbox changes only without any response in the thread. Sorry for that.

-- 
Regards,
Sudeep

