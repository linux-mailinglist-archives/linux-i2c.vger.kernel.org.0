Return-Path: <linux-i2c+bounces-10500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 348FEA9476C
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 12:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D0A81685DF
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 10:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01101D63DF;
	Sun, 20 Apr 2025 10:18:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59E15A86B;
	Sun, 20 Apr 2025 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745144328; cv=fail; b=J5B+2NgH1Jp3c5pc4DxtAFmrlm2RX6/ckwYnc46y1jN10bKPLBzQA8b2t/Bl9kRdUe9F0eAkk4BjAYOpkVUH22p9PayuElRPowkS9Rl5PFXtdJiKVsE9mKD+YLTMf2vO+UFn/FxU/SRY1nkqQ+kQIOeO7p5XU61crJaF3ZkM1hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745144328; c=relaxed/simple;
	bh=YyrZLc1Of2xFNI5iL3uINLillvV2e1GCAqeA25FuobY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PBsiCATon8A41Z30LtkOdDVrNu0AyWwUOxkNUpze/qW6Ybo3YCC2pQoykWUPnjPgEChHsHarLFi9tqSi6xbjDjYr4Gw0kzctOeJePmFERyHNMPkHH7fAkKIIMna2XpueAdqycpxKdJuh4OWLcOZunVydtYifPbB4Nq7wdSlSmHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/Z4UQFi7zQbKs+gxIpBI66XT/yar5eFA/1I/hmeKK+gmLg5bch8N201Irn4KRTnCni6aNx3o4emmT1izYgvUWeQmXpzv37ZUNDYDehU1yaOGRLhoRUT2SR+4x7PduTJHH5HMHtX1evVpM259kwFJ0BkOajaDrsRUZAJcXSKA+GwmO95lSABon/BaKRoVUEgsOr/3T4yzoXvuu5BzVoKIAIrl24kVvr9FFnTBD812qszV14SMtz+AxjPsII1RdS9XKdSuu3g7N0/U6NjfIk0uKea0pz4KkiZisdihkdOdbvFm9oCSOFBMG95OxKsVRnL0ibgTqSlddn30Rfav+kRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyrZLc1Of2xFNI5iL3uINLillvV2e1GCAqeA25FuobY=;
 b=cJEJzE6aNIXEMB9WzI8Q+d1yDzPMfw2BzEpu44lgf/u9AQjFPS6cbFduaF1Ummnb58iIdnIsG4N7ap3whQjBcCYaPIDcPGc2vAFzrBVuESp+yz+M2KDh9GzK1Z5Zcv9qbX+OQXDxnuV3geYe/RKmieRnDz5x4RLVyz5XvR9uvd8w/OO4/R/Dlrjm/X3dkwzzk/bcCmTsfsguKtvvfKUkneeBGtjXgOSpeFtp56h64KMy+5AUv79/cZ1dO5A66tF9YiWmXZ/y8SPyIx1YkRLz4K3KSh61gHbDUdPBNLTYb0XYB6kaP8enPPjsPpSYRks+ibYxBvYNL/N91X5u0ynn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB0987.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Sun, 20 Apr
 2025 03:44:04 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 03:44:03 +0000
From: EnDe Tan <ende.tan@starfivetech.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"sashukla@synopsys.com" <sashukla@synopsys.com>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"jsd@semihalf.com" <jsd@semihalf.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"endeneer@gmail.com" <endeneer@gmail.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
Subject: RE: [v2,1/1] i2c: designware: Add SMBus Quick Command support
Thread-Topic: [v2,1/1] i2c: designware: Add SMBus Quick Command support
Thread-Index: AQHbq44WAfmkCjLz5Ue3yNREoDdfd7OjOH2AgAi6yEA=
Date: Sun, 20 Apr 2025 03:44:03 +0000
Message-ID:
 <NTZPR01MB10184AA3B7E4D1992E89E73EF8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
References: <20250412093414.39351-1-ende.tan@starfivetech.com>
 <7b619cf2-8f50-4f6e-9a5f-cce9112a99b3@linux.intel.com>
