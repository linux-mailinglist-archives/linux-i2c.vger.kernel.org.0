Return-Path: <linux-i2c+bounces-11712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CEAEE6EC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 20:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D69188983A
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 18:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9262128E605;
	Mon, 30 Jun 2025 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrh7l/gM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409672F4A;
	Mon, 30 Jun 2025 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308827; cv=none; b=fDiuBe7HTMwHso/Crq6rNTvleHCntLjscogkOLvCBQdiO+rVbDJUqtX5Q8unvHXlUJVYYQCKtaOh1EoucvCjfeR7s5a7JiorGtOq8x6LT4/+63U5H8gND+Oy0ay2aRRxAaCuIKwGdeJuLjvg2eK7dUEZaRHXoenwp5dE4+d8ZIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308827; c=relaxed/simple;
	bh=HvnvaBYgdENhHqpQAACls3hq+6edewLfz6BoI0wweO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YT1FzN80Fb4SicxlQp2i7SScndy47+3htWlW70xRubkHSxH4fmuhI8GccOQqvefrcKgX+kZoIlWPATGNOJe4BZGutCBT1rzR0tJxt0Vkxv9NHo+Awe1JKr765yXKraYbWrOQcVIelzfmCRsbFpHw+3cknUBBJRnP8QM0egMjNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrh7l/gM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7372C4CEE3;
	Mon, 30 Jun 2025 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751308826;
	bh=HvnvaBYgdENhHqpQAACls3hq+6edewLfz6BoI0wweO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rrh7l/gMT1u4tR6AO151tNM7udPNrjM40kmIEOjv49+M4ij+HeUQOH/M/TDNzf9Yz
	 YH6kL0z/UQorYHo2qDSGiG2TAG1ZC121FvUi+HWJazRIpo7oM2a4NhsHl4ea5V3erT
	 QdOpIfKwM16cqy6PG/5Tu2qZmUQPKlXwUi2FvRbFGF2JWDkh5HE6/9nlKboE5MMt4L
	 Hlo5C5Ag9JcsCD/8o5BZj0hKpSGc/5i3TDZA7Z3i/EBpKKQmZ9w8/v2rhdaSEgNyaI
	 wiHFfTey5e0QEOvDDQRrYzgkFi8SlWcufbyaQeDlpFFrLmq6kjhgiORA8QI1wJVbnr
	 ps4FOhKyxI3ow==
Message-ID: <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
Date: Mon, 30 Jun 2025 14:40:28 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Askar Safin <safinaskar@zohomail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux i2c <linux-i2c@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 regressions <regressions@lists.linux.dev>,
 DellClientKernel <Dell.Client.Kernel@dell.com>,
 linux-gpio <linux-gpio@vger.kernel.org>, Raul E Rangel
 <rrangel@chromium.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Werner Sembach <wse@tuxedocomputers.com>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/2025 3:14 AM, Askar Safin wrote:
>   ---- On Fri, 27 Jun 2025 07:58:15 +0400  Mario Limonciello <superm1@kernel.org> wrote ---
>   > That's odd.  It should be made when the PMC core driver binds.  Maybe
>   > others will know what's missing here.
> 
> Command "grep -r -E -I last_hw_sleep ." in culpit kernel (1796f808e4bb2c074824d)
> shows nothing. (This is somewhere around 6.1).
> 
> So, culpit commit is too old.
> 
> If you want, I can retest this thing on current master and on current master with
> revert 1796f808e4bb2c074824d.
> 
>   > I see in your bad config interrupt 14 is waking the system.  In the good
>   > config interrupt 8 is waking it.
>   >
>   > What is in /proc/interrupts?
> 
> /proc/interrupts from culpit kernel: https://paste.debian.net/1382819/
> 
> --
> Askar Safin
> https://types.pl/@safinaskar
> 

Looks like your interrupt 14 is ACPI device INTC1085:00.

Some quick searches this seems to be an Intel GPIO controller.

Andy,

Any ideas how to debug next?

