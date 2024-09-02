Return-Path: <linux-i2c+bounces-6001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C77B968C26
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 805241F22989
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518531AB6F3;
	Mon,  2 Sep 2024 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="P467yTVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD71AB6C9;
	Mon,  2 Sep 2024 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295125; cv=fail; b=R9LI06+VyWBdnUElbBkO1J5N3kDdBhg9RqsSWO/YQBvxprLIr8e8HBwTk1xj05D2zSJzPWXAG1Cd7ZT9Ylg5yP3E34d/e0Oq5RrdH4de9OBxN+SoeB+C2DxtBLp5ktcvCz3U5hnMoRcjOJBC1YCac1CaCr7QeKR69kS5+C0pC9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295125; c=relaxed/simple;
	bh=oHG4AUQbMG1cW/imUmKT9XfxJwcxA9F5+piDVuMsIas=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=eVeJK/XKkN0jg+c5vRTG1iSHFhIIWrrnTYL5Aq79+Tt4xmE+eet/0afvpMJp+82feB65eMAw2EOsqKeENYjA33iGf4zDPim49iQIBfdqgbkiweKT/TG+3xxJ+5QYanCZxgPxeLN+eUt9TLgLJmRz0IGCBwvXJzDXxBkOikSX7mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=P467yTVq; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnFIp23394uGXvfHILFMeZdRqo1gOGIHXRSeyX7h2NTXgLHHsswCoUlv4bHxA7sURSc24FU2vukDiPIHWzm8R8Mb0JEE50xfQs/M586JidIdWVx3xNF3kNju6YTJeJv1/WHVcV8FfrfZbs3f0bvJbQAbLEPEa7Z31CwsWiM55hheakOZCRrBf9fUAtPwcXQtQ2f3ewJyEyGZ7E1RmVWJrZkB5EB+7Dv20snk/BusEH9eTiyxLAZGgjChq32ueM0X3S9BHicI5zeD61eap7CNbj0G8BYo3lO9eReDEEcY1+hSMeXJOBIfn45eA7EkEPVnmGzfZewmNfAz+Ppo/cxtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H7UQS43EOJMdlH8hWG+Bx1gIBWeb3OH3k3uR9TDvjU=;
 b=sOPrZyTbA0JN5qKIiDrzPU0r3GB8dQyVa5ZMIhJkLwCWFrJcuHggslzUaTL5d/OoT9guGchHE9go+V+jUcESn7cdP0oAAx9cunv61t0FZO6zC5GkewCsY/fLoTB9CEf7BSGQgXdW+BfbbzEz9diT9uDC+GmLbHK49yT2f0hj+Jsgpyoyis27TkPC4Hm6PA2gxXB7abUXwHJCR7LZ+4wPPfbKXxCP3CKEC23+tEQ1+v7suBfzBv5MIl7Vfg1DITQ3UAxOWVq+wxsFs4OHNNujCOVivn0u1kzVYR1hF4yMvv1Q7+JDYeIzZIgkSkQx6TceOHElmYa4JpABxdV7NIvqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H7UQS43EOJMdlH8hWG+Bx1gIBWeb3OH3k3uR9TDvjU=;
 b=P467yTVq1hHWoIiNl5cMLI8lHXGxUQ6MfaWSMvyUQFfcs876F8Nz2rW0xKucd30GXdC4SqREbGN4BuwkEz8KY+4vpk+qpV9UaunG9m+5NXRp/UmdLfURy0yH9TjsmKXWdZ4ruRwMennhKtXwvTfA2yPf439+3xjq/TA2hb20Omc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:33 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:33 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v7 0/8] Add tsd,mule-i2c-mux support
