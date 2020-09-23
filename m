Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3127C275850
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 14:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgIWMzT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 08:55:19 -0400
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:29622
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbgIWMzS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 08:55:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/aqIEPRNi42PqL+iYdBtuspWuNeTgCb70FTAveulwShLGHljv8qfVna1uUjV8G9W4A917Tf7HMz7jaZArEHAyZmwMPdznRoUcBNgkyEJt7RgKw5NorWiRvOttUQV5BA0kfl4BH3ZnyI19c5rTghwfuDjMxWCREWIz0lySIFqGBKuuGiSuylbFqnB4ZTriAox9E6fZL4DIKhIC0HtAtBjVaNB1qzYuFhRXQ2edGe6QAPXXtf4Xh7DpVwgBcFLblu0kRhPffBXJry+/ejW6+rKouILgpD/4C1ffIGBAEjQaOSW+pSG/QMWzuIf5iGMLpnwPEHgGRBbEDu7QI/KYlxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY19YRysuSpFk8Kl+ZNKQGQZ8tETwZhL4OA3aDYUMl8=;
 b=Cg28DfZU1yB51BBju/oldwtgWKOmXopa/X2nkNbE2qOurRPDbMyhw8U4XdDUA+4sXlDemR6axt7kFBgYrL5+br8M1wDIElwlp8pXW4v7S0f8G3Vk4sYP08zkuvUqdLj7W8DwRJRuOy1QpGLnuWgYJq0laJrnc++6FZUNtB7cYi5zpRPsAVNughK77pFfTeEPN5VogOJAw2a1aGfNP/P9cBBKnsYQi0rtV/udxQGW9uivFo9986lMIJl3wZsMkH4wBV8nLfWt76HBw7l1TEDZxrBXxz/we8mKIrGp20dD36ZgeH1/j0DwmHdBuhS0s7Z8857HL4OscbRqNGoR6aZa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vossloh.com; dmarc=pass action=none header.from=vossloh.com;
 dkim=pass header.d=vossloh.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vosslohcorporate.onmicrosoft.com;
 s=selector2-vosslohcorporate-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY19YRysuSpFk8Kl+ZNKQGQZ8tETwZhL4OA3aDYUMl8=;
 b=g99yjFCZqmglrUgsiFx4Ij+ByqR4hdV+12WQTUJASakhjzURNJ0GX93ZQXD1uu0siNoz7cqF/EZO2+oxiXRi1MQC0YW2FMdvRwqMXqGRgcwCEJpRKCZVy5zSQYB/cwwnWoeSCoXYZd3b+XOGdxmv8R52fv0BygrHt93Q5wdTvuc=
Received: from PR3P193MB0731.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:32::22)
 by PR3P193MB0878.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 12:55:14 +0000
Received: from PR3P193MB0731.EURP193.PROD.OUTLOOK.COM
 ([fe80::21b9:7ba1:44b8:8510]) by PR3P193MB0731.EURP193.PROD.OUTLOOK.COM
 ([fe80::21b9:7ba1:44b8:8510%2]) with mapi id 15.20.3391.015; Wed, 23 Sep 2020
 12:55:14 +0000
From:   Vincent Nicolas <Nicolas.Vincent@vossloh.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "jochen@scram.de" <jochen@scram.de>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
Thread-Topic: [PATCH] i2c: cpm: Fix i2c_ram structure
Thread-Index: AQHWkL9nLTg1aV//8kC96RelQCrk9Kl0mRmAgAEzkEGAABE1gIAATHWB
Date:   Wed, 23 Sep 2020 12:55:14 +0000
Message-ID: <PR3P193MB0731A954E01511C22259ECF0F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>
References: <20200922090400.6282-1-nicolas.vincent@vossloh.com>
 <956c4b63-f859-df0c-2836-80a988ee6aa9@csgroup.eu>
 <PR3P193MB0731945473A9F251C7F37608F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>,<2ecfe18a-61f6-bb0e-22c5-b7ab79a77d03@csgroup.eu>
