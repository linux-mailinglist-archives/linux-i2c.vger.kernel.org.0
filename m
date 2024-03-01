Return-Path: <linux-i2c+bounces-2088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB33086DE1A
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 10:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 041411C2103D
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC2069D33;
	Fri,  1 Mar 2024 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZC50hdhk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB31E886
	for <linux-i2c@vger.kernel.org>; Fri,  1 Mar 2024 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709284993; cv=fail; b=u+NKlkNdsxdlBVIOsFu2wGn4dlRc6Juc7VF6lixeUjWp/wIbiFha5paTq9ScdVTSe+kKHSasvm3faWm4oQnuDtVPQNSwJvytjglfYy86xQ5QCR7TDsVS4DvuBft70NDvBdjMt8qHYZssxy6PW4yBxIsdWqg2scZ0paXzgRBkqo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709284993; c=relaxed/simple;
	bh=QowHTAb820O2k4VPGvszeZH7SAyvCZiYiwxVRmctXPs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AawcumBl+MPOFbdEknss6uQfjJtJewei3pgGHOk8ejOco3FARVIZz+hRokdLQfUaM5/7rC1LX/aZUhgAcpZVY07nWV2dklchwjKluIkDyGRZMZ6RwwEO+mdALTOkkbQfHe5Jv53ZolQ7p1Ywx2YGEUSmUVmLl7IOh0g1DaZZkX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZC50hdhk; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMF5M7QISBps6y6pzThTu7RjQMSGmcZjRqajk7uIDSdFjE9M6ifjMWu/k4kX9bHhIDTPTUbOFznHEcuzmfKUWro0UXGdIFkRT4/aAwe9rM+hGrLzb7BSiCRMTaeRt5xozoGHHvDAH5o75cxdJJS9wPWtaMXKqaLhBPUgzZRlHSRaOR28H+OmkoRpiwuYnbK45CSyIEfXSXfyoMh/9b6q2LhKohsyr594rf+Z71VAZDKdMyFIuJlX/icNeigIcvUVg8v1Qd9QP9PjEq2oxBB5rfp7+cNsxEsSOt3Tie5fHm0uHtqbaY5U00EsKVQfeO7oDbrxKL0nYWftBHFokXTeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGuoUwYj1cj1uPgdQ9U7ur8vLZS7bpwqgwNb7kdh5Fk=;
 b=BnpgfqQ6CuZaqlbMfrlCvZ0M3gp/wz4k+v5/iS89ArZqvJCzU9TRkxVMmKbB23iAW3PBcmy4Z5BctE6AXHsFB5BYkTW4kyvjDTSpL9u+B8z7viBUPPDfBlkRyKaTSbbNkgIY5bSq5s/Kk5/GnNB2jGcvnMBJL/vyVWfAyqXgmga3K1p9PrzWdn8GiJDRCFts99sc6Jd/8s/XjRSX2CLAWx83R1+sKCQwYCmaE4jCKxTu2jLhdsiVTEnf86t2569asHcGfULLWF+84sZUjq+CeSs3lve5YdaajkWg4mMUA8FjK5n/lBoEAedqVjnFjo9Tlz+vR+iWhlNsUfK9Qiin9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGuoUwYj1cj1uPgdQ9U7ur8vLZS7bpwqgwNb7kdh5Fk=;
 b=ZC50hdhkyfAIIPtlu8b4RjKFqEjgHhBAPt9BYsya89VJmUg0dH37Y8vv3EfIgaHmfN2YIEeCsYyq/F9yYVgfaiHI2LjwN3N8wpiqfMnYloSVK0PhwfbrTqvFIE1OQVq/5wnwSa+cgPe9+r5wlotDoBOkYQRpNQEjvo/GytjBmcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Fri, 1 Mar
 2024 09:23:07 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::6622:ec76:9367:3907]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::6622:ec76:9367:3907%2]) with mapi id 15.20.7316.046; Fri, 1 Mar 2024
 09:23:07 +0000
