Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E5D1955B7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 11:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgC0Kw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 06:52:28 -0400
Received: from mx0b-00328301.pphosted.com ([148.163.141.47]:24418 "EHLO
        mx0b-00328301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726284AbgC0Kw2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 06:52:28 -0400
Received: from pps.filterd (m0156136.ppops.net [127.0.0.1])
        by mx0b-00328301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RApnf1020688;
        Fri, 27 Mar 2020 03:52:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invensense.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt1;
 bh=YAdAil2EByAmnOnKo3Bheq01DoRT7Usv7JJwfCNN66Q=;
 b=R2jt3VIjc8bH7YH/I7bE28NCwniG1ZvecyvtaCfrcdtE4bdCPoqWUitDVPvdhRJpAu6b
 jOv8hnjBFiGOG523zbbbNYgEGA6taNC07ERZTmDQW88Y1hn6vG1qmSHPBoFEsnxnNKMF
 6U0ODyQeaTXm2x+OO/UBEj4araS+AXSOyckF1/mYUxXI6qTTw61jvwzamEfTsCsfxRaT
 rPRAq7glN+8n3yjijfEusHQMeAmjEixEN7sb3Gt/HgU2U6LZptGaNrRVcz/6MoX0BsJl
 /WAXEBrAweezkcsy6egHU7VPkTRi9h0IDwda1+On0X1zA+Vk/ght2KLEaJVNTjwBoZ3A /A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by mx0b-00328301.pphosted.com with ESMTP id 300bux0v9r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 03:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtPSfOOv08u3GX2JLcznwDVBH8oY+8D9hV2+Lp/lQbMGibnNGy/KzcLUxUxF0o73ASdS4F9sugQOBNq4blpmYDafcdACWXAZLCHA1XJaezyE8JQc+Wf0rKzadsB5eNDfHfNf6NDKnQExP9BRe6X5AKDJkAh2lbWwzX76ED6bZ6gi1lO27WZ/0rpj5CVEIJKjEvWGwMHybuJVQLFSd4Q6Sg8waiPgkDz7Vi3Hj+78oLWSUeCcAQJb5PXIeRPxblT5KZfjut1TgbvBDBE2hmx2j3yaojca+E62fXxs/+pNqHuNB2JP7zeJPMU8m83DAB2qmgtMsTzl+F13xt41Boa55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAdAil2EByAmnOnKo3Bheq01DoRT7Usv7JJwfCNN66Q=;
 b=ku8kaMTNcCdp1pd+3xO18fQdMMEY8BKa0s8o1KB6gjVMq0Wd+9NwOIDJS6wZH0rI9cYxaYnkApN+QpftyABRp8AkxlVCPdNodGEWTJSEryDDCatIfnupiHvypRlxkUK+kepgxtYSAlWY/4PlTSM5Ru8oWss8dnzp/S6cobik0NplPciJyU3ILHn+/DYIHWJEE+ETXM/BPRq/M13sX1gUEUKF+Ar/Em/yFubKbvvOW1f66RpW1685fOFdgWRPo2g34GOaLX9L7k+MpIO+qzT2CY/x47P1ASvZE+9hGyX1Pvf8MIy3O1J8ZmfnSb0XRQANBc1qqHmPBGq55ktETah7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=invensense.com; dmarc=pass action=none
 header.from=invensense.com; dkim=pass header.d=invensense.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=invensense.onmicrosoft.com; s=selector2-invensense-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAdAil2EByAmnOnKo3Bheq01DoRT7Usv7JJwfCNN66Q=;
 b=LOoMeksZwkHyZei5QQNQSDBEEbgohMZtb7VicxVmEFWCq/MwDDRs/bcdR7iL5mTNe1d2EpCPvUHWP7KwsvICBP3F4H5Rw2Vr+nG64hGx0UVVU4xpJFDD1ENqxk0gRvm+3muFQMuvxKXjQ8GQIhCJAaMljEbc05PtAUtbhGbRx0A=
Received: from MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 10:52:02 +0000
Received: from MN2PR12MB4422.namprd12.prod.outlook.com
 ([fe80::7471:da8b:8ca1:6af0]) by MN2PR12MB4422.namprd12.prod.outlook.com
 ([fe80::7471:da8b:8ca1:6af0%4]) with mapi id 15.20.2835.021; Fri, 27 Mar 2020
 10:52:02 +0000
From:   Jean-Baptiste Maneyrol <JManeyrol@invensense.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] iio: imu: inv_mpu6050: convert to use
 i2c_new_client_device()
Thread-Topic: [PATCH 1/1] iio: imu: inv_mpu6050: convert to use
 i2c_new_client_device()
