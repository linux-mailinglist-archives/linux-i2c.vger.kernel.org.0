Return-Path: <linux-i2c+bounces-6971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B45A89854BD
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E385E1C20E86
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A019615855E;
	Wed, 25 Sep 2024 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0lSE6Fj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E13158557
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251027; cv=none; b=apcdIhReo/s4pAIsso0jE4YmXGZFAEPCZ2b2ijjMgytQuk8deNGUNI9LZwSUGBQ2YrPJdt+QspCvD7H0LL/PJH8SLqzLaR2q1xlJdG3wE5hHvZxbWsuJFvVjRTNb2lIlg+FkELUO1Jt+ZbdXfgRJvsxnzSrDZw/dRrLy3WD9LYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251027; c=relaxed/simple;
	bh=XmN9kOH6ul0EVtI0EFS9KkjQNPL/DwRqHcVlGYNES90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STeBsv0hqaMp4g87VDuhp51ayL69zjgWtnJ+LB9L+YYe21DwKHAltfZEZpmRM9XGJO+jU6sR52ZpAjN5C6AB0pPjjyBB9oSR4++iA8FnvZaFFbA4XPALTYzD8zO0DKl8SzmDl+f9EdstkDv9HFMyckPeKsxmMaz7MitpPQAcoNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0lSE6Fj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC15C4CEC3;
	Wed, 25 Sep 2024 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727251026;
	bh=XmN9kOH6ul0EVtI0EFS9KkjQNPL/DwRqHcVlGYNES90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0lSE6Fj+hfI3iu9ueEG0uwsEQeno6HOBR2QckpGwpFY2z9+257tvXAlrDDDxCvzo
	 K660jIX2DahrpKnGsxigluLPHqsuRTZAoxf3alLiOJNskZjSkxkaYVwODnWhMvSyVo
	 ErG7gBfyuu7cQFOojeGV63X0yDdjfrXYxFw9mLRkx70uhjcXyQRWx+3Q5yCO8Rc98O
	 hhVJdJ4mG2d5geSZcDlxv6US39nOJl3iOw0MKwP6vjSljYoVY/SSy8LN4r8icewzYM
	 VIp2sKtddHVN5PGPuywY/9bta8J9cArlbX8+mgKYrs90qVg6C8utJRQ9xjlBkM21Ry
	 8BeB0EeAwO/6Q==
Date: Wed, 25 Sep 2024 09:57:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Patil.Reddy@amd.com
Subject: Re: [PATCH v7 8/8] MAINTAINERS: Add AMD ASF driver entry
Message-ID: <2dus5dzz46bthbpaylxjbt74qbum2khuferyhvjol4wifnf7y2@l5iqbij3yzpw>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
 <20240923080401.2167310-9-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923080401.2167310-9-Shyam-sundar.S-k@amd.com>

Hi Shyam,

On Mon, Sep 23, 2024 at 01:34:01PM GMT, Shyam Sundar S K wrote:
> Update the MAINTAINERS file with AMD ASF driver details.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

