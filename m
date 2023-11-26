Return-Path: <linux-i2c+bounces-468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF897F95D6
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 23:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82076B209C2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 22:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6A513FE2;
	Sun, 26 Nov 2023 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZehqyCw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D01D277
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 22:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2169C433C7;
	Sun, 26 Nov 2023 22:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701038299;
	bh=ZzkvqZAA0BbxPb51CfXzZIVh5Y99x58F1kl3CaI11Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZehqyCw3CFvJKr92+RJKcX6cOp1Jol0QkdkQZOY8T358YlX96JP8C9wImjcaM6Yi
	 kUdxPkPTYxKNz4AYzluU4udsMvQkcf3y7R+0C3zhT3eERPnahCHnGUOoqh/t0Bb7rR
	 VVjKrmxCqa2JYJtBftwdRA5I9d0O6He8wCavRRJAeOy/azXMY+JOTAp/AfGkZVr2YY
	 j5JLFLg4RyPG4PHQa39oWGn3E9RSx1XCm0VBMewSjSTmY46H2lahurpwcj/AzOIp3y
	 kqVmZ6Ep0elFr8MgoSYyKr5KYWn4V1rCLFby/26QpRXmyWN7NCZEZ6IH8MHZbhpc84
	 knq48crREG0KA==
Date: Sun, 26 Nov 2023 23:38:15 +0100
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
Subject: Re: [PATCH v4 06/24] i2c: designware: Save pointer to semaphore
 callbacks instead of index
Message-ID: <20231126223815.vpqxfahxw7avrscr@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-7-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:48PM +0200, Andy Shevchenko wrote:
> Instead of saving index and do an additional level of referencing,
> save just a pointer to the semaphore callbacks directly. It makes
> code cleaner.
> 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

