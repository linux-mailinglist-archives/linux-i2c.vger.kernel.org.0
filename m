Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44FF1633A1C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 11:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbiKVKbO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 05:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbiKVKaY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 05:30:24 -0500
X-Greylist: delayed 1061 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Nov 2022 02:25:43 PST
Received: from mx0a-00549402.pphosted.com (mx0a-00549402.pphosted.com [205.220.166.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1F512D39
        for <linux-i2c@vger.kernel.org>; Tue, 22 Nov 2022 02:25:42 -0800 (PST)
Received: from pps.filterd (m0233778.ppops.net [127.0.0.1])
        by mx0b-00549402.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM9JLv8001013;
        Tue, 22 Nov 2022 10:07:30 GMT
Received: from deu01-fr2-obe.outbound.protection.outlook.com (mail-fr2deu01lp2170.outbound.protection.outlook.com [104.47.11.170])
        by mx0b-00549402.pphosted.com (PPS) with ESMTPS id 3kxra1hynf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 10:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUzptXZ/XGo6VNYGHTKtQ+Wo3pw6zmshVQ26Ni96Eb/fVJWq5LCMoVDL97ej/nbeeGEQuWqfWkJTP6f11xJoz3xiG6+PJBk13tj0PUH3BTo2oI6UvZ7wnOTiG4+8nI4xatX1sXPo4GU934m1xLzVsf1sh6eMRnN2/123uAjVuFePyA3Ng2kV2Xr1g8O2wiigr1MSCuWMy7aSe2RMR1atAgEPB+BHYSN1Bp0SHL77RC9puKr8b+Y4xPraW8AObsffxs6u5OYwPA3KMwND/vJHWB4bCMzoommC0jiTbK+Mf5GX1ypnczSfixH4SsW1XzRp64pPTgB00DPyNH3TVprROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuYahaVSRa92WWicGwqb4nGAe810xVcSW2vKE1fg/nc=;
 b=TOb7RpJT1VQIzq6hoGnNrAUYOAzju6ZyJCAZxpQ/f81QppUAdU7ezgvf39OLXJ58j8ZCmrVaqDQfjUHnIJIKKEWCYdc+GEQf+O/pHNoZDxm2E27J+m8Y9/cb0oEdzI2OD10C0WHvXl38Q+F+/RRVqGqRfwcwafHcwG0KnxcR5CV8rpyoJ5rMvnU1kGaID6DebjVamV3h8bwVL1VZbgSYn6sDQa4bL0WAr+AbAWsKDDIsBT3xSx9+08j9fKshIsallBbmvG/Az0xaUlnQYBQ5Zr8I/BC1tdvtIYTvvbTzIXwGQ6r5OJie1/JvZxe/PQcSlBaEhok0RWdTsY+eE1GvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tdk.com; dmarc=pass action=none header.from=tdk.com; dkim=pass
 header.d=tdk.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tdk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuYahaVSRa92WWicGwqb4nGAe810xVcSW2vKE1fg/nc=;
 b=GF3kEYOVtXweA8xjJAIA4dOdV+5y8neDTIPNjPhTr6/6jtzvvh6CORlhiUW+Dle3KEaDKmQx4a/9JU3X7qmuOJY8Ni4+DWFdm3s1ASEPauNSVZTXAaFdLPkXbhXHu9vqtrRIkZsyJ1Eaa4eWgU/Vw34lNEsz5u2XwnIJhzPb3Ga7u9TlDCtJBBp3dAkw2mXbOEdLmz2MnFV5Mu6onin+uDwUKRE+ojie61zf1BtpD6iRvbqFZCsgKDFwHb75PnkzOJWBLhq9HiiDMccF8O7GvJ733b92FHpUspQNUJ0eY0mxTmsAIJotnRt7Xj3h4Xcf8IIvaW+tkWPAhY6t9csl9Q==
Received: from FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7c::11)
 by FR2P281MB2686.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:65::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 10:07:23 +0000
Received: from FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5fdb:b2bf:a02d:80c9]) by FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5fdb:b2bf:a02d:80c9%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 10:07:23 +0000
From:   Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 171/606] iio: pressure: icp10100: Convert to i2c's
 .probe_new()
