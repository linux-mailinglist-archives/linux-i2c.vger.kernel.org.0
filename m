Return-Path: <linux-i2c+bounces-8733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D49FCF3F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 01:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12424163938
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0283BA926;
	Fri, 27 Dec 2024 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbHgXstJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF138488;
	Fri, 27 Dec 2024 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735259037; cv=none; b=QiNHr/L4K33xk4vmv1NxyYKuWMyv3QE7SEqzKMUboa09LjFIWf6xcUcNG3/aHiX+4Mz/AtCStzC35TCd5H5Swr9T7nGn7mwm5nQRBb2snzMruZbEKh+tPsGVtJ+xqxis/GM4P+2mwTeBniy3gIBRKth57U/3uUfEA6EikuJwOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735259037; c=relaxed/simple;
	bh=bdC64JEqygqPj1fMhWAgcDjvF2NNbz78KPdpboYXnnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svQ1WzwesQbX5rfqhI1MvUDQC3B/U9hd8bIzesL6FZJRscacBZn0Ky9fO+n9W8Bk8acq+LEXbul27e6Bzn0oYNglR7O/er1422L40WwwdNCUcMrMqCR54XCB9yC0mYeMU7k3bY5KtxfymRgtpN4Z13gcz8ywkZzdxCQTqg29xZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbHgXstJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A160C4CED1;
	Fri, 27 Dec 2024 00:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735259037;
	bh=bdC64JEqygqPj1fMhWAgcDjvF2NNbz78KPdpboYXnnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbHgXstJuowLKqXXKfVWYRRtz1WtdJ6CfKkPHH648iKCLLDmv4BRww3ylTuAPm6u5
	 eHxtFs1xrpo2XlI76SMqyBIfLctycZmdjq47LT1dDFQDuj/Blyxpr6MHYlcnzyT89P
	 hA0kwW4OxO+M0ziZ+CMY9IuYpU15MrTdltGqfiA5E2yHUbSLRm04s84eWnODMPXYDQ
	 e+ihKJ/pibiSNS5O4T7UxNCaAv/r9pEw/L8NQbp9qRiDW6D/vI8bsQdymH0XVkE9qa
	 hslboSUlo4Hia2UACpRW2eCAgKCGryGk4rM4RCsizWKSlqyr5z1BoqZJfoNLlNwW0q
	 jIYBb2uG1hloQ==
Date: Fri, 27 Dec 2024 01:23:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jdelvare@suse.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: isch: Convert comma to semicolon
Message-ID: <dlolqp2s2tfd662iu5ypjjtgzsv5brx2wuwnfposoctxvb7jsk@wlzamv7su34z>
References: <20241126023839.251922-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126023839.251922-1-nichen@iscas.ac.cn>

Hi Chen,

On Tue, Nov 26, 2024 at 10:38:39AM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

merged to i2c/i2c-host.

Thanks,
Andi

