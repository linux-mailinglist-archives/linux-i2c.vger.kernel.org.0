Return-Path: <linux-i2c+bounces-2595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611E88CCA5
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2524B1F80F2B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 19:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3736813D27B;
	Tue, 26 Mar 2024 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeyqV2mi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59C413D27A;
	Tue, 26 Mar 2024 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479891; cv=none; b=HaFt/RNwUl4/5p+4fw6sxT9hYxLv1hbOA3hacZnrHoNgEvJxZTitC7vs+UJvSI80JPLLKlVVFapLl0NtQanaROszbHIWEZVY7zAO2qCsKJYBc14sWJj64nidQDi2l79UUdXTLRiF6ufyYgjeD2aUaexOGyrKMcDCyIDFJqI8GcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479891; c=relaxed/simple;
	bh=mByv9XAK2Ku3Co2GGPbz/c2HcilcwaWN/YleDN24nJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnZc4Mji8MzL/1V/hdReVdlzWkknNEceGZ0bha5XxXKfxKzMKhhzsA/hNbj3QBuhR6VMdAdNEJkjnif7PtUDW+8b1nlyLxirP8wvcXHC1wohNvcxgHyClrcI3fWXZSBdoa9+m+eaE25Nzwf84MbTxVn8Qbkc2oVib9nxkrI1n3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeyqV2mi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB9EC43390;
	Tue, 26 Mar 2024 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711479890;
	bh=mByv9XAK2Ku3Co2GGPbz/c2HcilcwaWN/YleDN24nJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeyqV2miAqeekqaGSmjbc0uQ+n390VXeWx4RdCdw0zM6DsT5wZo4RxRM55Xg/UGoL
	 32MT1MY60bgtK02VKj/mkyAOdK21DPqKrlkDFJPVDMDWQ+zbvZjarXrRxHj1rxAxq7
	 MExK6KQy6uMea/59qWPGhg5yM2EDeTqkx3to7kvRUazK2TMIUM1DqUVoH4m9NE91+j
	 PjTIisHyLOcP9pZo/BO+MTzt6F886aCNoZxihoD1EOCSAHMld+RCF9unWRsyBnMAK7
	 gB8Uy//bsjAvNHIzclEhOHM6sSsr/yLPIojhHhU2fLELXNUmjZdnCYnBWSQOq69AhN
	 H6vbCtu2wB6WQ==
Date: Tue, 26 Mar 2024 20:04:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/64] i2c: brcmstb: reword according to newest
 specification
Message-ID: <xgyhpxajy3aq34q5nqqcsg6ewq32pud3wcamk5b5qvygkpdemw@73behivq5eor>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-11-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:03PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

