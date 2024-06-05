Return-Path: <linux-i2c+bounces-3812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F19138FD03E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 15:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B4E29D6E7
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A17D518;
	Wed,  5 Jun 2024 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1zkHWmp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5452C132;
	Wed,  5 Jun 2024 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595773; cv=none; b=Ob5LfYMljNwqU/yxkGERqqvqZN72VOv1t4jr4JmTKp88PdozC25qou7RuFW9bZVin/CdMhzyKw0dHF8LGDqPu51UdVi/ySz30xbhk9mUuC7DJAdY2id6SFLNp4b60PqoZTCXWcDPyyDRDbsLNVoWKPHZxSTfIH05GICc55LfiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595773; c=relaxed/simple;
	bh=fEWnPn/LF0XpawezW7e5tZ6bGnBM0nB8OqKarFOWnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNtDjXW2Dx5DDxFDJNBXkuWPKwybmAAR7XWFe/PLqMh7ypbIEKHqz+4rIRG0SZ86nuJ+222qdvfaavdo9CLpZGqPFgT4nJYxFfSC6pRd8tFm2ReWTZ5tpQn4q63nfaa03NS0l/uubwkVemQKGIVowjJtC3ti12Ps3hQsWJvC0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1zkHWmp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f67fa9cd73so7086715ad.0;
        Wed, 05 Jun 2024 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717595771; x=1718200571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LpF7MY6zGEBbIyxQfDuVxoxQilPPnjYvJErElpnvtAw=;
        b=Y1zkHWmpx2zfTuLnD2uncbziDQxUZXdNKuCMJ8nVSz+mlczV4vvbmjOWUOzqHaZIog
         hINigxQhw6ElXhxilbmCKGf8/BS9+z1BTGhyMhNyhFa5rCHB1o0/vXAmpKbk4bm1ZF3j
         jWEex4jszm7Vhg6+NV6+SOiiyIw1bqthDsgAD6J4ct/k7/1Xhq+hwlTBC93coaCrqzQj
         r+kvx4ZO/gAncnhF0fRR1iWx9Rz6Zyr25lEdccCQZZ8Uo/C8MyjlzbemwDAYI36JXT00
         3PuPePRrTLvhp5N/CautogSEleu3GI6lovlPU4I2+KhsQQyovG9UkVwD7v/NmG93pLjI
         qL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717595771; x=1718200571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpF7MY6zGEBbIyxQfDuVxoxQilPPnjYvJErElpnvtAw=;
        b=cb1RNzSXZsC+FAj1N2Gz3I09VwYEJFUWY32Q4olAhYXIo/cg+cJWyUpLC+BoCqmMQh
         l7QBDd9v17bmNWSX3f7raYz+z/tVXInmEhwEPaVUgcyEh8xxTHeU9XLMyOeEfs+qTL1G
         P7LUKH1Q+A5XfSWa25WzK265wL2KoQDJrsUTpDU1Q4+vS/IKZzUIsWABxF/YMow3fslo
         8JPGS8m1yjEE3hr+RwlWfBmNSIzoTNA0sbebzmpW7gNisYUnbSG5fq7jJIghLyDSkULW
         /grhlhS04vfKCmuL6tZhsiq1iggV40dIMeJ3lmFu966FZ+l0wKZBcdHkeaJogeUi8A3J
         MIEA==
X-Forwarded-Encrypted: i=1; AJvYcCXKFpsrCr2Md06u8gia6so1BQ5vicDsXkMwH6B9TTpuDI9D80fZ4Fyg2cD0ajyLvQC+2AIZSNx65t1611awF/E4SBD8aHnePk9GuGHlMZjcwW8PsR+zpdvcm1gFkfyg63K+vyJvzlCakzKBBsHKwX1UNFBiy7/iYThXS6d55XpLqszZ9Q==
X-Gm-Message-State: AOJu0YyzpE+5SGHX0Hm9sqFfwVuiF3uT8+dXxuRvf8gsqdhpJmWxKxdf
	rfcG1yNG69Q0/48hAdq1NVpTRX86KxI9iXp93vCgY4QAVsFkud3h
