Return-Path: <linux-i2c+bounces-525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DE7FCBBA
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 01:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E97028327D
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 00:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA4A626;
	Wed, 29 Nov 2023 00:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cz0qJS7Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCA374
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 00:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ED5C433C8;
	Wed, 29 Nov 2023 00:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701218854;
	bh=T3oSnu23CiLc/ppZ560z8WBsWJDQuNlw2P+rkqW8w+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cz0qJS7ZR4XDVRukpVgCtunRftXagH3R1kYCt2T0lQ5xrSdeIkbIhTfoCxX+K9lAe
	 4nhbqQzxM0L6DJY1m4EB8TCHcRM5VsUlabcz1iNpC9VlX3695WXcUl+hnbME1Hp55N
	 HydCNeCBzuY44+qkWTDASdbrfp0IMeSsyO/ba2GLhnFgv5uO4R8NW/KlGzI9EnRr/w
	 1Ki+cd/250TMEDLc+SNJTORhoGYAm+Og7n5jJgcwr3shBJr5BovV3Sf7icxgGRdMvf
	 D1cgjwsg5bUwCwsBS/WgPG7bpUd3NH/CR13Ks2aSCrYuscTKY03ZytgjVDlb57o+PM
	 jqTvf68ire8Pg==
Date: Wed, 29 Nov 2023 01:47:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 17/24] i2c: designware: Remove ->disable() callback
Message-ID: <20231129004730.hjnvtku3r4dzpn5f@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-18-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-18-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:59PM +0200, Andy Shevchenko wrote:
> Commit 90312351fd1e ("i2c: designware: MASTER mode as separated driver")
> introduced ->disable() callback but there is no real use for it. Both
> i2c-designware-master.c and i2c-designware-slave.c set it to the same
> i2c_dw_disable() and scope is inside the same kernel module.
> 
> That said, replace the callback by explicitly calling the i2c_dw_disable().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

