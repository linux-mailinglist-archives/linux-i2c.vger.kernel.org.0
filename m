Return-Path: <linux-i2c+bounces-1856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F00859E95
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 09:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B601F22AA9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 08:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFEB2232B;
	Mon, 19 Feb 2024 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daeeOYAi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE72231F;
	Mon, 19 Feb 2024 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331991; cv=none; b=lrsSORjW0084qfRFc1yAfKuv08kEp6iZQRYBMBegh0WZK3EA1Vt19tIJ4uvmznjke8nXp85AuVjUQ7Jlp2UeSTNsdEjTl3MY/7l09/PaVxNzJIj9OvmeaJiOG61UhKflyum7rhX0dXSPHM3bAuRZYeRVzIrjdCBsOl2KQPYZUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331991; c=relaxed/simple;
	bh=olqhS/G2TVTBlXVvd0te8wNwkiJVDXBrE8Df2z0dXnM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmAJdn3kHWCrn7qx/A3p4GvXWOPA/8uTt2GQsSV+Vp19BnuyxdAd4sMT0cfh3SDmvr0dx5cddXa965BuP2PDgmCy3w2Iy+GF7bAqQZ7pFl4iroo/MyIoJMqBheIHJXDnJjmm7VVnaLwTQHUa2HrFW0NberJ1gdbFrnlC7bYDqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daeeOYAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93ADC43399;
	Mon, 19 Feb 2024 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708331990;
	bh=olqhS/G2TVTBlXVvd0te8wNwkiJVDXBrE8Df2z0dXnM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=daeeOYAiZwHPzrS3SyYAuP3SVK82c0rBNspJp50VzE7Q2uTnlSiaWkhmuQ5UIFnzS
	 JVa198kKHGnqYCqsO9bjl5Ytfd9S7G0qj0uAH6INCUma8iXlNIMdaZeLuJ+Z8gS7eQ
	 MQ+GNFfoHnNime7mI56c+Y9Cq77PI30qEnUTdI75BC74Rqp37tKx2vbjWuf5aG7wfN
	 wJLENK5mVktHDcabAF6Cp47ENFrvI/UAG25jIj+eMlpzn1gWsNiFYYfLjaXbatD1fw
	 yJS+S8uzrgcLoYDbm8T3IgsXxr6uGYlkxGfiR0LHDFOHcKjTopSVWxS20gfcwkBJ9+
	 Y15Lu3Wi/4dAA==
Date: Mon, 19 Feb 2024 09:39:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [GIT PULL] i2c-host fixes for v6.8-rc5
Message-ID: <azsanymo2xazkxs44y7aewvavb36movt3a3uvy375exnegu52v@he2thh7jrf5w>
References: <6utwghfmlmpaasdtoel5faalrrnfhyg3iupeditg4w7bgd7g35@cxplq2kipgfb>
 <ZdCkBV793vDud7WT@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdCkBV793vDud7WT@ninjato>

Hi Wolfram,

On Sat, Feb 17, 2024 at 01:18:13PM +0100, Wolfram Sang wrote:
> Hi Andi,
> 
> On Thu, Feb 15, 2024 at 08:34:28PM +0100, Andi Shyti wrote:
> > Hi Wolfram,
> > 
> > This week, I'm submitting three fixes: two address hardware
> > issues with the i801 and qcom-gen devices, and the third resolves
> > a compilation error that occurs when including both pasemi and
> > apple i2c in compile tests on PowerPC.
> 
> Thanks, pulled. buildbot is already happy or is the report still
> pending?

Buildbot was happy :-)

Thanks,
Andi

> Have a nice weekend,
> 
>    Wolfram