In-Reply-To: <7b619cf2-8f50-4f6e-9a5f-cce9112a99b3@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1018:EE_|NTZPR01MB0987:EE_
x-ms-office365-filtering-correlation-id: 5f8990a5-0982-4111-f23c-08dd7fbd985c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 lSo3wumUCCgqVYI7NaepGmLd84oWmqsRhZXZvdHYt2ernPHoY9pKK7OL/QOxRkfVlkViqgLQU2f4+QP9UMz+P5vnzZOLN9kSy+AQ+YJTtxmuNUUukGlNDDNhjvM8PhexCpeBFA5Rl/TD2NX0iKwi/mtO1Cn5mjN6ssiAlhDEerI+kI5A4L4kQwGg3SXU0uX1E0gwfH/7Uanqf2vf7gD9234WLyHSQtwJuK1AVVooQVmqxMDAnjOomM7GfvPyqSigcykFZZeWrxltx6L8zJyjixremQ1VpoIoODxFn3lxW1groUJ+2RcCxHBJ63Ebp3cQebyeFaY3QA6lSCLDWw4UX71SciKr5nhZRJ87FQNJRjgN5a0w/3dnNL4bSHTeiicZlb1U/GLUU6IZs3TeBQsCvhP7hJQ4Sz3QulmO10bLvWKLN2LHfv9glQoQfpFhvLsmz99bbbYRgmoLk1nwzvGdlmU6WUrLFEFVVmUxlJnITMWov4zqCFimuU45uus2Ef1/Lois54FxVPd4W8zuggX5wA52qblW/JqyTN1AFkMV4KoCljbSMDi4ubbKwtWJOLy9IwIFGy7sbjN0g4k/ynhU8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2hl+TD6kACeVXLZSP6yhUS6zBroHteACL/sbMH6sPj9vBHtNSC2P4Tm9cwJm?=
 =?us-ascii?Q?4krOBBabLG6MdvGsaRyIWpbQQDMnDOulzM0IzaSHEkGeAIzdGKCFChObJfJO?=
 =?us-ascii?Q?cjOmnaNcLUSzHaU0kXKsbMdiNKWZIgH9ChfUYSQ6sW3aEcBcxM5j02JfELf5?=
 =?us-ascii?Q?SATNBDYKBDc0qak/UUejPFKnPOCAaxlfNs/lNCjlybUuEbjHxLG4y4t2Rfjs?=
 =?us-ascii?Q?AijrDq+r2CxG54i9K+Jf1UuKeSXqNQ4sQk0pZduH4rgDAuGNura2ZSAFvf8H?=
 =?us-ascii?Q?KnBYBkdWQwUZcmi6M64alaNQcwpWpf1eLgo7vC6tahvJydh3TaSvqwoKY297?=
 =?us-ascii?Q?zAko33z95umIlynfEwaog/CCVF4tnSsBPXMfPfSQlvdD2e/tEcd9FZ1P2PTd?=
 =?us-ascii?Q?N2vQ3/om99Hxm4q15LckWT53pz0XCM4uxizJMy8hTK8rKcbIs6+wOs/Xf0Bf?=
 =?us-ascii?Q?fEuQ/dIeiG/N4T9VL3dCo/tPgGDFJ4P8sCrPFRAEWvLL9x2x9jBwRt2P82/r?=
 =?us-ascii?Q?BBTKB9TA6NXeQlhhgfL3/uQYY31f7hAneEfPJlagGQzrTNmDdEDlfEnsszd9?=
 =?us-ascii?Q?+BjQXJR+vUisMYPidkkaqjgJamiog/gCYrgPab/oXSJvWok2RmpNs/xOQDi5?=
 =?us-ascii?Q?UuFCqxPmDHFbT2/hiO7IpFWZTCP9/wcjvMWEGc4+1SAe+SinAhQ3bBS3eVLk?=
 =?us-ascii?Q?b6u+8eAS76J4jJEVQwYMlByqJwiTTUIXhSwhd0pLtwws8+ys5PeAcXRA7DzY?=
 =?us-ascii?Q?+mv6IKwzaYXAbdx06MJ7rQXqO38VZzam0aiilKavSsges1xQgJteZxNjPJyi?=
 =?us-ascii?Q?aFV6nWmtuQVWoYbfyUNd3bnXxon9HomBS0pCQHf8tVjsd3Xc6OUM/EqLSsfp?=
 =?us-ascii?Q?z9w2Jc6GlB8FxhvPQL8Olqn22oZvNkg3YAgZN+v5Wf4GIIZKFbNZtNrrgZST?=
 =?us-ascii?Q?opBxEkX+3y3stGupRpUdRVZ0t9k/uKGVo5EMA3QQcwH1ixiNfXJqIYosZUSg?=
 =?us-ascii?Q?IfJ6sA0vd1uh+cLUNxUuOVkdWhXqxE1vbcvJ9iwyAOsaH4AM7Fq3YKHCatlG?=
 =?us-ascii?Q?LUo9+MHIQDdY9LzAlAUWT9HSD1KkZkO6cQSQL8Br8yOsYj3zDB0rYApy04yM?=
 =?us-ascii?Q?qklCn/SGI+wQVxD3HWjLqPi3/SciUh3CZ2dTFRSMSaAHQWtqsfrYmpBjiU/G?=
 =?us-ascii?Q?emiLFqP4rObG8Y5EquGc5P6s0CkJUjElqbU09AG7LVDJOoYzu1OySfh6Yx7c?=
 =?us-ascii?Q?YpayoCJ9o6qIj/jv069MTEmFCW0V6vD5Cad8u3fcRM8BUzhpMOh2q9nOmV/g?=
 =?us-ascii?Q?z8x/aOM6QrmAKmCB4LvNhPWZThFOilBz71VnsRMX6mvhpOWvEc4PLSkrd61J?=
 =?us-ascii?Q?Mb8d7+mQYxjSiR38oHbCfuUagp09gwYR19/eWwX0u2kf3BKgw0OyFjGMTygC?=
 =?us-ascii?Q?dF10JfNZt63AEOcU2q4zYvguRUyLshOolQYPPbPGymGJuvTC1CoTexni39j+?=
 =?us-ascii?Q?d/hknBGZAIMxpJJczVSLRqi6x5P8LME+eKU4KmtyJJ4uwwM+IewFTm2rmv73?=
 =?us-ascii?Q?zOYyWsZ1Qs/198u0X3uNR4CrFXscscpHTb+tej3GbX/kqV7XmggUrlKkD+Se?=
 =?us-ascii?Q?0fFIiPC2ippHDZ0wW+1tQvbBWSXBKT5zsVf1O2WuTMrO?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8990a5-0982-4111-f23c-08dd7fbd985c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 03:44:03.8170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEjjHoHN5LGxBNrVV79SBfPsiNAnCI8FJ553I6s83lWfFClte9rK9Z7yNykwsr9bEVt2AFEOTTxum5odVWbTbHSy3TspFvvwz0Z1BtG2Vys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0987

As SMBus Quick Command support may depend on the IP version,
and given that it seems we are transitioning from `dw_apb_i2c` to `dwc_i2c`=
 in the future,
I think I shall leave this patch here for reference in case the `dwc_i2c` d=
river is upstreamed later.

