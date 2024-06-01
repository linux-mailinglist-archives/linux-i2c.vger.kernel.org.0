Return-Path: <linux-i2c+bounces-3735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E98D6D45
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 03:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFAFA281B04
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 01:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA7C4A1C;
	Sat,  1 Jun 2024 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lEGHwaVy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A391A29
	for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2024 01:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717205502; cv=none; b=sO+UNzEqa6EkeVVAakYSvzRIcBC+zr6AfhaMVsh4KeQFmRnhGMtNsmOe2dUbJLZqwohUZ0fJN3+uX9Fm7SCTWfsenC14FtMkl9BCabBNX2xYX6E2kmO6ZvU338zasaHbZ4BVnPfENN0qGFURLecoKcxQvdRdYEThck78Vedu6Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717205502; c=relaxed/simple;
	bh=0T/Y7LbNkoDu0akjK5kDbgTC2pIzgsPhGg1U9sTUhm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhIUqPdRzA+P4KzShybt1qcWZU9wJDBmDYdayO9tXBfGKGpEdmp6A603KxEYsqwxK4GLYbtRCS9IWwSVBKGbF7N5Zx4rXUQP+C8iX2Z/kKjxMDI8XUr2Wwdi0/8ZXyaywq3UwIbImdOD88OpUPrABQLjxuoje7AiGOPnrYC/3aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lEGHwaVy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1sjp
	rW4d5GlX33CboM0Xr5N4sP9JPj+by1bw53Wwjlo=; b=lEGHwaVyP1rfKZuA3vWp
	Zg3od61EzKbaNSYWy1n4/uAGcerHCV8gCx0M+AzixrwU3ZVouDn58nS1oCKM5XmA
	mnQZhueBWIIw3ZCMZ1rCiw05Fxjl9sROE729liCE5C66FnZSVNzPwjWWwKhQoXS4
	w+TazAqvteNeaJPGgSYFZkfetELhpySGaQSgHlWjW8HH5z8OnqovQJ8IOk1fXgeh
	FNIaNTyLd/ENvj8nXXEcwyRJx2bn/nofG5zUuewaw7UHgbguJcqpLDoj0d0Dyt56
	tPi0rhJGYxWivNqW4UjOwUNBIldD2DvS0fdMpW8uTR+dkQsoNpcBt8aWI4S++Owr
	pw==
Received: (qmail 1314975 invoked from network); 1 Jun 2024 03:31:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jun 2024 03:31:36 +0200
X-UD-Smtp-Session: l3s3148p1@hmGeD8oZJJZehhtB
Date: Sat, 1 Jun 2024 03:31:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Dell PowerEdge R930: `i2c i2c-0: More than 8 memory slots on a
 single bus, contact i801 maintainer to add missing mux config`
Message-ID: <ykeksv7wbrxvuju37vdrrnalrbkvtvq3fqjsbhcaqtm3uignzj@ihuihrgxsq3t>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <b45ec360-9f3d-4f17-9d39-78f60890e865@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="phkxij2pukidqtkg"
Content-Disposition: inline
In-Reply-To: <b45ec360-9f3d-4f17-9d39-78f60890e865@molgen.mpg.de>


--phkxij2pukidqtkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Adding Heiner to CC...

