Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F99A26CBD1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 22:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgIPUfV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 16:35:21 -0400
Received: from mail-am6eur05on2102.outbound.protection.outlook.com ([40.107.22.102]:51808
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726855AbgIPRKw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYeUeK0CMBCaXpjOGUCfFgnE4eybdksFIlxFG0hCfL5axGHUUHiRCLPYV739SFzaeFQ6YwH2wc33s36vRYA6KWtc7lhLqjK+1sud2aOXCs/ukKpPUTOWVxilv3lynfeMw/mP7c9hQharUZOUzg+Un9pUoXcA1yqvd+C2nbyZRzMtnpNG1nBW5HnVMMfsDKPMpzpd1ZMJxY79LxdGPREJCDkcBEuVnVkgkMaof4Zl3MnmPFNZxnFNAjclrS4ZJbOXMujXCXXfgYKEKfB1LcQZuNVlze3/6g4A0kTnjDc/rUGWeqUCyysb7lSYOuJj9qGmDlwtd+tRwlNY4oPTLDXPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+U3YsbTLCDgRA03fWoWHG94a7lbpGeioW5c+r78u7c=;
 b=Y3Z3C8bVOanTa8j83c548zdioe1St7RMbnIqaIXd+gis3gPZYqjQYNCcTOdWyFI4MgB4s/IQr7b+ehfXtQL2y0KksVTmBJjdhDgHnRxx13BQPHigPGGlSk8Nw6uLfT1dGRiiwCXzpprdINQFXtgvSoTo+xGpm/ho0by5EGL33cP371fbGzARdu9ktyaAkf3copGWUGqnzWUhnzd5WJqvkidAvCG6hT9pL2wXP79jWV+4fTi7Bi7GATW/8rxI/49dJuV0WihELgVD1GbUgJHN1Z1mjx2c/lR5us6s61c+JswN/gWgdp7SRIy9r1yTwEiLXFakI1w9VV6COliSn0z8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+U3YsbTLCDgRA03fWoWHG94a7lbpGeioW5c+r78u7c=;
 b=lywbWPev5P7OFXMb+KKssWklWPtf4EqXRr1eppWEanjiVc42ulDexWhDxQAm2X3gstOmax7vFoh4rfiR78VlGvDjol5tfBcBIFXhsNhwkZgeOdEV3s1Jco/ra+/230gsqZcGk49MTEEDKBjz2Qp7GXcm6jpE3ts58s9U0KkrONA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Wed, 16 Sep 2020 17:10:02 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe%6]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 17:10:02 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH 0/3] misc: eeprom: set type id as EEPROM for nvmem devices
Date:   Wed, 16 Sep 2020 20:09:30 +0300
Message-Id: <20200916170933.20302-1-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::29) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 17:10:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 003b372c-f86a-47ef-043d-08d85a635989
X-MS-TrafficTypeDiagnostic: HE1P190MB0026:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0026AF568E53207E8E1E72F295210@HE1P190MB0026.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxz42brIKKRpCmdf+ALtjHKJJc9vM+wcC4qov8R0ddiZEeCYGkmD2c+qN25Mu15ClKsw4biHzHMMUmhVxWQpPaf61lkIPhmNjtbq0hpVAVB5ZVAGvZl1SUFClefv3RaeZY6+MrP+Uc7XxTt1ha4MAV/BkpMThPXlo+LP580l/Vn7AVF8MkAI4wCIcFuQmLB5+Yoo5HxIUGcBeneLbSlCcTrYSevFJSE7ABaUFatUmqIbhytiHY3HoVmcasSZ8K8TC2oI3mPAyDNPlrgHl9Bxv6Z7cEQ/bYwppKYz3ih0npYXYVXOwiZ/SLsvBhZ6HS/NDBwRBmGh32hbKMNtPQNGPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(366004)(376002)(136003)(346002)(86362001)(316002)(8936002)(6666004)(52116002)(16526019)(8676002)(186003)(6512007)(2906002)(4744005)(1076003)(36756003)(5660300002)(26005)(66946007)(110136005)(44832011)(6506007)(4326008)(107886003)(956004)(66556008)(6486002)(66476007)(478600001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: nB2AfeudQV1rBoKCF49fH1xsYQe1+zpVS3gWHq1/li83eTGOiGG3KXvWTdcE68S3lrDcZytQtUfJLAuB5r8BEIGvoAJs7q3h4C6FsVFuPkoUBDS0Gd+4sJfVqv0pIFjiG3ZYgPkZTkJVTVJIVGzgVBh+TbGN9/K4xtrrsB2xpzwB7OxNs0aMF477nrrqATbtO1CZSehwVCWQNWDPIjFVe0AoVCAP4HaFtlUhjw3vk/q3d6pXBhnzJJ//2hY8ZpjHaj+Ear6P5Y0dTNxv5pPxQdXG71PCmjfZonF8KBNAp9PU5TR4Oxl8XfmpCEONG3g+E540DGT3K4+yF3c5nQvxzCjnPPeslCui/92pydiCH/khoBnT7oX4RifpWIJjqRWmss9UrB1MovM1xXW9NSmeb3x9/7oMeTHwdJCGQ4k488t0sOXkF1T6mxumnOsKR9zU7JuKWvixNJeyTO9e4/eKJ8+QdID1SeJmvwcCNQjqcoCY5upB1r+dlG28vZNWJEYTjhd3EhyMtOCsNpKVETuEqZxrnerPk4XzQ0D55qST48lxI6XGWx248QqUO3Dfo/6eqOGkjztSkGKrDpdDT8PXHYS3lYbEf4bQM6liQnfIPAyzrzo+bcRYxqEBm+m9hwiIrCSrygU1oAr5AU1scVU+Ow==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 003b372c-f86a-47ef-043d-08d85a635989
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 17:10:02.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iak30tJy3etXUwvlvrXroy5QQkatrsLW7CTUBgjE6ylqP/8SG0wAnVC5iheVyiSjd3qXR1vRxMhBdCPi0H/Neb+GXq7xMpsZLEDh8N+kn+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0026
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set type as NVMEM_TYPE_EEPROM to expose this info via
sysfs:

$ cat /sys/bus/nvmem/devices/0-00560/type
EEPROM

Tested only with at24 device.

Vadym Kochan (3):
  eeprom: at24: set type id as EEPROM
  eeprom: at25: set type id as EEPROM
  eeprom: 93xx46: set type id as EEPROM

 drivers/misc/eeprom/at24.c          | 1 +
 drivers/misc/eeprom/at25.c          | 1 +
 drivers/misc/eeprom/eeprom_93xx46.c | 1 +
 3 files changed, 3 insertions(+)

-- 
2.17.1

