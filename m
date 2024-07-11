Return-Path: <linux-i2c+bounces-4882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D22092E171
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2F3281149
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E3714B978;
	Thu, 11 Jul 2024 08:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpgNdY2K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D631494CE;
	Thu, 11 Jul 2024 08:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684982; cv=none; b=nhOKzirrTx8TymqgmrJV/aBpqEdGf8K5E12xbPy5pimLlaPGrSBzDDubZgBs8+KnkdSigM1SF/EPXGO2K5Z4L0lcidChihuF/etV/wy8Hqo3ZTWTAwGgjfGzTL6JLuvgA7ikAkPIuSXDZDMKDkjs1xPcnMPtzRlgydbWX20D6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684982; c=relaxed/simple;
	bh=uGwWmvl0bSfXvktHymELnZ7mXvZBGKCsP/CZ8wstMTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrCmc3y57X7xOoGcOefqcG/fVBgYL1H1pQ3EFArnOVjMG1KL85me0qfWEEPtoNIx7to7jYi4vk7xNmMoaHJIVsFX/f80ximJgQbFLl8RR3eFApylVqz5pvZgIQGby0/BqwXkCbofpmkXBMuy8vtKQkw/Spsg0a97k+nrdKiaOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpgNdY2K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA528C116B1;
	Thu, 11 Jul 2024 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720684981;
	bh=uGwWmvl0bSfXvktHymELnZ7mXvZBGKCsP/CZ8wstMTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpgNdY2KNa7krgwk+NKzQhwmcp9lv9h2n5zIu1BswGt8kysKyJJp5jCRxvIwU/eN3
	 ObuG2EKzpTVsIXxt/X8LAkRrziJ6+GAu8WvEx9Q4K+tWSsLJrNhcRnZ7pwGhK5teyA
	 sE20rVYlitLhr6WqJL1UITdiGCmQTIH/oC1x+JkoZ8nGmJLxb73ubNLWtshFE0ncs+
	 7t4DkcRfRvpCDiNm9I2B+2/EAYAYyHHJOA/0SJeP2YtmhwPFDSqymACyGAjWIHtVOx
	 MUEao8jPtzu8zOPCBIV8WbcOqH/o4aAV4CIZjzKUqUiSE9RNueRsTD/AXr6pKJtD4k
	 n1nGNf7VGjq3Q==
Date: Thu, 11 Jul 2024 10:02:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Robert Richter <rric@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 34/60] i2c: octeon: reword according to newest
 specification
Message-ID: <mvbk3b7i7qotqjvr5zbvltgxpm7ozog7eyiqqs3stituompanv@a3xnxpvysn4c>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-35-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-35-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:34PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

