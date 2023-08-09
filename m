Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C322B776A94
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 23:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjHIVAR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 17:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHIVAQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 17:00:16 -0400
X-Greylist: delayed 602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Aug 2023 14:00:13 PDT
Received: from 15.mo581.mail-out.ovh.net (15.mo581.mail-out.ovh.net [87.98.180.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBEB1BD9
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 14:00:13 -0700 (PDT)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.20.39])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id E322624336
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 20:43:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9nm6h (unknown [10.108.20.192])
        by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5501B1FD65;
        Wed,  9 Aug 2023 20:43:08 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
        by ghost-submission-6684bf9d7b-9nm6h with ESMTPSA
        id fstoEVz602Q6FgYAlTzvkQ
        (envelope-from <andi@etezian.org>); Wed, 09 Aug 2023 20:43:08 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S001ab23070c-6d57-43d8-be17-b7c8d9d8f049,
                    42D28A1F878736B160C31855C4B99FC95B43FFDD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        Yicong Yang <yangyicong@huawei.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, yangyicong@hisilicon.com,
        f.fangjian@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's transfer
Date:   Wed,  9 Aug 2023 22:43:00 +0200
Message-Id: <169161372323.1170957.8776252018393427661.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801124625.63587-1-yangyicong@huawei.com>
References: <20230801124625.63587-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18040575686407424668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrleeggdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeevveeiffeifefgfeduvdetleffuefhleffjeetjeduvdevkeevhedvjeegfeetveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeekrddvfeekrddujedvrdehuddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Tue, 01 Aug 2023 20:46:25 +0800, Yicong Yang wrote:
> The controller may be shared with other port, for example the firmware.
> Handle the interrupt from other sources will cause crash since some
> data are not initialized. So only handle the interrupt of the driver's
> transfer and discard others.
> 
> 

With the Fixes tag added, applied to i2c/andi-for-current on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: hisi: Only handle the interrupt of the driver's transfer
      commit: 9a5adaf694f5ae8ba8f8e6178d01b5950fc7222a
