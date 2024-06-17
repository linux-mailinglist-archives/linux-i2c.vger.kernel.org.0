Return-Path: <linux-i2c+bounces-4070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72490BACD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 21:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E652821D2
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 19:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5AC1991AC;
	Mon, 17 Jun 2024 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDYRw7bD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1289A1991A9;
	Mon, 17 Jun 2024 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718652347; cv=none; b=QNTI7ToD9HqCBlHO9lXiecc67OaPHY3aOMCJQGcurKDV6VeZwzlBJTp9Ja8Mm/IbR2xyU1lBuco2BKzxrlfVhviZGCoJr52rhze4yFMv7lrfSzGgzYFMEEx5Etg1De3cJ8YIpWuMJ8HwcQwqspxb4W+Z+/TuDDyT/iVBxL97gNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718652347; c=relaxed/simple;
	bh=fiPM/txyC1MgvzsfZK1mZXhxNQ0K9EUihP4zzTA/5qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+x+NnrMoGlH22AcQuha2WUS5s4VMexxfLV/WLX8PijZR+vVJdyX54jewA2JSiE0ai15Zhc6OsmmeGpjnXtOSYLQZT821O/Cr4IvgpcYphmh6/xO/j6BGgsLSeYIZ07+6S51YnhDGyPrGgMm6FnQd0bdYdMbk79mIO3spEAnrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDYRw7bD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070C3C2BD10;
	Mon, 17 Jun 2024 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718652346;
	bh=fiPM/txyC1MgvzsfZK1mZXhxNQ0K9EUihP4zzTA/5qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDYRw7bDOjeDOYj2rjUOlZyqGfr9UF0GR0AoQg5GbMvVBVGqpFFC86cxbiPLonUay
	 Vk4sVTZKdkIVsoNdh5UHzdIPmi1SX0KRCEYBErrpUe2AOCnZhsMJgXVvMWNCWaGgkf
	 c6M5GPnv3mrkGdeQ3z44X+1XNEaXlpdObEi622Uzq/jqfpExCnnQA8j0bgTd6iQDRh
	 Iz7zAz84xXUSlsKS1ALSidDUhjuWSvpKDit3YIkkF9NpPe1dBwC+IUTmBY3+1YI1qE
	 vjHe2jd1eFSHFu/CobLXJkRRP0Fr62/jiNBOkwKBOAVUcwnoP/LeEh9bH489bxmVa9
	 XN92TWuqkZ8gQ==
Date: Mon, 17 Jun 2024 21:25:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <boehtgry7j7ulhrw7tenkmzxujahmxfn25imvb7zw2ibtmebbk@u3jryw4v2y7h>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
 <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>

Hi,

On Mon, Jun 17, 2024 at 09:57:12AM GMT, Easwar Hariharan wrote:
> On 6/17/2024 4:58 AM, Andi Shyti wrote:
> > On Sun, Jun 16, 2024 at 09:14:40PM GMT, Wolfram Sang wrote:
> >>> I am not a big fan of the use of the word client. It's not used
> >>> anywhere in the documentation and it's too generic as a name for
> >>> giving it a specific meaning.
> >>>
> >>> I've seen already some confusion amongst reviewers and
> >>> maintainers when Easwar sent the patch in drm.
> >>>
> >>> If it depends on me, I would stick to the only controller/target
> >>> and render obsolet the use of the word "client" in the i2c
> >>> context.
> >>
> >> Have you read the paragraph "Synonyms" from patch 6? I don't think we
> >> can obsolete client because:
> >>
> >> $ git grep 'struct i2c_client \*client' | wc -l
> >> 6100
> 
> > at least saying that "target" is the
> > preferred name for what was called "client" until now.
> 
> I'm in agreement on obsoleting "client" as well. On the pace of change,
> I'll defer to you. I was trying to elicit a recommendation on future use
> of "client" when I asked:
> 
> ===
> What's the combined effect of this documentation update in terms of the
> recommendation for switching over the Linux kernel? Are we to use
> controller/client or controller/target?
> ===
> 
> "Synonyms" from patch 6 does say that controller/target is preferred but
> couched it in the caveat "If speaking about I2C in general" and
> adapter/client when "discuss[ing] implementation details." I was trying
> to give space for an unambiguous recommendation.

Exactly, this is what I referred to in my previous e-mails.
These two statements sound a bit ambiguous to me, as well.

Maybe we are wasting time at discussing minor details, but I
consider this part important in order to give way to the major
refactoring that Wolfram started at the beginning.

Of course, as of now, I agree that replacing every "client" to
"target" might not make much sense.

Thanks,
Andi

> I think we are on the same page here if we just remove the caveats.
> 
> Thanks,
> Easwar
> 

