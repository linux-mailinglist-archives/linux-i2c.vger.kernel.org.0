Return-Path: <linux-i2c+bounces-7513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703AF9AD820
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 01:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D2A61C218DD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 23:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BB61AAE3B;
	Wed, 23 Oct 2024 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHLNPOqv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F31448E0;
	Wed, 23 Oct 2024 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729724555; cv=none; b=RITlMpt1AfbRYcQcXgGxi248rdiDeCcl2ySzp4/IMrXUIaI6oG6n7otnp/9aMKTIkGQ0D4wDsDtWpFWGumkqDuYGA3sRnlF0FbAEpbShUbhGc66zerBUknOeuS8kFw7woZAnjR/RiFdx8gM+xsnAdfwXfBhSqhHI6Ska1aSEXn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729724555; c=relaxed/simple;
	bh=RGxd1oDBZsPtZlwMs8LayJUJGUjc3awH4V4/6ovlkmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBo96fYphSHuNo6EvoeXGHk2vI329JloYmHt7ytF6gspngwvwNRjSQZSVXSer9ZVLoQ2HFq9bcpsxtUiwEIrDdc2KR9JEuLRLzTCMpohwN5SVA6kCvR5+vfQoLRJeLyn8pCRRzAjehtKaT0+tiAyBzq8Qu3rpHFaG220tUBkjo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHLNPOqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01FFC4CEC6;
	Wed, 23 Oct 2024 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729724554;
	bh=RGxd1oDBZsPtZlwMs8LayJUJGUjc3awH4V4/6ovlkmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHLNPOqvXG+Vd6qBXZpToQ+nKOjAVqzX/Ee3OaBZvqTNt4e5QI+AY0+MtLgIKkfPe
	 CEtzVg9/TkOnVmrJ7zjWGP/OpSqZQ7zN57JRrCNqLjw7hbnEGcGPTKVCClK9XWR+jb
	 GKNOIEGj+pFD2/rOXERrSsHeMklNYlshZF80uVyTnmdaVG2RLMW6A+SRCeFY0Wd67e
	 xmhq9Aegd3j6/4f8izorTAze4VFqQqApvhnTUN9QnE4sU9w11ZTGojVikmz9MOE5C7
	 YuCRFyrPjRDb/LBrEqUd2Ex4HdIdf6Wf0a9SlAchk+IPkY+YVPxTtdlyklp8L5j2wH
	 z+VxOiqzAZKgw==
Date: Thu, 24 Oct 2024 01:02:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: tharunkumar.pasumarthi@microchip.com, 
	kumaravel.thiagarajan@microchip.com, UNGLinuxDriver@microchip.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: fix uninit-value in pci1xxxx_i2c_xfer
Message-ID: <2nyxcv7yearclljgnqrrrobburq7cvqog46ct56lvtn4zux6z7@twxxpmbuce3c>
References: <20241022190845.23536-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022190845.23536-1-surajsonawane0215@gmail.com>

Hi Suraj,

Thanks for your patch, but...

On Wed, Oct 23, 2024 at 12:38:45AM +0530, Suraj Sonawane wrote:
> Fix an issue reported by the smatch static analysis tool:
> drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1030 pci1xxxx_i2c_xfer() error:
> uninitialized symbol 'retval'.
> 
> The error occurs because retval may be used without being set if the
> transfer loop does not execute (e.g., when num is 0). This could cause
> the function to return an undefined value, leading to unpredictable
> behavior.

... if num is '0', then we would never reach here, check
__i2c_transfer().

Thanks,
Andi

> Initialize retval to 0 before the transfer loop to ensure that the
> function returns a valid value even if no transfers are processed. This
> change also preserves proper error handling within the loop.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>

