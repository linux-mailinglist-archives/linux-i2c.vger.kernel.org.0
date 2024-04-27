Return-Path: <linux-i2c+bounces-3246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB98B4564
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 11:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79E1F282A5F
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522B14644E;
	Sat, 27 Apr 2024 09:39:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F038DD3;
	Sat, 27 Apr 2024 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714210773; cv=none; b=cnieZW0HfauUt8rbty5wAlnyhidrGBOehw0S6EgyJ1HQ4L6j2/MHS5C3txAZCe9YmNi/EfZPw+2cpTrryJU2kM80ADiLGcUu8VuK1lGRsqb9DcCX244xWkhDtHqRE6bg5PJUxvDi9zc5PaPNCMXQu2kF1YJXiMxNgINV/6NaY+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714210773; c=relaxed/simple;
	bh=/H4zyayMFbTVCbpSwsMCiDPxHUmGmF8OgiZKEA4x4Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=WXDJ2A/iREp/R8SMZrBTyhost65YA3SMTHnxJqePdF0ELC/CcyoymRyGzt8MP3EvGMVX4+JHRp40TMGaqfwSuxCePRMF6Eyx4pI+gaQo/O+g5Sbwx0hw+u2BNr9Ze+zfMhVBKCMCThgXlj1aJjtHAT/se88jFn8JngYiNIkh6Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.44.21] (unknown [185.238.219.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5CE4061E5FE05;
	Sat, 27 Apr 2024 11:39:19 +0200 (CEST)
Message-ID: <72ef1975-0bf2-44fb-9701-7fbba93940a9@molgen.mpg.de>
Date: Sat, 27 Apr 2024 11:39:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: smbus: Add (LP)DDR5 types to `i2c_register_spd()`
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240426220748.28184-2-pmenzel@molgen.mpg.de>
 <20240427091408.3gbzxe2rlu2m5wyt@ninjato>
Content-Language: en-US
Cc: Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240427091408.3gbzxe2rlu2m5wyt@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Wolfram,


Am 27.04.24 um 11:14 schrieb Wolfram Sang:

>> 1.  I have no idea if the name ee1004 is correct.
> 
> I am afraid this won't work. It was tried already in 2023:
> 
> https://www.spinics.net/lists/linux-i2c/msg62267.html
> 
> Especially note Jean's answer here:
> 
> https://www.spinics.net/lists/linux-i2c/msg62420.html
> 
> So, DDR5 probably needs a new driver.
> 
> But thanks for trying!

Thank you for digging this up. Would it be alright, to adapt the warning 
for (LP)DDR5?


Kind regards,

Paul

