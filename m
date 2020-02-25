Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05EC216C3D8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbgBYO1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:27:25 -0500
Received: from mail-eopbgr140071.outbound.protection.outlook.com ([40.107.14.71]:4876
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730734AbgBYO1Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:27:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/nsVguIpX2PAuwNTMdkF96eowRNwFgX6ih7ssKwgqaxTisj8oHfKPkSCF53Ta9L4iNN8l+Ubr6jO9O9LyivLxVX4gA0ZaUk4Svmzxe1UcMzUw/qfi+JKSypZJZiu+5nnHvpwv+U1GG32GLePk2lNC3pO1wuovmIQVJ0nmKgYPGcJOTPj/9ZXX9pjMrnu9zUMwL62iOAFpiuAN43JTNSwJlv2MVc7+pdEkPoWvlHq1MmkV5EWFWH5H9o+Uo5x5x9hz+bvaJsDFxCapWO0NEuyjQ3f2SdOM+WYNmqw26eMNjKXzHCwrL7QzpyHhRnNqE2olOgHqKwagAgi5o55/m/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH5a2PuUPWQtAry+xGXk2nmRJeKeDWjVmNp26LRi5OI=;
 b=SKuVPZ77WwPnuvPQabBHaC+3JQtkE8R3bIDpwGis2Rw74bDWHWiTh+95UzzaW+aNnI0Sb9I6Ac8zv7k4CJcVXleVLnqD7RQRvvta0JHX7oCrd6pXEbrI6vEmAh14A2gy5GIlOmNRSrznSIBughUdouXnKC6gj5NhIIqa1NuD+k7a9RGzZVHrJeBhQpZxyD9a+bci2Cq7ot7pN9FQ3PeofAjvuyKhLAh2x9hL2byHLkMp1AzOPxGcbRz60Tkn3bG9Jb0QkoIZK5ZPlflnuxS9ajMkLudUmhRUJGDdGWTTwTz747KhUDSm01njKjmM3OhYALrNopHWWDlLcVF5wr9wEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH5a2PuUPWQtAry+xGXk2nmRJeKeDWjVmNp26LRi5OI=;
 b=bUMGJRTpx6CFXFpoECKewY26FKnrmK6ayDKHFK4CeWfFnFNg9XiEBNXlfL/5LNEqBLyTew0ECt3vfIiww9WNMUStCMpnU6aZ73M+BjMgZK9ZPbIEMPdR5JFfUmhkQh93YaMki7UyZajz6Jn6KT6e+7pneKTWBGDUeaCFIl6eH+w=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (20.178.82.25) by
 AM0PR06MB5121.eurprd06.prod.outlook.com (20.178.18.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Tue, 25 Feb 2020 14:27:21 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::586e:bd84:8aec:a50]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::586e:bd84:8aec:a50%4]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 14:27:21 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Michal Simek <michal.simek@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKgqKWsAgAHJyWCAAAungIAAAW7A
Date:   Tue, 25 Feb 2020 14:27:21 +0000
Message-ID: <AM0PR06MB5185341478B6919A9CC22271D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <481fe028-0ec6-eca3-7436-ebbb8527f3d8@xilinx.com>
 <AM0PR06MB518514EE9C057CB129079825D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225141357.GE3677@ninjato>
In-Reply-To: <20200225141357.GE3677@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-02-25T14:27:20.4836891Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=6c719611-abe8-4249-9988-be93d574218e;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-02-25T14:27:20.4836891Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=6c719611-abe8-4249-9988-be93d574218e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ext-jaakko.laine@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a7ec318-cb22-412b-73ca-08d7b9fed39c
x-ms-traffictypediagnostic: AM0PR06MB5121:
x-microsoft-antispam-prvs: <AM0PR06MB51218E64FDA730191863F7B8D4ED0@AM0PR06MB5121.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(366004)(39850400004)(189003)(199004)(81156014)(8676002)(33656002)(316002)(71200400001)(54906003)(4326008)(86362001)(5660300002)(81166006)(4744005)(7696005)(52536014)(478600001)(8936002)(6916009)(2906002)(64756008)(76116006)(66946007)(186003)(66556008)(66446008)(53546011)(26005)(66476007)(6506007)(55016002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5121;H:AM0PR06MB5185.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cIZMqBeZIX9yiiyfWuZ1yI/Uo2iS8BHO4Hdcaj+tNWXy8dUqwWQCs/ft/z/AhdAnr5KMKusnqWFkPNkg575sLg8TA9chmtWYsUnut0kKoMgAPjRJ2vJzhNiaP442RBcolYdVbBgD5KqOiJFKLenzbqsNRE1leXU035cKYiPnGN5W7dWTzugkkeTRqeNPcr+T2IVpE1ofgBJKs/XLbWrqQl6kaOAI/kkssYjbBQK7BEjreka9lmMaWjSXcSTbC5GwPNQzPKQLLelw1PLD0Q1aXj7iHTTVtz6hElulrqDauUwkyNyo7OmHoX66n8lmJDsJuhUXoV26o5EXZtu98xZc50+63YawXVCNHx6jVYNT7HuYI/j89P0xdH6TLxRl+jwUNcTCSUFng4b9pLbpQBsJZMK19cxKcn6U8SQcbfcM8M+5pw2XiSfpa5qqDLTx1HGv
x-ms-exchange-antispam-messagedata: 2r4yJs/qhOQxdLijjz896muMyGX/R2a12pAxhZ4TBZqrhowU9WFajF05jHpxOjRYR8Kquy9jSuKAHGJ+HYEOY+mX5VVfRl8QTmv+hU8ZFcMJZhH3zgPDoMh7ZWVGPc9XbZfgWoPgwLgrsZS8HihelQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7ec318-cb22-412b-73ca-08d7b9fed39c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 14:27:21.8072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MZfagtB+iyTsUYMOd/YHPtj/E+MDmIzzhkcmfJ3hMxQ4b2P7G9GPEicaqy/zBrdxQcEhthEK2lflwDCU4vTot2MTBY48W3VkePerXzNx08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5121
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-----Original Message-----
From: Wolfram Sang <wsa@the-dreams.de>=20
Sent: Tuesday, 25 February, 2020 16:14
To: Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc: Michal Simek <michal.simek@xilinx.com>; linux-i2c@vger.kernel.org; linu=
x-arm-kernel@lists.infradead.org; Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT

> My favourite is to change alignment to be just one space. Then, we have
> a bit of overhead now, but never again in the future.

Ok, I will add that change as separate patch to V2 patch series.

Thanks,
Jaakko

