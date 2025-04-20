Return-Path: <linux-i2c+bounces-10499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15873A9469A
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 05:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176CF3B05F1
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 03:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AC32AF19;
	Sun, 20 Apr 2025 03:47:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30ED15D1;
	Sun, 20 Apr 2025 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745120821; cv=fail; b=jgerVK2sQTBZCKgrIQUpHCEVV72fc0/VWws3XZrW2e5JSDBqL8HfC5CUqrPVhzkTbeu6VCSTmXZTneL0SmNIW4tE8jV4HRDBaufEut/tV9R71lNf9Ec0oAPc4jVr7jZhXhWtBtb+bG+iD6dEgQ94JcVBchdg9sX0wa59J2lH+R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745120821; c=relaxed/simple;
	bh=jDyWg08MZo+zSzFhQu2/0YeSQ5MqqgzBQzTyMoU1GSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HmOWGGJcHnhgNqcf12wrpovEp8a4Korf2jPOoKnfJTrxHCfkgPSFT/VlYIwbaTC4POjuB2bQTmpkTMf4cFkMH8H0k7e4Jypx1+vQd914qevYXKaCmZZf5p+fy791SDpkmQVMH67SWt5cwRYiSU6ADAegGAA11bbTkNqZO5ir19A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgVPnOaE56/PV64gXGIF8vjiXNhdIRdcjhouEqJ3baZNOso2a+ZXvb1wGisugxGeN2EhOPyfSPBgMwnUlZX0PBvcIRvl7iS5eC55YmFRy0M/334R2BbasIKMSG5oVB8MWWlJgX3NU3D6zcFEuT8z8FgSqrLNI+ZKiAMZAIhl87cYS/HttFGBVmlfFKn/TkEZ/QVHzrNOAraW9VKOxR/k5pHRaxYXXImP4j7uSae3UTZIgFtM8iMD59z6URTa9ANwZvIXBq9ehqCF3BLtoRD5TspEQSGJbHT0FdeCN2iywVckfRxm65v/1LA8oOtU4+kzfzx2U0x3l3XFjHv/P9EpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDyWg08MZo+zSzFhQu2/0YeSQ5MqqgzBQzTyMoU1GSU=;
 b=Xo3e9seL0/lIY38TXc66gR2/orThzrhOLDKvl0LJJ+3g80cI8sdRdadcGVq2cisuDeBelqM61ncCKQmjvDMnqAcsaSSw0ZlASId4wxw41IGf4v2x7meT6BxG8/C9oUz1TrDzIPAJgxcknQHGX6kcYySqj/9URfxi8n4M3L6mf/vCDbBjrJjuK4hOiKRRAUXjKiE6XWusOeJI1jZYxqcuCBbVgC+QFwvleYdOsy2stvKcQ4s+UhmfsfMlcxQngwX6JDWLOHlWqMYLek/0TIO+B8MQ4YYKSiuBhdNWlgLODhtFFFkiLZ+fExp2n8t0l+6fT8faytkC9/Bz02qTLnZyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 03:31:10 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 03:31:10 +0000
From: EnDe Tan <ende.tan@starfivetech.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"jsd@semihalf.com" <jsd@semihalf.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"endeneer@gmail.com" <endeneer@gmail.com>
Subject: RE: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
Thread-Topic: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
Thread-Index: AQHbq1NZxeBeZwmSbU+ZT1PgQ+QN37OkxeGAgAciiEA=
Date: Sun, 20 Apr 2025 03:31:09 +0000
Message-ID:
 <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
 <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
