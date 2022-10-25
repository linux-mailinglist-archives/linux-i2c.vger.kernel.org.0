Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968B160C581
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 09:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiJYHj4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 03:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiJYHjz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 03:39:55 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC69F9E68E;
        Tue, 25 Oct 2022 00:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3GLvs+yLJfQj+D9zyaAHwczNHe1/7t9+jrpxUsMjmgiQWBVwa4rca2HR6r0fZU5s5/g9xIS3m5ZC9KSWJfhYiEZsukwz8hYYo3ATZoQRxnPnabQaw5q73Z8QxMFvdWNvSZhlJjBJeRZ6E1mK2U3hgrLDKqwQ5bFJU+VH1nGCstsg9Fen5OOuPkcfOlxehDkYxVOsTHi4pW9c3gpQk5/0A9EJRDcSALkVNhKIBn7lsDbYSpwC67rz6zZbuiXX9eRAaMmAGoPi6Q+JAM1JfYBBkcKvGZoiWsbCpXs3am91ojNUF3jhpR3Lwh5W6oKWLnsWz15rQ92g9rPpkm66JiFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fxSWzcTx2m4PS1smzDOe8EFqS20u5fznanBKP0zH9o=;
 b=E0puncC+zYuq+YzuoVfkQLTIhUDgUGJWUouXRKiY+9g3yu/whsaRsmg0W8hTzpTweIuND51h8dGOWtCT9mijHU1al/KmA8gSOLOqd/9RaPHD8XlqRKz31nzzgkvGZ3WdOI1U2/Iz2HgJ37no5Hl063/dVXmNGRpZa9xQ9jSHWnauTd7iaJY1EvXkb1mzxIr1ZhuGr6uymE/t6qsc4XVfs+/70ZZ1ZkatW41RT37ET1TqrUOx/HpJWaJfhl+c0eHxGBik4YVdsgl/2n3NBrCKCqIsndxAAETiBtMuDnCrta1xgomU6hdbbil2IOtQzpvznr6buWVXGM8X78JB0DqV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vigem.de; dmarc=pass action=none header.from=vigem.de;
 dkim=pass header.d=vigem.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vigem.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fxSWzcTx2m4PS1smzDOe8EFqS20u5fznanBKP0zH9o=;
 b=rJ677e5sEEssf5NyJv6Tulb0JfRiw3L2LLEY6DxV2sk5Vpgxd9CEr63wJWEzhZpDqWwC7RwBe8beUHE0q7a6tJqfwHEexrMU80ATGwiVxpao/eK6diYnhECH9CO39r6+DdrUJisagz/yIYmNlnqA90CoV9Rdg9ccXPfljT27LQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vigem.de;
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bd::20)
 by PR3P190MB0844.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:88::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 07:39:49 +0000
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::7b61:c1b1:967f:577e]) by DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::7b61:c1b1:967f:577e%6]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 07:39:49 +0000
Date:   Tue, 25 Oct 2022 09:39:48 +0200 (CEST)
From:   =?UTF-8?Q?Sven_Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: NULL pointer dereferences in hid-mcp2221
Message-ID: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
Content-Type: multipart/mixed; boundary="8323329-689253199-1666683589=:616642"
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:3bd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1930:EE_|PR3P190MB0844:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d7de71-7813-4c9e-163b-08dab65c18ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN0L3ki2XzOYF257Y2iefn10/Eq874Jxn0KMkQllTUqWtZvS4u4S8Hx8D6f7R1cbBc46A0euz2VIt00MQx9S661iKUPdudFawZ6PjHkyxtP97YMUZrt1o1SRsoY/5u16SFxxqTpwfHL9Il4oZGPkPtvKrnSI019ZFkljHPJtxvscwNLzVhQk//BCW7s8UBHQooZJjmzSMA5EplXtTCWB+0XZzsVFhnSh7w+4HFpume75UEY7p8absLDFJ//j3qTMQx8EXt3/rNSwWZ7qh1Fs295In0j6qRxdizxwfJJB9TZaZn0l43KwJp5mgtgj+EHReyaALjqHIfXSmz2E4I0v9C4BbpZUL8XLxMuEiiFte/P3nfETK3394+93YIp8aaFsVBoJlbUd2gsj2gyp2pIRS+EowiKGlgsyGGvSxbePZF/tken5CuWVY85Pnm6bgt+3AbaLm34n6AA/d9YNJii7ki0rq3Y6UqWj5A8K8+YBGaUALkZBGmodkHCDW9BaUeh0cCnVNixJM/yEZZSqVPI8VHT4QfTBfV4XesMww8e16W+OkpSF7yh1O4bDGML6FSu5BS+sdtwHykUiEH5KOETlko9DKhin+r6lJE4zlmKXgKCDzsfq3PrnHpxXbHoPe8+h/cVDeikDuGW9Arf5qu5Ov5/2qCoETCb/wi+x1Z3AYbUEXcww1x0l/cFTETkRp5gqVXtBnetScdEYaUuN+mG5NHHIGBapV0n0j+RbLEWr/t8om0iK3ifV1y5n8OHrXjdN7zyomvJewr8Z70xu8n31T+dRO3kgxQISlgO7U3WkYzfr51C560UB+7HXNTKlfwtZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1930.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39840400004)(376002)(396003)(366004)(346002)(451199015)(41300700001)(6506007)(52116002)(38350700002)(38100700002)(36756003)(5660300002)(45080400002)(6916009)(66476007)(8936002)(316002)(31696002)(966005)(6486002)(4326008)(66946007)(478600001)(86362001)(8676002)(30864003)(66556008)(66574015)(31686004)(83380400001)(2616005)(6512007)(26005)(2906002)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRqdjI3OUxJZVJtRWtkLzRqT3JoanVDQU5xbW5BTjlsQWpERjBRb2M5aU5E?=
 =?utf-8?B?N2FNUDZnV1lWM0dIeXloT3QzdnJwNUVsSGk0U2VFdDVOVFdxc1ZUUUY4R0JP?=
 =?utf-8?B?R04yaVVTMjdYTGkyNFVrcUlRRDhPaGp5OXAySGVMTVQ0YlI5NVA0VnB6Nm1O?=
 =?utf-8?B?WmlaL1lEalVmNkcrYjMyZmJWYjlRaTdybHBIU2JFSDBybG5Ob0xEeFZRWlNx?=
 =?utf-8?B?MStIMmd6NkFGb2g2b2VwNmdyN1c4bU5EdWZqdk9taDBxeU5oaUlWUDZKbWpY?=
 =?utf-8?B?azhYeE9xZk9XdklBdXRLUWlPVUY1TUdsOEFLK3YvczhnWml4M2J0VEN5LzBQ?=
 =?utf-8?B?elVIekhNdG9pbytQZlpuNWVXemdqamFFdUxKNGpCWHJ1Q2E2TzZwQmRDWFhH?=
 =?utf-8?B?MjdoQkdTNENZM1VnTTRwQWR2eUY5VnlhcU81MUFaNXU5NG5FUlRTUlJQT2ow?=
 =?utf-8?B?dGVhUjdzQThNYlhGS2VNRlEwQi9IUFdqcDZUNWo2UUJ3T05PT01WeU5zQXJM?=
 =?utf-8?B?dW1lczBMcmQydVpoaUI5TzRTdjk1NEhMeG85NUZDWDNlODR5Y2ljdlAyNklr?=
 =?utf-8?B?dW5HNmpsc0V6VEkrUTc2blplTWF2Q3BtQ2s0UVQzZ1ZvbmlaSVBLREhiRFVC?=
 =?utf-8?B?RGljVjdTcXZOOFFMTU11N0NwZ291UHo2cGUrSGQxN3NEeEZTYXpJT3BpbmNM?=
 =?utf-8?B?TmdCcHc2OXFEeEZDR2FoRzdMdTFKZEVVSTN1aitQRGtKYUNCZzlzTUptMjdC?=
 =?utf-8?B?Wi9FM3FpVGNqZWFWNm9NZVJFZEVKR250R1BjSnh5VUo2a0hWTmFORGgyMU9E?=
 =?utf-8?B?aEpnczU5TzVtZERIbnAyOU1NZUoyWHgwT1lFUUhieWJ4cmRTSkFXcE1MZ0lI?=
 =?utf-8?B?dHNBcXk3d1Q5Sm9mYVlCV0xtTXFvcENXaVY3dlhxcmoyZmZJdlhkTFN1OE1P?=
 =?utf-8?B?bUFVclZlVVFZYWJIZDVaRmsyREE1VHNUQmJ6eUxzV3R6MXliclFSUW9MV0cz?=
 =?utf-8?B?a003VW1zakphckJVNSt0emVTL1RkSnlyVTB1ai80T2VpNjZGcERwMHRsV2ta?=
 =?utf-8?B?ZitHc1o1ZUpvdklDUTVDM2szd0ZhZ0NHQklCL0NtZEJGRHZBN3hEVHhMTjBG?=
 =?utf-8?B?ZmlmbGRRdUdtVXVhbW9raDk1ZEZzdGJaeDZ3Sk84bGxUaDZPWENYeXk5ZVV2?=
 =?utf-8?B?cW5DUzdINVhjREtqVGU5RUI1WithSFVuWnQ5Q0ZPMitSY3VTaGMrVVRBWSth?=
 =?utf-8?B?WlhFMlZrTUZwdm1DdzJhcUxXTmFMQ2tHUW15Y21rL01rU2FmRzdjNWFjV3cz?=
 =?utf-8?B?UTcrZnNJa3RGTENpY2M3bDRDWGloU3VrOUJmU1hrM2QzdTl2K1dsVUJNb29M?=
 =?utf-8?B?ZlJ3clM1SEowdXlyU0l6dTgrcXB2UlFaQ3Y5Ym1pOEkrbXlXN3RQYWlocHpw?=
 =?utf-8?B?S0FYck5SdWxMcHlONzBqZkJWOUdkRkh3U1l6RHIrbkRJQmh0cFAzV3RGR3hV?=
 =?utf-8?B?Vm5EYVVqbTFZRGJuYytLL0VmMXlkQ3MyMTdmR1lKZUlMM2xld3FtL0d5d2Nt?=
 =?utf-8?B?VjYya1RUbmRCZE80ampQV1R1cjBJQ0M4ckF2ek9GRXREQzA0MWM1dkZibFh3?=
 =?utf-8?B?T1JwTzZPUVZDQWpLWDVLRURlYnpTdjM1RFJEcGNNNzVWeTM1WHdBRTVDRHpK?=
 =?utf-8?B?WVBPcWFERHQ2cDJpNUduQzZ4UjJkSUR1Uy8wR2I1dk9tZGM5QTIvc0RxTTZQ?=
 =?utf-8?B?bzRYNmdWSFk0U0Y0U2VUSVFUeTVxdWJWbVRpS3dEMU1tUnNlTFplUnBGMzlO?=
 =?utf-8?B?cGtvV1MxTUZ4L3FaWFlFUUNpOFNQQklibnpmekxPT2xEYS8xc052eVpRL3BM?=
 =?utf-8?B?dVhkL2xmcmVoQkdWMXNqMTNTb3RKSnVGdFk2Y3pTU1poS0wzVUg4UWdEU0JC?=
 =?utf-8?B?V2hLS2RkN0VxVmxYWDQxK1UzOUVTdWZKZ21aRERIWXhuc3gyRXNleVhkSzFp?=
 =?utf-8?B?VnhyOFVQc2FaQmdwRzE1THk3ZGhFeTNTMzQ2UjlWdTQ2YllxTjV3K2FFaURQ?=
 =?utf-8?B?SDNWdjNsVTU4dWljczJ6YjQrYmVGUmdxdHZvai9QYXZ3bkdqblQ0Nk1qTWpk?=
 =?utf-8?B?VS9MZUFJUkR6aENQSy9GYnYxV3lkbnBtY2lhN2QzVkxrSDVrR09jU1llUGsz?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: vigem.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d7de71-7813-4c9e-163b-08dab65c18ca
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:39:49.6896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc3cc44e-876e-4b98-9250-42df44be4933
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+Qt50Sedgo4t/lBIfiQTU+zzSpilEd1Xh0GFDUv3DaKqcrGQyQ/O1EGBQEz6ylmH8QI8i4ey9Mh2A8oJ6OMv8vLh7Q4TwKBbnuxCUnVELM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0844
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--8323329-689253199-1666683589=:616642
Content-Type: text/plain; format=flowed; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi,

