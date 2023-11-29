Return-Path: <linux-i2c+bounces-551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776E7FE401
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 00:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38C411C20B2F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4B03B198;
	Wed, 29 Nov 2023 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Opc58t9f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08B1C68E
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 23:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C90C433C8;
	Wed, 29 Nov 2023 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701299403;
	bh=ibTbb2JNsJh/AaZjyoNVotpyQoFG4eK1lbgyEx8xpCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Opc58t9fPZa0AVPpOo2nIi2K1egrAEIDBg6qug2GR6/sqi6UfaEsl6AQCpWGbU2gm
	 qZZhz4KY6drNF1ELRc7/9GfcL2I3XB/RpT/XmkgR2Qzydq5/JOKO3XVq0NWG7yt6Ik
	 IzvwXb7gGqi7fVCd0kK4OOf/ZjKmnvOxMEDGs8U4jG+JGSt5f8di5rxm7yQFVM4uZG
	 5jJvBmgXdRTzx0Cebz0vPxRRvGEc0dO9RJBTmPEKr8g3nF0mRHa03IOo6+v08rOF22
	 0Zo2glg91w57Ui3wBj47icjMERzGvvkDEbclgzCGaaMnVby+n7whC/yO34pY57l0pR
	 cDooBtUQN3VVQ==
Date: Thu, 30 Nov 2023 00:09:59 +0100
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
Subject: Re: [PATCH v4 20/24] i2c: designware: Propagate firmware node
Message-ID: <20231129230959.uuqcp5c5ao4ge7ud@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-21-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-21-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:42:02PM +0200, Andy Shevchenko wrote:
> Propagate firmware node by using a specific API call, i.e. device_set_node().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

