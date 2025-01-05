Return-Path: <linux-i2c+bounces-8920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9CA01887
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jan 2025 09:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66C418837ED
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jan 2025 08:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F196813665A;
	Sun,  5 Jan 2025 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Asd5StWU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9279C4;
	Sun,  5 Jan 2025 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736066043; cv=none; b=CyYrfwXzyg94Y83X0+4VixyuQEPPnjK+1HaR1F+wlsu20smHiKT9Lhe6QdXZO1J3c1bqG6LJtCdbEk/A8cUu9JkwqDILBUcsO8Qm2zngjqnmKYe0E3hdH8U32PIUia6SXZYFmL6AllV656UtzDpY3VRO4gIAOgUfN2FdSVdeYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736066043; c=relaxed/simple;
	bh=HK0uWLs3KgLuoE1NQZE49bG1NVGbXZ96y8GV3SPnkWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+hDE2dm0+GgX6MXBOyae4XshJ0fZT3eidSL3rPWqIFMYMG+VnpGBhpX6lgGjvt1GEoH9MyFRooe/NPRtibyH4d5fRD1fpb6f73l9E99rSBAZXxAJAHseyyCycnACrfpb+27hxtEb71+ZZmezT4VLRYgTfal3GHog3CLf348CKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Asd5StWU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736066042; x=1767602042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HK0uWLs3KgLuoE1NQZE49bG1NVGbXZ96y8GV3SPnkWw=;
  b=Asd5StWUdXeF5KKIC8iXvdFOW79jCMDhdgR44YEzOfwTWwJwO4e3EU/B
   KCIHNlci8TfbUWBlotQqCyCLDFhc7VxEQ07ac/9fw2Tns+znvU/ZeT393
   Y+vdCzn9euUFh3VUsacxfFj8gWTvzq/a+zRke+R3LU9L0Vr8752o0p8f1
   bmvPlWYmGKX2NpV462IOfgbutxQg40BAxNkvZvenYs99DGkVAEYuW0Yco
   WWCb5AHKIzm+BvydQaZjMl1esjLmSYpshtE7OdL17nG4IBrBzJuXOcdq5
   4ikdtUp/7Yg8FVNBFIxT7SYdVl+DSC4wJ2EHaFCN1UiiyX2IkyD5FmptE
   A==;
X-CSE-ConnectionGUID: oe22YPnyRfSES3M9ghWg4g==
X-CSE-MsgGUID: D/tv6y26QmOJO8FFxlbdAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36119576"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="36119576"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 00:34:02 -0800
X-CSE-ConnectionGUID: mpPAVplvTwGiCoEe58+7Ww==
X-CSE-MsgGUID: IDClCMzeSTayQe6naDuKJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106792189"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jan 2025 00:34:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B59E826A; Sun, 05 Jan 2025 10:33:58 +0200 (EET)
Date: Sun, 5 Jan 2025 10:33:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: R Ha <rha051117@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250105083358.GU3713119@black.fi.intel.com>
References: <20250103051657.211966-1-rha051117@gmail.com>
 <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com>
 <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>

On Fri, Jan 03, 2025 at 05:46:27PM -0600, R Ha wrote:
> Hello,
> 
> Thanks for reading my patch!
> 
> On Fri, Jan 3, 2025 at 3:33 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > What are those "some devices" and "some controllers"?
> 
> The "Some Devices" are the Lenovo V15 G4 IRU, which I use, and
> potentially the Lenovo V15 G4 AMN and Lenovo Ideapad Slim 3 15IAH8 as
> well (based on issue reports from other users [1]).
> The "Some Controllers" are the Designware I2C controller.
> 
> Sorry for not putting this in the commit message; I had tried to
> follow the comments for the quirk I copied in Commit 7574c0db2e68c
> ("i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is
> present"), which left them out.

In general it is good to follow the existing changelogs but in this case I
would prefer to add the details of the system in question (so we know what
systems the quirk is applied to).

> On Fri, Jan 3, 2025 at 3:33 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Can you add the ACPI table snippet here too for reference?
> 
> I believe this is the correct snippet in my ACPI table (Again, V15 G4
> IRU). Tried to edit it down as much as I could, hopefully this tells
> everything. Please let me know how I should attach a longer snippet or
> the full ACPI table if needed.

Okay thanks for sharing. I don't see the "SPED" beeing assigned in the
below snipped though. I would expect this works in Windows? Have you
checked if it uses 100 kHz or 400kHz there?

> Scope (_SB.PC00.I2C1)
> {
>     [...]
>     Device (TPD0)
>     {
>         [...]
>         CreateWordField (SBFB, \_SB.PC00.I2C1.TPD0._Y53._ADR, BADR)
> // _ADR: Address
>         CreateDWordField (SBFB, \_SB.PC00.I2C1.TPD0._Y53._SPE, SPED)
> // _SPE: Speed
>         CreateWordField (SBFG, 0x17, INT1)
>         CreateDWordField (SBFI, \_SB.PC00.I2C1.TPD0._Y54._INT, INT2)
> // _INT: Interrupts
>         Method (_INI, 0, NotSerialized)  // _INI: Initialize
>         {
>             If ((OSYS < 0x07DC))
>             {
>                 SRXO (0x09080011, One)
>             }
> 
>             INT1 = GNUM (0x09080011)
>             INT2 = INUM (0x09080011)
>             If ((TPTY == One))
>             {
>                 _HID = "ELAN06FA"
>                 _SUB = "ELAN0001"
>                 BADR = 0x15
>                 HID2 = One
>                 Return (Zero)
>             }
>             [...]
>         }
> 
>         Name (_HID, "XXXX0000")  // _HID: Hardware ID
>         Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  //
> _CID: Compatible ID
>         Name (_SUB, "XXXX0000")  // _SUB: Subsystem ID
>         Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
>         Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>         {
>             If ((Arg0 == HIDG))
>             {
>                 Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
>             }
> 
>             If ((Arg0 == TP7G))
>             {
>                 Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
>             }
> 
>             Return (Buffer (One)
>             {
>                  0x00                                             // .
>             })
>         }
>         [...]
>         Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>         {
>             If ((OSYS < 0x07DC))
>             {
>                 Return (SBFI) /* \_SB_.PC00.I2C1.TPD0.SBFI */
>             }
> 
>             If ((TPDM == Zero))
>             {
>                 Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFG))
>             }
> 
>             Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFI))
>         }
>         [...]
>     }
> }
> 
> For comparison, the properties for a device that I think did set a
> proper speed was like this:
> If ((TPNP == 0xD64D))
> {
>     _HID = "GTCH7503"
>     HID2 = One
>     BADR = 0x10
>     SPED = 0x000F4240
>     Return (Zero)
> }
> 
> [1]: https://bbs.archlinux.org/viewtopic.php?id=297092

