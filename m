Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3B964B6B9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 15:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235182AbiLMOFG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 09:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiLMOFE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 09:05:04 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CE0634B;
        Tue, 13 Dec 2022 06:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAaH39G3xuqnUOEVy0sqMD1fDjtb97Oie70HUzhN7d5nnMO+63u2OsSm7A07haVW91QhE7e6JQoUIdUcw0kiMcLCogl30XQ+/rdIpIfijBaZ4q5EHVMcTFPQAF6MMyD686eTAZh9hZewtLJU23ARJTIsxMfDgJtixjGgqMOJ2xOR9Dve5c/k5GQ6vJfXHsLAlJvJ12G9WO9BJTuNd6eWDiGrw/l6zRNBla0VzZJdYvSAyv1K4AzRLu/3WI7tSLfNAPzbnGIlLfyrZbWLlYZcTHcJw4VK8R8SiW3uuSnJSKfc3hWnkrk1QFXqZXanKShL3SRPnIrv8HaBP2d2irUyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GtkjTxN5cDQ4ou9RHv6Ceh1CDyQGaQ4mGN7Q76yGpY=;
 b=nJLsjNAj13SqoF9kjXgWAg9WpagtQTiV0OHYrF75bxDzuQ0TAuSjY5xiO7ENYlnnQUbwfM+UbUZINoffVbVM86at+81iJV9nrom6fSBOKVjR+rdl7TDKDNpNaJjvrUkccZjbyFidByBX2DYDW/+BT7uN6NIEbrGxIpG3Gb6TJsdLaTNu1NbSaNwC1J5fNd/Wp6i5xm6bAc8CRxOPP/7MtqtwY4DNy1YaVAymyIAuHofUpYVSN2r7nnCGjfLYPPCxd9a1KQdyDB4N8doBrviaZS0ZQTgSrrXBz/wZfxUm6Htw3s29Ggwf655asaV2U8HgQi2m6d0FiJuI0NBJNRYbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vigem.de; dmarc=pass action=none header.from=vigem.de;
 dkim=pass header.d=vigem.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vigem.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GtkjTxN5cDQ4ou9RHv6Ceh1CDyQGaQ4mGN7Q76yGpY=;
 b=ka3VDLt8c8YUgCOAPNv2e/7+NlJNE7DyONZmC/AgTGXNQWO3LFtK0PVyOGKalyKecRCyxgtdJSSkcPvSujpvreHd1kkuGew9rQF/uomVnZXQadRcUvgU7xLE1EYcV9PH0BC0DhDxHvlSO0cLQCZZWkNJiWOqW1Fmn2dsBAI4GuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vigem.de;
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bd::20)
 by DB9P190MB1843.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:37e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 14:04:59 +0000
