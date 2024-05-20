Return-Path: <linux-i2c+bounces-3604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA38CA1ED
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 20:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EB5EB20ED7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 18:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBE5136E3C;
	Mon, 20 May 2024 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V8Ckhm0r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CADB11184;
	Mon, 20 May 2024 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716229226; cv=none; b=Aw6yUKS3ocrUwEWNOfWPfERNKORCR/pvNHqH37Z0N9TBDdJV3B37GttfG9e+1/AHP8TvVC9kUeRlHv8pCn1+JNhH6iIIaoDTSzW6LrA3ocNzqarYyGef9aL/MFijzYG/WlM7kqQTem6VG4qKH27sx5OWqd1Z6rOl31MNlDP9nAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716229226; c=relaxed/simple;
	bh=H8Q72YEIGkjT9THTFe3AYhUu+aTl5214xKOqH1kKnuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcLNGM6/0XY7+8Wyd+Iy2EQ1EFgKvxOxvorfWcDLmyPdMK65JvOVKBa+rQfKD0Jp/zK5i/5SyU1N/XxzD79ZG6LIf9tVGtbOFUj1wWgnamRSm09cG7h05AfD/3xAQXQmQMgIXS18Q5FAtjwi8r1dNVcN53a2eltkYNKf3SO8OtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V8Ckhm0r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF816C2BD10;
	Mon, 20 May 2024 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716229226;
	bh=H8Q72YEIGkjT9THTFe3AYhUu+aTl5214xKOqH1kKnuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8Ckhm0rYvMwFmQ/oZ1VzNZO0UZUdSBjvHqX6GBMwCl6hjfbQmXFmEWkWVwxEmGvN
	 NADwlwY4GgmR4iTCJgnONQPa6TPzFhW6dIOLZhGFcE6kbASG61PBJdrstNSacJ5Mpg
	 U+KVqcejV+E3cTkiEqNmRuD1SGlrUOEqmp6prMCY=
Date: Mon, 20 May 2024 20:20:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>,
	bsp-development.geo@leica-geosystems.com, linux-i2c@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Peter Korsgaard <peter@korsgaard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
	Grygorii Tertychnyi <grembeter@gmail.com>
Subject: Re: [PATCH v2] i2c: ocores: set IACK bit after core is enabled
Message-ID: <2024052016-luckily-cuddly-bbe2@gregkh>
References: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
 <e98f8e4c-bd1f-43d8-aea9-52ea45c0d5c2@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e98f8e4c-bd1f-43d8-aea9-52ea45c0d5c2@web.de>

On Mon, May 20, 2024 at 07:00:08PM +0200, Markus Elfring wrote:
> …
> > Sometimes it causes failure for the very first message transfer, …
> 
> Would it be helpful to mention the term “data corruption” here?
> https://lore.kernel.org/lkml/CAGFuAuwot_7+R=J4NC=0Z_48YZ-RTJjRUoQnSjZUvpt=AWF39Q@mail.gmail.com/
> https://lkml.org/lkml/2024/5/20/549
> 
> 
> > Fixes: 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C controller")
> 
> Will the text “[PATCH] ” be omitted from this tag for the final commit?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n145
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

