Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F19C623B2A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 16:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733128AbfETOur (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 10:50:47 -0400
Received: from mail-eopbgr30062.outbound.protection.outlook.com ([40.107.3.62]:48355
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731675AbfETOuq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRu+x5C2+1tXX06VwcL2ajwLpQlvgJst/fotwWDEIU0=;
 b=dnrLpYtk68dlPcXK2yxjU3IMFlQISNbh6D4C27dw3V80O8e056Fmg0Nz/cCR7toDXursNMA/2755dIKTKpr0QqLtlzppZBw5C1c5wXaFBdu3rZddYtmpv12b4vv8vBacEZYZwimBlcKT4jl/90lgz3jzJzKQeX7z+qB0w1AXYNk=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB4734.eurprd05.prod.outlook.com (20.176.4.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 14:50:41 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 14:50:41 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "minyard@acm.org" <minyard@acm.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v9 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v9 1/1] Add support for IPMB driver
Thread-Index: AQHVBaaYimkGU61+4kmPqA0HiOujuqZyi7KAgAGRdiA=
Date:   Mon, 20 May 2019 14:50:41 +0000
Message-ID: <VI1PR05MB623971FF6F956A091840716DDA060@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1557322882.git.Asmaa@mellanox.com>
 <a4d9fe418013b604e7224bf3038c294da42d5534.1557322882.git.Asmaa@mellanox.com>
 <20190519140231.GA7291@kunai>
In-Reply-To: <20190519140231.GA7291@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 061fa574-d537-4294-53ea-08d6dd3287e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB4734;
x-ms-traffictypediagnostic: VI1PR05MB4734:
x-microsoft-antispam-prvs: <VI1PR05MB47347E89D829DC10B9409FA2DA060@VI1PR05MB4734.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(366004)(346002)(396003)(136003)(13464003)(189003)(199004)(8676002)(6506007)(53546011)(99286004)(478600001)(55016002)(9686003)(305945005)(6246003)(2906002)(6436002)(81156014)(81166006)(72206003)(6116002)(3846002)(256004)(316002)(229853002)(33656002)(53936002)(8936002)(73956011)(25786009)(66446008)(64756008)(76116006)(66946007)(6916009)(14454004)(102836004)(66556008)(14444005)(66476007)(26005)(68736007)(186003)(52536014)(476003)(5660300002)(86362001)(71190400001)(11346002)(446003)(7696005)(54906003)(66066001)(74316002)(71200400001)(7736002)(4326008)(80792005)(76176011)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4734;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hHFk5xzT3BJSh0jQpFxHjQZYTZfFHGxz3QGe14xqW1ZlRcmUN/FizvTddOJPOrWJMTT8hRI4kK+eIerdJUH8SDNJA8nbNQ7s8BzwpnQbxqk6Qnyj13kziL/Ci3kJaJxRFSHIbxiR0hnjxWipv32K9srcLeXAAxDCcJutDZCnJjLbGNfHXjmkeig4X2tMJA1eVLJVFzgtrZ8WMFRPdtcNuMZ/CxCVfl7Mwryv0ku66oMHjpaFQ+Ufj2557Dvn5uPlY4Tj/aGuvwxEY50veaIQgKQjiXYJZBvtrU+m7JcRqeFYnmYU96X+3YVmHZ2ASJ1v3MdY9znBLlRsVNMyFHY5+xoW055T94vdU+mmY7wcGQFUHikiQoriTKfiQ4z8BxtBp27Py2131NiNwiDNzDg3NVOg7TtWt9OsrJKWmW4t7Jw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061fa574-d537-4294-53ea-08d6dd3287e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 14:50:41.5074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4734
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



-----Original Message-----
From: Wolfram Sang <wsa@the-dreams.de>=20
Sent: Sunday, May 19, 2019 10:03 AM
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Cc: minyard@acm.org; Vadim Pasternak <vadimp@mellanox.com>; Michael Shych <=
michaelsh@mellanox.com>; rdunlap@infradead.org; linux-kernel@vger.kernel.or=
g; linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 1/1] Add support for IPMB driver


> +static int receive_ipmb_request(struct ipmb_dev *ipmb_dev,
> +				bool non_blocking,
> +				struct ipmb_msg *ipmb_request)
> +{
> +	struct ipmb_request_elem *queue_elem;
> +	unsigned long flags;
> +	int res;
> +
> +	spin_lock_irqsave(&ipmb_dev->lock, flags);
> +
> +	while (!atomic_read(&ipmb_dev->request_queue_len)) {

>> Am I overlooking something? Why are you protecting an atomic_read with a=
 spinlock?

A thread would lock the ipmb_dev->lock spinlock (above) for all the code be=
low ONLY IF the atomic_read for the request_queue_len reports a value diffe=
rent from 0:

if (list_empty(&ipmb_dev->request_queue)) {
260 +               dev_err(&ipmb_dev->client->dev, "request_queue is empty=
\n");
261 +               spin_unlock_irqrestore(&ipmb_dev->lock, flags);
262 +               return -EIO;
263 +       }
264 +
265 +       queue_elem =3D list_first_entry(&ipmb_dev->request_queue,
266 +                                       struct ipmb_request_elem, list)=
;
267 +       memcpy(ipmb_request, &queue_elem->request, sizeof(*ipmb_request=
));
268 +       list_del(&queue_elem->list);
269 +       kfree(queue_elem);
270 +       atomic_dec(&ipmb_dev->request_queue_len);
271 +
272 +       spin_unlock_irqrestore(&ipmb_dev->lock, flags);

 This is important because we do not want another thread to change/use the =
wrong value of request_queue_len, which is decremented eventually.

If the atomic read for the request_queue_len is 0, then we release the cloc=
k and call wait_event_interruptible until we receive something in the queue=
 (i.e. request_queue_len has a value different from 0).
The function ipmb_handle_request takes care of incrementing the value of re=
quest_queue_len and waking up the wait_queue.

> +		spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +
> +		if (non_blocking)
> +			return -EAGAIN;
> +
> +		res =3D wait_event_interruptible(ipmb_dev->wait_queue,
> +				atomic_read(&ipmb_dev->request_queue_len));
> +		if (res)
> +			return res;
> +
> +		spin_lock_irqsave(&ipmb_dev->lock, flags);
> +	}

...

> +	rq_sa =3D msg[RQ_SA_8BIT_IDX] >> 1;
> +	netf_rq_lun =3D msg[NETFN_LUN_IDX];
> +	/*
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> +	 * i2c_smbus_write_block_data_local
> +	 */
> +	msg_len =3D msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> +
> +	strcpy(rq_client.name, "ipmb_requester");
> +	rq_client.adapter =3D ipmb_dev->client->adapter;
> +	rq_client.flags =3D ipmb_dev->client->flags;
> +	rq_client.addr =3D rq_sa;

>> Is it possible to determine in a race-free way if rq_sa (which came from=
 userspace AFAIU) is really the address from which the request came in (aga=
in if I understood all this correctly)?
Yes there is. I see 2 options:

1) This is less explicit than option 2 but uses existing code and is simple=
r. we can use the ipmb_verify_checksum1 function since the IPMB response fo=
rmat is as follows:
Byte 1: rq_sa
Byte 2: netfunction/rqLUN
Byte 3: checksum1

So if checksum1 is verified, it means rq_sa is correct.

2) I am not sure we want this but have a global variable which stores the a=
ddress of the requester once the first request is received. We would compar=
e that address with the one received from userspace in the code above.