X-Google-Smtp-Source: AGHT+IHCHGWPHo/mhx3fAHCUvV1+YdW3pvIpkYURnyIqdl5d+GU6Ur6AxTYH74RbJwPjP8dHnuQOeQ==
X-Received: by 2002:a17:902:ce90:b0:1f6:3a73:1eac with SMTP id d9443c01a7336-1f6a569e528mr45489525ad.17.1717595770925;
        Wed, 05 Jun 2024 06:56:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6a5258b54sm18318125ad.53.2024.06.05.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:56:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Jun 2024 06:56:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactcode.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Message-ID: <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>

Hi Paul,

On Wed, Jun 05, 2024 at 02:21:50PM +0200, Paul Menzel wrote:
> Dear Guenter,
> 
> 
> Thank you so much for taking this on.
> 
> Am 04.06.24 um 06:02 schrieb Guenter Roeck:
> > Detect DDR5 memory and instantiate the SPD5118 driver automatically.
> > 
> > Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > v5: New patch
> > 
> >   drivers/i2c/i2c-smbus.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> > index 97f338b123b1..8a0dab835761 100644
> > --- a/drivers/i2c/i2c-smbus.c
> > +++ b/drivers/i2c/i2c-smbus.c
> > @@ -382,6 +382,10 @@ void i2c_register_spd(struct i2c_adapter *adap)
> >   	case 0x1E:	/* LPDDR4 */
> >   		name = "ee1004";
> >   		break;
> > +	case 0x22:	/* DDR5 */
> > +	case 0x23:	/* LPDDR5 */
> > +		name = "spd5118";
> > +		break;
> >   	default:
> >   		dev_info(&adap->dev,
> >   			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",
> 
> Testing this on top of 6.10-rc2+ on a Supermicro X13SAE, Linux logs:
> 
>     $ dmesg | grep -e "DMI:" -e "Linux version" -e i2c-0
>     [    0.000000] Linux version 6.10.0-rc2.mx64.461-00036-g151dfab265df
> (pmenzel@foreveralone.molgen.mpg.de) (gcc (GCC) 12.3.0, GNU ld (GNU
> Binutils) 2.41) #74 SMP PREEMPT_DYNAMIC Wed Jun  5 08:24:59 CEST 2024
>     [    0.000000] DMI: Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022
>     [    0.000000] DMI: Memory slots populated: 4/4
>     [    5.434488] i2c i2c-0: Successfully instantiated SPD at 0x50
>     [    5.443848] i2c i2c-0: Successfully instantiated SPD at 0x51
>     [    5.450033] i2c i2c-0: Successfully instantiated SPD at 0x52
>     [    5.459378] i2c i2c-0: Successfully instantiated SPD at 0x53
> 
> Then with `sudo modprobe at24` and `sudo modprobe ee1004`, `decode-dimms`
> shows:
> 
You'd actually have to load the spd5118 driver.

>     $ sudo ./eeprom/decode-dimms
>     # decode-dimms version 4.3
> 
>     Memory Serial Presence Detect Decoder
>     By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
>     Jean Delvare, Trent Piepho and others
> 
> 
>     Number of SDRAM DIMMs detected and decoded: 0
> 
> This might be expected, and `decode-dimms` also needs to be updated.
> 

Correct. The hack below makes it detect the DIMMs, but the data format
is all different, so it is only really useful to validate reading
the EEPROM (i.e., the checksum over the first 512 bytes of the eeprom
is correct). With that patch applied, I get

Decoding EEPROM: /sys/bus/i2c/drivers/spd5118/0-0050
Guessing DIMM is in                              bank 1
Kernel driver used                               spd5118

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-509 48 1                   OK (0x47A2)
# of bytes written to SDRAM EEPROM               1024
Total number of bytes in EEPROM                  1024
Fundamental Memory type                          DDR5 SDRAM

---=== Manufacturing Information ===---
Manufacturer                                     Invalid
Custom Manufacturer Data                         00 00 00 00 00 88 13 ("???????")
Manufacturing Location Code                      0x08
Part Number                                      Undefined
Revision Code                                    0x4C1D
Manufacturing Date                               0x0C00

and so on.

Thanks,
Guenter

---
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index 787b6f5..64b6e81 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -2407,7 +2407,12 @@ sub spd_sizes($)
 	my $bytes = shift;
 	my $type = $bytes->[2];
 
-	if ($type == 12 || $type == 14 || $type == 16 || $type == 17) {
+	if ($type == 18 || $type == 19 || $type == 20 || $type == 21) {
+		# DDR5
+		my $spd_len = 256 * ((($bytes->[0] >> 4) & 7) + 1);
+		my $used = $spd_len;
+		return ($spd_len, $used);
+	} elsif ($type == 12 || $type == 14 || $type == 16 || $type == 17) {
 		# DDR4
 		my $spd_len = 256 * (($bytes->[0] >> 4) & 7);
 		my $used = 128 * ($bytes->[0] & 15);
@@ -2516,11 +2521,17 @@ sub calculate_crc($$$)
 sub check_crc($)
 {
 	my $bytes = shift;
+	my $is_ddr5 = ($bytes->[0] & 0x70) == 0x30;
 	my $crc_cover = $bytes->[0] & 0x80 ? 116 : 125;
+	my $crc_start = 126;
+	if ($is_ddr5) {
+	    $crc_cover = 509;
+	    $crc_start = 510;
+	}
 	my $crc = calculate_crc($bytes, 0, $crc_cover + 1);
 
-	my $dimm_crc = ($bytes->[127] << 8) | $bytes->[126];
-	return ("EEPROM CRC of bytes 0-$crc_cover",
+	my $dimm_crc = ($bytes->[$crc_start + 1] << 8) | $bytes->[$crc_start];
+	return ("EEPROM CRC of bytes 0-$crc_cover $bytes->[0] $is_ddr5",
 		($dimm_crc == $crc) ? 1 : 0,
 		sprintf("0x%04X", $dimm_crc),
 		sprintf("0x%04X", $crc));
@@ -2622,6 +2633,7 @@ sub get_dimm_list
 	if ($use_sysfs) {
 		@drivers = ('eeprom',
 			    'at24',
+			    'spd5118',
 			    'ee1004');	# DDR4
 	} else {
 		@drivers = ('eeprom');
@@ -2640,14 +2652,13 @@ sub get_dimm_list
 				# We look for I2C devices like 0-0050 or 2-0051
 				next unless $file =~ /^\d+-[\da-f]+$/i;
 				next unless -d "$dir/$file";
-
 				# Device name must be eeprom (driver eeprom)
 				# spd (driver at24) or ee1004 (driver ee1004)
 				my $attr = sysfs_device_attribute("$dir/$file", "name");
 				next unless defined $attr &&
 					    ($attr eq "eeprom" ||
 					     $attr eq "spd" ||
-					     $attr eq "ee1004");	# DDR4
+					     $attr eq "spd5118" || $attr eq "ee1004");	# DDR4
 			} else {
 				next unless $file =~ /^eeprom-/;
 			}
@@ -2681,7 +2692,7 @@ sub get_dimm_list
 @dimm = get_dimm_list() unless $use_hexdump;
 
 for my $i (0 .. $#dimm) {
-	my @bytes = readspd(0, 128, $dimm[$i]->{file});
+	my @bytes = readspd(0, 512, $dimm[$i]->{file});
 	$dimm[$i]->{bytes} = \@bytes;
 	$dimm[$i]->{is_rambus} = $bytes[0] < 4;		# Simple heuristic
 	if ($dimm[$i]->{is_rambus} || $bytes[2] < 9) {


