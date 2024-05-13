Return-Path: <linux-i2c+bounces-3479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A528C40F6
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 14:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 342ED28797C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 12:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34EB14F9DC;
	Mon, 13 May 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nt8tuW3M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A514F9CB;
	Mon, 13 May 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715604452; cv=none; b=MYi6r3sPRFRqbxCjpk46Ccn8HUT7HLvksF193gcozTk3/BoZFXK7tLkuzzyrn/jLqywMK5yyr9YfjXJZhBHJg8Dqdp5UOR78U7dL5unCUiUrpRO+afJLV/9RI08EDR48YplMn3ApODVjSeBqJtWpf7CARjl2jC3ICETJhN/Hs2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715604452; c=relaxed/simple;
	bh=0HltB7Wu15exFPm11GPbS4MlerrEk7eYgJypSOVemfE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVGm9NBYfUNSQ5+Mazukl/AkZp7lDMuzNY8BPOZPWAv4z9e5oj+CvPFuJ+I7NES1rWIQ0UndAOdW2xonz2Z5GB5UHnMeFVBlyke55DSTmJ6N3nUJDpWMh7wEOsko7Ifu+kupmH4RSLuYvuowjS9Y9dKeJyGF/igcO/bKKxbjX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nt8tuW3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DD4C113CC;
	Mon, 13 May 2024 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715604452;
	bh=0HltB7Wu15exFPm11GPbS4MlerrEk7eYgJypSOVemfE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Nt8tuW3MMhJ/S22qCuApLtQ/R/SIT3ww4JArIvApPqtcJsdahxErQJfKfP/40wVKw
	 VGvPVAPotjVXKKEHvRRMEiB4oIstfpPzY+2TJKQLX1J3vF8/tZMco8edQff0lHJtFO
	 Hv8MZOcMaZ9ChOkVooipZFZYb/21aKdY7Bk98dDTzzrM/R14VzRXGzCvCVFLTBLNO5
	 8jlZlX2yA3fJUM/N9lwsfH3CVLe+eYQWaYCTngG2jHLeyDfjovYFx+i7L8w9psfnYH
	 TTabwTDedaEAVMzoAI5b3G60u8CqPk3WC0Cr4FR97MaBZ0EAz0YkYABFmMOjdlM8Xn
	 eLUjwbIXh2PfA==
Date: Mon, 13 May 2024 14:47:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc8
Message-ID: <2mqgax6smctnfpkelum7sbz2ukqraankpudjig3sv7cwx2bgsi@tgslonensttd>
References: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>
 <sadxp73tm5zhfgsv6ufroexcoq4cg4j4quljry4bsojkzniw4c@m5mhet2w5f5e>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sadxp73tm5zhfgsv6ufroexcoq4cg4j4quljry4bsojkzniw4c@m5mhet2w5f5e>

Hi Wolfram,

> > after a few weeks, we received to patches marked as fixes from
> > Christophe and Sai Pavan.
> 
> Sorry, I was away this weekend, so I couldn't get this into 6.9-final.

no worries! Nothing seriously critical was missed :-)

> Yet, I think pulling into 6.10-rc1 and backporting to 6.9 should work as
> well.

If you want I can include them in the merge window pull request,
so that we fix also one of the two dependencies there. Then they
would find their way to the stable kernels.

Andi

