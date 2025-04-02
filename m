Return-Path: <linux-i2c+bounces-10083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AFA786CA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Apr 2025 05:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8598E7A3BAA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Apr 2025 03:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D83206F0D;
	Wed,  2 Apr 2025 03:25:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188E2E3365;
	Wed,  2 Apr 2025 03:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743564358; cv=fail; b=juO9ga8bO4lukPyh2/fA9MeaYl+/WwnXR7C4IM6p4GLx4s9dWGpCkpw1AFh1Yr9YW/Y3RdciSL2bqJmbuWhgc4gKgxhN3a8xEFn+/VrmzThTSU4o7lS+gI00AqP4iVqGgOgRIfBogQ+cz5CZ0khxS54TG7RPk3TDf7ZqDhjizdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743564358; c=relaxed/simple;
	bh=K/VKGjraczIO7h1w3uR2WoqI2k0QBLzkQZ0J12+DDpE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Lwj5e0b9H1ft7IyyntnjP4MZT0/E8K4b/yw4GGo8ZNYGyiu+3wjPL5Uap74fF3ZOzGq37vwjZn0EYPWLEjhvv/sG85t35ODo+qrLn6YtsUoFcibBKqrT/0L34nkqUsxyMCWNm3r8O2UM4/ZxlAd1Ay1IFZaIiiv+gahNLQQ6alc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5321cSUC012324;
	Wed, 2 Apr 2025 03:25:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtd4r64q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 03:25:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsn+dP8dRGspXbl5DYTZUII4a8iyh+s0Lmc135jED7h1C1NULkBaW7YOEv6mzoAMFnsDljAxw0B+5gAl1hLQuU16FuG+N2QwgsWxB9h2erkKivJd0zlmiuJle/dLurX4uT3hBDZzLUg6pu7JC/5QkcodrPi6K68+R4asL4WRFO/vtXzJQKeFhouNv3xq6YgkRKKNNCWNR6aSPQC3gTu0F7d5blflcgjP1cUXYTs43c492IKyla2mjpNQ7SBwir7ZBZZ1BvQSk2Znjuw6GGh3hZMilAe+NyAXlbJjJkY4tPeMhnhLopbIFxPBuDkV8SVHuo154+K9lDYhXSnLPqTamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1U1Qodi9IuyRqdYSmxg2xlpFyX3qOe9B50sjvAae20=;
 b=TBxGGgBLTzA0/yFt4xADgxeIGMkenTICHDpo/IaWwC/UgkgWav71m1n2TKAyxZ/kXurnlYrWIyAmNNCdK8qpviED73JOeW4ti5Ia2kXZs3WG6Uqu/1Rit6Ta7WjsDqW98XpG/t0BEnW8RD+x5u26hX3OhYT6AkdFv4+WhBb/68k9OJacrFyajq9vbKYeMXdrJ7ldzAfPwaAQjPvKIf1CZBs0JJgvKk6A9rThBVkTA9tkiJPuctvlSGhZqhbnPYoZZyc+udGNuUvrjRHyp3XoT45phIeeKDI/OR4sAQcI/rcTp3b8fvLpgyNj2unfwvNOFFjK8ldGQJyubGiljq0eqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7)
 by PH7PR11MB7987.namprd11.prod.outlook.com (2603:10b6:510:242::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 03:25:41 +0000
Received: from IA1PR11MB7174.namprd11.prod.outlook.com
 ([fe80::562e:b570:2775:f6d4]) by IA1PR11MB7174.namprd11.prod.outlook.com
 ([fe80::562e:b570:2775:f6d4%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 03:25:41 +0000
From: Feng Liu <Feng.Liu3@windriver.com>
To: wsa@kernel.org, haokexin@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5.10.y] i2c: dev: check return value when calling dev_set_name()
Date: Wed,  2 Apr 2025 11:25:29 +0800
Message-Id: <20250402032529.642172-1-Feng.Liu3@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To IA1PR11MB7174.namprd11.prod.outlook.com
 (2603:10b6:208:41a::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7174:EE_|PH7PR11MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: d24858ca-cea9-4885-03f2-08dd71960b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xpSURqMc6XJ6X7R0Eb5LwxFaMzmwx4nLMkqkit6KyXjXRdWTQZptk0RU8XT9?=
 =?us-ascii?Q?GMXNvT0xYwpO3vmFM3oJ551zcS319q/EqTfQ5FfgcQTnz8w6eLloGjSCq0Ka?=
 =?us-ascii?Q?BabF7RGj+h2iz2nda0UDsqkwqCnthwDOcKylrUxHZ0kcY1r1J28Pg4LZ9+UV?=
 =?us-ascii?Q?icSHEO/Jofok0vlqZiG6Z9bhsbdczSO/w3clQjoajTiyl4WJ5UKeGgCNE2C4?=
 =?us-ascii?Q?7faEs7X3PTLECP0BB4e4m56DBdmKRVkJ30SHmO0E2a8sBiSDkwR3qgRDHIwA?=
 =?us-ascii?Q?0+bD2matuIuo1BXiE4qYt5RvVwrjL/2XRxmvx6kRqLNfXQZ0pWKRdvZTLPzg?=
 =?us-ascii?Q?dwNiXAJj4nvZXuSjLRsm5Iyn4Hln4W0qA3TGALMO8J4xtUQECsK1MzUqEA9X?=
 =?us-ascii?Q?eDd2PWKPeottxZB7lo1MLdVZEGlIm6y3RCMCN80TFiD4yEv9701N6Z1aKmWJ?=
 =?us-ascii?Q?Vt/6gpOe7Vrt7RFuY8asRAYla7Y/CILW4M1JwS5zl6KDpHFldSWv1ZZNoCz2?=
 =?us-ascii?Q?sBp2xe7NNneUBA5+zNYccftjIw/UqOrf4l4zbTLIhZRdAe6671DjEGkaTHIM?=
 =?us-ascii?Q?duoz5SbBpB0hCPVGAUkp30dNS/AX1hvmZ4my+aVqWDJXTlvMj+mNWu6kDqLv?=
 =?us-ascii?Q?QjLIJ9ezoxROarbBGlakwaoO/5CFnWQDEWCkQqpFzKnt9IuIXu3h5O34eqDq?=
 =?us-ascii?Q?VmM/JiHOHMImNd3CUNGNYtAp85XOLBbFTsOMSHwRiOhwIzCRZxNkf2AMTN8H?=
 =?us-ascii?Q?kzIJBy6hcBr5+1y6bzy9NgyzPEwfsKHNpq+mo+f7hKGUjjI///qI9nO4IqVE?=
 =?us-ascii?Q?hHcrb94DRq2LRSJCqQ//SU7Ofw/fUFgO2vdsgJm2V0mKyjrZ8rf3J4KwY6wl?=
 =?us-ascii?Q?Jr5Ndee5t22hUlZTGDPO1bAiDPn9y0A8upS5TQ52i9wxtlCRiXlVxwVgsFYl?=
 =?us-ascii?Q?lLTjq1PtZQG8tNaa2snPkiK+LkwEdLusNGTBL1aMN7lblhX9DzIvw4lIJQgU?=
 =?us-ascii?Q?khm36mwfbgqJIvu7VtPjqL4BA/DI+9STE/mrwNENugM24i03DiRIEWnuupx6?=
 =?us-ascii?Q?p6rkAfVOqALmp+XS/aM0Xpeu1c4RMRelG4wlnA0KMl7P+Pe6RcuO/VU3DVhd?=
 =?us-ascii?Q?GLFstAaWymjovQvCYdKqcQBj+dKs02EM4OzIAptIlp75ASrNo9or98gg/OpA?=
 =?us-ascii?Q?UMGSVmgYlL8TE20nL2OOUb2xr3rc0UWBqfTwq2LTUZ3TNRO9lbUTM1uT5AYz?=
 =?us-ascii?Q?imRV5CFC3Ul2WZ0XeHBgdruUZVPpRS+lXiQtMAZnoug3L1ImWWUWcY0DvHF4?=
 =?us-ascii?Q?bOnY6VmKS37YciYKoiAjLhmnzz50zTC/CSfG/5REnQUEc/Av4ZI92jrPTsvv?=
 =?us-ascii?Q?33Mm0No+T7fwM6ExmQyEeCctgm5Fwrm0P2yd7rP04XYFG2pTCKxyRRIBpIaH?=
 =?us-ascii?Q?IUCQgk+j0Dp4m+/5adcNeas7qK/+ggxM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7174.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tlAYP8VP9l5r/74q2wnczHhZ3G4svDmDs+7A/j+JaAOfUsQkoh9BKzz8Ylfo?=
 =?us-ascii?Q?u7tTxPKCvjG+d1cmM2BrjqNNEqRyc5YtbKgKTmXrhH0AOlZqICx8DB+KwhvW?=
 =?us-ascii?Q?JbYXaCbm582ce9k5BQFMH5JAr8or9yehlMpprbeWuwKreWsHz5tboEle581i?=
 =?us-ascii?Q?HNIBge3OsKTtuPiQRfow6Y876GGayMLf8zWga8G7HRTOp+RLBDD7hMZTCaLp?=
 =?us-ascii?Q?+vXIxqMAFJLDTuChfTFWYkcn7LSfyE3IbtmhW3Sc8UjQv8ISU7fEzZV8ubqx?=
 =?us-ascii?Q?aHD4Jpp34dnfa/XJUsEjc+TBzGgu+uNumUcr952qa08WMuDNiVzTsd+iKER0?=
 =?us-ascii?Q?17nFVG1nrezBm9qvtzhCQsCKglZ1/Gpn8lnucYoA6RhkFfNPopAlSsnuTMRD?=
 =?us-ascii?Q?RAsk5jEhFGKBpVZ3oyPFG3R72Xmd5ZsC0s2lge1O2sqlWKhtRLyzQm0pw9GJ?=
 =?us-ascii?Q?iKWp2Vn7ZHiQJj0mPOU9tvYvbzR+1sjsN9M52kZgVKuY9OXBzLQBVyMz8TOy?=
 =?us-ascii?Q?+U/8zGW/FJKnsq1d8kEwkL4o8ppczy3bUqwkIWavnrmT+60x6ajXeJAXM4F5?=
 =?us-ascii?Q?R0pUl4w/5rFzMyh2bGWpGzT1BLnFdq0Uuwnp2R+ltQBmcMwo7qX6bpfg2+0U?=
 =?us-ascii?Q?hc9xJxIUlr7AoVJdrB+QEXDbG/SSifj51Jo6tkMcyTYoK54b1Sp4R3xUQvQh?=
 =?us-ascii?Q?YbMj7KUdinxrFwoM5lPAK7nPm7yVhWqYu8RLnDOQw99PuhKVIVOgzwgN5usS?=
 =?us-ascii?Q?8X3XPjJXiVQGn49jnF9jvtS7ydDSSdhjD+OeWsoZ2XMfvdSG1fFF+bNlugP6?=
 =?us-ascii?Q?wni4ZneSqTKnAHqrwIDeCqF2YTJH85L5FtgqWWwHDPwkzQs8YND2tmASjO1L?=
 =?us-ascii?Q?XVOYH8z0bS/u9q1QCo8YyEy5XBPEJ5oCQ1NYxLRRgm6rijHFNu8NpNLX6igk?=
 =?us-ascii?Q?KyEf8Uml1pCQwBW1znKmQAvXQL4gRsD0PU+hTlqIfrTpxPQYTvENCbP0WnMv?=
 =?us-ascii?Q?MJ+8vWpWDLsDavu7WxEsExrx4mlzvG9p59Fbme9yUK5d80iqfXJVYJJ6UtQ1?=
 =?us-ascii?Q?EsnZfF37c9tNSm4HTiNUOaV1iTjTQnXDZ+PKmNqbFljtQWyqVUYvvJGp4Joh?=
 =?us-ascii?Q?PVbaOU/98/qWGm3HhoJepmXBFU6uYLzcmKssMa1UU9aUfcVQqRsjBUJLB6qF?=
 =?us-ascii?Q?EKlcOjJI3Wq/gnjsiTMCz5iFKrjz4jYVgxVuoAyffwlj6deAWcuyVXeQpJPC?=
 =?us-ascii?Q?ZiaMhOKPm9YMCLrLgvrz5RQUiG4JJLUnTpGnoiH0SrqjCbKYqDqQYGC93Mhe?=
 =?us-ascii?Q?K4mPAUM9hqGvC+0/6AfzvgPVo0659u7umH/ZyEtOENbOV86USJxez59/bEYa?=
 =?us-ascii?Q?Rz6hLVtrC/WSnOrLE/7slmDx9rNLpLGmtTysclsYzb/7faiLcZtoIbKKvG4F?=
 =?us-ascii?Q?65NwlcgRIIMtP1l0UQ3bebOHcL4K0Y0iWWgNswx/3+6U75vs5HswcaZ+iYpy?=
 =?us-ascii?Q?Pd0H+wPjQx6AuCRW9Y9je6f8L6NzV92z7ATPV83r2IBIAm8GPjTFKonaasQJ?=
 =?us-ascii?Q?dRKWihqdijRLohzjEocdcK2Wdl83bJrAeJTHtlg/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24858ca-cea9-4885-03f2-08dd71960b6f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7174.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 03:25:40.9585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whKnLYf2XixwFNBLsJ5ndKtxRKOd4T/gTwZR8qXKFj9Ts8pT5Aj4fsnbyUG3FFtftdcml+r873qfQunf9XeyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
X-Proofpoint-GUID: s8eEslpk4T1SCOyWDvV6yv19AQu4MEiP
X-Proofpoint-ORIG-GUID: s8eEslpk4T1SCOyWDvV6yv19AQu4MEiP
X-Authority-Analysis: v=2.4 cv=famty1QF c=1 sm=1 tr=0 ts=67ecae39 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=H5OGdu5hBBwA:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=ZrR-pmgSSjD3dgL6ZSwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020020

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 993eb48fa199b5f476df8204e652eff63dd19361 ]

If dev_set_name() fails, the dev_name() is null, check the return
value of dev_set_name() to avoid the null-ptr-deref.

Fixes: 1413ef638aba ("i2c: dev: Fix the race between the release of i2c_dev and cdev")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Feng Liu <Feng.Liu3@windriver.com>
Signed-off-by: He Zhe <Zhe.He@windriver.com>

---
Verified the build test.
---
 drivers/i2c/i2c-dev.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index dafad891998e..f0bd4ae19df6 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -669,17 +669,22 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 	i2c_dev->dev.class = i2c_dev_class;
 	i2c_dev->dev.parent = &adap->dev;
 	i2c_dev->dev.release = i2cdev_dev_release;
-	dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+
+	res = dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+	if (res)
+		goto err_put_i2c_dev;
 
 	res = cdev_device_add(&i2c_dev->cdev, &i2c_dev->dev);
-	if (res) {
-		put_i2c_dev(i2c_dev, false);
-		return res;
-	}
+	if (res)
+		goto err_put_i2c_dev;
 
 	pr_debug("i2c-dev: adapter [%s] registered as minor %d\n",
 		 adap->name, adap->nr);
 	return 0;
+
+err_put_i2c_dev:
+	put_i2c_dev(i2c_dev, false);
+	return res;
 }
 
 static int i2cdev_detach_adapter(struct device *dev, void *dummy)
-- 
2.34.1


