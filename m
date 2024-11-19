Return-Path: <linux-i2c+bounces-8044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA19D2736
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F370284A25
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8CA1CBE8B;
	Tue, 19 Nov 2024 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnEK9TZe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8C42C0B;
	Tue, 19 Nov 2024 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023950; cv=none; b=faot9o1onoZCwtctenLwjztrvTw7cCWZ3uc4jqihSFoVAwcuZNN1KErX6JXaaSpnFTjZPKCYeiZtrM/0jQqpFQ+yJxk2YLqqsw1vD8ChxFNvvIUZ6Y7N8NO8AnBRdoOUc9ZGEvnv/sZBP3pcCrWUnwUYvcf1/TVFbauMxkaj2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023950; c=relaxed/simple;
	bh=FR5f/MDG3TjaTOrNjslgx9uw+OuWqMLRgQGRclO3OgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsokZIkcFSEOasHgxlzH0gBJB+IcGx/vYyptqmhtDZ7SpUs+jaiaOR4Mdy7N9v/UkZ5UeF0teg/ujuQVK+iL80zm/R28BzVmzDbLlwxZwvYSWivz0KoY1rKm5eAkr8abRTYAcHwYXCAuJ9fiLqoldibd5S0i3PTKjsaMM0tD4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnEK9TZe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C11C4CECF;
	Tue, 19 Nov 2024 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732023949;
	bh=FR5f/MDG3TjaTOrNjslgx9uw+OuWqMLRgQGRclO3OgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnEK9TZe8OFj5uqDNZCncFFMGIcd9wtM7Fldb7pmobrOiDSzZWcRNEIOaE8fWG0Qo
	 CDEfhCdTI89cyIPFRyACuoja95XNOurXmwa93ehCZk4MAnj3e/2AiajgbaK9QR9DZS
	 AIU3UCjDjTdtR4DmYKfY2pNPv2nvgNP6hBJXfpyktNHpLz116mYJ273mSz6axk4ovP
	 RpdSTqmHf/LL2Eg0Wfn7xbR3ACsiFpckMkIpIOGIHizQ1ROvlHNHr3ACGKCsL+k9p2
	 3IHcUsvHGu/8zVB0jUjvZ9NbVJldz1RKrrtVtAisFFPDylKQSYh9aKNIQR6M7cyp6L
	 FBRkgsOiiMWmw==
Date: Tue, 19 Nov 2024 14:45:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Babroski <cbabroski@nvidia.com>
Cc: kblaiech@nvidia.com, asmaa@nvidia.com, davthompson@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c-mlxbf: Add repeated start condition support
Message-ID: <ji23yczfp75vtu7sp7pots66lr63mxbtkxea27lvc5id5tmfk3@pltlopcoz55c>
References: <20241118192833.346064-1-cbabroski@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118192833.346064-1-cbabroski@nvidia.com>

Hi Chris,

On Mon, Nov 18, 2024 at 07:28:33PM +0000, Chris Babroski wrote:
> Add support for SMBus repeated start conditions to the Mellanox I2C
> driver. This support is specifically enabled for the
> I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
> communication with various I2C devices on Bluefield 3.
> 
> The I2C bus timing configuration values have also been updated based on
> latest HW testing results and found to be necessary to support repeated
> start transactions.
> 
> Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
> Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>

Where did these reviews take place? How is it possible that this
patch, at its v1, already has two reviews?

Please ensure everything happens openly on the mailing list. I
will need to ask Asmaa and Khalil to restate their Reviewed-by
tags here, as they carry very little weight when included by
default in a v1 patch.

Thanks,
Andi

