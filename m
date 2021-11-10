Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD6844BABE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 04:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhKJEC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 23:02:29 -0500
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:63988 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230172AbhKJEC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 23:02:29 -0500
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AA3XNe5019384;
        Tue, 9 Nov 2021 19:59:39 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3c7xp41u1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Nov 2021 19:59:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABFzgNzo1Cl3Ipx2c/3mtUyBJZdT4JFPS1GEElmSpBWEq8jnQGEU7FFhA2U5dgG6ZXPNVLEthhaynS8NUn0BLF4EBOIrAZkUhHaTxWP9PxLo0KXAPoXeqmFJFYHsXD5to7O7WqQdpYtF3gwPfjuA8HfdzzVPkJOVXZTFs+JV0j5vINcS7HQLuhlYpbLb0fQNv3cMsrWchKhcKBl9+AIwjOiU8hcxsq9DuY4cFHe/xqtikYgYn+/kugtj+S6pmAA+XVyGrwJ+XtKQB1ceJAZ1wI+aC8vd9Ys6+4muU/XfQFfmSKXpN9ZoSfL8WrfeEZvBdjdF5xGXnd2NbVhPqeevQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sipHoMgnP/FIYVT/lxNx6WN7DYJjWahqYC8YXJGjqkc=;
 b=fWm1VPC9bFZiCwxN5uroiyV9P/81VzxAvApHkY+WonN1PNqUNoMZPjOfGe4KJt3PYgpQeG1kg5oh7Rhj46by86wIPdAx6vLQ7b8SBDZX804snmFDf1jUxHDfGijKd5xuqzGvPqkQwBUyIvFLOP9qfP7q8upTXenYm7tu3LL9wXFNT0ylLAFrItKvJuil10De4TIKbnHn1pLKPuwwUVOO0hKGcaa4N8wOSeNIBQuUS/hhR/8FON8kL483XrJoiLed4iFep3SRNu0Yfph9p/VwLaXDZEO2tcBwIGIBCXryMiLmCHD4pLIVIQQd2uMjl0WUPN/nLEBQYa+fJXTGsO0ywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sipHoMgnP/FIYVT/lxNx6WN7DYJjWahqYC8YXJGjqkc=;
 b=mt5uDpVJJn7VaazoWeJQWXmz9sRJMKpiMDPZ7Oty2iM8foJFlkr2+sdu4tfLNs+85EBpUEuf6iLwLDd9ZetIbM3JZzGWQ8PtY8xKgJS2Q2OUKggkk4AiZZkMVLtuRBXTLuQqxjN0A5cI9ZbCBvtbC+yXmGWG28W6xKKaGnRdg6c=