I've run into two NULL pointer dereferences when loading the MCP2221 driver.
Initially I observed them running the kernel used by yocto kirkstone
(currently 5.15.68) but can reproduce them with a vanilla 6.1-rc1 as well.
All line numbers below are for hid-mcp2221.c, taken from 6.1-rc1.

The first one was easy to identify, in mcp2221_probe line 874 `hdev->hidraw`
was NULL since I compiled the kernel without CONFIG_HIDRAW enabled. Should
CONFIG_HID_MCP2221 perhaps depend on or imply CONFIG_HIDRAW?

For the second one however, I'm stuck. The dereference happens at the top of
mcp_smbus_xfer since i2c_get_adapdata in line 307 returned NULL. Looking at
the call trace (see [dmesg output] below), mcp_smbus_xfer gets called
indirectly from mcp2221_probe via i2c_add_adapter in line 876, directly
before a call to i2c_set_adapdata. Since I couldn't identify another call to
i2c_set_adapdata or a write to `mcp->adapter.dev.driver_data` that could
potentially have initialized that field, I attempted to swap the order of
calling i2c_set_adapdata and i2c_add_adapter, see [attempted fix] below. While
the driver now loads without issue, no devices appear on the i2c bus:
# i2cdetect -l
i2c-0   smbus           SMBus I801 adapter at 5000              SMBus adapter
i2c-1   i2c             MCP2221 usb-i2c bridge on hidraw0       I2C adapter
# i2cdetect -y 1
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --


