Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F200777663
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 13:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjHJLBL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 07:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjHJLBL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 07:01:11 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545EC92
        for <linux-i2c@vger.kernel.org>; Thu, 10 Aug 2023 04:01:10 -0700 (PDT)
X-ASG-Debug-ID: 1691665266-086e23186a151d0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id OdtRIB8A9mNqz3kB (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 10 Aug 2023 19:01:06 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 10 Aug
 2023 19:01:06 +0800
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 10 Aug
 2023 19:01:05 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com ([fe80::c1b1:4488:5c9c:c794]) by
 ZXBJMBX03.zhaoxin.com ([fe80::c1b1:4488:5c9c:c794%4]) with mapi id
 15.01.2507.016; Thu, 10 Aug 2023 19:01:05 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
From:   HansHu-oc <HansHu-oc@zhaoxin.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "Cobe Chen(BJ-RD)" <CobeChen@zhaoxin.com>
Subject: =?gb2312?B?s7e72DogW1JGQ10gaTJjOiB3aGV0aGVyIG5lZWQgY3JlYXRlICotY29tbW9u?=
 =?gb2312?Q?.{c,h}_for_i801_piix4_viapro_driver?=
Thread-Topic: [RFC] i2c: whether need create *-common.{c,h} for i801 piix4
 viapro driver
X-ASG-Orig-Subj: =?gb2312?B?s7e72DogW1JGQ10gaTJjOiB3aGV0aGVyIG5lZWQgY3JlYXRlICotY29tbW9u?=
 =?gb2312?Q?.{c,h}_for_i801_piix4_viapro_driver?=
Thread-Index: AQHZy3n1YAh0qyXkikGResNSKH/jhA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date:   Thu, 10 Aug 2023 11:01:05 +0000
Message-ID: <53911957c26b45d8a38078c11a0fbe36@zhaoxin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.28.120.54]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1691665266
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 100
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.00
X-Barracuda-Spam-Status: No, SCORE=-2.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=THREAD_INDEX, THREAD_TOPIC
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.112549
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.01 THREAD_INDEX           thread-index: AcO7Y8iR61tzADqsRmmc5wNiFHEOig==
        0.01 THREAD_TOPIC           Thread-Topic: ...(Japanese Subject)...
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGFuc0h1LW9jIL2rs7e72NPKvP6hsFtSRkNdIGkyYzogd2hldGhlciBuZWVkIGNyZWF0ZSAqLWNv
bW1vbi57YyxofSBmb3IgaTgwMSBwaWl4NCB2aWFwcm8gZHJpdmVyobGhow==
