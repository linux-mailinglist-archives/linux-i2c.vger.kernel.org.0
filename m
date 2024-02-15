Return-Path: <linux-i2c+bounces-1765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FDB856C45
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 19:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCEAD1C21C4D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 18:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9B9138494;
	Thu, 15 Feb 2024 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0kqmNTp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB613173F;
	Thu, 15 Feb 2024 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708020997; cv=none; b=i6WGMax2lmYajYhBVEn2LLCJYbWBWMOMfniNJ4h2ZrlESSzQbXKHPV7bjNNeyWSVC7cflV4N1aV8L+DY7JC8a2XOMN/1w1dGjNM3juZea2mq+07WGlfqNNZxDA10fJBsvpqhCAJaWyAxJW64zCUJtp703+hS/kEU9qn+hd9Kdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708020997; c=relaxed/simple;
	bh=Awfuobtglup8WyFBxQDNA8oCZmqRri8Ujo/a4iJOCY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnCX7jkVbACY7qBzraLRSrw8pWZ15bM/1UBhKxJkTabIECAkDWjmygfw04T/O6wcaH+51YWkc7exoxe10ZpMpRoopFJ8fPoeJACGDnYWERVjKGglZuAcACs2SxwIxupdIv+9N3D5bt0G5HUBV7zIwDDdljFcwd04yRuxRFmi/yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0kqmNTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21B3C433F1;
	Thu, 15 Feb 2024 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708020997;
	bh=Awfuobtglup8WyFBxQDNA8oCZmqRri8Ujo/a4iJOCY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0kqmNTpIor7iaOu/2rdZjj3yexSHjy0aPtL0aNOqXocBxWRDo8spEueJE7bxj1cL
	 RYl9w78bsmG+wQDMOWzLnb8PX/3jQ4Xh8cl9mh8we71zaK3eTXgifaKyO/e46YFfot
	 QTXBOwVTNxvUCZ1DalIieuDa5l9jwR+APUTbsWoPDPk6iN3KyTw2C4pCYVME5JQhiM
	 HQf/R1QN6JOtTHtEXEpVRk+6xHkcm2Z7iQGLfxePjk7DESqHspDY/xLy1FZf4t6K38
	 Zc3byWLalus4sXghfKDlfFUNHzmuN2HJNyV2riukbwH8cX+/ARbxuri8gxEAAL5JZJ
	 pMjbhPg8N6KEw==
Received: by pali.im (Postfix)
	id EC44F75F; Thu, 15 Feb 2024 19:16:33 +0100 (CET)
Date: Thu, 15 Feb 2024 19:16:33 +0100
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
Message-ID: <20240215181633.2aevovw6wkxq5si2@pali>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
 <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
 <20231223125350.xqggx3nyzyjjmnut@pali>
 <20240213150708.57148f6a@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213150708.57148f6a@endymion.delvare>
User-Agent: NeoMutt/20180716

On Tuesday 13 February 2024 15:07:08 Jean Delvare wrote:
> On Sat, 23 Dec 2023 13:53:50 +0100, Pali Rohár wrote:
> > smbus is not really bus which provides discovering and identifying
> > devices on the bus.
> 
> For completeness, SMBus version 2.0 actually added support for device
> discovery and even dynamic slave address allocation. This is explained
> in chapter 5, section 5.6 (SMBus Address resolution protocol).
> 
> Unfortunately, this is an optional feature which requires active
> cooperation from each device connected to the bus. If any device on the
> bus supports SMBus ARP then you should get an answer when probing
> (7-bit) I2C address 0x61.
> 
> Long ago I had a plan to add support for SMBus ARP to the kernel, but
> gave up because I couldn't find any system implementing it. If the
> accelerometer device in Dell laptops supported ARP then we could use it
> to figure out the device's address, unfortunately this doesn't seem to
> be the case.
> 
> -- 
> Jean Delvare
> SUSE L3 Support

According to my notes, accelerometer in Dell laptops should use
LNG3DMTR-LGA16-3x3 chipset. From what I found it should be
pin-compatible with LIS302DL, just in different package.

ST LIS302DL datasheet is on the website:
https://www.st.com/resource/en/datasheet/lis302dl.pdf

It is dual i2c and SPI bus support chipset. But in the datasheet there
is nothing about SMBus, looks like this is designed for i2c usage. So I
highly doubt that chipset supports SMBus version 2.0 with ARP extension.

Anyway, SMBus ARP is new thing to me, I have never heard about it or its
usage before. Has anybody else found some device which supports it?
Would be interesting to know if this is not just another standard which
was not publicly deployed yet.

