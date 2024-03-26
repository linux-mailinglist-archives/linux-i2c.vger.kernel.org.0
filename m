Return-Path: <linux-i2c+bounces-2584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DADAF88B5DC
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 01:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2187D1C3464D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 00:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7871036D;
	Tue, 26 Mar 2024 00:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPDQ1q1I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D94163;
	Tue, 26 Mar 2024 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711412045; cv=none; b=Ru5D76da0DkMPsNhSysbgOHwo7e621P1Ej+dyq/J7FthvvnCAUfT22CPB6IhktogTMBl09DmVnYMKEPLbqCe46qObpb/L+OJrEP4fn8fNdm4hGPVznOIcbCz+LuxuaX4oPfE82+RPPkasrhOxadJF5XVqA1XatIWJ+HtCorZ92I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711412045; c=relaxed/simple;
	bh=5Ew7SVGoPQNufzchuzWn/RSZ09B5I/8cONj+OMZYOYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ei+6G2pLTqXMfG9rNKXfRJDa2JV1vLvRJFBPn5MrNu9sauk7CXWe35aIlaclz0xMoCvK2U33OBLFPRhIoBDI/vY5MpEAfqeI3oMuMJDIOsDB8/0rNXBTrQyaCizf5f6FmDpANS7fmqqq+LvrNbwO189sxJkzp+dSxm6w3SzmUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPDQ1q1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62255C433F1;
	Tue, 26 Mar 2024 00:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711412044;
	bh=5Ew7SVGoPQNufzchuzWn/RSZ09B5I/8cONj+OMZYOYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPDQ1q1I3qH1HPzgQyKBO16KxEJRe0MgnySDWYUJ/QznHl+gxoe0PM986HqFvREhx
	 RiM0AUMpzA1wmXHmpBhsx2uYGm/hVw40kCY5iWZaeeVlWdTe0QdtQn8PFvnsO5a44y
	 f0+PWZIK7EYEygIqgHM+kpIvq5PPHjt1JEq+hFmQmeLAoQgH6h9Yu25vzMmwvH5EoL
	 4BJD8YWRXqe5aauNkrmn2QIhxPusLIg9JISbe//ptlvwBa1SQjK+bGFB6+URS/wkwk
	 jvWHMp0guPV6rwz33SLZ9XkS3ZnNdkR0oddrgABuxRSLfxngRxIKqXTUEhyA49w+zi
	 qWi2ctiKKZBuA==
Date: Tue, 26 Mar 2024 01:14:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/64] i2c: amd-mp2-pci: reword according to newest
 specification
Message-ID: <wwqdyk4gs3g2mqx4nwym2nt26hnhzgbqo54eeclas3it47hitc@73giiyw3i3fb>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-5-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:57PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

