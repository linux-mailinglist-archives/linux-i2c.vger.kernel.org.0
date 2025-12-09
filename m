Return-Path: <linux-i2c+bounces-14474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1FCAED04
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 04:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C08C300BEF1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 03:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7329D188735;
	Tue,  9 Dec 2025 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="duR/atsK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F43B8D7C;
	Tue,  9 Dec 2025 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765251106; cv=fail; b=GMrxPLzlr/GRtQiIthETY3bBTHmaVsEpkaaUUhU6eYYU6hNt4Ug/1dZTo4YLjQex+PiG5aaAFMMbhSrGOaJ2wVMH5bUn2idgKhtocnX+Q8etMXTNIlH8IT69xCj20KVi2hLQiMhgTwYA1EmBUf3yndUdW5BAegr5qwqt9uPxsH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765251106; c=relaxed/simple;
	bh=Qs5UldLvW4vEmcL8tP1VOT0New3YBlvwW7dGrCuXJIQ=;
	h=From:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tY+DWPRy+uHcSNe5d4bWKa8a82fqQ7wVOKsAN23cgdYYpYkpuF2fOmIq25wQNBZFClIM1nd1ZAxZEJvqpncgLvFIpbRNFXUHx5olP86+Ea/hmAlfMYc9jhXGQ051WMV2oQUfeLyJRZsCY/rzS794TJj9gkVCmGsP1oiEJxS52SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=duR/atsK; arc=fail smtp.client-ip=173.37.142.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5877; q=dns/txt;
  s=iport01; t=1765251104; x=1766460704;
  h=from:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=9QWKfgec/YqhCiRvoY7O2xGGiteEPDIHWSovgQ/QieM=;
  b=duR/atsKZtEJzhYRTb1TMe8rq9RBhmc+E4Y4TQiJYXtJ+S0mWbsLVH3x
   v39djUAZ7EDythHYOpLm3nVLxP8rTHh3qKZvU2ojgEkUNNuqo75pC5kVL
   5pCF3w4iHZ3E4bkWqCbTlLlGe62BcD3tlheXCkF/kBbavvujZOL/fNbtF
   fQH5UZBkcgoRgQ4jGGcaGUUP+KuDN+/fn7v+dn5mjZYkcUjDUBg+mJzrR
   V2VLHlBx5171ZxagXGy/cL6UBiF8WxchkpgICgTs3aDH1ZdS2fY+4hmWL
   ABhbmjZowM412w2L8nHbsfT1jAHUNQOkk2V512L+q7KrUkj+BEXDhTlqL
   A==;
X-CSE-ConnectionGUID: cCSW3HT9Q6y5038Pjd+hbQ==
X-CSE-MsgGUID: l+gXwvGQR1akz4Csm3GzRg==
X-IPAS-Result: =?us-ascii?q?A0AGAAD4ljdp/5IQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBZYEXBQEBAQELAYFtKigHgiAeiEsDhE1fiEYzkU2MUBSBaw8BA?=
 =?us-ascii?q?QENAlEEAQGFBySMRQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZSCAECARVnEgEZAwECHkIdCg4EJzmCJwGCcwMBAqQJAYFAA?=
 =?us-ascii?q?oorgiyBAeAogUsBhTqDGAGFVRmEeCcbgUlEgRUnCxCCN2+EKoQKJIIvBIMwh?=
 =?us-ascii?q?h94gnGGEAaKdhwDgW4XEoFoA4ELbTMdgXhzgRSDSR5ogSaDVYE2kDiBMDULb?=
 =?us-ascii?q?T03NZgfDgsHgQ+BLheBIz2SaQGzSgqEHKFxBC+EBJQVklEBHpMLiDWgZEMJh?=
 =?us-ascii?q?Q0CBAIEBQIQAQEGgWg8gVlwFWUBcwmBQVEZD44qAxaBEgEIxAyBNAIHCwEBA?=
 =?us-ascii?q?wmGS40cAQ?=
