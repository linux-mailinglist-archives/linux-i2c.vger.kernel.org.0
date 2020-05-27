Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6372B1E4004
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 13:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgE0L2C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 07:28:02 -0400
Received: from mail-db8eur05on2082.outbound.protection.outlook.com ([40.107.20.82]:45153
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725883AbgE0L2B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 07:28:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJmRpu/hb5+ayKVywN3a+vnrqCRisD9vlF4TQt8vDaCmJPBdrX1zLcRP9mdlqJzQ8CDc+T9EdTrXVLmHCIJgCVfC2dQxDVeigvJ2Qnn9QZdfgAbp0gki2L9Cp5qxtjXYEFVsclkIC2iDK1rdUkS1scaFOcH5pCitRdnyRdyoOq6fE4GwWJgbE/bqDX1/0W2G4Taj7bGovkO5p6BXwChMyllUKdjIPPgFnJOh2ypQteBVxBIcuYYYLsQjGsH69GI5AWcqqZCTdzpAa0fa2jrk8Lmfya8FnARBiZ0PdBEebL5qj0cPTDS5gt8Z8FdTlSS40x8EKHlA9qwJ7l8JQ59FIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT0GukeElKYbB98PcWdMfP//Sij0YgNHAYxGNl4QhPU=;
 b=Pdh/Jb22G3g/6672pJlRPDEMI953/JkkSYHL+GD7k+81Rr4+phgyXzWfBVnzi216a2AtOCob9KWxGCTHbWkbWP4afgsgmBISUrktxBrVu9RcNAlSxFq46iphGTTxeGaMaymxvVxdie2FdpVlEevkNXa0zD+2HCwTK+JFQf69dlx0jMbfCFB8BQaU5zmT9n4xUh/0xAH6UD52tdvSy0HCKcsl4vg1pqAjA25yyaSW/HDKdYUaBp0vxucp0P7pmMWR4v6gabSEJUrerGoPBqBL2e9oDjpuxIv6WuSHCCRuGGEGGqxTWx1bTCYPzrTTDLCBGFAJ2WTsgXdc+SdSR9GBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT0GukeElKYbB98PcWdMfP//Sij0YgNHAYxGNl4QhPU=;
 b=rbPRGHIXrdDOtnj27dN/IL5aN/9//he5Zy6I8W1eJQyWhi/j5tBfqCIW513eiA0ikCETY5CLoaol0+kf1+HPxnVq2VOP0OsIH49CYqdqEKxMTU/B7Hudb7A+SJXt5WufFcFtzIDi0hPcH0TYDotpVDNp9Rgt7J/Qq5HA0Zbisd8=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR06MB5970.eurprd06.prod.outlook.com (2603:10a6:208:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 11:27:57 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::4827:5dc7:d31e:2eb5]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::4827:5dc7:d31e:2eb5%7]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 11:27:57 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKhOcmGAgAAnv5CAFgB+gIAA/BRAgAA+l4CAMnEssIAkGs0AgAAEdsA=
Date:   Wed, 27 May 2020 11:27:57 +0000
Message-ID: <AM0PR06MB5185C1DA8133409444A397E4D4B10@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200401143254.GA2409@ninjato>
 <AM0PR06MB5185F8F51316FCD5213F0ABED4C60@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200402092813.GA986@ninjato>
 <AM0PR06MB51857F4CDC7AE643CE160F9ED4A60@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200527110732.GA4875@ninjato>
In-Reply-To: <20200527110732.GA4875@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-05-27T11:27:55.3815783Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=2cbc8feb-cadb-49fd-8d63-f2ecfb2ef614;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-05-27T11:27:55.3815783Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=2cbc8feb-cadb-49fd-8d63-f2ecfb2ef614;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
x-originating-ip: [81.175.223.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2338f45-523b-412b-9268-08d8023101a8
x-ms-traffictypediagnostic: AM0PR06MB5970:
x-microsoft-antispam-prvs: <AM0PR06MB59701D3D334BBB38B6E1691CD4B10@AM0PR06MB5970.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AU4ksjSG+kJdMubgwBTz+GA6afltY/lanFzCX1tYAtO3eqTpLgukqkxngvTEJj+s0QuP8SLohCOZuJy9jd8WrhWUdoeMr4twF5NzRYIvvuQYeZaUKg0XwlWg5IGsZuucXbwUK/c8Nted0HwXyRImd20f32w5XrMdhrmAQ6uH/iqiGuq8XgIlrW/oyUcxd85CvlO5nT7pEU5Qsu306uPZdm2ERu9A+L+GG+hG4l1xQ8pRAED6yGGeSQLeNItdBcjmwRsBo9JZ7cweCLHz9sYveEyGfIQj0KA3/PQH6aMnMVkdp+SQsD6EXAliOATuC0JIHPGHqS6aoCva1UTeUB8B7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(39850400004)(366004)(346002)(396003)(478600001)(558084003)(8936002)(76116006)(2906002)(6916009)(64756008)(66556008)(66476007)(33656002)(52536014)(9686003)(71200400001)(55016002)(8676002)(186003)(6506007)(26005)(5660300002)(7696005)(86362001)(316002)(54906003)(4326008)(66946007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 6E4ro5KuWsebrXl+PF1Keezn80C+L2E3og70fLIpSseYtsI0F11erif0ZVi+p5mBKcTqOhzhXy6EABCb5UiJJ73f7BvPQ/yobkH3qyKgjj6oD+BGcXp9JK5EO5ww7JrnVH6n/UIQwn5sC61kaKzFe53sTxy1y5GEcJB/kivvEVC/n0Ukr9iPdURnjmDiWQKbAIg6uWdrLrNkw9696I7crt4NJ6gmoiAj+FWAuCj8iNQGBZryDzdQfRAjtoB7DPz8JC5TZd9m8KkR9DI3fydH2fBlWfUCmByMq3KprFiYC38fmYTVjidmLnsswSYsuTQ6bCjVo2PY01T7TkwlLEJrOTOwNeKIufh/NT5jO0/vZw32Nav5OuDeGsKGx5qUbWx0VE1oEqEP+BAsNjeVtGB6UGU6GqS5dTKyQgM0A9y4gRHKlajn2wHyqHfqJ50DlXCSW68Kq2NWC7tLPfRXWkDtugQcjWNq7hgNEwSoCoCoeB0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2338f45-523b-412b-9268-08d8023101a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 11:27:57.5464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BM+TiA3yN1/eWq7AePTSfiXaCA9eDCB5dvHGFuE4CM8ld7UhFvar1gxWtCyVbLQq47NI4sVIcwj+put+/zI5zhT94YThEyZVOJg7I3GDxFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5970
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Wolfram for helping me out with this.

I will make Version 2 patch with proposed changes.

Happy hacking for you too!

-Jaakko
