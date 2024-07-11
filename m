Return-Path: <linux-i2c+bounces-4889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C092E1B0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48C361C215AE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351291514C8;
	Thu, 11 Jul 2024 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3vTrwpa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD014039D;
	Thu, 11 Jul 2024 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685455; cv=none; b=CUbpiVBOWKbfwqrEIzQh2u+/BvdKQ3TGHGW31Pl4cnN0+hezpvc/93fzavfwJt2IBgfSXi52Gn5CSqYnjh4ION3uolVlJcAjyVQ9+ZqDM5pa8G2yuwOkwnb5oIZ3mBiEIjFnwngpesjq8a6J76b9cQIERpLZqbyXpl9ysZc/UEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685455; c=relaxed/simple;
	bh=oVrOjslKxdwmihaus/WCF3rIzGyOxmyGYoJtp3yHUqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iskd7I8/qkfX0CTNxYPvuZ7xVLjXopEJkG97qe9zq9tNWkSKfKKBXVoAQPko5J1ZhC08LatpYfIwdN7LNqj05akFeQU+u9O1yYdXgo47+BJPYguWKFCjtBcOsaCcguQz3/1BQzLzQXbzAm1Vn1iKb5anT4I8Zyl61PDD3ieo8zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3vTrwpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690A1C116B1;
	Thu, 11 Jul 2024 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685454;
	bh=oVrOjslKxdwmihaus/WCF3rIzGyOxmyGYoJtp3yHUqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3vTrwpaIyDnKVDGlnOpWp4DFI8zs+STOmbjbwO7p+4mFvGQOFGCNNw7eHZSqRIXA
	 MILgTA8NfX9lFKtGSE+ePyyD0ZbWmMQdat0Nx4QBFUdMBozoj2BlkSbN46f/J3iZVd
	 qpKBijXyQHIGomfuovtHdSSd/CnAE2uJs8GuVJanZYx656gD1fIK51MEWDRxCOjZfp
	 vHuW4obuXALkIFR4K71Y+FffkXDp+bbqNn12X7PyKvuNRhVq8yKK4tmo2+7iPoor02
	 SbNhCNcVdEtTJRpx/mzOyFsM+nlExC4+M67YiRab2YUnjxgPEf4YZlkzt7r6Dvd/QX
	 eO8dHWMglEYPg==
Date: Thu, 11 Jul 2024 10:10:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 40/60] i2c: pxa-pci: reword according to newest
 specification
Message-ID: <t7blzroqooigu3jdt4zfzo7vzlbsynbdsjxj46ciq6xlzk36tc@4c4rvlkitgl5>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-41-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-41-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:40PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

