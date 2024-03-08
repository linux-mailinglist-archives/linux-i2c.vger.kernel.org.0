Return-Path: <linux-i2c+bounces-2282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFDC87636A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CED81C20B07
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 11:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A768B56443;
	Fri,  8 Mar 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDdDmjFY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E55255E73;
	Fri,  8 Mar 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897943; cv=none; b=GlB+NNUJRrl6rydnffPZeokUXlfY8HRSox95w8UA8Bejc4RpdLilYqcXv+aFXUYRzuMZeDg95UBmiY9zaV67T4ozo6fmK8qu3PLCQIQfUZsJWupAxNM8alWkbvn58w0kxDYDO0JyR8LQkdi3D1mXEoR5o1TDNcOn/S7odDsTKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897943; c=relaxed/simple;
	bh=ZQFEhOPVbNc0FGaiWXIG5XMjjDWV7c8lgSMIDHSd9S4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAUhX3OxxzsQADbH72rZPzE02F7++X7aG/eY5pX49qi809ezhv62JD1Y/BdXA1Za9o7QMisOiOBCKRadqBb+4J3IZmrpMYNcyeKgv4DEFMXsha2VU4FLbii/ZtJCAg1C+Mzn+/aFBueeACSQ1qAtZJr+dxzPVkT9REdy8x3snQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDdDmjFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE9CC433F1;
	Fri,  8 Mar 2024 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709897942;
	bh=ZQFEhOPVbNc0FGaiWXIG5XMjjDWV7c8lgSMIDHSd9S4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=MDdDmjFYt4DiwRLTiE9XWoh5gjqSfoqjHkkscGityvwcOwe8Lxoljnz0w2hPhUkDA
	 AR/w3dGzhQzSyyocg0SPzfAFKQLbfaeIZNbjk9G6id/sgXK3y+GZh+uDajwFpwvBHA
	 B95vN/kkretc3xKEQ6BDYpV8pyPdXJjmL8A+XjJmCq7izP/4oG7ySOXIsT3qV6fvcW
	 iTPy9cBkqtNMvAdwx7izGoAbXNjgH4UIwNV78jreMMrRuoxKicR09MJc5gjgSwSL+7
	 rmoWHS+0gECNnEP7tI2o0ip1LUaLSLa4QiYwHfZpot5tNfhUE8y3yat+UPDXNyTjr7
	 1btOSONYvpjSQ==
Date: Fri, 8 Mar 2024 12:38:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [GIT PULL] i2c-host fixes for v6.8
Message-ID: <efnexv3cfnuuknfjpnsslfxsttbghicxijlmisu5oxgjcqsp66@iqjkp6mazf3n>
References: <iofmooj4qz7j2rphzx3ahvpdur7pwoaj4jjduraffyto4yd7si@amqj4p4ldgef>
 <Zerb1TLGFq1rCbBw@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zerb1TLGFq1rCbBw@ninjato>

Hi Wolfram,

> thanks, pulled!

thank you!

> > at this stage, four fixes make up a fat pull request, but there
> > has been some turmoil in the last week. The rush to get things
> > sent by the merge window might have generated the need for some
> > fixes.
> 
> Don't worry, it is a bit more than usual but not really "fat" in my
> book. One wish, though: If your fixes branches are upstream, could you
> rebase the fixes branch to the latest rc? So, that only the unapplied
> patches are in there?

Sure, will do. From the next cycle I will keep everything rebased
on top of the latest RC.

Thank you,
Andi