Date: Mon, 02 Sep 2024 18:38:13 +0200
Message-Id: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXp1WYC/23OzWrDMAwH8FcpPs9FVvyR7NT3GD0ktrwYlnrYW
 Wgoefc63SClC7roL9BPurFMKVBm74cbSzSFHOKlBPN2YLZvL5/EgyuZIaCEUtzRxIefrzJHW5o
 rbwRU1hEYQMHK2nciH64P8uNcch/yGNP8uDCJdfqHof6PTYIDB6laWaPX3nensafYpTi0PM95p
 CEfbRzYCk+4YQr2MCxY2wjbKOm1cuZke0ppPjr6BaoN0ELsANX6Te1Qt1gTgHgF1AYYqHcAVQA
 jpNSu8tDV7hXQTwCqHUAXwDdeO9Np8B0+A8uy3AFU3+jowAEAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: f81d3c87-1ef8-48ee-d58c-08dccb6daf10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXU3Z2NxNnRrU3dMSjYwU1B5SkhVQmhzU3BDaitObmhhV0VKN3k5N3RIRndW?=
 =?utf-8?B?dzNyQWowZStlL0F2cGp1UTZHS29Vdklab2JYbkxDLzBFMVl5enFUTFJQVXhh?=
 =?utf-8?B?c3R2bDZQenlvNWtRZnI2V3Z4T0VnbG1EUE9qSmd2Rmo4TENDcHJsZ3NqcTN2?=
 =?utf-8?B?VFM5QXU4MU1sTXhMbklCMHd2b0tETkIyZnZDcitPNE5SMHFLS2V1UkM4OTU1?=
 =?utf-8?B?WHJlZkJvMVpNcFRpSitEZ2s5ZUUrK0FWN084ZG5tVXdBMVorZHh4b0FBMFRZ?=
 =?utf-8?B?YWllcVQ3VURWdTVadTdhc3lLMDNQd3RlSVZIT3lSek1lMEtUZkZUVUhqcmZV?=
 =?utf-8?B?eThaVnQwOTJmSFNUSUR2QW1ua0RYOVV3UHZrYUpiL09GcEwxZjRmaHQ4dnp5?=
 =?utf-8?B?SnNRN3NjREhjaGpVam5FalVPdHF6Y29kQUxzdzRURVVLem4xVk5CWWgzb29n?=
 =?utf-8?B?VlE5SktZbHVscEJtQ3pVMGw3UmxZM1JCUkFOanAvQnRiL3N2L2IyMVcyUkZ5?=
 =?utf-8?B?K1BNd0VBc1JpZUd4anM4YXd5dnNzNmNIMU91YWJmaE1VMHFtYlFubGJzWnYy?=
 =?utf-8?B?TDVkbHBhWCtqclhOS2pQODNOOXovQlJUWTJWNTF0M0M3eVc1c2grbmozM1pR?=
 =?utf-8?B?Qmt5dmV2RXNhbU1MUkVwRno4ZnNRQ3pvWXpoREdGOXlCOGdXUGU4U3J6VVRS?=
 =?utf-8?B?eW50ckx2ckVKcHVrUXhmNWtQVWhzSXQyajEvQjFZanprY2dtcjdIanBTTk1v?=
 =?utf-8?B?ZUpnOG9WSXdsNHZraldUUEw4WW5wdFdMeDNFcTZyTzZmSkl1VGsrUE0zVlRI?=
 =?utf-8?B?c1JUKzNITXNjQ3Z1aUd4RG9IcVFCS2dGTlNIUHc5SW8rT015Wm5KcmovWTc3?=
 =?utf-8?B?WXdrY3pIUE5sWXo2WWlOSkZ1VzdqK05QZHMyRVlnZGJVbG1CUFd0ZC9vdVBC?=
 =?utf-8?B?NWlXekdXeWRJSm5odnFXYWFkb1JkeFVUNGFhVE1xTkJBbjdSUnB6NnJrcGVy?=
 =?utf-8?B?OENDbXhSdDgwZFVsQnlPVjBwWWQvWXVCOXNKcENxSUFNQmZaa3pOZ1JlUG0y?=
 =?utf-8?B?UlI2TVB1WEhQSjhLZWpTVS8vaHN6SFBja3Y4ZTFEY0FScVBsYURXbnRtVmxS?=
 =?utf-8?B?Ni93V0lhbUEzbWhVTCtnYnlJcnNVRTZSNEVZRDFvSWlzeXNQMHVySE9pN1VX?=
 =?utf-8?B?K1BTekhTcHE5eCt1R2x6TWxrL2dDakl2UnAwK2VJWVRWOEdQR0c4SmRtVERX?=
 =?utf-8?B?amx6TVplOTR1bGRsUEhJSDJoNVVCTXZGOStqOEhJWUhPTi9aUEdRVkw3cWRw?=
 =?utf-8?B?NE1Wayt5YU1wM1dRZ040cG8wNjlpcGFrSHVndU4rUGFQTGNIN0hlY3c4VzZK?=
 =?utf-8?B?Vml0S0p5ZHIrVStZZ0VSMk1DMGxkSHF0MlBKcUs4ZnJMdmIvZnJSMWxFL2Vx?=
 =?utf-8?B?VmxPbExmbStpRVpVbUh1amxwdEE3OHJHSU1RazZRS0NTOHBuQlcyeWZDYjJi?=
 =?utf-8?B?dHVXWVdyM0xSY3B6NzI4NmIycHI2K3RpU1loOGI2c2w5M1EwSkxmd3h3ZTNi?=
 =?utf-8?B?dUtyVlJTL0pGMytJcVpHczU4bHBKbjJ4K1Ywcm56WlZkMjFOU0RlVm14aGRV?=
 =?utf-8?B?czNtRVcwNGg1K09hU2FIOGZta2NKK1Z0REZ0NElTNCs2dWYxLy9tZk5Kc2NT?=
 =?utf-8?B?QVR4N1BqZnloRlAyZ3J1Y2xJMzlkeSt2d1N0S2RsRHg3ZUZ4WTUraUF1QkhI?=
 =?utf-8?B?dmJGSFN6Vkl1K3RWK0lyY0JnSWsxV2ZwWDZGM2E1WFhSVTJTOVNnWDVWK2Ro?=
 =?utf-8?B?ZVZrS2RNdk5CNURBU2FUSzU4bmd1QVZ0dHlrZndxZkdLM09RNTlxQmJCeGV6?=
 =?utf-8?B?SHNHdXNGOEcxZWw0TlJiWmRkWEJYd2JOOUhuME5kUUk0NWU5NDVDdGN1S0FI?=
 =?utf-8?Q?hC9whDMqU40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEQ5TlU5TktTa2tnYURBUVlaWG9FK1ZBOXR6ZmVHTDdQdWFoaXg5dnc0MnE1?=
 =?utf-8?B?WjdGTDlnRzNzNDA5SXdySUp0TGVrZFRrWEZVS29ndzY5MTZndi9kbmEyTmVB?=
 =?utf-8?B?UXBDT09hTWt1Y2NZSmpvMnJzUEZBYUtDWGxtYU5IdDJRSmhLWUxwSjMyaXE3?=
 =?utf-8?B?ZnNwQjNvYktkcGhuaHJoWUpWclRMQXIrbWxpQkt3VEwwVGN2MUhVMmRXS2tF?=
 =?utf-8?B?d0htSStqM1E0NGtpczRNNy8wQTJsMi83TTZxenViS2h4MFBobjJ1VnpvSXp4?=
 =?utf-8?B?NDlyMENvU21rQTk0OGFiV2VOUnhYeWxxYnFkUkJMV3ZsWHBxZ0gwQlJQem1G?=
 =?utf-8?B?c2ZQY2syMGxZM3NBRS9KS1ZNZUQ4Vy92UDJSVWU5VnZBRDM5M29Cd0pKWW1S?=
 =?utf-8?B?V1lFZEdsblZvemJFa1pEZEwwTWRubFRqVnlLd1lIeXRYSnlZMHBqWnVITEFw?=
 =?utf-8?B?b2xBbEJRRi9vZmxTWHhHWTdYSWl4MzlhMnYyMVA5ZGdvamhkK3MwUWVmRFd5?=
 =?utf-8?B?ZXQvaVEyOU5pd0FqNktnZ0Nmell1d1BubXdCY1hIWWNwRm92alREZHdBNkQ5?=
 =?utf-8?B?OFJoQ3kyaHRzd2VsQUV5WGpoR1pzZnJCRlptTjVrTkYzL2NPcG9VbzhYeTdY?=
 =?utf-8?B?TTlQcDJQTVZiR0cvQW5XSERmbzA0NTFPOEJRSnFWWGNDOXUzaVhFUDlhak5m?=
 =?utf-8?B?Z0c2VkNzT25aSHBMYWZzRTNKNFFFeEJTb2ZMV09ZY2JMQkpWMlZhamJQL0ZP?=
 =?utf-8?B?aFlkajZ6OTNMN3lSTnM0elBNVE5tbzkraVdqWHhsUnVjNXlLUjBDdzZXNHEy?=
 =?utf-8?B?SHlQMVI0V0lNbjRJMG5LK3owcXZXRmR2KzdDR20yVmkyYjcwNXU4SWp6ejFZ?=
 =?utf-8?B?ci9udzBCM2g4M3J4NHkreS94TytsRHExRHpWY3R4aGVEK01vR1VnYlA2M0JB?=
 =?utf-8?B?S0kyMlZkT1F2UU5wME1nOFhGVTFKSU9HS3ZRQUlDcHI5eWpLUVF6eE5jWmxG?=
 =?utf-8?B?bjU5dzhFMEhJVHFFZUpKdG8rVlZ6TjV6SnRkN3YvRXZSM3VQZ2NZL0JyN3Ay?=
 =?utf-8?B?QThuaVJ0REdWMHhjWXlQR011R3FsV1dDNHhPeUpPR3FLWnlhMmhLeDFIZUR0?=
 =?utf-8?B?djRPYktjMHhiOUpCZGRGU3crejU1S0VhcFViR0xPL2w0Y0RmMFFuRXdva0o2?=
 =?utf-8?B?bHBzck91dkNaWHBPQXBjeXR6TzFoYUVkZG5JTHdKbnE2SFI4QndUNmdnTWE4?=
 =?utf-8?B?Qlg0SEVPeVlsWU44dE15RWVKbE9aYmNOZmFCMmhqMyszM0NjcDdWYzZUZjdK?=
 =?utf-8?B?TGpwTkZ6cjdNU0NVRlJGaEVaa0dRalZsbDhwamkyVHNJVXNIME1vemNvL2F4?=
 =?utf-8?B?cHJYWWxRcENJbFhRVFJaR3RoZExCdDlNQS9uMWZDa2k4b1pKV1VhT29CbWlK?=
 =?utf-8?B?dlJTRWYvVDBVVVhBbFI0Vmc4VkRYT3lVOCtKMHJQWC92TU1OQXIrUUtjMjhh?=
 =?utf-8?B?UXFvYUt5Zkw1YzdIQXhjYUo2a2x1NjluZkNMOGNTRDJVS2g2ZWZKcndzZzJW?=
 =?utf-8?B?eXhHVjJvb09iTldtbVI1eEVIeGNRd0tpTG9yUWZsT09vcmlxK0QxMUs3MzRK?=
 =?utf-8?B?dGxBMm5tVlZURVhtOWk0VnE4cFZnbFNWbXFOc0kwdG52clB6REJSUTZUK2JI?=
 =?utf-8?B?ZCsvV2FLYXVXRTZVZWFjNXNJRGZlN3ZOcmVQTHhMMlV3a1lDSkppbmhKdVZ5?=
 =?utf-8?B?bjRiSE5BYmJkQVdNbTdKeTdIMFZ4Z2s3bzZQMVlFVldJdlA5VGRrWWp4ckZh?=
 =?utf-8?B?Y05Hb2p3UlFCa25xQjh4dzZEZXJVTUN0VG1tT210L0t3MGZib2IyS1ZOMFZF?=
 =?utf-8?B?KzZhcEpwRnZUQWltNFB0cHhFSWxITHk0OGU5c0FlZ1dKeXJWeEdEcnJJM3lj?=
 =?utf-8?B?ZFNhejhpSFhnM0xVSEY3SlNHSUYvcjdqdXk3Q3ptc2dKTDNaMUhyVUZEWjhq?=
 =?utf-8?B?Q0hxYVoyak5oQUNBWVVQZ1ovKytJdkg0NlNlWjJtYSs3aVVDQmV2Z1dXSkQy?=
 =?utf-8?B?V1BYR0V1cVRNTjVEcURIZ2J5ZzVFRG9NNHNtc2llSWVrTUcwVUxrV1FreWFi?=
 =?utf-8?B?R0FYbGRsZHBXdHhvWjVhNEE5SlZ5cWw3VTlMLzRJQ3RWVWUrblNiZmpFYXZF?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f81d3c87-1ef8-48ee-d58c-08dccb6daf10
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:32.9711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gn01CqX44zyi0aZm2e+LWQZiuclyPkiOMajqdQ1M6b3cHlTvoDNf9LUfdmz6JIaKxLIfqUzbd8hFMiskzZ0WdCrc9J7FYsSAjNH4V1FMZAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Theobroma Systems Mule is an MCU that emulates a set of I2C devices which
are reachable through an I2C-mux.

