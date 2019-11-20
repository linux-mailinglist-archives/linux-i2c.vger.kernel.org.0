Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06E103CEA
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 15:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfKTOEs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 09:04:48 -0500
Received: from mail-eopbgr80107.outbound.protection.outlook.com ([40.107.8.107]:56327
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727794AbfKTOEs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Nov 2019 09:04:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvOjRr5RlGb74DmxmmUoD5xtfJfqlbL8imkiuIMUGDQJBTsBKf0V9K6h8H0dz8iD6XER2C45fOOR1fpgukbqx81Y/JEhf+jGFIcWdo1tiUpOtfiKejyvXHW6mGUh1EgfT5F+vAlGC8sktN6xFyLUGE21Cai/qaCEL+6blc/7bmrNwGby0B0jwv2GCOzi3RO9rG3VPdOoy+F1+cNMwlQMYzRK16WMD5pGajh78QM/G9YP+tGAdQ7qRXvFp7MHrJbF/8zj/j1BXCdw8uMfo0aSVq3o17b05RTZrmC3S+9dL9t8UmPn+cy7Id5EpGIZ4WTTPahfGdZS7avJaeRdD7KzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H72ekTMWMPLSdbDh717tXjt473iUP+0DgULQ5OwXiV4=;
 b=OYqs9T2rZ+UKYxlsnroG0zzgLKC4PuNElDrfLQSB4l7pSI4SmOhEz1fP1sDfX4PXckjDCHog+9+IDcLM0sDCQIy56fB5Qitza4Wpk5JX9XINbQk58McZ6C2a5nQUrKypWZMiG947uuGsKjeFWM1Ck3qlM+1lSM5Yx6kZIrzEkcvGF0W6Ty0pOSMp6AvQBgwtpVT/zv+AgqSRuws6UmiDCi5s8Iw4qZQoTOalu7dU/KJUT0NllP14ksnAjhx6k45tBGcXVQKryve6V0GYfvaaVpUY8C/ntaspHRWg8vdLW64wOyhXnKMVSQGlv54IWIsdq5VpsuDC3F6fFIL44dIdtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prevasonline.onmicrosoft.com; s=selector2-prevasonline-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H72ekTMWMPLSdbDh717tXjt473iUP+0DgULQ5OwXiV4=;
 b=qpJoAreULAaPClzCRcS5dDuMxJISX6ATlrQhtaNdMT6yBCt1YcyGsDJEWHtBo5ZH8dRoqNZzfJ2v7chi7OZGXciIBHqcK/sGpyn3OROZYmAx4v+2MM2dsI5G0EFmpY/YOXkGVoqIcGAG1N68wg2l/KAXjvZfY1LBO0z3Enfq3rk=
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM (10.186.175.83) by
 AM0PR10MB3042.EURPRD10.PROD.OUTLOOK.COM (10.255.29.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Wed, 20 Nov 2019 14:04:42 +0000
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4062:84a7:b782:e7b9]) by AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4062:84a7:b782:e7b9%3]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 14:04:42 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Fabio Estevam <festevam@gmail.com>, Kjeld Flarup <kfa@deif.com>
Subject: i2c-imx: writing to eeprom via dma fails on ls1021a
Thread-Topic: i2c-imx: writing to eeprom via dma fails on ls1021a
Thread-Index: AQHVn6t04BzUIJQM7E6na9F6qR6ndg==
Date:   Wed, 20 Nov 2019 14:04:41 +0000
Message-ID: <0f4c1d41-3dc2-f66a-2596-1c3180971eb3@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR07CA0048.eurprd07.prod.outlook.com
 (2603:10a6:7:66::34) To AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:15e::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rasmus.villemoes@prevas.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7473bf21-40b6-4dc3-1289-08d76dc296d6
