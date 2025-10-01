Return-Path: <linux-i2c+bounces-13291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D188BB1F1C
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 00:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC5A87AABC8
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 22:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F6A26B0BC;
	Wed,  1 Oct 2025 22:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5ghI640"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA426F2BF
	for <linux-i2c@vger.kernel.org>; Wed,  1 Oct 2025 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356563; cv=none; b=NfgSPffVr538mRdXsJvW5Yl9+HF6DuxbgrOjVoOWeeUNgO1cyJlqP6IniUtHsyevtNCH6bXQl64Z1ShCErzmNwEWPBrEyPVauIZP6RL5sSNXyBv9CkB4AjNsxIq2hIagxNXQZG2D1c/ZFgrWlEcdJ2sYHdKZfimDZToLATd5rdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356563; c=relaxed/simple;
	bh=r1mVVX0ql1z7IGBs2irRBCgIL0l+ju7gh7pYNww18y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwQpf5gXhY0hHy9xkvL5CzFjJu7l0K09uFEt6GDKZ0/ramAJQrwN6/sloqjNZX3VqKkF2/vfHRr3blOAdtfjCZ2b1PGvSf5wbt1phjqKsO0L36CNBNYYSNO8Uq0+j7dTx94C4qKGxq48ZQL2iwJOkM7YWwJhefeFMO66GzquMRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5ghI640; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759356561; x=1790892561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r1mVVX0ql1z7IGBs2irRBCgIL0l+ju7gh7pYNww18y4=;
  b=F5ghI640/ZI9/AaAqHDjzXdOufHGGr48xwqApGLzhejli2dWKHM6NVf8
   pgkN+BIqJkNgUzKxnqOoAShdd1rXhh9klmUWK9Mye6QNpSn97RYPmkyC9
   eYJwwtEtabii9hysOyWQ2+KQgIfXxzoJuESudbyqW5dyIdC+lp5n1350g
   qdzzVFUbW86TKmWP1yogG+LoS8KUPVOAwM2FDStyXAEhC30Bx65UgGndC
   wL49H2dRh3dAgLE3D2/jBQ/zbVCMiZW5bNP7h0Sq4g71rsc1ZxfekP7EO
   CHa3rRofcAgWWkzbtld0qkSPugZ581k/kb6QbPb7sJzWp6pxdafGZvHbR
   w==;
X-CSE-ConnectionGUID: SV7Ieu4LQvGgIj9IOZCFFw==
X-CSE-MsgGUID: 466fxlr+QnKLqYt5pSKWSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72263572"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="72263572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 15:09:19 -0700
X-CSE-ConnectionGUID: 3e2Dep2lQOGjQ+MpnzR/mQ==
X-CSE-MsgGUID: HxImYZxCR1+A5Ql2POABgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="209845258"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 15:09:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 712D211F91A;
	Thu, 02 Oct 2025 01:09:15 +0300 (EEST)
Date: Thu, 2 Oct 2025 01:09:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Message-ID: <aN2mi9LQln6n71_m@kekkonen.localdomain>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>

Hi Hans, Lixu,

On Thu, Oct 02, 2025 at 12:58:07AM +0300, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Oct 01, 2025 at 11:23:10PM +0200, Hans de Goede wrote:
> > Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> > 7450.
> > 
> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > ---
> > Note this applies on top of the addition of the new i2c-usbio driver which
> > is being merged through gregkh/usb.git usb-next
> > ---
> >  drivers/i2c/busses/i2c-usbio.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
> > index d42f9ab6e9a5..e7799abf6787 100644
> > --- a/drivers/i2c/busses/i2c-usbio.c
> > +++ b/drivers/i2c/busses/i2c-usbio.c
> > @@ -27,6 +27,7 @@ static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
> >  	{ "INTC1008" }, /* MTL */
> >  	{ "INTC10B3" }, /* ARL */
> >  	{ "INTC10B6" }, /* LNL */
> > +	{ "INTC10D2" }, /* MTL-CVF */
> 
> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
> an actual system that uses USBIO and this HID?

Actually it looks like i2c-ljca.c shouldn't list this HID. The same
probably goes for all 10CF--10D3.

Lixu: any idea?

I thought USBIO always came with CVS but that doesn't seem to be the case
here.

> 
> >  	{ "INTC10E3" }, /* PTL */
> >  	{ }
> >  };
> 

-- 
Regards,

Sakari Ailus

