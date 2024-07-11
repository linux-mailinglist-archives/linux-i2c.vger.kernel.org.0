Return-Path: <linux-i2c+bounces-4912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B092E4AC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6801C21660
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F21158A35;
	Thu, 11 Jul 2024 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9Ts9qzA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAB814D44F;
	Thu, 11 Jul 2024 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693666; cv=none; b=gtMHD2x4f6lUTsSta5s0OMEPEPjyxYpgKOatq/SgVCV/VdWmFndxexdpdg/pbt0Xx/ifoBsk4Jfz5g3p7Fxa8x2qd1tkKRIiI2b1OGNvOHeVFFt5xfQricuSK+b77cBKJ6UOD10AyRYVXEkAq9kooMvSSPylXj/ofBJmz4ZY/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693666; c=relaxed/simple;
	bh=3mUSsZaLu/afM8x8WGVfRmX/P3NW6zlnzrzYFqt0qTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+BUkoIerChaVi0IwLVq1E4E5T3hvDzUMc26tsjjrrwUgrQZ3tdPeMdGDhdKeh4zdPbaFzHnjPgKroOfagVeSyesP9ynxSbHlWWGHARTTpFS1BToUNyW1G5KNLHEPUu4U66cU2+EoU+jIk+sDv2jzrxhndVs/xzGEXcGk6Y0SGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9Ts9qzA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC92C116B1;
	Thu, 11 Jul 2024 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693666;
	bh=3mUSsZaLu/afM8x8WGVfRmX/P3NW6zlnzrzYFqt0qTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9Ts9qzAt+LRPUn9AF8VHuTwX2cQy0YpREfI8WLJWsT1GI9UhEuc6CvIuReCAQQnC
	 3Cu3zf5+YbGSWSAjvSdFMF/9XbJ3rEFWN+tem1Qagrp/YgsIJxiWV4UaLBoMwTEm+G
	 NhUCZEnncqrevUjZH9TTLQTAgZDpS3qfeRKkMxnIu/9pnC0zoB4Jema6T/CspxX2MD
	 YDPwYZ/uyrbHyfFkJlSc6wVaNi62EnHqAjLLubF+T9DS8CFpCy2NfUIxylofbLJbvX
	 SsyHDMbcMQldOGitZFj3NmDkuCSTG+NMzCgBQOPclp0T8IGsKoX7lNFFKo69YRlTrR
	 QKKfYllinGxKg==
Date: Thu, 11 Jul 2024 12:27:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 50/60] i2c: tegra-bpmp: reword according to newest
 specification
Message-ID: <tdjnjllw3xinlvjj74kl6kwja2wxiivlkogk5f32biyftwlhfq@2rpr7cjttjcw>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-51-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-51-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:50PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

