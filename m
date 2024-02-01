Return-Path: <linux-i2c+bounces-1573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A88451A2
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651CB28E4EF
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 06:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B7B157E89;
	Thu,  1 Feb 2024 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vv7kmf51"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043B14D421
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706770178; cv=none; b=OCn8pb7atJjLo78jWVeN/UwY+QrArLszKgPOpMPYrudSAsiL1U+UaFa9oguV8jzS8q7VY5VAWTsfT4Uf5AaJYHrwt9g+Nm55d4Yk+tQOOy7UZADcRZXlIhMzq6hhjtDpFcw/HGEOI7DBowmz2Rwo0PdPOajVdnZElI4cM1Z5tGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706770178; c=relaxed/simple;
	bh=V4IPa1lu9WXUp42TjcTjMOO/nmMHV78Kixq38PEVpvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqW1WrzUAK3cG1/Z+FzmnQLMBt797XOAx38XxiOPwzP1ZN6yEYDeourvA7OjbmQOqQ7Mwgi+aYRDzp32b80HJkPMQEKoVX8aAkoS5JZtb6hcL/KG4HxQ+ZRck++O7mam+1ONrX/Djx4IuLoxN0xopMEAp+lLtrA2DwelNb8/z2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vv7kmf51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A8BC433C7;
	Thu,  1 Feb 2024 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706770178;
	bh=V4IPa1lu9WXUp42TjcTjMOO/nmMHV78Kixq38PEVpvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vv7kmf51PFEzgHoemxnU3+ESg+ADjnaUEqfA6V2qCJyM7hfci1FlnERpRXnQdGA16
	 bIQm1Fm/NXeyyHV/BA/2+RTDh3PMHizMUepvydlWaKDJ81c+C3EOwgqhbF7fn/jaWJ
	 78Pcz2EzWeuUPec/Tzhbvy8lk3Gw5Ga3/jI5qdXtJpfvfY8C9Dtwib51ViotcxGAbu
	 9bxGq4Ee5kq3aic4fojlt7MA+8hhgLWSouh38+/3C5TpDAD3Pyk3yvYyMq2m3tWGrq
	 dSA2AxHnlh8ucD88wxr7vC2ly3icPte1b4ywqgyMzqNEgLlVwzjbzcPGxkQCAjweEE
	 QMfr/YaQ5JbMA==
Date: Thu, 1 Feb 2024 07:49:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Devyn Liu <liudingyuan@huawei.com>
Cc: yangyicong@hisilicon.com, f.fangjian@huawei.com, 
	jonathan.cameron@huawei.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/2] i2c: hisi: Clear the interrupt status and
 optimize writing limitation
Message-ID: <mjkxuorj3ldxa2yi3axeuy375cida3n4lubfjudw5jcbjfi3x4@htnwzbjw2tl3>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201061345.3111600-1-liudingyuan@huawei.com>

Hi Devyn,

On Thu, Feb 01, 2024 at 02:13:43PM +0800, Devyn Liu wrote:
> Devyn Liu (2):
>   i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
>     - 1
>   i2c: hisi: Add clearing tx aempty interrupt operation

please, next time add the changelog. What is the difference
between v1 and v2?

Besides that, you forgot to add Yicong's r-b.

Don't need to resend, will take care of it.

Andi

