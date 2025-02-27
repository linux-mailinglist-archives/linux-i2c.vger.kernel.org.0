Return-Path: <linux-i2c+bounces-9633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59218A48853
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 19:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0B03AC8DD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 18:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EFF1EB5E4;
	Thu, 27 Feb 2025 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFLWTWY6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5C71B4250;
	Thu, 27 Feb 2025 18:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682495; cv=none; b=D+0JPPbbG8p5Hr+7g9mUDU6vJIsPgp7xssueM0eiRLBm3+DQT436+QVQQD3YpzPG6x7yzsoYp1uHjT9EnWZHFjzBvjK8kMhDgMWJNfQBKZ1RVm7Eet6VyeG9j9HMtEZ6s9759CLgL4F58/mUTrQc6G7wnGBS37Qra1Xw92fcf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682495; c=relaxed/simple;
	bh=ErWDowBQJThSm/0eQthyoKAygaL/xrWOuhRH98xqpME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7LzepAx7QP68EbepswRKasN8AubqAR4rxdzByp786UQrPQqoof0HrukFqd4YBhDgpXD/VsS/xWPpsB9lO9yeTNhmY0I1kZ+pm3fP40WQURVTuKvTyiSx1RBle5GtBTuy1k9C5Fc07anZoywGK2AvhaNDMkZMGH2CLwww9v6Evc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFLWTWY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51885C4CEDD;
	Thu, 27 Feb 2025 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740682493;
	bh=ErWDowBQJThSm/0eQthyoKAygaL/xrWOuhRH98xqpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFLWTWY6/plOwQ54FoblVPm3V2OPJg7H3nqfR+T/KRAsTTly4qDCjcTuTpMSzk4Hc
	 7OZQtGUzSLW4kjM99025/aeO+WqN65J4PkK2sYpNTxfUICRi5J+cyS4EEk4BaErU/T
	 dLqblGNsH8NtQ/28+CXZdbOHbuEPTlYIota67NQyo/cfX+CwQAEDqoP2Xb+PMhgETj
	 V1+N3BWHA9GtP8XetB2XbI3GEnpR+jQa3jV62tOFtgpa4IapxyDeNZbJkpi1Io4+7A
	 tKKOaFkhyJ1u++0tGRIOcJjnrhIro9aL1cGhzTzM1GqLjiWYJnqTg9imCJAxJjLz14
	 xx+SK4cQIJHZw==
Date: Thu, 27 Feb 2025 19:54:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Anindya Sundar Gayen <anindya.sg@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH] i2c-algo-bit: Added the bus lock during a i2c transaction
Message-ID: <eepxdvnjgynjtavq2epiz2gb7ztibnluyegvlcxhpk27mosi6e@gkocjynuxoyz>
References: <CGME20250225121532epcas5p2343d6b813b78d92203cb06b54dfd1970@epcas5p2.samsung.com>
 <20250225113314.12353-1-anindya.sg@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225113314.12353-1-anindya.sg@samsung.com>

Hi,

On Tue, Feb 25, 2025 at 05:03:14PM +0530, Anindya Sundar Gayen wrote:
> Earlier i2c-bus lock was not available to i2c-algo-bit driver
> for that reason if there are back to back i2c transaction occurs
> it may be possible to occur a race condition.
> 
> To avoid the race condition we added a mutex lock mechanism which will
> help to protect the i2c_outb()with a proper lock.

what is the issue you are trying to fix? Can you refer to a
practical failure you received?

Thanks,
Andi