Message-ID: <4d071efb-d951-43cf-a845-8eef57483643@amd.com>
Date: Fri, 1 Mar 2024 10:22:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Content-Language: en-US
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>,
 Robert Hancock <robert.hancock@calian.com>,
 "ben-linux@fluff.org" <ben-linux@fluff.org>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
 <DM4PR12MB61092C8804E50438DB36609B8C5E2@DM4PR12MB6109.namprd12.prod.outlook.com>
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJkK9VOBQkWf4AXAAoJEDd8
 fyH+PR+ROzEP/1IFM7J4Y58SKuvdWDddIvc7JXcal5DpUtMdpuV+ZiHSOgBQRqvwH4CVBK7p
 ktDCWQAoWCg0KhdGyBjfyVVpm+Gw4DkZovcvMGUlvY5p5w8XxTE5Xx+cj/iDnj83+gy+0Oyz
 VFU9pew9rnT5YjSRFNOmL2dsorxoT1DWuasDUyitGy9iBegj7vtyAsvEObbGiFcKYSjvurkm
 MaJ/AwuJehZouKVfWPY/i4UNsDVbQP6iwO8jgPy3pwjt4ztZrl3qs1gV1F4Zrak1k6qoDP5h
 19Q5XBVtq4VSS4uLKjofVxrw0J+sHHeTNa3Qgk9nXJEvH2s2JpX82an7U6ccJSdNLYbogQAS
 BW60bxq6hWEY/afbT+tepEsXepa0y04NjFccFsbECQ4DA3cdA34sFGupUy5h5la/eEf3/8Kd
 BYcDd+aoxWliMVmL3DudM0Fuj9Hqt7JJAaA0Kt3pwJYwzecl/noK7kFhWiKcJULXEbi3Yf/Y
 pwCf691kBfrbbP9uDmgm4ZbWIT5WUptt3ziYOWx9SSvaZP5MExlXF4z+/KfZAeJBpZ95Gwm+
 FD8WKYjJChMtTfd1VjC4oyFLDUMTvYq77ABkPeKB/WmiAoqMbGx+xQWxW113wZikDy+6WoCS
 MPXfgMPWpkIUnvTIpF+m1Nyerqf71fiA1W8l0oFmtCF5oTMkzsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmQr1YsFCRZ/gFoACgkQN3x/If49H5H6BQ//TqDpfCh7Fa5v227mDISwU1VgOPFK
 eo/+4fF/KNtAtU/VYmBrwT/N6clBxjJYY1i60ekFfAEsCb+vAr1W9geYYpuA+lgR3/BOkHlJ
 eHf4Ez3D71GnqROIXsObFSFfZWGEgBtHBZ694hKwFmIVCg+lqeMV9nPQKlvfx2n+/lDkspGi
 epDwFUdfJLHOYxFZMQsFtKJX4fBiY85/U4X2xSp02DxQZj/N2lc9OFrKmFJHXJi9vQCkJdIj
 S6nuJlvWj/MZKud5QhlfZQsixT9wCeOa6Vgcd4vCzZuptx8gY9FDgb27RQxh/b1ZHalO1h3z
 kXyouA6Kf54Tv6ab7M/fhNqznnmSvWvQ4EWeh8gddpzHKk8ixw9INBWkGXzqSPOztlJbFiQ3
 YPi6o9Pw/IxdQJ9UZ8eCjvIMpXb4q9cZpRLT/BkD4ttpNxma1CUVljkF4DuGydxbQNvJFBK8
 ywyA0qgv+Mu+4r/Z2iQzoOgE1SymrNSDyC7u0RzmSnyqaQnZ3uj7OzRkq0fMmMbbrIvQYDS/
 y7RkYPOpmElF2pwWI/SXKOgMUgigedGCl1QRUio7iifBmXHkRrTgNT0PWQmeGsWTmfRit2+i
 l2dpB2lxha72cQ6MTEmL65HaoeANhtfO1se2R9dej57g+urO9V2v/UglZG1wsyaP/vOrgs+3
 3i3l5DA=
