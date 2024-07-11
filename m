Return-Path: <linux-i2c+bounces-4934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCF92E909
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 15:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F06E1B2B0E8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285F51662EF;
	Thu, 11 Jul 2024 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EADar22T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E38160884;
	Thu, 11 Jul 2024 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703157; cv=none; b=gBmsqhhNfRCyXUUIAoAFZ7lNH9r7XlYUxirNfHkzwKQDzqSPUYifrR4b3ArYe226XQOZVXBWBylKXvJ/gK/R4hIur0QyV9PHjEsXrqKvG8UA5wJF/vzo0et7Ixz+zmxclX/6v/Y0YehFU3wxHm/aoIAr/nspeKk9mbhQndHGkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703157; c=relaxed/simple;
	bh=ijBoNBFxVn64ACrcqCkSH50FDNv0Povvy4bHww1lms4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svWXQv2wOhnIzgii6nTe4bRp5r3wBGlOteJXR50sPMHBcbMk2qSabPRBeyxPj2XX1pM/hZ8wOsl27fUD7HxTnO2nXyasIglvLO8jIvKX5DCM6Z4pJ2DxuchoRkEnFQ9X7dAbcIY/0tFPt/nnf1etPc/uaqX9pKsnEcBwPdqQyHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EADar22T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97A0C32786;
	Thu, 11 Jul 2024 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720703157;
	bh=ijBoNBFxVn64ACrcqCkSH50FDNv0Povvy4bHww1lms4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EADar22TrA+Yy2rDJTMxQIjX59C1mqj7iAlDu7AuatpGfJMk0JzZyBtNwVXVf/Bld
	 V8LNWfZsZ+lOIDwVaz62naXvjGak+BPuuU+KKiWwas6TmqXxv/O+rY5+ZQqf/ZxEl9
	 T6PDaKagtuqEdtpkmPBhSeCxT1+gQpJ4WUcpCcnqzoHPeWcz//lfxDJwFxHXEitTTU
	 KPwVErIxdBfvwpC1AhGKfvv0EdLjIAaAOCwDN3WPqRLVTJqBJrgeBf2RKT2qq5cywt
	 280QKBEzcXP69lqv70CdlUyS+jJQEY7dAwK24Si3mJ2yYSsmkIsVY0Vo5QIRA4uLxL
	 WoLaEfaoZgSFA==
Date: Thu, 11 Jul 2024 15:05:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 57/60] i2c: nvidia-gpu: reword according to newest
 specification
Message-ID: <n7itipy4xalkvshh5lmlkqz5t7o4rktuirchrd7qek4tjgecqw@oc5hqv2awx2s>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-58-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-58-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:57PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

