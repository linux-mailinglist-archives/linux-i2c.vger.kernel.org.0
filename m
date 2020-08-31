Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8578D2571B9
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 03:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgHaB4i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 21:56:38 -0400
Received: from mail-eopbgr60111.outbound.protection.outlook.com ([40.107.6.111]:41218
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726525AbgHaB4c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Aug 2020 21:56:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A14Ih+GBtu9yfpRafVKoWLGFh0R86ZXoALLqU+QUfkJ92FGAIf4p0/eOAdtK9/RYvPkjwXxOpAwTIgdCDOBn4QHampkss1DMpIXdiuegDMqkTgKPK0e55vkB2dhmQ8Yh/KMmu9Q4osdhKAkW0JAVQJSFHmTzGgRfPMqok6r0pthGoOUigXt6tLIWMqvo/oSoBg8EHzecyO81AFV1VVkVm0pZ/ghhvnF5jXmNjDa3ux9DQfGzfzpsbAs14rivwYr6mMrKvqTF8HuYxabOueohsdsn9Nz1bmYFvINM2nk4RdQt+O6iOLy7xlUcFcApAgknxgjdcDjpiaeKrKpAKB6w3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj+4CzBQlEEC5JZw+s9n4i7z53k3L9dwXNwQNpYytbY=;
 b=TAEcaIlMAqDBG9Lt4Chud02qGGj4Bymf4YAl+8sJpzzg90YJE54OuPMVob1wKn8mqHRpRvFHXzuZXs0Z8URTrpZREvjqJL0ErufCxlLTvDQq/xVfW9XPheniKJJOTz68P4GF8fDGOjNqstqJhNzDmN9QpnHYPxAQlyfI/96bMVDx9VNKq8CjObkZwmWC+/I29IxtfaSPerCSbK3uFI7LN38q0Db7Ws0jCnFdJJZ+uQmX6hkEGZ6VlV3UwsPmZmn7xHyGumS0AXnvnFLemqw3plw0jJXH7GvoJ+dWtEyz7O3g2ggWGmz+SzDavLNydDHx51wG6U6ALY8YnRiFJ0tEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj+4CzBQlEEC5JZw+s9n4i7z53k3L9dwXNwQNpYytbY=;
 b=y4EMhONmoSY6L52+ilPY4vhrmhMPqlk6E8Zmbl4LzlU6viALjXG1CoKaCJnd+N8LiEWPh+EH6C/oVhZxW5sen805BPn/v1XK1MOktXraNsp4eVom9c6oASXgsu3s2YKksO7SER9B3Ft75QSbuCq9WXAeZVu82g6mm/2aaCfnE50=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0364.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:62::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Mon, 31 Aug 2020 01:56:08 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 01:56:08 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH v3 3/3] misc: eeprom: at24: register nvmem only after eeprom is ready to use
Date:   Mon, 31 Aug 2020 04:55:39 +0300
Message-Id: <20200831015539.26811-4-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831015539.26811-1-vadym.kochan@plvision.eu>
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM5PR0201CA0022.eurprd02.prod.outlook.com (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 31 Aug 2020 01:56:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91fb548b-d050-4e2d-50f3-08d84d510733
X-MS-TrafficTypeDiagnostic: HE1P190MB0364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0364692D21EF8D7B8DD8F88F95510@HE1P190MB0364.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdxeV35EGJ7F9hNqbae7txJ4sf/rdZRuSu4E2Bxglu01XQaSPnz94S2UaUb4hympQRbkaF+P3/fAXDtamoQzsGITjSK2mowxY0L+0PUvoDS6P/kOvtPeRFAX+aKEi88BYZfsfNA0rEnZqkcqmHitH+0FCVu4BXK0YxHg/I+ED5k9iHVA+y/BoE0QwSvy9XYHMZLYaheHzrIA6rmZ9D5IQWQ93A1TkaU/yVu3ExepZR6WYk6hcQZCWH7OLNgFFbrLdw8UKlceOzCpL56b9HDofe2Ao5kEEn9P7APADKUVTbmUlJb6ZhZrZDHbLcQENog/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(39830400003)(366004)(396003)(346002)(36756003)(478600001)(6486002)(5660300002)(316002)(2906002)(110136005)(8936002)(8676002)(6512007)(6666004)(66476007)(1076003)(66556008)(44832011)(66946007)(107886003)(2616005)(956004)(26005)(86362001)(4326008)(6506007)(83380400001)(16526019)(186003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: bOYMSZBUAIt/qZPbOC8YfmOQYchkeobtJsZskKbtmNNrg5oixnS0wx0mXupy67AP6AcJUlQprqFEZbQAQnfgg3cCzK8C6/PG9DUhCGSrjk8iY9ca1CmMkHtDz+hlppW/J5NNzkq2pxF6RKrN+yz1ccfQYqzglRqCE77fWKlQqOd92bm9UmkiQjNsy0irSPZCFFJLvSkJGLcQ8i0sBs4NQ7GBXmB47wBL2fkbbVGjl0eRAs/6q1zIoS1W9PCNYs5yCsvaC5Y+g7vJoBxPp1iPs2hhF6doq6LKg3wE+GoucDXnfVt8HXdIu441S/Gd0eyv7sbQNzkFclV9OM6hBmL+4zbbW3nuvwm7o7kA3owxEJhB3SekO6LsRnirZZ2VCBIAlZaHBwPy5t/J6hZmKWbmfoIj9cU/Gesl+MH7admrQOVccIMPYVIYQrpNC/ehH+wdU7cgm07LK9LdZ5RKmOdqiAgyUEfUqn7p5oTtgb3sNFudSDEHy1XMZOp3PJUmEOwAPHNKFh9p89XIfSQiL3gpt/be9tVTHH2eG9lk7I7j6R687EVNamS2bGlw+L62ZHU8hwWp/GzoD2koaGdzwJBALLgxTsHQk/dfg4EhjJLZLv6NdwFHSwa5w0P5Vs4ph3NZeXgrl+9pae8TjckxL8srqA==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fb548b-d050-4e2d-50f3-08d84d510733
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 01:56:08.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aekus+6g10rRh+Xqwpx+cQzP+ER6ikDhlVUU0GQnalvBdal8i0fB8JsXZC8nc3+MPFD6OVcg4MGFd4tMdjVsBTcUtyNIjMfgLpeMEaT0JbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0364
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During nvmem_register() the nvmem core sends notifications when:

    - cell added
    - nvmem added

and during these notifications some callback func may access the nvmem
device, which will fail in case of at24 eeprom because regulator and pm
are enabled after nvmem_register().

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
v3:
    1) at24 driver enables regulator and pm state machine after nvmem
       registration which does not allow to use it on handing NVMEM_PRE_ADD event.

 drivers/misc/eeprom/at24.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 2591c21b2b5d..26a23abc053d 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -692,10 +692,6 @@ static int at24_probe(struct i2c_client *client)
 	nvmem_config.word_size = 1;
 	nvmem_config.size = byte_len;
 
-	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
-	if (IS_ERR(at24->nvmem))
-		return PTR_ERR(at24->nvmem);
-
 	i2c_set_clientdata(client, at24);
 
 	err = regulator_enable(at24->vcc_reg);
@@ -708,6 +704,13 @@ static int at24_probe(struct i2c_client *client)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
+	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
+	if (IS_ERR(at24->nvmem)) {
+		pm_runtime_disable(dev);
+		regulator_disable(at24->vcc_reg);
+		return PTR_ERR(at24->nvmem);
+	}
+
 	/*
 	 * Perform a one-byte test read to verify that the
 	 * chip is functional.
-- 
2.17.1

