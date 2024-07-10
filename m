Return-Path: <linux-i2c+bounces-4826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8871992CC83
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCDC1F22A27
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2068D84A39;
	Wed, 10 Jul 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gc/FTFBJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204A41C85;
	Wed, 10 Jul 2024 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598916; cv=none; b=qOnwQZB2QTv89tSvkUEdULtzugKIgmIvCqMuDgYvpMsjogmhrBJ53T14tTXMMolLyLC4aVC3J9NPjDWmtb2Tvz8uDa2IqNW3CCsNeVF7UqiPo1d2M1ude9ZLbARtf+egFIxJH0VQ0E0yoaPbcCyHfo8SNonM3/dHbx4TXcbKUDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598916; c=relaxed/simple;
	bh=yDtPWeVAofHI9fkwSUu4ZZTovv4/iUQkqh1+++fVNNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFn7ugwwGgv6sjBuYpUSCsZGgOIg5/mpPIaOwQc3Xy98IdYDfde+/xQFx0xgWnd9Lq/mBuQ3HnMm4oXLSC9zbfXjHShJdV7SEVpmaEXJBpqYm2WvtZ/A2fOJruHmhSJoBJrGe+FvCiaBEwRu3w4Mr1UGxEYPTmA0eZyU52xPaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gc/FTFBJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C8DC32781;
	Wed, 10 Jul 2024 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598916;
	bh=yDtPWeVAofHI9fkwSUu4ZZTovv4/iUQkqh1+++fVNNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gc/FTFBJab4Pb55Gmw3lzlt2aUCp5GfZ3mM5iLBj+c594YosT4rqp5EqTWx/R16rK
	 bO+U8g6b8RCivfeITJLgAO+4K85Qk0fwI2CBFmPqJFAckAoQ9jzdjx09iTqdJH4H6a
	 GYPuf+RnqM4eGZPoFkhEhUU9sKbAzd1L1bagHLpYm+djmuuu6J4id71sqzJjebYo3E
	 K5V/8m7lq2+Z3gV3OYP5TUQfNCR/okAuE4XIcg+ZDCucGNJaYoNryQFjOj04hGemlc
	 vDc7AtML3UhYBpap9f0WKIxncVIAAM87/BwETcVRkCtbgGCwY8DxJLZR80+6WnCkPH
	 7zBtk1OwQFRYQ==
Date: Wed, 10 Jul 2024 10:08:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/60] i2c: highlander: reword according to newest
 specification
Message-ID: <3lvxjwmbf2sxmw66wxnuriny5brd63yzfjzuwt3pr62drub5ya@sf6ax35hbts4>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-18-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-18-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:17PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

