Return-Path: <linux-i2c+bounces-4321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C191591F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 23:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4410B280F5E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 21:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D46B1A0AE1;
	Mon, 24 Jun 2024 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9KaXIVj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3851A0702;
	Mon, 24 Jun 2024 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719265040; cv=none; b=OXguH9HJJhoyuDPJh77FR51Q7yloP32EZcocjwxNbAl/mrMQVFFrP/SYpmcV0aXLLJCiYb+OYy3DvudOjBbFCEb/ep/zsQir+nFJwR8LG22WhuNw5WkCYLeP4ztnbucHDnzqqNyjE052x3NSkjXAK4ajiS4PH2/2dCW5aSkODOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719265040; c=relaxed/simple;
	bh=duYQm5Pa6ZCxthGnvHq/ONMk/uemf2HG2lsKNHK1qL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KieEP6jH6SufC/jsQz2gnF3+tgVuS2y0k85gWdFdnniZDqdIojLSbpKGvFdrN5KI4TVetax9tH7HECURFHXc5k+gecNOamP34yuwFVKSqORQrPDTsyuP60LY4UWUE+4ocsTZFeu0QYX3GzuMGOk9BQGP94rl7YUf4Ux6X/lwJn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9KaXIVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC8FC2BBFC;
	Mon, 24 Jun 2024 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719265039;
	bh=duYQm5Pa6ZCxthGnvHq/ONMk/uemf2HG2lsKNHK1qL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9KaXIVj82eVmV9XX1JZJUycqJ4UzRGtyru0fF0zNIYA2UI0QnJlxaK6zYTlRolDB
	 FvFEyVxidgRuU5lQV6SdxJgdX2jMOOxHLhIdQijOUpJ9XqaU/ud/1yYRJazXybeBKd
	 ZtP1gYTmf207I+iQXFYuZn6yNgyjgG8+N627QH3ZFcPI5huMbafb97LjQ4lvnEtIzu
	 BfrxZ0a+5eEf5AeiQs24Zl4nofD+HH5AY81qJCQ1omfX8F7NbTqBTSbYikrufFTnoy
	 adPqRYBZB9OVPObZf1D/1Jcfu07NMm8GgBTrbAetrPD7qib8w8Rd1zWkd93h0w4Xcz
	 K4equaQWvBH6g==
Received: by pali.im (Postfix)
	id D9174BF4; Mon, 24 Jun 2024 23:37:15 +0200 (CEST)
Date: Mon, 24 Jun 2024 23:37:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com
Subject: Re: Dell PowerEdge R930: `i2c i2c-0: More than 8 memory slots on a
 single bus, contact i801 maintainer to add missing mux config`
Message-ID: <20240624213715.ng634mfjmufogzgq@pali>
References: <b45ec360-9f3d-4f17-9d39-78f60890e865@molgen.mpg.de>
 <ykeksv7wbrxvuju37vdrrnalrbkvtvq3fqjsbhcaqtm3uignzj@ihuihrgxsq3t>
 <27e28354-5658-4be8-a7fe-31dacd40586e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27e28354-5658-4be8-a7fe-31dacd40586e@gmail.com>
User-Agent: NeoMutt/20180716

On Monday 24 June 2024 21:41:13 Heiner Kallweit wrote:
> On 01.06.2024 03:31, Wolfram Sang wrote:
> > 
> > Adding Heiner to CC...
> > 
> > On Tue, May 14, 2024 at 12:45:04PM +0200, Paul Menzel wrote:
> >> Dear Linux folks,
> >>
> >>
> >> On a Dell PowerEdge R930
> >>
> >>     DMI: Dell Inc. PowerEdge R930/0T55KM, BIOS 2.8.1 01/02/2020
> >>
> >> Linux 5.15.131 warns:
> >>
> >>     i2c i2c-0: Systems with more than 4 memory slots not supported yet, not
> >> instantiating SPD
> >>
> >> and Linux 6.9 warns:
> >>
> >>     i2c i2c-0: More than 8 memory slots on a single bus, contact i801
> >> maintainer to add missing mux config
> >>
> >> What information can I provide, so the mux config can be added?
> >>
> See Asus Z8 mux support in i801. At first it's relevant whether the system
> uses a GPIO to do the muxing, or some other mechanism. Then the mux config
> parameters are needed. Supposedly only Dell can provide all this information.
> Therefore +Pali who maintains certain Dell drivers, and +Dell.Client.Kernel@dell.com

I doubt that we can do anything there. IIRC SPD is i2c-based protocol
for detecting DDR modules, mostly used for DDR training and configuring
DDR by firmware / bootloader. If you have more slots on single bus than
supported maximum then some kind of muxing is needed. E.g. by GPIO
switches or by i2c bus multiplexer. All this depends on the board wiring
for which you have to ask your support contract.

