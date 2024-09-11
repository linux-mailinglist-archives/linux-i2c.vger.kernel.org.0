Return-Path: <linux-i2c+bounces-6544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D4975046
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A61511F29AEF
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BD8185606;
	Wed, 11 Sep 2024 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnDUR3oZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD2187337;
	Wed, 11 Sep 2024 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052079; cv=none; b=Wf4YTlE5BEIhTQrxZ/5K+Kd0t1sTkH8NVVbZKo9EtPbHM0UEJMa4JHaY6PphQ+tPCtfdHknzHJgXrJ9HSXIrtTPPhUE2D24zoktqFm8mvi1v2y4NKtQvl9VFUS5cFDnBygjreh0sc4k+qXC5SaDWEcQdTaFmiOIEPuv7H9Qg06g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052079; c=relaxed/simple;
	bh=soCnASlPBPfh3c7iayppvjwIm7pwsPPr59+W5Ruvn4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpgyxeZVGuWVq6tyc8btaICqPVazXBLqR5VwgeI52dT4L2lSUmWtkSv33sJhI9Pm32j61uYOSHO7qxwOVjGRvbV+ALGhVN6efhynZarf/GXmr1A88yWXOuobyBjs6GLE37g24jZ/W6QBT8I9QzpqpIse5DGL01NBWTIZ/y3ZAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnDUR3oZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0278EC4CEC6;
	Wed, 11 Sep 2024 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726052078;
	bh=soCnASlPBPfh3c7iayppvjwIm7pwsPPr59+W5Ruvn4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnDUR3oZr2gkem0VDjSrHSwgG5HveTvu4SedT/q3zJ3O6epgWmV1KMhxl497EEZyo
	 D7deDVucjw/YBn+ZDUGrnEQeLkM3p/xtXYeQDqoUzosSUeGWFTHBBInqtK8affgEaK
	 cyCViH6VpYg2WPpmCr2R5/Y2vgiqdNuYMxHnc5tt4bmW17M2YzOsgSDs0FQCl5+4yo
	 yFzG5IIg4z6TYilEFo0+7QQXhNCPCMZN2KHSMMgB8VvXMp0OFSi1BoC+HYe/pDzQLm
	 WTsxCX158Lv7DCLcRUqAt+oN7iWwcC+CFbNUnY/eZFdi2RJtyahuQviVxaNFFEY55b
	 qDrhkWKqojY/g==
Date: Wed, 11 Sep 2024 12:54:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 0/3] i2c: designware: Cleanups (part 3)
Message-ID: <3s2j4aiiq2wov3bqpxvbs3aivtiyqgtr2apzwibfxmv6qgvbuj@ielz3akukvax>
References: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (3):
>   i2c: designware: Uninline i2c_dw_probe()
>   i2c: designware: Propagate firmware node
>   i2c: designware: Use pci_get_drvdata()

Merged to i2c/i2c-host.

Thanks,
Andi