On Tue, May 14, 2024 at 12:45:04PM +0200, Paul Menzel wrote:
> Dear Linux folks,
>=20
>=20
> On a Dell PowerEdge R930
>=20
>     DMI: Dell Inc. PowerEdge R930/0T55KM, BIOS 2.8.1 01/02/2020
>=20
> Linux 5.15.131 warns:
>=20
>     i2c i2c-0: Systems with more than 4 memory slots not supported yet, n=
ot
> instantiating SPD
>=20
> and Linux 6.9 warns:
>=20
>     i2c i2c-0: More than 8 memory slots on a single bus, contact i801
> maintainer to add missing mux config
>=20
> What information can I provide, so the mux config can be added?
>=20
>=20
> Kind regards,
>=20
> Paul
>=20
>=20
> PS: Some output:
>=20
> ```
> $ ls -lR /sys/bus/i2c/devices/
> /sys/bus/i2c/devices/:
> total 0
> lrwxrwxrwx 1 root root 0 May 14 12:20 i2c-0 ->
> ../../../devices/pci0000:00/0000:00:1f.3/i2c-0
> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-1 ->
> ../../../devices/pci0000:00/0000:00:1c.0/0000:03:00.0/i2c-1
> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-2 -> ../../../devices/pci0000:0=
0/0000:00:1c.6/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/i2c-2
> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-3 ->
> ../../../devices/pci0000:00/0000:00:1c.0/0000:03:00.1/i2c-3
> ```
>=20
> ```
> $ sudo dmidecode -t memory
> # dmidecode 3.3
> Getting SMBIOS data from sysfs.
> SMBIOS 2.8 present.
>=20
> Handle 0x1000, DMI type 16, 23 bytes
> Physical Memory Array
> 	Location: System Board Or Motherboard
> 	Use: System Memory
> 	Error Correction Type: Multi-bit ECC
> 	Maximum Capacity: 12 TB
> 	Error Information Handle: Not Provided
> 	Number Of Devices: 96
>=20
> Handle 0x1100, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 1
> 	Locator: A1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125734A
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1101, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 1
> 	Locator: A2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573BF
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1102, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 1
> 	Locator: A3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257315
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1103, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 1
> 	Locator: A4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572D4
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1104, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 2
> 	Locator: A5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257318
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1105, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 2
> 	Locator: A6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572D2
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1106, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 2
> 	Locator: A7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257350
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1107, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 2
> 	Locator: A8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257349
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1108, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 3
> 	Locator: A9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1109, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 3
> 	Locator: A10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x110A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 3
> 	Locator: A11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x110B, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 3
> 	Locator: A12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x110C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 4
> 	Locator: B1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572A7
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x110D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 4
> 	Locator: B2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572A1
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x110E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 4
> 	Locator: B3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125728D
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x110F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 4
> 	Locator: B4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125728C
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1110, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 5
> 	Locator: B5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125728F
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1111, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 5
> 	Locator: B6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257352
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1112, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 5
> 	Locator: B7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257294
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1113, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 5
> 	Locator: B8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125728E
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1114, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 6
> 	Locator: B9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1115, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 6
> 	Locator: B10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1116, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 6
> 	Locator: B11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1117, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 6
> 	Locator: B12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1118, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 7
> 	Locator: C1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125734D
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1119, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 7
> 	Locator: C2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572AB
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x111A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 7
> 	Locator: C3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125734F
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x111B, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 7
> 	Locator: C4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572D6
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x111C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 8
> 	Locator: C5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125734E
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x111D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 8
> 	Locator: C6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125731D
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x111E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 8
> 	Locator: C7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573FF
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x111F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 8
> 	Locator: C8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572D5
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1120, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 9
> 	Locator: C9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1121, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 9
> 	Locator: C10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1122, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 9
> 	Locator: C11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1123, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 9
> 	Locator: C12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1124, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 10
> 	Locator: D1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257409
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1125, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 10
> 	Locator: D2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257293
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1126, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 10
> 	Locator: D3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125740D
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1127, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 10
> 	Locator: D4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572AD
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1128, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 11
> 	Locator: D5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125740C
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1129, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 11
> 	Locator: D6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573C1
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x112A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 11
> 	Locator: D7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112572A6
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x112B, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 11
> 	Locator: D8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125740B
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x112C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 12
> 	Locator: D9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x112D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 12
> 	Locator: D10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x112E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 12
> 	Locator: D11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x112F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 12
> 	Locator: D12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1130, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 13
> 	Locator: E1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573E6
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1131, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 13
> 	Locator: E2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AD64
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1132, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 13
> 	Locator: E3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573D3
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1133, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 13
> 	Locator: E4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573D7
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1134, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 14
> 	Locator: E5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573A1
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1135, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 14
> 	Locator: E6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AD20
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1136, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 14
> 	Locator: E7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573D4
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1137, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 14
> 	Locator: E8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 112573D8
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1138, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 15
> 	Locator: E9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1139, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 15
> 	Locator: E10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x113A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 15
> 	Locator: E11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x113B, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 15
> 	Locator: E12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x113C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 16
> 	Locator: F1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125740A
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x113D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 16
> 	Locator: F2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257292
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x113E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 16
> 	Locator: F3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125740E
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x113F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 16
> 	Locator: F4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257408
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1140, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 17
> 	Locator: F5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257414
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1141, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 17
> 	Locator: F6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257406
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1142, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 17
> 	Locator: F7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125741A
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1143, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 17
> 	Locator: F8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257314
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1144, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 18
> 	Locator: F9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1145, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 18
> 	Locator: F10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1146, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 18
> 	Locator: F11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1147, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 18
> 	Locator: F12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1148, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 19
> 	Locator: G1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AD1F
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1149, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 19
> 	Locator: G2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257417
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x114A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 19
> 	Locator: G3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AD36
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x114B, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 19
> 	Locator: G4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AD38
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x114C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 20
> 	Locator: G5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AD1B
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x114D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 20
> 	Locator: G6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257319
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x114E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 20
> 	Locator: G7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129AC49
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x114F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 20
> 	Locator: G8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1129ADB0
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1150, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 21
> 	Locator: G9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1151, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 21
> 	Locator: G10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1152, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 21
> 	Locator: G11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1153, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 21
> 	Locator: G12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x1154, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 22
> 	Locator: H1
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125740F
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1155, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 22
> 	Locator: H2
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125731A
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1156, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 22
> 	Locator: H3
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257316
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1157, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 22
> 	Locator: H4
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257411
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1158, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 23
> 	Locator: H5
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257287
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x1159, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 23
> 	Locator: H6
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257412
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x115A, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 23
> 	Locator: H7
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 1125728B
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x115B, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: 72 bits
> 	Data Width: 64 bits
> 	Size: 16 GB
> 	Form Factor: DIMM
> 	Set: 23
> 	Locator: H8
> 	Bank Locator: Not Specified
> 	Type: DDR4
> 	Type Detail: Synchronous Registered (Buffered)
> 	Speed: 2133 MT/s
> 	Manufacturer: 002C00B3002C
> 	Serial Number: 11257317
> 	Asset Tag: 0F154830
> 	Part Number: 36ASF2G72PZ-2G1A2
> 	Rank: 2
> 	Configured Memory Speed: 1600 MT/s
> 	Minimum Voltage: 1.2 V
> 	Maximum Voltage: 1.2 V
> 	Configured Voltage: 1.2 V
>=20
> Handle 0x115C, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 24
> 	Locator: H9
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x115D, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 24
> 	Locator: H10
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x115E, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 24
> 	Locator: H11
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
>=20
> Handle 0x115F, DMI type 17, 40 bytes
> Memory Device
> 	Array Handle: 0x1000
> 	Error Information Handle: Not Provided
> 	Total Width: Unknown
> 	Data Width: Unknown
> 	Size: No Module Installed
> 	Form Factor: Unknown
> 	Set: 24
> 	Locator: H12
> 	Bank Locator: Not Specified
> 	Type: Unknown
> 	Type Detail: None
> 	Speed: Unknown
> 	Manufacturer: Not Specified
> 	Serial Number: Not Specified
> 	Asset Tag: Not Specified
> 	Part Number: Not Specified
> 	Rank: Unknown
> 	Configured Memory Speed: Unknown
> 	Minimum Voltage: Unknown
> 	Maximum Voltage: Unknown
> 	Configured Voltage: Unknown
> ```
>=20
> ```
> $ lsmem
> RANGE                                  SIZE  STATE REMOVABLE BLOCK
> 0x0000000000000000-0x000000007fffffff    2G online       yes     0
> 0x0000000100000000-0x000001007fffffff 1022G online       yes 2-512
>=20
> Memory block size:         2G
> Total online memory:       1T
> Total offline memory:      0B
> ```
>=20

