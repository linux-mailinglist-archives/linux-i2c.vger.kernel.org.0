Return-Path: <linux-i2c+bounces-5347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF746950D75
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 22:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 175451C21803
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 20:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5019554279;
	Tue, 13 Aug 2024 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="bWFO1MQy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx15lb.world4you.com (mx15lb.world4you.com [81.19.149.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC5A953
	for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 20:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579267; cv=none; b=BinYhBx0YcuA63Q3YpHrK+9687zUsGj874f+LMRhpN9DMbngbt8heAF+lESxfM9vzditDr4NxEHkzbGA4i/u/9b1mv+fuDz2hkrl02gb6HXBx4wOscJaZGdto74co+BtgceDtjoH0bNKt+y1v87rUjMdXTWHi2mG0mEwsQRkI9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579267; c=relaxed/simple;
	bh=xLaT9LzKHB/6GOtMyNYRZmgkfonBoVuHmAlwqkohNNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKLfhleOYWaJ/RZlBPp/Wj3hieX4ON7hIJIwE59UXRo2z6cFfIoLeQOBUVKA2DGXDjGdSDj85S7PtVRJ1DK4zGHDcB6174pX9DSCnCQ9shbAwGT8q9z4SiTOPZvPWCQMaC1QEoT6AuipBwYD1FVZxxo9++eki1tn8U6NDQlZzaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=bWFO1MQy; arc=none smtp.client-ip=81.19.149.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iTviFQ5RZPs9joZAjvN50a5W1hlIsEPoDpkX0Ixb/1g=; b=bWFO1MQyF/A5E5e4osgKvS+rPJ
	OYv3Z51bn6gA//aA0ppQAjzdpsIWdLvZCbUW/AAx3e+gGsTdDHSxIU5Tt6FRURKWn5Kvfy6Vnz6fv
	JIKsrPPDFMDnFW8zaj6HkFlNwCxIe0aZRqJWeIWs2yB+qtPxLUkQfJgOT+R7MHQZjCWg=;
Received: from [88.117.63.232] (helo=[10.0.0.160])
	by mx15lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sdxhP-0000Ih-0E;
	Tue, 13 Aug 2024 22:00:55 +0200
Message-ID: <315fb032-f363-4b3b-b0a7-a97e9b33261b@engleder-embedded.com>
Date: Tue, 13 Aug 2024 22:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] misc: keba: Add basic KEBA CP500 system FPGA
 support
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org, arnd@arndb.de, Gerhard Engleder <eg@keba.com>
References: <20240710175702.22344-1-gerhard@engleder-embedded.com>
 <20240710175702.22344-2-gerhard@engleder-embedded.com>
 <2024081316-deafness-flagstick-15e9@gregkh>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <2024081316-deafness-flagstick-15e9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 13.08.24 11:39, Greg KH wrote:
> On Wed, Jul 10, 2024 at 07:57:01PM +0200, Gerhard Engleder wrote:
>> +	ret = sysfs_create_group(&pci_dev->dev.kobj, &attrs_group);
> 
> You just raced with userspace and lost :(
> 
> Please use the default groups for your driver instead, that way the
> driver core will handle all of the creation/cleanup properly for you
> without having to worry you about it.

I was not aware of that. I will take a look on it and post a patch.

Thank you!

Gerhard

