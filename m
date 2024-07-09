Return-Path: <linux-i2c+bounces-4806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA4692C5BA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9001C283C2C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03135185636;
	Tue,  9 Jul 2024 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyVYuDIF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109A185607;
	Tue,  9 Jul 2024 21:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561873; cv=none; b=p5nYsg8hcOPUbA5jeRQ6837URe5cz84mlMe7stefSeepKfXm9qlLZTV1icfiVv28g6rWi0Mea1RnA5dHEdzN4IYuog0ZuFl83V0Xlp6zQnpKzJKGX2QRtUb7NtoeLgq7h0SQ8BBdku+hwRJl40HpC88t062yBHIBSRNZRvoYHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561873; c=relaxed/simple;
	bh=1piiYTe0f9BaWEToG4585Q+WJbCV2Nzt0TnyV3dJgOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc2Wj53QM9J1hLdnlNwFaJTb4MTndqhzmf4KoU64gzuNHJbWMWVzinPa483teHhIPfjWFj7LRzCjd513rJnBh2CZemHNgK34jrVvwUyNWd1K9oS1YjRCeVptfuDoPH6LqXwxm1Ozy0Ttuqpgt6JElzLY2YHuV8CwN8bedTl2wOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyVYuDIF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA351C3277B;
	Tue,  9 Jul 2024 21:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561873;
	bh=1piiYTe0f9BaWEToG4585Q+WJbCV2Nzt0TnyV3dJgOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyVYuDIFOecwYgRI1BWGnGRrR24sBMyKaYywY/cWUYqkQ3GE2NGoXOPbj9xiCiOgb
	 o3J8khkCZ0yJdWzYBNmt+uM5NoxLEkL5RA6NhqQ7e2zdbyEtWLkqlM66TKdgcaHgKk
	 oW2SDOlqMZG5f5mmWOF1JI/fUmSujGVAAJDC/R9Sh/Mfg+S9H/D/njCBs7JOBwUAep
	 2UP5+yb4+SmUQTne+EhALwcvFISLLkZ11V8Aup0SOUJYyZpgIPQv9j+GizQx942Ylk
	 YRQQ2J/C7MVmTXWOR1gsnnpR5GLJUEIrqIfTRNNfS6BYlAzLn297i71UR1nwWqg0El
	 385HB/GhE2wsQ==
Date: Tue, 9 Jul 2024 23:51:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/60] i2c: au1550: reword according to newest
 specification
Message-ID: <kwvorx5t2aigc2wjwhydohiuqigmg5vyigwahew2irxnd75p3k@bcj4s2w5sny7>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-5-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:04PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> Remove a useless comment while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

