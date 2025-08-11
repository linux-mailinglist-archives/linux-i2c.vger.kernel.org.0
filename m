Return-Path: <linux-i2c+bounces-12232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E8B203AE
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BFBD3A1897
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754842DF3DA;
	Mon, 11 Aug 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bq4wsl90"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139EF2DECDD;
	Mon, 11 Aug 2025 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904560; cv=none; b=nrdBtxemgQA8sJu65HVSeGXnsHLUriLuX8eZMitG5HzxgqhKU9cNvA2zHw9ICHayWFz5AwOby0TTpkSuLYcxSaHAB6LQGIf+mhExbS4w6nNfyyKghwzLBrZ/FfUpRjAPgHmt0hZi2xQG6v36wBs7fNo5P2QQir3qY38xkbFiJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904560; c=relaxed/simple;
	bh=LiaVULGS/SbSG7cOk0MZVFo3SeDob9WijHRGHCmvWWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVv3P4/KqfYo9bZMAceybGtzjeXrh8KYEs+5uONFi568DxXrnc2xJB0nI47EgHMrmXbFdy4CTFm9ffJE+QAKDmdAQegFrciebYnMvDKOUY226y9Kwg2hICnW+1vYuT8EuxfQsI+/wWSdVatz1jnObPSb4910C4RfXbrAOn4UNkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bq4wsl90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB4AC4CEED;
	Mon, 11 Aug 2025 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754904557;
	bh=LiaVULGS/SbSG7cOk0MZVFo3SeDob9WijHRGHCmvWWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bq4wsl90SHEr8u4y6pVbWTy8TNlLDWeCj41f87An82BLARS8Ho6CIg1bQ0vu5c/zp
	 fxgTnNorUvR6Cisuz/jV+eyfo9nYzGQB6npJwOszc0HGd959fxsz7dl6QYkokf9SW7
	 bbF+K0zWsQw3FROY75z6ri1dmn/h3AYK4KsLYUTNJSwwi3NqZQ/3KWTOG+MWNkWOVk
	 BiLZ9V7X2zS6BkBUvKkAemCrSrJFBYWm8uw8RvxA6GfdN6IldUje/mI1v30g/mTPU1
	 LkDqQQKG2dzHvvRvQGYm0Z4L0w7MmMHW6GFFBGXJxlNwdHbcIzCKgecJ8YX7y8tZIZ
	 MUBhJWdD8z/fQ==
Message-ID: <086653c5-f0aa-4392-a6e2-e42352ad8afd@kernel.org>
Date: Mon, 11 Aug 2025 11:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain> <2025081106-could-hazily-3e58@gregkh>
 <aJmb4ZoUrnNTpM2W@kekkonen.localdomain>
 <2025081128-ecard-ecosphere-8170@gregkh>
 <aJm2naLnWChQOChH@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aJm2naLnWChQOChH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Aug-25 11:23 AM, Sakari Ailus wrote:

...

>>> The documantation says you can't access USB interfaces once disconnect has
>>> returned. I'm not sure if there are checks to safeguard against ongoing or
>>> additional accesses in the USB stack but on many other buses this may
>>> simply lead to a system crash.
>>
>> How can you access the USB interface after disconnect has returned on
>> these codepaths?  The child devices should all be cleaned up properly
>> after disconnect happens so there should not be a pointer to even use
>> anymore.
> 
> See functions exported by the main USBIO driver.

As Greg says the rules for USB devices are clear no usb_device access
in any form is allowed after the disconnect() callback completes.

It is up to the USBIO driver to ensure that this does not happen,
also see my proposed disconnect() changes in reply to your review.

Note those changes are to fix races between the auxdev child/client
drivers and disconnect() the auxdev client drivers also should no
longer make any calls to the USBIO functions after their remove()
callback has completed.

Regards,

Hans