Thread-Topic: [PATCH 171/606] iio: pressure: icp10100: Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5+xM8Hgtw+HMkCOuHM5dA9St65KvRTG
Date:   Tue, 22 Nov 2022 10:07:23 +0000
Message-ID: <FR3P281MB175731CA2BA30F163D059375CE0D9@FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-172-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-172-uwe@kleine-koenig.org>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1757:EE_|FR2P281MB2686:EE_
x-ms-office365-filtering-correlation-id: f6cf1264-621f-4869-2f00-08dacc7159dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lnwT+6QH7/iMwY1e3tRnVImyGPfPH7TRUBem1OhPAL2XRtku6nOZE+9m4yii0hDghfrPY0xNjwPM9xnju60S2On2wSC+HNlyNBBSMrwmGHmjeOX7CZvMMtomahrzuKb8cLnsV+vYlpw+nexDVvubtKk2ESoATIPFASnC/OgLWA0UZTrOom6woTgrm7dxSZTTutqMLA7uzPoMihkvzXzqDXiQ5YFSIixiYVbUpXSu82HiIdWzvZtvDB+FK9w/h7cIhkSNXnrPff+cxcQl91AR7sE1ZKeuOixZlo9QVpqXgZ4kKoXiO1zWUXTdegVi6Uvdw3+zxFRFyjyw46yBUUyOhWBAL1mo+ZipYHEicTtT/b3yyLAA4vpZCPl2BRamo/FqLxyggGdslJbkRkAs6BQ2e3TQ3uBSX//bJQ5jFFzGgqYt4EcjSvbyD8J0Fh1Q5Wfd60SdmKgmwU5tidnSROEqWZ0CLhgLQkkmiDn1mwdv+3S8zBNkr7iTDxOr6M1cOM79+NVjtpD+6eNOlS5nqfuV4X4bzUmWPSRH3jg8HA5bb4Pn7fM7SkXh0VL2kwkuxH3rqKRG5BDhVUba4jwFztEb1IrCLiPMVfVlEmtNdJVxG4OT3YOUVteBrNPZTAt2Hl1DkNYMUYuN1T8blaeb9UT5vMl3n9TXTgw8tI0P3j4SkUVYi/IdeY2ktO8tobx1JU/SqOj6gwPgMOXHlKoLGyYP93bYz2slL4t2rAiN80gBTnA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(451199015)(52536014)(5660300002)(4326008)(2906002)(66556008)(66476007)(38070700005)(64756008)(66446008)(8676002)(66946007)(83380400001)(66574015)(76116006)(91956017)(86362001)(7416002)(54906003)(316002)(8936002)(55016003)(122000001)(110136005)(38100700002)(33656002)(9686003)(7696005)(6506007)(478600001)(186003)(71200400001)(41300700001)(53546011)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?N/AOxWkrrkw1m52pjKk5xVjUpk9DqUARbqPVWpc41n8+WFgC7G4xgZQfAt?=
 =?iso-8859-1?Q?8PMdXJVZU3cXva1pdFnmec612AYHd2XwUPUGqbyNBi8bKrHtWi/PlHjk1f?=
 =?iso-8859-1?Q?0Iixko0GDOzxyl4sv6lZuIobbucauNfDeu/D89/IU7cB9VYeZScTQE6tVJ?=
 =?iso-8859-1?Q?EL31Gg1VEr3XNyfLT4/VOV/gkb0hFK8LvjGlhZ6owSZhmdPfac72IDLBFy?=
 =?iso-8859-1?Q?L4tMoDmduyzsn95Q5ahOMS0QB538gxbcDhcIXsQbOUNxV5h+1rewpwyt49?=
 =?iso-8859-1?Q?V+Zcjm+VY7PniR0wHil8OJaUlIVdFII+8IoDFKoZ8v2xHay6IhO9HVXXRO?=
 =?iso-8859-1?Q?/diUCU2ja9mXRGNDGqqDBdd3tZhoPT/NRCSiJMobk+u/DfSUJsiJ0pSu7s?=
 =?iso-8859-1?Q?xUG1/u4z/xcBF44aMnHrbSVnDCku85uanlmIPOlWchJ0FsCnGnJXyTMp/t?=
 =?iso-8859-1?Q?eIhtU4QhRZa+JDrshrju80aXcFs5NLbv5vtO4EM9hTQKG+wgL2soRmKzTZ?=
 =?iso-8859-1?Q?ScKOms76abPgH7q3Ms5xuVnSFKwDu9MUUx141K9FS4TiRf8BiJTFJqk7qv?=
 =?iso-8859-1?Q?snFMJTXNkvIB5hZ8ju+vKTF4F/cHbczJ17prNbQPRl5qrudupO3zXHrE1k?=
 =?iso-8859-1?Q?wSxgxc8FE0ZrSBE8j3ILTjmZBwnBvO7C9fE1RiuSKhZ6L/mbjqnDiVDB9a?=
 =?iso-8859-1?Q?2x5o1/AGNz1FrndLE4nX6EVWDubHuolglEsNiMFMAhZmi3XZziXslpr8Ns?=
 =?iso-8859-1?Q?WlcocI+1XblNKZ73CHhS4OlPXSnKX6+X5jTw80gYrcx6Z2DSZLt0vdGjUp?=
 =?iso-8859-1?Q?0oMX/oz+4xfS9eaN5a9k17wJMGfxyI3Z9AamWNBprBWQhtgn+LK4uBG7lc?=
 =?iso-8859-1?Q?PImGE0oKRQR8L6M6RYkgbSX/mrGV5a+05Ax8hYFvfGVNQTqcWbpEqmvZob?=
 =?iso-8859-1?Q?G3tBJoSxPBM1b6lxRvMcYyjwH33NfL4rLDU24p1Fn5aPiXBMorx/xlHn0G?=
 =?iso-8859-1?Q?JiCNDpvRGEkaUyflNrYKVielc+HzxILEF5rD6wKQ4Wxa6mqxfK83kEuj3W?=
 =?iso-8859-1?Q?mTR5JVI3K9dVsaEOJ675RNqRsQP1viyM1biEXgcbCwEFxYXbi4WDiLPhaF?=
 =?iso-8859-1?Q?Ovwn7vYjYT0s/+jp3hCZReXiKBC7YWcrQp/9z92zy4ky+7gxupYpKeOAyj?=
 =?iso-8859-1?Q?abVtWLB7JoJS81H1MUBEmyVag9ikif+XVWaRMUErwsHJPFPNYHCsX3J2t9?=
 =?iso-8859-1?Q?K87oYJ0yanppxwWW/S/X6sPzD0wT+Pqe88RDGRO/NjfjCMmA1typsmhobo?=
 =?iso-8859-1?Q?zw50jWP4JsPVp2sk1pB0QgVmY3cOLViFMLk+aN2+a+BAM1MNQ2i8uGKiZx?=
 =?iso-8859-1?Q?YfTK1eEDfOgre5E4PMQWdVJrOwoWnMaLZk98Mmsgi6YJydLuErlvmKRi3Y?=
 =?iso-8859-1?Q?BVYfALH9b+oQSrvBpDvdjMD76spkmuZ9wAYYgiUNiX7YD4Ai1jJUOjpyJj?=
 =?iso-8859-1?Q?C3VCMLsKyQe981+oYivVChK0AWqTP4aaTLJze0bquuxZrxhpg0JXNSrkLO?=
 =?iso-8859-1?Q?N5G6mS0rELAVMndEbTSkiVSpKUx8CSGvOoPcYZofDyWvKhYNOpXKcQMVun?=
 =?iso-8859-1?Q?hc5FZe9GxAp6WJjzjs3KzhGGcCj1kDvqBp+UM7z1mK1AEA5ZoTJbiNRQSF?=
 =?iso-8859-1?Q?l31Gsbc2bAWmnjGySzZSSTRL4cn4vZonUIf651MYfUkt9olulH/82oosWW?=
 =?iso-8859-1?Q?XMCA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: tdk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cf1264-621f-4869-2f00-08dacc7159dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 10:07:23.7006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7e452255-946f-4f17-800a-a0fb6835dc6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOWxhzhYEijEnOXlpGi9Q7WzwsTlogHvNT7cY05Mrytpcz8WSbAAYPJ8fNXZ1CtPc3p+t1ctT7qCqV4OLUbhoXg0KypcEYVvkBcsbxura78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2686
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,=0A=
=0A=
looks good, thanks for the patch.=0A=
=0A=
Acked-by: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>=0A=
=0A=
Best regards,=0A=
JB=0A=
=0A=
=0A=
=0A=
From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>=0A=
Sent: Friday, November 18, 2022 23:38=0A=
To: Angel Iglesias <ang.iglesiasg@gmail.com>; Lee Jones <lee.jones@linaro.o=
rg>; Grant Likely <grant.likely@linaro.org>; Wolfram Sang <wsa@kernel.org>;=
 Jonathan Cameron <jic23@kernel.org>; Jean-Baptiste Maneyrol <Jean-Baptiste=
