Return-Path: <linux-i2c+bounces-9795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CBA5D2F7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 00:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97ACB7A7217
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA3221D595;
	Tue, 11 Mar 2025 23:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAP7xCVb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96761C5F08;
	Tue, 11 Mar 2025 23:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741734483; cv=none; b=jJiLNanUhzhHf3UrbNRGXXB8FoJ5d8UW6UxMuyf/reCQHWTB4ARhUhL65jp2CsqBlSXe58u+VYBWXHl66VynIrQkWH04gDpkzD8v2pu+XbdF3rEqI2PMUplg7M0Jsiw2asISYSeGLwCUwITPSKb2tHz7Sy9x/iovs52AQNzxYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741734483; c=relaxed/simple;
	bh=CPqMb7fYWDC6jDmRWFtrcKkpps3ZADjeGJtR3UG/pi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVm8REKAYcSmI4S85pHuVeD0Is16LpZqjl+YguiGtlbUvH4wBkzyhgu/DCVTj/sH8T4MDsndJnxxnPLXEr1ctYXKQ69301nLp/J5WBvKkEOyJUZ76LsOQL+1RxCPYNablrkplBiKFbnFKp+UyYtXjEf6NPdu8eXrfn0B9phGjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAP7xCVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BE8C4CEE9;
	Tue, 11 Mar 2025 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741734483;
	bh=CPqMb7fYWDC6jDmRWFtrcKkpps3ZADjeGJtR3UG/pi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAP7xCVbkK5bhAUJdAaEl6lkLyUQxAdsttqSrPP4+t8vGc6QAW2qeOzrVK5A1yQJZ
	 ksVGcuk/6lGlzy2egxBhDIIHl8x5I7M+07YPIfpWt0XfgQe2uA9+bBNUfLXIvVPOos
	 WaX7zj8D9e4ffJJ0wI1eRm7uKkHm0d9Q2yq73+S3h001IooLPd7Z+o3UBmZZmVamqv
	 hndOt9MQJOFH9MWlzIjGan7L7ZgZpIutOsPHhvvzuZ/SrnmpJcFZ750eQhC30bTwS7
	 Cm1LrSqtx6TJVZ5OYODwUeEl/PyvIOUw+66iEyhJpGsdpL3S8tCqdp+tCuA8aytbCK
	 Z6QYk8IyV9G+Q==
Date: Wed, 12 Mar 2025 00:07:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: sis630: Fix an error handling path in sis630_probe()
Message-ID: <k4r7jicj6rygzljltpjktjow72ve2xx7jzo2igtlqvkgaqk4zs@lrcdsawnumwv>
References: <3d607601f2c38e896b10207963c6ab499ca5c307.1741033587.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d607601f2c38e896b10207963c6ab499ca5c307.1741033587.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Mon, Mar 03, 2025 at 09:26:54PM +0100, Christophe JAILLET wrote:
> If i2c_add_adapter() fails, the request_region() call in sis630_setup()
> must be undone by a corresponding release_region() call, as done in the
> remove function.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host-fixes.                                    
                                                                 
Thanks,                                                          
Andi

