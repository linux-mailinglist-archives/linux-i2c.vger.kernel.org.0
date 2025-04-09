Return-Path: <linux-i2c+bounces-10240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB67A826C2
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 15:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7118519E14B5
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 13:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B0C2253E4;
	Wed,  9 Apr 2025 13:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="mQi1T+cZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB23C3FB1B
	for <linux-i2c@vger.kernel.org>; Wed,  9 Apr 2025 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744206747; cv=fail; b=EC9TYEKffEOK+WOTXEw7zfAIqR/EJfUmUHRp/MyK/LNi4rJ3PjDnoHc+k4weLwwKuoqz9kqqeGSC5WMyarD4EiaEZgP9J9uYq3XfPjMJuvxtIJOzF6K86nNCgXyCr6ZXlQQmfkB/sLa4zaWiMdxd5bREBZCiLjQsruVgu0rp6uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744206747; c=relaxed/simple;
	bh=P7XA9oT0rDg4Tz48L2M7cmUgWj1skWt1yAHaOVIssLo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b+4ccvQ8JNmINU7cet06RpIbuivnl1rLiW4kUidUo5U90ApqxXCAaRVqPhDC6rSagYR+8sgivJXBdYcbi/YPZC9rl2JWBrLpOaOLIsAc3K0/ToONTdbESHsp0H7uui6UOdCGqeT/GxZXx1t3Y4hhxvLL/YEcTDXe3/zLpsjDilo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=mQi1T+cZ; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSwkq1UupiEd4X0z9Cz3n+5SmXwvefkGo5ssU9kd1Z7hnHVBlQmySXa8WldpW+4IDrMO1jAhDbugJ7jvmLvAWmO37Uf56DUAXgULTYzHbSzHuQ7Vl1OYtJvE1o6E8bEFXRUbNcu75pN6wBINT4tIJQfEVIKpfDOvTkBK1antxlZ0Bi3BatYtBHJ0jQGkcEerxvFfG7DryYXIX6WTgyKU5X4d9Bb595ESQ2KzzbNwKyxxncVrb5jpAF2hYChoOEWROIJLqSWrf60ZuAEXJwBGDMcNW/0fBAstchfMqLTC6/wG+aT8xlroa8aAMvx53xWNb0xlf9cuYaPomod9Jcz8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7XA9oT0rDg4Tz48L2M7cmUgWj1skWt1yAHaOVIssLo=;
 b=qGyf9sS/mV7dbFvIz0fPqwxmNVLO+XG/c6HbfSh290iKRp1wkmOu2e7daqqPCmJjfyMH6zsKlyeje+51TaQj+4YoGmzPfXsVcTgUqGT38V9PBztXsGmkBAsAD9YRyJUr2QEQwGeiwOCFO8A/+hs6pLHwIXquwYWKV36GPeQ8dpE8iqMvuERbuDyNM5zgqg5JR8OPd77uIXoJEsWJ3s98FSSGEIlr7/43icScJEHPp2BkKCMj6Jgo2EtxRUNXa1wVjNziofOy2VKdXZohImAUfTrnDWkwifYf0T9ZSl/K2DYfQu5rMEC3RvrBxKPQC8eCOvjt8Xbv4V+bBTDxv9elBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7XA9oT0rDg4Tz48L2M7cmUgWj1skWt1yAHaOVIssLo=;
 b=mQi1T+cZv8xdr5ED/L7qatgKkkKT5xtN/qut+Woidp4s4SUs+fNeWkHlDaSXPKOvB90+ssLiEOLCkYemy5H8TPJt0QvhN7TAbakLGuesM+Z/LUeCY6Kgdb6n2qUYYfcz7nJc23kyiEMsX4ENnSg9wng/mgf6XoAvOyOcauhCetg=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AS8PR09MB5371.eurprd09.prod.outlook.com (2603:10a6:20b:37a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 13:52:22 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:52:22 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [RFC] Handle targets with different speed by the same I2C master
Thread-Topic: [RFC] Handle targets with different speed by the same I2C master
Thread-Index: AQHbqFs/gVN2unV8DUyyXrxsBlCMuLOZqOwAgAGr770=
Date: Wed, 9 Apr 2025 13:52:22 +0000
Message-ID:
 <AS2PR09MB62965C94F5AD1F72FCAD281894B42@AS2PR09MB6296.eurprd09.prod.outlook.com>
References:
 <AS2PR09MB629642F8FF0F7CD6F3498E8C94B52@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <Z_UOLq4OZsrliH5T@ninjato>
In-Reply-To: <Z_UOLq4OZsrliH5T@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|AS8PR09MB5371:EE_
x-ms-office365-filtering-correlation-id: 3561d50b-73af-42fd-0974-08dd776dc097
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vEs4cd61awCtbb0Q+TBphA9B4rNFOF3JNMkHcfaMbz5i86ncQftjvDRIxE?=
 =?iso-8859-1?Q?OsvsfMBtkGcmUQWJOWraeuP8iB/XWYAUTA5SXURndAW+zr7IXpYQApmXHN?=
 =?iso-8859-1?Q?yVyQpy1icOj64EW1qqUAzWMecY6w2BnOrlKT4U0cWs0+uuv/uQxC/TUSnI?=
 =?iso-8859-1?Q?XWGhSTYsinZXIxFhFsrYRAdfm9ooSzUz1XnYvz8SV+NYQvUd5LFCEfHvjZ?=
 =?iso-8859-1?Q?z4LJXRAjFD6vxidAMnFtWH0JOZNOZd6VXuwHTvW8pcWysiQ7hRtVDCmJHA?=
 =?iso-8859-1?Q?tu54oP6HBQYhePiw6Dut95J10BjTKyb57j5U8ZErbN9cY6QL+lFrHYF465?=
 =?iso-8859-1?Q?bThCBAtRfUmbwqarTaruplZbJlEYh/ZDKbDs24gh2NscjFy20Hd+6Xvzvp?=
 =?iso-8859-1?Q?HGaD1Th8kdW/jP5V2kHcFFW/wDFGWpdGyxFouJmcO4kolq3Do1gpVwvovH?=
 =?iso-8859-1?Q?lcoIPmPiz7AWudEeXvntLp6BNz1J2d9OXdrm7CpFAvLAWt5nU1RUI18Gic?=
 =?iso-8859-1?Q?StiCF7jeDVYvijeLeJ5mNYKPaktZT+kdit9hZZZaWwvbxSnR1mq/tZ99Xy?=
 =?iso-8859-1?Q?aDO/9f1EjYcLyrFe9Wrg7R+zT36MhP+AfiUr8jE1VPZy6YMvWxE6kiU6T/?=
 =?iso-8859-1?Q?ATf2YVAnKvnvu1O9FbW6syTnW/gBR6XaiseWYOsT12ZMSvko8naWADz1qE?=
 =?iso-8859-1?Q?kfNdXV7U/pUeLMW8eKp1OfbOR6wJyzjdgToe6Ut7ZAFGCTIiDF3SIh/Xj6?=
 =?iso-8859-1?Q?qQYmOubJAtqeAy44nZIH6zxgJv1y4S2TJMDnETO4Z3Jve4robHEkk6fupY?=
 =?iso-8859-1?Q?IiScwZSOq/0d7P5QMBXewKFgDlPOI8Mx75br2hYy5EOxucgmt6Ux/M+XzA?=
 =?iso-8859-1?Q?MsT5bncJ1tHvBl0JKSrCIHdhtTpuJuydLNurWltkS1uU49gFioXRL8O9Sk?=
 =?iso-8859-1?Q?vTQ/LyNifl5D82M8ISj1B5Alo6Vi+CjpuBB5pEHe9nkclz0B2iQ6pWFLhE?=
 =?iso-8859-1?Q?/WwLqBteP9yhuaAxSqH00gdjYDovHEt9MZbztXAh5KCih6ca/m0W3lvqsq?=
 =?iso-8859-1?Q?Jde+aXlsiZDC5dumD/xa/jP6NbUOyFPrfGJzUGyF9qFBV+feKn1Uw8HHNI?=
 =?iso-8859-1?Q?h0B7DRzXF2fz93RBvlwS1aiGoa8VUA9VHNcxxtrFsRx5D1m0Za6JHhhCHA?=
 =?iso-8859-1?Q?xunAXxShX0FrX37o5p7G6FJJL1k8Z0o6cdWfsmyt1pcu+YylrCnZPWt3w0?=
 =?iso-8859-1?Q?tOxZUPZpHNMPsgFQVX5sjg1LltdNwIv1bLJU9eO139FH4BWLinK1tCyeIP?=
 =?iso-8859-1?Q?ZWqSk9eHWJyF6Q1XRJZaZEt/3fyvy+8JkVQ5EfFZrbibfQlf4SZm/QpkYQ?=
 =?iso-8859-1?Q?jRg6KnwSQFomXDcL2j/Iz6gd+AUL2QReRFi6kfh+Tdofsw47Aa0ppZIM1d?=
 =?iso-8859-1?Q?OkfdwmRTEDYPSd1cnAT9sO5zm/I3lxzzujMk7n+bTlwnNVx12U0nQLtmMt?=
 =?iso-8859-1?Q?xCLXDVB5JfRB1+29RSUZNR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fvvkf1Uz1N16mcz+CIzsGsRNCJggHx/4kCjJvIZJ2PcuyUMhtq7wmdMAzo?=
 =?iso-8859-1?Q?tEIxrISWX1oG4+WiR5+nApzSlD5y9VGeQJ1gZRa3yLPzn9MOjl+civXnFp?=
 =?iso-8859-1?Q?lp4SLmZYhKdAXE8jEYHNiflE8/vj8wnvBxFvFivmCblJP29QByX2m0uA7M?=
 =?iso-8859-1?Q?TUENmFoQ6qpmTdhBXMYXsRf8j2UgST0tiidMcql3lQMB+XAOPEk0HSEu3I?=
 =?iso-8859-1?Q?3sxbcoC8hBTFS1JpKqR7V/GVNqbZn7JWyEsPV7ADz16bRvaSS5j+FuPd1A?=
 =?iso-8859-1?Q?0Bo0/rR8RCbwR4LgVBazXQYbKQLdl+E8DUzfLtpbg9Fg2QSMVBmOc81ppq?=
 =?iso-8859-1?Q?JewnVu8atKfES/su96nr5s7gmKE77gNZxjYsDP3VnxHxCZMXBy+PZazEp5?=
 =?iso-8859-1?Q?/uW5hacM6h5ASEaUSdu0EJ6FiWwFoC1xyFARd67GByANfh8pVms/UIsdto?=
 =?iso-8859-1?Q?pNIZW8fLuNY139KfWml1O6WgUhKPctixR816C4wCHjk57+CPmDqEAXGQnB?=
 =?iso-8859-1?Q?4cZ3F+OWnoLeeFeyC9fWIRK3CuAcFeLsbe2jma8FS/F6gjLZ8hKNLd6Dhm?=
 =?iso-8859-1?Q?GTnnpIDlgpwDPAY3vy4V9UUVuKDN8ZgGQQA6uEZBiQbF0nOvxbdY4ePTMN?=
 =?iso-8859-1?Q?yVU1wNQVvaQKbEKJlKNh7JiyBQDKNFJ2C7sIiAmuvxpPf5oIImBjlG6bnE?=
 =?iso-8859-1?Q?qHT6YYHxjnOBM5SZVMkfvZxK3j7uSf2xo+3XF/HEzHX4zJDSRK41VI3JId?=
 =?iso-8859-1?Q?36L7K7JWJ8MGMSVbl+IP6tWcIaew0JxlRUfndT937zYny8mBaN9+/34DHE?=
 =?iso-8859-1?Q?WaICuaSk0LEwfPpYm6oTIMABqA3jgkK//mG+TTslMRVVPB49hdawqceis/?=
 =?iso-8859-1?Q?pk3nEUqbs9yfM4wCAJ0Qs9PUeyEMMON2e9PxXT8UfCaK1Cg9sMQZjEZ//c?=
 =?iso-8859-1?Q?3ukqnsS1QrgxfM/eMjZschjtW0Gnum8ILvG+Fxw+C04dC1heMw8aaW26sV?=
 =?iso-8859-1?Q?4u7cE8Ea4AbPK0fVyCbMZMFjp154yQzMXoDIEJNjpiVXiMWfmVYmFaunva?=
 =?iso-8859-1?Q?qQ60PN69xumQcEQe5hR1TG9to5qgJ5Mke39t5Y6QvPQxJ5H61B8Sm6dHcd?=
 =?iso-8859-1?Q?E46ZcaJHCvKdWst5SSzxEdYrjwMVeZkpItTFTjgVRJB50vM6ECbiYE3s8L?=
 =?iso-8859-1?Q?ufwEnhI2M4g5rwOJQDE/3LcbcwvBCR/Q5M1PDOLUN9RfHh0dZLlCFk8LI+?=
 =?iso-8859-1?Q?WjAg/8peG5R3QoaieHRch6SVrJ2Dm5rx4tXAK99hm0dfohjBWxyK4HpCOR?=
 =?iso-8859-1?Q?SSJySxhNm32DIFv+jJrne/Drus1ZEPmwSZIfTtDZfS0LhADF3+eInh5cA5?=
 =?iso-8859-1?Q?Xh+mloXJnap/YDsrUNmJUTF1mzPHzSbu9i+nvPdqEXkfZNx3Hja/N8RyRN?=
 =?iso-8859-1?Q?evdQPEA12IvSfLWJ9zzv1WVPG8zA13hhcSZ2R1mRo7obiwdeNy/jWi3AJo?=
 =?iso-8859-1?Q?WdssT6L4QL/R9WJLL+pKE/EckrvG1+sxoyvycgzCvCY9cSwqBFsJ9Rx/eH?=
 =?iso-8859-1?Q?OZWaLVTk6zn9koKN2pe9Py34/dFqrCGWjHa14aWA4zyY8LBrGrpQt/gYUb?=
 =?iso-8859-1?Q?rjtqaDeVQsQoWSsRQYr3BRoKSTcP1RJh6H?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3561d50b-73af-42fd-0974-08dd776dc097
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:52:22.2155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFbSmQN8Qm6hoXnA719b2//+jn+f1AuhfOL2OzTn43GJBGX1FxqTk9A6eJOJbW0hwFHDdIuS6I8dlmOtdcAZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5371

>> We have a design where several I2C targets with different maximum speed =
capability=0A=
>> connected to the same I2C bus managed by one I2C master.=0A=
>> We want to communicate with each target with its speed. However there is=
 no way to=0A=
>> specify the bus speed for the I2C message.=0A=
=0A=
>Rightfully so. Devices with a lower max_freq may get confused and block=0A=
>the bus if you operate at a higher freq. You have to live with the=0A=
>lowest max_freq. Or put the slow devices to another adapter. Or behind a=
=0A=
>mux. Something like this.=0A=
=0A=
In general - yes, lower frequency devices may get confused. However, there =
are cases where=0A=
device is not FM+ capable because it can't provide enough current, meaning =
it can't drive=0A=
bus at this speed; but it is still capable to listen and properly interpret=
 bus activity. So such=0A=
device will not be confused, and will not interfere with other activity on =
the FM+.=0A=
=0A=
This is exactly the situation I want to handle: FM+ bus in general, but the=
re's a device that=0A=
can accept only FM transaction, at the same time being capable to not inter=
fere with FM+=0A=
=0A=
In my case it is bus powered by 1.8V VCC with lots of FM+ targets and this =
EEPROM:=0A=
https://www.onsemi.com/download/data-sheet/pdf/nv24m01muw-d.pdf=0A=
This EEPROM supports 1MHz at VCC >=3D 2.5v and 400 KHz at VCC >=3D 1.8v.=0A=
Our experiments confirm it can stay silent when bus is clocked at 1MHz=0A=
=0A=
This is the case I want to address. However, it is possible to do more comp=
lex design where=0A=
slower mode virtual I2C sub-device, when switching bus to the required spee=
d, will also perform=0A=
other custom actions like connecting slow segment, and disconnecting it whe=
n switching back=0A=
to faster speed. This is not my case, but this design allows such things=0A=

