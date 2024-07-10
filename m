Return-Path: <linux-i2c+bounces-4856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB292DB34
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85D611F2293A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE9D13C3C9;
	Wed, 10 Jul 2024 21:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzsAD/vp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC81EB40;
	Wed, 10 Jul 2024 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647960; cv=none; b=hy3tVWh1O5mnfq5rvZMKLaq/vDnqU7D2HmibtCTEU6SvA2/3I3Ggyqv0LptR5//NZnaRzM1ECnfjz2HaZHojiLXLusqd+kXmJUsy2m3Bp0pLrkzvyL3BI6fh5jjn4lgAkS7GNK48V96iQjK5oW3A7oBz5V2/EgsTwHYpbp9MRy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647960; c=relaxed/simple;
	bh=8aUt8/JPNe/fS8ltvU4VngIE9akmZo0nJOxaHEoJVkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAvPjRwZmMC2YqNT7Zb1gcXVwagWecniQ/UG047j/svi+lOo/NYfTTUgejpHergpPXOoFFm4YkOteffcJBOeDRLvl7veEYLHtLkpIAb/41AeprYXZoNNACznNbNE2lTkjOnAUsUotU7XxMbWmS2/xcU+X7KV6GFJ8UsFBtn+Mg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzsAD/vp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D723C32781;
	Wed, 10 Jul 2024 21:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720647959;
	bh=8aUt8/JPNe/fS8ltvU4VngIE9akmZo0nJOxaHEoJVkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzsAD/vp4u58KLAR13WzzFLdnlCAdRW0UkvyQmWCFodkgcj0b0jFUbj0zm4hHiqXb
	 GavlidVT43sV14uBlDBVanKaHhAsln9Gpc9IZcuwDGBBDcIc9qMo1fUm7IuHmst+6H
	 oBCHqRXgrG5y0+u7zzHiOhJx6hPJkZ6Us7+LmWpiT/s1416jMmESzxYjnWF6qeU/Fj
	 Ce6Xs69ixVYEf5DH1QpmUnTsK22iuZH5jVDp9z7eYLuefQVcV1M4Wwm+nbnEG5/Wpy
	 t4NkXlkibHaYXivPeev4R2SUsMPiYuu9CfAskjB2vnUvOptNeUtLS3rMAQds420CL5
	 YK8dl1ZUw8Xew==
Date: Wed, 10 Jul 2024 23:45:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/60] i2c: jz4780: reword according to newest
 specification
Message-ID: <3mclraadkljbbdqxna6tiqgs6wcnnvo3qgq6fz5y4f6h5eudtz@t4ilh4lyr6mu>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-25-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-25-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:24PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

