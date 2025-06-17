Return-Path: <linux-i2c+bounces-11511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8814ADDE5F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 00:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996C617F05F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38109293C57;
	Tue, 17 Jun 2025 21:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZduI9lL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17232F530F;
	Tue, 17 Jun 2025 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197595; cv=none; b=JEvL9rqGhYdS3D9AiRRi/INOZYklApTSiURYEq499m6siEtvFMtT5ON/IkIr88y07vAzCSwKvmkvWUaGFtyMYjW/7XYgWp2sJl9zUOjhd7hAFcFcLM80ttltjuYSL6MMzTcsqKftigVFfacejvBvxsGL84HO5uoEOvPmMhQ4O7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197595; c=relaxed/simple;
	bh=xHHJixx3Lxtq00FONQcRlica1C/F7ozio9W9iiXkh7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOGnsh2o0awGNlsTBlcFZdlxgMY5BaLFOjRtB3DfyXOmB9Ib4qZhTdi4bisfSmCCrAVvpVWczP+tncaknVYStPPQD9nzsPsQnPTEwwrMTD6Hay+j/1ocGqRCsu1EUaaA+EI0xBJ/iqEnFper9hHbgrus8MRZ7UAWkcw3Re6jXnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZduI9lL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42247C4CEEE;
	Tue, 17 Jun 2025 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750197594;
	bh=xHHJixx3Lxtq00FONQcRlica1C/F7ozio9W9iiXkh7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZduI9lL6OMAMscActEx013XDU/ayDjOiiDBPbZEjoDIV6gsYdfGEIWe37onzI9Q/
	 2xP5OAubN2dqsesmxEd/kbCxIn1w2r6CStRV4E3w/IHvAlzZg/O7Sb8g/ta4/7+ynQ
	 8HR1V4DBam6pQmIRp9PF8iTU0aDqrG6GttY2MhTO9URNoNwSCWw4+Dw6s+6KqRd0Um
	 jGslPQWP3GHJtlmkVDy3hF4aLKev8S3snfPnCcmy0UGDqpVRTQn4ATp17z2pGa1Ecx
	 oUjzib5uBz2+l18YDB2pU4BBUfla+Z7Vtq3Ipvyb9vQ46pASRgfhhMwPGAwpQfLihq
	 kk4Yn85/w71/g==
Date: Tue, 17 Jun 2025 23:59:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, troymitchell988@gmail.com, linux-i2c@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: k1: check for transfer error
Message-ID: <ivxsr6vvchk4eiih3mkwrmskquywuzit33ibt4hrxwif5k6h3z@rxx4q2jhrrli>
References: <20250616125137.1555453-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616125137.1555453-1-elder@riscstar.com>

Hi Alex,

On Mon, Jun 16, 2025 at 07:51:36AM -0500, Alex Elder wrote:
> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
> complete, or if the hardware reports an error, it returns a negative
> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
> 
> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
> which is the i2c_algorithm->xfer callback function.  It currently
> does not save the value returned by spacemit_i2c_xfer_msg().
> 
> The result is that transfer errors go unreported, and a caller
> has no indication anything is wrong.
> 
> When this code was out for review, the return value *was* checked
> in early versions.  But for some reason, that assignment got dropped
> between versions 5 and 6 of the series, perhaps related to reworking
> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
> 
> Simply assigning the value returned to "ret" fixes the problem.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

