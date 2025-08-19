Return-Path: <linux-i2c+bounces-12340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B799B2CD70
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 22:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7EF1623FF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 20:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38311A2C25;
	Tue, 19 Aug 2025 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIB8rN/o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA215D5B6
	for <linux-i2c@vger.kernel.org>; Tue, 19 Aug 2025 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755633664; cv=none; b=kR22TebbLfeb8UXl1yyx/oVfYIAqxdUfaYMm6OpmFhdypLLpBuPi8WxMwd9/vpy1pF9UNgGbnpdjyjDf529vOR4ic+N3c+L33v7yRAom6Y4p3prX6S/5hK6OhJNCQERFlblPAU0M72/LrtvciOvacOQYMKoKMOndQ/nILfjvNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755633664; c=relaxed/simple;
	bh=ZImn+mi0aQ1m+gTX7nUwlOURCg6irBMjqoyAd7hh22w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTPJW2bEQHJBOmax317f2FLFWtoJkXgNpN0TsCqa/fBcd9Hx6xVatLDqYieE4wPwAd0vBEvL3KGUyewK0JzcIjvBZdEXXaFl+KU2Vps9nSBIJXM3tF2Ujhi4IbmT5+tCffHOaI0ilraMXo22dQfaR2sjqt/cc9l/pZIn62knVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIB8rN/o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36DCC4CEF1;
	Tue, 19 Aug 2025 20:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755633664;
	bh=ZImn+mi0aQ1m+gTX7nUwlOURCg6irBMjqoyAd7hh22w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIB8rN/oMoyGf9dTSKWPLIO+ceFR95N0rmE0iZIELjNcokPRrfpR2mLLhnKdOfkWI
	 jxIVembeeF1zrveg2sELzEHKiDRg/3s1gfChdpKRQvkTX0TeXvRzGUMvF4BJKUjPxC
	 ywTm8Ul4bsYnoD5oBdJMgD8JHKjgAaHAgCocvkGnxXMZwfK3DSqq0K9q+LyrjZOjbT
	 f82HYAOxhaYs6s5tfQm3B3zzF1k3gUuhJvY1P01zRtmx5RNsDZmAMCRuaNn70wth33
	 ws1D11iD94A9ZgMsE+ktyTdEb4b+rXguSDFg45pSs/QRiI71mC3PfKu4ARqvD9z9MT
	 x0miLhnxOO5GA==
Date: Tue, 19 Aug 2025 19:00:59 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Devyn Liu <liudingyuan@h-partners.com>
Cc: yangyicong@huawei.com, linux-i2c@vger.kernel.org, 
	prime.zeng@huawei.com, liuyonglong@huawei.com, kangfenglong@huawei.com, 
	lujunhua7@h-partners.com, huyihua4@huawei.com, jonathan.cameron@huawei.com
Subject: Re: [PATCH] i2c: MAINTAINERS: Update i2c_hisi entry
Message-ID: <7xquwd3ex5gpp2i2twpoi3g4bjm7jzcgt5pqojpepqeog2ctqs@pewbdrbrown7>
References: <20250819020349.4027842-1-liudingyuan@h-partners.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819020349.4027842-1-liudingyuan@h-partners.com>

Hi Devyn,

On Tue, Aug 19, 2025 at 10:03:49AM +0800, Devyn Liu wrote:
> Because Yicong Yang will no longer work on
> i2c_hisi driver, update the maintainer
> information for i2c_hisi.
> 
> Signed-off-by: Devyn Liu <liudingyuan@h-partners.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