In-Reply-To: <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1018:EE_|NTZPR01MB0956:EE_
x-ms-office365-filtering-correlation-id: 7b376770-e93b-4c24-be8b-08dd7fbbcb07
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 SxeItvI5qwoyM6O6dHvRU958jNktMEBPL/1tBjkELYrOWaHHbAWz4mNPh7cu3/Dxqyg8u1NIyIEaJ8Faf2dTX+HSj5jim87eQFzq9hKXfJ01L/s0MrdH5e/jLJmHlYE+WTjeoS9UHJM59AO45KQ9P+YpSx65Mbx+LoPlPYT6lHqyzGxKSXNUAYI3qEznVtJjayv12+3OT+sRF1Lhiqpo7GQLXIMfRAWLFGm1AovRYkqQILKWBuPuBKrNbTV76aiXAJiV4UU2nzrZRbJiakVYvXClBquR68kIss7Ys4zLWO1+gzzLOxlPhQyl/4L+j14PkG+W5jJL8JxzvuJQgh0Nx8UUDsLHbJ9fg6TQSOfH3NIgG33ylSj+jwe7NCPQCjBAQN4Dn2wvCRCE2/DZxrU/d3or8P8pd5TntlgiIh8tgantTSp3SoiNAJrD4jcbWFliqkbnraXKobsHC1xz/2ClhgeeULYsAMSHWK4SKTwfUlmQT35uOxBQltPiKsxiQo+wZtYPtrCQamQ/EbYGlge+bXUzIDmQXIIAfZONAZQmhZJsIrtwZYvwI5BBJ/EFUzDg4M4rR/QberrHSqGrA3OjYv0fLiWkbcxupwCtQic3xrU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VrqiXtovpftqSwDZHKLBOva1h0/kAi1ZndLLTNbflT0S+KZsobgwBPAT5Xb4?=
 =?us-ascii?Q?LYnei4JQdjTbCIDUlMQDDJEvsuCE004MYXufGz1WrwtXfvQo2klMn2PGPLZ1?=
 =?us-ascii?Q?EathJH6/ZEPYSDS7w4+z15DXf4m+FV7teVbZIFkIwjSokZPPr48i4TdYoRrL?=
 =?us-ascii?Q?En3exiVaBI4vZG1k72900/yfXWP22swxejh3LqEbIBvEn/sITEkP4Mpl0Jms?=
 =?us-ascii?Q?C9g6jCML1qm2JBRSk+S+eBjW0wQHBt/P55U9ghJzmPP6TXNtYW5dupRiA57+?=
 =?us-ascii?Q?7ejOqka3DapjS6iw8TgUIRIpu3eZTVKOwHWte7f/3DglCZ7dNYwVU2tC15dU?=
 =?us-ascii?Q?PssuFcs2YtEioG2ZkqsSUwwQ8qfqjyE9W9NfoYpY8VwtdO+nX4b4FTRwjBJT?=
 =?us-ascii?Q?/v3DIOlE/i4dYPl+uxyIAuU+LCK6PZDmfjiZHxhRlsC9e+LahuwdJ/jD3GSX?=
 =?us-ascii?Q?6WjvyJhj50a/1LJJqJ0CP+ihci25fjyvWMsLsocHnFihwkuQqk0NG4+YfQCd?=
 =?us-ascii?Q?IbIFg7zz8NOnBDBCtuOPadxeHYwCKhJXhy9hFEBgImJK6euS8MKI6PuYqsGB?=
 =?us-ascii?Q?LpBcGY063VVGsXcAuTXXqT/SaUG6bSdvZpxmG2ENNBvk8LsfMTubguElLfRV?=
 =?us-ascii?Q?vEDmiR1xbsxtNi8m/juG5PyquvRYVWxWPOwBbwTIlcDIswONUKm9Xw7eL7WV?=
 =?us-ascii?Q?mqExO+Ijoi0M2nZDWD/U1h1edsr4+0mv0+sqnHeGEG110Qc01J+57lQlV0j5?=
 =?us-ascii?Q?TbCLAx5o0NjzRrSmzZjrVbusLXFXEXqwiqvWfuf0sMDJnV1DIDtU2CACCNEW?=
 =?us-ascii?Q?77j3XuNzJvWPTbNLBbnep8wPh/SSdEaKN17BSSlJhHzBVQHDfrrh8orzG6ap?=
 =?us-ascii?Q?glDSl/zzRckmE3gL4jTJtmEZaIUrZ2ov7ANhTMf82LKjrM19Wcj3IeFUmUFz?=
 =?us-ascii?Q?ajeKU9jZvBTn/m/xQ5iQ1cdRZLe6HQycMxdYfqNquBvYaaX5DmTAPged2tuq?=
 =?us-ascii?Q?PU1mymsb2L432VVvT2z2zr6slEdSpi8f3/U17l4obsVCgp19Tp6hsCCd7Lgq?=
 =?us-ascii?Q?IFfyB2k1MSjZlpCVr2kAv7jGn4ZokD/iL4tzb3CAN2llx2ovlmZyVph+G6/G?=
 =?us-ascii?Q?PN6+8qgJGu3SEsdotSPHbp6Y0AmmN4HyrReRrWNEnkaow6LQRztnYbEc+qKa?=
 =?us-ascii?Q?9zlLjAIXN2vZmvbgxGsj0BMWfPYyfGrTcNRyyt7xMMkt4SvP6f6vPilMcme+?=
 =?us-ascii?Q?W+x76n/6GAvEpG09SBr+yGdZy2QV+6QSMg6sHqzO4iGN0TBsxT7P285wFFrt?=
 =?us-ascii?Q?cm2g293oJQaJ3xPas4DU+CAfKWTUeofr74d8LK72O+wi75sFLW4Z0FXe0zbO?=
 =?us-ascii?Q?rwx3aisD59SqlqkDuL54daUYFfMcegF8VLCbDaF8wlMtPbRbOM7ut4JtC1s7?=
 =?us-ascii?Q?rEoDvWCzmHgx/2+ajlkzG2B3HCFDU0fTJedkzaVkorzANHdQTTdKOuB03sP1?=
 =?us-ascii?Q?GJg4roElTmDYQcMZrWnEMvh5iVeXI3ntXs2AwePyYBVbu/erofBSIYhNImRl?=
 =?us-ascii?Q?uFkdDb/dDi3ZCr3qaSBfaqNow7tiq8Z8WDFCT8j/se3s8o+lBDMrNYbnzxo+?=
 =?us-ascii?Q?F4eo4iNcNIkk/54HG3HRJNUrUS6nRpA8+uH8fMrckl/n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b376770-e93b-4c24-be8b-08dd7fbbcb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 03:31:09.8016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlwmLOgSXilxM62GVz0+y/wIwUYoNo7H15eFSKCsOpks7mS4dsZsVEeiP4zXr7FOx6LK3ZHUPlDApPb5KBb/PcVnm1vD17UkX1HeBRuXRqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0956

