Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5287D7683
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 23:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjJYVUf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 17:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjJYVUb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 17:20:31 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72488137
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 14:20:28 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A59612C018E;
        Thu, 26 Oct 2023 10:20:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698268825;
        bh=Oyep/E5GiktCQRcG5NVa0QX+QRv8E54K2LOUBcMGVAA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:Reply-To:From;
        b=iwE3EDxVkwYgL/2RJUq0c9ZiKUTbmPUzJzibs/oQjiIn2DxGm3p80uVCp+lWFJFuS
         FGbZh/hbKUyIzs0aVVyAy1LzbF7tnDbummXjkRLAvTPrtknd5bT9aZ6+FNihePEnOH
         Qc9f6oBy1bQ+zzu/eFrPebe+G2Gx1ZFohOLabG4/vX0BYOSF9UZfZdes+Txwy2ds8N
         Dg5vWu5mDCOcZBeR9cAxQ1G6jdR1MG0xdFrNeZ8NvY+0htVQqWTm+fvgeYxZLJVz3l
         TlbSXz8f7RS73oWvtnTX8btgpZoatYZAWblTzCIlNFSuaMNcugmSK5A9IYUdsN9kcR
         38oie+5/pdmeQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653986990000>; Thu, 26 Oct 2023 10:20:25 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 26 Oct 2023 10:20:25 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Thu, 26 Oct 2023 10:20:25 +1300
From:   Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To:     Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Thread-Topic: [PATCH] i2c:octeon:Add block-mode r/w
Thread-Index: AQHZr5q3r2c2MLptDkmOgF4YLLXmVq/KZ7iAgCKcq4CAG5lIAIACRR2AgAC6nQCAK37rAIAjvLCA
Date:   Wed, 25 Oct 2023 21:20:25 +0000
Message-ID: <c4ad50cea20cb083a35eefc91d12c32c4849d7dd.camel@alliedtelesis.co.nz>
References: <20230903123446.vjgpplnogejbzneb@zenone.zhora.eu>
         <20230904231439.485925-1-aryan.srivastava@alliedtelesis.co.nz>
         <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
         <9882daa4945914886b21642837816c2d99c027ac.camel@alliedtelesis.co.nz>
In-Reply-To: <9882daa4945914886b21642837816c2d99c027ac.camel@alliedtelesis.co.nz>
Reply-To: "20230912011633.2401616-1-aryan.srivastava@alliedtelesis.co.nz" 
          <20230912011633.2401616-1-aryan.srivastava@alliedtelesis.co.nz>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.26]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D289340F6978F4FB3C953BC3F7843E7@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=JMFsQdWQCw4A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=W1-Ysb4atzn0RGZzD8UA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5kaSwNCg0KRGlkIHlvdSBoYXZlIGFueSBtb3JlIGNvbW1lbnRzIG9uIG15IHBhdGNoPw0K
DQpUaGFuayB5b3UsDQpBcnlhbi4NCg==
