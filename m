Return-Path: <linux-i2c+bounces-6449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B29724E4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 00:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86D761F24BB2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 22:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75ED18CBE5;
	Mon,  9 Sep 2024 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cznt/t3b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281720DC4;
	Mon,  9 Sep 2024 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919338; cv=none; b=q+SLNpQ1bi50df07Iqb1lO+fACd2fxVMCFfgXUnBZdiAsPDt9u1MMj8vu0UVPIXep8Zy0F28eGPp6HR/nIVYQOVa2DpsmNOr35eo6Dk7PnCbe79o1/olOEcailz1dF+Kg4gDPgTDCrxLJyLcK4qjiC1YxXcX3QhX51xvVb5JJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919338; c=relaxed/simple;
	bh=CyHo4lm/o0p2r64s8FRSmx74N6JkJPw/dNJNtCS08gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDXotCpRH/P3T1BOc8Bs7jfCv/nZWcmv+/PReILHjw4SUZVq5eoGZU2wgZ0jostg9rfxB9w9011stddkYFgI04xi8tojqPR+U9/aQIR/QTuIQIFnXktQ/wr0mBoVxPYHkku2i4CIpB0XlsdHM3w2Lup9yZU0neIMmC6ui6pP10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cznt/t3b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F4BC4CEC6;
	Mon,  9 Sep 2024 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725919338;
	bh=CyHo4lm/o0p2r64s8FRSmx74N6JkJPw/dNJNtCS08gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cznt/t3b6lycg3+BfzRjncEOkB1awOuAPqLMkQ/XqTCo/7ZeHPIBGFlozUd/lMPuP
	 mK+Abqa8cTyYQS7lJokn5tbqps5B1jWPeYrpQ06LUJ5D14VVkZJb+nzrLgeWyl2qIe
	 dS+1CInSgRI8ecNPUrCC/6cngiXdGIsCd/VSgxKlXZCnmirnMi9lD2CIzHF7ifBhFl
	 ykidjghZZgd8KLFYsV/kPnT32WNN0CODBHFCj3zO4y+TCIoJHmi9AH0drfkXo6BcX5
	 MZ57zeyjR+YLItmvdnZeg9pbfoZ7Okh5dhGmNjI5YKFCqq+gZlUw7rEIx4yn3lTh8L
	 HUiyCTzrqUYkQ==
Date: Tue, 10 Sep 2024 00:02:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <h2lnjlwquupfuasm7lcv6zehsh2vszhnos5xagpwi3qfossd6x@bmazngofy5om>
References: <20240812203952.42804-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812203952.42804-1-hdegoede@redhat.com>

Hi Hans,

> Hans de Goede (6):
>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>   i2c: i801: Use a different adapter-name for IDF adapters

Patch 1 and 2 merged to i2c/i2c-host.

Thanks,
Andi

