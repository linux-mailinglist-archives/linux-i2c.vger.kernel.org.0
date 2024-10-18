Return-Path: <linux-i2c+bounces-7473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F19A3AC3
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 12:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 662AA1F28675
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 10:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB0E200CBE;
	Fri, 18 Oct 2024 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="P7EWnkS4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1617D378;
	Fri, 18 Oct 2024 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245829; cv=fail; b=hxxzhvBXz45ObE52shdD8QtMrK9qfshe+pvlUroHz0qUpuXc22W/+NrxwHqHzSdD0cHPuC5X1y/AlhkpJRAcR5jkVN0mC80mpaBNIKgqcij7uDahTObVnt3nDPxHGyAOW9/W4SOB3aFkaETqa2G8Fv/0w3d2b2NY4NMJH+0LqJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245829; c=relaxed/simple;
	bh=AIgDVPNN1TWygpYp/hjsRHGhvTmHyzxUQZyrPaX8eY0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CrK/M00C//i10XANCKssMJ4hZCu0GEYEUum/EcwOrqNOOjKwlWt7/78J9J/2NeQSw79JWzVRhgjdl8rO1OsxDhjH1WVRRCzZXCDVq8YV4GgBn1wZsugRNwjt9yqwC7cxiUr4u7B8fDFljz++1dKuJQPy0CpFLGCfEEHI7dpOcRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=P7EWnkS4; arc=fail smtp.client-ip=40.107.21.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwxReu+L7G60e1YsE5hT1lHCA10ahgwvRJ0W82gZXNZfp5xrxDBgxPkBsiz6DCVICj/xVLqFpzB6bCz8ByKn53YfPpm1Nr2FWOUvKIwYyoCwoA6ZUlFVDBma1K49heSdkg5GMiBOIMR6wCqX/qXZKlfbV81r+64SQHNriPkN/6L+QzkzaF0Obbv1QgV5EZ7h4hk+GfC2Nj2EwiSq8DAZsEHq0LH1dOBiRPqbBXN9l4Fr7rVzzgplp5lFwDHD+JcAlgO76Nk7m7rwiVI/mvU+YXcpKvCMQkz+lPxB8MQhm0mvvFW1bwOmX/nMqcQZ+i0qfnP/r80Z2p4ugHevYJ4W2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT0fdPp4j4sJown4QxGfJxeFnAEt5W9tCKUT6K0eLwk=;
 b=RfIz1k7Z3tC2bDMafFRfyaK2Hk0K7oBTEBDWdTO7x7kptiTbnHhNRkntC6K4nAyhQO5e+RJ95OMAig5G7SZEdhYDklpCsJzr/XyKfr5ydtv51qnNxr78eE3998oJ9YIw120C4I5GEo9wBDTkDW3+sCgBe9l4NvwKrocXb72w10qFXs8duHwMaW8eDnQb8Myp6E0DfkszwQyoqtjYL0NhND6L+RHwItmofkke3t82zsLLyVXzfV+IdMwV2QTyDNmlpWG6l1gtsyjJCE8BReJ9CbslD47CKQYnVKLkxo1dWkf9oAuQkjiwGtuAJ7J5OoSYFkRwFzJZR4u8hna3VxjEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT0fdPp4j4sJown4QxGfJxeFnAEt5W9tCKUT6K0eLwk=;
 b=P7EWnkS4exKUqP1QhjYCquJLVgKmZ8yISa0Z8CHmgpljG/kSNKNK1yTi6E1FeRYSyfYYmZ6N6vZxhxqqsYTezEr4kfTb/Zn5AcQBv3S1EUvgXlNTXF3hZLo1u55V2qnoUv2LqqcYpLDoRF3Af9PJ/8nY+WycCOltOWEue9fnFKl/0rAya3mbjyKIMBDQzFdiBr+Tcc+AQjYUKcevXjLKRLclmCf1UW0KXfXNOsa35cxAxgB/d0B02LACmjXc/2I4WyKAiyYEwYn5WIq7wDgSDSW8/AVxkVdqeArxHSQuKSY6AsDTatoPb0uLBiVqhC+hvu63v6wD5c3UMr5kamuI4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 AS8PR07MB9211.eurprd07.prod.outlook.com (2603:10a6:20b:5ed::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17; Fri, 18 Oct 2024 10:03:44 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 10:03:44 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andi.shyti@kernel.org,
	peda@axentia.se,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v5 0/2] pca954x: Add DT bindings and driver changes for reset after timeout