Received: from BYAPR18MB2679.namprd18.prod.outlook.com (2603:10b6:a03:13c::10)
 by BYAPR18MB2837.namprd18.prod.outlook.com (2603:10b6:a03:111::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 10 Nov
 2021 03:59:35 +0000
Received: from BYAPR18MB2679.namprd18.prod.outlook.com
 ([fe80::41a1:a7d1:fb3e:2b65]) by BYAPR18MB2679.namprd18.prod.outlook.com
 ([fe80::41a1:a7d1:fb3e:2b65%6]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 03:59:35 +0000
From:   George Cherian <gcherian@marvell.com>
To:     Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: Remove Netlogic XLP variant
Thread-Topic: [PATCH 1/2] i2c: Remove Netlogic XLP variant
Thread-Index: AdfV5yrz8Iaojv3wTwmvZywfZuf0jw==
Date:   Wed, 10 Nov 2021 03:59:35 +0000
Message-ID: <BYAPR18MB26790ADA1AB03F410EC056FAC5939@BYAPR18MB2679.namprd18.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db7f81b5-b3d2-4fe8-6116-08d9a3fe8255
x-ms-traffictypediagnostic: BYAPR18MB2837:
x-microsoft-antispam-prvs: <BYAPR18MB2837B911D1A1E03A5BB0CF32C5939@BYAPR18MB2837.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:352;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EnP+PiJ6aebGJqL9NjcVgKZuUOhoxBptLpaCl34dJKsLFcM8gZn0iiC1HIddN2+nm8de59l22O/Hwv408oMK5jdTTdX+0WoCB9VEGiDH0Tpb/ZvOHyrLG077gD88WD+JMYt8Ti21O80KYQf5RbsUKPUDxzqxKgD8I5UYJ1DImh8ojAWSv9+u9Umgr3ZgEdBSuIELB5n4pXu+Ri859iKBIkiqnepvKRmm3BXUq+IJGyJEsdYhEz16YDNL9QzMNzkQZpY3BmZkQHhW7DBUtGIWYpaXnzKbAiJjM0YaDhAEDMPpNu9DawkRVZ77hZkz86inKe1c96n/1cUYkZF0iOBe9gALrQG4WWCCmbUPj07WdiP1pu3Lti0h0KIqrWpQmav2GwpFrTC2Sry83RlrGgbDuSSk1+AxQEJV1Hkbbo2rIH3nw5WEL78elBJzyP9CqsfzF7/0t0AUIzWyr9rlGQcN3JfRu25aq898ctbq2KQWEhBDFRXBSwPIJdNA4pf3tcE6+MuyVGcO4MyG4uJ7stp3F2Atd4V3leAJksbve0Tj7LpUExv/Q5HYc64MaV7Fh+shHxpUcF+S5lG13KuTbABhYRR5xEDJ2bw+KTksS850op/QBkjbwr/kJ4SMLGADs5pIwq1Q9dxmqQkcOoL0jFwOq3NsId0NJ8/QZ68eCf35IJ1faSQ4Te8vWaphoox2WNAo9gIPZ5f6Ide4uqXZY2t8xA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2679.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(71200400001)(9686003)(86362001)(186003)(52536014)(8936002)(4326008)(8676002)(66556008)(55016002)(6506007)(66476007)(5660300002)(2906002)(64756008)(66446008)(33656002)(66946007)(26005)(76116006)(55236004)(316002)(4744005)(508600001)(38100700002)(7696005)(110136005)(54906003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kwDD4U9i04DE3VtVdTl7Tt+fJn9Hi8cfMObinzvD6y59XnUlintT7B4t45XB?=
 =?us-ascii?Q?4cw0pUO9n4j+KYqDQQUI+mnK8OoE2Br2+5+E6B3afmoOLgHJLArEeGQW0stf?=
 =?us-ascii?Q?uTaW+3jAb7A51CQGt4Df7O8nrU+W552E4a6OGF/w6SKyJefgXvLwgcxFKd0q?=
 =?us-ascii?Q?/oeKdKNSFw5vtroNkumRlPCllrxtzCDQV13xV10er4q/6th2nqRyQblfh/Kn?=
 =?us-ascii?Q?FcddCQf1ATyMGgf6CnqtZsM7hhXA7mZj2Ue6AjaTPRyw1q6jIJbZNxA+661P?=
 =?us-ascii?Q?q2cOl/CR6dwQ8R3iBOwRP5aGprrNDee4z9VN/HlaRjD9742SFDJ1Uk7r03uc?=
 =?us-ascii?Q?vrlWTh8ukcanT3SzSagvLJVaNbIFJ+3gfCI7/sGtCtL693jsFlAjEiZC7nel?=
 =?us-ascii?Q?+9dzuEQohm3rVct5ZIh6XpiJp/bsl2dJFF2Zne7ObLZYjzOwly7j8f1bPww2?=
 =?us-ascii?Q?p1ha02ARVUGWHoWSM81h7v5kd/+RBedoWUC0/a7F3yETi+UD59OPeyQGuvgZ?=
 =?us-ascii?Q?oNRPodqJXi4DFBiAKriL6uUP2aEX7qvK61zZk+FqoGmC1GCw7MB2IeEIbBd8?=
 =?us-ascii?Q?MNXOSRNo0f+MDMasVTrQJ+2wxHf07VUljyyPioiryWSgKEOzuq7dKkj8JrfR?=
 =?us-ascii?Q?Y8XMQYcGMeFuH02UqVrSsFNgO+ZEj0NdxzuQhF3T5B7xy5NCfvBnbSFEfU2f?=
 =?us-ascii?Q?73+rSG4qhH8vpUXN8NKI72eHJzupnt9PZuuoM25x0XX7ls44zNLX9LTcdY9c?=
 =?us-ascii?Q?nTU/h9V1BlBk2FLu9xbUnGwLTOFbE7a5/JwaaDGFimPryoFjhluyK30iawjG?=
 =?us-ascii?Q?yl5QBz0imVfwZsJzNhv5M+FciY+UCqv0dtPTHdjfBD7JplpLntrzCnoWBfnN?=
 =?us-ascii?Q?0XTIQLU58D3Tj9zTrCt1ouQf46nkkgKpCRfPsUHyEh4kunISfiiX11DqiO1u?=
 =?us-ascii?Q?3GBt8zqGxjIk2m9RHZ4aZ9RSH1KCAFxo+gqXopaQA5bOR8DfIhduozwxdk+l?=
 =?us-ascii?Q?qW0ggwLvuBSbcEUJJyZfgFKVd80HixpDJG69VcFT+BBQz4rdgHenmINeyYKV?=
 =?us-ascii?Q?OpKmu6A6j/y6VrGYBjY5EdSH2vSmZ88FoNqYfSSa1DWqWN4TxrrQ4EwPNpj2?=
 =?us-ascii?Q?4AtP+sEz8Xs1arF+sTcIpH91zOtMS/3Uyqsf/W+lR+OMkTOwRm745Zhrfdse?=
 =?us-ascii?Q?jtV57MYUMzDU0Syg9wNeaQlW6myeUEWFW7kwRe4AoiMWM5+bzzKN2W1bQG39?=
 =?us-ascii?Q?IPAdpBZCtcz+q3PUffTXB8S1yl/tvHOn+SeqD7zaupkJ161AvWIZEH8GMh9C?=
 =?us-ascii?Q?Qb6l/CP07ab7sUeKF6qBKMUwprih7WaSrX6Yi4MV2Beve+U4eQEvq0KoFkDD?=
 =?us-ascii?Q?LceC84lbhT+99LuFXRCWtO+OH7KjFJZwMzwuOyv9VNe3iQXvvSgDnbUnbY6x?=
 =?us-ascii?Q?Ptc9B7G5nGA4TdLzhyOEEWyDtECFU2NdHI8YzXDyauq2gVUgJS/iYSbS/efS?=
 =?us-ascii?Q?S9w7G7tb11/0SosPmg5yNaTS4AwmkyP2qMfKMu8N2/0T60eQOneV1vaAzWAr?=
 =?us-ascii?Q?m90o6xOhh120esPoqtyY7ilCWPVdsAuQi1JTFOb0KSemXjtkh8c6lAItJUDd?=
 =?us-ascii?Q?Z1i7VlWYhv81AvvkQCHJgHw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2679.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7f81b5-b3d2-4fe8-6116-08d9a3fe8255
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 03:59:35.1750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaidUvECOmdb7ZFp/rJNBKnXh/4uJcXbMjlDXWCTA+nIDAXn+leV/SgrvkXMtfvK51HLvOulNcfBeHw/IccbFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2837
X-Proofpoint-GUID: K_FeFRdY2vUSxCGfQ58ZqCS9J-A_Aso_
X-Proofpoint-ORIG-GUID: K_FeFRdY2vUSxCGfQ58ZqCS9J-A_Aso_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_01,2021-11-08_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 09, 2021 at 10:16:18AM -0600, Rob Herring wrote:
> Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
> support"). With those gone, the single platform left to support is
> Cavium ThunderX2. Remove the Netlogic variant and DT support.
>=20
> For simplicity, the existing kconfig name is retained.
>
Acked-by George Cherian <gcherian@marvell.com>