In-Reply-To: <2ecfe18a-61f6-bb0e-22c5-b7ab79a77d03@csgroup.eu>
Accept-Language: en-150, fr-FR, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=vossloh.com;
x-originating-ip: [2a01:e0a:287:860:29d1:d0a8:b1c3:1cbf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84550af9-38ac-4210-cb9b-08d85fbfea40
x-ms-traffictypediagnostic: PR3P193MB0878:
x-microsoft-antispam-prvs: <PR3P193MB0878EE9BD5F970E53260D239F1380@PR3P193MB0878.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KfM7C7Ig8AHCGDs1mMzcdIkbtKEDWm3JWwL6GI/MCUcbbzbwLhxTFUfoSOl6ERdAlKb1a0ptZVGd4nnN6lpz56aJRituQI2o04klgB0xS4NCp9YwJBBkfrwyuhKO5s5R1O4zSKMyljvyloINySeHXh8oTw4QWyLtzXEW2hvrmHbEP2R9UqOTEoCpvfQ46zEhzndCn/yXBUbE3G/BLhlNlWosZGAa72FBE4Hezd0udDc7sk9oK7ghGpkjbEvCvo52mhq7pG6cyVG9MunoeG6S36yq8fkBIblaQ5siIbScoCK1x4et1ikpfbNNmdQzG8NAosdKOa1JC0lMmNBDQ+FrPVWhoTTgUxWPlMoE6sBoybeffCbwnzcuZm2xsmC3/lDn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P193MB0731.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(33656002)(66556008)(66476007)(76116006)(66946007)(4326008)(478600001)(66446008)(2906002)(54906003)(86362001)(110136005)(64756008)(186003)(52536014)(8936002)(316002)(55016002)(6506007)(53546011)(71200400001)(83380400001)(5660300002)(7696005)(9686003)(66574015)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ENjyKB5DvlB1d9F5ekO9060ItZdYwYMduL8s62hu2Jx1aBtX6eyVjnew/WX7K9N8pfDXHCUFygLOvRymRYYndpWEtoFOGlH+ZOBkIYBapwNmHIfA8IjPtzn1tiPNrOXmKicQlbXDMGCnrAZBAdtN8nA3ueHhxd9rHFmyhQfa2BrLt8HbvHNCA4G0jSGCKMRdwAVrj3I2DveLxaUegzTP9dnVivJzYLPiim87xe/DaOPLySFYrjJ5iWMXmuh6v/CiVwinD4Ov5CK5jQHcDSuXR1vAiX6DYaj4eUZBZz1/zm99SOBBH7QjKYcArVxodRy/9ZHXiHervmU3BJMXh7DykZ/qJKNE3TjAagESBKYAONSVBKpTqzTcFAOjGYu9rPRJj8ELE8xDlBwQJ7h8jy/puw4QaxTVBvxCAz+cTwASx1yph7/hAxH/Pzl1BzhSSUwaeRJrBQgk0BAikVcWxAf31SByL3SRgdmeLO85sfXinuBaPMkT71l2ZXSXugRzNlU/q+6NQEG4Bu54aMir8alHrcajD2d/YWHCShsGMBrXVNgCiASecbv9qkcrnwIRuwz5+w9pd/5NNemH/qbi9aQhftMmxdl2mPC8IKopAA4t/hR9OB8Bzb6BoPVSy85bjEeFcKfvjCDhb+1zDA1MhfKWr0z67hzGBjbBxhvQ782WGts1g7TuTRkEeftMj++GdXUj/2My8SNZhGSMmnSWl+a8Tg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vossloh.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P193MB0731.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 84550af9-38ac-4210-cb9b-08d85fbfea40
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 12:55:14.5267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1790b5b9-9585-4043-a430-926cf37fa9da
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPlucD0bS2fMab1tXSGmy7EALi1a4Uts6sz4ij/eZPaAHMY/HygebETzZJ6hjntviyH4QObzY13sh+ruhqSqu6nQnBaMYLyTQ5fblGGEg8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0878
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=0A=
=0A=
> ________________________________________=0A=
> From: Christophe Leroy <christophe.leroy@csgroup.eu>=0A=
> Sent: Wednesday, 23 September 2020 10:01=0A=
> To: Vincent Nicolas; jochen@scram.de=0A=
> Cc: linuxppc-dev@lists.ozlabs.org; linux-i2c@vger.kernel.org=0A=
> Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure=0A=
>=0A=
>=0A=
>=0A=
> Le 23/09/2020 =E0 09:18, Vincent Nicolas a =E9crit :=0A=
>>=0A=
>>=0A=
>>=0A=
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>=0A=
>> Sent: Tuesday, 22 September 2020 14:38=0A=
>> To: Vincent Nicolas <Nicolas.Vincent@vossloh.com>; jochen@scram.de <joch=
en@scram.de>=0A=
>> Cc: linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; linux=
-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>=0A=
>> Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure=0A=
>>=0A=
>>=0A=
>>=0A=
>> Le 22/09/2020 =E0 11:04, nico.vince@gmail.com a =E9crit :=0A=
>>> From: Nicolas VINCENT <nicolas.vincent@vossloh.com>=0A=
>>>=0A=
>>> the i2c_ram structure is missing the sdmatmp field mentionned in=0A=
>>> datasheet for MPC8272 at paragraph 36.5. With this field missing, the=
=0A=
>>> hardware would write past the allocated memory done through=0A=
>>> cpm_muram_alloc for the i2c_ram structure and land in memory allocated=
=0A=
>>> for the buffers descriptors corrupting the cbd_bufaddr field. Since thi=
s=0A=
>>> field is only set during setup(), the first i2c transaction would work=
=0A=
>>> and the following would send data read from an arbitrary memory=0A=
>>> location.=0A=
>>>=0A=
>>> Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>=0A=
>>> ---=0A=
>>>     drivers/i2c/busses/i2c-cpm.c | 3 ++-=0A=
>>>     1 file changed, 2 insertions(+), 1 deletion(-)=0A=
>>>=0A=
>>> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.=
c=0A=
>>> index 1213e1932ccb..c5700addbf65 100644=0A=
>>> --- a/drivers/i2c/busses/i2c-cpm.c=0A=
>>> +++ b/drivers/i2c/busses/i2c-cpm.c=0A=
>>> @@ -64,7 +64,8 @@ struct i2c_ram {=0A=
>>>          uint    txtmp;          /* Internal */=0A=
>>>          char    res1[4];        /* Reserved */=0A=
>>>          ushort  rpbase;         /* Relocation pointer */=0A=
>>> -     char    res2[2];        /* Reserved */=0A=
>>> +     char    res2[6];        /* Reserved */=0A=
>>> +     uint    sdmatmp;        /* Internal */=0A=
>>=0A=
>> On CPM1, I2C param RAM has size 0x30 (offset 0x1c80-0x1caf)=0A=
>>=0A=
>> Your change overlaps the miscellaneous area that contains CP Microcode=
=0A=
>> Revision Number, ref MPC885 Reference Manual =A718.7.3=0A=
>>=0A=
>> As far as I understand the mpc885 contains in the dts the compatible=3Df=
sl,cpm1-i2c which is used in cpm-i2c.c to either determine the address of t=
he i2c_ram structure (cpm1), or dynamically allocate it with cpm_muram_allo=
c (cpm2).=0A=
>> In the first case the structure will indeed overlaps with the miscellane=
ous section but since the sdmatmp is only used by cpm2 hardware it shall no=
t be an issue.=0A=
>>=0A=
>> Please, let me know if I am mistaken. If the patch cannot be accepted as=
 is, I would gladly accept pointers on how to address this kind of issue.=
=0A=
>=0A=
>=0A=
> Please use a mail client that properly sets the > in front of=0A=
> original/answered text. Here your mailer has mixed you text and mine,=0A=
> that's unusable on the long term.=0A=
=0A=
I changed my configuration, please let me know if there are still issues=0A=
=0A=
>=0A=
>=0A=
> I think you are right on the fact that it doesn't seem to be an issue.=0A=
> Nevertheless, that's confusing.=0A=
>=0A=
> What I would suggest is to leave res2[2] as is, and add something like:=
=0A=
>=0A=
>         /* The following elements are only for CPM2 */=0A=
>         char res3[4];   /* Reserved */=0A=
>         uint sdmatmp;   /* Internal */=0A=
=0A=
I'll repost the patch like this then.=0A=
=0A=
>=0A=
>=0A=
> Other solution (not sure that's the best solution thought) would be to=0A=
> do as in spi-fsl-cpm: use iic_t structure from asm/cpm1.h when=0A=
> CONFIG_CPM1 is selected and use iic_t from asm/cpm2.h when CONFIG_CPM2=0A=
> is selected, taking into account that CONFIG_CPM1 and CONFIG_CPM2 are=0A=
> mutually exclusive at the time being.=0A=
=0A=
Unless someone argues for this solution I will go with the first one.=0A=
=0A=
Thank again for your time and quick responses.=0A=
=0A=
Nicolas.=
