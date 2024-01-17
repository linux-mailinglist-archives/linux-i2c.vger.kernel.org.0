Return-Path: <linux-i2c+bounces-1359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD9830C6B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 19:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BF94B22DDF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 18:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D4222EFA;
	Wed, 17 Jan 2024 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MDcWXaqP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB622EF4;
	Wed, 17 Jan 2024 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705514820; cv=fail; b=ijepZ0nvjWtvWIkmET+0MQjo751vFe2hvfOmDhTi5eueZ3BoHbbC7oJ4d+VCWHBQqVLDj7dYImaMYUS3lljSvrmgUlRHnsm6AqnsIR/6aBNeRkhOpX+/hZXGrLwis3ZKpUxXgXkezwt8jy49/JEikPWUKOAntG4+Le/mgXHTsMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705514820; c=relaxed/simple;
	bh=TQaozLjRCFewTJvC/mGXo3Jz6+s6X/YaMxV30XLgNrQ=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=RrzMTKuXBPMljZPGFc9QgJdvmOUSrgSiYBJMJa51Wi3V6CmzlZGejjH5OAh+xRmJOjaO93SX+r1BCw91syv88jJR14P/SGC2IumbR1ezEUFwoQOu+gA6dqMZf8pEguyRj0fyUOklUoJZ9gvfEyI4HrR2ourY2mjEcZ8qCO4NyIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MDcWXaqP; arc=fail smtp.client-ip=40.107.237.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0GzTqJ5RfRMfp8LfEtyws+51SjJ4g5XN2N3F7KHi+lqAWaA/GL5bMxOLvX657H7NMY7gYR1n7mHMZdI4qhKFjWawmlLvwp4hUdzBQ+yXOEmWM//I1CoUnnPtRL/ND3HF03ZHdb1S1iXQCTb9lfgEallZiQTsMuBBkp/SrWrrm75GEksr/UfXUZJXgG1U7wgfLyIBag7Z89QbUp+G9nUu6qdUKk3mugcyqsCNjSTstnjgjF6oI0PN2EHkujRaljat8IA8PrJ1Lukij9WInvKeA6kCO+AnRn8mCgUeef/5ZyLgf4xCEbMiFMrdVkZ3pRKn7CTbdOKuIA4rnFNiononA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi5ZEyDJEzBLT5uDvnuApPX5nLyzFqyFFoQwIgs7N4U=;
 b=Lm8cvVgIl2bQSxBoLmaJ3u+WU4lseE87TOcawtjUqUboeMfuGn2MOg4ZdQXVkIVWacqo7WyiExLjYK2l4ju/LM2gRVQVXCfZsSk3BAebkEecE98JQAnq82wAyQZJLtePC4SW0JRDRm5paKboyj/P2uFuYFEfPzfhjj45HkGN0tvS9C8vGxbJPOYUNAfDmKrhUhIulKjWBECOsSHNQgwiDFGVQrnY8nW/BH3jTCvt2b9Nnf7fqUuugDDuKWwptUwmW43IDJEjYmVzVS/zo+vnQlQTtiCWEpeLk5LqEIPm9UOIorCHjl9+3EUoLTxWotXMCo0MUx9qvl1fbmQUVZfnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi5ZEyDJEzBLT5uDvnuApPX5nLyzFqyFFoQwIgs7N4U=;
 b=MDcWXaqPo4+thQnsYtAVRhH3AUQHzwr9mLhG4eimeFuTNOb6K2VgNA54jyzUeNiWLNdUZeQbzgOlkuW2/WgZYt2/AiRW4Dch082axSYwfZ2ZoN4rSa3TR4XfiUTAJW4iT3WGueEuApXthxIOD0dqHnpH5VXcGIQvqyTYY/VI1ik=
Received: from DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) by
 SN7PR12MB6932.namprd12.prod.outlook.com (2603:10b6:806:260::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 18:06:56 +0000
Received: from DS7PR12MB5741.namprd12.prod.outlook.com
 ([fe80::5f16:a55f:d538:1f2d]) by DS7PR12MB5741.namprd12.prod.outlook.com
 ([fe80::5f16:a55f:d538:1f2d%7]) with mapi id 15.20.7181.027; Wed, 17 Jan 2024
 18:06:56 +0000
From: "Boddu, Sai Pavan" <sai.pavan.boddu@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Simek, Michal"
	<michal.simek@amd.com>, Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH] i2c: cadence: Avoid fifo clear after start
Thread-Topic: [PATCH] i2c: cadence: Avoid fifo clear after start
Thread-Index: AQHaSUfcsQJjTnMwH0iIfDUOatck5LDeSs0A
Date: Wed, 17 Jan 2024 18:06:55 +0000
Message-ID:
 <DS7PR12MB5741FC0E92875C8DB7BFEEDFB6722@DS7PR12MB5741.namprd12.prod.outlook.com>
References: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
 <lzvb6oyinlmdrbaat6ayxioca5r2qf7wi3kt63lzorbjytmmbn@wfuz63znrzbr>
