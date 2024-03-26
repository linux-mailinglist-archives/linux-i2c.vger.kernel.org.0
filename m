Return-Path: <linux-i2c+bounces-2599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ECC88CCE3
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA462E67C6
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 19:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F9B13CC65;
	Tue, 26 Mar 2024 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rw71i3CC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BF1AAD3;
	Tue, 26 Mar 2024 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711480609; cv=none; b=BJ4G2HUYew+7dUNtq9Q3HCwqMBjLqerBy+6G7O/0ZgoIdGGjeISi9V0/tLAHQscS/tIHJbyuch+0X3RYnLURL/6nKfHpm+HSy2PMiqAQxSOQo+/LCtdFTS1v6jbpvWGRDMwh+CfOPM1w4P/6S6lrn3N1TalpLZ8iRI6VQMO+Mh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711480609; c=relaxed/simple;
	bh=WwVSE7IIIlwy/au28BxbBj4dP3195qNKkQcUeZ9/YQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTsW9XVKLiPzeQUBn+kCc3qUtPaZ+9BCQR/SXuDmvS+XjBo8Nke1AaFXpuLkjyg4L0FcFiwazezmwdEMBFpBz7tBTR/2IA6DA2c0nwylyVBaVvnZfnerTz0pBu2JCtHdiJXOSKbwH3XYQrw4HLHcPLnw+/07/3uallOSGTsYk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rw71i3CC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038E4C433F1;
	Tue, 26 Mar 2024 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711480608;
	bh=WwVSE7IIIlwy/au28BxbBj4dP3195qNKkQcUeZ9/YQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rw71i3CC2G8MBX8x0c8JIUiTMN5DgVuX1nbu/2CEgwo4XmIJBHp2v2PRcV18iHDes
	 WYxxAIk+N1/NXr64Lkd4mvSnLAqtRiocWJf46NNv+LDlakDouKeugHs+DkK3TCr6zZ
	 FxFHQ5HloBvaTX8GevU6YEv8fi5F16levjlxJrxrvl/IT8xpnIUSFDsS7sKHuRZ+Rh
	 eUhXMfTfJBBq/52zEOBNx89bdXKRPNg503K7Jf1Ml6nrxArsuFyHSTnl5Cwq+QXOtP
	 SGAG4J5DajjQtJSMtESwnJCVtDU742D9eaCov4ry/jnokpZ2CP/2rMj2+BiZQKHlKE
	 DKVtqWTXJ9YZw==
Date: Tue, 26 Mar 2024 20:16:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/64] i2c: dln2: reword according to newest specification
Message-ID: <lssnuybdb3hseqomfs4qk6ocoiencoau5aomzwj4nwzbryr4bx@fe6ylfhmabev>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-18-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-18-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:10PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