Date: Fri, 18 Oct 2024 12:03:36 +0200
Message-Id: <20241018100338.19420-1-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To DB6PR07MB3509.eurprd07.prod.outlook.com
 (2603:10a6:6:21::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR07MB3509:EE_|AS8PR07MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca79d27-a5d0-4960-7ab2-08dcef5c2686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e8X4yW48dPX3czgCO89cgjz9Vm3dsZyDJaN1dSwwQ3N3RYHNyr6xaDy0vuKw?=
 =?us-ascii?Q?GAmF/5n6D91WCViVTRA25mXwHtTi6uSfrpzgraCl7/ZX3FU11Tv8aU/CzOO/?=
 =?us-ascii?Q?6LHX72s4ubF2g2QNODfRKRLyY82sXr3Cpmxkzd1korYw/uK5nhBIWYB7TPg2?=
 =?us-ascii?Q?URUTWGrz/HP72i+JAC/iK0ne5CtgtNQj7/xHCRnRSjXRWHb9753bSX1B1mL6?=
 =?us-ascii?Q?M8iOuX3v8Mvsta6pA7ZZmyaAcgIgIKHpFl4ByAh2o/gFLANXeFHSI137ec5h?=
 =?us-ascii?Q?P6WY52VCiroj/WltGerjvbep1iDI3xEeEvJ01+7wog78j758AFKywbqA/aQZ?=
 =?us-ascii?Q?X9uHuPTA+kMrhnshqWdcFqluE2W1OaiGXorNgpis7fdtkX3elFkCGPqueGyg?=
 =?us-ascii?Q?9kuB85bKJ8j3/9ujREbYOBgdhlo/Gt2E+vA3Fkg+Gd85HzSQ4XlNKpfICGE5?=
 =?us-ascii?Q?lqelGHFP2p4Jlq43AbKaGwHRRjQXeqbIAXZx+k2x6rjCTXnzFEBa/rNhn0kk?=
 =?us-ascii?Q?swCkKENhlk7IwMku7BOyiaWmdwekHhR6Ws72/ej3aAjkcD0vXvJPAg4/hXGw?=
 =?us-ascii?Q?sd3pu0OwWICPcMu/Au9Pxz1qHkSr7cXhLWBU+C4M5Fu9YybwG2Ql6ILeZG+M?=
 =?us-ascii?Q?Cx4J+wNkUG0i1b5pEHUfOhctBi874Sa9DlfniQqMWOBSSS0fQbLLjPS4PsnO?=
 =?us-ascii?Q?0xsxvqV0ehXBLPlfuKnn7N0g4CdvQMrsAw1rkyaZvfanLWHF1VxCQUHHcL6r?=
 =?us-ascii?Q?+N5C+UzVoK3se90rCsogY8jqh77DKbel9ecdToL7C4/SXKki2Ung6Tz/G46Y?=
 =?us-ascii?Q?2rRkl3AcZJMoK8XPy2Lb2s/WB7WpaOaPj6gnCUy49CleG9kEe4+VBZXfAEkG?=
 =?us-ascii?Q?XTsp6Qtf3ranTHBYiegQE4de6YRIhqQINESIcAlZrR2aRNYpuwBnEdwT6y5i?=
 =?us-ascii?Q?BZCM01wG37Tozn3bqYIU42eYAtk6NJ9qf8Tibuk+9n513XCdFFtgl9yN3RsN?=
 =?us-ascii?Q?081o/8VecKLJUNYTutDIhmjHAhSdEot6MimOzDd6T1Hb+RLyaBfWhYK9RbNW?=
 =?us-ascii?Q?e5rOdGa0XKl/4kGkZZGyQ3xdIF5AxJNOPehIzyWqPefLBQ3SrbvIW8uDH7eG?=
 =?us-ascii?Q?bx2xyJ42AnPKhW8j0zxu+6eVaKtxHMm+3Rw/6UFP0D59TcB2dYC5wrxdMbY1?=
 =?us-ascii?Q?+fRuetK/e+c1aAO0ia74IvRYibehT2jkYPoVOA80cH8DYb8D8qjDu9BeJDkL?=
 =?us-ascii?Q?DfiXvKjONZqe7ghpQb4FL128iMcmhxi1OPjpkSNXijRVx5PRDznVCG6ct4wm?=
 =?us-ascii?Q?HwQCbnsOithGzSWL5oXVU54O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UdeduPGZwuLgIC6WVar4NkiNZCy4UN6Xqtf8PdcySHu6iXSarRHp9Oabn2kK?=
 =?us-ascii?Q?vmBqHh/2C/FspsE++7J92cFtuP/XoWVteWKyXKEAyloRw4wlGQYcnnsJrIET?=
 =?us-ascii?Q?Mh8cIeqz9QCT1dDF4x5ovNfiEvXsNRHhYk+huyuffO1kpS+HgRnJQsYg3Dv8?=
 =?us-ascii?Q?cdarjJEx68nj3t8JxMBEkH3ZeZQqcJDIneka/7uqd5KNst+mVSqpEOGTDBgh?=
 =?us-ascii?Q?oUy1LOP3vaKjdYNOawYxdeGVP63IYHbBPbktjNSJJVFKnKQ9UsmXrTLeQO8a?=
 =?us-ascii?Q?6Glwhd+3zVKKHD+B9HgfEAkb0DDaR4KIUNu960qq1U4YXNRWhcEYcwPMUDxb?=
 =?us-ascii?Q?GelI+Jh5oAH440lq2HkmQ/Z6vC6V62ZBOVupaa18MWP7vKx7LcqYYYleo+F2?=
 =?us-ascii?Q?+iGaeWeE+moNnoTHnKQQkmQ6c8lXCKZ4dvyUdY2sw/fu+EOgbfyHAtJb3AY5?=
 =?us-ascii?Q?37kF+PU3zJwfGwH+1bacKDTwb2RmLYiqViD2av9TZfn+qrwmxBldPc1czXBS?=
 =?us-ascii?Q?YA8OSW2VLnjOEbtNt4J0vQfwTt1Ks0zkIG0gQ+Eff2HcB5zXlDJrxHOXtIGr?=
 =?us-ascii?Q?Z4A5spli2Y2kDtvQHyMNWtTdJPJLMTOnk1aPNWbf3gi0csk2qNoX1TiF+2+r?=
 =?us-ascii?Q?6ZOO0mxpmodbNuRhVNsniBRtWK+lWxtWR4/DtDLCC6bD3ep8XvlMFYOu2Te/?=
 =?us-ascii?Q?26AAe519ZMXMR5bMT407kCU/rdFXTFbMZd5l1Y5/TQELAHVpuRU4CgXAelAB?=
 =?us-ascii?Q?8XBJ6vT/JwYNaSYMrqK5b3Sx1cH1V4B9Zs1eSz6LuNmHdJPcfuTOdIamGPuX?=
 =?us-ascii?Q?f1RdvfaY1ztzXsh3gGMSlE9JEk4svdEmUOA6g1vgzKdrIMtDHukV3zNGIuOc?=
 =?us-ascii?Q?texOuu7JBUrN2AN0lKWhfLp5HZwoApQzm7dZACSe7f6ZqsWgqms6VtlLKsuH?=
 =?us-ascii?Q?d6MjRlKkcdpImbWDaYSsjL4aP/kQc0Xv9Jw2xjX4ai4eilVvPdIHbtHfIshX?=
 =?us-ascii?Q?fOpxinoSPLeO8tl60ThfxiRMdO5EMY/8C11olyZeL6MCMgH1DVjTZmaAQPbl?=
 =?us-ascii?Q?747SkYuVXPRT3owNowApvm/4FmGhbf6qBGePDQICF96mOHQFJpEpbIu8oz+o?=
 =?us-ascii?Q?6tAQ61ZQaYnEbcGdRDGcF3MDEk2pI0XrUvp+GcKtD1jQp1L0TRmpvH7REo71?=
 =?us-ascii?Q?+yHL5IbeotYwOd2gSPNF33JxOLTrpSMk2TmyLsd9mFkGkc3pTmbpdA1mFEng?=
 =?us-ascii?Q?L8abv0W8lzJhFyaGHG26+HaRHhSERzmY8EGPhVJUuGgAmgVIL8l9JULBtyM8?=
 =?us-ascii?Q?gyUiKISUmfWdXKLr0tiyNYct4C8Wc0keVwlSCENxRmL/szdXa58T2XgCS2lf?=
 =?us-ascii?Q?iFnZOmP3cIYVreLG+YY9K11Rts6Be2ZMpLUSHYHzElisVj5yvLmmRJmTv7V/?=
 =?us-ascii?Q?FT5xPUOQB/IlW3PxjW59FccTVGHaNsudi46Jh8daSsVkYaqPQZx5M5uEu49J?=
 =?us-ascii?Q?2GU4jYn3Ij2CI01RZ/JtlNFPVCgeO4sodaYxxM+endb2l42rKG7Z66CCjSRz?=
 =?us-ascii?Q?qJPU5bLpml9ItFp9xbzf7cUdP3//q1ch6mTSyIBMPYvEEtUVrTv26foL+OqK?=
 =?us-ascii?Q?+2Y0CSxlI4x37sS0sZxe9Li1pkKWiTsWA92uJ5azhc8Tz6aebbSwGT+Fp/Vg?=
 =?us-ascii?Q?YePl/g=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca79d27-a5d0-4960-7ab2-08dcef5c2686
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 10:03:44.3402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWMxy/7pHBJ5LbxS9ySWD+/I/D67gyC4frK0ImP8hp79vBWZWyObrYbjTZMBLNsmnN4E1qbCu/FaQQrrmncHJAv8841hCFtxfV/vf76TkHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9211

The pca954x mux might not respond under certain cicumstances, like
device behindit holding SDA after recovery loop or some internal issue
in mux itself. Those situations are indicated by ETIMEDOUT returned
from I2C transaction attempting selecting or deselecting the channel.
According to device documentation the reset pulse restores I2C
subsystem of the mux and deselects the channel.

Since the mux switches using transistor switches, the failure of line
behind mux that is currently conneted prevents sending commands to mux
itself, so external reset signal is required. 

The following series of patches implements the reset functionality if
it was selected in devicetree. This cannot be default behaviour,
beceuse the reset line might not be dedivated on some boards and such
reset pulse would make other chips need reinitialisation.

---
Changelog:
v2:
  * Removed mail header from the commit log
  * Decreased reset pulse hold time from 10 to 1 ms
v3:
  * Make this functionality enabled by appropriate property in
    devicetree
v4:
  * Fix missing condition check from devicetree
v5:
  * Declare dependency of a new property
---
Wojciech Siudy (2):
  dt-bindings: i2c: pca954x: Add timeout reset property
  pca954x: Reset if channel select fails

 .../bindings/i2c/i2c-mux-pca954x.yaml         | 11 ++++
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 51 +++++++++++++++----
 2 files changed, 51 insertions(+), 11 deletions(-)

-- 
2.34.1


