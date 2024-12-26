Return-Path: <linux-i2c+bounces-8727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6119FCF30
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A66A3A03E0
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 23:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7123C1B87ED;
	Thu, 26 Dec 2024 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjW2V2Q6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B7198853;
	Thu, 26 Dec 2024 23:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256539; cv=none; b=iHXnzeyAmBtvD4iu0rYYH6jFtv9FXHeh62NeA7xOkPNak8GIUT65VsJJB8+gGuwL/LDLzlwmXWHCXioeIHUEchGCNDyoNm0e2PtHpgkF8XLDeICiHVv6hNDYs8LNpiEpotcgHUQlhc60kOkyrNg0pfYJz6Htx+Mu835EXQp6K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256539; c=relaxed/simple;
	bh=OL0Vc85gaSAOyZE96hHWhX8ZEbETAzA+wIIp30AqWTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3S0/uCHJ+nsTHq1Wo089UmAO/lPhVc/kHBnEd/FyP+vZklumRhfJ4z7sNJnCQSBId5fNCpYpITGG09MMt1a+ozKEh2xDuBXljitiNaZPyEVGem+lIfF0B09RG28794AgoC8tNP/OrbWkG5nBKfBK+zghQg7fWwhbZoX5oLy/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjW2V2Q6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48671C4CED1;
	Thu, 26 Dec 2024 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256537;
	bh=OL0Vc85gaSAOyZE96hHWhX8ZEbETAzA+wIIp30AqWTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjW2V2Q60PIulbUBvf6RWeEBKI4VmoeK+KMXIi5xknU8e5sS8VYq5si5d/AVWxjHU
	 GnTKH+Cu99lAjtNicU57V2buh5hGrGCBw0MlDU4PI4J8kT/ho7JFbGJaayF2XB/yDU
	 C9YDmSKsLvr/HHUGP2ur+w8xLwptYLpj3trjMWkkuBFpmop1hjHBu+ftWRf/Cy6dAx
	 3AnK7sNtPM5NrH814Tc/VEWeeg8wl0ITIbjhTKt8oeDhKV9nPAB61IDDwHXTnIfZYk
	 OnXhCYCLONn24DEb7YoVwmFjtyLiHcpm7s/pvWZXvSUiG5K0Eh1LbgEWStutbDF+fO
	 pV7VP/jT9BaXg==
Date: Fri, 27 Dec 2024 00:42:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] i2c: davinci: order includes alphabetically
Message-ID: <jao47cv5ns53jrs7vvaz2ysqkz4mnc3n4tgbln5wwlijoeubf7@vx7i7zl3tfiz>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <20241211102337.37956-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211102337.37956-2-brgl@bgdev.pl>

Hi Bartosz,

On Wed, Dec 11, 2024 at 11:23:36AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For better readability order included headers alphabetically.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

