Return-Path: <linux-i2c+bounces-9944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C00A6A4AE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 12:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE553B5A12
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CF221859F;
	Thu, 20 Mar 2025 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bISjCvti"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4A2066DC
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469416; cv=none; b=dRFEsIqZFPno/eP+jv26PD73V3r75KCiv2kKmIhRGvWfM6U/QPVXHfpNV+23HROZA10BUNVf4/kp9iHbZh4txkxfeXnVHBD0kBEqFBDRleT1X8qxHvP5Nt3uaaoGkQBSHtJbi68LVp5Qo0gb5mLiDsxK55lafOmkM7GIf9SUdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469416; c=relaxed/simple;
	bh=50LWmp0t9rBcSlI0MkxpTiD6DLeIo+bf1yfNgb4HV0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlBMA5SXkrTfv8t4sx+DDNUZ29y+wiwrGlwb3vrY+fHwfYC+6QVR2D4r/FJlJqAwEtpXKEE+T6R0MFnOmNmTuMeoth3+ua3OFmYB3JqbiEm5ZrOzuGlZ4JUMC2kY88Wn92qfL7x30iO3nKpkLHwcEEKO76PQm6t0FewEQ1fJlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bISjCvti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6407C4CEDD;
	Thu, 20 Mar 2025 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742469415;
	bh=50LWmp0t9rBcSlI0MkxpTiD6DLeIo+bf1yfNgb4HV0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bISjCvtipswWptaLERhVQxhBaKwU27TDgbpnx9GJfyiJ53maLZj+jVewYbNLEzwVR
	 03pC/euIwTwpTM7cjUjHW45+do3ZhEgQ+jeiAYbt09EuRp/8Ep3xJ5K+oc2anp/MX5
	 SQxZtxjDMQaIGT9vpwFeaK4i06T/6cXtdlPWyBUPmIlrMld0aX7vtKTGFVqi/hiMzr
	 ShFpn5nNtBx/0jquGCUvt+dTNXHjDPydgh6DeCcvl6heeKpMz4wdO6KDHPTM0TGaEP
	 bYDkImgU9S/G1GL+mWBttfXNR6+M8D7FCZp7IhFf0DDtlGmNrJLo748tP2T+o2w36S
	 1qTLMWW+FXKcA==
Date: Thu, 20 Mar 2025 12:16:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-i2c@vger.kernel.org, syniurge@gmail.com, 
	shyam-sundar.s-k@amd.com, Raju.Rangoju@amd.com, basavaraj.natikar@amd.com, wsa@kernel.org
Subject: Re: [PATCH -next] i2c: amd-mp2: drop free_irq() of
 devm_request_irq() allocated irq
Message-ID: <2mlgmmld4kih7fvt3bv2fzy2mgkbierbmtmzfbdy2cqweu7txh@tosw5go7mksd>
References: <20221103121146.99836-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103121146.99836-1-yangyingliang@huawei.com>

Hi Yang,

On Thu, Nov 03, 2022 at 08:11:46PM +0800, Yang Yingliang wrote:
> irq allocated with devm_request_irq() will be freed in devm_irq_release(),
> using free_irq() in ->remove() will causes a dangling pointer, and a
> subsequent double free. So remove the free_irq() in the error path and
> remove path.
> 
> Fixes: 969864efae78 ("i2c: amd-mp2: use msix/msi if the hardware supports")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

No ack from Ellie and Shyam have come for this patch in almost
two years. It still applies and it still looks correct to me.

I'm merging it into i2c/i2c-host-fixes in order to have it in
time for the tests before the pull requests. If Ellie and/or
Shyam will have concerns, we are still in time to take it off.

Andi

