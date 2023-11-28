Return-Path: <linux-i2c+bounces-516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA37FC0A1
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 18:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 701CB1F20F20
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 17:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0032839AF3;
	Tue, 28 Nov 2023 17:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVaHFP0H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3D39AD4
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 17:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7B4C433C8;
	Tue, 28 Nov 2023 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701193931;
	bh=fIENyWx1p7BpJfaucZBxmc/ZLBKGsHeNB6XalPqHagY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVaHFP0HS1UBadW+JZbhURBZ5MrshziTIOE0oBHVmBWSE53RugvD6SJ8Kh8GN/Xpz
	 sjJqJK2IH9aL9OFqb2lsjNcphaldkHChg+ew9lIOODULEF/7x34Nc/Z3KLTFkv9C/h
	 eqHrb49ns0Zo47owKsM0izffmMukUCXXVJfQ0R1l819GKQuvd/CbzLVen1u5Qa8Cwb
	 1yKbKv5nAuADzMJslKWjfbNskMPlxOGch4uCQ1i2L4Pg3XcmL/9jhkMxV8MVQKlI4c
	 cudLg94i2PKhjYsQn2+aM3751WpEF7q4/jDVKQpNj/stqjMofNf+zd7s/9kgqgFY06
	 ZHlQdamnIgXYA==
Date: Tue, 28 Nov 2023 18:52:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Peter Rosin <peda@axentia.se>, robh@kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 2/2] i2c: muxes: pca954x: Enable features on
 MAX7357
Message-ID: <20231128175207.jzeiaxc2kxusl2fd@zenone.zhora.eu>
References: <20231128100009.3727407-2-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128100009.3727407-2-naresh.solanki@9elements.com>

Hi Naresh,

On Tue, Nov 28, 2023 at 10:00:08AM +0000, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Enable additional features based on DT settings and unconditionally
> release the shared interrupt pin after 1.6 seconds and allow to use
> it as reset.
> 
> These features aren't enabled by default and it's up to board designer
> to validate for proper functioning and detection of devices in secondary
> bus as sometimes it can cause secondary bus being disabled.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

