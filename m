Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5BF76D87C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 22:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbjHBUSA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 16:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjHBURu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 16:17:50 -0400
X-Greylist: delayed 411 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 13:17:49 PDT
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net [188.165.48.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A82FF
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 13:17:49 -0700 (PDT)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.156.73])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id 52D4E26A89
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 20:10:56 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6cqtb (unknown [10.110.115.108])
        by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5B7181FE0E;
        Wed,  2 Aug 2023 20:10:55 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
        by ghost-submission-6684bf9d7b-6cqtb with ESMTPSA
        id 90vKEk+4ymQGJQAAgyrAAA
        (envelope-from <andi@etezian.org>); Wed, 02 Aug 2023 20:10:55 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S0042ae43894-5d53-42a1-98e0-905b92e0f2bc,
                    0C641BB37B7CC30D107EA61C426C60CA54BC1A77) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com
Cc:     Andi Shyti <andi.shyti@kernel.org>, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: imx-lpi2c: directly return ISR when detect a NACK
Date:   Wed,  2 Aug 2023 22:10:31 +0200
Message-Id: <169100562766.1919254.12222013232053766298.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727030347.3552992-1-carlos.song@nxp.com>
References: <20230727030347.3552992-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13281115305390246619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeevveeiffeifefgfeduvdetleffuefhleffjeetjeduvdevkeevhedvjeegfeetveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeekrddvfeekrddujedvrdehuddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Thu, 27 Jul 2023 11:03:47 +0800, carlos.song@nxp.com wrote:
> A NACK flag in ISR means i2c bus error. In such condition,
> there is no need to do read/write operation.
> 
> In this patch, i2c will check MSR_NDF, MSR_RDF and MSR_TDF
> flag in turn, it's making mutually exclusive NACK/read/write.
> So when a NACK is received(MSR_NDF), i2c will return ISR
> directly and then stop i2c transfer.
> 
> [...]

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: imx-lpi2c: directly return ISR when detect a NACK
      commit: 7525bcc34ec49a39e8b56f5911431a5a2a981896
