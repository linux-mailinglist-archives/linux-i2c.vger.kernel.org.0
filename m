Return-Path: <linux-i2c+bounces-1708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680F854CF3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 16:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EEF1F2171E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 15:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0837F5CDD1;
	Wed, 14 Feb 2024 15:34:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A485B210;
	Wed, 14 Feb 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707924874; cv=none; b=Mjd7fQUROU6S+x60fRtPOgYJ+qsDHeAtT8hSvJvuIAIUQdtI8Tn8IUFZvU/RN9DuSDeNSr257LMwKaBOX4Dknq9YJtt9nXM8d+ykQaodDbQ4PpVFaxftCynTP+KRtagPtSWKD4v61oFjuN6KwRDhfKetsl+thVvp4OCIKCDqPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707924874; c=relaxed/simple;
	bh=z6CvO0y3Hhjv+q9Wa5CPsASVDU6hsXyXmEuDXE5FZws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ty9HTiKtWew8Vh7OIG6GYLhSkurHCqBcYd63AW+hV53gTqqgAnsQ8TZ37bwcEIZeO1gO7NB8uRPsbJxM3cNvNGF6OIahOKS975kJSG+Yr8bxF4XjyNLR1j1P72TBaJFQm88qE24CY1CLAg8g5uX6utfzOwiddaW/ZDLlLqNeZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1raHHK-00022Q-E6; Wed, 14 Feb 2024 16:34:30 +0100
Message-ID: <6e20e772-e50e-4600-8325-1878badbbdc8@leemhuis.info>
Date: Wed, 14 Feb 2024 16:34:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] `lis3lv02d_i2c_suspend()` causes `unbalanced
 disables for regulator-dummy` and `Failed to disable Vdd_IO: -EIO`
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, regressions@lists.linux.dev
References: <5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de>
 <ZcTmdg2qTq0bP0ul@finisterre.sirena.org.uk>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZcTmdg2qTq0bP0ul@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707924872;7ee0f297;
X-HE-SMSGID: 1raHHK-00022Q-E6

On 08.02.24 15:34, Mark Brown wrote:
> On Fri, Feb 02, 2024 at 12:38:04PM +0100, Paul Menzel wrote:
> 
>> Testing commit 2f189493ae32 (i2c: i801: Add lis3lv02d for Dell XPS 15 7590)
>> [1], it’s very likely this commit, it turns out, that Linux logs the warning
>> below during ACPI S3 suspend:

Mark, many thx for your reply:

> The driver is just buggy here AFAICT,

/me reads that as "buggy even before 2f189493ae32, that commit just
exposed the problem"

> it's powering off the device in
> both runtime suspend and runtime resume so if the device is runtime
> suspended when system suspend happens then it'll power off the device
> again.  The runtime suspend and system suspend need to talk to each
> other here.

Well, that was 6 days ago and nothing further happened. Makes me wonder:
Who will look into this? And when? If not any time soon I guess we
sooner or later should consider revert this. Yes, the problem is "just"
a warning, but well, it's not "just" a warning for people using
panic_on_warn...

Paul, just to be sure: I assume reverting 2f189493ae32 fixes the problem?

Ciao, Thorsten

