Return-Path: <linux-i2c+bounces-4638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CDF927A8A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 17:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2140B210FF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 15:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34FE1AE87F;
	Thu,  4 Jul 2024 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajtzsszZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98B1AC25A;
	Thu,  4 Jul 2024 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720108477; cv=none; b=YaSuZ+f/xmx7LY7ZrjJyK5Mi7VeiMJaMX1Madudp9nC66R21OsDMa2sVgqZvyBlyGq02tgG/+H8wLFTCnLcCGoXnrTk/BoZg9ZkGR8jmJUXTvgl+fy5yXNHzCAx/t1O0bhLvgpGwcCL1z9cEwvH2GIegS0VFn88WYAl+0QEccb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720108477; c=relaxed/simple;
	bh=oAPLBuaHGfBG4ySH8Pf7W7dRQ9t3+2lb9AMrAf4PxGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8A5Sjfw1SU/Ne269VLrxc0Sv7N/NVV9BvQHLXrYvt/Um2N1XRzqj1rjButbqp2n0O03gFiuEPfAPMWL0wcCmocJNfJ1AGUqeoltLyP/eb8FumG5JlXVEom9vTYyQSNPTDOH/PSotgtGPYlYDU/Tl4HKlVIyrEdKgPLcf1TcTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajtzsszZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89548C4AF0D;
	Thu,  4 Jul 2024 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720108476;
	bh=oAPLBuaHGfBG4ySH8Pf7W7dRQ9t3+2lb9AMrAf4PxGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajtzsszZ0sD14waUFHzSX4EOv9kORx2z+IVmmxE7sl6qKN/311gFGIfuvRUIhbN0+
	 EBFmca7LJ686IXBAjB8antplENDNhEwpZ5yu1G/SXEQ13UvgnQk2oHXYrNowJETXhJ
	 TA9w/x18Jeigt1yCP9e1lXfxtlQrZQaSMEAbfo2j23BwB8Tlo9Ljr7T0QVmsdl75LB
	 q/xjW1uwpaHVjgnr3RX3Ef2cGSz4IJqcqYRQH4OdU9t+5eA9q+ecWAHgaMvmphUD81
	 HsEnlTCZcLkCsCunN7ar2RkmTQzrAaG+glWOnVJdq4jKpnsJ0eGrnOWwocsRGQscPK
	 oAPFcy6PHk5Mg==
Received: by pali.im (Postfix)
	id 44F9BA5B; Thu,  4 Jul 2024 17:54:33 +0200 (CEST)
Date: Thu, 4 Jul 2024 17:54:33 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <20240704155433.pe3j3bclr3ukn2w5@pali>
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624182812.fa6akymygv3qolug@pali>
 <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
 <20240703184121.t2wh5sb5ki2kwots@pali>
 <991b1de6-10fc-4917-8e1c-442a71adf04e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <991b1de6-10fc-4917-8e1c-442a71adf04e@redhat.com>
User-Agent: NeoMutt/20180716

On Thursday 04 July 2024 12:17:27 Hans de Goede wrote:
> Hi Pali,
> 
> On 7/3/24 8:41 PM, Pali Rohár wrote:
> > On Wednesday 03 July 2024 12:58:01 Hans de Goede wrote:
> >> Hi,
> >>
> >> On 6/24/24 8:28 PM, Pali Rohár wrote:
> >>> On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
> >>>> Hans de Goede (6):
> >>>>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
> >>>>   i2c: i801: Use a different adapter-name for IDF adapters
> >>>>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
> >>>>     dell-smo8800-ids.h
> >>>>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
> >>>>     from i2c-i801 to dell-lis3lv02d
> >>>>   platform/x86: dell-smo8800: Add a couple more models to
> >>>>     lis3lv02d_devices[]
> >>>>   platform/x86: dell-smo8800: Add support for probing for the
> >>>>     accelerometer i2c address
> >>>
> >>> Patches 1-5 looks good. There are just a few minor things, but you can add
> >>> Reviewed-by: Pali Rohár <pali@kernel.org>
> >>
> >> Thank you.
> >>
> >>> For patch 6 as I mentioned previously I'm strictly against this change
> >>> until somebody goes and politely ask Dell about the current situation of
> >>> the discovering of accelerometer's i2c address.
> >>
> >> Dell is on the Cc and not responding...
> > 
> > And what do you expecting here? That somebody on the group address
> > specified in CC list would react to all your tons of messages? Not
> > mentioning the fact that you did not even ask anything.
> 
> You keep on repeating this since I first posted this patch
> in December last year, but as I already wrote back then:

Yes, because you have not done anything and you are just repeating those
nonsenses. What are you expecting? You are either doing all this on
purpose or you are just lazy and think that somebody (e.g. me) would do
this stuff.

> https://lore.kernel.org/platform-driver-x86/8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com/
> 
> "Unfortunately I no longer have any contacts inside Dell"
> 
> And Paul Menzel reached out back to gkh back then asking
> if Greg had any contacts in he did not have any contacts
> either.
> 
> Dell.Client.Kernel@dell.com is the official address listed
> for Dell drivers under drivers/platform/x86 .

Perfect. And may you explain why you have not tried to contact them with
addressed requests of exact information of what you need and ask for
help? You wrote tons of emails with zero value.

> > This is not how things works.
> 
> The email address which I'm using is *THE* one which Dell has
> provided for contacting about Dell pdx86 drivers. I really
> don't know what else you expect me to do here.
> 
> You just keep repeating that Dell should be contacted about
> this and multiple people (me and Andy) have already pointed
> out that Dell does not have any other contact info. Repeating
> the same remark over and over does not change things.
> 
> As I mentioned in my other email too, if you think you can do
> better feel free to try and contact Dell your self, something

I'm not your servant and I'm not going to play role of your secretary.

> which you could already have done the first time you mentioned
> this in December 2023, back when I already said I don't have
> any other contact info for Dell.

Could you stop complaining? I'm really not interested in your stories
why you are not wanted to do anything.

> > If you do not change your attitude here then I highly doubt that
> > somebody will respond to you.
> > 
> > I have feeling that you are doing it on purpose just because you do not
> > want to do anything, and trying to find some kind of proof that nobody
> > is responding to you, to convince others for merge your last hack change.
> 
> This is just plain hurtful I do not believe I have ever done
> anything to earn this level of distrust from you.

Then read your message again. Now it is more clear that you are doing
it on purpose.

> I am hurt that you cannot at least show the common decency to
> assume good intentions from my side.

I hope that I do not have to explain you how to find contact address in
MAINTAINERS file, how to write an addressed email for target audience,
how to formulate questions and how to ask for information. And how to do
it in _one_ message.

> Regards,
> 
> Hans
> 
> 

