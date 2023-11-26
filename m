Return-Path: <linux-i2c+bounces-463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E255A7F9597
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 22:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96098280CCA
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 21:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397513ACC;
	Sun, 26 Nov 2023 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TU7Tc3Be"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419D8134AB
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 21:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9CCC433C8;
	Sun, 26 Nov 2023 21:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701035329;
	bh=V+EAygX9A+oQQ8gRy4ING6DnIoldEnMq2NRFb/sGfhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TU7Tc3BeNEogOEUoqEkSJcNpK/FpZ1eQFLbKgFA8XDoJ1sqbaQGryH1kkk+0WDGuJ
	 ckbt4dqYCNPpiPulzFcRYNTbOOCaHrE26SAAUGFUw4b+DY7nLj+K5Cpvm/tmWCY7HH
	 tDIdluTprCQDgnWudW9hizgmvMf9z8Ip6y0UKI5zUXIjkM1RLS9ti4dG4BXIJU/vQ+
	 XZ5ro3+1vWMh9hH51q5C/EgVqz2dtlA7WGNBmwjjjndfsL8FWkuD47JXIQHyiN1Zc6
	 bzdQlSzNIOXgqiahwem8D5ivwbzzHXdQ5KHb67RZ+fVb02DArq0YEEcdzTOhyNZz9W
	 BZUuP++E9fdsw==
Date: Sun, 26 Nov 2023 22:48:45 +0100
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
Subject: Re: [PATCH v4 01/24] i2c: designware: Fix PM calls order in
 dw_i2c_plat_probe()
Message-ID: <20231126214845.d5egybp4dk7mf2i6@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:43PM +0200, Andy Shevchenko wrote:
> We should not mix managed calls with non-managed. This will break
> the calls order at the error path and ->remove() stages. Fix this
> by wrapping PM ops to become managed one.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