The devices on the mux can be selected by writing the appropriate
device number to an I2C config register (0xff) that is not used by
amc6821 logic. This required us to add a new compatible to the amc6821
driver, from which, the new platform device "tsd,mule-i2c-mux" is probed.

The selected device on the mux can be accessed for reading and writing
at I2C address 0x6f.

      +--------+----------------+------------------------------+
      |  Mule                                                  |
 0x18 |        +------------------+                            |
--------+----->|    amc6821       |                            |
      | |      +------------------+                            |
      | +----->| tsd,mule-i2c-mux |---+                        |
      |        +------------------+   |                        |
      |                               V__          +---------+ |
      |                              |   \-------->| isl1208 | |
      |                              |   |         +---------+ |
 0x6f |                              | M |-------->| dev #1  | |
------------------------------------>| U |         +---------+ |
      |                              | X |-------->| dev #2  | |
      |                              |   |         +---------+ |
      |                              |   /-------->| dev #3  | |
      |                              |__/          +---------+ |
      +--------------------------------------------------------+

This patch-series adds support for the tsd,mule-i2c multiplexer
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

Please merge patch 1 before patch 3
Please merge patches 2, 3 and 4 (and 1) before patches 5, 6, 7, 8

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v7:
- Merged __mux_select and mux_select functions in patch 2
- Removed unnecessary prints after mux_alloc and add_adapter calls in patch 2
- Added Guenter's Reviewed-by tag
- Added Rob's Reviewed-by tag
- Added Wolfram's Reviewed/Acked-by tags
- Link to v6: https://lore.kernel.org/r/20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de

