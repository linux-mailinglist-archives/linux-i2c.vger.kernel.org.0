Return-Path: <linux-i2c+bounces-4911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEED92E4A9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A1E1F220FF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B89415958A;
	Thu, 11 Jul 2024 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTizhK8s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7C158D8F;
	Thu, 11 Jul 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693641; cv=none; b=KTt9TPE5eAiVc8Sq5PA0EgKof2limtbiTFEDreEpCmMc6yyXH2nmxDAuq7mDdcEsX0ai0EeDZ2+R93r63GaSS2cSEiq2owPy8DNBWgiSU+tf+cYQFDPmBUGT5oduU7fRLppKGyQXh/IEncyFGkVG+3SMuEX4xcBu3Ga5Q+Xhd/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693641; c=relaxed/simple;
	bh=br2oPvo/qJcack8YGF1rzW95/tV0GXKZnlfEf1AJtsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfaSMQkKKiDdLcYGsHqbQL5qhvXyywEBC8x+bYYxcYmUfNV0xNu6GPJXBwuVXzJzoWDAhPZU44lgzM9CX/oCTwlvos5lVI4peQLzsmRpaZcBEtFbr49OZso76TFD/ivcuKKj73MJ519nlOgTqWEz/SF4IaJhoOVfEoe/giv+K0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTizhK8s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A299C116B1;
	Thu, 11 Jul 2024 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693640;
	bh=br2oPvo/qJcack8YGF1rzW95/tV0GXKZnlfEf1AJtsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qTizhK8si0tOtLYem2SPihMdmFtTLRkNvq7ODvnmYDNS4geu6icA7orG1LHHGZ/Qj
	 Cu47Rvhl53Chkc45aY25vupV73JHoW2Q3nFBX+oa9sOdV011TX76u9i0mxsrPGv++B
	 Ki/l/0LHz9CsyXM0TcQa0/0n9s5Qk3HjW9KJgNH6NYerGXpFjarYeOFVE/p2GPv7gm
	 Qf5wRS5ZuRhAg0CyeZqu2PMN8MP6rFdTLSM9ucugenHH1WSxnD6ONNRviUoVf5uBWw
	 A/JXGAdHezjhY0Gs1nlhOs4x5vdX8E1dSqJB+1CaN2CxYgHWmxojmZ47Csk/zkkvOp
	 m5fPK6Lm424mQ==
Date: Thu, 11 Jul 2024 12:27:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 49/60] i2c: taos-evm: reword according to newest
 specification
Message-ID: <bg3xflirv7rrt3ec63l4qvtitwew3fvcgmmorql6p2bq47jqyc@jrwie2oqeq36>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-50-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-50-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:49PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

