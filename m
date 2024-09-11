Return-Path: <linux-i2c+bounces-6546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49553975077
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFDA6B22291
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD880185B65;
	Wed, 11 Sep 2024 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG/MKxPV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763A48CDD;
	Wed, 11 Sep 2024 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052975; cv=none; b=cxukwjeTSFbPGHNDHfCddZoxEWZObygUXbukhJrpZ8HwUtDTSqkmfv8u/6J2ZjthbXRhumRLWFsAj/qN62CZ/CV2OPN9KMeWwJ6tf0ZjUYlc5okEYAcnhdZtIXkIAXqKyVIykI98UIvG1jx3rF3Qc0Z1Ts0/IbW+MdcQ7Ra6HgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052975; c=relaxed/simple;
	bh=cBcrJ1amtZS/iaK0iPVlkhe9kczAFLsMRE3gnlDThco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAbbLs9xCRmgarVW+0hUit8+IZuSYs5/jemMmYUxy35/ndDU9FP+FZXsJLkmNuQjaEFO/+cv+x1kJ/hPBPAiBOOqHmsceJqKe8XCTJNagDNlMkFS1fkJpcLtHz/J9LmYGUt9nrvqAdK9vzVf7lhrLEVQ+j0AdyGPG1j7Axw+Z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG/MKxPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DE3C4CEC5;
	Wed, 11 Sep 2024 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726052975;
	bh=cBcrJ1amtZS/iaK0iPVlkhe9kczAFLsMRE3gnlDThco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YG/MKxPV7VYRKrnKwLY6Xwfzqx85j0P3sqxqXoMvtQPTmnTILCiDu5BCQsZhbl5MZ
	 rUMLeyih4sSEA+Hl9dQa2k3LDFrMVLWpJ/6xgEF8efzytXKtkUuH4tsawNr9grfGpp
	 LrZpsY87SLL1LnvVfjrIhvY4qpNMhfeIFWD3pwLDLPgXdVkl9xMUPikLttVsV3rwN7
	 JsYxB4VWgBVDxOJzlzB68yvE/kbT0B6PW1nO4Xcm/Ed6UfEDkpeWF4L7/56pR7tGCZ
	 Xard86fGiU702jXkt9e9dKNqPByXho2NhI6QOUApQ2vHu+HnKL9I1bP8chrnNUnRA4
	 xdOktKF3GgCxg==
Date: Wed, 11 Sep 2024 13:09:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manion05gk@gmail.com
Subject: Re: [PATCH V2 0/3] Add atomic transfer support to i2c-cadence
Message-ID: <gwhgjb6z6bwvngze52yzced7vgf34euq2zhogetxdfnkock3hv@df6gpq5h5f56>
References: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911103852.162234-1-manikanta.guntupalli@amd.com>

Hi Manikanta,

> Manikanta Guntupalli (3):
>   i2c: cadence: Relocate cdns_i2c_runtime_suspend and
>     cdns_i2c_runtime_resume to facilitate atomic mode
>   i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
>   i2c: cadence: Add atomic transfer support for controller version 1.4

if no rush, I will take this for 6.12. I merged it into
i2c/i2c-host-for-6.12 and after the merge window I will move it
to i2c/i2c-host.

Thanks,
Andi

