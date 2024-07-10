Return-Path: <linux-i2c+bounces-4862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D150192DB5C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DCD0283BA1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F71813D509;
	Wed, 10 Jul 2024 21:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQGzgeeR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052112CD88;
	Wed, 10 Jul 2024 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648688; cv=none; b=Jo73p4CgdiUK/JD5BaMmfTdbi8DzrAhIgy8k44Y2AJIFqIiK5RDoz4w94EuEdMuaqkxnFpk7U05TD5aa8MiNcPa5wAIDkg4MVwCzdwo5OpByKF6+vFBh9uhV7eQb99nc/yDQ7U112g0CRoVX9bunSqwxNGEAnqBJ6mnzdjNLOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648688; c=relaxed/simple;
	bh=NV0gXaOwD3Y5HDr1JtQAq9Xb0yENZkV4ubA59k+eZBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLiKzG+q79lUwgm7Q4+i8kyZJd87mqOOBYLYm+KKJKs3vSQfi+asWql87YXFgDffAcj/Zu13V4/uCAKsXtmIVO1RCClwTPsw9tlD7TBgzC9hzrXNiXELwb+oe3kV/T7/JfwtoJBDeqogmc4IxZDjItiTQzoeYVWSFcuZlCJSJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQGzgeeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BBFC32781;
	Wed, 10 Jul 2024 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648688;
	bh=NV0gXaOwD3Y5HDr1JtQAq9Xb0yENZkV4ubA59k+eZBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQGzgeeR96xyZX3fVyH4xCgzECxr88mxCKn4TzvlOFoCJJPVglZGM3SYotUYhXmxL
	 oXEbi9dz40cqQrerkXL/Zh87Hux5Gez/5SK0JD6OdVBjFV49eKdwUvO1flwctnad5V
	 mqiitiMrsytp3+W0it8glIi/wb0kIA7wq0LTBb+zME+NOVt/ps/WBCJSbioiibOB9e
	 ZQDss//EB5Tqk2XFPjQYIlov/lvsUmVVDDxAqg4UKwiU0b5A1Tk1Z1x/TFfvNrZFT5
	 GJzbQuAG13sVzjj2y7YLRnWyyhDRksv5l+A9YXUKjrfJ5JTBXV6ySkMmrV9/rwRieW
	 IVrHucZ75By+w==
Date: Wed, 10 Jul 2024 23:58:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 30/60] i2c: mpc: reword according to newest
 specification
Message-ID: <ce3fze3c7emyadesvn4zcgiafo244v6gfl5mvh24uktrwfohrr@rdkz6py3vdqn>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-31-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-31-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:30PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

