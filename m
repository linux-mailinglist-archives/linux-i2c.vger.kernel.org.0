Return-Path: <linux-i2c+bounces-8068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE39D30D0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 00:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BCC8282D74
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FEF1D1757;
	Tue, 19 Nov 2024 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n//8KXFk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B540BE0;
	Tue, 19 Nov 2024 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732057558; cv=none; b=TRgHQB0aQX499xYUdyH/r6bXGy/BTzc7gzKSg963bzniwgX/suuE0hDxXnVX2NFpeIQiUNmH0SZ/lXKAbq62I13fF97YHZgnyCvtayKSLAQnipcKmH4RgqjQLN9iF9PBp4jmth33Dsjk1sWKsDuwJoA6abhWLwWiSvYRMOWD9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732057558; c=relaxed/simple;
	bh=OIoNxLDCOzrdaa9jbIZT+h3utFjaNUYz0bqcF6/FqxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rrrlta47aQtKHeP0y6Q23ZJmsXE0yA4GkNEEUvOdywneE0WLZpPtw8Px/t384bREzNDp5/yowhkEp3YgCOnoCTaE7bGHM7hOq97B/ErhWGEQ4748GzBAgElAnZPdkZb/fQKZbSUq9Z3sjHzp3faXWBWLbBibubd1c7YFoxY3Now=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n//8KXFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AECBC4CECF;
	Tue, 19 Nov 2024 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732057557;
	bh=OIoNxLDCOzrdaa9jbIZT+h3utFjaNUYz0bqcF6/FqxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n//8KXFkkiBLonTstOp31vSec6z4+l7k1l01Bal5VonWbRFPTlRhqo071EhlXixsI
	 6myHYmNoU4jdMy8LG4D0Cusng4IBx1QyJIO1YdL+ohsJFwZVKpA7IqgbdHQIVTz4Mb
	 P9S6XBrcl/JgKy6jsJMd9Ol/9/xQTrH61nygqNwr0n1QaeAXY0CM/cDmPNE2WJJ24c
	 txea/HMb8HkJgD5jRY3lqYWZr0WwnjWFuVwLN0ON1PDZRPj1fxoYC3tmckMgfuqXGA
	 QCDjvIFoXBlgwLeZ4Q5Se3cDgNWZdt38+SzCkKV4nga7GwktKGg8iQGhmuwUtusJIV
	 UmJ39In3RJyHw==
Date: Wed, 20 Nov 2024 00:05:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manion05gk@gmail.com
Subject: Re: [PATCH 0/2] Add atomic transfer support to i2c-xiic
Message-ID: <w33x6o2lhqtuboxsw5g6uvvoqqvrdu24i2iatzynl5o5ezfwah@cbxtdne7dr7g>
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011104131.733736-1-manikanta.guntupalli@amd.com>

Hi Manikanta,

> Manikanta Guntupalli (2):
>   i2c: xiic: Relocate xiic_i2c_runtime_suspend and
>     xiic_i2c_runtime_resume to facilitate atomic mode
>   i2c: xiic: Add atomic transfer support

I've read this several times since you sent it. I finally decided
to merge it to i2c/i2c-host.

Thanks,
Andi

