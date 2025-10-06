Return-Path: <linux-i2c+bounces-13396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30555BBD21B
	for <lists+linux-i2c@lfdr.de>; Mon, 06 Oct 2025 08:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30733AFF97
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Oct 2025 06:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4A5244660;
	Mon,  6 Oct 2025 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOOkwG+T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2961D63F7
	for <linux-i2c@vger.kernel.org>; Mon,  6 Oct 2025 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759732195; cv=none; b=Wr+fKpIinQNTDbKyuVe12ogHXZq159mFVymVnJvWxRy0Ro+TQ/iCveC2Sp/beSC53QNhlm+5kpzMN+StJaZyNiPimsHR1E0HG15IrDOwqr8wRIGd2/eEA8QPCFEW5b4N8ByvMEqxPsA+YFb9wG9/j6vSP6LmITuF0EWRx8/ZpoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759732195; c=relaxed/simple;
	bh=cVNlKXBQw6GQiXsCsK6dfj15iqb4/HHp/I3JWpufTXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQIwD5dWOABAdba6IJHzxSWWFuhiCez6licQCjQUgXzw6Tg94lapxKaEdb8HBBbs7o2xwy2CAG1bcLGumpHV2VXFwUlB3Ax//PloAkESbkCrtBfS/14avNNmoVPB3z3JF1WwF4aKVJE6M1rXbeXd1abS7H8m1lFG8fjCZ2Rut9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOOkwG+T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759732194; x=1791268194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cVNlKXBQw6GQiXsCsK6dfj15iqb4/HHp/I3JWpufTXQ=;
  b=YOOkwG+TZ8dCYuS5WXRcD418c7B+ih4pJYeEr6I9YNrAu86bk2lLXKZQ
   OXNWRUX/MdIGqjehzhkotk56S/9EK+TO7WPUiPkkVh7tK052O+oVSE6mG
   5mMsr5Y9IPGkNRUOQZGR65fa1sNHNJijy3JDq1YTb8jSy64dsVxqrpnNf
   Etn+bnwR0gwYx4/mshgG255jI5MQYK7yLV0OrtO+RDckWk/8A/FE4qWwY
   KedJYQmkqFXtrUv6fyJY/YnmBy7DbmNI9bdwUJXU2b/YIs1Q0i1qSGvfq
   /EI98x8718RtxfNBIS9Dl/zuAvsdoZyS4SvZ/BVW57jheHEn65QsM4mRT
   g==;
X-CSE-ConnectionGUID: tSVMkckfQAipwvHZ+A7OxQ==
X-CSE-MsgGUID: Yw4FunFuSh+hKM82SIUzdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="49459377"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="49459377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2025 23:29:53 -0700
X-CSE-ConnectionGUID: ZgJxQuaGSc2nZwePgqqrcQ==
X-CSE-MsgGUID: gtZdNI4KSjWlkl8uYESwyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="180238437"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.24])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2025 23:29:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 439C51204CA;
	Mon, 06 Oct 2025 09:29:49 +0300 (EEST)
Date: Mon, 6 Oct 2025 09:29:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Message-ID: <aONh3d7eBy11TWz6@kekkonen.localdomain>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
 <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>

Hi Hans,

On Thu, Oct 02, 2025 at 03:04:30PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 2-Oct-25 11:18 AM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Thu, Oct 02, 2025 at 10:56:47AM +0200, Hans de Goede wrote:
> >> Hi,
> 
> ...
> 
> >>>> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
> >>>> an actual system that uses USBIO and this HID?
> >>>
> >>> Actually it looks like i2c-ljca.c shouldn't list this HID. The same
> >>> probably goes for all 10CF--10D3.
> >>
> >> I would not be so sure of this, there are at least some Dell systems
> >> which use a combination of ljca and Meteor Lake and I believe these
> >> do use the "INTC10D2" HID with LJCA for the I2C part and the same
> >> goes for the GPIO / SPI parts.. One example of such a system is
> >> the Dell Precision 5490.
> > 
> > LJCA on MTL is supposed to be 1008. Do you have the *SDT so we could verify
> > this?
> 
> I just checked this in a ssh session to the Dell Precision 5490:
> 
> hans@prdel:~$ cd /sys/bus/auxiliary/devices/
> hans@prdel:/sys/bus/auxiliary/devices$ ls
> intel_ipu6.isys.40      intel_vsec.telemetry.2  soundwire_intel.link.2  usb_ljca.ljca-i2c.1
> intel_ipu6.psys.40      snd_sof.hda-probes.0    soundwire_intel.link.3  usb_ljca.ljca-spi.0
> intel_vsec.telemetry.0  soundwire_intel.link.0  usb_ljca.ljca-gpio.0
> intel_vsec.telemetry.1  soundwire_intel.link.1  usb_ljca.ljca-i2c.0
> hans@prdel:/sys/bus/auxiliary/devices$ cat usb_ljca.ljca-*/firmware_node/hid 
> INTC10D1
> INTC10D2
> INTC10D2
> INTC10D3
> 
> So as you can see this really is using the INTC10D* HIDs and these
> are thus duplicate between the LJCA and USBIO IO-expanders.

Thanks for confirming this. Luckily this isn't an issue as matching doesn't
use ACPI HIDs. That being said, I really wonder where this stuff comes
from.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

