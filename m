Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EC5492B8A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 17:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346349AbiARQvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 11:51:08 -0500
Received: from mail-eopbgr70055.outbound.protection.outlook.com ([40.107.7.55]:37185
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239060AbiARQvH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 11:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sebuoAICtSsCfUveVIo2nBIcppFsWFuM5uV36ye0+ro=;
 b=1zDwF6ttcKqJPuAS/6nQSbU82lpGisimNsdmuISMVQMfxCaBELizplcWJ1CSRCDksOjVi4OQRQ7oW4AJoJpr8aNdG1d3uBBwNOi8fnKUwdhzBrolGW7vajAD+WBd5l3rNOoB+Cp52aMmdMWUG5U9Z8C68VmkQ+JZpCzTMqxeR9s=
Received: from AS9PR06CA0373.eurprd06.prod.outlook.com (2603:10a6:20b:460::8)
 by AM5PR0801MB1858.eurprd08.prod.outlook.com (2603:10a6:203:47::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 16:51:05 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::bc) by AS9PR06CA0373.outlook.office365.com
 (2603:10a6:20b:460::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12 via Frontend
 Transport; Tue, 18 Jan 2022 16:51:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 16:51:05 +0000
Received: ("Tessian outbound 31aeb3346a45:v113"); Tue, 18 Jan 2022 16:51:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66fe672b8be6912a
X-CR-MTA-TID: 64aa7808
Received: from 1ba3ee8dcea4.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id FC18619E-8AB8-4B23-885B-EAC92AD49913.1;
        Tue, 18 Jan 2022 16:50:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ba3ee8dcea4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jan 2022 16:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDKoTxNnuWfHGaPGtMK9OteCWs8nzKXoWYliJVSqcWeDU/ogJo42c0Z9p8LHA7bhexcGJClHsaqjrX8e8fbR5fIxVqjyc+Y4JeFK5emfNbX5t9HWYk7QfmJtACJnE8W3lU5vGMErWBoO1xt1pH2gDP7uk04O0Z280uTomFjA2IztpXbdV3CjxOjvH1lGLpQzKuF0tMPrdjkF50ulKS1Kni5hnOop7xZbfueNHPd0eIEwV5APbMkDF8smdt6oSXDk4v6Lg2qlAliOgFQQ/SxzL3o6aRk+Hd4CWhOCt1skPpVTfEe0tdj4/xtQPjPQWWF5p5IrxNQ9hVHhGi5fggGfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sebuoAICtSsCfUveVIo2nBIcppFsWFuM5uV36ye0+ro=;
 b=kHBG7tRFCaCjWPscTGx4YgnzGrcJ1IzZjVH2Qh3MV8AuP1W5DBSmPD7HTUlqrgFMB+G8xtsMbmwmiAFPoeW93/znQVHHNyDjGQXEA97lie4bzxEusmlGobJeg6MTURuBTmC/WeYwaRlYLQWapc3X05+BdWXO5RtZGsAppKR9gFxuva4y3z4JlXP/PpSTlGtylqEb8/uDU1t6fQflP60vvwJfVKf4FNv7ZA1hKU2IYSfjndtmkQjiFEKFkwAG5f/E34HbG8axNxSo+ygqFIAcFGpWrjOod6ns3YkigOsemhvx0/By7XFZlXuIeOAkuYne4u261ZRc0qeFTwUNjcd3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sebuoAICtSsCfUveVIo2nBIcppFsWFuM5uV36ye0+ro=;
 b=1zDwF6ttcKqJPuAS/6nQSbU82lpGisimNsdmuISMVQMfxCaBELizplcWJ1CSRCDksOjVi4OQRQ7oW4AJoJpr8aNdG1d3uBBwNOi8fnKUwdhzBrolGW7vajAD+WBd5l3rNOoB+Cp52aMmdMWUG5U9Z8C68VmkQ+JZpCzTMqxeR9s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 16:50:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d083:610d:66ce:9446]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d083:610d:66ce:9446%8]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 16:50:56 +0000
From:   Ross Burton <Ross.Burton@arm.com>
To:     Jean Delvare <jdelvare@suse.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] py-smbus/setup.py: use setuptools instead of distutils
Thread-Topic: [PATCH] py-smbus/setup.py: use setuptools instead of distutils
Thread-Index: AQHYDGdgRnhGwhZ6AE288QYfDEtLFKxo/lAA
Date:   Tue, 18 Jan 2022 16:50:56 +0000
Message-ID: <E663CBEF-A063-4D0E-A983-CC6D93259D54@arm.com>
References: <20220114134910.3994688-1-ross.burton@arm.com>
 <20220118131131.388e5d3c@endymion>
