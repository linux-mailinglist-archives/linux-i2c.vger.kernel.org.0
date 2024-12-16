Return-Path: <linux-i2c+bounces-8545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6F9F3922
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91181887B09
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E9B206F0A;
	Mon, 16 Dec 2024 18:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Kk/txJJH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECFF205E11;
	Mon, 16 Dec 2024 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374569; cv=none; b=rAYjSJQikuZDvwy2YuU0vW7aP6KbNj2qQ3WFCXviR8Vdd/QXZ1SZ9G0jd5cKoSvmccC+gTIswv6yHZZgSiZGqLRXNSiTic5sQ8D94dsV8rh0urPdz6TdhOQ3/Vtxs7YsmAZkum1thHlH94LhOEcSA34gu/M26PR+T2zvzIcTZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374569; c=relaxed/simple;
	bh=8xEFehqY8KF1JLBkAftl92s5MPpKDZCAebxKHHnsyZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/fc+2oiJVjmnIkrSMJfpCWW6vrWiH3VJtkgq07nc/bDeVdF21oYu/j0cf9qklmpJLM4RWbf03b8KB2YBCpM1QrDH5kkqQ6w8ZdbgMeXDH62O2jUoGJnYzGC49xhUVNtZgKyhjkozPLLq647j69HaSNsQRvZ9xJK/NnO50gsAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Kk/txJJH; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 86207224F5;
	Mon, 16 Dec 2024 19:42:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734374556;
	bh=6lPU+k2B+n0yE3XNn+Y9y0r9UdQY6i1mb29ATV0ddzA=; h=From:To:Subject;
	b=Kk/txJJHpqKFWtgQxPHwZ68QWOZBG8zWo27NH27u9bIECjOxoUsvctOCHshndB+YG
	 BYzF3EO/K1t9hVXBCStk0l446rgAaGOFFHdAGsWI2dO5e/vqnwWsWjm/ZtNqVoHGzj
	 o7U6G9cLI9/1wLlsFGnzHTkaOuCJa/syRHTORLDyFMHqdd7Lx/AKMYnOFZdEgtcO12
	 AWPweOhXo99/a5S8R1lwOuKrkDilX8EY17YnDJjO+5DM+o1D5NPm41BDJahrFRGFOr
	 xoQLtlnIyDOyoIjyMA96Kqmd4zn7QE7Pc3sinLGdJ4nFTnMZh/uwqBv4JQUOzLMCOR
	 WD8FbWPVYpSxQ==
Date: Mon, 16 Dec 2024 19:42:31 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <20241216184231.GA53492@francesco-nb>
References: <20241216151829.74056-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216151829.74056-1-eichest@gmail.com>

On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> A regression was introduced with the implementation of single-master
> mode, preventing proper stop conditions from being generated. Devices
> that require a valid stop condition, such as EEPROMs, fail to function
> correctly as a result.
> 
> The issue only affects devices with the single-master property enabled.
> 
> This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> polling for single-master mode when generating a stop condition. The fix
> further ensures that the i2c_imx->stopped flag is cleared at the start
> of each transfer, allowing the stop condition to be correctly generated
> in i2c_imx_stop().
> 
> According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> 5270), polling the IBB bit to determine if the bus is free is only
> necessary in multi-master mode. Consequently, the IBB bit is not polled
> for the start condition in single-master mode.
> 
> Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


