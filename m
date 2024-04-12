Return-Path: <linux-i2c+bounces-2912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CE8A2B4B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 11:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8382842BC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 09:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E61150A6C;
	Fri, 12 Apr 2024 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDEH2jr6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A7481B3;
	Fri, 12 Apr 2024 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712914469; cv=none; b=KJtkTgWgN64bPgQyr0YEWfp8DMuayJ/hs3C4qbxbB28/5xB7cYKddJf5WCjTX9C6YKFnvF9eoB9tYbbxC40400zTGk7jBjDnZJ6QFpPC7iApsw/z8m3f5Hxyd6VDDxiwXTsK+lJW+1iSUmqek/LYksC06HHeqAMlKNc9AEVHihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712914469; c=relaxed/simple;
	bh=ekjoYkD7lQOJstANwtqzElMeEHZGNIQrCsQlyIAUsy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyvGg10axQ53b88dSCdYNtC0mJlxVhmse8OWrk8n1pHaeIZZl1WLyPc8hADCmrcDgI5Yz5F/4Ak6QvFBpIti1RWb6mmJ88v67FM4LiOa9SuzZu7FlK688we57ihhwmTgZf0cH9A5D4v+O80wO5JbOON3FLf4kYktV0BYdV4SpME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDEH2jr6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7409C113CC;
	Fri, 12 Apr 2024 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712914469;
	bh=ekjoYkD7lQOJstANwtqzElMeEHZGNIQrCsQlyIAUsy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDEH2jr6VM1PESJtflhoFEjlVl5FA3ewXtR7gPa2/hS+xlWStBBk3fHdG7xJDPtxB
	 h1WeLImKMlpSpJeFks0NPII8P5dV6eRFxKhFScJBxv0Qxt5198uYe/yiO/zal16N55
	 inOeHaNjVLmOpTQlu9oLS7bUVkSNWmx6S2MOvhO5QAiroakjZ+0nsLHxJC3MB/T2oq
	 yGc2SM8FeTpZRQsB0pl0wCHbTj9rqnm+L2BNAc07CdKzwnpAB2hzwv5zi0txuCpK1m
	 MAXgJAnNWLIcPyUATZzv2IuXJC6Ancfwo1+yKjbANA0yxKP3P0E3NRQyOfd7MKajtx
	 WXOZ7CQuI4inQ==
Date: Fri, 12 Apr 2024 11:34:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, 
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
Message-ID: <bfjccttmurk7aajps2m7gcyl532rg7rnlutfhbvupsphxjk2pa@fx5onnkr7625>
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411050257.42943-1-lukas.bulwahn@redhat.com>

Hi Lukas,

On Thu, Apr 11, 2024 at 07:02:57AM +0200, Lukas Bulwahn wrote:
> Commit 20c9819ccd9e ("dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema")
> converts i2c-pnx.txt to nxp,pnx-i2c.yaml, but misses to adjust the file
> entry in ARM/LPC32XX SOC SUPPORT.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Adjust the file entry in ARM/LPC32XX SOC SUPPORT after this conversion.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

before taking this I just want to make sure the e-mail in the SoB
is correct as checkpatch is warning me about 'lbulwahn' and
'lukas.bulwahn'.

It's not about the warning, just double checking the e-mail
address as often to mix my addresses up and looks also your first
patch with the redhat e-mail.

Thanks,
Andi

