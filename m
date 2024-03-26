Return-Path: <linux-i2c+bounces-2598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F988CCB8
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7122A1F8033D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 19:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C040D13CC7B;
	Tue, 26 Mar 2024 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbeLgwVU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4CA13CC6D;
	Tue, 26 Mar 2024 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711480150; cv=none; b=ZiGgn/zxo8WYJEE0wsh4nG5iK2dsEd9mKzF9VBAL9Nvca67fN0+Rws99WOK+ccHQ0krMCYzOcJspILgDnn4vgLalNzGifh92sWAdOBp4JGtL3WRy8C71/L6WtsoEo/UTunMxb+nlmmTDQsNZ4WEQoyUBFWxsAumjnwvVDhle00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711480150; c=relaxed/simple;
	bh=pb+u35OyTvLTyzRDf1w+2oKwdrPFHhbSH0PY66OLQKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wg5jPaSBNqdv189jW8uaQIz2Wc1mGa/HDmtd+ya2QLWr5jooJwWDscJ9FptH/zC0b/h4cD4jBQkxPi8mtnRNrXXQfXXuVO5T9RemVhmqahwKpIHVmROO8mEpFX/jicFskzdgGAEkf+m8mXsx1y/AYwjbuOfyuBl94RZ+uK1Cqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbeLgwVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E2C433C7;
	Tue, 26 Mar 2024 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711480150;
	bh=pb+u35OyTvLTyzRDf1w+2oKwdrPFHhbSH0PY66OLQKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbeLgwVUPuTL2Cphgye4KFfoLgH4dvlhl7kXfNHgYpXP1+3ZD5zyMUyOTAahq3VZv
	 oShMCS3dnEvmY+6PB1Tz7sk3k1b6fU03JBfaOD1KT6zyje+w5zusn1xm4aqCQFqbPY
	 PsKBsZN4hAaFth6/3cVl4kU+mU0iHY8hvBaVqU9/r8HQcIdHYtBglP/kn6EBQ3bHFU
	 3FQ2Uf6gv5ZPRsAWCmuT51/HbLf8nIMjvkeWL0Mk85j8lGg9Pi0gOAwCWDjFCgDu3y
	 6TxcxF+bHMuO4vKJJhx7wnnesXvRYiAgn0KfMbbQ/YLubx23FrX0fw0/tylzE1E8Dn
	 T+YwPywk4IvZw==
Date: Tue, 26 Mar 2024 20:09:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
Message-ID: <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-15-wsa+renesas@sang-engineering.com>

Hi Wolfram,

...

> @@ -570,7 +570,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
>  	out_8(&cpm->i2c_reg->i2brg, brg);
>  
>  	out_8(&cpm->i2c_reg->i2mod, 0x00);
> -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
> +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */

I2COM_MASTER might be coming from the datasheet.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,

