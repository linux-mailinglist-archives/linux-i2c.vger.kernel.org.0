Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F241C3AA5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 14:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEDM6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 08:58:53 -0400
Received: from mail-eopbgr60040.outbound.protection.outlook.com ([40.107.6.40]:62523
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726796AbgEDM6w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 May 2020 08:58:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akGPjmMl5LkEV2Q/zH5Nh3SxesSuJN1gZLOEiTM04ueg6HTAShRRoG/j/gengug2STO5NdkhYBgT2eoVWRWCYYpVbUvgdd+1sCTDfZwAMIXO739WycnhOplgd69EyDxVOo4Kv/p5Gt6+OF/6EuGc9Zy4L4bmz3Rn7QGejxuK6pU1S9y3Qa8P5AWYyJuLOkn8W/bG+/4Oqwu1G4SJfl6SsiSdM/e/2iY9bNH+tmiomNRsOBIlVcYNiXe0WfigMICV1mJUfCpiIvq8oEzjjr0LiX4GfDDMkukC3bv3iiNv1OKtbhmgaKRQc5VnVPkoyswhcUBILJGfXmXd1POkJRL/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiwF0qMP3FMNLm9skR2NsH55fIdWBNn20IkfGW83JKo=;
 b=R+tJ2/6owm2cLHqLF/NkYNezpGfUnraty2nnGdRNV3xG9n8VeSHgdrfK4Xabnc0qEe1+IjBi2xYn0AfZyE3zLe75ILQYqY1A+odJ9c28J7EZQds/j4xtfGhicDSvpCytxNajMWvzOmmAw/10cMvIy/T/reCSkMVi3NhnC0zkXbLCgGHLEuCVCjfWdfF9NrLlV+UdqxrmjGlva9r2RMDKso4R0odB8eh4FA3xmUGtdQ1ZDT1lDlogP9a4JS12I6kcpbnfQmHCzXZBUeqOpGfo5lgTnCMGTHQTVHgzIYk6X2rhisISZBJPlAd0f6sDnhh80BD91oMcnnoo8Qg7dlTJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiwF0qMP3FMNLm9skR2NsH55fIdWBNn20IkfGW83JKo=;
 b=XQrQ+2K0LAIiJRL3oCRsNGJ1Tsozn/Nfyj1GicqnDBmarKxF00TIJEyffT6Hr/CtuT2qivP7RqsNW6D2ASI+u/6ukYg2zKrekTK5PLzOmBlWa1UkXc49DfdN0/X/n+8RdFxg33OFF6yLfEIssfYD0WgnLqReyk6jtS20MLPKgi0=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR06MB4420.eurprd06.prod.outlook.com (2603:10a6:208:bf::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Mon, 4 May
 2020 12:58:48 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd%5]) with mapi id 15.20.2958.029; Mon, 4 May 2020
 12:58:48 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>
CC:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKhOcmGAgAAnv5CAFgB+gIAA/BRAgAA+l4CAMnEssA==
Date:   Mon, 4 May 2020 12:58:48 +0000
Message-ID: <AM0PR06MB51857F4CDC7AE643CE160F9ED4A60@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200401143254.GA2409@ninjato>
 <AM0PR06MB5185F8F51316FCD5213F0ABED4C60@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200402092813.GA986@ninjato>
