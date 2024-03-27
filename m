Return-Path: <linux-i2c+bounces-2633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525888F03B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 21:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB9E1F33EE1
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 20:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79651534E4;
	Wed, 27 Mar 2024 20:36:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C49152DFE;
	Wed, 27 Mar 2024 20:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571764; cv=none; b=uz7OLFrbeklhDyBjmixz1NSUH5XdAYsMnRTyvgOYvPYu1wJ3YW4fUmsXNy07WXznJOcwHmryTGDxgn2ugomIoRE2y+EnIRsltcJhaModMCZobsViOjzSOKthFi4aPMY+/AWwa+YOM5e/ewz47tugBZazb6Y94Bf43gel538NtXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571764; c=relaxed/simple;
	bh=AhyJ755kcDLwcJwD7Lrs1wSzoJVPUciXifrg1bevhik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ponm6LeTtFtTx6HGOaKBCQ8Ki+1i6n+Fxxrj24lTcGkklwrSibETG/T3KbD6I8ZAV7xUM7g37wyOwPHg5vI81g+HzQOgTDAJhYJTS11nn9+CIHoRqycbFdOtGa1G1uUT+Bspcvsf5sp6tiWMOal2Bb19FBcDEEFAeYODwn21r+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9591E61E5FE05;
	Wed, 27 Mar 2024 21:35:38 +0100 (CET)
Message-ID: <4fa53db0-358d-4e30-bcfa-745cab71fa72@molgen.mpg.de>
Date: Wed, 27 Mar 2024 21:35:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Please backport commit 13e3a512a290 (i2c: smbus: Support up to 8
 SPD EEPROMs)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <3bea11ec-32fe-4288-bc03-8c3ba63979f6@molgen.mpg.de>
 <2024032713-atom-saxophone-0c15@gregkh>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2024032713-atom-saxophone-0c15@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


[Cc: +I2C folks]


Dear Greg,


Am 27.03.24 um 17:52 schrieb Greg KH:
> On Wed, Mar 27, 2024 at 04:13:26PM +0100, Paul Menzel wrote:

>> Please apply commit 13e3a512a290 (i2c: smbus: Support up to 8 SPD EEPROMs)
>> [1] to the stable series to get rid of a warning and to support more SPDs.
>> That commit is present since v6.8-rc1.
> 
> How far back?

I’d say 6.1.

> But isn't this a new feature, why is it needed in older kernels?
> It's not a fix for a regression.
decode-dimm does not work on systems with more than four SPD EEPROMs, so 
I’d say it’s a fix.


Kind regards,

Paul

