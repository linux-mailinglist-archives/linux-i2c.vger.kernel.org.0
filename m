Return-Path: <linux-i2c+bounces-1542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A8842F47
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 22:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50B71F24C62
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 21:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83037D3F5;
	Tue, 30 Jan 2024 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1kVFnly"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799EB7D3F1
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706651898; cv=none; b=l9FE2Mogap3nbNVsh4xZGgbVrvBHFCq6sDTGy1TS2W0tZsPR3Bx26umakXiqFCSYNMv+rz8xJhOZkPd0BYGx5E92T8OS4edNtr+sSfAKKxJzo87NGM4FnmzbXsNfjY/r5Fpnav5gHbT8/R0wdCBFlPnCYb16FbYhEKzTyKB4TuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706651898; c=relaxed/simple;
	bh=Awu+hN+7EIxk3RXU1H3zRBXNo3AjmsHi1FueAW9nxOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbWuT0+z6t3VxbpUEBKc9Dou80+KGdUgMVfHl158pM+WPtZKNJwHEm9ZdYacu7QrvIE4TZWwI6NTBHn/0hm9+cBwSkG5AGjscxiX4LVrurLmytueftgrhomqSFl4gt+MMxntnFuH7Hy3LaRgsEkCp2mWjquZws5ooKvWRKpJzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1kVFnly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE277C433C7;
	Tue, 30 Jan 2024 21:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706651897;
	bh=Awu+hN+7EIxk3RXU1H3zRBXNo3AjmsHi1FueAW9nxOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1kVFnlypfPcE1iq7+tBuOZvYnNYwkVE3+lUl1XYfgPtt2v2B9YYSFjs7pulPirKO
	 zmgxIo8cHIM4AyViXLRQTXxgsBLyN2aKxnZoLn1cAPBLzKo+kq+0hz9vtqkff6J2B5
	 NXsyA8dSvNadCvybcty/Z/lULvF1oRj5WP1q6FJ21uLkiD2Ral/b+gTM8cXIlKki7I
	 2npyIoAYqFKKwePx1k+C2YufeSTot72Ki8aOwUwewH7r6K8erWOPwsqK+DMnew4RVo
	 4/3Qiin4pJ0VYSyQ7lAoB0FUxeM8Msg1s50anq/Mql/bTnt9Ow0Dqx914lPjtI3kqV
	 zn7Bxooy8qcgg==
Date: Tue, 30 Jan 2024 22:58:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/8] i2c: i801: Use i2c core default adapter timeout
Message-ID: <h3opuzzid76qeiwe2ghxpkshj7my27pkrmblrds6kxrvvqvzyw@5ow6ceypibwe>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>
 <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
 <5816ddf4-1623-4bbd-9178-342a79eab768@gmail.com>
 <7ljbyo7slq74nnwelifdtjhfopy2vozo4qy7cfvrzbeqderpox@ijrb5fqwfztn>
 <b86980f9-add0-4e59-bb4b-4353344d5f2d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b86980f9-add0-4e59-bb4b-4353344d5f2d@gmail.com>

Hi Heiner,

On Tue, Jan 30, 2024 at 11:25:33AM +0100, Heiner Kallweit wrote:
> On 30.01.2024 11:00, Andi Shyti wrote:
> >>> On Fri, Sep 22, 2023 at 09:35:55PM +0200, Heiner Kallweit wrote:
> >>>> I see no need for a driver-specific timeout value, therefore let's go
> >>>> with the i2c core default timeout of 1s set by i2c_register_adapter().
> >>>
> >>> Why is the timeout value not needed in your opinion? Is the
> >>> datasheet specifying anything here?
> >>>
> >> I2C core sets a timeout of 1s if driver doesn't set a timeout value.
> >> So for me the question is: Is there an actual need or benefit of
> >> setting a lower timeout value? And that's something I don't see.
> > 
> > yes, that's why I am asking and I would like to have an opinion
> > from Jean. I will try to get hold of the datasheets, as well and
> > see if there is any constraint on the timeout.
> > 
> The datasheet for the 7-series (doc# 326776-003) states:
> 
> 5.21.3.2 Bus Time Out (The PCH as SMBus Master)
> If there is an error in the transaction, such that an SMBus device does not signal an
> acknowledge, or holds the clock lower than the allowed time-out time, the transaction
> will time out. The PCH will discard the cycle and set the DEV_ERR bit. The time out
> minimum is 25 ms (800 RTC clocks). The time-out counter inside the PCH will start
> after the last bit of data is transferred by the PCH and it is waiting for a response.
> The 25-ms time-out counter will not count under the following conditions:
> 1. BYTE_DONE_STATUS bit (SMBus I/O Offset 00h, Bit 7) is set
> 2. The SECOND_TO_STS bit (TCO I/O Offset 06h, Bit 1) is not set (this indicates that
> the system has not locked up).
> 
> It's my understanding that the chip will signal timeout after 25ms. So we should never
> have the case that the host timeout kicks in (as long as it's >25ms).
> So the host timeout value doesn't really matter.

This driver is used by many platforms. I scrolled through the
datasheets of few of them and they differ from each other.

This was set by Jean[*] that's why I need to hear from him from
where this 200 ms comes from. 

As this change doesn't change much to the economy of the driver,
I would take it out from this series or place it at the end.

As of now, I'm going to take patch 1 and 2 in and you can
resubmit a v2 without the first two patches.

Thanks,
Andi

[*] b3b8df97723d ("i2c: i801: Use wait_event_timeout to wait for interrupts")

