Return-Path: <linux-i2c+bounces-12830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A7B517C9
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 753A21BC8248
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEC51E9B35;
	Wed, 10 Sep 2025 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqEYpfmF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF7B1531E8;
	Wed, 10 Sep 2025 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510612; cv=none; b=F5+viuiGooOp5eyKIUICG38TMtHoHerNHpQR4uoW7iEjkZWprmp3mjlRReUyUkRCyp4kfmtOdaJ1TSnEcOKsyAMH6pTGk3r5QI5X7c2q/CS0b5GrG8FeHlt0TAeAFv/KnE0b6Uim12UvzpCntnMfwMHUZGwDkvb44H7qG556nUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510612; c=relaxed/simple;
	bh=POlDm9ETVbJqB8byGPBrRt3O7g7FWLbqferOdSXXPW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRL7qh9CEKfrIDK4hSAliPWrCiX4p6/SJte0Dk5pOUAdathobdEXeg425QXIwSjYmOWEa2IX12Ocj7lPNDp1lqZQhnXdCBABM8UiCM5ojNyN3Osi9L6LglFD2U3IAgrEa/rWNIDrl36uYk8e+TAwbouxtrJYtYr0n/n+3erYbkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqEYpfmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87148C4CEF0;
	Wed, 10 Sep 2025 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757510611;
	bh=POlDm9ETVbJqB8byGPBrRt3O7g7FWLbqferOdSXXPW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DqEYpfmFr2ed2C5hsMRALmjBwMMi1t4c4NMF88vK6OnDozzI20IjyG4gX0FdeYLR8
	 A6Yiy+nrnJ+vFZfMm+vJaqEIufIWlQrULw8QkxhTRWIHZFONV6CX36kLyohyX2vORb
	 8YKg7BtOF6ZGjWY5dFOov3W4SJs/iVb2UAG6Vm1C/d+8npWMBqOv2uuqGBvgT4KOyD
	 nP2nTaXf427bkFC9VWakXKARxXkhS9gTsrKhEkCSIU5lHl/fVO9t/Zs3MCvR8UbVQc
	 rrbaM3vlvkEttgHp4TlEf4UKfDFbqmUAAfex3i1mTRvnCk3ozpoDVf960XpIRFGHZx
	 8k+gSixgIN2aA==
Message-ID: <4307bb2d-9908-4fc3-8a0f-ff2696eb0017@kernel.org>
Date: Wed, 10 Sep 2025 15:23:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] gpio: Add Intel USBIO GPIO driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250907175056.47314-1-hansg@kernel.org>
 <20250907175056.47314-3-hansg@kernel.org>
 <CAMRc=Mcwez1bebe4KBxh2V23+U3A6Fhz3q_dC1XmnT1DfD2Yig@mail.gmail.com>
 <a77d0593-4001-4315-b8de-22c4b85f213f@kernel.org>
 <CAMRc=MeHefqC-8qY3SZNhXSjyu9VnMnx-N5bWeBxVh0TpwAUOA@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAMRc=MeHefqC-8qY3SZNhXSjyu9VnMnx-N5bWeBxVh0TpwAUOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Sep-25 3:18 PM, Bartosz Golaszewski wrote:
> On Wed, Sep 10, 2025 at 1:34 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Thank you I'll go and preparare a standalone v3
>> (since the other 2 patches have no reviews yet).
>>
> 
> Please, don't do this. This is a great way to confuse everyone involved. :(

Usually I'm not a fan of this myself either, but in this
case it seemed appropriate (see below). Regardless it is
too late now since I already send v3.

>> As mentioned in the cover-letter it is probably easiest
>> if Greg merges the entire series through his usb tree
>> once everything has been reviewed.
>>
>> Once I've send it, can you please ack v3 for merging through
>> Greg's USB tree?
>>
> 
> I would prefer to ack a patch that's part of a proper series, this
> split makes no sense.

Since v3 should be the final version, my plan is to put
v3 into the v3 series unmodified, so both v3 postings
will be identiacal), preferably with your ack already added.

I chose to send out v3 separately, so that you can already
check it an ack it now.

Also in my experience reviewing new versions is easier when
things are still fresh in ones mind and I dunno when the other
bits will get reviewed.

Regards,

Hans




