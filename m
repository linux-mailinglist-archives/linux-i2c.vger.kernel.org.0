Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56311341658
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 08:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbhCSHVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 03:21:53 -0400
Received: from mail-vi1eur05on2083.outbound.protection.outlook.com ([40.107.21.83]:4416
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234037AbhCSHVa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 03:21:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obrMZle9GpRXh2lxlcyn/xAg9gtOavAY2g0/nepGSsdoPgAJbpLUlOXNwflib+JKmxfz+MFu2UOpc4F9yFWwEQrUYnO8xo3j35jv94TLFteautLnsVUK3UUAZ3iUJiiUfwmaMg4VGrB50P9Xjkl/NlEKEtPGtRVMiVucdssnaVkdeOs9jIXUwEwzWHhLAIa3AZa0BT+yrrGtn6G+W7k54ejOx/DuyroJisWpFFYk8ANlGPpIZSM2zjbV2/MXHGdgLYePZdrJ9IeKA0W6d5mygYyl7cC9oRvAJntRzbPJwAgP/p9R3DciXH6CAU0XCeZv7SspAG0lEBHaNnS505St8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Zt38vhz3S2quQCOFWfqmd8IHZi0KpR9iWEf/qvXUt4=;
 b=LLOP/g91gOq9vrjwILUwdeMOgx1AOcxchCZ/zcQMkUUun3mKOjaB0yMCBIeDBIo8BmEvSoFL1ii4dDQ6LihF+2eGug0B/joCxxOHyIfxrA+GJL9gOj7EVYcjI7F2SJf69nCokajLIDL1salXlfKQtPRgWCAAaQZcNWmul/Kb1ak3MTjAHP8LvkDBXsLVSIFAhkmnG8OCo/F7e7CbOZrCfDHu1ditTEPPsi7x/21hN7VLprJMcUY9OTumBPztY94aOWZ8v9JEA8XKw0ujqZBptZ2GEa2rs7uhXvmKDKo79U9LfzWvRjWP2SnBDdG4HgOH7YJuka0wCxUsrlCyouoZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Zt38vhz3S2quQCOFWfqmd8IHZi0KpR9iWEf/qvXUt4=;
 b=gDyOtowXt9Y4BITMRiYzgW4zRxQjmM2nkzPflXbUWP01lcGjNEPq2zSdMy/kE+FE5pV04cXYtFodUFDc5VuZ3xQv5YYSUWTXBs3DPkaYqj59hp6v1KhMohCwchFKyskEQpg/XZ3x7kkv/l7Ivz6Ch3yM2XE1gM/1GsszwTIf23Y=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM5PR04MB3138.eurprd04.prod.outlook.com (2603:10a6:206:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 07:21:27 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 07:21:27 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 09/11] i2c: imx-lpi2c: fix i2c timing issue
Thread-Topic: [PATCH 09/11] i2c: imx-lpi2c: fix i2c timing issue
Thread-Index: AQHXGvpbdJdl1ASjZEeufc91PqZaQKqKx7oAgAAfe8A=
Date:   Fri, 19 Mar 2021 07:21:27 +0000
Message-ID: <AM6PR04MB5623347B2CE1453BA1250BC5F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-10-xiaoning.wang@nxp.com>
 <AM6PR04MB49660A7D1AB880EFF530654680689@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49660A7D1AB880EFF530654680689@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2edbd229-9f71-457c-5384-08d8eaa79c6b
x-ms-traffictypediagnostic: AM5PR04MB3138:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3138DE5E4E55BA9FB17B6D3FF3689@AM5PR04MB3138.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wb6Ev/ehXsrXsD0342x/ZETMqxR+HsN3TwdkpswPZbZt70ypBcJK8VjDNx2If3brFx885pOoPmg/UoI7dFqfBCHhTCiaABbxq8aY2DEJak8vHzy/PICFNSMBcJnaR/Lp2llM8ySJhoPOH0WbzTHLkh5Nj72MEcs1ssU7X+l999jUfMscuBlo39ql/JzXo7yMHMGbbbqBTS1SN6i9ACGeRmCgBPwwyAKqoTR/KMxzxdSXCPmSyNbdQfGPnD/PC+t34RXGTPRTPIMeT7Mp+5xANNv4sFthPlMCu5OTZ2ZUP1tjLcvUD8zxRgmsP6dXMnTeat7RE9lU4WdWLwxnNHdKpRaZeL50BH7BIl6OhEl4iIvov6K4Vd0BGKvZ9zXRo17FSylf25AlTKwbTQDCu3U04NH4zb8Qg0YdiYwopNP5IcXb5KyAeYv8meKKQE0d3BYIvJmAvcH3SQrdUcDg+hXbNLpzZQQdBc7jl8fVNxYmJUnX55F5rP8Z9aqjiXdeaXKq6hsmQCx9C0agqZHM67G24NdJfLwO52ii+///8A3ESNXHlmJZrEYm2jb3Z52hFm4d4IVbgu94NQiWlxDxBDL9mYk0GhB5OTApX8l2I9Vi+ayBBjYe9QUsNSqCy+91zMU1LNTz7HEG26T66+HIvWmSth85ZWRQNEjirfETUUHWnbA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(9686003)(55016002)(8936002)(53546011)(6506007)(8676002)(2906002)(26005)(478600001)(38100700001)(7696005)(4326008)(71200400001)(33656002)(99936003)(316002)(186003)(110136005)(54906003)(76116006)(66616009)(66476007)(66556008)(64756008)(86362001)(83380400001)(66446008)(66946007)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S1ZpTEdGVGJHekxmTHkwZG82M0tISThIUmFONUh0QXg0aldyYXlxaTBOeGFH?=
 =?utf-8?B?QVAyWmFtaGsxSlR5NXJLOCtleDUrVy80dUNCZjM0R0EwM3dqNzAwSmlxaXpo?=
 =?utf-8?B?bm5NeUlqMGFPandTTDUrSmpPRVU5KzBTaE1BbWpWa0xFWDlwM2phZzB0VjlV?=
 =?utf-8?B?MFd6cVFBd24vUkpQcnV5QWxIdkZvS2thOU9sM3VjVmdiejVOSU9kU1FydFg0?=
 =?utf-8?B?dWxFdk9JYWJETlRjMy82bDNScXFNczh0dDZZNTIzU3NQcm9XZ29TRjJ1cGNK?=
 =?utf-8?B?WU5rVnNPUUdIZVMrcjd5VFU0VFpNcUNiY1BKZUpOcWZXb3lHMGFTWTluZ2Iv?=
 =?utf-8?B?ZmNXREsxTGE0UldQUTRoT3d1SHRDNzIyelFKWE52Uit2TG9zL0h5R3p6WDFZ?=
 =?utf-8?B?TjFyYXg2NFlWRkFoWGFKT1dKZFdCaWI5REJWQS9kaGJUanFFMnY3MGpKdXNL?=
 =?utf-8?B?Qm56L3gzcDA4R1pYam9kUTlxSjR1QzZ6aTZJZlY3cGV6MFdFMkN4SWJlVVNH?=
 =?utf-8?B?bWFKRCtrVzBLaEc2djYrUlJoZ3piTjRQa29lVFNmM01jUjdBMjl5NGUzblgy?=
 =?utf-8?B?VTV4ZkMrKzBtNW9iSUdXSGlyMFB0b1hiS1E4eGgzRFh3dHJoMFZ0SnJQMXpo?=
 =?utf-8?B?MC8xS1B1ejRzcm0vTms4c25UN3UvUlVIb0tnRzBkR0tHclRxaVFSS3hiMWZn?=
 =?utf-8?B?alJzOG1EWExJb0w3UDRvY2FETXFQYjdaUTlETW9NK2lHbVViRi9qWjNmVjhO?=
 =?utf-8?B?bmNoWXArL2lDNVcrWG5DRC85Y2tvYXlTVUNEdG5udm9adlk5N3dnZHQzeC9J?=
 =?utf-8?B?VTRST01hb3VBM1JjaE53ZzRSMVJvSmVxVlp2c0xZTFNOVE5wdHdSeEpid3Iv?=
 =?utf-8?B?bGxUeDBrNFVPMllKdlp4MTQ0ZDMwSXAyeXBoYkV2RDJjQnBKNUdORk1zSFYy?=
 =?utf-8?B?c2YxNTZ4N2ZJOFJ6bHBqUEF5ZmdBci9oZnRTeFFQQ20vcnlaNnVSVXJ4SHNy?=
 =?utf-8?B?WkoyREkrRFNBaytBV1hDeG9XYk5zWXo4QUtqWkxUUlkxK0FwOU02YVFBcnc2?=
 =?utf-8?B?T3ZFRm5hRXRETmI0Wmk5RlJxRE1rSi9sclk4RUVXaVVITlpoNk11aGZYMkxw?=
 =?utf-8?B?d0RObjBPb2ZuZUI3UWZ0cCtOYzN3SjBTZlRvK3k5STVkUW44Tkp5MlN2TzYw?=
 =?utf-8?B?YkltK0NEVnBzMzRRb3dFcDRMWFR6cmtMUk5hKysvQ2JHb252S1ZpRCtkZzMy?=
 =?utf-8?B?UHlBc1NDbkhrdWF0R0EzUitXU1Z0b2FEd05FZW1YbVc3eldRM3J2c3E2UmFC?=
 =?utf-8?B?RWlRN2sza1d6WXB1S1cycHBMdW1YZFA1QUFRTVhacHN2d3J2YXo4QWx5d01Q?=
 =?utf-8?B?dlpOMDFEV1BOUUhMOUY2ZTkvUi9OMWwvWDRXeFA1bDVPVjNjZUtMR2pNZTJr?=
 =?utf-8?B?Z2JwQmprOW1mV0V0blVOY1R0MXc5TkN1T05zNDl5VDF3WDg5VTZudnRmWDZJ?=
 =?utf-8?B?VzNiaTVkanBma0ZCWnNWKzEzNDhGV216c053STU4WU5LbGxwaWw2cUx5V2Fm?=
 =?utf-8?B?c1pZbmplU2VMYllrbjR1SHV4ODhlVXdrMWhhKzc0K05zc0lTMmx6Ujdqa0Zi?=
 =?utf-8?B?K1duTTFYMzgxSHBnWmQvclNkb25sdHBBVmpGYUhiOXpqWmxoM1lWNG85U1Zs?=
 =?utf-8?B?RFg5U2hRSkZIbS9mVEduZ0Jwd3RLeEt2RWtkbTRCbkNtbDdtL0xIMExjQ1Ft?=
 =?utf-8?Q?+qnu+ZbTDgkiikVsMRBxoIE4xifRCajIEa5c6kL?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_02D2_01D71CD3.860942B0"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edbd229-9f71-457c-5384-08d8eaa79c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 07:21:27.5773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBLN6gmfrey1HIEIYfw0EBGW1Raz+Q2L2pEBcbZ0t2l9bMNrHp2n+LOBor9qLmXbqyLFqxYGx4XlxeyM+EYwTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3138
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_02D2_01D71CD3.860942B0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Aisheng Dong <aisheng.dong@nxp.com>
> Sent: Friday, March 19, 2021 13:15
> To: Clark Wang <xiaoning.wang@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de
> Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH 09/11] i2c: imx-lpi2c: fix i2c timing issue
>
> > From: Clark Wang <xiaoning.wang@nxp.com>
> > Sent: Wednesday, March 17, 2021 2:54 PM
> >
> > The clkhi and clklo ratio was not very precise before that can make
> > the time of START/STOP/HIGH LEVEL out of specification.
> >
> > Therefore, the calculation of these times has been modified in this patch.
> > At the same time, the mode rate definition of i2c is corrected.
> >
> > Reviewed-by: Fugang Duan <fugang.duan@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 27 ++++++++++++++-------------
> >  1 file changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 7216a393095d..5dbe85126f24 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -73,17 +73,17 @@
> >  #define MCFGR1_IGNACK	BIT(9)
> >  #define MRDR_RXEMPTY	BIT(14)
> >
> > -#define I2C_CLK_RATIO	2
> > +#define I2C_CLK_RATIO	24 / 59
>
> Where is this ratio coming from?
> Can you describe why use it in commit message?

