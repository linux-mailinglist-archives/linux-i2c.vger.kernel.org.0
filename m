Return-Path: <linux-i2c+bounces-6597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C23975C7A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 23:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D0011C22984
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 21:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458C814F9E6;
	Wed, 11 Sep 2024 21:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnL8yuGC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB4149003;
	Wed, 11 Sep 2024 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726090505; cv=none; b=iL4ZCYvGxn+nklvqBaFLipW8+GKKIGGfXvlhZ0rvHzVvKwqt67b1ZG4Gix6JREfrZXsfTtmh4weB/fBZoc6si17myt2V4SbGHlO3RkwHCSJkgllGQkSC/0KRrtokvAWkKRtntkJBbDlz0YHOmjWD60FOoEqsKIupgvwO8pwy1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726090505; c=relaxed/simple;
	bh=lGBtan08hNTRPWie4/KFkvU95dYKZY2Iq5dArSn9Ja0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owtEptJHgVHw3loKqNcdbuD4vgrxugavsbFzd+qvY/BGXXnuYtqDW8Wj5BxwuGyHmy+7LXLaMFdI8I5RUh7NZco+OlZs7AWPL/fRE9iPZNiOr5zsth5CKbSGtCxHA8VkQw7JGWKxLPSewn3cMXXv/JwUTUm660xf4bniZpMpEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnL8yuGC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5A5C4CEC0;
	Wed, 11 Sep 2024 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726090504;
	bh=lGBtan08hNTRPWie4/KFkvU95dYKZY2Iq5dArSn9Ja0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnL8yuGCOI1yG8OqS9Cq3JkP2bZr7qk2F2LSAosHNxVhpeI/D//D7uSgZE+F4RCOI
	 dFO1VzlPA40lQXx38Mt6YbnsuJ+ETkC9G3+WcNdHYDSIKr08842WJbMe4bERMQngyN
	 Xo0/rxtNBEuYeDaAN4ULcdIxDp5Zd9NhukM5HHn6HVXRt5KD/E6V0I1VbpypRiNwQw
	 VbL2l7igJJZ7OqNSbUyfno2+7URVN4DAFPqaAg9Y44dNoJgu3FV8htDq8rC4DUjIE7
	 LVLT9Lf7tSpodCE9rJG0i2Fpf3Zz+u5xB66e4pcbgkB1PifXcyK9Ykt5iNGkzpzYor
	 suO7vuIks3L4w==
Date: Wed, 11 Sep 2024 23:35:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 01/12] i2c: isch: Add missed 'else'
Message-ID: <ow7ym7aobu5qukkwvds3dtt5qy65jp5ltzirtzhwr5aef3rxd3@6xceyxzy5orc>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911154820.2846187-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Wed, Sep 11, 2024 at 06:39:14PM GMT, Andy Shevchenko wrote:
> In accordance with the existing comment and code analysis
> it is quite likely that there is a missed 'else' when adapter
> times out. Add it.

Good catch! Very likely this was an oversight.

> Fixes: 5bc1200852c3 ("i2c: Add Intel SCH SMBus support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I merged just this patch to i2c/i2c-host-fixes.

I will take the rest of the series after the merge window.

Thanks,
Andi

