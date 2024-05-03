Return-Path: <linux-i2c+bounces-3408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777368BB36E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29EE51F2395B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BD3126F33;
	Fri,  3 May 2024 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZui5+Gb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB96D51A;
	Fri,  3 May 2024 18:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714761991; cv=none; b=KlbJcVIHleOILW7QydbSryKmfEnk+ziHdlnRI8n5oDgZynZblv6ixBFFXMtH8I2DyYrsAdedakCZXibRtzkgpIvPIIGF4j79qi6N2gjszxKcVz+BdIg2igUxUDw1EYHxvelmhY00zPW1wmyVD6iFn/txlKs30XBp1YmzpxmuwtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714761991; c=relaxed/simple;
	bh=JN/gs0/Qe33+SX0hwKyUGA39LsR6bkgl+VsLQ+TeMBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcUnq1nvop8SvGbwAcQpOefrw+X/3csXM0sUurNsW7TbRrxTQ4yIqxZT/4P6XYpgXHXIU3oc+P9r38lvjS2o4eydhzdn5NSziTdiTvEmjViXe+f3/0gC6EJPVTjowWzeQxu3jC4jiZVJ21H/x4wx8m7Goet9nB7rJc1GQ6XDagU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZui5+Gb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8FEC116B1;
	Fri,  3 May 2024 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714761990;
	bh=JN/gs0/Qe33+SX0hwKyUGA39LsR6bkgl+VsLQ+TeMBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZui5+GbD4E6SzA1y3Rj0d+mgSc6mcKRqNsfjUgLa3ya/JUK6skEln68/qwBiLwDn
	 3WeUeo+tQJXVCHBZzg4ckdRgG3NCDRphrBAcutUFa500Msf+cCUW1AnX2pwf/TnKms
	 UiKJ5ffQ6xUeO5B3WQzXsPSa0nkfgTHIwA53KRzgFKmQSE8QUolj/t/VwcTibU8Y8r
	 oWj0kyc436SFTRWdSxxPJms90FmsXG9ihqfHW41Dz2pCyz4r1jkvn1spXw3uu/Fl8W
	 RbMtXm18PhuVaR7oXgkIAf8mqT1DhOSh0y/JpkQu9Dmm2Uxiu1UeM4tyehKlXXAfut
	 k9rSGZE4TF6Bg==
Date: Fri, 3 May 2024 20:46:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c: cadence: Avoid fifo clear after start
Message-ID: <c6knga4tuouxir67pzisf64oxfhcy53utunvxz53sbfg2zxfva@cj3r26sfudzb>
References: <20240503094208.296834-1-sai.pavan.boddu@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503094208.296834-1-sai.pavan.boddu@amd.com>

Hi Sai Pavan,

On Fri, May 03, 2024 at 03:12:08PM +0530, Sai Pavan Boddu wrote:
> The Driver unintentionally programs ctrl reg to clear the fifo, which
> happens after the start of transaction. Previously, this was not an issue
> as it involved read-modified-write. However, this issue breaks i2c reads
> on QEMU, as i2c-read is executed before guest starts programming control
> register.
> 
> Fixes: ff0cf7bca630 ("i2c: cadence: Remove unnecessary register reads")
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

pushed to i2c/i2c-host-fixes.

I will send it for pull request next week as this week is already
too late and I want to see a few rounds of tests before asking
Wolfram to take it.

Thanks,
Andi