Changes in v6:
- Move ti,amc6821 from trivial-devices into its own dt-bindings
- Use same regmap config structure for both tsd,mule and ti,amc6821
- Remove max_register from regmap config structure for amc6821

- Link to v5: https://lore.kernel.org/r/20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de

Changes in v5:
- Drop the mfd implementation of v4
- Add more dev_probe_err callbacks to tsd,mule-i2c-mux
- Instantiate tsd,mule-i2c-mux as a platform device from amc6821 driver
- add "Theobroma Systems" when describing mule.

- Link to v4: https://lore.kernel.org/lkml/20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de/

Changes in v4:
- Drop the previously added i2c adapter quirks
- Add platform driver probe to amc6821.
- Change mule-i2c-mux driver to a platform driver
- Add dev_probe_err in mule-i2c-mux driver
- Add support for tsd,mule in simple-mfd-i2c
- Add tsd,mule mfd to supported dts

- Link to v3: https://lore.kernel.org/r/20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de

Changes in v3:
- Change "i2c" in comments/commit-logs to "I2C"
- Fix long line-length
- Warn when "share_addr_with_children" is set and the Mux is not an I2C device
- Fix/stop propagating "I2C_AQ_SKIP_ADDR_CHECK" flag if "share_addr_with_children"
  is not set.