I think that you can safely ignore this warning. DDR is configured by
firmware and kernel does not have to care about it. What SPD can provide
is just information what kind of DDR module is attached in which DDR
slot. And this information you have already sent from dmidecode output,
so I guess that firmware filled these data into DMI structures which
allowed linux to look at them via dmidecode.

> >>
> >> Kind regards,
> >>
> >> Paul
> >>
> Heiner
> >>
> >> PS: Some output:
> >>
> >> ```
> >> $ ls -lR /sys/bus/i2c/devices/
> >> /sys/bus/i2c/devices/:
> >> total 0
> >> lrwxrwxrwx 1 root root 0 May 14 12:20 i2c-0 ->
> >> ../../../devices/pci0000:00/0000:00:1f.3/i2c-0
> >> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-1 ->
> >> ../../../devices/pci0000:00/0000:00:1c.0/0000:03:00.0/i2c-1
> >> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-2 -> ../../../devices/pci0000:00/0000:00:1c.6/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/i2c-2
> >> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-3 ->
> >> ../../../devices/pci0000:00/0000:00:1c.0/0000:03:00.1/i2c-3
> >> ```
> >>
> >> ```
> >> $ sudo dmidecode -t memory
> >> # dmidecode 3.3
> >> Getting SMBIOS data from sysfs.
> >> SMBIOS 2.8 present.
> >>
> >> Handle 0x1000, DMI type 16, 23 bytes
> >> Physical Memory Array
> >> 	Location: System Board Or Motherboard
> >> 	Use: System Memory
> >> 	Error Correction Type: Multi-bit ECC
> >> 	Maximum Capacity: 12 TB
> >> 	Error Information Handle: Not Provided
> >> 	Number Of Devices: 96
> >>
> >> Handle 0x1100, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 1
> >> 	Locator: A1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125734A
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1101, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 1
> >> 	Locator: A2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573BF
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1102, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 1
> >> 	Locator: A3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257315
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1103, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 1
> >> 	Locator: A4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572D4
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1104, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 2
> >> 	Locator: A5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257318
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1105, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 2
> >> 	Locator: A6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572D2
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1106, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 2
> >> 	Locator: A7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257350
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1107, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 2
> >> 	Locator: A8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257349
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1108, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 3
> >> 	Locator: A9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1109, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 3
> >> 	Locator: A10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x110A, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 3
> >> 	Locator: A11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x110B, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 3
> >> 	Locator: A12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x110C, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 4
> >> 	Locator: B1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572A7
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x110D, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 4
> >> 	Locator: B2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572A1
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x110E, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 4
> >> 	Locator: B3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125728D
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x110F, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 4
> >> 	Locator: B4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125728C
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1110, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 5
> >> 	Locator: B5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125728F
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1111, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 5
> >> 	Locator: B6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257352
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1112, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 5
> >> 	Locator: B7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257294
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1113, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 5
> >> 	Locator: B8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125728E
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1114, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 6
> >> 	Locator: B9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1115, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 6
> >> 	Locator: B10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1116, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 6
> >> 	Locator: B11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1117, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 6
> >> 	Locator: B12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1118, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 7
> >> 	Locator: C1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125734D
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1119, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 7
> >> 	Locator: C2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572AB
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x111A, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 7
> >> 	Locator: C3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125734F
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x111B, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 7
> >> 	Locator: C4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572D6
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x111C, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 8
> >> 	Locator: C5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125734E
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x111D, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 8
> >> 	Locator: C6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125731D
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x111E, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 8
> >> 	Locator: C7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573FF
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x111F, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 8
> >> 	Locator: C8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572D5
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1120, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 9
> >> 	Locator: C9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1121, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 9
> >> 	Locator: C10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1122, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 9
> >> 	Locator: C11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1123, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 9
> >> 	Locator: C12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1124, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 10
> >> 	Locator: D1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257409
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1125, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 10
> >> 	Locator: D2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257293
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1126, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 10
> >> 	Locator: D3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125740D
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1127, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 10
> >> 	Locator: D4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572AD
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1128, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 11
> >> 	Locator: D5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125740C
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1129, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 11
> >> 	Locator: D6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573C1
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x112A, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 11
> >> 	Locator: D7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112572A6
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x112B, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 11
> >> 	Locator: D8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125740B
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x112C, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 12
> >> 	Locator: D9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x112D, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 12
> >> 	Locator: D10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x112E, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 12
> >> 	Locator: D11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x112F, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 12
> >> 	Locator: D12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1130, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 13
> >> 	Locator: E1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573E6
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1131, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 13
> >> 	Locator: E2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AD64
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1132, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 13
> >> 	Locator: E3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573D3
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1133, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 13
> >> 	Locator: E4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573D7
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1134, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 14
> >> 	Locator: E5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573A1
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1135, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 14
> >> 	Locator: E6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AD20
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1136, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 14
> >> 	Locator: E7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573D4
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1137, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 14
> >> 	Locator: E8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 112573D8
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1138, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 15
> >> 	Locator: E9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1139, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 15
> >> 	Locator: E10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x113A, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 15
> >> 	Locator: E11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x113B, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 15
> >> 	Locator: E12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x113C, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 16
> >> 	Locator: F1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125740A
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x113D, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 16
> >> 	Locator: F2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257292
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x113E, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 16
> >> 	Locator: F3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125740E
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x113F, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 16
> >> 	Locator: F4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257408
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1140, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 17
> >> 	Locator: F5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257414
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1141, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 17
> >> 	Locator: F6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257406
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1142, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 17
> >> 	Locator: F7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125741A
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1143, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 17
> >> 	Locator: F8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257314
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1144, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 18
> >> 	Locator: F9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1145, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 18
> >> 	Locator: F10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1146, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 18
> >> 	Locator: F11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1147, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 18
> >> 	Locator: F12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1148, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 19
> >> 	Locator: G1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AD1F
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1149, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 19
> >> 	Locator: G2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257417
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x114A, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 19
> >> 	Locator: G3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AD36
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x114B, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 19
> >> 	Locator: G4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AD38
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x114C, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 20
> >> 	Locator: G5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AD1B
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x114D, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 20
> >> 	Locator: G6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257319
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x114E, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 20
> >> 	Locator: G7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129AC49
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x114F, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 20
> >> 	Locator: G8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1129ADB0
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1150, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 21
> >> 	Locator: G9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1151, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 21
> >> 	Locator: G10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1152, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 21
> >> 	Locator: G11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1153, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 21
> >> 	Locator: G12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x1154, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 22
> >> 	Locator: H1
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125740F
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1155, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 22
> >> 	Locator: H2
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125731A
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1156, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 22
> >> 	Locator: H3
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257316
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1157, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 22
> >> 	Locator: H4
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257411
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1158, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 23
> >> 	Locator: H5
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257287
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x1159, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 23
> >> 	Locator: H6
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257412
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x115A, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 23
> >> 	Locator: H7
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 1125728B
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x115B, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: 72 bits
> >> 	Data Width: 64 bits
> >> 	Size: 16 GB
> >> 	Form Factor: DIMM
> >> 	Set: 23
> >> 	Locator: H8
> >> 	Bank Locator: Not Specified
> >> 	Type: DDR4
> >> 	Type Detail: Synchronous Registered (Buffered)
> >> 	Speed: 2133 MT/s
> >> 	Manufacturer: 002C00B3002C
> >> 	Serial Number: 11257317
> >> 	Asset Tag: 0F154830
> >> 	Part Number: 36ASF2G72PZ-2G1A2
> >> 	Rank: 2
> >> 	Configured Memory Speed: 1600 MT/s
> >> 	Minimum Voltage: 1.2 V
> >> 	Maximum Voltage: 1.2 V
> >> 	Configured Voltage: 1.2 V
> >>
> >> Handle 0x115C, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 24
> >> 	Locator: H9
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x115D, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 24
> >> 	Locator: H10
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x115E, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 24
> >> 	Locator: H11
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >>
> >> Handle 0x115F, DMI type 17, 40 bytes
> >> Memory Device
> >> 	Array Handle: 0x1000
> >> 	Error Information Handle: Not Provided
> >> 	Total Width: Unknown
> >> 	Data Width: Unknown
> >> 	Size: No Module Installed
> >> 	Form Factor: Unknown
> >> 	Set: 24
> >> 	Locator: H12
> >> 	Bank Locator: Not Specified
> >> 	Type: Unknown
> >> 	Type Detail: None
> >> 	Speed: Unknown
> >> 	Manufacturer: Not Specified
> >> 	Serial Number: Not Specified
> >> 	Asset Tag: Not Specified
> >> 	Part Number: Not Specified
> >> 	Rank: Unknown
> >> 	Configured Memory Speed: Unknown
> >> 	Minimum Voltage: Unknown
> >> 	Maximum Voltage: Unknown
> >> 	Configured Voltage: Unknown
> >> ```
> >>
> >> ```
> >> $ lsmem
> >> RANGE                                  SIZE  STATE REMOVABLE BLOCK
> >> 0x0000000000000000-0x000000007fffffff    2G online       yes     0
> >> 0x0000000100000000-0x000001007fffffff 1022G online       yes 2-512
> >>
> >> Memory block size:         2G
> >> Total online memory:       1T
> >> Total offline memory:      0B
> >> ```
> >>
> 

