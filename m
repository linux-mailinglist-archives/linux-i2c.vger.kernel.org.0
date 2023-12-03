Return-Path: <linux-i2c+bounces-595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AB80284A
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 23:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C63E91F20F86
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 22:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6122C1A58A;
	Sun,  3 Dec 2023 22:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJT1fu5e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4A16438
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 22:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2415EC433C8;
	Sun,  3 Dec 2023 22:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701641191;
	bh=qldAQbGBW+m2Iv0KMth20Gs21ONUyoDeYfrXlBQU2To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJT1fu5eBo/UpN/4kLRKKSASIzIfeG1LiS2Gb77HsVGWvsait1zj6o+uHHQFfU5oL
	 yiKyYxgOhqWev8bAYzzr6dWiD9aO24Usj3hYxMpqqAuiDAFZG8sx0qlmKMOhT5CQHw
	 P/WgnGJ99buJO06uM8F+hTuCgroadCAhYEFUqcNHqscPzZ8OCPAQ6cKeD5S1S6AqBH
	 JRYDJBZECk+79tWmm2D1Oc7UyI5lLEq8mF+3DlSGo35iBXZRD26/hjic9T6YsTXNKk
	 6w6w26srSthcEFR8UQE+WcyqJbp8W7Pg7b5qJOeOmkBKvuwjjPBJ9a+k7NGfEQpLmA
	 c1wrBTkXl27xw==
Date: Sun, 3 Dec 2023 23:06:26 +0100
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
Subject: Re: [PATCH v4 19/24] i2c: designware: Uninline i2c_dw_probe()
Message-ID: <20231203220626.ild5flvaqvlsqbmy@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-20-andriy.shevchenko@linux.intel.com>
 <20231129232151.ueum2axn74qzuzes@zenone.zhora.eu>
 <ZWiN8sY-I8cyNWCs@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWiN8sY-I8cyNWCs@smile.fi.intel.com>

Hi Andy,

On Thu, Nov 30, 2023 at 03:28:18PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 30, 2023 at 12:21:51AM +0100, Andi Shyti wrote:
> > Hi Andy,
> > 
> > On Mon, Nov 20, 2023 at 04:42:01PM +0200, Andy Shevchenko wrote:
> > > Since i2c_dw_probe() is going to be extended, uninline it to reduce
> > > the noise in the common header.
> > 
> > where is it going to be extended? It's not in thie series. I'm
> > fine with the patch anyway as it cleans up the header file.
> 
> It's used to be in the previous versions of the series where I have
> device_set_node() API to be used.

Thanks! I think this missed:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

