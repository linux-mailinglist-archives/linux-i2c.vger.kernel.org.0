Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24AC74CC108
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 16:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbiCCPUU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 3 Mar 2022 10:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234286AbiCCPUT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 10:20:19 -0500
Received: from mail.irisgmbh.de (mail.irisgmbh.de [81.169.172.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC4B191429
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 07:19:32 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by mail.irisgmbh.de (Postfix) with ESMTP id 7F88B31E0368
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 16:19:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at irisgmbh.de
Received: from mail.irisgmbh.de ([127.0.0.1])
        by localhost (s15324379.rootmaster.info [127.0.0.1]) (amavisd-new, port 10027)
        with ESMTP for <linux-i2c@vger.kernel.org>;
        Thu,  3 Mar 2022 16:19:01 +0100 (CET)
Received: from ERDE.irisgmbh.local (unknown [213.61.209.158])
        by mail.irisgmbh.de (Postfix) with ESMTPS id 692C231E0365
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 16:19:01 +0100 (CET)
Received: from ERDE.irisgmbh.local ([172.30.10.11]) by ERDE.irisgmbh.local
 ([172.30.10.11]) with mapi id 14.03.0513.000; Thu, 3 Mar 2022 16:19:01 +0100
From:   Ian Dannapel <Ian.Dannapel@iris-sensing.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: i2c-imx.c: Unnecessary delay slowing down i2c communication
Thread-Topic: i2c-imx.c: Unnecessary delay slowing down i2c communication
Thread-Index: AdgvBUmpZZWYjd95QeeF9X7DSq2tRAADGcLQ
Date:   Thu, 3 Mar 2022 15:19:00 +0000
Message-ID: <D783F898DE87F646B39A5F514F7A514C672F0E@ERDE.irisgmbh.local>
References: <D783F898DE87F646B39A5F514F7A514C672EC8@ERDE.irisgmbh.local>
In-Reply-To: <D783F898DE87F646B39A5F514F7A514C672EC8@ERDE.irisgmbh.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.10.1]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello I≤C Driver Maintainers,

please excuse me if I am not following the right steps to report a question. I did not find consensus between all instructions that I read.

We noted that on the IMX i2c driver, at the i2c_imx_start funtion, some sleep/delay was introduced without any apparent reason:
Line 448 at:  https://github.com/Freescale/linux-fslc/commit/3a5ee18d2a32bda6b9a1260136f6805848e3839d 
Line 528 at:  https://github.com/Freescale/linux-fslc/commit/2b899f34e1db9adef8716d07e872a800dfa60790
Line 200 at:  https://github.com/Freescale/linux-fslc/commit/43309f3b521302bb66c4c9e66704dd3675e4d725

This sleep causes a pretty big latency overhead on I≤C writes and no IMX8MP document states the need of this delay on the controller. NXP Support also informed that this delay might not be needed.
Some early tests with removing this delay completely showed a great reduction on the write latency and no problems with the communication.

But since we want a stable and fast communication, I ask here again if someone knows the reason or the need for this delay when starting to communicate on the I2C bus.

I appreciate any response and if further information is needed, I can gladly report it.


Best regards,
Ian Dannapel
ian.dannapel@iris-sensing.com
ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï ï
iris-GmbH
infrared & intelligent sensors
Schnellerstraﬂe 1-5 | 12439 Berlin
www.iris-sensing.com





