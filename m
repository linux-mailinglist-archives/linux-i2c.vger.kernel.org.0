Return-Path: <linux-i2c+bounces-467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743797F95CE
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 23:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FDE5280D88
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 22:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2885014A9C;
	Sun, 26 Nov 2023 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yzyx3XhU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5E12E58
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 22:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB71CC433C8;
	Sun, 26 Nov 2023 22:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701037672;
	bh=vWbSX32odQjp/d/idEt8zwF9Zy5oAJlF1CorJpW4uw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yzyx3XhUv8CVZShbuwX4R+uFDMebpWtbA94ZcWfBD4yEFTN4phpSkK0sX7Oyfqv4O
	 c1WmBAHWeBjsWIWe3gOYZxGLvMrIhJ0X9qxistHqe+dBZVDbO3XJXNq1czLuMUAxze
	 La6V3A32DpHmN22yUwK/wqWw3aTmTcE6QRNIvfV3VDHCH4voAmtwiLj/cgu3/siw9k
	 W6+7C1YLZpRgMH5KKYDbWjkbGU5ogmQrNMtgcQCNPin6XOqolFu8+01qH4dqZ/EXUf
	 e/6cRR/3D5hjpgIf1povezK4I1moToQFTpK2XThGejp1NvIWv4AqIoeJp+g5ebxy10
	 mYHwYoIQH4QMA==
Date: Sun, 26 Nov 2023 23:27:49 +0100
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
Subject: Re: [PATCH v4 05/24] i2c: designware: Replace a while-loop by
 for-loop
Message-ID: <20231126222749.bruquaub2rrtbr7d@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-6-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:47PM +0200, Andy Shevchenko wrote:
> Replace a while-loop by for-loop in i2c_dw_probe_lock_support() to
> save a few lines of code.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

