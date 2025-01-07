Return-Path: <linux-i2c+bounces-8941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE4A038C2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 08:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005B03A52DB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 07:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA862190685;
	Tue,  7 Jan 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5PINFX8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB64C9D;
	Tue,  7 Jan 2025 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736234873; cv=none; b=pW2LIXooIvJVxjOUV1BPyo03s1fcDu5nJaGYL90hMz+tSBZ1meAFgF4eZZZ2Xjww76rxJJAH2toTW9aF01JkvOOagi4y/BLMIlkHl6YqE1PfaGcRFXCT56W1r+2K3UGMMcOWGxiL8kg3bKpW4JnxnERUFiv86Q5GVs2vCg61GRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736234873; c=relaxed/simple;
	bh=CyQJ1mfHX+K4uMkM39P3plS0xz57q8rUpkBL11JEl6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMCwLVsw+oS9TjSAXfSug/Te3H/25KWAm6gzEjJIGpgJi4CRQYqUEkFGSegUpMX3G4Jca6mQneIzCd76MbAe6XQp6kXGnqGKUGdKkARotPy0mfDciqOeDf6UTrYqRbJLvDzKhAlmc/ILPJSrbNAURjYT2SW8MNDFt1tnFi2EtDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5PINFX8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736234871; x=1767770871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CyQJ1mfHX+K4uMkM39P3plS0xz57q8rUpkBL11JEl6E=;
  b=R5PINFX8ofvvwqVtKaQyQlnfXe+5Qdfhh/Y/lb6bVcrRWq6R9w5ey6GR
   258gtNfw/IQeV1WluCeez+DaN5toUB3qga3IJSWbe1eRD6hr8eJ7AYWUd
   2D1IPiLKFDo7vB2Xmndmhh2TTJyRVsfH13SFA+1huwhwLYD5SHdB6w0kN
   wbuNK6Fc2uOurZNGONrBREEKHI5kGAARHAwEynJEYh+CRb4hHW59eZH5b
   jrNp7H7Hl9ugtVhtMvFzu3WoJJZ8f7DW5YL+cKKIXH+iD6jBt2zoIpJsX
   D7lQnX3QdfoGKUjTpv3oGOoX+cg291XG24Uw0F1L8vYTc2MAx8SkZC5/g
   Q==;
X-CSE-ConnectionGUID: mGyBCBsyQwSvbG5SwahwIw==
X-CSE-MsgGUID: fAJIsYX9QY6qsb8Bb15B4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35699861"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35699861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 23:27:50 -0800
X-CSE-ConnectionGUID: QiR4Sx+GR+m9JpCryRFOgA==
X-CSE-MsgGUID: eEmh5cRfQBGQzxHVZnfkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107758268"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Jan 2025 23:27:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1A8D6235; Tue, 07 Jan 2025 09:27:46 +0200 (EET)
Date: Tue, 7 Jan 2025 09:27:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: R Ha <rha051117@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250107072746.GW3713119@black.fi.intel.com>
References: <20250103051657.211966-1-rha051117@gmail.com>
 <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com>
 <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
 <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>

Hi,

On Mon, Jan 06, 2025 at 03:00:53AM -0600, R Ha wrote:
> On Sun, Jan 5, 2025 at 2:34 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > In general it is good to follow the existing changelogs but in this case I
> > would prefer to add the details of the system in question (so we know what
> > systems the quirk is applied to).
> 
> Alright, I sent an updated patch with a commit message that specifies
> the devices affected.
> 
> On Sun, Jan 5, 2025 at 2:34 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Okay thanks for sharing. I don't see the "SPED" beeing assigned in the
> > below snipped though.
> 
> I believe "SPED" is left unassigned. There are two reasons for this.
> 1. I could not find a place where it was assigned in the ACPI table
> (in the snippet, every line with the word "SPED" was already
> included).
> 2. In the file drivers/i2c/busses/i2c-designware-common.c, the code in
> the function "i2c_dw_adjust_bus_speed" falls through to the "else"
> case.
> 
> For (2), here is the relevant function where the control flow falls to
> the "else" case. I found this by adding a print-debugging statement
> after the last "else" statement.
> static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
> {
>     u32 acpi_speed = i2c_dw_acpi_round_bus_speed(dev->dev);
>     struct i2c_timings *t = &dev->timings;
> 
>     /*
>      * Find bus speed from the "clock-frequency" device property, ACPI
>      * or by using fast mode if neither is set.
>      */
>     if (acpi_speed && t->bus_freq_hz)
>         t->bus_freq_hz = min(t->bus_freq_hz, acpi_speed);
>     else if (acpi_speed || t->bus_freq_hz)
>         t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
>     else
>         t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
> }
> 
> Actually, after some further investigation, I found that I missed a
> few lines in my previous snippet. Specifically the line concerning the
> method "I2CSerialBusV2".
> Here is the full snippet pasted below since I don't want to miss
> anything else, I'm sorry for the length but want to make sure
> everything is included.

Thanks! Okay the speed set in the I2CSerialBusV2 resource is 400kHZ but
there is one more variable in this equation: \\_SB.PC00.I2C1 that's the I2C
controller itself. DW I2C has some timing related methods (HCNT/LCNT) that
may affect this so I wonder if you can share that one too?

> Scope (_SB.PC00.I2C1)
> {
>     Name (I2CN, Zero)
>     Name (I2CX, Zero)
>     Name (I2CI, One)
>     Method (_INI, 0, NotSerialized)  // _INI: Initialize
>     {
>         I2CN = SDS1 /* \SDS1 */
>         I2CX = One
>     }
> 
>     Device (TPD0)
>     {
>         Name (HID2, Zero)
>         Name (SBFB, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
>                 AddressingMode7Bit, "\\_SB.PC00.I2C1",
>                 0x00, ResourceConsumer, _Y53, Exclusive,
>                 )
>         })

