Return-Path: <linux-i2c+bounces-8030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 716B79D1B8B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 00:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F13BEB233F2
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 23:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CA31E9072;
	Mon, 18 Nov 2024 23:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHwhjzGk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A61953BA;
	Mon, 18 Nov 2024 23:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970940; cv=none; b=Jw225NP+fDCRHjsOA3fKgKG4WOyIoJ+zCXH+0iLwu3Fb0dmt6BpEn75V0UK5SUhTHGj/WEZZ8BqIBYux7VYrlyGiNptx3q4MnDip33pNhWflHdxNnHhMWSPaZISS5N+O5/Ur5Bn6JPUPIi23NoqEa58lbDFWeu0LB0NPmoUX6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970940; c=relaxed/simple;
	bh=jZl5sE1plneil6LuvF++8p7ci3M5MVwlM2vSp93SABA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YN3JkLZoBNL/zn3dy/iardNcrhVn5olXtcfhmB1UnTDchHb/sPKzhRFYeqISFG/+bjhMI8FfSQX1/N8r0VsL3cfcL7iFVeIkug9iXwTDqCpbxHWbeG5xM4X7Y2y1aem5npqJw7AsUQy/1IbW/HK2vuM462MALK2hAYf1k6DLVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHwhjzGk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7845CC4CECC;
	Mon, 18 Nov 2024 23:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731970940;
	bh=jZl5sE1plneil6LuvF++8p7ci3M5MVwlM2vSp93SABA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHwhjzGkqYePXOvD8evT53FrJqTPjzV93ytnB2Xr1Vi9Jn1Al4Ri0cS4+Wf9cjv7h
	 3/1KPJ9/AHTTM8LYCPeJbv72znY6Zif7z+NA3InNUU+XtF1i+SmWZM9NY5dCJek31E
	 AYG2GMAEJuMFQ/ywG3yd2CA2RmzQkq1mAPI2dMy3/hZQUi1Y0Rw6xyT01ESo8o/VjO
	 eksL75wS9jrRIUppwKl5fs7Ov2WbMzcj11Auq1G3EvhOBzT97PAH8HUwxOdu4dqrHU
	 mx4Y8Zumbdqc0s9JPVlDNnD2Fjq/ucm8V5Jk5G1p12kT7fWBHETyh3CGO+r9DhNih8
	 HfCr8zgrei+Fw==
Date: Tue, 19 Nov 2024 00:02:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Add ACPI HID for DWAPB I2C
 controller on FUJITSU-MONAKA
Message-ID: <uvuogmg5eenuhp73chlddelrl5shtkuy67rhis5afs2nejymmb@cmdnn6fzcjks>
References: <20241024071553.3073864-1-fj5100bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024071553.3073864-1-fj5100bi@fujitsu.com>

Hi Yoshihiro,

On Thu, Oct 24, 2024 at 07:15:53AM +0000, Yoshihiro Furudera wrote:
> Enable DWAPB I2C controller support on FUJITSU-MONAKA.
> This will be used in the FUJITSU-MONAKA server scheduled
> for shipment in 2027.
> 
> The DSDT information obtained when verified using an
> in-house simulator is presented below.
> 
>      Device (SMB0)
>      {
>          Name (_HID, "FUJI200B")  // _HID: Hardware ID
>          Name (_UID, Zero)  // _UID: Unique ID
>          ...
>          Name (_CRS, ResourceTemplate ()
>          {
>              Memory32Fixed (ReadWrite,
>                  0x2A4B0000,         // Address Base
>                  0x00010000,         // Address Length
>                  )
>              Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>              {
>                  0x00000159,
>              }
>          })
>          ...
>      }
> 
> The expression SMB0 is used to indicate SMBus HC#0,
> a string of up to four characters.
> 
> Created the SMB0 object according to the following
> specifications:
> 
> ACPI Specification
> 13.2. Accessing the SMBus from ASL Code
> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/13_ACPI_System_Mgmt_Bus_Interface_Spec/accessing-the-smbus-from-asl-code.html
> 
> IPMI Specification
> Example 4: SSIF Interface(P574)
> https://www.intel.co.jp/content/www/jp/ja/products/docs/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html
> 
> Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>

Pushed to i2c/i2c-host.

Thanks,
Andi

