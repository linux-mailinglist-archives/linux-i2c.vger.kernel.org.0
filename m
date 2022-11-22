Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43793633A72
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 11:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbiKVKra (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 05:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbiKVKq5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 05:46:57 -0500
X-Greylist: delayed 2229 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Nov 2022 02:44:53 PST
Received: from mx0b-00549402.pphosted.com (mx0b-00549402.pphosted.com [205.220.178.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9454BDA
        for <linux-i2c@vger.kernel.org>; Tue, 22 Nov 2022 02:44:52 -0800 (PST)
Received: from pps.filterd (m0233779.ppops.net [127.0.0.1])
        by mx0b-00549402.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM9L3gt025276;
        Tue, 22 Nov 2022 10:07:03 GMT
Received: from deu01-be0-obe.outbound.protection.outlook.com (mail-be0deu01lp2170.outbound.protection.outlook.com [104.47.7.170])
        by mx0b-00549402.pphosted.com (PPS) with ESMTPS id 3kxrghhyex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 10:07:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jND6P7Z6vpr5dAf6lgOVDfGBOYE2PAoey36iUE7J6ywg6focAm1s5wGoUh84+BArvjSVzFslsku97ZEzsMO6K5bfuG8RoRxgzqB8RJdJPjY0zKcBY1yHfetSgzgOIkmv1iZYVpRXkraxMqDoUk/e07/vjdPPD2tktTShIrnnGtDM/lIiAua+nG0G6o2AqB7AmkaeGkRgntoe0RhARP96bZXbe2lFAzqIvJtMX1cqT8FJFBfhs99spci9j8sPefLr3Ul8b5QGgflqD26ncjVATjmvFvsk917olfk2oeWZmjI0U1A6vknrbNyUU9zNWrFDAOCVUzmoxkyQ/NvA0M1hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjJGTPGn2pldtrVhkZ+Go8l+C5SPBS7pv2f3L7+qEKs=;
 b=Ayy1UNycVOo8u+hAqgus391L3kUFeB9/RxwNVLgKM9lctR2Rm2RvobH40Y4Q31gi0mKqu1HbMIHVjMvRNCnRCgYXWMoUNFouqW+XqMPwrsCeo/UpikqBYSGZfiE1zFhkOoFPnSgfdv3jeOstPuC9M1h77neKspf0OpqDsQSGNZrSWPQ7VWkHvzO1BNFou5hkUkgnRgu5sC8ize/zf5Jmv3s0tI19z0bcFeeVL0hGnNDEPZcgWlmyi7Qli+FlnReBpgqNtP8QdQxI6JIPYiTFDaIyrJsPTHwKNGePWwLPbXlNdYNb3Xjv8fC1rizkdKxwVVmt9Mwss+nKCd820FjlhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tdk.com; dmarc=pass action=none header.from=tdk.com; dkim=pass
 header.d=tdk.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tdk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjJGTPGn2pldtrVhkZ+Go8l+C5SPBS7pv2f3L7+qEKs=;
 b=a3KkHgN/AwmIxjXILCPpZ+7ynr4f4pqbBwIV5rWKlqhgl4F+/cFJSzHAZsbuNy98kaoGHrG1OVPDuXroRqqBJRwn5t3mishcN6l3ogryGaKrUjcbKOesziJ/I5wqatJtTGeplt5PDejD2xIH9Wt3NI1wJl7dFrEsFwOElOTG7MNGBC8xFi8Su7/pGFTgkDz+EEsbTBlpNCbEESvXuZ2CMerx+0Z+x0HUP+je7piXL0HqQedWdER7sTogHCotUAcX7GM6UQBKhzahm1P8ETG1uTSOqFrhig9TvcViygRKSZ1eyHLi3gCfX/CZPC3mO1CAg7YboZrRe1CQWjvJndcuRQ==
Received: from FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7c::11)
 by FR2P281MB2875.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 10:06:57 +0000
Received: from FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5fdb:b2bf:a02d:80c9]) by FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5fdb:b2bf:a02d:80c9%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 10:06:56 +0000
From:   Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Srba <Michael.Srba@seznam.cz>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 109/606] iio: imu: inv_mpu6050: Convert to i2c's
 .probe_new()