- Fix "old_fw" variable is used to indicate the reversed meaning.

- Link to v2: https://lore.kernel.org/r/20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de

Changes in v2:
- Add i2c-adapter quirks to skip checking for conflict between the mux core
  and a child device address.
- Rename dt-binding to "tsd,mule-i2c-mux.yaml"
- Add Mule description to kconfig
- Fix indentation
- Move device table after probe

- Link to v1: https://lore.kernel.org/r/20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com

---
Farouk Bouabid (8):
      dt-bindings: i2c: add support for tsd,mule-i2c-mux
      i2c: muxes: add support for tsd,mule-i2c multiplexer
      dt-bindings: hwmon: add support for ti,amc6821
      hwmon: (amc6821) add support for tsd,mule
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-jaguar
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3399-puma
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-tiger
      arm64: dts: rockchip: add tsd,mule-i2c-mux on px30-ringneck

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |  86 ++++++++++++
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  69 ++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |   2 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  25 +++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  23 +++-
 drivers/hwmon/amc6821.c                            |  12 +-
 drivers/i2c/muxes/Kconfig                          |  16 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 148 +++++++++++++++++++++
 11 files changed, 404 insertions(+), 26 deletions(-)
---
base-commit: 67784a74e258a467225f0e68335df77acd67b7ab
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


