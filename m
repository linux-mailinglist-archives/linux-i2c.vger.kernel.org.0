Return-Path: <linux-i2c+bounces-4043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE7909989
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 20:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BF1282FE6
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 18:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1EC53361;
	Sat, 15 Jun 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdS3FAl+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453501870;
	Sat, 15 Jun 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718475147; cv=none; b=fcouvad7+nxwjSihRQ0JLGQeIHVCBENAVk2OrByFFPSvP00UO+C1HgfU3Ox6hZnFpkSGvU4rrNPVDf9Eqp4S1XypzM5qHTzM1y+HgGScQjm/HY/+6+FrdSr+Iz9qRTuKbC3KLpS6g8n1eguBGOz3nGSuhlOtJwiF0zWlmx2K47I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718475147; c=relaxed/simple;
	bh=Y3xdhPAl1VL1RrWQwDn+N7z+BanYi41WP+l/JHeMAxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hn9pq7OjjKqNZKPNOxwmElLAQwzXYt+BjAQBpmA/L8vAW4GQ13eOGPxfvBXQbqqIuzl+d9L6RMxJnewWRjIjSDpL0FwbLhChCZNzmV7AtpmBW3fgLDXoygpQtdhuB9EgaBv1IoBlku9DeOPBaMpmqab1T3KY4v4H7wtsGVr2DJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdS3FAl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7354CC116B1;
	Sat, 15 Jun 2024 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718475146;
	bh=Y3xdhPAl1VL1RrWQwDn+N7z+BanYi41WP+l/JHeMAxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdS3FAl+GO5hwnMYTfzjm6OyqubqTCBxCL0AW1b9nq48vceSEHzU08A6kwLqon9mp
	 MxqTwZI6YDas6JfADm5QMur14vW/HJA564Cvqx/w/b3xdgJch3gHYNCOCYsISRkQus
	 xVThsJGo2cszvnhLuTtMndU/+Pn+DoiZRFI5kmfQr83NIhyEiZLnvJOw4vU1KnH4wv
	 mfBh+us7yrhMCYJ94hJrBozcOzWWidLpmqFexYssoQMgKsnn5twFWA9LwC5d+zAbEV
	 4/6BGDgygcwd+lie5ixHYHOSRSKt9uySsLYW1eeL5k9/rijf8tiLuJ8gzpO90OP+oX
	 8EzyqB+yf1sCg==
Date: Sat, 15 Jun 2024 20:12:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] docs: i2c: summary: document use of inclusive
 language
Message-ID: <6qzf74ex5mrwfjbzknnqcaiy53ifjaiean2snutvn2hwoypsgy@xdcwzkmsxvzf>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-12-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614081239.7128-12-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Jun 14, 2024 at 10:12:42AM GMT, Wolfram Sang wrote:
> We now have the updated I2C specs and our own Code of Conduct, so we
> have all we need to switch over to the inclusive terminology. Define
> them here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

