Return-Path: <linux-i2c+bounces-9832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A9A60EAF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 11:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0F887A7EEA
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 10:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8021F3BAE;
	Fri, 14 Mar 2025 10:23:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106511F2B8E;
	Fri, 14 Mar 2025 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947806; cv=none; b=s4DZq4NM2umYTQjzOtk3w01z4FOayo3wdFukKEDgZc+QR/k49nu3Hc4RLBa0kuHj6R3oky84AMmK8FDZFmgP565BUIfQrCQPsVPCpY21ZA79iDNh7DyaCJ+nqDk92OMcm+pv6fYjsSo+bvd3D/9Nx4igu1eSlH+C+XNruL7NtZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947806; c=relaxed/simple;
	bh=H1WLbvvABqhZ85STzFNzHZjU9iW9lsZLv+QsIKYgoFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6cAf9d520+uzGCuHJZOF1RpXLX/CjLOBZhR96bAneNv2QpWzRxu3IKNMAHB50HGkHUK2dhU2IevRtgDpAYW8zuWvWqORVE5Cx1cW9qXUXmi9Ha3eK9UdssA2xF+ZuYh/GvIDXeW5Ma+XqPDZ492oRw/09V6DmwZPUr1n5XOvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 330691424;
	Fri, 14 Mar 2025 03:23:34 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 859E63F5A1;
	Fri, 14 Mar 2025 03:23:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:23:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Huisong Li <lihuisong@huawei.com>,
	Adam Young <admiyo@os.amperecomputing.com>,
	Robbie King <robbiek@xsightlabs.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 10/13] i2c: xgene-slimpro: Simplify PCC shared memory
 region handling
Message-ID: <Z9QDl1afybO5RNKT@bogus>
References: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>
 <20250313-pcc_fixes_updates-v3-10-019a4aa74d0f@arm.com>
 <fp6swrbauspd6kbx6ppf7ym2clcdmem3krtvssvewjrc5oqgqw@bpkgoo5gfz3q>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fp6swrbauspd6kbx6ppf7ym2clcdmem3krtvssvewjrc5oqgqw@bpkgoo5gfz3q>

On Fri, Mar 14, 2025 at 01:48:30AM +0100, Andi Shyti wrote:
> Hi Sudeep,
> 
> On Thu, Mar 13, 2025 at 03:28:56PM +0000, Sudeep Holla wrote:
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
> > ---
> 
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> 

Thanks!

-- 
Regards,
Sudeep