Thread-Index: AQHWA7NBLBGRcKbNIkm533g4m2Qp66hcQ5oV
Date:   Fri, 27 Mar 2020 10:52:02 +0000
Message-ID: <MN2PR12MB44228DEA7CE19B853292FE38C4CC0@MN2PR12MB4422.namprd12.prod.outlook.com>
References: <20200326210955.12991-1-wsa+renesas@sang-engineering.com>,<20200326210955.12991-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326210955.12991-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [91.174.78.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7e5910a-5431-457d-08d0-08d7d23ce1c1
x-ms-traffictypediagnostic: MN2PR12MB4533:
x-microsoft-antispam-prvs: <MN2PR12MB4533140DC097390C0293D0FCC4CC0@MN2PR12MB4533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39850400004)(64756008)(66556008)(91956017)(33656002)(76116006)(86362001)(66446008)(2906002)(26005)(66946007)(71200400001)(478600001)(4326008)(110136005)(81166006)(8676002)(8936002)(9686003)(66476007)(52536014)(53546011)(54906003)(7696005)(5660300002)(55016002)(186003)(316002)(81156014)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB4533;H:MN2PR12MB4422.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: invensense.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j5KOn+qrCIQC0ienDwVdbbTKCPSRP2guh6ENbg9hBXCf4pFuRdn6la8Sm7cML7eJhGX1tI5lnAyIHXWNt2Opaq9x9bbywH2BSWkSYjScdol652gi3VyB6DXob1XPum89ev9paZpR0Z4SsBqDfSC9OVhLF/sb04K8j9fy6BftqAW+HNajKI8y+xj3wVQySB/6/MBsuNAdveU66UcJPvMFJgO3k7kCqCLAw0AK6togcKcseUOsjnQAKy1W0BHLw0v6bKSfSu27TeYuGkv0+sXDTdDhBz46NhuCTZjrpP/HJKpzPnw2Bkgr24VMPo5LMr3W99jO/eQxw0Unca4IhGhEAFNM6u7BTXfSbXMWP9UwcodfgfCfFNnUXciq3W+h3O30S2ZnWtrJfcYLK0pRBYDFHFM0bisj8nBBqDat5NVKChObNKr0SwThsgzFUCPIhwWm
x-ms-exchange-antispam-messagedata: lF1se7bi4A1TGdwOhxL5smVAtsiy5dKb/vpLM2bVbttzezxtGxfovZun3QbR0vxGZn91FBXNEP+o6ShE9GICyyXG00WRIpWxu7DQjUXF5GZIWX4gwLJB6PG6rGDK5KG2BI4Hs2kFtI2A0Z0JFwx4gQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: invensense.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e5910a-5431-457d-08d0-08d7d23ce1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 10:52:02.2992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 462b3b3b-e42b-47ea-801a-f1581aac892d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMEsU8IilfofHRFRtgZR46Ph5WeRfuUvI+juthJlXrYTPMbtZ1WU6ZKS3o6CSlb678xet03INLkMKfPgYtYmKXNbWYGW/HgSbqU7xchZ4NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-27_03:2020-03-27,2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 mlxlogscore=978 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,=0A=
=0A=
thanks for the patch.=0A=
Looks good for me.=0A=
=0A=
Acked-by: Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>=0A=
=0A=
Best regards,=0A=
JB=0A=
=0A=
=0A=
From: linux-iio-owner@vger.kernel.org <linux-iio-owner@vger.kernel.org> on =
behalf of Wolfram Sang <wsa+renesas@sang-engineering.com>=0A=
=0A=
Sent: Thursday, March 26, 2020 22:09=0A=
=0A=
To: linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>=0A=
=0A=
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; Jonathan Cameron <jic2=
3@kernel.org>; Hartmut Knaack <knaack.h@gmx.de>; Lars-Peter Clausen <lars@m=
etafoo.de>; Peter Meerwald-Stadler <pmeerw@pmeerw.net>; linux-iio@vger.kern=
el.org <linux-iio@vger.kernel.org>;=0A=
 linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>=0A=
=0A=
Subject: [PATCH 1/1] iio: imu: inv_mpu6050: convert to use i2c_new_client_d=
evice()=0A=
=0A=
=A0=0A=
=0A=
=0A=
=A0CAUTION: This email originated from outside of the organization. Please =
make sure the sender is who they say they are and do not click links or ope=
n attachments unless you recognize the sender and know the content is safe.=
=0A=
=0A=
=0A=
=0A=
Move away from the deprecated API and return the shiny new ERRPTR where=0A=
=0A=
useful.=0A=
=0A=
=0A=
=0A=
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>=0A=
=0A=
---=0A=
=0A=
=A0drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c | 8 +++++---=0A=
=0A=
=A01 file changed, 5 insertions(+), 3 deletions(-)=0A=
=0A=
=0A=
=0A=
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c b/drivers/iio/imu/i=
nv_mpu6050/inv_mpu_acpi.c=0A=
=0A=
index 2f8560ba4572..c27d06035c8b 100644=0A=
=0A=
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c=0A=
=0A=
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c=0A=
=0A=
@@ -135,6 +135,7 @@ int inv_mpu_acpi_create_mux_client(struct i2c_client *c=
lient)=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 st->mux_client =3D NULL;=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if (ACPI_HANDLE(&client->dev)) {=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i2c_board_info info=
;=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i2c_client *mux_client;=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct acpi_device *adev;=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int ret =3D -1;=0A=
=0A=
=A0=0A=
=0A=
@@ -172,9 +173,10 @@ int inv_mpu_acpi_create_mux_client(struct i2c_client *=
client)=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } =
else=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 return 0; /* no secondary addr, which is OK */=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 st->mux_client =3D i2c_new_devi=
ce(st->muxc->adapter[0], &info);=0A=
=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!st->mux_client)=0A=
=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
-ENODEV;=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mux_client =3D i2c_new_client_d=
evice(st->muxc->adapter[0], &info);=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(mux_client))=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
PTR_ERR(mux_client);=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 st->mux_client =3D mux_client;=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
=A0=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
=0A=
-- =0A=
=0A=
2.20.1=0A=
=0A=
=0A=
=0A=
