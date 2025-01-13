Return-Path: <linux-i2c+bounces-9058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F5A0BC26
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 16:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2D5E7A1EC0
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 15:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EB01C5D56;
	Mon, 13 Jan 2025 15:36:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF5240245;
	Mon, 13 Jan 2025 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782570; cv=none; b=dCpf/WfeueitT5kdiKeTXP2hXPfdVsvLd/7jfpKOVjCrWcj2WxRyU0vOidw38GVi5/ZIbf6yFHcUtpP70VzzWlBR0STj9fYpI3P4NMVEGLMmXqWxZWs0sghA4umPa/mQJSbi51l3cR5SkT9AlWl8HBfC63brGv6A6TU+J7CtQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782570; c=relaxed/simple;
	bh=2UxhxIDakmY/5zOx4d+INAsV8lO57sybbVmuGx6HMwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwmxGb18BPrWLvzhH44uo/t9b3GmIwFBRvXau7No9L01jZ3vAW7WJEk8KUsnjO7er525K6+lKl6eleq94rMW8nEhAwS2zrPUBXMZJtQs8AjBH1ou5JoBUPENAHScK/J/2pW3nNznfF6gr2xWGi5z9ubOhQdKWYtkItji0nK9cNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: oxhWDPqhTnuZnJG/xteIgg==
X-CSE-MsgGUID: Be0zBAkmR0ClZLO8JSpZ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48055088"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48055088"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 07:36:08 -0800
X-CSE-ConnectionGUID: Zg4nn3qaQ16N0B+lXpNAWA==
X-CSE-MsgGUID: Em39aoPDRE2dB/TbF9rycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="135332470"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 07:36:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tXMTw-00000000Vnz-2Ymw;
	Mon, 13 Jan 2025 17:36:00 +0200
Date: Mon, 13 Jan 2025 17:36:00 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com>
 <20241209183557.7560-5-hdegoede@redhat.com>
 <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com>
 <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
 <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 13, 2025 at 05:17:43PM +0200, Ilpo Järvinen wrote:
> On Sat, 21 Dec 2024, Hans de Goede wrote:
> > On 17-Dec-24 5:48 PM, Ilpo Järvinen wrote:
> > > On Mon, 9 Dec 2024, Hans de Goede wrote:

...

> > > So what was the result of the private inquiry to Dell?
> > 
> > On July 5th I send the following email to Prasanth Ksr
> > <prasanth.ksr@dell.com> which is the only dell.com address I could
> > find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
> > does not seem to be monitored very actively:
> > 
> > """
> > Hello Prasanth,
> > 
> > I'm contacting you about a question lis3lv02d freelfall sensors /
> > accelerometers used on many (older) Dell laptop models. There
> > has been a question about this last December and a patch-set
> > trying to address part of this with Dell.Client.Kernel@dell.com
> > in the Cc but no-one seems to be responding to that email address
> > which is why I'm contacting you directly:
> > 
> > https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
> > https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-hdegoede@redhat.com/
> > 
> > If you are not the right person to ask these questions to, then
> > please forward this email to the right person.
> > 
> > The lis3lv02d sensors are I2C devices and are described in the ACPI
> > tables with an SMO88xx ACPI device node. The problem is that these
> > ACPI device nodes do not have an ACPI I2cResouce in there resource
> > (_CRS) list, so the I2C address of the sensor is unknown.
> > 
> > When support was first added for these Dell provided a list of
> > model-name to I2C address mappings for the then current generation
> > of laptops, see:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227
> > 
> > And later the community added a few more mappings.
> > 
> > Paul Menzel, the author of the email starting the discussion on this:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227
> > 
> > did a search for the kernel message which is printed when an SMO88xx
> > ACPI device is found but the i2c-address is unknown and Paul found
> > many models are missing from the mapping table (see Paul's email).
> > 
> > Which leads us to the following questions:
> > 
> > 1. Is there another, uniform (so not using a model name table)
> > way to find out the I2C address of the SMO88xx freefall sensor
> > from the ACPI or SMBIOS tables ?
> > 
> > 2. If we need to keep using the model-name to I2C-address mapping
> > table can you help us complete it by providing the sensor's I2C
> > address for all models Paul has found where this is currently missing ?
> > 
> > Regards,
> > 
> > Hans
> > """
> > 
> > Pali and Paul Menzel where in the Cc of this email.
> > 
> > > Did they respond?
> > 
> > I got a reply from Prasanth that they would forward my request to the
> > correct team. Then I got on off-list reply to the v6 patch-set from
> > David Wang from Dell with as relevant content "We are working on it."
> > 
> > > Did they provide useful info?
> > 
> > No further info was received after the "We are working on it." email.
> 
> Hi Hans,
> 
> So you didn't try to remind them after that at all?
> 
> This kind of sounds a low priority item they just forgot to do and might have
> had an intention to follow through.

Talking from my experience with other companies that could have done something
better I dare to say that this entire buzz for them is no-priority at all, like
"no money stuff", hence no attention given. That said, I believe ping won't
change anything here, however I agree that it _was_ worth to try to acquire any
response from them.

Just my 2c.

-- 
With Best Regards,
Andy Shevchenko