It appears that when performing a rapid sequence of `delete_device -> new_d=
evice -> delete_device -> new_device`, the `dw_i2c_plat_runtime_suspend` is=
 not invoked for the second `delete_device`.

This seems to happen because when `i2c_dw_unreg_slave` is about to trigger =
suspend during the second `delete_device`, the second `new_device` operatio=
n cancels the suspend. As a result, `dw_i2c_plat_runtime_resume` is not cal=
led (since there was no suspend), which means `i_dev->init` (i.e., `i2c_dw_=
init_slave`) is skipped.

Because `i2c_dw_init_slave` is skipped, `i2c_dw_configure_fifo_slave` is no=
t invoked, which leaves `DW_IC_INTR_MASK` unconfigured.
If we inspect the interrupt mask register using devmem, it will show as zer=
o.

Here's an example shell script to reproduce the issue:
```
#!/bin/sh

SLAVE_LADDR=3D0x1010
SLAVE_BUS=3D13
NEW_DEVICE=3D/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
DELETE_DEVICE=3D/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device

# Create initial device
echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
sleep 2

# Rapid sequence of delete_device -> new_device -> delete_device -> new_dev=
ice
echo $SLAVE_LADDR > $DELETE_DEVICE
echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
echo $SLAVE_LADDR > $DELETE_DEVICE
echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE

# If we use devmem to inspect IC_INTR_MASK, it will show as zero
```


