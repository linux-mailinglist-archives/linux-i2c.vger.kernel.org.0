Return-Path: <linux-i2c+bounces-512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B47FC085
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 18:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6FFAB213DA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 17:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C85639AF0;
	Tue, 28 Nov 2023 17:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtJRQ0Oe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77139AC7
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 17:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97258C433C9;
	Tue, 28 Nov 2023 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701193703;
	bh=xYeLkREJkq6n1zWQOI2iv9pswdUrixGfu5ZhAwu/Nzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtJRQ0OeuW1aWyMxPMS7HJTbmrsI+mEH3wx5V5KtqFCZL0pd0VIKIfjHPhDGQTX/r
	 COL7GZqmIqZZragTbRjvqnkeB0DB5x8+ybII/lvmB4hLT2HUU0BqB0TrVPkGM75U/x
	 8tLEGSqKxrKMHpyritqd/v4sWeug5wSo8yJxk02mSQG57G5cMG19mEE2FMBZI1O+yL
	 BjOQ8/PDv1bP5jrYQq7ui3kb9U5b30kudFbozA6E9dTjdCocDzhgNJZhjRB+7LNit2
	 Ai7SR9/79+Ai4irisjul2wXTFPSCHrO6fw7AUYfcLBr6QsN/wjDbvw8tR7owLiiwDb
	 +1ZkCXrUGHXPg==
Date: Tue, 28 Nov 2023 18:48:18 +0100
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
Subject: Re: [PATCH v4 16/24] i2c: designware: Move exports to I2C_DW
 namespaces
Message-ID: <20231128174818.phbil2xatmkbugxr@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-17-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120144641.1660574-17-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:58PM +0200, Andy Shevchenko wrote:
> Reduce scope of the I²C DesignWare driver exports to I2C_DW namespaces.
> This will prevent abuse of the symbols and clean up global namespace.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

