Return-Path: <linux-i2c+bounces-8959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518CA052C8
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 06:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6CB018885BD
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 05:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716021A23AE;
	Wed,  8 Jan 2025 05:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V37I/h9O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F1153836;
	Wed,  8 Jan 2025 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736315516; cv=none; b=VrSfgmxMoX9yDZtpIzy4TTlIyo/MKUa169GhkBGFRTAFAIG7Rtve4lprMmvX5lDyesPSdhguO+S3PWtzXJX74nvtZ0jllMovyZJBkTsUycU8dPs+0i5KK95TtexRNZIQyJATc9DX5Z2YYbj55Qxa9VdmNn2py25H3aBsX5sT7zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736315516; c=relaxed/simple;
	bh=cOb2V8K7jUBA9LdBAneRDwXty7d1gvsG/l4ojraj9mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo94cRQ/rHHyFWpoi1G9dG0R4B7hC7e0DWPkeebzQoLNs+dv1Oxzik3rNQd/HcjkpBWsxrlSON8L3Jnm1AJOrPFYxKf6LDPVP9lSDTEL8vfq+azf81zJx/t2nFhDhFTTagJTj1NvFA85uJpH02dl8671KwmCx72XkmjLEm4pj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V37I/h9O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736315514; x=1767851514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cOb2V8K7jUBA9LdBAneRDwXty7d1gvsG/l4ojraj9mg=;
  b=V37I/h9Ot1THN5FojjcK4/0EEknL3B2QaWZg28tb31TTSugs9pg7NZ/A
   xWsSW/eVW2hADG0my19pDUpwCdHa/7vuZkQqBMzFapp8pcFJyV4GGXBPJ
   SZZYBPL3o2Lh8bVlwWEUisf8jfGsbiiA0rMHijx3e7uX86h7fh4msL8fm
   wsrVU6qzA848BCimZ/b8RTvdw+IhTMrMzwXFzs5G+i7vFwOg7WtpDXIyO
   x7+hm+MOGcQMaDmKf22SPKU6LXF7sN6BGocpwUxipeqmtzILZ0hMs4dA8
   LP4Gqc30cxcnH6SVjBcRWK6GF9UQhTi0lfzUHfkcYTsELmWIwach5oSCF
   A==;
X-CSE-ConnectionGUID: rjUxKML/RSWV2Edy+Z10+A==
X-CSE-MsgGUID: wzVR7QxCQViI4ovK6EMjyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47193363"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47193363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 21:51:53 -0800
X-CSE-ConnectionGUID: 3l+0IhoCRVGid+koiWJ/dw==
X-CSE-MsgGUID: dy2NPaQGS02mw5fnu0BBhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="102809607"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2025 21:51:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A9DBB235; Wed, 08 Jan 2025 07:51:50 +0200 (EET)
Date: Wed, 8 Jan 2025 07:51:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: R Ha <rha051117@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250108055150.GY3713119@black.fi.intel.com>
References: <20250103051657.211966-1-rha051117@gmail.com>
 <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com>
 <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
 <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com>
 <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>

Hi,

On Tue, Jan 07, 2025 at 06:16:09AM -0600, R Ha wrote:
> Hi,
> 
> Thanks for clarifying the speed. Seems like this bug is different than
> I thought.
> 
> In my ACPI table there were no references to HCNT or LCNT
> specifically. I'm not sure if this is normal.
> 
> In addition, I noticed that there were debug messages in dmesg
> relating to the HCNT and LCNT.
> I'm not sure if they'll be useful, but here they are (taken from an
> unmodified kernel):
> [    3.543648] i2c i2c-14: Successfully instantiated SPD at 0x50
> [    3.543790] Standard Mode HCNT:LCNT = 552:652
> [    3.543794] Fast Mode HCNT:LCNT = 100:200

I'm adding Jarkko who is expert in the designware I2C maybe he has some
ideas. IIRC we expect the HCNT/LCNT values to be passed from ACPI tables to
the driver.

@Jarkko, it seems that standard I2C HID touchpad does not work properly
with the 400 kHz as passed in I2CSerialBusV2() resource but it works with
either 100 kHz and 1 MHz. It also works fine in Windows. To me it sounds
like that we may have wrong/missing HCNT/LCNT values?

> Here's what I have found with the string "\\_SB.PC00.I2C1" in my ACPI table:
> #1

