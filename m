Return-Path: <linux-i2c+bounces-9087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F905A10A4D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 16:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 836FB1880672
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 15:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0501552E4;
	Tue, 14 Jan 2025 15:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/0tKw/4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC61146A79;
	Tue, 14 Jan 2025 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867186; cv=none; b=ddgcC2oUgXoTT4ZuiAkosiYfcO9/K4iST8z81KEjCh0Ixd2FBB5qguqibyrxsChVKgKkU+yzsXvow1f00gCgfZ/SuB7CdKG7BiGqn3X5L1sJgOzy8XJiXtnuHat7enAU12KN0hE3QcXhgGh9PMd3DxAd8E7Zy4KMaStvBhi40rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867186; c=relaxed/simple;
	bh=J37/LSl+ENGwCp4QcUAox3lKvqPpORgrOd8+0kUZEQU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FhK1HEmh3TFjuZlaH6h5m7Zw4SkxekZ+WOJJyIEp7dCDnkzFnCwqDvMjGC45F4LRIvdfJyw/YPzo3vdTTac71bIzCfkgF2+J8qh3HFWTH+7gfpvjnPW/cCBqNCTtfEfnBjmOAUMnvgHi/osJY9fETQ8JlpGi3nkbxhneFDvd6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/0tKw/4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736867184; x=1768403184;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=J37/LSl+ENGwCp4QcUAox3lKvqPpORgrOd8+0kUZEQU=;
  b=E/0tKw/49N2jzI3SO/pryILJtiy4Ob2epaTaEgrnrSmbHGykyu3bSMSW
   2exL8SxRlAbya5XJOlCcbrvLoTXD6t83hjTb9b/mmteXEWmlvl/bxeTRl
   N+5b7k1yUdQWgONBGlLw9vVBvCRhpTuqQ0BhFa9UYgF1ZBcZF4/viJRy7
   4sf8g6dys8SkCu+JbaIRrsC768AUx+DkObKbqy3W18QWdwoQlIA0nYn0S
   bNOcN/p3Z6BFyv2Xgvic565wd1iZc6sZWU99sWD0GZVZDnOGu5s0WNuUM
   eaG+qKJhiSqB3fQ0OcE/ppVLihdNWqq3byFsVKSFFat9KpZ6Id25DVHYa
   A==;
X-CSE-ConnectionGUID: XFioWdg5RGmWlVhEnTgErA==
X-CSE-MsgGUID: RBv40/6ZSBCYkcj5l1dErA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47749431"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="47749431"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:06:24 -0800
X-CSE-ConnectionGUID: Zc9jccgdT5SzF0aAP+b87A==
X-CSE-MsgGUID: 8Za0BNZCT1CP4kkJ/XfvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109975204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:06:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 14 Jan 2025 17:06:17 +0200 (EET)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
    Prasanth Ksr <prasanth.ksr@dell.com>, Paul Menzel <pmenzel@molgen.mpg.de>, 
    Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
    Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
    Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
In-Reply-To: <CAHp75VdnDqpeiWZDwZb0Cfx8n4L_8N1cQRb2MKSteWCZ+yOrfw@mail.gmail.com>
Message-ID: <f0f7f8d1-d9ed-496a-e2b4-06f345ac8940@linux.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com> <20241209183557.7560-5-hdegoede@redhat.com> <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com> <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com> <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
 <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com> <2b2a3d16-039c-4cdf-94b9-41d074558d97@redhat.com> <20250113194702.j6ou2d7c3vn32unv@pali> <CAHp75VdnDqpeiWZDwZb0Cfx8n4L_8N1cQRb2MKSteWCZ+yOrfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-238660009-1736866639=:1077"
Content-ID: <4006fc8e-52df-0c42-d604-14aff15d19d3@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-238660009-1736866639=:1077
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <1120c656-cc50-96f3-d33f-8f7cf0328930@linux.intel.com>

On Mon, 13 Jan 2025, Andy Shevchenko wrote:

> On Mon, Jan 13, 2025 at 9:47=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org>=
 wrote:
> > On Monday 13 January 2025 17:49:19 Hans de Goede wrote:
> > > On 13-Jan-25 4:36 PM, Andy Shevchenko wrote:
> > > > On Mon, Jan 13, 2025 at 05:17:43PM +0200, Ilpo J=C3=A4rvinen wrote:
> > > >> On Sat, 21 Dec 2024, Hans de Goede wrote:
> > > >>> On 17-Dec-24 5:48 PM, Ilpo J=C3=A4rvinen wrote:
> > > >>>> On Mon, 9 Dec 2024, Hans de Goede wrote:
>=20
> ...
>=20
> > > >>>> So what was the result of the private inquiry to Dell?
> > > >>>
> > > >>> On July 5th I send the following email to Prasanth Ksr
> > > >>> <prasanth.ksr@dell.com> which is the only dell.com address I coul=
d
> > > >>> find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
> > > >>> does not seem to be monitored very actively:
> > > >>>
> > > >>> """
> > > >>> Hello Prasanth,
> > > >>>
> > > >>> I'm contacting you about a question lis3lv02d freelfall sensors /
> > > >>> accelerometers used on many (older) Dell laptop models. There
> > > >>> has been a question about this last December and a patch-set
> > > >>> trying to address part of this with Dell.Client.Kernel@dell.com
> > > >>> in the Cc but no-one seems to be responding to that email address
> > > >>> which is why I'm contacting you directly:
> > > >>>
> > > >>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-0596261=
61bfc@molgen.mpg.de/
> > > >>> https://lore.kernel.org/platform-driver-x86/20240704125643.22946-=
1-hdegoede@redhat.com/
> > > >>>
> > > >>> If you are not the right person to ask these questions to, then
> > > >>> please forward this email to the right person.
> > > >>>
> > > >>> The lis3lv02d sensors are I2C devices and are described in the AC=
PI
> > > >>> tables with an SMO88xx ACPI device node. The problem is that thes=
e
> > > >>> ACPI device nodes do not have an ACPI I2cResouce in there resourc=
e
> > > >>> (_CRS) list, so the I2C address of the sensor is unknown.
> > > >>>
> > > >>> When support was first added for these Dell provided a list of
> > > >>> model-name to I2C address mappings for the then current generatio=
n
> > > >>> of laptops, see:
> > > >>>
> > > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/i2c/busses/i2c-i801.c#n1227
> > > >>>
> > > >>> And later the community added a few more mappings.
> > > >>>
> > > >>> Paul Menzel, the author of the email starting the discussion on t=
his:
> > > >>>
> > > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/i2c/busses/i2c-i801.c#n1227
> > > >>>
> > > >>> did a search for the kernel message which is printed when an SMO8=
8xx
> > > >>> ACPI device is found but the i2c-address is unknown and Paul foun=
d
> > > >>> many models are missing from the mapping table (see Paul's email)=
=2E
> > > >>>
> > > >>> Which leads us to the following questions:
> > > >>>
> > > >>> 1. Is there another, uniform (so not using a model name table)
> > > >>> way to find out the I2C address of the SMO88xx freefall sensor
> > > >>> from the ACPI or SMBIOS tables ?
> > > >>>
> > > >>> 2. If we need to keep using the model-name to I2C-address mapping
> > > >>> table can you help us complete it by providing the sensor's I2C
> > > >>> address for all models Paul has found where this is currently mis=
sing ?
> > > >>>
> > > >>> Regards,
> > > >>>
> > > >>> Hans
> > > >>> """
> > > >>>
> > > >>> Pali and Paul Menzel where in the Cc of this email.
> > > >>>
> > > >>>> Did they respond?
> > > >>>
> > > >>> I got a reply from Prasanth that they would forward my request to=
 the
> > > >>> correct team. Then I got on off-list reply to the v6 patch-set fr=
om
> > > >>> David Wang from Dell with as relevant content "We are working on =
it."
> > > >>>
> > > >>>> Did they provide useful info?
> > > >>>
> > > >>> No further info was received after the "We are working on it." em=
ail.
> > > >>
> > > >> Hi Hans,
> > > >>
> > > >> So you didn't try to remind them after that at all?
> > > >>
> > > >> This kind of sounds a low priority item they just forgot to do and=
 might have
> > > >> had an intention to follow through.
> > > >
> > > > Talking from my experience with other companies that could have don=
e something
> > > > better I dare to say that this entire buzz for them is no-priority =
at all, like
> > > > "no money stuff", hence no attention given. That said, I believe pi=
ng won't
> > > > change anything here, however I agree that it _was_ worth to try to=
 acquire any
> > > > response from them.
> > >
> > > Basically what Andy says above.
> > >
> > > Note that Dell's client team has been on the Cc for all the versions =
of
> > > this patch-set many of which were posted after the "We are working on=
 it." email.
> > >
> > > For completeness sake I have just send a request for a status update =
on
> > > this to Prasanth and David from Dell.
> > >
> > > In the mean time it would be good IMO to merge v11 of this patch, if =
we
> > > get useful info from Dell after all we can modify the driver for this
> > > later.
> >
> > No, this change should not be taken at all. This change has a chance to
> > break booting or brick future dell devices. I'm not going to discuss it
> > again, but saying that it is good just because you do not have anything
> > better is not an argument to take such change. Also it is not an excuse
> > to hide dangerous things behind module parameter. And if you have been
> > doing to everything to ensure that companies would not want to tak with
> > you then sorry it is only your problem, so please do not complain here.
>=20
> With all respect, this is not how we should treat the Linux kernel
> contributors and users (who want this feature to enable their
> devices). We have a ton of dangerous and DANGEROUS parameters and
> other algorithms here and there (in Linux kernel source tree),

I agree that more dangerous things pre-exist within the kernel already,
and the danger seem exaggrated. In any case, it is behind a parameter=20
requiring conscious decision to enable and even if enabled, it looks=20
low risk.

It seems Pali too expects them to not answer so I don't see much point=20
in waiting as all are in agreement the best solution is not going to be=20
available despite Hans' attempts to get the necessary info out from Dell.

Thus, I'll take this patch into review-ilpo-next branch now.

--=20
 i.
--8323328-238660009-1736866639=:1077--