Received: from DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::ece:ddee:45dd:492]) by DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 ([fe80::ece:ddee:45dd:492%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:04:59 +0000
Date:   Tue, 13 Dec 2022 15:04:57 +0100 (CET)
From:   =?UTF-8?Q?Sven_Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>,
        linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: mcp2221: fix probing of the I2C bus added by
 hid_mcp2221
Message-ID: <55d7a712-5862-4d51-9ec8-7479dce15f78@vigem.de>
Content-Type: multipart/mixed; boundary="8323329-164564908-1670940298=:103531"
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:3bd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1930:EE_|DB9P190MB1843:EE_
X-MS-Office365-Filtering-Correlation-Id: 5096fa8b-e5f6-44ed-c2f2-08dadd130518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Evbv/K0QaO6a10HYMXGEHq3rvacSWDRoPc4PhgnCFjXUmMACkWml8Hl57NNxLm0cSnrzefTAliVD8RC+WCcl2SD0gCQsxSYMQvSO1cCHXj5sOcN50Ti1qMObXJO7BSdTjtA7L2l30kpefTKJlS9jAz60jD/IebJUbuXxygzW2jwlVtEppNXdvCp4ZiNLkqDeBrUTRi7qGENCT+rfIw5DeHW3HIDPUCPVy5cMErs1DkRrsU0fNcCQp0OSssuXPMm36k6SNoFZmjrsarPwbFK3/U3+4OLWN6KVdo89OI3UoFRvzgutGCrfUBO8D+F2bmKRcVXP97gbm2YbZJhLF9kD4EQTgyhj8xE9kiXdFUAquUyFs9K7z3mABeDL53UrDGpxu/UXssYr4HxBK+tDprTlXVRouiVw6Ug0vUDl+C6N34vtqVYG4SeTcMJx946vSvvjddu13ddH5vO7D+MyvfJS1zVZE6GPA1Mb0Bfb+DdJFVz2gE8SmQehRx5l5z9XomvldrcKwsayCKa6A6Cw60c5DYvwQ5IRbamgI/t7/AAR7M9gKpX/cADYdpFO0Dsuov/+t/vZpFnuB0Smwp3J96rxHfILjgWDltzXjjp+/TSRrok7E1zUrZgFIH/YCGhn1R+eoB8C1XQPMcONwwoFrwCAa20pgqKCNI8CEB3gJILQo3HUx4zO0NfTdkF8fJJ1NwVZmBoJYJNNBlBAbNuNKveYB9+vD2fHGA3bZ5GJuIJ7538=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1930.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39840400004)(396003)(451199015)(38350700002)(31686004)(5660300002)(33964004)(6506007)(26005)(86362001)(31696002)(2906002)(41300700001)(36756003)(52116002)(8936002)(66556008)(8676002)(66946007)(316002)(66476007)(4326008)(38100700002)(478600001)(186003)(83380400001)(6486002)(53546011)(66574015)(6512007)(54906003)(6916009)(2616005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlRQL2d5bm1XVUFYWlp6S1o0dTFkTS9NaWl6a2RaZStaV0Q1dkg0SVVBVEUy?=
 =?utf-8?B?ajgyTHRTeTVXY2d2UTFaczBZNTFXbHVjbmJNaXdyWXRiSlhDbEZIUklleURo?=
 =?utf-8?B?WmxQek9POEJELy9tb0VLVHRKVUc4VUNuVEpHMks2eHY2b3ZoYnRKdWVERkJp?=
 =?utf-8?B?RlhsU3pFT1NFYlhBcW1JZ0VxenFnNHlhWGY0VTBCQUcrc2JickNqT0tqRnor?=
 =?utf-8?B?eEZiUmpEVWxQM0xydHJqaUtpMWN5eWFPc0lZRmxwODVMUEJvczlONDAvSWxV?=
 =?utf-8?B?dWYrWG42ZU5NZzZuMXRRQjc1eXdZMUpYdFZtc3JYWlpOZVRnTzNRNm5YL2JM?=
 =?utf-8?B?SFpHaFBuN0o3Z3RWM0VFQmFYS2wvb3U2YVJWMEJvMHJHdVQrNnhXVExBdXhs?=
 =?utf-8?B?SXdhc0lDZ2xXUzRybDZ5bHkyWm1wVE5KUGlCdnRKR2tvaU5SZ3dYRldMdlR2?=
 =?utf-8?B?c3JLaFNvNHFhajRrTFlnRGNzTW5pbnFyNnVIWENnQm5NdU5BOVNFRnNaK2tT?=
 =?utf-8?B?MFhqMnhUcm9nWXgxNzl4TTlWdTB6aTA0bnN5cjFxV1VkN1FmNWdwR0lwaXRm?=
 =?utf-8?B?bHc5QWZNSXRoM1VZRmQxMVp4SGQ4NzBjTlpvZFNKODVyWGpxVlU4RW96cUVO?=
 =?utf-8?B?RTVLamFjck9ibFdyM0tDQ2h3UmhzOW8vT1R2QTkzMU56bkNSMFNrQmt3emZt?=
 =?utf-8?B?RVkrTisxYVhhbVliQ2RhbHdCWmUzOXY1cXJDV2J5VDlQQTBYTGd6b3dDMFRF?=
 =?utf-8?B?eU5jcWpTcmRLWVlwdFhDbFhWU0d4REUxN2QyT01kU0pvcGNOY24wSzF3bHoy?=
 =?utf-8?B?Vmc5SzNhU3QvbUp0RDdRR2VkYTFHL1pSV1p3NG1QakgyNG1EYWNTNUF2UTA2?=
 =?utf-8?B?bXhQbGpjWDNqci9yZEpINjJ2emlDUmlJN3hoTHU5VFNsT2hZT1RNcjY2eWZn?=
 =?utf-8?B?N2xYbFJEcWwvR2poRzBYVjBMM1UyYjBveU5qS0hnRkI4dHNJUFozaWJJeFg4?=
 =?utf-8?B?cnlPdUtNallQR1Rlb2U0QzRxV1o0OEVBUG5SbUs1Qkl4cUxaTVN5SXJzRjBZ?=
 =?utf-8?B?Y2c2emMrR3RXZndDQ0pUZUY1bUxML1VBdTVaclFUM0JBd1pqbmhSakNDZW41?=
 =?utf-8?B?Z1hyQzQ3OVhZZVF5QzhEUUNRTmFpMld6UmI0VHVCejBXd3pqM25acWlRZi8z?=
 =?utf-8?B?d0dSR3ZpYTZ5S09jbVlRc0M5RU5LM1hxS01ucE1WUHFOL1BIZTJuN0J2VHlr?=
 =?utf-8?B?OW1HNlZsWjl2eXdISkovWHo5Ymc2dzZaYjFCR0gzblFJcFhpS2xtdFpldzBY?=
 =?utf-8?B?dTdJRFQrT2M5TlBGLy9xck1kYnE2eXp3Mjg2VFNoMUhuaGJoZkdKRzhaTWxM?=
 =?utf-8?B?dTQ2WTVuRmNuUjJNUzI0cFFJTWdQeERPOHRDazhUR3pDaXAxWUZaaFhFWWdu?=
 =?utf-8?B?QzBPeEtybzdUL2hRYllPdnBsSisxdEM0dGtHL3ZEdU1LZEt1d3IrWGRTeUQ4?=
 =?utf-8?B?Q3ltWllaWkpnOUMrOTRiQnVzWjZzOE1SMHZtZXFjWGc0aHdLZWJKWlBRanRs?=
 =?utf-8?B?NE1qeGdEeWFtOTZCamNTcVZwWEZmU05IbzM5NW55SWFEeWZMM0JpRnFYQWlz?=
 =?utf-8?B?SGs3YmFLbEMxRFJ3Y3ZnQXk2a2xUd3lHUHFnVHdHbXRqa2xMSkdTalRFaDJk?=
 =?utf-8?B?M05weW8rVG9wdmFxalNreUtxRHhVejVhSmR1TWpaQ0RFemprSUxGaVBVNDNJ?=
 =?utf-8?B?TTl1SzRKVitFOFhsNFJXMHpWZTUrK3dzRXBwWElIcSt3ODNKTG5McnY0TTVD?=
 =?utf-8?B?dGNwemR6OThIOW8rSDN1U042aEFvRHFpcUZnS3RrTkFFSnpzNGhkbTZWU0lO?=
 =?utf-8?B?OWJNTFVmS2FsR1hwVEpBeUM2MmVXZ2kraHpRYlhoN2xhamQvbnVyTlI2clFs?=
 =?utf-8?B?NndXVk5vZEhNdzlmYkVnbjNvV1RqTXNTQUZqRVlheVQ5NnlXUmNEc1RDamlF?=
 =?utf-8?B?dHVKQzRVY0ZuV1dvRitNaGtDWU11VVRnMFp2REppam55aXVobHNoZTlCZ01G?=
 =?utf-8?B?c0VXTndncWh2SFVITFB1Zml5RDVRQ21nOGVqczNTankzaitPbENZL3RncjZ4?=
 =?utf-8?B?aTVlZkt5ZnR0NVdzM2ZCRkovMXkrQUQ2ZzhwSElITDQzT1VZK01ONXRBNFZD?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: vigem.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5096fa8b-e5f6-44ed-c2f2-08dadd130518
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1930.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:04:58.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc3cc44e-876e-4b98-9250-42df44be4933
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqAflhm7f/9ynpncF9nSUAJfbyL6l3FJWUcPcbNCsqG0qxOE3rGaAAaEKyNGomE0gBHnHcWyBeJ/b1WdiZK8CODiuuQ+TYGJ7RSIQr2MXC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1843
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--8323329-164564908-1670940298=:103531
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

From: Karl Georg Esser <kgesser@vigem.de>
Date: Fri, 9 Dec 2022 16:17:59 +0100
Subject: [PATCH] HID: mcp2221: fix probing of the I2C bus added by hid_mcp2221

As soon as the I2C driver part will be enabled in mcp2221_probe(), the
first HID reports might be exchanged with the chip due to other drivers
probing for their devices on the just added I2C bus. HID I/O has to be
enabled explicitly during mcp2221_probe() to receive response reports.
In addition, the I2C bus' adapdata has to be set before any use of the bus,
otherwise mcp_{i2c,smbus}_xfer will attempt to dereference a NULL pointer.

Fixes: 67a95c21463d ("HID: mcp2221: add usb to i2c-smbus host bridge")
Signed-off-by: Karl Georg Esser <kgesser@vigem.de>
Signed-off-by: Sven Zühlsdorf <sven.zuehlsdorf@vigem.de>
---
  drivers/hid/hid-mcp2221.c | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 5886543b17f3..35b7d6939b38 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -324,6 +324,9 @@ static int mcp_i2c_xfer(struct i2c_adapter *adapter,
  	int ret;
  	struct mcp2221 *mcp = i2c_get_adapdata(adapter);

+	if(!mcp)
+		return -ECONNREFUSED;
+
  	hid_hw_power(mcp->hdev, PM_HINT_FULLON);

  	mutex_lock(&mcp->lock);
@@ -433,6 +436,9 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
  	int ret;
  	struct mcp2221 *mcp = i2c_get_adapdata(adapter);

+	if(!mcp)
+		return -ECONNREFUSED;
+
  	hid_hw_power(mcp->hdev, PM_HINT_FULLON);

  	mutex_lock(&mcp->lock);
@@ -1148,12 +1154,14 @@ static int mcp2221_probe(struct hid_device *hdev,
  			"MCP2221 usb-i2c bridge on hidraw%d",
  			((struct hidraw *)hdev->hidraw)->minor);

+	i2c_set_adapdata(&mcp->adapter, mcp);
+	hid_device_io_start(hdev);
+
  	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
  	if (ret) {
  		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
  		return ret;
  	}
-	i2c_set_adapdata(&mcp->adapter, mcp);

  #if IS_REACHABLE(CONFIG_GPIOLIB)
  	/* Setup GPIO chip */
-- 
2.38.1

--8323329-164564908-1670940298=:103531--
