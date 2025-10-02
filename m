Return-Path: <linux-i2c+bounces-13348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777CBB36D7
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 11:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BB2819C03A8
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 09:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0713002DE;
	Thu,  2 Oct 2025 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxfjsEil"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60E301037
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396713; cv=none; b=T/GE8ULeOsb0L86BVlt1FotjvZbr8hb7WOsnYszbTHSg/VTnyOVQDbEx8LAHnyqkxzTM9Pk/1vlXtuskvEaNUEScZ25Co/qWXWkzUzq7532xVtXhJiIUIIRzkbsiTCz+hpjyWu3RYl09JrqDhz/qintYT/Ju705atEvXbJ1hd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396713; c=relaxed/simple;
	bh=UEQEinZrIgpPRhp+AXdZsp/XRmAI5qWeiPL9+GlAtk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXcyeG8p/18rC5QhpzZsrUESiWdSiGcyFDje7cn/qgRa+uYwDtSR4xv0VL924nI0Ym/WNwoEO9mHDbJV0zTO2h5On60nj7RdDh2Q696GWFVlDVGYLzifil9X9GV0C/zLuYhMJTfmveYNV2vbnrfK+0Y1S2efzNvApsWfOAVzYB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxfjsEil; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759396712; x=1790932712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UEQEinZrIgpPRhp+AXdZsp/XRmAI5qWeiPL9+GlAtk8=;
  b=jxfjsEilplrbIw/9Kj2XClel6aa/zBRR4qZQ9SII5Z6U5gZGCMxbOi92
   xRk83JygSOm5TWRPfMyHfGl6WS3wIuNfCAaqM8VbN4lrLlH4+UNhRMjIq
   oVuEMZVB31VX1mVVl/F6ke36VP5MI0tJRKSSCvTHQF89l7m3qjqR9sICW
   zYNRFA5Bl+Ek8YImG1ivZTcanXHObEi4b8iIfS80UQsmWjtTA3W1GIO3D
   QLuHrZiQ/xhKFYK16hf++BFpKZ28lmqcQHyRUqXyPK2v66VMeunHsjvzy
   nYMa7lyfdwizzjNaCWdGJLjNkRo/0/oQminxEB4qGi78hL3BG556km1rT
   A==;
X-CSE-ConnectionGUID: nXuyOm1iQs+maWIiBY6tHQ==
X-CSE-MsgGUID: yu5J8fNcTQ+qOtHhprsmpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79103531"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="79103531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 02:18:31 -0700
X-CSE-ConnectionGUID: ra22OonQSLevP9AzuehNMg==
X-CSE-MsgGUID: 4EAGd5sFTla5tFNlIA0tDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179778239"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 02:18:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4DAA11F8D4;
	Thu, 02 Oct 2025 12:18:25 +0300 (EEST)
Date: Thu, 2 Oct 2025 12:18:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Message-ID: <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>

Hi Hans,

On Thu, Oct 02, 2025 at 10:56:47AM +0200, Hans de Goede wrote:
> Hi,
> 
> First of all I messed up the git format-patch command,
> there is no second patch in this series.
> 
> (at least not for the i2c subsystem. There is a similar GPIO
> patch but I send that out separately)
> 
> On 1-Oct-25 11:58 PM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Oct 01, 2025 at 11:23:10PM +0200, Hans de Goede wrote:
> >> Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> >> 7450.
> >>
> >> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >> Note this applies on top of the addition of the new i2c-usbio driver which
> >> is being merged through gregkh/usb.git usb-next
> >> ---
> >>  drivers/i2c/busses/i2c-usbio.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
> >> index d42f9ab6e9a5..e7799abf6787 100644
> >> --- a/drivers/i2c/busses/i2c-usbio.c
> >> +++ b/drivers/i2c/busses/i2c-usbio.c
> >> @@ -27,6 +27,7 @@ static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
> >>  	{ "INTC1008" }, /* MTL */
> >>  	{ "INTC10B3" }, /* ARL */
> >>  	{ "INTC10B6" }, /* LNL */
> >> +	{ "INTC10D2" }, /* MTL-CVF */
> > 
> > INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
> > an actual system that uses USBIO and this HID?
> 
> Yes, see the Closes: tag which points to a bug-report which such a system:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> 
> Let me also reply to your other comment here:
> 
> >> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
> >> an actual system that uses USBIO and this HID?
> > 
> > Actually it looks like i2c-ljca.c shouldn't list this HID. The same
> > probably goes for all 10CF--10D3.
> 
> I would not be so sure of this, there are at least some Dell systems
> which use a combination of ljca and Meteor Lake and I believe these
> do use the "INTC10D2" HID with LJCA for the I2C part and the same
> goes for the GPIO / SPI parts.. One example of such a system is
> the Dell Precision 5490.

LJCA on MTL is supposed to be 1008. Do you have the *SDT so we could verify
this?

> 
> The way these Intel uses these HIDs is really weird they seem to
> simply mean "I2C" on *a* USBIO expander with this generation CPU.

I can assure you I have nothing to do with this ACPI ID usage scheme. :-)

> 
> Where there really seems no reason to change the HID for CPU
> generations, where as it would be a good reason to change the HID
> if the actual USBIO expander is different ...

That's indeed supposed to be the case. Also the _HID should always reflect
the actual device and only _CID should indicate it's compatible with
something else. But that BIOS is already out there so there's little that
can be done to it anyway. :-\

-- 
Regards,

Sakari Ailus

