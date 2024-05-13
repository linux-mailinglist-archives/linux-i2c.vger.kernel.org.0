Return-Path: <linux-i2c+bounces-3481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC648C42E2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 16:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8911F218D6
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 14:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50288153814;
	Mon, 13 May 2024 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOtF1Klc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4D1E497;
	Mon, 13 May 2024 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715609445; cv=none; b=L+uVPPc25QIqcOiwlDM7YdcNqQA1BqAtxjVQqwMXO+HKBCedN3j3oeIJc4pNtDZGOi2a7IKF27OKYmHOss1ChZreM1wCjGwxxTPc2O4zC9k+zNb7jSN/4ua3P4Fvn+cWLgUFR6FKZ72Cc3qBEtKQEfxgSfJG7fUJfxLIObjaoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715609445; c=relaxed/simple;
	bh=ykcRxKTlU5dKa6wwwvG6QhhCGPAwN3uZbT/TRpn+jAU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMCiGlgkUOwURADw7bnIUGy+XhBHHGrphjFlNltJ5XSMTBGsBupgkz/UrKAqQ2o9DxfQSOaXHHN1ZHa8loTL6XRA8TvBeAwArVJVeyezCN40w/6OGQfOODJXlSorq9/na0kDZgNiIMUcuSy9TdNNKI6RdX98LVvqrwr+xgNnKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOtF1Klc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E52AC4AF0E;
	Mon, 13 May 2024 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609444;
	bh=ykcRxKTlU5dKa6wwwvG6QhhCGPAwN3uZbT/TRpn+jAU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QOtF1KlcxDZs1fmPHALV0AAepTs2N0aXDoeoRyGlgBIjnGBtC6tCWIIzMWfFKRpjJ
	 DEvc22c8Iz3E37LyWjIxbHbHWcotJWss12hwVDTKB+JLlisMRgEATqqpXCDneI6xFE
	 s0vCvM/ovnVbGXRmfetcjwlFu8Bkix6Z432n1NkrkzuE/Xj/bJk0O6mhM1VxnAPjnx
	 evSqIRqZBH9UtJq6NnjNfuOm4Xe5NoeUbSLyNYdN6rjA1h+3MNuAHmJrSTklqfRTx7
	 toWLHVG9GufvbyTvaRr+bGxw+UaqJldsV4gUeHIcBs50VmVg204JBV8O6c7ddp9OLZ
	 u7a8gjJCv9IWA==
Date: Mon, 13 May 2024 16:10:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc8
Message-ID: <xcvnd5wld2lobtol3xbx5ir5z7xohnv22xzhvnvijbhgssb4kg@4rovz5mdgal2>
References: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>
 <sadxp73tm5zhfgsv6ufroexcoq4cg4j4quljry4bsojkzniw4c@m5mhet2w5f5e>
 <2mqgax6smctnfpkelum7sbz2ukqraankpudjig3sv7cwx2bgsi@tgslonensttd>
 <20240513135914.ul6nrieeljeuo7rp@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513135914.ul6nrieeljeuo7rp@ninjato>

Hi Wolfram,

> > If you want I can include them in the merge window pull request,
> > so that we fix also one of the two dependencies there. Then they
> > would find their way to the stable kernels.
> 
> I merged now the 6.9 request and the 6.10 one on top. All seems well.
> Did I miss a dependency between the two?

No... all good here... there is no dependency between these two.

I will send a 6.10 part 2 merge request in a few days.

Thanks,
Andi