IronPort-PHdr: A9a23:eW5zsRVlTePrUPuEl14qoISNzoDV8K3PAWYlg6HPw5pUeailupP6M
 1OauLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:r5vgBalFPq4jcGcx3GlNamPo5gzoJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdC2uBbPqPMTH3ed9/a9jloUoBvsKGyIcySFRo+C48HltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZW31GONgWYubztOs/Lb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYYzwdksIV0fz
 KIJdWhWPiiBi6G2yovuH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAn3j5eD1Rrl29rqss6G+Vxwt0uFToGISOKoTUFJ0Pxi50o
 ErCvGvJHQ81DebGwDmXrlm3g7Tgjxn0Ddd6+LqQs6QCbEeo7mgSDgAGEFrhqtGnhUOkHdFSM
 UoZ/mwpt6da3EiqSMTtGh61uniJujYCVNdKVe438geAzuzT+QnxO4QfZjdFbNpjsIo9QiYnk
 wfY2djoHjdo9raSTBpx64upkN97AgBMRUcqbi4fRgxD6N7myLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:3E+k7azD0pjmnwBeyLe5KrPxbugkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5OxoWJPtfZvdnaQFhrX4pd+ZLUXbURiTXf1fBOzZsnLd8kzFh6NgPM
 hbAtND4bHLfDxHZKXBkUeF+rQbsaO6GcmT7I+0oQYOPGRXgspbnmFE43OgYzVLrX59dOMEPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWL/Gf5HgjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y/NYbfb8yvQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lz0XXMZWu4yCGdmDUIkQxeqUMK+2XoxUcLkvaJAw7SzPAxw76xRyGprnbIeusMiZ
 6jkVjp76a/Rimw4xgVr+K4KS2C0HDE4EbLVYUo/iZiuUx0Us4LkWQSkXklYavpVkjBmfAaOf
 grA8fG6PlMd1SGK3jfo2l02dSpGm8+BxGcXyE5y4SoOhVt7QZEJnEjtYUit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJaQupUB7aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXL1pxW9RLGRnm7QF3Wu4pjzok8vqe5SKvgMCWFRlxrm8y8o+8HCsmeQP
 q3MII+OY6VEYIvI/c84+TTYegmFZBFarxnhj8SYSP9nv72
X-Talos-CUID: 9a23:h3JqzW2cxZOgB40OfHjre7xfEeseTSb98CbpfV7lUT05cL+ZCl+awfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AQUTP4AzD10vaLOik0jAg8UqMSa6aqKDtB3ASj7o?=
 =?us-ascii?q?/gZCNNj4sECyY1xuleIByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Dec 2025 03:30:35 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 2C67318000208;
	Tue,  9 Dec 2025 03:30:35 +0000 (GMT)
X-CSE-ConnectionGUID: QBwplv93TTCNh92Q1fWd4w==
X-CSE-MsgGUID: 3lxwFwhdSLa+McNox5YqOg==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.20,260,1758585600"; 
   d="scan'208,223";a="37994812"
Received: from mail-dm2pr04cu00302.outbound.protection.outlook.com (HELO DM2PR04CU003.outbound.protection.outlook.com) ([40.93.13.58])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Dec 2025 03:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InzYSD8IGx+uc9IjQMLoSg5i1uVhi47C05aZnYjV/JARe7jA2J2fVuyOVhiVmgavmB1zZGUZ5LPP5j9Nhw26DiJE+14USjiA/zJY3Jp/UHzBenVe5+O2vSUflMm9v3c3sg8HioFWcZAqYFhQ4ksvA7lOkN9lM1kBFMgeZpEjhAbhXEfBJdiF8qCExcLsPKrS5pH2GjOjpZnGZFdiA8MZ4LR/CRIWR4M1i+tLs+6DRy4Tluw+ev6acc70+S3xD616vz0ziUg4axSsuDIM2mGmSJx+x3CJmE0M51u7o4/9iyz+Y3dmzmDPp78GcDrXqUQC+KPkUERpTt4XU2a9Zegj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QWKfgec/YqhCiRvoY7O2xGGiteEPDIHWSovgQ/QieM=;
 b=R1/DVV1lQcARzaqxZQEVP2C3ABiK3Hu/qNEDjnP7u7YzqOR0ygp4cvBOGt6tJKA/+myWBESLl8aRyIid+hJx5qgZkGrj4/UKWi06WuuPDOCB6w56xMbsLqxvTZ5ENmZO2NT0lBW+Okk1MYaDKaeCmJ1Uzv7JpeApMzKcja9le+XCdg+9LDuoF0sNUG782c5MwVvgoHiy+EryLjFNmDIP7oql58T5XL3fD2vvJcENoWOalrtM/+gyW/dQPsykWd+NYj2kQRPzs9hcJmFTPQohvxpsoOgvh/PDi6vJLV2WZao7uc2FV4+JffbF/ZU2WYuoYXMKl0hDgmyRinUMD/WG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from IA4PR11MB9012.namprd11.prod.outlook.com (2603:10b6:208:56d::14)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 03:30:32 +0000