Thread-Topic: [PATCH 109/606] iio: imu: inv_mpu6050: Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5+tPwx+5WJP2EGA2M4jnJOfJK5KvEBd
Date:   Tue, 22 Nov 2022 10:06:56 +0000
Message-ID: <FR3P281MB1757B43210DEA557962CF9B5CE0D9@FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-110-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-110-uwe@kleine-koenig.org>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1757:EE_|FR2P281MB2875:EE_
x-ms-office365-filtering-correlation-id: 446bccca-c31d-4574-2e26-08dacc7149d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ooijYY5WPMMm/cZHOFGw9sXvwVjHUdq/I2EotTSx24nS+1uWUWKNXYuucPG8FdT7Tzeq0oA0S43TrpuuWpC2SexSFiMzJPFAVd2bXQm1Gbeu4/WnOfHEk519Qy4SdYNBNoBanoveRjGwa6z0pPoHtjJX3J4TkMyECTDTaUIm+GTh/Qzi/po5ggSddEnMQyOxDE/xkuVe+Vwe4lb1Iwh+H+lJ7+nXiIAwK7x09nmAVgySt5AXuX13tYJBIv9ts5thIY4hfOkcY9Qm8PEj/S9DI+CYuTc1HQiTWNHDp/MRQGCBsgadYl2PYc0ei2Fbu5cVSokKIqM6SjZQ4h2Ej5q/dnwbWyRxoRU41YcLLu7P3iQCPiF3I+v6Syhyw094rk3OoZaqXYVqpHjiTzV27B9/wulzqtdObpa3HS5GI/E+Z6SniIpuuG5tkws2d+u11u8T8ZOgOdqneOaBv5aAxYJ/ZTJr1zYx3taKuE1S1l9Mjb2BuPLoBmhIP5YGg2PK+3tflYxAVDrkPwmOwcci3a0xvePulSlcf0/6Gba5QBMUvkFX4zXw2toBjx5bdzP41K/CIJgmUdq3KW8rZmayDiWUCis9qdtJQZJXOl0g+UWDaosSkSZv7zS3TZT2OP2gcP3lqcnCzPi5nN7D9WIkH37Hhdp+GjKysFYKqFN5ijzgOGcTcuyziP8FUUllWYkGCToGCdkmjack11TrxTXbXyjqYfnSPdnpfYKQLw+IxsniSHk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(451199015)(71200400001)(478600001)(38070700005)(6506007)(53546011)(7696005)(9686003)(83380400001)(2906002)(41300700001)(76116006)(122000001)(38100700002)(86362001)(54906003)(8676002)(4326008)(66476007)(66556008)(64756008)(91956017)(66446008)(316002)(66946007)(8936002)(66574015)(110136005)(5660300002)(7416002)(55016003)(52536014)(186003)(33656002)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7WBrVpU4YO6BMbXMdhJWPd0jZGMyMh/qOQXljx/KXilH7EIZxyeyiOYcN/?=
 =?iso-8859-1?Q?iQ8+bEYwK7BvBT4A5sIWnQbT+fGQ6tQ2uTF+m11WqHSNIKEoXChJajRceb?=
 =?iso-8859-1?Q?uWpSa6eQYa4V4OufgikrDFjAMrqY0Eo0L/G/D/+WW9YRa4erBAAl56uOQ5?=
 =?iso-8859-1?Q?ZBkQN7nk8n8GLRcn6fWfKs1JIVIFj4OapcYPG17nHCMypchhLkQnNE/KL6?=
 =?iso-8859-1?Q?HMIseHbPqxpphnbIVOP0T+da3Lp9v+qe4YHdNzeRwBYeakAjCq4aqdopzs?=
 =?iso-8859-1?Q?HkrF1Z2Vit4k4OObyBHegvOxbqRoTVMwiYfsbcOY5DRYuZdvj7q+gT+Oq4?=
 =?iso-8859-1?Q?5pPrNGrIzOUaBzVS7fy+NSmnRin2vHZNNQLpVQIfIENS0aS1z3NNqJunAF?=
 =?iso-8859-1?Q?6EyaLSu1nx2ESHqhkCUUqSbkS7f9UYnMzhZ7O1ACztdVz0oaNfGGQ5YUiQ?=
 =?iso-8859-1?Q?T60oq7dzkOvQiltqRN81kzwzkrYubyIbLvepVte7wEkE/yUwvQDlrCkV4x?=
 =?iso-8859-1?Q?5jNLJ8K0bBXl1DrtPiT8CYIActojyTHsOZCDO8CsF6zvm35AOYTQ+9TWS+?=
 =?iso-8859-1?Q?Ye+dOuqrMx34k7mJhQiRrzC2RWJT/kzrA4FHtj9fw986FC/x04eGEhIp+G?=
 =?iso-8859-1?Q?MqslR0yp7BB7MnCpvuTVTagB9bpBRDEO4Yno3FR52OKzGGBEYp2Wh1+Koo?=
 =?iso-8859-1?Q?GO8+fUo+R87yW7qUyWjVRuyeXS6JOrI6oqO5cy6NIq0mXmOj62tlanl32e?=
 =?iso-8859-1?Q?FGF3w0dV5G1dtO3V1tCT/nF5T7Fzurjr6BXqOwzrhNaY7xcOYGDe4/dbyI?=
 =?iso-8859-1?Q?HRPyPpMVADmtnApl3ycBXqO3lDsL7nJoEtXQsyF4l3XmuvbnwkGknmybl6?=
 =?iso-8859-1?Q?cgVNHSUnMN4dRruoz95irNYC6YYOYPCH4ttwOQKkwHfcqfKMlSpZ+0Surm?=
 =?iso-8859-1?Q?rvLV783Rqqnrgc/ij7jvHJPbCHDkmGRQKC+BdiPXI5B12Mb2DiEpRqssnU?=
 =?iso-8859-1?Q?gZ8R9pdolTcwoqtIbKrAuIAC5L6hg2V2XfXBrUsNuyH6281inYpSIjAlNs?=
 =?iso-8859-1?Q?+I7coNKBoWWTSqstOTdOqaTtJ86gUC0xWC9Yr8EQydBPvGkIYcsYWG1jKE?=
 =?iso-8859-1?Q?hQJv483+pTbYUG0EuTJMffyQC03UVEA4ru6o3gbSV0wttgYomG/g1o6FOr?=
 =?iso-8859-1?Q?7Ics6wYAEevVzVC1serKF0E6s0kW4d2U8zaOCVx1b6NBKWkW3BbulETyS1?=
 =?iso-8859-1?Q?BkE1qyRRd9d78QWrgM1Fuv0AQ2MpwWhwPWz10JbkOzpZB1bjfAxvTKHWVa?=
 =?iso-8859-1?Q?1hmTe8JgxaK7sQL7O7vkLKEM0gA/UGCA2rbPIzUW0cJCGChPPNpBn/xkIC?=
 =?iso-8859-1?Q?X6VBxwD955/16Wdt+0gHxlVkvZvMeMxhpI18B3IYzMMFgfin2YSGFt1c8o?=
 =?iso-8859-1?Q?0w7GOgjdhpUJwzabSn2pVoPrn92UgyQbSh6vDfdpFCzPwcVyyRyYrT8FOL?=
 =?iso-8859-1?Q?w8zo1Xht7OBc403DBnnQbpYTC516YENvCzYc8t0AYA2yzJgRFNkboVqAyc?=
 =?iso-8859-1?Q?0xQZasGZxWEOyhVcaqzEkKZKcjkb8sQfLsB4xhwdwgHKitOm2BpjVF55H5?=
 =?iso-8859-1?Q?2xfDTi7Ziftf9XQ0JTtHjbvBS62kWmspmNv7EPYSGhJxyTtyp5j7tvsjPB?=
 =?iso-8859-1?Q?8k1loeMfDt51pNJ9lXn7Iyt/qxVCxamJ31uXWFF+oiYrTMY+43qUzfLZYR?=
 =?iso-8859-1?Q?v+XA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: tdk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 446bccca-c31d-4574-2e26-08dacc7149d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 10:06:56.7850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7e452255-946f-4f17-800a-a0fb6835dc6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1SNy2+pm7EEWEIsLmBgEUFAr8wMwOnP+eKaNE7HUnnGS8gU+l84iDDRfz9kYmbsPDX8Vb6kvLLwnZfcDOc+eK+8l+iT5qAbAGzQrZE9fVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2875
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
From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>=0A=
Sent: Friday, November 18, 2022 23:37=0A=
To: Angel Iglesias <ang.iglesiasg@gmail.com>; Lee Jones <lee.jones@linaro.o=
rg>; Grant Likely <grant.likely@linaro.org>; Wolfram Sang <wsa@kernel.org>;=
 Jonathan Cameron <jic23@kernel.org>; Andy Shevchenko <andriy.shevchenko@li=
