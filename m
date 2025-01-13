Return-Path: <linux-i2c+bounces-9062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F03A0C1BF
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 20:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26EFE1688D4
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 19:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2101C3BE6;
	Mon, 13 Jan 2025 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="So2s0BHv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1721E526;
	Mon, 13 Jan 2025 19:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797636; cv=none; b=Ti8FlUg36dIOa7UUmXXPX3BIvf6qtbDcHmpD/rk672JtTAUhFS5x3F5SA8KJTq7GRYgBsy2472CY4+NZxb06k3vjoTGa0coFkv3UlB6j2hzsRIB+sqFrW3Ab1z/8JebeZpbf+nd+MyY9JpQCkHB7X8h9PZ3dHJ1p5ageBNpWd0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797636; c=relaxed/simple;
	bh=ZHezPWkI3wQx4A0yOUv39qjSZkb7g0k/qk0RVtb9bhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHQkLLlJTF9amP6m/mlu6q2jaIxDVKpEF1e/4sDazJCnZxtAfvwLqSis7lVLPcLgtdMrGeAwMXV/mf7tgRbjS4gx5t3rQgswyg0hBfCQvPlew0CkBZZ09niv18z0XXe8bv/7YeJ6ikqPmNNyKcDoLbJZA1jlihCfT1Htpx82teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=So2s0BHv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0663AC4CED6;
	Mon, 13 Jan 2025 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736797634;
	bh=ZHezPWkI3wQx4A0yOUv39qjSZkb7g0k/qk0RVtb9bhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=So2s0BHv/vcLgub3rCs2nAC3+uhY2kDUCmEVnMdCXGkrDwVV9PC3GiCMi4C7vZuAm
	 mCn53DzJrxFpciGlMhR7ffgENcyPoPwbL3r77xeQgEbEnKnmazvHSzOhXbt/T4PKKQ
	 sjXCGT99fhUKFviTcibSq7n4luU7Mexp7eIZ+qneBYsT552SfF+JHB4oYIqijE1H45
	 suItC7tUIcU95BpGSx7a2+yvtvNSt1KsZCeEV31j1+YiwX3k1AtBRUvKT0agWsSUOM
	 cEgku74Lwvg7UH3/ZafpgO3S+apyfNN9CWIeqTdxr2XVAX3vn4wqxGuJgdRCxGQ+KX
	 yx8A5hX5FIDdA==
Received: by pali.im (Postfix)
	id D924D77A; Mon, 13 Jan 2025 20:47:02 +0100 (CET)
Date: Mon, 13 Jan 2025 20:47:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <20250113194702.j6ou2d7c3vn32unv@pali>
References: <20241209183557.7560-1-hdegoede@redhat.com>
 <20241209183557.7560-5-hdegoede@redhat.com>
 <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com>
 <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
 <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
 <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com>
 <2b2a3d16-039c-4cdf-94b9-41d074558d97@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b2a3d16-039c-4cdf-94b9-41d074558d97@redhat.com>
User-Agent: NeoMutt/20180716

On Monday 13 January 2025 17:49:19 Hans de Goede wrote:
> Hi,
> 
> On 13-Jan-25 4:36 PM, Andy Shevchenko wrote:
> > On Mon, Jan 13, 2025 at 05:17:43PM +0200, Ilpo Järvinen wrote:
> >> On Sat, 21 Dec 2024, Hans de Goede wrote:
> >>> On 17-Dec-24 5:48 PM, Ilpo Järvinen wrote:
> >>>> On Mon, 9 Dec 2024, Hans de Goede wrote:
> > 
> > ...
> > 
> >>>> So what was the result of the private inquiry to Dell?
> >>>
> >>> On July 5th I send the following email to Prasanth Ksr
> >>> <prasanth.ksr@dell.com> which is the only dell.com address I could
> >>> find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
> >>> does not seem to be monitored very actively:
> >>>
> >>> """
> >>> Hello Prasanth,
> >>>
> >>> I'm contacting you about a question lis3lv02d freelfall sensors /
> >>> accelerometers used on many (older) Dell laptop models. There
> >>> has been a question about this last December and a patch-set
> >>> trying to address part of this with Dell.Client.Kernel@dell.com
> >>> in the Cc but no-one seems to be responding to that email address
> >>> which is why I'm contacting you directly:
> >>>
> >>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
> >>> https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-hdegoede@redhat.com/
> >>>
> >>> If you are not the right person to ask these questions to, then
> >>> please forward this email to the right person.
> >>>
> >>> The lis3lv02d sensors are I2C devices and are described in the ACPI
> >>> tables with an SMO88xx ACPI device node. The problem is that these
> >>> ACPI device nodes do not have an ACPI I2cResouce in there resource
> >>> (_CRS) list, so the I2C address of the sensor is unknown.
> >>>
> >>> When support was first added for these Dell provided a list of
> >>> model-name to I2C address mappings for the then current generation
> >>> of laptops, see:
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227
> >>>
> >>> And later the community added a few more mappings.
> >>>
> >>> Paul Menzel, the author of the email starting the discussion on this:
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227
> >>>
> >>> did a search for the kernel message which is printed when an SMO88xx
> >>> ACPI device is found but the i2c-address is unknown and Paul found
> >>> many models are missing from the mapping table (see Paul's email).
> >>>
> >>> Which leads us to the following questions:
> >>>
> >>> 1. Is there another, uniform (so not using a model name table)
> >>> way to find out the I2C address of the SMO88xx freefall sensor
> >>> from the ACPI or SMBIOS tables ?
> >>>
> >>> 2. If we need to keep using the model-name to I2C-address mapping
> >>> table can you help us complete it by providing the sensor's I2C
> >>> address for all models Paul has found where this is currently missing ?
> >>>
> >>> Regards,
> >>>
> >>> Hans
> >>> """
> >>>
> >>> Pali and Paul Menzel where in the Cc of this email.
> >>>
> >>>> Did they respond?
> >>>
> >>> I got a reply from Prasanth that they would forward my request to the
> >>> correct team. Then I got on off-list reply to the v6 patch-set from
> >>> David Wang from Dell with as relevant content "We are working on it."
> >>>
> >>>> Did they provide useful info?
> >>>
> >>> No further info was received after the "We are working on it." email.
> >>
> >> Hi Hans,
> >>
> >> So you didn't try to remind them after that at all?
> >>
> >> This kind of sounds a low priority item they just forgot to do and might have
> >> had an intention to follow through.
> > 
> > Talking from my experience with other companies that could have done something
> > better I dare to say that this entire buzz for them is no-priority at all, like
> > "no money stuff", hence no attention given. That said, I believe ping won't
> > change anything here, however I agree that it _was_ worth to try to acquire any
> > response from them.
> 
> Basically what Andy says above.
> 
> Note that Dell's client team has been on the Cc for all the versions of
> this patch-set many of which were posted after the "We are working on it." email.
> 
> For completeness sake I have just send a request for a status update on
> this to Prasanth and David from Dell.
> 
> In the mean time it would be good IMO to merge v11 of this patch, if we
> get useful info from Dell after all we can modify the driver for this
> later.
> 
> Regards,
> 
> Hans
> 
> 

No, this change should not be taken at all. This change has a chance to
break booting or brick future dell devices. I'm not going to discuss it
again, but saying that it is good just because you do not have anything
better is not an argument to take such change. Also it is not an excuse
to hide dangerous things behind module parameter. And if you have been
doing to everything to ensure that companies would not want to tak with
you then sorry it is only your problem, so please do not complain here.

