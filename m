Return-Path: <linux-i2c+bounces-9448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E11A3513D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9992A16E052
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1FA26E17B;
	Thu, 13 Feb 2025 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NazImkbr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC626E159;
	Thu, 13 Feb 2025 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739485560; cv=none; b=itEjXxblOnYPhirfPF7DRSU1QkpDRNGFiXr+PRe4LIVV3sdhnqHBKaFoyMTfJ9S9NqgUZVsEkudDAub6FGUvvA/SvOT097OWBcI95lL+wLLmsgYq5sfuOQeeMBUhgov7YIHk4DGZx2g02nMczH3SfO/Z0eBJFXMH2Ip7fwgrUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739485560; c=relaxed/simple;
	bh=ylVap6Al2775f4UI/B+6B7Ze8RIOMoqYidVKiT1nRzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA5IHDp6MQ8ypeb6RgwhRf3408IrvsHvKRjnsIXw5RFEXcGtQ0BEEqJ6anidAtHTyG/WR9c6+v9AO6ylMFlvEbYl7jO/XywqxJHmQrXGbG43GCcYUmOBgwnreJIrUVdHvjCTaQV8411n0xPcOoKFOc2Yjg3mNW20d9qSNgikpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NazImkbr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B0BC4CED1;
	Thu, 13 Feb 2025 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739485560;
	bh=ylVap6Al2775f4UI/B+6B7Ze8RIOMoqYidVKiT1nRzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NazImkbryysz2Jvih95SKmjuQnQiAMTB//xSzr1LvehUbFQnJRpC8JM2rHAxMXQxU
	 xH/0xGmpr53HO9L79ZJXUhp/Vtd0hyk4E7kKn+EhoyNbpKfiv3gF47ze8byUqz94dg
	 CHRiCJVJVJdxg9LRysj+JZpiKk7FWgkVzvB7TQ0ZXFGwQDSK7Yammx5E94MqvGEmxM
	 c4ordmNx9Vd2FFS9G7e5Qy76jwZzmAboZxN8NpQoVPPbvu20DMqSgLHQXWvT2wPRUp
	 TrFsDMXwiLJo+RB+tRZu0ARu+2lRASDGww1EDn80F1Z2p0oDPecsAz2KesWV7AOmM6
	 bFDtaXVm9LXEw==
Date: Thu, 13 Feb 2025 23:25:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add maintainer for Qualcomm's I2C GENI
 driver
Message-ID: <nozabphomzcwgdnwlibzibuy3jdx2juihyewsrwaslbgk32nz7@kkw47rlus3xi>
References: <20250123084147.3632023-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123084147.3632023-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

> +QUALCOMM I2C QCOM GENI DRIVER
> +M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> +M:	Viken Dadhaniya <quic_vdadhani@quicinc.com>

Thanks for stepping up here, I really wanted to have some
maintainership on this driver.

Applied to i2c/i2c-host-fixes.

Thanks,
Andi

PS Please don't forget to include the i2c mailing list. the LKML
   is a bit of a black hole.