In-Reply-To: <20220118131131.388e5d3c@endymion>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.57.22011101
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7a4ecf3d-6aaf-4f47-8369-08d9daa2b7c0
x-ms-traffictypediagnostic: AM0PR08MB5443:EE_|VE1EUR03FT063:EE_|AM5PR0801MB1858:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18581553C480CE0FD73B0535E8589@AM5PR0801MB1858.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ezwEAXZ7oUbi6yka0NujLV/9pIEE4iZPNFWQNczert4ycQbjqZcT5G9deSn+PEyUVX9iedslkxxziMqwxzMs+0tVyMSsoAUxy6F2Eyk1LA7zmCqdFTYptHNWjfl87YtWZBCjo+eK2zAEM839jmUzgki+xXUAwL4vq+kk4FswwxKh+SrJw1Rcxjxo9kkmwUiGaI+CSVOGG9cGk9um0ZDEUlT3s9qRSWoLVw/2xIfXPdE3Owb1g5o5B9IERdKfxk9eZHTsHI1X9WDZ+2uxEmGj2tobRaehPIkJXtY4ToMWsN6OtCMXnDMHo1Awv+kTCcx5IG9RSIWMXiL1+oohpqjArMU3RW9unU3d4QT8cSYJ7PktEDalD1ODVJDmhmqWQiqTsi2IaGjCuU+If1C4SIbqYqQi1R1bVvHqFGX1WOqv87g+9he1wgRag8VU2vhXHnThOWMujvNqN44UMVTe7lhvblBOctpm0wxeyo527evYj51hT6/F3ZoUOR6AgZoO4UjYr2RULsqjhFJEF6/AordxSVr06wPITba6C1OU1JT3VQFG1VelMakG68L4lSylxmSOLZpxeqOFtWsOwn/g21SfXtrkdo53TAHmq+4+rAhsYGnzUsMwgpGZ4Wpd6SJMRaLKoV1/DSqbnDDma9bjMvjWEund9NIZtcLBdlG6cSpqBtOynNXZHnuoWthmXK2UEWwu94UQVAiX1c2b9Wy70974054/nglArTiom6kxLH6X5Ljr06n/SY5T6uZP4BrqeumZ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(83380400001)(5660300002)(38070700005)(508600001)(186003)(316002)(26005)(8936002)(33656002)(36756003)(71200400001)(6506007)(6916009)(91956017)(66946007)(8676002)(86362001)(6486002)(122000001)(4326008)(4744005)(76116006)(2616005)(66446008)(2906002)(38100700002)(66476007)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A724E4A8A14B54A92255DA659792463@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 00d5dbf1-6923-4f90-4b72-08d9daa2b2bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dpou1iUhzADwp28X22Uzyhi5gtd1YW8hSu9lnwz2OkyhTJb+aNh9zTvB8bzVCsWnqIj5C6BYPocoQYFTvDEdOtcT91nV6jcXuFFtnWnIyrl1slq1W5QqVTedwJD1KUdP3YmRpItJkJga/NdDvHrdd8obY5xzxA5b0MYGTDfuYMGF5SN8pSX6mR4WovqI7hcLM5c2u1/jLR6q837aDZ4AJt2KklLLdlFsj0Gwr7R4WHXkfktSIEUBMK8C4J3x9i11mODXeRDi2RhzuEyIqHr8M+P+FL5PTfhO9s+TrtV9AYPPYfFBp/okTBwceR94xH1UGHrRMgMzn3A1GSNmj/XTKZNeFRnFePCXTWr2edzr89BykMXemUU2H9iQUurm5KSmJTtMpAZvPTZ8RCLlDdBYbJDrrP/KK8BxdrUZ+VGOX8pjjldLmxLbqQ4cNWP87O7ZpP2Oj/gy6wXlm3wFFRK3Yx4345QtCek3NSYBD85ROaiPcWMJ4tZCpxC4QpcEbXHXm1UOb3TamFW7oHX9LsXwGTEgZMKwjoFF3v75FWfGuwwJ4YLAL/GMU6NPXiZTNtnURg/BphGpKjsceCIduKpSKzfOFqAQNukvffzRE4Inu7henEkINnglrmFhXgDLsTux2RQgcNxI+TGwMsl1FpxFyIjt62vjPnF0xc0AgnxAC8nUCJALZa9hDqoNq1dJ21aYZVqaLvDDqchle3qTV5PlK3nhjHLzgV2aR83NGPgfAWem9p5+kLYGQpfPcNKewXXQfYwFM5VSv7l5RLyPs06c/Q==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(36860700001)(47076005)(83380400001)(5660300002)(86362001)(508600001)(2616005)(2906002)(356005)(81166007)(4326008)(336012)(4744005)(316002)(70206006)(6512007)(6506007)(70586007)(8936002)(6862004)(82310400004)(33656002)(8676002)(36756003)(186003)(26005)(6486002)(40460700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:51:05.0946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4ecf3d-6aaf-4f47-8369-08d9daa2b7c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1858
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBJcyBzZXR1cHRvb2xzIGF2YWlsYWJsZSBpbiBweXRob24gMi43PyBGb3Igbm93LCBweS1zbWJ1
cyBjYW4gYmUgYnVpbHQNCj4gZm9yIGVpdGhlciBweXRob24yIG9yIHB5dGhvbjMsIGFuZCBJIHdv
dWxkIGxpa2UgdG8gbWFpbnRhaW4gdGhhdA0KPiBwb3NzaWJpbGl0eS4NCg0KWWVzLCBpdCBpcy4N
Cg0KUm9zcw0KDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBh
bmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZp
bGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50
cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBv
ciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
