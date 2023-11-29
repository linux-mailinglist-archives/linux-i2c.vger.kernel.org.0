Return-Path: <linux-i2c+bounces-550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADF7FE3FD
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 00:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44BCD1C20B2F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1C83B191;
	Wed, 29 Nov 2023 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecdoHEJf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B3D1C68E
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 23:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16772C433C7;
	Wed, 29 Nov 2023 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701299338;
	bh=qxv5vNqKTDsGEa5/kL6eZhnYZ5V78CNQhvavc4eImz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecdoHEJfKgQSRR/QTdXiIJXQ/gO5GOuwvC/XZ2E78a6Mn9b66cWYJFxlf8OmnOnk8
	 09naAjWfCt+O5TIhgGAPKnijH5n2xQfIqBLjeKxKxj8K66/i+AkLvi6/7ONneDNkIS
	 imDCl1ZRQ1vIG7sD9sqScVGZoZnrzaceaoybuY8tcTSBOjHpdoTkoAPdcGTZLXZOL3
	 kfM2xYGtaqQ6/77Z02oMcWQsKTYWajt+XXi7e/X2yzpk8nkp9k6/PlUoNRZRc8SwfW
	 EFcOkkUnnw8vHDxx4OSwjqvXbOgxBnY59pfC3N7onucYLxrak33aXpzFpq9gzldhrR
	 aYPy25q3rz0Pg==
Date: Thu, 30 Nov 2023 00:08:53 +0100
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
Subject: Re: [PATCH v4 18/24] i2c: designware: Consolidate PM ops
Message-ID: <20231129230853.rv6hn722fg3whv5v@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-19-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-19-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:42:00PM +0200, Andy Shevchenko wrote:
> We have the same (*) PM ops in the PCI and plaform drivers.
> Instead, consolidate that PM ops under exported variable and
> deduplicate them.
> 
> *)
> With the subtle ACPI and P-Unit behaviour differences in PCI case.
> But this is not a problem as for ACPI we need to take care of the
> P-Unit semaphore anyway and calling PM ops for ACPI makes sense as
> it might provide specific operation regions in (however there are
> no known devices on market that are using it with PCI enabled I2C).
> Note, the clocks are not in use in the PCI case.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

The comment in the "prepare" function is a bit cryptic, though it
took me some time to disentangle from the double/triple negations :-)

Thanks,
Andi