In-Reply-To: <20200402092813.GA986@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-05-04T12:58:46.5802889Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=0b51210f-13d4-484d-b397-ffb4db30a687;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-05-04T12:58:46.5802889Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=0b51210f-13d4-484d-b397-ffb4db30a687;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0c1f6e8-367b-4d21-211c-08d7f02ae313
x-ms-traffictypediagnostic: AM0PR06MB4420:
x-microsoft-antispam-prvs: <AM0PR06MB4420116136803AF9DF460032D4A60@AM0PR06MB4420.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03932714EB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UwY4aY3CVZmLXsQB+Z7qdQ0HPL33BoUlIfIVu2HZDUY2CsPFbCHSFtqQjY/DbXuYU/3Qe8ssG116f/roNnbkQg5VodkHfOvBsi5WVcD93BXXWZYH8ZS+NkOmzGPU1txrJzcNClx3GfgRqUTOljwqxFeqAu6/gyNkg/LGkUqzZ9+WI6vKMJjunmyqMSi0LZYYJfHJvzDejRzedMiqTJ0Obgcc1RcBkamms90jyrTdKNUPE87ubydSOBDYpqTOXqX+VuL8s2euNEHACSwsyeo7ivAcigYD8fjDrIrGZQiU4QzhWLy0ZMPlR0XIxEuPz4Xf3K4KzG6T1hDo+4XvHB5REpbllQgMHYehpR/gCMwSpMtezW2k+5FUmmggXAVVreqqHyRIxGRfSOb4kET3TDRjFFmC8zYP7nOBhYXlh+8EwLUV2dhz8Mj4JeTGUsWeb/WK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(8936002)(54906003)(478600001)(52536014)(110136005)(66946007)(8676002)(76116006)(7696005)(5660300002)(4326008)(33656002)(6506007)(2906002)(55016002)(86362001)(316002)(186003)(66446008)(71200400001)(26005)(64756008)(66556008)(9686003)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: TH35eitRUBoXgoVYzUwlXVNj1b/CVh9yG9vLZ6I/6YTMbLcTYfV4iEWfoSFBK3hZxysCGPWaygd+ZMAaC/kWRQS9gBwVt+BhC856o8WIDYfFYbuIU86Zp7eUD4BC6Z5AJtOwo2f0QXgjxnYR3J759IPx3hNt8PZbAL1apb7pHvAdfu57OWpqvEOQEUl0gclmlSUV49JGIZvGgZrckTZ0Rmm2nmjUSrYitmH0eN5LUeflEFFqTNQRPTAOq2TS7Ai8J8DBHHPFNMubv3BD4DITWToJ6QdqvAaByQuBrKvhVydbIug8ZHD3jCYhhyDzW2NCwWB6LmMDD8wn4Zbrm4IB1g5n3Rd4WSimsWJtNsmJUxZaT2qqHr6eVe82f4HUE7DoMlfAq0W1OQbAVtkABTBYPPjwE+cVevYYHY9KauiLty5oWZU82gsp1MkdH95gynrY95lF2oL2FmiptGY1X34LlrXtpjV/3zY/fvYlUK/A9antrhoUPF6X9PaYJ5mnLef3oNotK9B6UoTVoNmlnH3wSQGRr4dyAlEW0O+R3lP0o/jBoMQKfM0gFmcbTMilz348sDxE8G4ut25CQTrgM9nnuci+9OcGyNd3HIdgRf9/Mov+5g5ZEgXluXKtE7OsonojLnEoYCvWYCaiepEINh3kIIHEoPPQkDUletRC8Ay2k59Aoum2PNMRnwFYEuC43MYlXULOaKByXRGunmcXs3DMOA3ajC0kdRwEXw7MRkKplPq5riyNGah8qgsnFicdTMxpG+GvaN0ZYPA2xTxukVHVURQKxai6C1NPVsMMjuUijrO+oge/lCRoNWKarOzlYh40
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c1f6e8-367b-4d21-211c-08d7f02ae313
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2020 12:58:48.3579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MAEFxY0aKp+i3zjdKcHi6Ma2bJINAq2JvNURwBam/Z/JRWRTwb4Q9Ly0E4JWDY27ZczYRCryB98pBOIZG9UtfFAjfl2hz4QsLSCL6w3Y+iA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4420
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > How would both bindings existing simultaneously be interpreted? Maybe
> > both existing simultaneously should be considered as an invalid
> > configuration, so that it would be enough to just check the one you
> > need? The other option would be to treat both existing similarly to
> > neither existing, which would require the driver to always check both
> > if checking one.
>
> I am clearly for saying that this is an illegal combination. I'd hope
> this can be expressed in a YAML binding. Yet, my research didn't give me
> an answer. Adding Rob and DT list to CC. Question is:
>
> Can we check if the boolean bindings "multi-master" and "single-master"
> are not applied at the same time? Any other combination is okay, i.e.
> just one of them or none of them.

It seems we have not had any replies by now, but it would be nice to get th=
is thing moving forward,
even though we have this current version of patch already applied and worki=
ng in our kernel branch
and are not therefore really in hurry in that regard.

The changes required to this patch at XIIC driver from suggested DT changes=
 are pretty minor.
Basically only checking a different property, reversing logic and some nami=
ng changes.
I can make these changes already for the driver if this solution is what wi=
ll be chosen,
or would you prefer to still think about this?

Regarding the device tree changes:
I am not very familiar with the needed documentation changes, YAML bindings=
 or what needs to be done for new bindings in general.
Would you prefer to still consider them and/or get these subsystem level bi=
ndings done by someone more familiar with them?
Another option would be for me to try find time to do the suggested binding=
s changes anyway, but it will likely require some effort
from me to familiarize with device tree bindings changes and schedule the t=
ime for it.

Best regards,
Jaakko
