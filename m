Return-Path: <linux-i2c+bounces-8911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C0A0111F
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 233511630E4
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC221C07ED;
	Fri,  3 Jan 2025 23:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP/woXSW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59992180A80
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 23:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948321; cv=none; b=P1j34D2ppKyjKPanww/73/O9N5Xutl5Satz7XZSEDUN+VWpXyzfqVzJr3QZCSXQaahJ20SGLhYMzr6DapNs/mHK43BFNQ4cVcPW4TmyhnI0tCyzSKzb1FJRGgGwFHX/KxAsZa+OmteNCzBhcOE2LgoX4dNt7gNmyW1e2NI23Pxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948321; c=relaxed/simple;
	bh=24Nb1RI4AWgUfeFTPqYs3KAANqV6wfDuLHubKljny2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke9J0v1GNbw9NZWhCSdax00ZFuseBZ/CnPwaG9VadH0seeYsFKpmW10MbJOGmI4bsts5AVgej2TTmCuwoieBdGcbj7gJH7hRkOMJ64OI/dJySAL4rpY1GjiemlGe1J//45jWQC3WQKz9bAG9uY+FaLxXScYjPqdRMnYeqPpFR84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP/woXSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F232C4CEDD;
	Fri,  3 Jan 2025 23:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948320;
	bh=24Nb1RI4AWgUfeFTPqYs3KAANqV6wfDuLHubKljny2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RP/woXSWJ78r1kJMuQADnJkeSFSaiGyM9ylU8vQ5yafEXq9FxmZJyDlD9GmbMKCHl
	 BwXW6L0DT8pzn6faQP4i+5Tq9TE3ENG3pvcxtbhCRXOMO9eIiNnWdQyN0OCoSeJgoh
	 kvaqAm1KElWhKgdj9nBwXDs0uKfIWwh2LFo1Ln/07OlGwOLHjxDWeDwdacaa7P/Hnj
	 PvnHFjY+MuXZbE1hYF8j65A+Iu8FwfN7dTNXgy+P5BMI0ssKRpb+lCyfmqyE6GEThJ
	 /KIHPeEg3wuBTx63O4L4Q0NKr1r2BmlVi18biGI17li5ZpAlLRkg0HDq165mcqaYB6
	 PhZqD5dA7YEHg==
Date: Sat, 4 Jan 2025 00:51:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Actually make use of the
 I2C_DW_COMMON and I2C_DW symbol namespaces
Message-ID: <wkx55fripv35i4pv5jnosx2s37dm54mrik2r6cfzjkl6poekmz@sagdynptzopn>
References: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

On Mon, Dec 30, 2024 at 04:59:49PM +0100, Uwe Kleine-König wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
> 
> Fixes: fd57a3325a77 ("i2c: designware: Move exports to I2C_DW namespaces")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> Changes since (implicit) v1 that is available at
> https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koenig@baylibre.com:
> 
>  - Also fix drivers/i2c/busses/i2c-designware-master.c
>  - Make added line breaks consistent

Thanks for this v2. I need to wait for Andy's ack, though, as he
had some comments here.

Thanks,
Andi

