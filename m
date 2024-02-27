Return-Path: <linux-i2c+bounces-2036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D1486A128
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 21:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4491C23260
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 20:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A391534EE;
	Tue, 27 Feb 2024 20:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca5UUYww"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EA152DE9;
	Tue, 27 Feb 2024 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709067078; cv=none; b=mSYjjm8YLFlEJGB/W9WHmfOqFi/0Pm1C4jhwK3sYkwrWccNtgbxXQ/oJVCDMYNBPhBeOhJLDCntJ30sK25UrZi3h6wqpSlhiHzIbPmDPsM7D84W4hVoM/2SZRK36diYsJpwORdwvMmkk9NviwDWiCdAKigWa97sJqJX4W+Av6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709067078; c=relaxed/simple;
	bh=cd8fCWScGdOm33tO38jM+0CahWaRNuRPqV225L5QbWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+mLNOnSNsBDcoQKmHCFgidO3eRS+NTeJBhzCPh5XSW09mYTCgRlNCCanTa3751HiaN4UhSsH5UgETWdDAdgJJhPo1vu9QggvKGN99hcabaKqHkRsIQd2LgC7CzmfFk6gR8ETk8Ze7pT3TqKCksM4OYUPsv/0V9hhS+P83fPYmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca5UUYww; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D613C433A6;
	Tue, 27 Feb 2024 20:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709067078;
	bh=cd8fCWScGdOm33tO38jM+0CahWaRNuRPqV225L5QbWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ca5UUYwwuQyu8P+1DIwei3ARFoRRUd3UkXWSNvsR26hcnDv61YhkNJl1tjaJkRZTq
	 Vz7fgo8jtUQpPknIGKZaSQqAN06bB7KDWCJ3A0MhEB0fJjp/6BFg1HE62+I0YNjlwU
	 UDj7D0cpxlpCoCrIBj9MGYV6c/77xAV4mwwlLJlKfBCQOHCD0SSEr0TnSWCt8Vsf61
	 Hs/khhKjRK59rls+kudR3mRNlWvGdRQ+gIbi83/+Wm2jfxcLvEkI8Rw7SxV+HEi6el
	 Cacy49X79zZcNfvxz67VA/0hneBVNrQD+/EmFcR0UeunkOG2FJH4vRkPyu0XlP82vE
	 1wwiPUoX6Efrw==
Received: by pali.im (Postfix)
	id B36CD828; Tue, 27 Feb 2024 21:51:15 +0100 (CET)
Date: Tue, 27 Feb 2024 21:51:15 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Marius Hoch <mail@mariushoch.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Message-ID: <20240227205115.szb32h7hxjjr6z3l@pali>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
 <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
 <20231223125350.xqggx3nyzyjjmnut@pali>
 <20240213150708.57148f6a@endymion.delvare>
 <20240215181633.2aevovw6wkxq5si2@pali>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215181633.2aevovw6wkxq5si2@pali>
User-Agent: NeoMutt/20180716

On Thursday 15 February 2024 19:16:33 Pali Rohár wrote:
> On Tuesday 13 February 2024 15:07:08 Jean Delvare wrote:
> > On Sat, 23 Dec 2023 13:53:50 +0100, Pali Rohár wrote:
> > > smbus is not really bus which provides discovering and identifying
> > > devices on the bus.
> > 
> > For completeness, SMBus version 2.0 actually added support for device
> > discovery and even dynamic slave address allocation. This is explained
> > in chapter 5, section 5.6 (SMBus Address resolution protocol).
> > 
> > Unfortunately, this is an optional feature which requires active
> > cooperation from each device connected to the bus. If any device on the
> > bus supports SMBus ARP then you should get an answer when probing
> > (7-bit) I2C address 0x61.
> > 
> > Long ago I had a plan to add support for SMBus ARP to the kernel, but
> > gave up because I couldn't find any system implementing it. If the
> > accelerometer device in Dell laptops supported ARP then we could use it
> > to figure out the device's address, unfortunately this doesn't seem to
> > be the case.
> > 
> > -- 
> > Jean Delvare
> > SUSE L3 Support
> 
> According to my notes, accelerometer in Dell laptops should use
> LNG3DMTR-LGA16-3x3 chipset. From what I found it should be
> pin-compatible with LIS302DL, just in different package.
> 
> ST LIS302DL datasheet is on the website:
> https://www.st.com/resource/en/datasheet/lis302dl.pdf
> 
> It is dual i2c and SPI bus support chipset. But in the datasheet there
> is nothing about SMBus, looks like this is designed for i2c usage. So I
> highly doubt that chipset supports SMBus version 2.0 with ARP extension.

Now I checked i2c address 0x61 and nothing responds to it.

> Anyway, SMBus ARP is new thing to me, I have never heard about it or its
> usage before. Has anybody else found some device which supports it?
> Would be interesting to know if this is not just another standard which
> was not publicly deployed yet.

