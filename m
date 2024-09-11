Return-Path: <linux-i2c+bounces-6596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C112975BB4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 22:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB051C21D01
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 20:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839BA1BA276;
	Wed, 11 Sep 2024 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3PQyaiY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467D1B9B58
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726086430; cv=none; b=X4zrEsL2I+wEaJkZqvqArBW9fqYq16MGKLaY2yz9aM54aHHQfABYyHQUZEn+MvtsC10fOtG5D6dP2QQnUbEpuf8hooE/vxDrSxyD1SlVEP4hK/2abn1gBM7GXQvVvz93FY1nof2lskhx0/x4kPscTU2ImA8R+d0X6SDmIInDL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726086430; c=relaxed/simple;
	bh=Iyf9Q0WDt+xygIxkU05zbG+rqa3XPCUPV6BgSByYLE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kygjxnHeIKRc0KOdirx7GwOj4V+SE+CcgCPV+Gt/gZJccnzyBXL20TdJI1mSBSI4NHO3xLltosgGEhSSKlaGWmqnuyMvDpqr4Nss2PWwpYUoW7Ql0TcgBkIlrnWrKuJOjzF4MBDYilGMgSylzpCpMwfX0FfGIlYBMDSJ19UjroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3PQyaiY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB10AC4CEC0;
	Wed, 11 Sep 2024 20:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726086428;
	bh=Iyf9Q0WDt+xygIxkU05zbG+rqa3XPCUPV6BgSByYLE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3PQyaiYrr01REztJ/qswSQ2ZmkNvxqGIeonTyptXwnrscZbzQtBvAiBYEF7ey2xz
	 3kmYHjPIpNrd5pPQMCMQus1gAd0jlk9uGRbKdv8nF7KgAlGjobFuBrsy3fMco8Xkte
	 VQAQ9kjDudjI+mJc2jhzlbbz3Nle/iwIzhddo8kpYRC9KHmDpucm6bNMbIM0yOeRdL
	 1lVN0w9AD5kAxSkzYuf3BpJ/wx9JmOWe6Dios7jhCKiZ1KFpB9ihUht37+C12X39ee
	 Kc7gUbLUQhIlGkzqJ95dy6lh6oqEP3Y3yk1AiqMxrbmCER+EgDKhGNvWSH6FrzK265
	 VJFainkIAL6Xg==
Date: Wed, 11 Sep 2024 22:27:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Cc: "michal.simek@amd.com" <michal.simek@amd.com>, 
	"ben-linux@fluff.org" <ben-linux@fluff.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Message-ID: <z2isywj6rb3gr7i5ba5ihwqllxkon6u6rl3tovsgqiebm55tkk@vqp64uvceq57>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>

Hi,

On Tue, Nov 21, 2023 at 06:10:52PM GMT, Robert Hancock wrote:
> A couple of fixes for the Xilinx I2C driver.
> 
> Changed since v1:
> -Fixed an issue in first patch where an additional message could still have
> been written to the TX FIFO without waiting for it to empty.
> 
> Robert Hancock (2):
>   i2c: xiic: Wait for TX empty to avoid missed TX NAKs
>   i2c: xiic: Try re-initialization on bus busy timeout

merged to i2c/i2c-host-fixes.

I just added in the tag section:

Cc: <stable@vger.kernel.org> # v2.6.34+

As requested by the stable kernel rules.

Thanks Manikanta for the reminder.

Andi