There should be Device() node for that too. The ones you listed are just
child devices connected to that bus.

> Scope (_SB)
> {
>     Device (PEPD)
>     {
>         Name (_HID, "INT33A1" /* Intel Power Engine */)  // _HID: Hardware ID
>         Name (_CID, EisaId ("PNP0D80") /* Windows-compatible System
> Power Management Controller */)  // _CID: Compatible ID
>         Name (_UID, One)  // _UID: Unique ID
>         Name (LBUF, Buffer (0xC0){})
>         Name (PPD0, Package (0x03)
>         {
>             "\\_SB.PC00.SAT0",
>             Zero,
>             Package (0x02)
>             {
>                 Zero,
>                 Package (0x03)
>                 {
>                     0xFF,
>                     Zero,
>                     0x81
>                 }
>             }
>         })
>         Name (PPD3, Package (0x03)
>         {
>             "\\_SB.PC00.SAT0",
>             Zero,
>             Package (0x02)
>             {
>                 Zero,
>                 Package (0x02)
>                 {
>                     0xFF,
>                     0x03
>                 }
>             }
>         })
>         Name (WWD3, Package (0x03)
>         {
>             "\\_SB.PC00.RP04",
>             Zero,
>             Package (0x02)
>             {
>                 Zero,
>                 Package (0x02)
>                 {
>                     0xFF,
>                     0x03
>                 }
>             }
>         })
>         Name (PKD0, Package (0x02)
>         {
>             Zero,
>             Package (0x03)
>             {
>                 0xFF,
>                 Zero,
>                 0x81
>             }
>         })
>         Name (PKD3, Package (0x02)
>         {
>             Zero,
>             Package (0x02)
>             {
>                 0xFF,
>                 0x03
>             }
>         })
>         Name (DEVY, Package (0x77)
>         {
>             [...]
>             Package (0x03)
>             {
>                 "\\_SB.PC00.I2C0",
>                 One,
>                 Package (0x02)
>                 {
>                     Zero,
>                     Package (0x02)
>                     {
>                         0xFF,
>                         0x03
>                     }
>                 }
>             },
> 
>             Package (0x03)
>             {
>                 "\\_SB.PC00.I2C1",
>                 One,
>                 Package (0x02)
>                 {
>                     Zero,
>                     Package (0x02)
>                     {
>                         0xFF,
>                         0x03
>                     }
>                 }
>             },
> 
>             Package (0x03)
>             {
>                 "\\_SB.PC00.XHCI",
>                 One,
>                 Package (0x02)
>                 {
>                     Zero,
>                     Package (0x02)
>                     {
>                         0xFF,
>                         0x03
>                     }
>                 }
>             },
> 
>             Package (0x03)
>             {
>                 "\\_SB.PC00.HDAS",
>                 One,
>                 Package (0x02)
>                 {
>                     Zero,
>                     Package (0x03)
>                     {
>                         0xFF,
>                         Zero,
>                         0x81
>                     }
>                 }
>             },
>             [...The rest are similar, only changinng the strings]
>         })
>     }
> }
> 
> #2 (seems related to another device)
> Scope (_SB.PC00.I2C1)
> {
>     Device (PA06)
>     {
>         Name (_HID, "MCHP1930")  // _HID: Hardware ID
>         Name (_UID, "I2C1&PA06")  // _UID: Unique ID
>         Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
>         Method (_STA, 0, Serialized)  // _STA: Status
>         {
>             If (POME)
>             {
>                 Switch (ToInteger (PLID))
>                 {
>                     Case (Package (0x01)
>                         {
>                             0x0C
>                         }
> 
> )
>                     {
>                         Return (0x0F)
>                     }
>                     Default
>                     {
>                         Return (Zero)
>                     }
> 
>                 }
>             }
> 
>             Return (Zero)
>         }
> 
>         Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
>         {
>             Name (RBUF, ResourceTemplate ()
>             {
>                 I2cSerialBusV2 (0x0000, ControllerInitiated, 0x00061A80,
>                     AddressingMode7Bit, "\\_SB.PC00.I2C1",
>                     0x00, ResourceConsumer, _Y3A, Exclusive,
>                     )
>             })
>             CreateWordField (RBUF, \_SB.PC00.I2C1.PA06._CRS._Y3A._ADR,
> BADR)  // _ADR: Address
>             Switch (ToInteger (PLID))
>             {
>                 Case (Package (0x01)
>                     {
>                         0x0C
>                     }
> 
> )
>                 {
>                     BADR = 0x17
>                 }
>                 Default
>                 {
>                     BADR = Zero
>                 }
> 
>             }
> 
>             Return (RBUF) /* \_SB_.PC00.I2C1.PA06._CRS.RBUF */
>         }
> 
>         Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>         {
>             If ((Arg0 != ToUUID
> ("033771e0-1705-47b4-9535-d1bbe14d9a09") /* Unknown UUID */))
>             {
>                 Return (Buffer (One)
>                 {
>                      0x00                                             // .
>                 })
>             }
> 
>             Switch (ToInteger (Arg2))
>             {
>                 Case (Zero)
>                 {
>                     Switch (ToInteger (Arg1))
>                     {
>                         Case (Zero)
>                         {
>                             Return (Buffer (One)
>                             {
>                                  0x03
>            // .
>                             })
>                         }
>                         Case (One)
>                         {
>                             Return (Buffer (One)
>                             {
>                                  0x7F
>            // .
>                             })
>                         }
> 
>                     }
> 
>                     Break
>                 }
>                 Case (One)
>                 {
>                     Name (PKG1, Package (0x02)
>                     {
>                         Package (0x08)
>                         {
>                             "",
>                             Zero,
>                             "",
>                             Zero,
>                             "",
>                             Zero,
>                             "",
>                             Zero
>                         },
> 
>                         Package (0x08)
>                         {
>                             "",
>                             Zero,
>                             "VBAT_IN_ELPMIC",
>                             0x32,
>                             "V3P3DX_EDP",
>                             0x0A,
>                             "VCC_EDP_BKLT",
>                             0x32
>                         }
>                     })
>                     Switch (ToInteger (PLID))
>                     {
>                         Case (Package (0x01)
>                             {
>                                 0x0C
>                             }
> 
> )
>                         {
>                             Return (DerefOf (PKG1 [One]))
>                         }
>                         Default
>                         {
>                             Return (DerefOf (PKG1 [Zero]))
>                         }
> 
>                     }
>                 }
>                 Case (0x02)
>                 {
>                     If ((Arg1 < One))
>                     {
>                         Break
>                     }
> 
>                     Name (PKG2, Package (0x02)
>                     {
>                         Package (0x04)
>                         {
>                             Zero,
>                             Zero,
>                             Zero,
>                             Zero
>                         },
> 
>                         Package (0x04)
>                         {
>                             Zero,
>                             0xC350,
>                             0x2710,
>                             0xC350
>                         }
>                     })
>                     Switch (ToInteger (PLID))
>                     {
>                         Case (Package (0x01)
>                             {
>                                 0x0C
>                             }
> 
> )
>                         {
>                             Return (DerefOf (PKG2 [One]))
>                         }
>                         Default
>                         {
>                             Return (DerefOf (PKG2 [Zero]))
>                         }
> 
>                     }
>                 }
>                 Case (0x03)
>                 {
>                     If ((Arg1 < One))
>                     {
>                         Break
>                     }
> 
>                     Name (BUF3, Package (0x01)
>                     {
>                         0x0F
>                     })
>                     Return (BUF3) /* \_SB_.PC00.I2C1.PA06._DSM.BUF3 */
>                 }
>                 Case (0x04)
>                 {
>                     If ((Arg1 < One))
>                     {
>                         Break
>                     }
> 
>                     Name (BUF4, Package (0x01)
>                     {
>                         Zero
>                     })
>                     Return (BUF4) /* \_SB_.PC00.I2C1.PA06._DSM.BUF4 */
>                 }
>                 Case (0x05)
>                 {
>                     If ((Arg1 < One))
>                     {
>                         Break
>                     }
> 
>                     Name (BUF5, Package (0x02)
>                     {
>                         0x0400,
>                         0x08
>                     })
>                     Return (BUF5) /* \_SB_.PC00.I2C1.PA06._DSM.BUF5 */
>                 }
>                 Case (0x06)
>                 {
>                     If ((Arg1 < One))
>                     {
>                         Break
>                     }
> 
>                     Name (BUF6, Package (0x01)
>                     {
>                         0x0384
>                     })
>                     Return (BUF6) /* \_SB_.PC00.I2C1.PA06._DSM.BUF6 */
>                 }
> 
>             }
> 
>             Return (Buffer (One)
>             {
>                  0x00                                             // .
>             })
>         }
>     }
> }
> 
> #3 (also seems related to another device)
> ElseIf ((I2SB == One))
> {
>     Scope (_SB.PC00.I2C1)
>     {
>         Device (HDAC)
>         {
>             Name (_HID, "INT00000")  // _HID: Hardware ID
>             Name (_DDN, "Intel(R) Smart Sound Technology Audio Codec")
>  // _DDN: DOS Device Name
>             Name (_UID, One)  // _UID: Unique ID
>             Name (CADR, Zero)
>             Name (CDIS, Zero)
>             Method (_INI, 0, NotSerialized)  // _INI: Initialize
>             {
>                 If ((I2SC == One))
>                 {
>                     _HID = "INT34C2"
>                     _CID = "INT34C2"
>                     CADR = 0x1C
>                 }
>                 ElseIf ((I2SC == 0x02))
>                 {
>                     _HID = "10EC1308"
>                     _CID = "10EC1308"
>                     CADR = 0x10
>                 }
>                 ElseIf ((I2SC == 0x03))
>                 {
>                     _HID = "ESSX8326"
>                     _CID = "ESSX8326"
>                     _DDN = "ESSX Codec Controller 8326 "
>                 }
>             }
> 
>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>             {
>                 If ((I2SC == 0x03))
>                 {
>                     Name (SBFB, ResourceTemplate ()
>                     {
>                         I2cSerialBusV2 (0x0018, ControllerInitiated, 0x00061A80,
>                             AddressingMode7Bit, "\\_SB.PC00.I2C0",
>                             0x00, ResourceConsumer, , Exclusive,
>                             )
>                         I2cSerialBusV2 (0x0009, ControllerInitiated, 0x00061A80,
>                             AddressingMode7Bit, "\\_SB.PC00.I2C0",
>                             0x00, ResourceConsumer, , Exclusive,
>                             )
>                     })
>                     Name (PBUF, ResourceTemplate ()
>                     {
>                         GpioIo (Exclusive, PullDefault, 0x0000,
> 0x0000, IoRestrictionOutputOnly,
>                             "\\_SB.GPI0", 0x00, ResourceConsumer, ,
>                             )
>                             {   // Pin list
>                                 0x0000
>                             }
>                     })
>                     Name (SBFG, ResourceTemplate ()
>                     {
>                         GpioInt (Edge, ActiveBoth, ExclusiveAndWake,
> PullNone, 0x0000,
>                             "\\_SB.GPI0", 0x00, ResourceConsumer, ,
>                             )
>                             {   // Pin list
>                                 0x0000
>                             }
>                     })
>                     CreateWordField (PBUF, 0x17, PWRP)
>                     PWRP = GNUM (0x09030006)
>                     CreateWordField (SBFG, 0x17, INTP)
>                     INTP = GNUM (0x09030007)
>                     Return (ConcatenateResTemplate (SBFB,
> ConcatenateResTemplate (PBUF, SBFG)))
>                 }
>                 Else
>                 {
>                     Return (ConcatenateResTemplate (IICB (CADR, I2SB),
> INTB (I2SI, Zero, Zero)))
>                 }
>             }
> 
>             Method (_STA, 0, NotSerialized)  // _STA: Status
>             {
>                 If (((I2SC != Zero) && (CDIS != One)))
>                 {
>                     Return (0x0F)
>                 }
> 
>                 If ((CDIS == One))
>                 {
>                     Return (0x0D)
>                 }
> 
>                 Return (Zero)
>             }
> 
>             Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
>             {
>                 CDIS = Zero
>             }
> 
>             Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
>             {
>                 CDIS = One
>             }
> 
>             Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>             {
>                 If ((Arg0 == Buffer (0x10)
>                         {
>                             /* 0000 */  0x04, 0x0C, 0x80, 0xA9, 0x16,
> 0xE0, 0x3E, 0x34,  // ......>4
>                             /* 0008 */  0x41, 0xF4, 0x6B, 0xCC, 0xE7,
> 0x0F, 0x43, 0x32   // A.k...C2
>                         }))
>                 {
>                     If ((Arg2 == Zero))
>                     {
>                         Return (0x55)
>                     }
> 
>                     [...Rest are similar to above, for values of Arg2
> from 0 to DF]
>                 }
> 
>                 Return (0xFF)
>             }
>         }
>     }
> }

