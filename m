Return-Path: <linux-i2c+bounces-8955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4937A04BEF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 22:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F8C3A3F49
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 21:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E917C1F7082;
	Tue,  7 Jan 2025 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvYfmm0k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351256446;
	Tue,  7 Jan 2025 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736286655; cv=none; b=I/3I0V6+lm70Y5hVhZ4fTyL2XEesc9zxzd4+Dr7i9WuAqNhRSkFLKbkw8M+6L/9PxbNBttsgjrzcenMW2ySZVJXYQCqgQGmrP9wPKokYxtMgmsO+6cUYtoywVBZavzLXcUjBlm4gH7GRJXwLvB4Lj55k2ji1cWDXt/tsnmZ+yIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736286655; c=relaxed/simple;
	bh=TsCpx7aKGUcwB6mW8YLBLjC9e8pZ6xstkV3qO1nZsG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGI4Qd50q2M0CEu9deXUNSd6ULz0OYrRet7grUXbONv691dXrpVDFFRiFli9aUPFWL4zJBx5yBCZX81HA/c5fSbnyG3m5HxDOB+rJBVllVHXMM0SgACnU4+Odjvo8NdtoPOL7tLPWO76APd12JGQdMFhMW5nAFXb1BXJMfde3ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvYfmm0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B86C4CED6;
	Tue,  7 Jan 2025 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736286655;
	bh=TsCpx7aKGUcwB6mW8YLBLjC9e8pZ6xstkV3qO1nZsG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvYfmm0kNt473KUEQpk9r7jj5m1XOUbMX1J0ej8kCZO/3PcWsvZbvaBKbYYwy3FB7
	 H4W2BvEjbEpsgcGB03DkO1p5RqcM1SutTFfAGnrkDN22CO5WFonk0HceIg+UH4nXW+
	 Bb/VuXarWE2h5W7ky21Twnc5c8dsfIdPN1NR9IexGhcUyq1lrPOXzCuC1LHtdmsGe1
	 3gMSvnZxAnQIciXUTlNm303nBwm9Jw4OWHAiwd8gQkCLTz0bhWYC/DAb/lsfWgw5hu
	 JRM99JVcAkpreyL8gcN8DqSzievz5Kl/i1A6BQy2JAY7M4GdXMQ4ZDIXJxTSzBUtcb
	 LEE0RN3JTCK1g==
Date: Tue, 7 Jan 2025 22:50:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com
Subject: Re: [PATCH v3 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <puotk7kms35fh3mgmsg24uxwadmcqjfr5iuijr2zknezcg7dtg@zlbrphpd6jn5>
References: <20250103143250.1521287-1-zoie.lin@mediatek.com>
 <20250103143250.1521287-2-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103143250.1521287-2-zoie.lin@mediatek.com>

Hi Zoie,

On Fri, Jan 03, 2025 at 10:32:34PM +0800, Zoie Lin wrote:
> This commit introduces support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.

Please, don't start the commit log with "This patch...", please
use the informative form.

> Although in the most platforms, the bus power of i2c are always

/the//
/are/is/

> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>

...

> +static int mtk_i2c_runtime_resume(struct device *dev)
> +{
> +	int ret = 0;

initialization is not needed.

> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);
> +
> +	if (i2c->adap.bus_regulator) {
> +		ret = regulator_enable(i2c->adap.bus_regulator);
> +		if (ret) {
> +			dev_err(dev, "enable regulator failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (ret) {
> +		if (i2c->adap.bus_regulator)
> +			regulator_disable(i2c->adap.bus_regulator);
> +		return ret;

no need to return here...

> +	}

... you can remove the brackets...

> +	return 0;

... return ret;

Andi

> +}