Received: from IA4PR11MB9012.namprd11.prod.outlook.com
 ([fe80::c2c5:4e62:345a:394f]) by IA4PR11MB9012.namprd11.prod.outlook.com
 ([fe80::c2c5:4e62:345a:394f%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 03:30:31 +0000
From: "Qing Chang (qinchang)" <qinchang@cisco.com>
CC: "Jean Delvare   (maintainer:I2C/SMBUS CONTROLLER DRIVERS FOR PC)"
	<jdelvare@suse.com>, "Andi Shyti   (maintainer:I2C SUBSYSTEM HOST DRIVERS)"
	<andi.shyti@kernel.org>, "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC"
	<linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: piix4: Add support for I2C block data transactions
Thread-Topic: [PATCH] i2c: piix4: Add support for I2C block data transactions
Thread-Index: AQHcaLwsM9TQPrAEdkOXdZyPVHFspA==
Date: Tue, 9 Dec 2025 03:30:31 +0000
Message-ID: <458484CD-01AC-4155-8687-D628A19D6493@cisco.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a189e4fd-a2fa-47bf-9b21-17f706ee2968_Enabled=True;MSIP_Label_a189e4fd-a2fa-47bf-9b21-17f706ee2968_SiteId=5ae1af62-9505-4097-a69a-c1553ef7840e;MSIP_Label_a189e4fd-a2fa-47bf-9b21-17f706ee2968_SetDate=2025-12-01T06:42:57.0000000Z;MSIP_Label_a189e4fd-a2fa-47bf-9b21-17f706ee2968_Name=Cisco
 Public;MSIP_Label_a189e4fd-a2fa-47bf-9b21-17f706ee2968_ContentBits=3;MSIP_Label_a189e4fd-a2fa-47bf-9b21-17f706ee2968_Method=Privileged
user-agent: Microsoft-MacOutlook/16.103.25113013
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9012:EE_|MW4PR11MB5936:EE_
x-ms-office365-filtering-correlation-id: ffd706ec-d29f-428f-8cfa-08de36d34eb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-7?B?a001RUJPNkFrSG1iR01UMVorLTJBVWJBWDJGUzVaL3R2dmZIY2wyYzBobG8y?=
 =?utf-7?B?QkV6M2RCRTc2YWkzWVFYRVczaUtoaGhpWUUxSystRUdkOThXVHc3QU9tbktB?=
 =?utf-7?B?U2xaZmRNTk1XOWpaeHcycWNzKy1tM1EzdFdBV0hQMTdPd0ZXRFpmdEROd3p2?=
 =?utf-7?B?cFdscmx0OGp0OFh2UDhrcXVtKy1nQVRIQWx5NlRuL3dpKy12aS8yalZEd2VI?=
 =?utf-7?B?d1VPNElvdUk3N01RREd3UDJYRFBUM0NkUEluVWxaczlXTXB0OTh5cW1WcXQ=?=
 =?utf-7?B?Ky05QTI1R0FocjFYeUZkVlVsUystOC9jdEQwWllSdTNGRm9HVnhWeHBkKy1w?=
 =?utf-7?B?RVFtZUZrb2xUMmtVRy8vUjFhSzFBRGlOTFgwZ1BUcDA3YUNkOHdlTFFwenhS?=
 =?utf-7?B?dzRBL2tIaDFidkhReDA2Z0RaZ2hqR0NnMmZJSXRicEIwaVZuL09YOUV1SXhx?=
 =?utf-7?B?aWgxY0Q0bG14QS9vMEF2Y2xhV3QzNnhSdmEyTHZmNnJSM2RBZmhUbCstdmxx?=
 =?utf-7?B?QW5GV3cvODc3SXNDb0pQYzk5MzBHbWxvSjIxUE13cmJIbjQvVU5yYXI1NGgv?=
 =?utf-7?B?T0sxbVJUVlNhMGZaTHlwc2FQTE1JSlM1QXJwQnhSSWlBN1FtWlBXcy9BOTFl?=
 =?utf-7?B?Q2ZVdkFRQjE2UmFaa1VjN0R4QmhaT2dFQ0Uvc0xFSjlYdEE1TmdJeTFFdkJz?=
 =?utf-7?B?ZXJwT0VUelIyREFLSUdZZUEzTFVhdFlCZXoyeDhHRUcrLXpYVXE3TzB1ZHNC?=
 =?utf-7?B?cE1pV25OVzBmdy85b2hmS0J1ZFFULzYvYkdjU0VIRFVFTHNUWXAwcmhQNVlB?=
 =?utf-7?B?WG1sL0FVN3JCb1J1anA4MUdEV1VrV1pONXp3UmI1MnZrYnVFNnRpaWwxS2pm?=
 =?utf-7?B?THp6WTl4ZExmVUVsNzVrVm41SkYzVElBb3BKSk1RYnJ3eGJIeW9PUDlqUTBQ?=
 =?utf-7?B?ZlEwMUd0cGRLOG5RRystbjN3a2NvM0lMNlNsY0M5VFpFNml2QnBrMjE3Szd1?=
 =?utf-7?B?R0NwYTRkbGRLd3Vic3QwYzQvTU1rU09rYlgzRzNqOUhsMDczdzYrLUttcWNs?=
 =?utf-7?B?dkJYZ2JDUXdxQ1EvNFYrLWFxVWRhUG5adVFGQ00xb1RwbzJ2RystdFlMbCst?=
 =?utf-7?B?TjNzbFJmb3VVUTdIbFFHWWkxaWNLbXlRV2FHb3UwWC9ORkc1Z1h0YWgwS2g5?=
 =?utf-7?B?S0VuNG94UWhIa2xudUVqaXQxSmtUbnFhbHk4bFJjZFhXN1JDcDVOa2VMMDBu?=
 =?utf-7?B?ZmhqeHdLN3Z0TXhSRVB1Q0FpWWx2Q2Noemw1Z21yaW1uMHFyKy1FV3lKUjBX?=
 =?utf-7?B?UVRqcGpPRmZPR29DRnFHSFNDajV4TEJyRk04cjJ3WkxGQkFmYjZjUVVzeUkw?=
 =?utf-7?B?amc4M2ZDLystRFRiUXVWclEzaDNoMzkycSstRjhnT21jaWdWd0l3d2hwUSst?=
 =?utf-7?B?YVpQVnNFU2VNOC9kUng4UDkrLWZwZk52QmNTKy1lZzgyTU5RZDlTSHA0bnlq?=
 =?utf-7?B?eWxKYUFBWUtMVjZoclNueDhOR1dNTmtwcXRjdmtROFlEZ29ZT3dXVlBnV1ZI?=
 =?utf-7?B?ZVBuYmRtSUpqYjU1Yk0xVU41VWllTEY1OWJkUXhVUFBtaHJucEduYy9Xbkkz?=
 =?utf-7?B?U1dBSnJZQWJJQmJObzAzNFIzdW5VbWlCRnRSQTZHR2pLUWFDdGdBTnpXS1Mw?=
 =?utf-7?B?M08ySGFwZUY5dWk0S1oxaGMwUEpKZDVrbmo4UUFnR3ZJSVQwTTRPVE90bDlC?=
 =?utf-7?B?NmE1b0RXM1BreXQyM0dRWmJjVkxpT1owUnJyU1IyTkd1VystZHgrLUF5aU1N?=
 =?utf-7?B?RFlCN2tJSHZwa1l4UHpXREFmQ0wzaXhkbUVYU29qc2RlSlNuNEkrLUJOSHBG?=
 =?utf-7?B?NEtCeDQyWnU5a1MyeTRDMFBtYjQ4TUpSN0Yxd0JvOXBWZVVzNmQ5d1c2U3NR?=
 =?utf-7?B?WVBGaXAvVWNKZUtrSUo4cWZkSUhnRGVuQnNYL3JJaGRwOGZBOGUyUmsxTkdp?=
 =?utf-7?B?MHJFRHpKNlJxbTdQUjRKbDV4cWc3bWJhc1JFaFhiNEhNOWJkc0E2Z3kvZG5M?=
 =?utf-7?B?azNlelRmaEtMRSstQnFndFNiWnlNbU1tVEZqT3MzU0c=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9012.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?V2xwV2VmNEx0SnFtRnFKSGU5NEdjTS9NTXFnSHF4N3FJSk13cjd6VFR4U1Ri?=
 =?utf-7?B?NnVybmpkR0tvbzhhb2puVzk2R01BNzBXR3NWdmQwTUV4TGRZNUhZcVR0UVRS?=
 =?utf-7?B?bERrbGMxNHVGblhEdUN4dXNDM2JQWTZ6Q29VTVNoanVPNW5tMUk2V3J5UGw1?=
 =?utf-7?B?cGUzQ1lFWFhjWFJuTGV4UjFwa3JyTWJWeURRS3REby9HWGlKM1FET2EzU3pR?=
 =?utf-7?B?Ky01WTl0OWtraGZSYmhhNVdpeEIyTEFaeGxsSXFNNGE4Q1BubDFSeElGeGd5?=
 =?utf-7?B?NU9vekp3clVWOTRETFR4c0t1a21pMFQyS1A3OC9HS1JTYmcvMnZMYm5ScElY?=
 =?utf-7?B?azhXcmFDZUZrOXJIZmxnc1pIRTVHR20zN01QVzVNY1h6WTB0STBPZEtzQkc=?=
 =?utf-7?B?Ky05bDVrUVNySERnMlVQTGg3VDdOakVzUGtISUlSTG9NS2xnKy1uS29veXU2?=
 =?utf-7?B?eW0vNkNGUUhVNDJ1RnBSeGVFZTZSb2U5Q2FyTmpBdi9nY1pXbXAvMVdQOE9Q?=
 =?utf-7?B?Zm8zejF1WHFzY200aGJmZCstN1Zoc0JxWnVJS3RKM3IySXQrLWdHS2RhTERl?=
 =?utf-7?B?Nnd3Z2k1Qmt6TTlDdm5KQ2ZnRlF5alVMaEhibWs2WE9ITXlVTlFyTDlOSXIz?=
 =?utf-7?B?RlBFeWQ2NmEyQU53NVdWS1kxcndpeE1PMkY2MkI3MUpZQystQ0FzWG9JaURV?=
 =?utf-7?B?Z0s2UUxISVhKVU9mdzcvb1orLVlUbEtVU1BQRWpSR21jZmYwNjBvQzFXUGJi?=
 =?utf-7?B?Z3owYUlaWVFWQ1JNaEtyMU5xSS9YWXNBaTY2MGwyZ1lDYzZ3WnFrNWc5MXRq?=
 =?utf-7?B?RmNvWVcrLUtTbEw4VSstN05rSTZzYUdSaTBWWXpIZTJKdXNBNDFXbENYaXls?=
 =?utf-7?B?Y1I1UGxDZUVXSEQ0Y1dRRHg4YUpyeFhYdGZGWURBS29xZHp4dlhHQWI2WFNK?=
 =?utf-7?B?Z1F5SHFJcnErLXl1aVlhZUlpOGo4SFJ4NGxiZGUwTXBQbklPeDZzTzdQNXJC?=
 =?utf-7?B?UDhyUnhmSU51Rnh1NENNQm9ZMmlCWlRQa2U0UDNscnZDUEJOejJGRWhpb1h5?=
 =?utf-7?B?RFdTRTJRYlZ1OVRhV3VXU2NYa3NxeUI3Ukx3c05LUzJoa2NGTDVZT01PZ1hH?=
 =?utf-7?B?ek1VMk5FVUtXSnhUTXpXaEZJalBYWmFqR3J0NHdzOFFaaTVuak9LamZuNVNr?=
 =?utf-7?B?aXZ1QTd5YmszcEcxVnZxKy15NSstYVk4eU9uZGNQdnFscXBWby9TMzBWU2Fk?=
 =?utf-7?B?c0JTcWRneGxxZU4yWEdtd3cyN2FLZEtWSVZyalpDUEtsL1RYZmgwVDlYTVpo?=
 =?utf-7?B?Ky1CclRrT1ozQTgxTlN3M1R5Y3dFaW5mWG8xSlhYNDk1dkxLdzBUdzhTbyst?=
 =?utf-7?B?ZUE5MFgxSm9oSm0ydUpNamRhZU9mY3dVMUZiVFVmZGVBc2NCU2Y4T2xqaTFz?=
 =?utf-7?B?Szg2U2cza1NKcDN3M0tnV0VxVi9nVUlVa3d5Q3BiUUNHTGdQcjIrLUd4Tlo0?=
 =?utf-7?B?NjJuVHYwenJTU21DRystUUxXb2l2Ymk2cmhzYlZZc3U0S2c4TFp6clNiWmdj?=
 =?utf-7?B?SUY2RjBhcW5qNHA1MHB5SW8rLXZBS0R2R2NFR1ZYU0hCVUdWNEVwbGV6WVcx?=
 =?utf-7?B?aEhkTmoxYUtVYVpVRm1HQ1o4TnlsdjlpU1RNaWhXdnl6YkNSKy04bUV6c0tD?=
 =?utf-7?B?TFNnVUNZZmJVT0FuUTdGSnkrLW4wTE9LZXN2NzgxMG8rLVA0d1pnc2I3ZXpk?=
 =?utf-7?B?ajFYY2xkVkkyWlZPQ2VDNno1NkhaQU1nY3Zva3Vxd3c1N3BoaWlEcFh0N0ZV?=
 =?utf-7?B?eU1nZlZtTFgzck9UUDgvRXpTVldXVmdFMGgxTXgybUN5dDh4Qk14UGNXc3RI?=
 =?utf-7?B?MjR2b3ZVbystT0M2S2hiOTBYYSstelU1TFVPd2d1NFgxQ1dmYUJCOWhqd3Nv?=
 =?utf-7?B?TUJnbUhZdUJCL1FlMWM1ZjRtMzlUVFlrV0tPNmJjdWRwYSsteDlsMENvOG1J?=
 =?utf-7?B?YmVhQVc3M2VxMzE2MDJwTU4wandzVHYvWVBmRnJWbVZ5bzI1Ui9SS3FPTHlJ?=
 =?utf-7?B?dWo5NXNHWmgyVUFHckNnSG8zS2kyL3hzQWN5aHFGVFFNQzRLREt4UWU5NEpF?=
 =?utf-7?B?NDg4UkhncGE0b3pFcHNBR1NaZEQvaVdBaHVqZkY4ZistMUg5SVo5aXlwZjQv?=
 =?utf-7?B?eU03WUJUT1pQc3RyeCstbW5qdmhPVDkwQmtiMnFiRVFuS2c3dGloaWZVZUJt?=
 =?utf-7?B?TUJkV2hMTUxsL3NuQ3ErLS9UeVBMSHR2WlY=?=
Content-Type: text/plain; charset="utf-7"
Content-ID: <B90945258EE773419C331D50E05FD7A8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd706ec-d29f-428f-8cfa-08de36d34eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 03:30:31.9125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNt5cNNNiqku0xaQA1YU2X7m4Pd66gtFmv3D8Cw0UK9SvzSZwVQdK1FZiAXUermkQD0hR+LsCKy7trI3AK8EDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com

From 329a0f951071c03b75a92e6b3c5746d9ee002935 Mon Sep 17 00:00:00 2001

-
From: Qing Chang +ADw-qinchang+AEA-cisco.com+AD4-
Date: Sun, 30 Nov 2025 19:30:36 -0800
Subject: +AFs-PATCH+AF0- i2c: piix4: Add support for I2C block data transac=
tions

Add support for I2C+AF8-SMBUS+AF8-I2C+AF8-BLOCK+AF8-DATA protocol to the PI=
IX4 SMBus
driver. This enables I2C block read/write operations where the master
specifies the transfer length, unlike SMBus block data where the slave
provides the length.

Key changes:
- Add PIIX4+AF8-I2C+AF8-BLOCK+AF8-DATA protocol constant (0x18)
- Implement I2C block write: first data byte to SMBHSTDAT0, rest to SMBBLKD=
AT
- Implement I2C block read: pre-specify length, read first byte from
  SMBHSTDAT0, rest from SMBBLKDAT
- Update piix4+AF8-func() to advertise I2C+AF8-FUNC+AF8-SMBUS+AF8-I2C+AF8-B=
LOCK support
- Add IMC notification for SB800 series chips

Signed-off-by: Qing Chang +ADw-qinchang+AEA-cisco.com+AD4-
---
 drivers/i2c/busses/i2c-piix4.c +AHw- 44 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-=
+-+-+-+-+-+-+-+-+-+-+-+-+-+----
 drivers/i2c/busses/i2c-piix4.h +AHw-  3 +-+--
 2 files changed, 43 insertions(+-), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.=
c
index ac3bb550303f..778ff169b138 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+-+-+- b/drivers/i2c/busses/i2c-piix4.c
+AEAAQA- -649,6 +-649,28 +AEAAQA- static s32 piix4+AF8-access(struct i2c+AF=
8-adapter +ACo- adap, u16 addr,
                +AH0-
                size +AD0- PIIX4+AF8-BLOCK+AF8-DATA+ADs-
                break+ADs-
+-       case I2C+AF8-SMBUS+AF8-I2C+AF8-BLOCK+AF8-DATA:
+-               outb+AF8-p((addr +ADwAPA- 1) +AHw- read+AF8-write,
+-                      SMBHSTADD)+ADs-
+-               outb+AF8-p(command, SMBHSTCMD)+ADs-
+-               if (read+AF8-write +AD0APQ- I2C+AF8-SMBUS+AF8-WRITE) +AHs-
+-                       len +AD0- data-+AD4-block+AFs-0+AF0AOw-
+-                       if (len +AD0APQ- 0 +AHwAfA- len +AD4- I2C+AF8-SMBU=
S+AF8-BLOCK+AF8-MAX +- 1)
+-                               return -EINVAL+ADs-
+-                       /+ACo- For I2C block write, first byte goes to SMB=
HSTDAT0 +ACo-/
+-                       outb+AF8-p(data-+AD4-block+AFs-1+AF0-, SMBHSTDAT0)=
+ADs-
+-                       inb+AF8-p(SMBHSTCNT)+ADs-       /+ACo- Reset SMBBL=
KDAT +ACo-/
+-                       /+ACo- Write remaining bytes to SMBBLKDAT +ACo-/
+-                       for (i +AD0- 2+ADs- i +ADwAPQ- len+ADs- i+-+-)
+-                               outb+AF8-p(data-+AD4-block+AFs-i+AF0-, SMB=
BLKDAT)+ADs-
+-               +AH0- else +AHs-
+-                       /+ACo- For I2C block read, length is pre-specified=
 by caller +ACo-/
+-                       len +AD0- data-+AD4-block+AFs-0+AF0AOw-
+-                       if (len +AD0APQ- 0 +AHwAfA- len +AD4- I2C+AF8-SMBU=
S+AF8-BLOCK+AF8-MAX +- 1)
+-                               return -EINVAL+ADs-
+-               +AH0-
+-               size +AD0- PIIX4+AF8-I2C+AF8-BLOCK+AF8-DATA+ADs-
+-               break+ADs-
        default:
                dev+AF8-warn(+ACY-adap-+AD4-dev, +ACI-Unsupported transacti=
on +ACU-d+AFw-n+ACI-, size)+ADs-
                return -EOPNOTSUPP+ADs-
+AEAAQA- -680,6 +-702,18 +AEAAQA- static s32 piix4+AF8-access(struct i2c+AF=
8-adapter +ACo- adap, u16 addr,
                for (i +AD0- 1+ADs- i +ADwAPQ- data-+AD4-block+AFs-0+AF0AOw=
- i+-+-)
                        data-+AD4-block+AFs-i+AF0- +AD0- inb+AF8-p(SMBBLKDA=
T)+ADs-
                break+ADs-
+-       case PIIX4+AF8-I2C+AF8-BLOCK+AF8-DATA:
+-               /+ACo- For I2C block read, the length was pre-specified +A=
Co-/
+-               len +AD0- data-+AD4-block+AFs-0+AF0AOw-
+-               if (len +AD0APQ- 0 +AHwAfA- len +AD4- I2C+AF8-SMBUS+AF8-BL=
OCK+AF8-MAX +- 1)
+-                       return -EPROTO+ADs-
+-               /+ACo- First byte of data is in SMBHSTDAT0, not a count +A=
Co-/
+-               data-+AD4-block+AFs-1+AF0- +AD0- inb+AF8-p(SMBHSTDAT0)+ADs=
-
+-               inb+AF8-p(SMBHSTCNT)+ADs-       /+ACo- Reset SMBBLKDAT +AC=
o-/
+-               /+ACo- Read remaining bytes from SMBBLKDAT +ACo-/
+-               for (i +AD0- 2+ADs- i +ADwAPQ- len+ADs- i+-+-)
+-                       data-+AD4-block+AFs-i+AF0- +AD0- inb+AF8-p(SMBBLKD=
AT)+ADs-
+-               break+ADs-
        +AH0-
        return 0+ADs-
 +AH0-
+AEAAQA- -819,7 +-853,9 +AEAAQA- static s32 piix4+AF8-access+AF8-sb800(stru=
ct i2c+AF8-adapter +ACo-adap, u16 addr,
         +ACo- Therefore we need to request the ownership flag during those
         +ACo- transactions.
         +ACo-/
-       if ((size +AD0APQ- I2C+AF8-SMBUS+AF8-BLOCK+AF8-DATA) +ACYAJg- adapd=
ata-+AD4-notify+AF8-imc) +AHs-
+-       if ((size +AD0APQ- I2C+AF8-SMBUS+AF8-BLOCK+AF8-DATA +AHwAfA-
+-            size +AD0APQ- I2C+AF8-SMBUS+AF8-I2C+AF8-BLOCK+AF8-DATA) +ACYA=
Jg-
+-           adapdata-+AD4-notify+AF8-imc) +AHs-
                int ret+ADs-

                ret +AD0- piix4+AF8-imc+AF8-sleep()+ADs-
+AEAAQA- -855,7 +-891,9 +AEAAQA- static s32 piix4+AF8-access+AF8-sb800(stru=
ct i2c+AF8-adapter +ACo-adap, u16 addr,
        /+ACo- Release the semaphore +ACo-/
        outb+AF8-p(smbslvcnt +AHw- 0x20, SMBSLVCNT)+ADs-

-       if ((size +AD0APQ- I2C+AF8-SMBUS+AF8-BLOCK+AF8-DATA) +ACYAJg- adapd=
ata-+AD4-notify+AF8-imc)
+-       if ((size +AD0APQ- I2C+AF8-SMBUS+AF8-BLOCK+AF8-DATA +AHwAfA-
+-            size +AD0APQ- I2C+AF8-SMBUS+AF8-I2C+AF8-BLOCK+AF8-DATA) +ACYA=
Jg-
+-           adapdata-+AD4-notify+AF8-imc)
                piix4+AF8-imc+AF8-wakeup()+ADs-

 release:
+AEAAQA- -867,7 +-905,7 +AEAAQA- static u32 piix4+AF8-func(struct i2c+AF8-a=
dapter +ACo-adapter)
 +AHs-
        return I2C+AF8-FUNC+AF8-SMBUS+AF8-QUICK +AHw- I2C+AF8-FUNC+AF8-SMBU=
S+AF8-BYTE +AHw-
            I2C+AF8-FUNC+AF8-SMBUS+AF8-BYTE+AF8-DATA +AHw- I2C+AF8-FUNC+AF8=
-SMBUS+AF8-WORD+AF8-DATA +AHw-
-           I2C+AF8-FUNC+AF8-SMBUS+AF8-BLOCK+AF8-DATA+ADs-
+-           I2C+AF8-FUNC+AF8-SMBUS+AF8-BLOCK+AF8-DATA +AHw- I2C+AF8-FUNC+A=
F8-SMBUS+AF8-I2C+AF8-BLOCK+ADs-
 +AH0-

 static const struct i2c+AF8-algorithm smbus+AF8-algorithm +AD0- +AHs-
diff --git a/drivers/i2c/busses/i2c-piix4.h b/drivers/i2c/busses/i2c-piix4.=
h
index 36bc6ce82a27..6311af3ca661 100644
--- a/drivers/i2c/busses/i2c-piix4.h
+-+-+- b/drivers/i2c/busses/i2c-piix4.h
+AEAAQA- -29,7 +-29,8 +AEAAQA-
 +ACM-define SMBSLVDAT      (0x0C +- piix4+AF8-smba)

 /+ACo- PIIX4 constants +ACo-/
-+ACM-define PIIX4+AF8-BLOCK+AF8-DATA       0x14
+-+ACM-define PIIX4+AF8-BLOCK+AF8-DATA               0x14
+-+ACM-define PIIX4+AF8-I2C+AF8-BLOCK+AF8-DATA   0x18

 struct sb800+AF8-mmio+AF8-cfg +AHs-
        void +AF8AXw-iomem +ACo-addr+ADs-
--
2.35.6



