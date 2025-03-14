Return-Path: <linux-i2c+bounces-9831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAADFA606AF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 01:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A21816BA3C
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 00:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C8D846F;
	Fri, 14 Mar 2025 00:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSQa20vw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5876ADD;
	Fri, 14 Mar 2025 00:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913315; cv=none; b=BWAftsPJtOWa/Lajx2O0ByaywFtZm+IVN/TjU5QdfJcd8OBw2+27vn30VEAWRCncCSQ7mBMCaYKwRav97rMT76kbVZLB/4roWHVKWD5dDBNp2fQk5o8pL/8ksamGsOm5RdSsbsOG/SkSkBXAvWGk6w3RlCRkTL3Lkd9yfLoqXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913315; c=relaxed/simple;
	bh=MjhwuksWN5o8NNgGfjhG9P6auYdqJoQ7P5XgfXtFoAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGyjsvlLRvW433O7fJ2EdCjWbIlAoKaltyX8153FcsZkwdHq9AdBMTerBRnckAcn4NwqDiBd/4MuKxApOkgsnf3nGmPZYJ+2ZpTITCHuQYF86yZxHemZ/OLnEbZcJkg5MV19ZIkew43Yxal4VY5fVKxqUuNW+crYfW6Gzp50268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSQa20vw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8955CC4CEDD;
	Fri, 14 Mar 2025 00:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741913315;
	bh=MjhwuksWN5o8NNgGfjhG9P6auYdqJoQ7P5XgfXtFoAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSQa20vwRH0vpR8gG3ASpQrzAAkDGEjDUkn8mchuh+scg2JO1tCqK7tstRmQQ6L4v
	 xT5zeZxFk5CJUCeTmHC0WHShA9OHKSXEuCb2qTL3lYDj4W8l/GNfqULm9WvmSNYzxV
	 7K1bUzUeplpwj3emhxp8pu+6wj7+unl+OWqqA8KKcrNm+IRlAKZUXheOMl0PJ2sVeK
	 G/eGeV2H+D1EXFXML1l2gbBEi+4dQIX0xar8s5f4KxE9TKy/L9afuV85pgI6tnnmW5
	 j44NRu94rnUw6zuOj92aYzg+t18hn5EZH4nuSQvCQQ/cvyBW53CYl3BUlc8f45Fehu
	 /EA8Yjl+Ynkuw==
Date: Fri, 14 Mar 2025 01:48:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>, 
	Adam Young <admiyo@os.amperecomputing.com>, Robbie King <robbiek@xsightlabs.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 10/13] i2c: xgene-slimpro: Simplify PCC shared memory
 region handling
Message-ID: <fp6swrbauspd6kbx6ppf7ym2clcdmem3krtvssvewjrc5oqgqw@bpkgoo5gfz3q>
References: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>
 <20250313-pcc_fixes_updates-v3-10-019a4aa74d0f@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-pcc_fixes_updates-v3-10-019a4aa74d0f@arm.com>

Hi Sudeep,

On Thu, Mar 13, 2025 at 03:28:56PM +0000, Sudeep Holla wrote:
> The PCC driver now handles mapping and unmapping of shared memory
> areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> this xgene-slimpro I2C driver did handling of those mappings like several
> other PCC mailbox client drivers.
> 
> There were redundant operations, leading to unnecessary code. Maintaining
> the consistency across these driver was harder due to scattered handling
> of shmem.
> 
> Just use the mapped shmem and remove all redundant operations from this
> driver.
> 
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