In-Reply-To: <DM4PR12MB61092C8804E50438DB36609B8C5E2@DM4PR12MB6109.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0145.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::38) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 7456d9c8-3c64-4200-e8c4-08dc39d13439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M8Jb0d6hTqCQGR33ttK0KOseu8/l/39mfl3sCN9EQ7F4vcjLaOlO78Uhllip91OYeYcSlL9sSpINnAsY30rl8zAV4N/+p3UMtF+Py9a/tlPkFMp03WMmtyHBNbEvc+/wAh1nUZ4LfVOTa0ZofjxbeMKAQZ0Pvk4mHxC70JBqaDmLo6gsmkmAr0ehY0V+W2kq4v2ac4O260Z6m+m8cv/BDmpiTl8SEQwa6npPNuhcC1mmBnojbVaGUw1z/mCVk5UkbV7DXPTpFnMJ/2M7oUdUzh7JSFKpM5hLl7wlzNxang6Qr93VE44AeJCsat/2cNHZamgnKxJLptzvcJVS4h3oI6AZsu6PXfLTxj2L3KuurlOdARxNhY1GjyUzVt4T0Gie2QMbQkFU91+2sOFpLUdjBeIgMRoYqXNGPlzSfq7WiTYUHfZ13+5+fiEFrUHsXZk32+Q3s8hXaQk1f4dgywyrXcLAIiH+jgGUKBCHBPgQCA350CkEWscCagR1lHuB6aeTw5+SFdUZXcGq7lz+i0dYHiaraprkfaW9iy3sBDqR+SaSwEiUCM/OW7SMl/HiZJOEuF6F8i2vQB+XFOMP6J7/InqwSz2vN19HHWc9QS9pntGu6Vc9LT/crcYHu97DyNMxAxgzx6SfvOEv4xEWk9nxjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VThxNlplL2lhN3I1NEVHNkdJSzFXeFVaVW5kR2NFSk4rTjNIZU5zQmsza0pn?=
 =?utf-8?B?dkU4U2E4bFhFazNNa2UyUG4wRkc0cVMxM1VFbCtQbHZneW13QkduTmQ0QzFs?=
 =?utf-8?B?RjZmWE81VG1UT0JrNWNpMzErQW5LOWMwU0VabEZDUDhGRmRWWnVZRi9rUWhP?=
 =?utf-8?B?L3hPZlBYY0hHT2xiYnJ1MmlSaTBxbHY3Q09udjZGbzRKY0t3TDRVK3hzT2Vz?=
 =?utf-8?B?NE5FbVFkblNxQUVhalEvQmxBeU0xdkx1V2NXU1RiUm1XVDNGN1d6U0g0amx5?=
 =?utf-8?B?THdXVlJaNFh0eGoxY3JxaXA4RWxjYTgzRmlZekhESDhWemJlcldnRWtEeVV3?=
 =?utf-8?B?OXJEa0Q4UWplQTZmRjg1RDc5eERvRkg0THlPaGQ5MDAwTkl0eURJYUU2ZjBF?=
 =?utf-8?B?eU9DS255SzJlYnpGTHNsYTBnK1BtZ1M5SUZQR0JCMDJJWEpST1hNaUVGSnJQ?=
 =?utf-8?B?eloveVRYak15VzdDNndvSzlucU9CNElLSW9tUUROL2ttSTlUR3FoRnBwbUFw?=
 =?utf-8?B?bjhZandDTDdrRFordm1GdmtneDFjY21lUmhUbTF0TjhHdUl6K0VmdmVjbGxZ?=
 =?utf-8?B?QzVzWVdBUlNJYVlIbXEvU3VGWHNzV0R6SDlkVlFGZmlIaW1UOG9LLzVnaXVa?=
 =?utf-8?B?NnFIL0F2eEVaY3RtVWVWWjJoTVBDQlFPYWNNK3MwZmZuaHZqaGpqY1hJbU1i?=
 =?utf-8?B?V3V2bVJYWThRc05kTWN1cG93NHJUTTROYUR2REpSdFJMZWROdEphU25qbVh2?=
 =?utf-8?B?VzJrSUNaU0Y2dlkzZ1E1OXFJUFM2RWtjdllOOFpKSldYNXB0M2QzZzdodVVZ?=
 =?utf-8?B?N2cwVzBxbFF3K0luNzVzcGFFNENpSEo2eW9BNmN0RmtQOTFENUVnTmQ0UWF1?=
 =?utf-8?B?SnJHVTdmM2xlNFZtSmRYOEdiaEIwL0M0UGpuWUhCWHZ2bWtNcmZ6US9FRjlo?=
 =?utf-8?B?QTJub3REUFY0MXRDYWM2U294cHZUWmxMdkRWcEpZWm9RaisrOTRaY05PeEZD?=
 =?utf-8?B?ZXpOc3EwWktSOXJIMFZScHRqTCtoR1JrdS9Wa2E3NDl2YlltQjZxN0tWRUl3?=
 =?utf-8?B?TXVUZERtVlVRREtiSW9YSGs1R1lXS1lMM01zeEJUNkhJdjg3WTNIUldqOE40?=
 =?utf-8?B?SWJvWnZoZXBGQTJDaTNTYUpVa2FDaUwzZEtrc0Y2WllDck9iRVd3RmJMbVVO?=
 =?utf-8?B?V3NKWXRSWGVqM3hvTnAyWmQ4MWJPWGFxb09KNUo3YnViUXdOekdWSkJSeE03?=
 =?utf-8?B?SEt3a1FJYk03SkQvb2NiZmowcU93SDhaUkFKRTY3VUs1WDhBYUNUbjZTRjhU?=
 =?utf-8?B?VFNJd0EzVkUwTWp4NEhWMmNVdlo4aVBqMDJtMHFKN2luUklkMHYrTUtkZkFi?=
 =?utf-8?B?RFpuZ29adEZSRkpKY2lzdnNyL1BzTW1rM1RPc3pQRzkxeXRYeFQ0MVZHT0Fv?=
 =?utf-8?B?N2d0Wi9HVVlTT3czQ0ZKU2o0eTg5WElCR2VIN1RFV2dPZmFES2hMVXEvN01t?=
 =?utf-8?B?TlVjWkRTZzNSUzBFbDlkQmwxQll2YjR1ZmRCbUhtcjVuMWpkMlJSTmFCZGtZ?=
 =?utf-8?B?OXpRcytnMGhzbVdqRzAvaWFieG0vRW16R1IzMXgwWDVybXNHVTkrWjlTS2tv?=
 =?utf-8?B?ZVFVb2V4N2RSeUxIa2VLVEIreXc0ZFlUNE9NWEI4RVdac0xjLzBjT2RSSC90?=
 =?utf-8?B?alY4RGIzN3hMMUNYOVpWMHY0S3h0MWF4YmU2YnNxaTlUdzZ5VWRESjVIejJ1?=
 =?utf-8?B?VlZuNFhuUFIxZWlaeWxRcU1KTVo5TGFnOVV3aDRVYVZqV2dVRFZPTkdTQzgy?=
 =?utf-8?B?U09IRm1Dd3llWTZ0UVpmSW9KaS9JVTVSQnJlSW9GNkZmSkpPU1ZwSUEzZHkw?=
 =?utf-8?B?aEp2alUrWmNqcUQwVThHMC9vc25iK05FSGtnMEFCdGx3UjFWVUE1Ri9Tc1Nw?=
 =?utf-8?B?QlBOT1RLVEFVSnFxNWdkaG5vaDZmbTVrQkxGaEpnTlVnNnRjK3lJbDJ5VVpq?=
 =?utf-8?B?ZU1MeStPYkkwZlZRczZFUWU0Zmg0dzRJTUlNVjdxVnFKaUh1NFhSMmRFK2JG?=
 =?utf-8?B?M29ndXNGM1lMQlluL3dCSCtlVTM1TzFSclIvazkxUE1JU1MzYkxCalJ3MDRL?=
 =?utf-8?Q?HSiHsElAHH8/sYQ2qJYaJ7AKm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7456d9c8-3c64-4200-e8c4-08dc39d13439
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 09:23:06.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5KVxZYdAL5f3SgQmcopmAK41liCu0roKw8FXInuVbSm80x3PAZ8tRG+v2Qwz6S6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407



On 3/1/24 10:19, Guntupalli, Manikanta wrote:
> 
>> -----Original Message-----
>> From: Robert Hancock <robert.hancock@calian.com>
>> Sent: Tuesday, November 21, 2023 11:41 PM
>> To: michal.simek@amd.com; ben-linux@fluff.org; andi.shyti@kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org; linux-i2c@vger.kernel.org; Robert
>> Hancock <robert.hancock@calian.com>
>> Subject: [PATCH v2 0/2] Xilinx I2C driver fixes
>>
>> A couple of fixes for the Xilinx I2C driver.
>>
>> Changed since v1:
>> -Fixed an issue in first patch where an additional message could still have
>> been written to the TX FIFO without waiting for it to empty.
>>
>> Robert Hancock (2):
>>    i2c: xiic: Wait for TX empty to avoid missed TX NAKs
>>    i2c: xiic: Try re-initialization on bus busy timeout
>>
>>   drivers/i2c/busses/i2c-xiic.c | 61 +++++++++++++++++++++--------------
>>   1 file changed, 36 insertions(+), 25 deletions(-)
>>
>> --
>> 2.42.0
>>
> Reviewed-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