When booting a distribution kernel (Ubunutu 22.04 with kernel 5.15.39) the bus
is populated as expected:
# i2cdetect -l
i2c-0   smbus           SMBus CMI adapter cmi                   SMBus adapter
i2c-1   smbus           SMBus iSMT adapter at 20fffab9000       SMBus adapter
i2c-2   smbus           SMBus I801 adapter at 5000              SMBus adapter
i2c-3   i2c             MCP2221 usb-i2c bridge on hidraw0       I2C adapter
# i2cdetect -y 3
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: 20 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- 3b -- -- -- --
40: -- -- -- -- -- -- -- -- UU -- -- -- UU -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: 70 -- -- -- -- -- -- --

In the patches applied by Ubuntu I couldn't find anything that'd explain this
change in behavior. Regarding their kernel configuration the situation is
similar: Even incorporating almost all of Ubuntu's additions (minus some
signing and integrity stuff) into the config I've been using results in the
NULL pointer dereference in mcp_smbus_xfer. Since this still might be a case of
me missing some config options, I'll post my config in a response to this mail.


There seem to be two recent patch series for this driver:
https://lore.kernel.org/all/20221001005208.8010-1-matt.ranostay@konsulko.com/
https://lore.kernel.org/all/20220926202239.16379-1-Enrik.Berkhan@inka.de/
I tested both, but the behavior stays the same.