nux.intel.com>; Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com>; Ha=
ns Verkuil <hverkuil-cisco@xs4all.nl>; Michael Srba <Michael.Srba@seznam.cz=
>=0A=
Cc: linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>; kernel@pengutron=
ix.de <kernel@pengutronix.de>; Uwe Kleine-K=F6nig <u.kleine-koenig@pengutro=
nix.de>; Lars-Peter Clausen <lars@metafoo.de>; linux-iio@vger.kernel.org <l=
inux-iio@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.=
kernel.org>=0A=
Subject: [PATCH 109/606] iio: imu: inv_mpu6050: Convert to i2c's .probe_new=
() =0A=
=A0=0A=
[CAUTION] This is an EXTERNAL email. Do not click links or open attachments=
 unless you recognize the sender and know the content is safe.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>=0A=
=0A=
.probe_new() doesn't get the i2c_device_id * parameter, so determine=0A=
that explicitly in the probe function.=0A=
=0A=
Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>=0A=
---=0A=
=A0drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c | 6 +++---=0A=
=A01 file changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/in=
v_mpu6050/inv_mpu_i2c.c=0A=
index 7a8d60a5afa9..70eaa408e388 100644=0A=
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c=0A=
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c=0A=
@@ -95,9 +95,9 @@ static int inv_mpu_i2c_aux_setup(struct iio_dev *indio_de=
v)=0A=
=A0 *=0A=
=A0 *=A0 Returns 0 on success, a negative error code otherwise.=0A=
=A0 */=0A=
-static int inv_mpu_probe(struct i2c_client *client,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cons=
t struct i2c_device_id *id)=0A=
+static int inv_mpu_probe(struct i2c_client *client)=0A=
=A0{=0A=
+=A0=A0=A0=A0=A0=A0 const struct i2c_device_id *id =3D i2c_client_get_devic=
e_id(client);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 const void *match;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct inv_mpu6050_state *st;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 int result;=0A=
@@ -260,7 +260,7 @@ static const struct acpi_device_id inv_acpi_match[] =3D=
 {=0A=
=A0MODULE_DEVICE_TABLE(acpi, inv_acpi_match);=0A=
=A0=0A=
=A0static struct i2c_driver inv_mpu_driver =3D {=0A=
-=A0=A0=A0=A0=A0=A0 .probe=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D=A0=A0=A0=A0=A0=A0=
 inv_mpu_probe,=0A=
+=A0=A0=A0=A0=A0=A0 .probe_new=A0=A0=A0=A0=A0 =3D=A0=A0=A0=A0=A0=A0 inv_mpu=
_probe,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .remove=A0=A0=A0=A0=A0=A0=A0=A0 =3D=A0=A0=A0=A0=A0=
=A0 inv_mpu_remove,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .id_table=A0=A0=A0=A0=A0=A0 =3D=A0=A0=A0=A0=A0=A0 =
inv_mpu_id,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
-- =0A=
2.38.1=0A=