In-Reply-To: <lzvb6oyinlmdrbaat6ayxioca5r2qf7wi3kt63lzorbjytmmbn@wfuz63znrzbr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5741:EE_|SN7PR12MB6932:EE_
x-ms-office365-filtering-correlation-id: e952f3c3-668d-463d-4a9e-08dc1787175d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6LuSQH2g1kz7CUdwglnFFJs+eHAOAmpWjGJOerTgt2WEtqNMV0cYvhH4yq6PkulKpx66+Mj1eCOnuwEFUn3TFbDLehYB7gZg0mRWioEe5c+wnxHKA3KR5ChnMlBHxmNVbC/vM4Xd2Z0prTQv35GU7f2br2GLs6aSjsNn6wYL+BCS4k4JUnPAIMwmYlKEyqShouyJGIo63C28hfCX8OWGqobzrlWGFdkJ+XYQWpESbKjE2DRnAHrjvx4sD0gUvfXTNjQSMwnMpJYXIqRHvWijaBRWQsUS/yAl1mmzjEGd7/z3861VlB5bOSN/GbML2UynyWV1F+GQnMcVHH0y5/RMlqfAatPE9PMQ9L9/CaohyBYnv/q8gk1WB17nZ5XvDEt4Rktfblqwak8wqnWHy/vRdIeiZ8v/dgfVCuoZ1d4PqN4tmhlApWu6dRamToBl9BVL9XlO/fNmCDy0pmK0HUueUy1eUIqJt6xMB9s4ebAD/wDdl7/piSu4eIh9NecqcLPk/mQZJaZtjm29P69eA+dUEo5GOx7ZwjsM5JHGcxsAkvHrRex5rWP37JK0q2uZrMSVp92AXHpPpfTt2aCWnZYmBEAYhkZlxKgEU5HGlEqjE6B0ZlUxsD3uZR4MkkMRWtlK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5741.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(9686003)(7696005)(71200400001)(6506007)(122000001)(83380400001)(5660300002)(52536014)(4326008)(2906002)(8936002)(41300700001)(316002)(478600001)(76116006)(66446008)(54906003)(66946007)(64756008)(6916009)(66556008)(66476007)(8676002)(33656002)(86362001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MxfkmN2Oyr7oXhUTOCj1D1CSniKtuXYFh1FpFB95Ciwbg+x3Do2AgENQmLxd?=
 =?us-ascii?Q?GM+HXCl0k1B1t/UBnR4PD8gyGLKoG98t+u7XjFMHhuOfymTPfgXreH75o1J/?=
 =?us-ascii?Q?EeKTdNvT/kk47xHClO1MUeNAOUWZuJNBtTPZnFF5+CKK9QX7DhGR/4oLiy+R?=
 =?us-ascii?Q?TugIX8U6umTpJ1bwy/xOYg8QwSKDxLSCsKOWhWPoHJ7Kk1exbzXIUtMQo4ZA?=
 =?us-ascii?Q?h+DtQGdceVV+BEBXrz6EumVn++FuCRAUVcZQf6XjpP1AE2qRHUQFhbmDeh4p?=
 =?us-ascii?Q?HV1+T5Cz9zPceHTdd2gkPs2Z1IJXngukgaX0XYxtk6WP2VBrBEmOseokoqHw?=
 =?us-ascii?Q?iGmb9X62PCIvcov5fJIBY+MTDZ67UcquWOlJmb47WF7mrwtCQJE5hHmRDWoI?=
 =?us-ascii?Q?JSZaEyTMFKik0UImd8Fly70YapEr5n3CMDfKRJbSKTQrbmwt3jhNMD7LaEa/?=
 =?us-ascii?Q?lLvC66bLJzW6bsfEgDI64q5mVH5hFhJrSRnzDli/Vh2j3QlHtsNHmed3KPQw?=
 =?us-ascii?Q?Gf1mnxZQUjDWy1SmbZpcS/h2ACM9gQrm6u7+w1D6Jx/0IT+cSDNXO0YAWD2L?=
 =?us-ascii?Q?82z3wZJXtZsBRJdbS0uRpXJ9r+VIM0L+UoQjcvcAFl6JS3BjnHb10hK8cVf5?=
 =?us-ascii?Q?SBQroMn6PrN3enYYOW3iGZ8B8wHC8CkzPfSu02wUmo/tHnRbZsXAX+FNGNXf?=
 =?us-ascii?Q?1UcEcyOd3vvDfqnk7kHXI+DU/Lb/obePQv/h3oWkkSdDbakOFDVC4xezNumJ?=
 =?us-ascii?Q?kaW+gAiyUFQcI50L96q4fjr5hY0HGNwJHrrCqlpK7Vx13d+F7PGjk/PlJAoX?=
 =?us-ascii?Q?AOhtf8U48SIdBkSbUWUwyl2d8X8ZY5Zrg3i4G33yrTBWY77qkI7bEX4Usa3x?=
 =?us-ascii?Q?E5848J5JPwnY9+GaxOAR09nJzkftNQtw/tUF7EBKqHqYDPgPHGOXXjtX1zoo?=
 =?us-ascii?Q?Edi0fpatmfIdVTIEUH4Nct5ri3ebLKoX23cd1V/Usux3u2lb5aRPJBzZQgqE?=
 =?us-ascii?Q?k+zbhzpRV1xA7dQZQsdTYvZJwKXD90KF8iOsnVcG4f4LJeyk2hlKLAG5Jhyo?=
 =?us-ascii?Q?9ohJy+A+APCI1Vbm9hyi48HxSDHqJdKGtr0tYoMrd0zN7xPflE8c7bdVNzs0?=
 =?us-ascii?Q?gO4qRiMeYbt3mf1E9LTF28iukrngtQpUD2z7Q3LnUfBpczl2k3Da+BfEwBDL?=
 =?us-ascii?Q?t9567FzZlpV/z9X0LhHev6eYnhVtOx8eM1rgp6bCrPzxpzSnYbZMyLBFWjJ0?=
 =?us-ascii?Q?zRHTrbWeYqjqo4JhMksZ02+cGvzw/r8zNDHBNNRFV9lPcqF6uT8rQJ9azAxw?=
 =?us-ascii?Q?Ej1sxpFAKz179fUxmV9Ud4uxkMM2QkyYBguIsqW3D6NodkjSjNxrVozulSUl?=
 =?us-ascii?Q?JcqkJ96Ikl9WGj7sDA+8JibI2hZrFKbFtwuvU+j+2WK/+n0oBaA/isDlMEBc?=
 =?us-ascii?Q?gpRjaPPsMgytHtt5vK8bNRPDetwLnko668DbEdxEP5dtrM3qSNvehPFYl5gB?=
 =?us-ascii?Q?wsb7nJ4cNUMsUqu8ZRvk1uKeuSUscTvUD7vT4m2oCKDtef0QxQ4tiqndN476?=
 =?us-ascii?Q?CS+VrNKqIBE7V5I7znU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5741.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e952f3c3-668d-463d-4a9e-08dc1787175d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 18:06:55.6912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h+oTposjRdgH6JyUVTv49DoA3rmbMfp210knoXciK8GT3yrDRR7CaKMqZFe2I66l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6932

Hi Andi,

>-----Original Message-----
>From: Andi Shyti <andi.shyti@kernel.org>
>Sent: Wednesday, January 17, 2024 6:50 PM
>To: Boddu, Sai Pavan <sai.pavan.boddu@amd.com>
>Cc: linux-kernel@vger.kernel.org; linux-i2c@vger.kernel.org; linux-arm-
>kernel@lists.infradead.org; Simek, Michal <michal.simek@amd.com>; Lars-
>Peter Clausen <lars@metafoo.de>; Wolfram Sang <wsa@kernel.org>
>Subject: Re: [PATCH] i2c: cadence: Avoid fifo clear after start
>
>Hi Sai,
>
>sorry, but I'm not really understanding the issue here.
>On Fri, Jan 05, 2024 at 06:22:58PM +0530, Sai Pavan Boddu wrote:
>> Driver unintentionally programs ctrl reg to clear fifo which is
>> happening after start of transaction
>
>what does it mean "unintentionally"?
[Boddu, Sai Pavan] I mean, the previous patch which introduced the issue, w=
as unintentional.
>
>> this was not the case previously
>> as it was read-modified-write. This issue breaks i2c reads on QEMU as
>> i2c-read is done before guest starts programming ctrl register.
>
>this log can be improved. How about something like
>
>The driver unintentionally programs the control register to clear the FIFO=
,
>which occurs after the start of the transaction.
>Previously, this was not an issue as it involved read-modify-write operati=
ons.
>However, this current issue disrupts I2C reads on QEMU, as the I2C read is
>executed before the guest starts programming the control register.
[Boddu, Sai Pavan] Looks good. I will mention as above.

>> Fixes: ff0cf7bca6309 ("i2c: cadence: Remove unnecessary register
>> reads")
>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
>> ---
>>  drivers/i2c/busses/i2c-cadence.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-cadence.c
>> b/drivers/i2c/busses/i2c-cadence.c
>> index de3f58b60dce..6f7d753a8197 100644
>> --- a/drivers/i2c/busses/i2c-cadence.c
>> +++ b/drivers/i2c/busses/i2c-cadence.c
>> @@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>>
>>  	if (hold_clear) {
>>  		ctrl_reg &=3D ~CDNS_I2C_CR_HOLD;
>> +		ctrl_reg &=3D ~CDNS_I2C_CR_CLR_FIFO;
>
>I'm wondering whether the whole ctrl_reg should be reset after the first w=
rite.
[Boddu, Sai Pavan] previous implementation of read-modify-write was good th=
en ?

Regards,
Sai Pavan
>
>Andi
>
>>  		/*
>>  		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer
>size
>>  		 * register reaches '0'. This is an IP bug which causes transfer
>> size
>> --
>> 2.25.1
>>