[attempted fix]
--- a/drivers/hid/hid-mcp2221.c	2022-09-19 09:31:22.539691089 +0200
+++ b/drivers/hid/hid-mcp2221.c	2022-09-20 15:21:37.576196331 +0200
@@ -873,12 +873,22 @@
  			"MCP2221 usb-i2c bridge on hidraw%d",
  			((struct hidraw *)hdev->hidraw)->minor);

+	int adapdata_change = 0;
+	if(!i2c_get_adapdata(&mcp->adapter))
+	{
+		adapdata_change = 1;
+		hid_warn(hdev, "got NULL adapdata\n");
+		i2c_set_adapdata(&mcp->adapter, mcp);
+	}
  	ret = i2c_add_adapter(&mcp->adapter);
  	if (ret) {
+		if(adapdata_change)
+		{
+			i2c_set_adapdata(&mcp->adapter, NULL);
+		}
  		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
  		goto err_i2c;
  	}
-	i2c_set_adapdata(&mcp->adapter, mcp);

  	/* Setup GPIO chip */
  	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);

[dmesg output]
Shortened to just the trace, I'll post the full dmesg output in a response to
this mail.
[    1.898107] usb 1-3.4: new full-speed USB device number 5 using xhci_hcd
[    1.990607] cdc_acm 1-3.4:1.0: ttyACM1: USB ACM device
[    1.991509] hid-generic 0003:04D8:00DD.0003: hiddev96,hidraw2: USB HID v1.11 Device [Microchip Technology Inc. MCP2221 USB-I2C/UART Combo] on usb-0000:00:1e.0-3.4/input2
[    1.998390] mcp2221 0003:04D8:00DD.0003: hidraw2: USB HID v1.11 Device [Microchip Technology Inc. MCP2221 USB-I2C/UART Combo] on usb-0000:00:1e.0-3.4/input2
[    2.050149] i2c_dev: adapter [MCP2221 usb-i2c bridge on hidraw2] registered as minor 1
[    2.050166] i2c i2c-1: adapter [MCP2221 usb-i2c bridge on hidraw2] registered
[    2.050173] i2c i2c-1: found normal entry for adapter 1, addr 0x48
[    2.050179] BUG: kernel NULL pointer dereference, address: 0000000000000000
[    2.057180] #PF: supervisor read access in kernel mode
[    2.062347] #PF: error_code(0x0000) - not-present page
[    2.067517] PGD 0 P4D 0 
[    2.070069] Oops: 0000 [#1] PREEMPT SMP
[    2.073931] CPU: 7 PID: 287 Comm: systemd-udevd Not tainted 6.1.0-rc1-yocto-standard-upstream #1
[    2.082761] Hardware name: Default string Default string/Default string, BIOS 1.01.10.AR01 08/05/2022
[    2.092025] RIP: 0010:mcp_smbus_xfer+0x29/0x348 [hid_mcp2221]
[    2.097811] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 45 89 cd 41 54 45 89 c4 53 48 83 ec 08 48 8b 9f e8 00 00 00 89 75 d4 89 4d d0 <48> 8b 3b 48 8b 87 b8 1b 00 00 48 8b 40 20 48 85 c0 74 07 be 20 00
[    2.116673] RSP: 0018:ffffa6c4409ab748 EFLAGS: 00010296
[    2.121929] RAX: ffffffffc0509fc0 RBX: 0000000000000000 RCX: 0000000000000000
[    2.129104] RDX: 0000000000000000 RSI: 0000000000000048 RDI: ffff9957c69b5830
[    2.136278] RBP: ffffa6c4409ab778 R08: 0000000000000000 R09: 0000000000000000
[    2.143450] R10: ffff995b3fede000 R11: ffff995b3ff8e000 R12: 0000000000000000
[    2.150625] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    2.157797] FS:  00007f5b4ee65600(0000) GS:ffff995b301c0000(0000) knlGS:0000000000000000
[    2.165932] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.171710] CR2: 0000000000000000 CR3: 0000000108c9b002 CR4: 0000000000770ee0
[    2.178884] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.186059] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.193232] PKRU: 55555554
[    2.195959] Call Trace:
[    2.198423]  <TASK>
[    2.200540]  __i2c_smbus_xfer+0x105/0x3d0
[    2.204578]  ? mcp_i2c_xfer+0x160/0x160 [hid_mcp2221]
[    2.209663]  i2c_smbus_xfer+0x62/0xe0
[    2.213350]  i2c_default_probe+0xf1/0x130
[    2.217384]  i2c_detect.isra.0.cold+0xf4/0x220
[    2.229989]  ? kernfs_add_one+0xe8/0x130
[    2.233941]  ? preempt_count_add+0x7a/0xc0
[    2.238063]  ? _raw_spin_lock_irqsave+0x1e/0x50
[    2.242623]  ? __process_new_driver+0x30/0x30
[    2.247007]  __process_new_adapter+0x18/0x20
[    2.251304]  bus_for_each_drv+0x82/0xd0
[    2.255167]  i2c_register_adapter.cold+0x133/0x1f4
[    2.259990]  i2c_add_adapter+0x5c/0x80
[    2.263764]  mcp2221_probe+0x138/0x250 [hid_mcp2221]
[    2.268762]  ? hid_lookup_quirk+0x7f/0x190
[    2.272884]  hid_device_probe+0xf5/0x160
[    2.285748]  really_probe+0xdf/0x290
[    2.298964]  ? pm_runtime_barrier+0x55/0x90
[    2.311392]  __driver_probe_device+0x78/0xe0
[    2.323310]  driver_probe_device+0x24/0xe0
[    2.327431]  __device_attach_driver+0x7d/0x100
[    2.337243]  ? driver_allows_async_probing+0x60/0x60
[    2.348108]  bus_for_each_drv+0x82/0xd0
[    2.351969]  ? __hid_register_driver+0x90/0x90
[    2.356439]  __device_attach+0xc1/0x1f0
[    2.360302]  ? __hid_register_driver+0x90/0x90
[    2.364773]  device_attach+0x10/0x20
[    2.368372]  device_reprobe+0x4a/0x90
[    2.372059]  __hid_bus_reprobe_drivers+0x56/0x60
[    2.376704]  bus_for_each_dev+0x7c/0xc0
[    2.386344]  ? hid_destroy_device+0x60/0x60
[    2.390554]  __hid_bus_driver_added+0x2c/0x40
[    2.394937]  bus_for_each_drv+0x82/0xd0
[    2.398800]  __hid_register_driver+0x7d/0x90
[    2.403096]  ? 0xffffffffc07c2000
[    2.406434]  mcp2221_driver_init+0x23/0x1000 [hid_mcp2221]
[    2.411955]  do_one_initcall+0x4f/0x210
[    2.415817]  ? kmalloc_trace+0x2a/0xa0
[    2.419593]  do_init_module+0x52/0x200
[    2.423367]  load_module+0x1a78/0x1c50
[    2.427142]  __do_sys_finit_module+0xbb/0x110
[    2.431525]  ? __do_sys_finit_module+0xbb/0x110
[    2.436086]  __x64_sys_finit_module+0x18/0x20
[    2.440469]  do_syscall_64+0x3d/0x90
[    2.444070]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[    2.449154] RIP: 0033:0x7f5b4efc202d
[    2.452755] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 4d 0e 00 f7 d8 64 89 01 48
[    2.471614] RSP: 002b:00007ffe16a04a18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    2.479225] RAX: ffffffffffffffda RBX: 00005651bb4c0670 RCX: 00007f5b4efc202d
[    2.479226] RDX: 0000000000000000 RSI: 00007f5b4f13636b RDI: 0000000000000006
[    2.479227] RBP: 00007ffe16a04a40 R08: 0000000000000000 R09: 0000000000000000
[    2.491744] R10: 0000000000000006 R11: 0000000000000246 R12: 00007f5b4f13636b
[    2.491745] R13: 0000000000000000 R14: 0000000000020000 R15: 00005651bb4c0670
[    2.491748]  </TASK>
[    2.506091] Modules linked in: hid_mcp2221(+) ice(+) igc
[    2.519128]  sch_fq_codel tmp421 configfs
[    2.519132] CR2: 0000000000000000
[    2.528505] ---[ end trace 0000000000000000 ]---
[    2.566155] RIP: 0010:mcp_smbus_xfer+0x29/0x348 [hid_mcp2221]
[    2.587646] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 45 89 cd 41 54 45 89 c4 53 48 83 ec 08 48 8b 9f e8 00 00 00 89 75 d4 89 4d d0 <48> 8b 3b 48 8b 87 b8 1b 00 00 48 8b 40 20 48 85 c0 74 07 be 20 00
[    2.587648] RSP: 0018:ffffa6c4409ab748 EFLAGS: 00010296
[    2.598855] RAX: ffffffffc0509fc0 RBX: 0000000000000000 RCX: 0000000000000000
[    2.598856] RDX: 0000000000000000 RSI: 0000000000000048 RDI: ffff9957c69b5830
[    2.608406] RBP: ffffa6c4409ab778 R08: 0000000000000000 R09: 0000000000000000
[    2.608407] R10: ffff995b3fede000 R11: ffff995b3ff8e000 R12: 0000000000000000
[    2.608408] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    2.618830] FS:  00007f5b4ee65600(0000) GS:ffff995b301c0000(0000) knlGS:0000000000000000
[    2.618832] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.642332] CR2: 0000000000000000 CR3: 0000000108c9b002 CR4: 0000000000770ee0
[    2.642333] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.642334] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.642335] PKRU: 55555554

-- 
Sven Zühlsdorf
Software Engineer
ViGEM GmbH
--8323329-689253199-1666683589=:616642--
