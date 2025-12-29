Return-Path: <linux-i2c+bounces-14849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3003FCE7244
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 118ED300CCF0
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F7B32AAA4;
	Mon, 29 Dec 2025 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="gCFWJBPk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BF266581;
	Mon, 29 Dec 2025 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020225; cv=none; b=eeJ6XVeJU3Rf8MQ2uEHY+46sDUgSLcdQ1pIItWkOWwSPbzlJjJjgiFjGavCC2NV6UKQMJqe5G/TljEJ6mPPhu42UFzxeDjoJus6jzjITeGB76Y4POZlms+EN0CSxCq3AbIyQpWKlteBMOjNxoBqh1Y6TGgCAQC+rmxQT2yzugEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020225; c=relaxed/simple;
	bh=smNJmO5MVgxk4aEITTuOxg6ShJVBEWwJduJkWAt108A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBL79jvcKmYOsETw7YLdjp3OsqMgUFP4OdQTUkrVDV0FcP+5ZwjvH0Dak+cF/PBLxjCHwghJWgiPpoe+8SG0KvYxSfngdRVWUESo9H9mAFSDD6du9zArxQm708gG1etSBxPj1wPyetFgx+kwyDwHRhpRkttyy7x8pJkc04pjPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=gCFWJBPk; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qwN4cwTnAPlPtkSz3NLwx/yvFwHVt6coOVjBwRs4jiM=; b=gCFWJBPkBhFv2udi7B89Sig82A
	wHMkq9WQSs9vdZ1XEGFMxBnv1FPKIjEdrbpowyYD3GHgXwf5GdNtrUyaHeTTBitWcj7cwYH6s9rFs
	EMpdunRSKbsa4IsUnLwEeNmrL/rANVOBM+LkfHi72ySv3vDeQsHwsjyrcMoykNfOZLUkqlpvz0T5+
	EeqPDFMt1nYpzK/HliPT+Zmb3AUUdcZEQ7U0VDedvbdgzJ6/ZAC+nRDzM9LzgJj2IMq6MKNMHZcGc
	GmWX3HGsB007WcYeZgdRNYmAlLtw3vcibnsgUZyDrH8H5Au/xMnXTrDd+YSP8UAELSpy1Hd8NzFOD
	fcESzGPw==;
Date: Mon, 29 Dec 2025 15:54:27 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 05/12] i2c: omap: set device parent and of_node through
 the adapter struct
Message-ID: <20251229155427.2ffcf120@kemnade.info>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
	<20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Dec 2025 11:04:43 +0100
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:

> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