--phkxij2pukidqtkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZaefgACgkQFA3kzBSg
KbbVfg/+LKVi55lVvjQpPoqXH8KXmWNDbxcxs6eAIG8RQnCMsqBBfBKNdNwFWjDC
7O0H4SC9R///iNRf2tro2o0qeqv/Gufh/kbcEo4yyhR4+WM9pI/svETk2N0LIOYM
yw5FQpPWnbgF97c7kwdnOcElGi5JNa2H/tqutq1zxnMQCx9tS3u80C/PejhdNIHb
lI3wYHUOmCX8S0VH+EI8ACtN1azlfx7pZhFO0J1+y39TgDCrRMORcA5dSmK5Jlwo
mSAYz3Ns+Ne1daXQETbIKPm0JT3Hw/o+fHOSxUa+xESWFqbSqmbnDXGYfAl+Feq0
tjv6hSPpCZcC4Zxx03cPN1V0nbEFgMQzrkz/ke8Bm+qBIEsiwBqo58yZPnP2Jgwj
akB8dLoLqt35aShY27JU8aMlh1V5LCmopWOAa3bkXXxANS/VuRDTfvgZF/OOpzLy
9IpTsV2GaYr7EbI+Rj93yIdI257RLstJL8uGIWF17xt/Z8tFIEzzTy9eJilB/YVf
+ZT4nj3Mmjc4nQDkF7Xs035y4WVsZhaPScushByAixulI0vOb9CzF4SrdTXWbl6f
nUjo5vTWna+rrBBqBvoNjaagPxJyFVYRKEloBUUKNq/w9V8Ukhdo+eAhyQkCTWvq
RlA0TxTqGKNmvLi5eAbgPgF5PCQN/HqXnLAjJi8VcHU56nGrRvg=
=+ftV
-----END PGP SIGNATURE-----

--phkxij2pukidqtkg--

