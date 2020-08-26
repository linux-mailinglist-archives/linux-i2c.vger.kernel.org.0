Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC66252D25
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 13:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbgHZL5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 07:57:53 -0400
Received: from mail-vi1eur05on2086.outbound.protection.outlook.com ([40.107.21.86]:33128
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728957AbgHZL5v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 07:57:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RucGyKre9RWVtm5kU4Hf3+XO+Hf8IQUs09BktBnuXMJykJCETNrwbaru+ZZPwZ+DJ6A0edloestA5xl4JiyhnwbaD8QvUgsHmKTXRnjB/ou+cYOU/2YQlpmLWP5xw2D9y9PtvSGTnPZ2xeakVOZoByMPhy9orGVVvP1zRs9IHaLcVfFLvbXykfuihq+wSX7xRJ7Cc28+wrcbsR0L+m0lzpRannfj5Lrn9g6GdlDDSkHYp21jYwIrUKjN5aPAF5toCfJmHWRgdHCY/jihcJGH7BUvxi4g/OBoX2sYlJglcvmKTY8FEp7e27SkQ75yHixxnIDLqrnh51Yrr7afGPiOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf4LdCvtxSny/o+t2lvmnEaEifpeUhF35dJEzI6kgvU=;
 b=Vrk/oe/BLFRMrILwFFWNAhvnriOMLoiupwXH1dTsjz5IrufZFJ1XFDI4Z6OvKf/NZJdB5mwrdvfuKuiXnCPPdlGLTnqqJY6RXF5ZPRSxV3jCZO759HpjO5cXGNz9zeydbVn04Eeax/pt84is3FxqgRr7EINirTTx94l92EMcNr0AafjAAXfjCS8XnFZn4opLzL05QmYFLCcyi7EVv9f9VGPbiqncTwl/I7V/XXyHeH6kTc564QfIw0eL1wX+wC5R3DjcpH5XSonmSxVndxOEqYhpZg5aZHK/mqmHRpdco8onhpIuQqGleeZbR7uuaqnZT1NdH00LDmiE5VmvG7ivgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf4LdCvtxSny/o+t2lvmnEaEifpeUhF35dJEzI6kgvU=;
 b=qwwr2QN0B50DKfHRO2VFL8F2JSFs0RPFYKyzTmzq24L9cBAZnakMQQ7fePbZtcTUGkTG7gZ3JmJ4lPshYov1+1RBREBhYcA6IJKtzA5C6Wc6wEbbeRUJyB1UbtuDO0w4dWiEGRykJSkqMh/eVM+cwjz9nvDQrpvbZC+s1iEZTRA=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM8PR06MB7090.eurprd06.prod.outlook.com (2603:10a6:20b:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 11:57:47 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3326.019; Wed, 26 Aug 2020
 11:57:47 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Thread-Topic: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Thread-Index: AQHWdtk2CZfOpUVfP0W7+XiJ8FAN+KlI2GqAgAFqsNA=
Date:   Wed, 26 Aug 2020 11:57:47 +0000
Message-ID: <AM0PR06MB51855B0C24B5D1F938A9C18ED4540@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
 <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
 <20200825132427.GB991@kunai>
In-Reply-To: <20200825132427.GB991@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-08-26T11:57:44.9751713Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=a7c57cef-b988-45ec-8c47-1632b345e8de;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-08-26T11:57:44.9751713Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=a7c57cef-b988-45ec-8c47-1632b345e8de;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
x-originating-ip: [81.175.223.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73558c53-d5d3-48a1-78cb-08d849b74022
x-ms-traffictypediagnostic: AM8PR06MB7090:
x-microsoft-antispam-prvs: <AM8PR06MB7090B7A677A4CC13F6093F81D4540@AM8PR06MB7090.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vI/Ek2zrSe2hfjab/gewZmB5pr9KS67usHJQ/q/nrEzUN/Zj1gHN53gqv7Pbqw6JtbgXqojhaoBcVd5Cyoe5BwScTdCkDk6w0UZyrMrdA7HcT2B1mfEKgzUbQEl4geRoi7V0uHTYmO5Ni2asxQBD/cvrnqyz6VyKHfa0CXICH04Yek8PBD69L91uSpE4qF5io2/qhnbfqPpUToeK5/h93Ti5+wXQh045jENIGfUElvGYWhdWxXOCzaQMWtwjtLOj9XSEOnohavXOUsM8pc/NaimbtHr/vbEXAVncHJhaDiWBRI8GBy43izTGvdfcIMZv1/zzUXvgZEXKJ/YOpAV7bw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(346002)(376002)(71200400001)(2906002)(5660300002)(9686003)(478600001)(8676002)(8936002)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(52536014)(7696005)(316002)(55016002)(86362001)(4326008)(33656002)(26005)(54906003)(186003)(6506007)(83380400001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: UOiW76fb7pQ2Rt83urV9guHg4fZyWSF6kys8VrePUwJ3ievDDQJvBe9WPwrbYUZF6w04bBsQHkna/kZ1Pfza+bERFarZqLq29LDq1JuwEXeXOdHyNETIRL3O6ri64EXjQWhgYDkShTBQT0hlxAyjc9PVgsY3Q/YhvDmMFjIi7OPx0gfg8AMwNjU494LSJZbKZ6K0GLFcC3Toc9TDUblpKAm7E3qXcNgEc7yfQjsf7SZh5sfsan82PlKUU59aOWloZejUqPQGcT9b6P3rDts4rYK8uYPB1AJ963tFPleJyRTITgUmvkG918DN4CkHELCkpfXGJrNnxohNHCS386NxOlV94efVdwfZDtj5r/ZaKFMtefLBndlCiOi2E3JdTA0WhnZBn8MVcxAkYzoPzblbPkmvy6qUrHvwpGsGC6m6eiZUran9e/M1y3XFQtAASkMLxN1OsL6jZuXHbKWfFnIykNRTJ+dSHitpt942rjyvPmjQhalU8bGClDu7LSCAq+B3+x89YYwI4H7fHuhmTdaZftXfpGfb7kwuO+SN00MkCnTmjVHz3dS4MZ4i+9UVCrF/Pv+nI8GmdZMcg6VJ97x8EpXoG4Ed8m3l2QiFvIpqBVJGoUecQF7PssVe4ZrmCE27JcBE0Z4FKizDLyHJ6BIu0A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73558c53-d5d3-48a1-78cb-08d849b74022
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 11:57:47.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hX5Q5yFiRmFnckEiz/VoM4foLYGTrGxPZTUrfXs1+SWKNIhZmQ0pFIkBlOzamoaDR9qLH62BTMLxgkH0tLW+EYz138BzgWplqkwhWKDDLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7090
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > If it is known during device tree creation that only a single
> > I2C master will be present on the bus, this deadlock of the
> > I2C bus could be avoided in the driver by ignoring the
> > bus_is_busy register of the xiic, since bus can never be
> > reserved by any other master.

> You could even initiate a recovery procedure if it is a device pulling
> SDA low.

In the case we actually observed xiic got permanently stuck, when I2C bus
was temporarily and indirectly affected by external voltage pulse. This can
happen in single-master or multi-master bus. It does seem that no extra
recovery behavior is needed in this case. If we are able to determine that =
bus
is not actually busy, we can start using it. Indicating that bus is single-=
master
was a handy way to determine that. This issue was bad for us because
even if SDA was not grounded anymore, bus was still indicated to be busy by
FPGA register and driver would not continue.

In multi-master case you would need some kind of timeout after which bus
bus_is_busy is ignored and recovery attempted. This is ugly since it would =
be
a non-standard behavior and intrusive to other masters on bus.

In single-master case, if some slave device on bus would spontaneously
pull SDA to ground when clock line is not pulsed, bus_is_busy could be trig=
gered.
In this case we could attempt some kind of recovery behavior. I guess this =
often
means attempting to pulse the clock line to get the slave to release SDA.

In my knowledge pulsing the clock line can help if slave device on bus has =
missed
some clock signal edges (or is answering with more bits than expected for s=
ome reason)
and is holding SDA down in an attempt to communicate a data bit to i2c -mas=
ter.
Extra pulses in clock line can then allow the slave to finish transmission =
and stop
pulling SDA low. I however doubt that this type of recovery would be likely=
 to help
if I2C -slave spontaneously pulls SDA low. This would however be a very bad=
ly
misbehaving slave -device, so it=B4s hard to speculate what it will do and =
what specific
recovery might help.

There is too much speculation for me to attempt or test bus recovery in thi=
s case,
so I would leave it out of this change. If somebody notices and is able to =
test  a case,
where some specific extra recovery would be helpful, I would suggest to con=
sidered it
later.

-Jaakko