This ratio is a value obtained after passing the test.
I2C's Tlow should longer than the spec.
For example, in FAST mode, Tlow should be longer than 1.3us.
The previous calculation violated the spec.
So I re-write the calculation of clk_cycle by referring the RM. Then test the 
ratio to let Tlow match the spec by catching the waveform.

Best Regards,
Clark Wang

>
> Regards
> Aisheng
>
> >  #define CHUNK_DATA	256
> >
> >  #define I2C_PM_TIMEOUT		1000 /* ms */
> >
> >  enum lpi2c_imx_mode {
> > -	STANDARD,	/* 100+Kbps */
> > -	FAST,		/* 400+Kbps */
> > -	FAST_PLUS,	/* 1.0+Mbps */
> > -	HS,		/* 3.4+Mbps */
> > -	ULTRA_FAST,	/* 5.0+Mbps */
> > +	STANDARD,	/* <=100Kbps */
> > +	FAST,		/* <=400Kbps */
> > +	FAST_PLUS,	/* <=1.0Mbps */
> > +	HS,		/* <=3.4Mbps */
> > +	ULTRA_FAST,	/* <=5.0Mbps */
> >  };
> >
> >  enum lpi2c_imx_pincfg {
> > @@ -156,13 +156,13 @@ static void lpi2c_imx_set_mode(struct
> > lpi2c_imx_struct *lpi2c_imx)
> >  	unsigned int bitrate = lpi2c_imx->bitrate;
> >  	enum lpi2c_imx_mode mode;
> >
> > -	if (bitrate < I2C_MAX_FAST_MODE_FREQ)
> > +	if (bitrate <= I2C_MAX_STANDARD_MODE_FREQ)
> >  		mode = STANDARD;
> > -	else if (bitrate < I2C_MAX_FAST_MODE_PLUS_FREQ)
> > +	else if (bitrate <= I2C_MAX_FAST_MODE_FREQ)
> >  		mode = FAST;
> > -	else if (bitrate < I2C_MAX_HIGH_SPEED_MODE_FREQ)
> > +	else if (bitrate <= I2C_MAX_FAST_MODE_PLUS_FREQ)
> >  		mode = FAST_PLUS;
> > -	else if (bitrate < I2C_MAX_ULTRA_FAST_MODE_FREQ)
> > +	else if (bitrate <= I2C_MAX_HIGH_SPEED_MODE_FREQ)
> >  		mode = HS;
> >  	else
> >  		mode = ULTRA_FAST;
> > @@ -209,7 +209,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct
> > *lpi2c_imx)
> >  	} while (1);
> >  }
> >
> > -/* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2
> > */
> > +/* CLKLO = (1 - I2C_CLK_RATIO) * clk_cycle, SETHOLD = CLKHI, DATAVD =
> > CLKHI/2
> > +   CLKHI = I2C_CLK_RATIO * clk_cycle */
> >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)  {
> >  	u8 prescale, filt, sethold, clkhi, clklo, datavd; @@ -232,8 +233,8
> > @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> >
> >  	for (prescale = 0; prescale <= 7; prescale++) {
> >  		clk_cycle = clk_rate / ((1 << prescale) * lpi2c_imx->bitrate)
> > -			    - 3 - (filt >> 1);
> > -		clkhi = (clk_cycle + I2C_CLK_RATIO) / (I2C_CLK_RATIO + 1);
> > +			    - (2 + filt) / (1 << prescale);
> > +		clkhi = clk_cycle * I2C_CLK_RATIO;
> >  		clklo = clk_cycle - clkhi;
> >  		if (clklo < 64)
> >  			break;
> > --
> > 2.25.1


------=_NextPart_000_02D2_01D71CD3.860942B0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
U2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNv
bT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0
aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Js
hi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsG
AQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2Ul
MjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENO
PUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29i
amVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cu
cGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDBHBgNVHREEQDA+oCUGCisG
AQQBgjcUAgOgFwwVeGlhb25pbmcud2FuZ0BueHAuY29tgRV4aWFvbmluZy53YW5nQG54cC5jb20w
DQYJKoZIhvcNAQELBQADggEBAK4JPoIkTbfuhwLtQ9Fm320K9JnOD+UvIk7UY5A58pq540ABcjCz
LggHvY+pE9m6IdsLfPL0lj4rrK660DRFM7k6XQEoJXjOBlZ+FGi7oTGL+VVi4+TYQzwPUMr8Ukg1
EBMzKb84Kh3oA96THluC3OFR3DbU/3NJsMYI6hIpvL4G+MQS0NZiEOf0CW73kreekaWUzCcnDbjr
9c8a1dI966lFSHr+2MAjj1iiNou1MXi3YA0jTy2qW78wdbtk/UbWkFIp11SyqA6Va6i96c7WgohG
zzxofRhw1yf5mb0SSjrbcFvLWRyx5iVZIhapdbztkYGYJiroxzI+ndpbztisjkYwggfxMIIG2aAD
AgECAhMtAABZfNGGA83aLDAMAAAAAFl8MA0GCSqGSIb3DQEBCwUAMIG2MRwwGgYDVQQDDBNOWFAg
RW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcM
CUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTET
MBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwwHhcN
MTkxMDI5MTM1MDU4WhcNMjExMDI4MTM1MDU4WjCBmjETMBEGCgmSJomT8ixkARkWA2NvbTETMBEG
CgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA3diaTEMMAoGA1UECxMDTlhQMQswCQYD
VQQLEwJDTjEWMBQGA1UECxMNTWFuYWdlZCBVc2VyczETMBEGA1UECxMKRGV2ZWxvcGVyczERMA8G
A1UEAxMIbnhmNDc3NDkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZY70u6L2tkQw7
9PyXIwnCQZGWP+8gSezFvuegmg10bDVMZux1jQKY48+p9oQeUBOfM9652qP5o4VTqDCR4MBxbtB7
CXxyjzKOdVxraRqx+xibX12lcs4LmCtz3JeEduJkKJ7W+QJtTbqtF6okCUCQRT/vF/BqUyfNyVs6
Mexrp1Lj4Yv841rbsVKC6k3jdt1pqi/0YZscxs7rqP5VsvFcK1der8zrQ/98AbMMjoagsu+nq64x
xPly7BcBfjUMTlw2PsL5viDocyLeVtW22VInObVN2bvFKdtkQEliZtoBKVwevOx1UMYis/yAbqhE
x+7g2Z/59jqDaZSy7SOxigvhAgMBAAGjggQQMIIEDDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3
FQiFgsB+gY70VYbthTiC65lLmpJWP4Xmim6EteF+AgFkAgE6MBMGA1UdJQQMMAoGCCsGAQUFBwME
MA4GA1UdDwEB/wQEAwIFIDAMBgNVHRMBAf8EAjAAMBsGCSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUH
AwQwgZQGCSqGSIb3DQEJDwSBhjCBgzALBglghkgBZQMEASowCwYJYIZIAWUDBAEtMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEARkwCwYJYIZIAWUDBAECMAsGCWCGSAFlAwQBBTAKBggqhkiG9w0DBzAH
BgUrDgMCBzAOBggqhkiG9w0DAgICAIAwDgYIKoZIhvcNAwQCAgIAMB0GA1UdDgQWBBSZJY1p6Y56
X4YAWIozHW4aGPBzZDAfBgNVHSMEGDAWgBRYlWDuTnTvZSKqve0ZqSt6jhedBzCCAUYGA1UdHwSC
AT0wggE5MIIBNaCCATGgggEthoHIbGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1
LENOPW5sYW1zcGtpMDAwNSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vy
dmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jZXJ0aWZpY2F0ZVJl
dm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGL2h0dHA6
Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Jshi9odHRwOi8vd3d3LnBr
aS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsGAQUFBwEBBIIBAjCB/zCB
uwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049QUlB
LENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24s
REM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRp
ZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY2Vy
dHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDBHBgNVHREEQDA+oCUGCisGAQQBgjcUAgOgFwwVeGlh
b25pbmcud2FuZ0BueHAuY29tgRV4aWFvbmluZy53YW5nQG54cC5jb20wDQYJKoZIhvcNAQELBQAD
ggEBAEH+a5BarGYCUuH4P4sFJkrA7Y1U1aWb2nxNOPDARJLTwdEyMP6pPY0Bm7AyypW60HlI3Z4I
eP6NiMibW55/xz5EEcHxOrbYFmPyLY9twXLluCHnpZYT3NrDCD9dbOhUeZbDB1FXG93zfMJ8zzL4
9njRn5J6mcLiHkUpVRacp9susO1zN3uzp8TXCHy/y483CE6g1qUijUyiTPlAT9gz7xvyxAhTmrhH
8Fue00PWfK0B7zzjd1b0Da2nWFZXk4IsYJeyt+RTWC07VscWFiJ3avbgN0kaCswkvB1f6DVOqDRx
r5hHoNADBEcsMNdQNRVu2ospazEVq8wtXPTB7Ihf564xggTDMIIEvwIBATCBzjCBtjEcMBoGA1UE
AwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIw
EAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZ
FgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYT
Ak5MAhMtAABZfUBCujlfjY1jAAAAAFl9MA0GCWCGSAFlAwQCAQUAoIICxTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAzMTkwNzIxMjRaMC8GCSqGSIb3DQEJBDEi
BCDmi1/qHJmf0Cr8SIlskuOXGsAZ3Ddm0pWXlM8M25uvYzCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
CWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDALBglghkgBZQMEAgEwCwYJYIZIAWUDBAIDMAsGCWCGSAFl
AwQCAjAHBgUrDgMCGjCB3wYJKwYBBAGCNxAEMYHRMIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJw
cmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRo
b3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmS
JomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0AAFl80YYD
zdosMAwAAAAAWXwwgeEGCyqGSIb3DQEJEAILMYHRoIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJw
cmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRo
b3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmS
JomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0AAFl80YYD
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAO9Ac3vDTzdArGQUrZonnkVMrFSL3bsQVjLJr
k+cOyqN8qXn53lqQhzFaZ+Wy1LnQ7h+EPjIo9Vol2507Lcd0YvqSWF8g/Z5bdacr2MXWVZ4q68qe
e1D2kSkXfb7wlsASiEdTofE0G4lwLN73G7W9SeYg3LdccsH54JVh+04kU4HuF4zsTPu1zwIAo8yj
mwIu3eGNK3TujB/R8HK/fMMPx685Hr2t3JsHyD4kD35LaM+3h6c7K6mYYQL9GwUvN1YM3uHEF9qe
EujpHW6Tugw6aKBGK/AgvVkSQcW+UaiQoW4sh3GhAKVPqsu0syIkHPjSf8ztScTIIvM60cggPZ8I
BgAAAAAAAA==

------=_NextPart_000_02D2_01D71CD3.860942B0--