.Maneyrol@tdk.com>=0A=
Cc: linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; kernel@pengutron=
ix.de <kernel@pengutronix.de>; Uwe Kleine-K=F6nig <u.kleine-koenig@pengutro=
nix.de>; Lars-Peter Clausen <lars@metafoo.de>; linux-iio@vger.kernel.org <l=
inux-iio@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.=
kernel.org>=0A=
Subject: [PATCH 171/606] iio: pressure: icp10100: Convert to i2c's .probe_n=
ew() =0A=
=A0=0A=
[CAUTION] This is an EXTERNAL email. Do not click links or open attachments=
 unless you recognize the sender and know the content is safe.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>=0A=
=0A=
The probe function doesn't make use of the i2c_device_id * parameter so it=
=0A=
can be trivially converted.=0A=
=0A=
Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>=0A=
---=0A=
=A0drivers/iio/pressure/icp10100.c | 5 ++---=0A=
=A01 file changed, 2 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/iio/pressure/icp10100.c b/drivers/iio/pressure/icp1010=
0.c=0A=
index b62f28585db5..407cf25ea0e3 100644=0A=
--- a/drivers/iio/pressure/icp10100.c=0A=
+++ b/drivers/iio/pressure/icp10100.c=0A=
@@ -530,8 +530,7 @@ static void icp10100_pm_disable(void *data)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_disable(dev);=0A=
=A0}=0A=
=A0=0A=
-static int icp10100_probe(struct i2c_client *client,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
onst struct i2c_device_id *id)=0A=
+static int icp10100_probe(struct i2c_client *client)=0A=
=A0{=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct iio_dev *indio_dev;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct icp10100_state *st;=0A=
@@ -649,7 +648,7 @@ static struct i2c_driver icp10100_driver =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D pm_ptr(&icp10100_p=
m),=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D icp101=
00_of_match,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
-=A0=A0=A0=A0=A0=A0 .probe =3D icp10100_probe,=0A=
+=A0=A0=A0=A0=A0=A0 .probe_new =3D icp10100_probe,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .id_table =3D icp10100_id,=0A=
=A0};=0A=
=A0module_i2c_driver(icp10100_driver);=0A=
-- =0A=
2.38.1=0A=
