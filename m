Return-Path: <linux-i2c+bounces-11601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF56AE9755
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 09:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A0A73BDECE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 07:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B392571DD;
	Thu, 26 Jun 2025 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="MCQAiFkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5DB256C73;
	Thu, 26 Jun 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924733; cv=none; b=KzpTsec7JsP6HadeVC141jhSX9/mOACnrwFjnYmZgvbxVvjDYNdkWGJoiC4kYi4C6ow3axQrWXDC9zeQU5wv7zT7JkXeJcaM1hkPUZYo9SFEjx62ZQg9kfTzGzl8n4TN9520kSQTGbN5oNDYMQ51D6oKlgVl6xnO7YUgy/jg3qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924733; c=relaxed/simple;
	bh=6aY0I+S15EJku5uKlHhCDBcxF7xdmNRSztzOKO7k46I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIIlf93Bs8mLEAjIO+J8K2WcBXNbd4FsTpR9+1b3yLRXs5jYTJMAXNdgiz0cJ1qDZNkSocrjYQS1f+P4RJ4p4yYxRXOjXrv/Rg9L3P1VUPaXvbbxJpsXvZ/jYa2snJy2XaLH8YE0a8bmzxBDWJ1PaSTkLoiAkz3dA/g3sZC2eig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=MCQAiFkE; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BE4D41F8BC;
	Thu, 26 Jun 2025 09:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750924722;
	bh=dyiFPqDtFrSQdqxYLEQlpBfXMXYJcQrLo+YRsrs7Dww=; h=From:To:Subject;
	b=MCQAiFkEd1aMh3AbCF5YmuzB7I392mwNbcwuMLYzTVwrNUWjpy14Ggx/QX8zPU+mK
	 dHqO09a79r+Xj7G7xLVcFATosAXYjW6bjQ+v23oWK3FCY5KOl2mxUziUIyCoCJwru5
	 3TK9nhKLaqAF10z9SVDx9RBh4eOFpFJuE+LfOHXHmE1keVQX66adloUle2vk8nJqsL
	 SdsUMn21RHDDnSUWJfZScXDuti/fRMx6dRLor3hv5YT2ZnTc5vmMO9qF3V3eVIXX8Q
	 FTtEwcxN7RuKS4lIR4Z81jg1C8s/8Zl3kW4lfgZIaPSe5BcUbw0naOgBjkF+Zg/BHU
	 Zlb0Apcubz21w==
Date: Thu, 26 Jun 2025 09:58:37 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <20250626075837.GA9216@francesco-nb>
References: <20250523082931.23170-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523082931.23170-1-francesco@dolcini.it>

Hello,

On Fri, May 23, 2025 at 10:29:29AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds atomic operations support to the imx-lpi2c driver and split
> the previous v3 patch into two separate patches.
> 
> The first patch replaces the open-coded polling loops with readl_poll_timeout.
> This improves readability and consistency, and prepares the code for
> integration of the second patch, while maintaining the same functionality.
> 
> The second patch implements the .master_xfer_atomic() callback, enabling
> support for atomic I2C transfers.

Just a gentle ping to not forget about this.

Francesco