x-ms-traffictypediagnostic: AM0PR10MB3042:|AM0PR10MB3042:
x-ld-processed: d350cf71-778d-4780-88f5-071a4cb1ed61,ExtAddr
x-microsoft-antispam-prvs: <AM0PR10MB3042B46003D9C77E3DE56136934F0@AM0PR10MB3042.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39850400004)(45904002)(199004)(189003)(26005)(305945005)(186003)(2906002)(7736002)(486006)(31696002)(386003)(6506007)(5660300002)(71200400001)(99286004)(71190400001)(256004)(316002)(14444005)(6116002)(14454004)(3846002)(110136005)(25786009)(31686004)(54906003)(36756003)(478600001)(6486002)(2616005)(6512007)(8936002)(8976002)(4326008)(8676002)(81166006)(81156014)(52116002)(66446008)(66556008)(66946007)(66066001)(86362001)(64756008)(66476007)(476003)(102836004)(6436002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR10MB3042;H:AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: prevas.dk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z7PnGIgPLlCTdfoUFXdFNh1m0jsI6S5PsozOsbB3qOoOayWh4lsmMTHjP+6N6C6hQJ3MCtKK4yx78h9D6mX684QVrFfUA1PZUhL2ks26bjxmDIjl7u5jJwrEq4ErtHMiIy3hhMhFFSQCcWMb6duB1v+L6ettEYFoywo1eUPG4HnThR3MEnIWacnqVaLuJsmoiigSDsFa29HNP84VSUUX+xmUh81c08UU7RTmx8wTlYIjvF9ntZRtT5IXrnujm9BqazlOiisazkIlJuaaSj0UR3HIGeS/fFR8zHsgs4c2DIKKDhyljvIXSNdgz6lYy7tRYr9qMADFEx/zbS7CvZhfBltHBaqPEQ0S0wsmOwaQ/Q4q5xvqOYp+H32VdXBKljP3GZG6PLN0pa88l3AArfq9iiDzFiyBQrlFbvEeEFLBFkRfcO7d0fsi9QhFPjPxAlhhIeHuHOj+WBkzxQPx5A+fzg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <3935B083AF2B2D43A821B0A703F13EDD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 7473bf21-40b6-4dc3-1289-08d76dc296d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 14:04:41.9253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmUgHqTstflit+c8go/OVpXjDUQ1rkBMIet1ZfDf0cK8KHO2m42jax2vBUpvzbWF1+l3QaGcQd6GPqMG1F/wHCHLieMD9+5eLdwNooPIYEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3042
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit cc07fd3c45c1 (ARM: dts: ls1021a: Enable I2C DMA support) enabled
the use of DMA on ls1021a. However, writing to a M24C32-R eeprom in
chunks larger than 16 bytes now consistently fails, e.g.

# dd if=3D/dev/urandom
of=3D/sys/devices/platform/soc/2180000.i2c/i2c-0/0-0050/eeprom bs=3D32
seek=3D12 count=3D2
dd: writing '/sys/devices/platform/soc/2180000.i2c/i2c-0/0-0050/eeprom':
Connection timed out
2+0 records in
1+0 records out

Doing just a single write of something > 32 bytes (i.e. the page size)
causes the same symptom since the at24 driver splits up the write.
Reading back the eeprom shows that the first page does indeed make it to
the chip, but subsequent ones do not.

The problem is that while in the non-dma case (say 'bs=3D8 seek=3D50
count=3D4'), the i2c-imx driver checks that the slave responds to the
slave address

        /* write slave address */
        imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx,
IMX_I2C_I2DR);
        result =3D i2c_imx_trx_complete(i2c_imx);
        if (result)
                return result;
        result =3D i2c_imx_acked(i2c_imx);
        if (result)
                return result;

and this works as intended back in at24.c

  at24 0-0050: write 8@400 --> 0 (190428)
  at24 0-0050: write 8@408 --> -6 (190428)
  at24 0-0050: write 8@408 --> -6 (190428)
  at24 0-0050: write 8@408 --> 0 (190428)
  at24 0-0050: write 8@416 --> -6 (190428)
  at24 0-0050: write 8@416 --> -6 (190429)
  at24 0-0050: write 8@416 --> 0 (190429)
  at24 0-0050: write 8@424 --> -6 (190429)
  at24 0-0050: write 8@424 --> -6 (190429)
  at24 0-0050: write 8@424 --> 0 (190429)

which retries a couple of times until the eeprom finishes its write
cycle. But in the DMA case, we cannot (or at least do not) check that
the slave responds since setting the DMAEN bit means we don't get a
transfer complete interrupt. So the dma_write case just does

	/*
	 * Write slave address.
	 * The first byte must be transmitted by the CPU.
	 */
	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
	time_left =3D wait_for_completion_timeout(
				&i2c_imx->dma->cmd_complete,
				msecs_to_jiffies(DMA_TIMEOUT));
	if (time_left =3D=3D 0) {
		dmaengine_terminate_all(dma->chan_using);
		return -ETIMEDOUT;
	}

and DMA_TIMEOUT is a whole second. So when the second dma transfer fails
a whole second has passed, meaning we're way past our time budget back
in at24.c.

  at24 0-0050: write 32@384 --> 0 (258590)
  at24 0-0050: write 32@416 --> -110 (258696)
  at24 0-0050: write 32@416 --> -6 (258696)

(I have HZ=3D100). Now, since 9a9e295e7c5c (eeprom: at24: fix unexpected
timeout under high load), the at24 driver will always do at least two
attempts, which is what we see above. On the second attempt, the eeprom
is of course long done with its write cycle, so we actually get all the
way through i2c_imx_dma_write() before finally returning an error from
i2c_imx_acked().

Now, _why_ that fails I don't really understand (perhaps there's some
state that doesn't get correctly unwound in the first error case?), but
even if it worked, using dma would limit us to 32 bytes/second because
the first attempt at writing the second page only fails after
DMA_TIMEOUT, which makes using dma rather pointless.

Options:

(1) revert cc07fd3c45c1. But then we'd lose use of DMA for read which
works just fine.

(2) make DMA_THRESHOLD in i2c-imx configurable (module param/CONFIG_*
knob) and separate for r/w, so one could disable dma for write by
setting the threshold to "infinity".

(3) figure out if i2c-imx can report early on that the slave doesn't
respond and hence make the logic in at24.c work as intended

(4) ideas welcome

I don't think this is specific to LS1021A, the same thing should be seen
on other SOCs using the same i2c driver with DMA (e.g. ls1043a and
ls1046a from their .dtsi files). I'm wondering why nobody else seems to
have run into this.

Rasmus
